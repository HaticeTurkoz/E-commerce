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
    public partial class KayitOl : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnVazgec_Click(object sender, EventArgs e)
        {
            Response.Redirect("anasayfa.aspx");

        }

        protected void BtnKayitOl_Click(object sender, EventArgs e)
        {

            // Öncelikle Validation kontrollerini kontrol et
            if (!Page.IsValid)
            {
                return; // Validation hataları varsa işlemi durdur
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Kullanıcı adı, mail ve telefonun benzersizliğini kontrol et
                SqlCommand kontrolCmd = new SqlCommand("SELECT COUNT(*) FROM Kullanicilar WHERE KullaniciAdi = @kuladi OR MailAdresi = @mail OR TelefonNo = @tel", conn);
                kontrolCmd.Parameters.AddWithValue("@kuladi", txtUserNameKayit.Text.Trim());
                kontrolCmd.Parameters.AddWithValue("@mail", txtMail.Text.Trim());
                kontrolCmd.Parameters.AddWithValue("@tel", txtTelNo.Text.Trim());

                int mevcutKayit = (int)kontrolCmd.ExecuteScalar();
                if (mevcutKayit > 0)
                {
                    Response.Write("<script>alert('Bu kullanıcı adı, telefon numarası veya e-posta zaten kullanılıyor.');</script>");
                    return;
                }

                // Şifreyi hashle
                string hashedPassword = Genel.HashPassword(txtPasswordKayit.Text.Trim(), "SHA256");

                // Yeni kullanıcı ekleme
                SqlCommand ekleCmd = new SqlCommand("INSERT INTO Kullanicilar (KullaniciAdi, Sifre, MailAdresi, TelefonNo, Yetki) VALUES (@kuladi, @sifre, @mail, @tel, @yetki)", conn);
                ekleCmd.Parameters.AddWithValue("@kuladi", txtUserNameKayit.Text.Trim());
                ekleCmd.Parameters.AddWithValue("@sifre", hashedPassword);
                ekleCmd.Parameters.AddWithValue("@mail", txtMail.Text.Trim());
                ekleCmd.Parameters.AddWithValue("@tel", txtTelNo.Text.Trim());
                ekleCmd.Parameters.AddWithValue("@yetki", 2); // Varsayılan yetki seviyesi: 0 (Normal kullanıcı)

                try
                {
                    ekleCmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Kayıt başarılı. Lütfen giriş yapınız.'); window.location='GirisForm.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Bir hata oluştu: " + ex.Message + "');</script>");
                }
            }



        }
    }
}