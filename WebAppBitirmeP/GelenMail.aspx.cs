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
    public partial class GelenMail : System.Web.UI.Page
    {
        // Veritabanı bağlantı dizesi
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;
        // Veritabanı bağlantı dizesi

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGelenMailler();
            }
        }

        // GridView'e verileri bağlama
        private void BindGelenMailler()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT iletisimID, iletisimMail, iletisimMesaji, iletisimSaati FROM iletisim";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            gvGelenMailler.DataSource = dt;
                            gvGelenMailler.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Hata yönetimi
                Response.Write($"<script>alert('Hata oluştu: {ex.Message}');</script>");
            }
        }

        // GridView'deki satır komutlarını işleme
        protected void gvGelenMailler_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cevapla")
            {
                // İletişim ID'sini al
                int iletisimID = Convert.ToInt32(e.CommandArgument);

                // ID'yi HiddenField'a at
                hfMailID.Value = iletisimID.ToString();

                // Cevap formunu göster
                cevapFormu.Visible = true;
            }
        }

        // Cevap gönderme işlemi
        protected void btnCevapGonder_Click(object sender, EventArgs e)
        {
            try
            {
                int iletisimID = Convert.ToInt32(hfMailID.Value);
                string cevapMesaji = txtCevap.Text.Trim();

                if (string.IsNullOrWhiteSpace(cevapMesaji))
                {
                    Response.Write("<script>alert('Lütfen bir cevap yazınız.');</script>");
                    return;
                }

                // Burada cevap gönderme mantığını ekleyebilirsiniz.
                // Örneğin, e-posta ile cevap gönderme veya veritabanına kaydetme.

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "UPDATE iletisim SET iletisimMesaji = @Cevap WHERE iletisimID = @ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Cevap", cevapMesaji);
                        cmd.Parameters.AddWithValue("@ID", iletisimID);
                        cmd.ExecuteNonQuery();
                    }
                }

                // İşlem tamamlandığında formu gizle ve mesaj ver
                cevapFormu.Visible = false;
                txtCevap.Text = string.Empty;
                BindGelenMailler();

                Response.Write("<script>alert('Cevap başarıyla gönderildi.');</script>");
            }
            catch (Exception ex)
            {
                // Hata yönetimi
                Response.Write($"<script>alert('Hata oluştu: {ex.Message}');</script>");
            }
        }

        protected void gvGelenMailler_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Burada herhangi bir işlem yapılmıyor, isterseniz bu metodu kaldırabilirsiniz.
        }
    }
}