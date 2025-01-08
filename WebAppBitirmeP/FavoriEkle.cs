using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppBitirmeP
{
    public class FavoriEkle
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Veritabani"].ConnectionString;

        public void FavoriEkleMetodu(int kullanıcıID, int ürünID, string ürünAdı, decimal fiyat, string resimUrl)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Favoriler (KullaniciID, UrunID, UrunAdi, Fiyat, ResimPATH) VALUES (@KullaniciID, @UrunID, @UrunAdi, @Fiyat, @ResimPATH)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@KullaniciID", kullanıcıID);
                    cmd.Parameters.AddWithValue("@UrunID", ürünID);
                    cmd.Parameters.AddWithValue("@UrunAdi", ürünAdı);
                    cmd.Parameters.AddWithValue("@Fiyat", fiyat);
                    cmd.Parameters.AddWithValue("@ResimPATH", resimUrl);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}