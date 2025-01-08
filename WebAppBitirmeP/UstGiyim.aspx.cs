using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppBitirmeP
{
    public partial class UstGiyim : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kullanıcı adı kontrolü
            string kullaniciAdi = Session["kullaniciAdi"] as string; // Session üzerinden kullanıcı adı alınır
            if (!string.IsNullOrEmpty(kullaniciAdi))
            {
                GetUserName();
                // Ürün bilgilerini veritabanından çek
                GetProductsAndPrices();
            }
            else
            {
                // Kullanıcı adı null veya boş ise ürünleri göstermeyebiliriz veya hata mesajı gösterebiliriz
                ///  Response.Write("<script>alert('Lütfen giriş yapınız.');</script>");
                //Response.Redirect("anasayfa.aspx");
                // Kullanıcı adı null veya boş ise uyarı mesajı ve yönlendirme yapılır
                string script = "<script>alert('Lütfen giriş yapınız.'); window.location='anasayfa.aspx';</script>";
                Response.Write(script);
                Response.End(); // İşlemi sonlandır
            }
        }
       
        private void GetUserName()
        {
            // Giriş yapmış kullanıcının adını almak için gereken sorgu
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Giriş yapan kullanıcıyı belirlemek için uygun bir sorgu
                SqlCommand cmd = new SqlCommand("SELECT kullaniciAdi FROM Kullanicilar WHERE kullaniciAdi = @kul", conn);
                // Kullanıcı adını almak için gereken parametre
                cmd.Parameters.Add("@kul", SqlDbType.NVarChar, 50).Value = Session["KullaniciAdi"];

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read()) // Kullanıcı adı varsa
                {
                    lblKullaniciAdi.Text = dr["kullaniciAdi"].ToString(); // Label'a kullanıcı adını ata
                    lblKullaniciAdi.Visible = true; // Label'ı görünür yap
                }
                else
                {
                    lblKullaniciAdi.Visible = false; // Kullanıcı adı yoksa gizle
                }
                dr.Close();
            }
        }
        private void GetProductsAndPrices()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Ürün bilgilerini almak için SQL sorgusu
                SqlCommand cmd = new SqlCommand("SELECT TUrunID, TUrunAdi, TUrunFiyati, TResimPATH, TUrunKategori FROM TumUrunler where TUrunKategori=1", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Verileri Repeater'a bağla
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
        
        
        
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            // Sepete ekleme işlemi burada yapılacak
            Button btn = (Button)sender;
            int urunID = Convert.ToInt32(btn.CommandArgument);

            // Sepete ekleme kodları burada
            // Örneğin: Sepet veritabanına veya oturum (session) verisine eklenecek.
        }

        protected void AddToFavorites_Click(object sender, EventArgs e)
        {

            // Tıklanan butonu al
            LinkButton btn = (LinkButton)sender;

            // CommandArgument ile ürünün ID'sini al
            string urunID = btn.CommandArgument;

            // Ürün bilgilerini almak için Repeater'dan ilgili ürünün bilgilerini almak
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string urunAdi = ((Label)item.FindControl("lblProductName")).Text;
            string resimPATH = ((Literal)item.FindControl("litProductImage")).Text.Split('"')[1]; // HTML <img> tagından resim yolunu alıyoruz
            decimal fiyat = Convert.ToDecimal(((Label)item.FindControl("lblPrice")).Text.Replace("₺", "").Trim());

            string connectionString = "Data Source=.;Initial Catalog=e_commerce;Integrated Security=True;MultipleActiveResultSets=True;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Kullanıcının favori ürünlerini sorgulama
                SqlCommand cmd = new SqlCommand("SELECT * FROM TumUrunler WHERE TUrunID = @urunID", conn);
                cmd.Parameters.Add(new SqlParameter("@urunID", SqlDbType.Int) { Value = urunID });

                try
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Ürün bilgilerini al
                            int UrunID = reader.GetInt32(reader.GetOrdinal("TUrunID"));
                            string UrunAdi = reader["TUrunAdi"].ToString();
                            decimal Fiyat = reader.GetDecimal(reader.GetOrdinal("TUrunFiyati"));
                            string ResimPATH = reader["TResimPATH"].ToString();

                            // DataReader kapandıktan sonra yeni bir SqlCommand oluştur
                            using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM FavoriUrunlerr WHERE FavKulAdi = @kulAdi AND FavoriUrunID = @urunID", conn))
                            {
                                checkCmd.Parameters.AddWithValue("@kulAdi", lblKullaniciAdi.Text); // Kullanıcı adı
                                checkCmd.Parameters.AddWithValue("@urunID", UrunID); // Ürün ID

                                int count = (int)checkCmd.ExecuteScalar(); // Bu ürün favorilerde var mı?

                                if (count == 0) // Eğer ürün daha önce favorilere eklenmemişse
                                {
                                    // Favorilere ürün ekle
                                    SqlCommand komut = new SqlCommand("INSERT INTO FavoriUrunlerr(FavKulAdi, FavoriUrunID, FavoriUrunFiyati, FavoriUrunAdi, FavResimPATH) VALUES (@fka, @fui, @fuf, @fua, @frp)", conn);
                                    komut.Parameters.Add("@fka", SqlDbType.NVarChar, 50).Value = lblKullaniciAdi.Text;
                                    komut.Parameters.Add("@fui", SqlDbType.Int).Value = UrunID;
                                    komut.Parameters.Add("@fuf", SqlDbType.Decimal, 10).Value = Fiyat;
                                    komut.Parameters.Add("@fua", SqlDbType.NVarChar, 100).Value = UrunAdi;
                                    komut.Parameters.Add("@frp", SqlDbType.NVarChar, 255).Value = ResimPATH;

                                    komut.ExecuteNonQuery(); // Ürünü favorilere ekle
                                    Response.Write("<script>alert('Ürün favorilere eklendi!');</script>");
                                }
                                else
                                {
                                    // Ürün zaten favorilerde
                                    Response.Write("<script>alert('Bu ürün zaten favorilerinizde mevcut.');</script>");
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Hata: Ürün bulunamadı.');</script>");
                        }
                    }
                }
                catch (SqlException ex)
                {
                    // Hata mesajını göster
                    Response.Write("<script>alert('Hata: " + ex.Message + "');</script>");
                }
            }
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void AddToCartBtn_Click(object sender, EventArgs e)
        {
            // Favorilere ekleme işlemi burada yapılacak
            Button btn = (Button)sender;
            int urunID = Convert.ToInt32(btn.CommandArgument);

            // Favorilere ekleme kodları burada
            // Örneğin: Favori veritabanına veya oturum (session) verisine eklenecek.
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    // Ürün sırasını elde edin
            //    int itemIndex = e.Item.ItemIndex + 1; // 0 tabanlı olduğu için +1 ekliyoruz

            //    // Her üç üründe bir yeni bir satır açmak için kontrol
            //    if (itemIndex % 3 == 1 && itemIndex != 1)
            //    {
            //        // İlk üründen sonra her 3 üründe bir önceki satırı kapatma etiketi ekleyin
            //        LiteralControl closeRow = new LiteralControl("</div><div class='row'>");
            //        e.Item.Controls.AddAt(0, closeRow);
            //    }
            //}
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int itemIndex = e.Item.ItemIndex + 1;

                if (itemIndex % 3 == 1 && itemIndex != 1)
                {
                    // Önceki satırı kapatıp yeni bir satır açar
                    LiteralControl closeRow = new LiteralControl("</div><div class='row'>");
                    e.Item.Controls.AddAt(0, closeRow);
                }
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                // Son satırda eksik ürün varsa boş sütunlar ekler
                int totalItems = ((Repeater)sender).Items.Count;
                int remainder = totalItems % 3;

                if (remainder > 0)
                {
                    int emptyColumns = 3 - remainder;
                    LiteralControl emptyDivs = new LiteralControl();

                    // Eksik sütun sayısına göre boş sütunları ekle
                    for (int i = 0; i < emptyColumns; i++)
                    {
                        emptyDivs.Text += "<div class='col-md-4'></div>";
                    }

                    e.Item.Controls.Add(emptyDivs);
                }
            }
        }

        protected void ProductDetail_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string urunID = btn.CommandArgument;
            Response.Redirect("Detaylar.aspx?urunID=" + urunID);
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}