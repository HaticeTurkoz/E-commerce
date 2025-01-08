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
    public partial class anasayfa : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //IsPostBack Kontrolü: Eğer sayfa ilk defa yükleniyorsa (bir form gönderimi gibi işlemden gelmiyorsa), GetProductsAndPrices metodu çağrılır.
            if (!IsPostBack)
            {
                // Kullanıcı adını veritabanından al
                GetProductsAndPrices();

            }

        }
        private void GetProductsAndPrices()
        {
            //using Bloğu:
            //SqlConnection nesnesi tanımlanır.
            //İşlem tamamlandığında bağlantı otomatik olarak kapatılır.
            // Giriş yapmış kullanıcıların adlarını almak için gereken sorgu
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Tüm kullanıcı adlarını almak için sorgu
                SqlCommand cmd = new SqlCommand("SELECT UrunAdi, Fiyat FROM Urun;", conn);

                SqlDataReader dr = cmd.ExecuteReader();//SqlDataReader:Veritabanından alınan satırları okur.
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
      

        protected void btnSend_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert(' Mail Gönderebilmek için lütfen Giriş Yapınız');</script>");

        }

        protected void btnProductLink9_Click(object sender, EventArgs e)
        {
            
        }

    }
}