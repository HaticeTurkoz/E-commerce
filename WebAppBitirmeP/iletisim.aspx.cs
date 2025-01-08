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
    public partial class iletisim : System.Web.UI.Page
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
            else
            {
                // Kullanıcı adı null veya boş ise ürünleri göstermeyebiliriz veya hata mesajı 
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
        protected void btnSend_Click(object sender, EventArgs e)
        {

            // Kullanıcıdan gelen verileri al
            string kullaniciAdi = txtname.Text.Trim();
            string email = txtemail.Text.Trim();
            string mesaj = txtComments.Text.Trim();
            string ipAdresi = HttpContext.Current.Request.UserHostAddress; // Kullanıcı IP'si
            DateTime islemSaati = DateTime.Now;

            // Veritabanı bağlantı dizesi
            //string connectionString = "Veritabani";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // 1. Adım: Kullanıcının bugün gönderdiği mesaj sayısını kontrol et
                    string countQuery = @"
                SELECT COUNT(*) 
                FROM iletisim 
                WHERE iletisimKullaniciAdi = @KullaniciAdi 
                AND CAST(iletisimSaati AS DATE) = CAST(GETDATE() AS DATE)";

                    using (SqlCommand countCmd = new SqlCommand(countQuery, conn))
                    {
                        countCmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                        int mesajSayisi = (int)countCmd.ExecuteScalar();

                        // Eğer mesaj sayısı 4 veya daha fazla ise, hata mesajı göster
                        if (mesajSayisi >= 4)
                        {
                            string limitScript = "alert('Gün içinde en fazla 4 mesaj gönderebilirsiniz. Daha fazla mesaj gönderemezsiniz.');";
                            Response.Write($"<script>{limitScript}</script>");
                            return;
                        }
                    }

                    // 2. Adım: Mesajı veritabanına ekle
                    string insertQuery = @"
                INSERT INTO iletisim (iletisimKullaniciAdi, iletisimMail, iletisimMesaji, iletisimIp, iletisimSaati)
                VALUES (@KullaniciAdi, @Mail, @Mesaj, @Ip, @Saat)";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                    {
                        // Parametreleri ekle
                        insertCmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                        insertCmd.Parameters.AddWithValue("@Mail", email);
                        insertCmd.Parameters.AddWithValue("@Mesaj", mesaj);
                        insertCmd.Parameters.AddWithValue("@Ip", ipAdresi);
                        insertCmd.Parameters.AddWithValue("@Saat", islemSaati);

                        // Sorguyu çalıştır
                        insertCmd.ExecuteNonQuery();
                    }
                }

                // Kullanıcıya başarılı mesajı göster
                string successScript = "alert('Mesajınız başarıyla gönderildi.'); window.location='iletisim.aspx';";
                Response.Write($"<script>{successScript}</script>");

                // Formu temizle
                txtname.Text = string.Empty;
                txtemail.Text = string.Empty;
                txtComments.Text = string.Empty;
            }
            catch (Exception ex)
            {
                // Hata durumunda kullanıcıya bilgi ver
                string errorScript = $"alert('Mesaj gönderilirken bir hata oluştu: {ex.Message}');";
                Response.Write($"<script>{errorScript}</script>");
            }
        }
    }
}
   