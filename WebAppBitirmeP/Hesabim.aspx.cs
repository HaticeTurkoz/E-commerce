using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebAppBitirmeP
{
    public partial class Hesabim : System.Web.UI.Page
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

        protected void btnSend_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdresGuncelle_Click(object sender, EventArgs e)
        {

        }

        protected void btnHesapGuncelle_Click(object sender, EventArgs e)
        {

        }
    }
}