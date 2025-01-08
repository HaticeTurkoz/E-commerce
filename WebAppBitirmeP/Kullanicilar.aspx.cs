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
    public partial class Kullanicilar : System.Web.UI.Page
    {
        // Veritabanı bağlantı dizesi
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindKullanicilar();
            }
        }

        // Kullanıcıları listelemek için veritabanından veri çekme
        private void BindKullanicilar()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT Id, KullaniciAdi, MailAdresi, TelefonNo FROM Kullanicilar";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            // GridView'e bağlama
                            gvKullanicilar.DataSource = dt;
                            gvKullanicilar.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Hata mesajı
                Response.Write($"<script>alert('Hata oluştu: {ex.Message}');</script>");
            }
        }

        protected void gvKullanicilar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}