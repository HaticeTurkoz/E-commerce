using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppBitirmeP
{
    public class Urun
    {
        public int ID { get; set; } // Ürün ID'si
        public string Ad { get; set; } // Ürün adı
        public decimal Fiyat { get; set; } // Ürün fiyatı
        public string ResimPath { get; set; } // Ürün görselinin yolu
    }
}