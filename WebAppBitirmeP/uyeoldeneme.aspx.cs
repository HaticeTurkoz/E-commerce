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
    public partial class uyeoldeneme : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnKayitOl_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                //1 - Kullanıcının veri tabanında olup olmadığı kontrol ediliyor
                SqlCommand cmdKontrol = new SqlCommand("select KullaniciAdi from Kullanicilar where KullaniciAdi=@kul", conn);
                cmdKontrol.Parameters.Add("@kul", SqlDbType.NVarChar, 50).Value = txtUserName.Text;
                SqlDataReader dr;
                dr = cmdKontrol.ExecuteReader();
                if (dr.HasRows) //Kullanıcı var

                {
                    Response.Write("<script type='text/javascript'>alert('Bu Kullanıcı var!');</script>");
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    txtUserName.Focus();
                    dr.Close();
                    conn.Close();
                    return;
                }
                else
                {
                    dr.Close();
                }
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                // Kullanıcıyı tabloya ekle
                cmd.CommandText = "INSERT INTO Kullanicilar (KullaniciAdi, Sifre) VALUES (@mail, @password)";

                // E-posta parametresi
                cmd.Parameters.Add(new SqlParameter("@mail", SqlDbType.NVarChar, 50)
                {
                    Value = txtUserName.Text // Kullanıcının girdiği e-posta
                });

                //Şifreyi hash'le
                string hashedPassword = Genel.HashPassword(txtPassword.Text, "SHA256"); // SHA-256 kullanarak hash'le

                // Hashlenmiş şifre parametresi
                cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 255)
                {
                    Value = hashedPassword// Hashlenmiş şifre
                });

                try
                {
                    // Kullanıcıyı tabloya ekle
                    cmd.ExecuteNonQuery();
                    // Response.Write("<script>alert('Kayıt başarılı'');</'script>");
                    Response.Write("<script type='text/javascript'>alert('Kayıt başarılı.Kullanıcı girişinden giriş yaparak işlemlerinizi başlatabilirsiniz..!'); window.location='AnaSayfa.aspx';</script>");
                }
                catch (SqlException ex)
                {
                    // Hata mesajını göster
                    Response.Write("<script>alert('Hata: " + ex.Message + "');</script>");
                }
            }
        }

        protected void BtnVazgec_Click(object sender, EventArgs e)
        {
            Response.Redirect("anasayfa.aspx");

        }


    }
}