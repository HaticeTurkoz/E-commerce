using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace WebAppBitirmeP
{
    public class Genel
    {
        public static string HashPassword(string password, string hashAlgorithm)
        {
            HashAlgorithm hash;

            if (hashAlgorithm.Equals("SHA256"))
            {
                hash = SHA256.Create();
            }
            else if (hashAlgorithm.Equals("SHA512"))
            {
                hash = SHA512.Create();
            }
            else
            {
                throw new ArgumentException("Geçersiz hash algoritması");
            }

            // Parolayı byte dizisine çevir
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            // Hash'le
            byte[] hashedBytes = hash.ComputeHash(passwordBytes);

            // Hashlenmiş byte dizisini hexadecimal string'e çevir
            StringBuilder builder = new StringBuilder();
            foreach (byte b in hashedBytes)
            {
                builder.Append(b.ToString("x2")); // Düşük büyüklükte hexadecimal format
            }
            return builder.ToString();
        }

        //kullanıcının ipsini alır
        public string GetLocalIPAddress()
        {
            // Yerel IP adresini almak için Dns sınıfını kullanıyoruz
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                // IPv4 adreslerini kontrol et
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("Sistemde IPv4 adresine sahip ağ bağdaştırıcısı yok!");
        }
    }
}