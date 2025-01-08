using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppBitirmeP
{
    public partial class Favorilerim : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["KullaniciAdi"] != null)
                {
                    GetUserName();
                    GetProductsAndPrices();
                    FavoriUrunleriGetir();


                }
                else
                {

                    // Kullanıcı giriş yapmamışsa uyarı ver ve yönlendir
                    Response.Write("<script>alert('Lütfen giriş yapınız.');</script>");

                }
                //GetUserName();
                //GetProductsAndPrices();
                //FavoriUrunleriGetir();

            }
        }


        private void GetProductsAndPrices()
        {
            // Giriş yapmış kullanıcıların adlarını almak için gereken sorgu
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Tüm kullanıcı adlarını almak için sorgu
                SqlCommand cmd = new SqlCommand("SELECT UrunAdi, Fiyat FROM Urun;", conn);

                SqlDataReader dr = cmd.ExecuteReader();
                int index = 1; // Dinamik label sırası için sayaç

                while (dr.Read()) // Kullanıcı adı varsa
                {
                    // Kullanıcı adını al
                    string UrunAdi = dr["UrunAdi"].ToString();
                    string Fiyat = dr["Fiyat"].ToString();
                    // Dinamik label isimlerini oluştur
                    string productNameLabelId = $"lblProductName{index}";
                    string priceLabelId = $"lblPrice{index}";

                    // Dinamik label'ları bul ve değerleri ata
                    Label lblProductName = (Label)FindControl(productNameLabelId);
                    Label lblPrice = (Label)FindControl(priceLabelId);

                    if (lblProductName != null)
                    {
                        lblProductName.Text = UrunAdi; // Ürün adını label'a ata
                        lblProductName.Visible = true; // Label'ı görünür yap
                    }

                    if (lblPrice != null)
                    {
                        lblPrice.Text = Fiyat; // Fiyatı label'a ata
                        lblPrice.Visible = true; // Label'ı görünür yap
                    }

                    index++; // Sonraki ürün için sayaç
                }

                dr.Close(); // DataReader'ı kapat
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
        private void FavoriUrunleriGetir()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Kullanıcı adı kontrolü
                if (Session["KullaniciAdi"] != null)
                {
                    lblKullaniciAdi.Text = Session["KullaniciAdi"].ToString();

                    // Favori ürünleri getirmek için SQL sorgusu
                    SqlCommand cmd = new SqlCommand("SELECT FavoriUrunAdi, FavoriUrunFiyati, FavResimPATH, FavoriUrunID FROM FavoriUrunlerr WHERE FavKulAdi = @kulAdi", conn);
                    cmd.Parameters.AddWithValue("@kulAdi", lblKullaniciAdi.Text);

                    SqlDataReader dr = cmd.ExecuteReader();

                    // Repeater'a verileri bağlama
                    Repeater1.DataSource = dr;
                    Repeater1.DataBind();

                    dr.Close();
                }
                else
                {
                    lblKullaniciAdi.Text = "Kullanıcı adı bulunamadı.";
                }
            }
        }


        // Ürün detay butonu tıklama olayı
        protected void ProductDetail_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string urunID = btn.CommandArgument;

            // Ürün detay sayfasına yönlendirme (ürün ID ile)
            Response.Redirect("Detaylar.aspx?UrunID=" + urunID);
        }



        // Sepete ekleme işlemi
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string urunID = btn.CommandArgument;

        }

        // Favorilere ekleme işlemi
        protected void AddToFavorites_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string urunID = btn.CommandArgument;

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // İçerik burada olacak
        }

        protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            // İçerik burada olacak
        }



        protected void btnSend_Click(object sender, EventArgs e)
        {

        }


        protected void FavoriEkle(int urunID, int kullaniciID)
        {
           
        }

      


        protected void rptFavorites_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}