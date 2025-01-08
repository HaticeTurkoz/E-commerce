using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppBitirmeP
{
    public partial class cikis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Session'ı temizle
            Session.Clear();
            Session.Abandon();


            // Anasayfaya yönlendir
            Response.Write("<script>alert('Çıkış Yapıldı.');</script>");
            Response.Redirect("anasayfa.aspx");
        }
    }
}