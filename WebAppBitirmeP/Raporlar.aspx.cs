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
    public partial class Raporlar : System.Web.UI.Page
    {
        // Veritabanı bağlantı dizesi
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLogTable();
            }
        }

        // Log tablosundaki verileri almak ve GridView'e bağlamak
        private void BindLogTable()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT Id, kullaniciAdi, islemTarihi, yaptigiis, isYaptigiEkran, kullaniciip FROM logTable ORDER BY islemTarihi DESC";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            // GridView'e bağlama
                            gvRaporlar.DataSource = dt;
                            gvRaporlar.DataBind();
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

        protected void gvRaporlar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}