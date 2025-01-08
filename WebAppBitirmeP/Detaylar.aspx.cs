using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppBitirmeP
{
    public partial class Detaylar : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserName();

                if (Request.QueryString["urunID"] != null)//Sayfa URL'sinde bir urunID parametresi mevcut mu kontrol eder.
                {
                    int urunID = Convert.ToInt32(Request.QueryString["urunID"]);//QueryString'den alınan urunID değeri tam sayı formatına dönüştürülür
                    UrunDetaylariniGetir(urunID);
                }
            }

        }


        private void UrunDetaylariniGetir(int urunID)
        {
            string connectionString = "Data Source=.;Initial Catalog=e_commerce;Integrated Security=True;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT TUrunAdi, TUrunFiyati, TResimPATH, TUrunBilgisi,TUrunKategori FROM TumUrunler WHERE TUrunID = @urunID", conn);
                cmd.Parameters.AddWithValue("@urunID", urunID);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    LblUrunAdi.Text = reader["TUrunAdi"].ToString();
                    LblFiyat.Text = reader["TUrunFiyati"].ToString() + " TL";
                    LblUrunBilgisi.Text = reader["TUrunBilgisi"].ToString();
                    imgUrun.ImageUrl = reader["TResimPATH"].ToString(); // `imgUrun` yerine uygun img kontrolü
                    LblKategori.Text = reader["TUrunKategori"].ToString();

                }
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string beden;

            // Beden seçimi kontrolü
            if (RbSmall.Checked)
                beden = "S";
            else if (RbMedium.Checked)
                beden = "M";
            else if (RbLarge.Checked)
                beden = "L";
            else if (RbXLarge.Checked)
                beden = "XL";
            else
            {
                Response.Write("<script>alert('Lütfen beden seçiniz.');</script>");
                return;
            }

            string kullaniciAdi = lblKullaniciAdi.Text;

            // Kullanıcı giriş kontrolü
            if (string.IsNullOrEmpty(kullaniciAdi))
            {
                Response.Write("<script>alert('Lütfen giriş yapınız.');</script>");
                return;
            }

            string connectionString = "Data Source=.;Initial Catalog=e_commerce;Integrated Security=True;";


            //Veritabanına bağlantı kurmak için bir SqlConnection nesnesi oluşturulur ve açılır.
            //using bloğu, bağlantının işlemler tamamlandıktan sonra otomatik olarak kapanmasını sağlar.
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Ürün bilgileri
                int urunID = Convert.ToInt32(Request.QueryString["urunID"]);//Ürün ID'si: Query string'den alınır.
                                                                            //   Query String, bir URL'nin sonunda yer alan ve genellikle "?" işareti ile başlayan,
                                                                            //   web sayfasına veri göndermek veya parametreleri iletmek için kullanılan
                                                                            //   bir metin formatıdır. Query string, bir web uygulamasına
                                                                            //   veri aktarmak için yaygın olarak kullanılır.
                string urunAdi = LblUrunAdi.Text;//Ürün Adı, Fiyat ve Resim PATH: Formda gösterilen kontrollerden alınır.
                string fiyat = LblFiyat.Text.Replace(" TL", "").Trim();//Fiyat bilgisindeki "TL" ifadesi çıkarılır ve düzenlenir.
                string resimPATH = imgUrun.ImageUrl;




                // Ürün kategorisini al//Ürüne ait kategori bilgisi TumUrunler tablosundan sorgulanır.

                SqlCommand getKategoriCmd = new SqlCommand(
                    "SELECT TUrunKategori FROM TumUrunler WHERE TUrunID = @UrunID", conn);
                getKategoriCmd.Parameters.AddWithValue("@UrunID", urunID);

                object kategoriObj = getKategoriCmd.ExecuteScalar();

                if (kategoriObj == null)
                {
                    Response.Write("<script>alert('Ürün kategorisi bulunamadı.');</script>");
                    return;
                }

                int kategori = Convert.ToInt32(kategoriObj);

                // Sepette aynı ürün ve beden olup olmadığını kontrol et
                SqlCommand checkCartCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Sepet WHERE SepetKullanici = @KullaniciAdi AND SepetUrunID = @UrunID AND Beden = @Beden", conn);

                checkCartCmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                checkCartCmd.Parameters.AddWithValue("@UrunID", urunID);
                checkCartCmd.Parameters.AddWithValue("@Beden", beden);

                int existingProductCount = (int)checkCartCmd.ExecuteScalar();

                if (existingProductCount > 0)
                {
                    Response.Write("<script>alert('Bu ürün zaten sepette mevcut.');</script>");
                    return;
                }

                // Ürünü sepete ekle
                SqlCommand komut = new SqlCommand(
                    "INSERT INTO Sepet (SepetKullanici, SepetUrunID, SepetUrunAdi, SepetUrunFiyati, SepetResimPATH, Adet, Beden, kategori) " +
                    "VALUES (@SepetKullanici, @SepetUrunID, @SepetUrunAdi, @SepetUrunFiyati, @SepetResimPATH, @Adet, @Beden, @Kategori)", conn);

                komut.Parameters.AddWithValue("@SepetKullanici", kullaniciAdi);
                komut.Parameters.AddWithValue("@SepetUrunID", urunID);
                komut.Parameters.AddWithValue("@SepetUrunAdi", urunAdi);
                komut.Parameters.AddWithValue("@SepetUrunFiyati", Convert.ToDecimal(fiyat));
                komut.Parameters.AddWithValue("@SepetResimPATH", resimPATH);
                komut.Parameters.AddWithValue("@Adet", 1);
                komut.Parameters.AddWithValue("@Beden", beden);
                komut.Parameters.AddWithValue("@Kategori", kategori);

                try
                {
                    komut.ExecuteNonQuery();
                    Response.Write("<script>alert('Ürün sepete eklendi.');</script>");
                }
                catch (SqlException sqlEx)
                {
                    Response.Write("<script>alert('SQL Hatası: " + sqlEx.Message + "');</script>");
                }
            }
        }


        protected void btnLike_Click(object sender, EventArgs e)
        {

        }
    }
}