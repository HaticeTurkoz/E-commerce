using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppBitirmeP
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUrunEkle_Click(object sender, EventArgs e)
        {
            // Eğer resim yüklenmemişse hata mesajı ver//Amaç: Kullanıcıdan bir resim dosyası yüklenmesini istemek.
            if (!fileUpload.HasFile)//fileUpload.HasFile özelliği, bir dosya seçilip seçilmediğini kontrol eder.
            {
                Response.Write("<script>alert('Lütfen bir resim seçiniz.');</script>");
                return;//Eğer dosya seçilmemişse, bir uyarı mesajı görüntülenir ve işlem durdurulur (return ile).
            }

            // Resmi sunucuya kaydet
            string dosyaAdi = Path.GetFileName(fileUpload.PostedFile.FileName);//fileUpload.PostedFile.FileName: Yüklenen dosyanın orijinal adını alır.
                                                                               //Path.GetFileName: Dosya yolundaki yalnızca dosya adını (örneğin resim.jpg) ayıklar.
            string kayitYolu = Server.MapPath("~/img/") + dosyaAdi;//Server.MapPath("~/img/"): Sunucudaki img klasörünün fiziksel yolunu belirler.
            fileUpload.SaveAs(kayitYolu);//fileUpload.SaveAs(kayitYolu): Dosyayı belirlenen yola kaydeder.


            // Veritabanına kaydedilecek yol
            string resimYolu = "/img/" + dosyaAdi; //Amaç: Veritabanında dosyanın nerede bulunduğunu gösterecek bir yol (URL) oluşturmak.


            // Veritabanına bağlanma
            using (SqlConnection conn = new SqlConnection(connectionString))//connectionString: Veritabanına bağlanmak için kullanılan bağlantı dizesi.

            {
                conn.Open();//conn.Open(): Bağlantıyı açar.

                //query değişkeni, bir SQL sorgusunu temsil ediyor. 
                //query: SQL sorgusu, yeni bir ürün eklemek için yazılmıştır.
                string query = @"INSERT INTO TumUrunler 
                     (TKullaniciAdi, TUrunFiyati, TUrunAdi, TUrunBilgisi, TResimPATH, TUrunKategori) 
                     VALUES 
                     (@TKullaniciAdi, @TUrunFiyati, @TUrunAdi, @TUrunBilgisi, @TResimPATH, @TUrunKategori)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    //cmd: SQL sorgusunu çalıştıracak nesne.
                    // Parametreleri ayarla
                    cmd.Parameters.AddWithValue("@TKullaniciAdi", "Admin"); // Kullanıcı adı
                    cmd.Parameters.AddWithValue("@TUrunFiyati", Convert.ToDecimal(txtFiyat.Text.Trim()));//Kullanıcının girdiği fiyat (txtFiyat) bir ondalık (Decimal) sayıya çevrilir.
                    cmd.Parameters.AddWithValue("@TUrunAdi", txtUrunAdi.Text.Trim());
                    cmd.Parameters.AddWithValue("@TUrunBilgisi", txtUrunBilgisi.Text.Trim()); // Ürün bilgisi alanını da alıyoruz
                    cmd.Parameters.AddWithValue("@TResimPATH", resimYolu);
                    cmd.Parameters.AddWithValue("@TUrunKategori", Convert.ToInt32(ddlKategori.SelectedValue));
                    //Trim() metodu, bir dize (string) üzerinde bulunan başındaki ve sonundaki boşluk karakterlerini
                    //(veya istenen karakterleri) kaldırmak için kullanılan bir metottur.
                    try
                    {
                        cmd.ExecuteNonQuery();//ExecuteNonQuery() ile sorguyu çalıştırmak (satır eklemek).
                        Response.Write("<script>alert('Ürün başarıyla eklendi.');</script>");
                        // Formu temizle Başarılıysa, kullanıcıya "Ürün başarıyla eklendi" mesajı göstermek ve form alanlarını temizlemek.
                        txtUrunAdi.Text = "";
                        txtFiyat.Text = "";
                        txtUrunBilgisi.Text = ""; // Ürün bilgisi alanını temizle
                        ddlKategori.SelectedIndex = 0;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Hata: " + ex.Message + "');</script>");
                    }
                }
            }

        }

        protected void btnUrunSil_Click(object sender, EventArgs e)
        {

        }

        protected void btnUrunGuncelle_Click(object sender, EventArgs e)
        {

        }
    }
}