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
    public partial class sepet : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KullaniciAdi"] != null)
                {
                    string kullaniciAdi = Session["KullaniciAdi"].ToString();
                    SepetVerileriniGetir(kullaniciAdi);
                }
                else
                {
                    // Kullanıcı giriş yapmamışsa uyarı ver ve yönlendir
                    Response.Write("<script>alert('Lütfen giriş yapınız.');</script>");
                    Response.Redirect("Login.aspx");
                }
            }
        }
        private void SepetVerileriniGetir(string kullaniciAdi)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(@"
                SELECT SepetID, SepetUrunAdi, SepetResimPATH, SepetUrunFiyati, Adet, Beden, ToplamTutar 
                FROM Sepet 
                WHERE SepetKullanici = @KullaniciAdi", conn);

                cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                RepeaterSepet.DataSource = dt;
                RepeaterSepet.DataBind();
            }
        }

        protected void BtnSaveCart_Click(object sender, EventArgs e)
        {
            // Sepet kaydetme işlemleri buraya eklenebilir (isteğe bağlı).
            Response.Write("<script>alert('Sepet başarıyla kaydedildi!');</script>");
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

    }
}