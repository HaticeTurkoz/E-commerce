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
    public partial class SepeteGit : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserName();

                if (Session["KullaniciAdi"] != null)
                {
                    string kullaniciAdi = Session["KullaniciAdi"].ToString();
                    SepetVerileriniGetir(kullaniciAdi);
                    SepetToplaminiHesapla(kullaniciAdi);

                }
                else
                {
                    // Kullanıcı giriş yapmamışsa uyarı ver ve yönlendir
                    Response.Write("<script>alert('Lütfen giriş yapınız.');</script>");
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private decimal SepetToplaminiHesapla(string kullaniciAdi)

        {
            decimal toplamTutar = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT SUM(ToplamTutar) FROM Sepet WHERE SepetKullanici = @KullaniciAdi";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);

                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != DBNull.Value)
                {
                    toplamTutar = Convert.ToDecimal(result);
                }
            }

            // Güncel toplamı label üzerine yazdır
            lblToplam.Text = $"Sepet Tutarı: {toplamTutar:C}";
            return toplamTutar;
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

        protected void RemoveFromCart(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int sepetID = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Sepet WHERE SepetID = @SepetID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SepetID", sepetID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Sepet verilerini ve toplamını güncelle
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            SepetVerileriniGetir(kullaniciAdi);
            SepetToplaminiHesapla(kullaniciAdi); // Toplam tutarı güncelle
        }

        protected void UpdateQuantity(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int sepetID = Convert.ToInt32(btn.CommandArgument);

            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");

            int yeniAdet = Convert.ToInt32(txtQuantity.Text);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Sepet SET Adet = @YeniAdet WHERE SepetID = @SepetID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@YeniAdet", yeniAdet);
                cmd.Parameters.AddWithValue("@SepetID", sepetID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Sepet verilerini ve toplamını güncelle
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            SepetVerileriniGetir(kullaniciAdi);
            SepetToplaminiHesapla(kullaniciAdi); // Toplam tutarı güncelle
        }

       
     
        protected void btnSend_Click(object sender, EventArgs e)
        {

        }

       

        protected void BtnOde_Click(object sender, EventArgs e)
        {

        }

        protected void btnDevam_Click1(object sender, EventArgs e)
        {

        }
    }
}