<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="elbise.aspx.cs" Inherits="WebAppBitirmeP.elbise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <!-- Theme Made By www.w3schools.com - No Copyright -->
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="navbar.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<!--<body>-->
    <form id="form1" runat="server">
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">



                <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Üst satır -->
    <div class="row">
      <div class="col-xs-6 text-left">
        <a class="navbar-brand" href="#myPage">                          
            <img alt="Logo" src="/img/sonlogo.png" style="max-height: 100px;" />
</a>
      </div>
      <div class="col-xs-6 text-right">
        <!--<a class="navbar-link" href="KayitOl.aspx"><span class="glyphicon glyphicon-user"></span> Üye Ol</a>
        <a class="navbar-link" href="GirisForm.aspx"><span class="glyphicon glyphicon-log-in"></span> Giriş Yap</a>
          -->
          <asp:Label ID="lblKullaniciAdi" runat="server" CssClass="navbar-link username-label" Visible="false"></asp:Label>
      
          <!-- hesap navbar buraya koy-->
 
              <a class="navbar-link user-icon" href="Hesabim.aspx"><span class="glyphicon glyphicon-user"></span>Hesabım</a>


<!-- Favori ikonu -->
    <a class="navbar-link" href="Favorilerim.aspx"><span class="glyphicon glyphicon-heart" title="Favoriler"></span>Favorilerim</a>
<!-- Sepet ikonu -->
    <a class="navbar-link" href="SepeteGit.aspx"><span class="glyphicon glyphicon-shopping-cart" title="Sepet"></span>Sepete Git</a>
    <a class="navbar-link logout-link" href="cikis.aspx"><span class="glyphicon glyphicon-log-out"></span>Çıkış</a>

      </div>
    </div>

    <!-- Alt satır (Ortalanmış Menüler) -->
    <div class="row">
      <ul class="nav navbar-nav text-center" style="display: flex; justify-content: center; width: 100%;">
        <li><a href="UserPanel.aspx">ANASAYFA</a></li>
        <li><a href="UserPanel.aspx">ÜRÜNLER</a></li>
        <li><a href="iletisim.aspx">İLETİŞİM</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">KATEGORİLER
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="AltGiyim.aspx">Alt Giyim</a></li>
            <li><a href="UstGiyim.aspx">Üst Giyim</a></li>
            <li><a href="elbise.aspx">Elbise</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>






    <!--****************************************-->
       <!-- Ürünler Kısmı -->
    

    
              
    <!--****************************************-->
       <!-- Ürünler Kısmı -->
 <asp:ScriptManager ID="ScriptManager2" runat="server" />



<div id="urunler" class="container">
    <asp:Label ID="lblProducts" runat="server" CssClass="text-center" Style="display: block; text-align: center; font-size: 24px; color:black" Text="Ürünler"></asp:Label>
    <p></p>
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand1">
        <HeaderTemplate>
            <div class="row">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="col-md-4">
                <div class="thumbnail">
                    
                    
                    <asp:Literal ID="litProductImage" runat="server" 
                        Text='<%# "<img src=\"" + Eval("TResimPATH") + "\" alt=\"" + Eval("TUrunAdi") + "\" class=\"img-responsive\" style=\"width: 100%; height: auto;\" />" %>'>
                    </asp:Literal>                        
                    <div class="caption" style="text-align: center;">
                      


                        <asp:Label ID="lblProductName" runat="server" Style="margin: 0; font-size: 14px;" Text='<%# Eval("TUrunAdi") %>'></asp:Label>
                        
                        
                                     <!-- Ürün Detay Butonu -->
                   <!-- Ürün Detay Butonu (Butonun yüksekliğini label ile hizalamak için stil ekledik) -->


<div style="margin-top: 0px;">
    <asp:LinkButton ID="btnProductDetail" runat="server" CssClass="btn btn-info btn-xs" OnClick="ProductDetail_Click" CommandArgument='<%# Eval("TUrunID") %>' CausesValidation="false" Style="margin-top: 5px; padding: 5px 10px; display: inline-flex; align-items: center; justify-content: center;">
        Ürün Detayı
    </asp:LinkButton>
</div>
        <!-- ***-->
                        <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                            
                           
                            
                            <asp:Label ID="lblPrice" runat="server" CssClass="price-label" Text='<%# String.Format("{0:C}", Eval("TUrunFiyati")) %>' Style="font-size: 16px; margin: 0; display: inline-block;" Height="22px" Width="49px"></asp:Label>
                            
                            
                            
                            <asp:LinkButton ID="AddToCart" runat="server" CssClass="btn btn-default btn-xs" OnClick="AddToCart_Click" CommandArgument='<%# Eval("TUrunID") %>' CausesValidation="false" Style="margin-left: 25px; padding: 0; background: none; border: none;">
                                <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                            </asp:LinkButton>


                            <asp:LinkButton ID="AddToFavorites" runat="server" CssClass="btn btn-default btn-xs" OnClick="AddToFavorites_Click" CommandArgument='<%# Eval("TUrunID") %>' CausesValidation="false" Style="margin-left: 25px; padding: 0; background: none; border: none;">
                                <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</div>
                
        <!--******************** -->


                
        <!--******************** -->



        <!--******************** -->

        




        <!--******************** -->

        

       


        

        <!-- Footer Section -->
<footer style="width: 100%; margin: 0; padding: 0; background-color: transparent;">
    <p style="margin: 0; text-align: center;">© 2024 Şirket Adı</p>
    <img src="/img/forfooter.png" alt="Footer Resmi" style="width: 100%; height: auto; display: block;">
    
    <!-- Social Media Section -->
    <div style="text-align: center; padding: 10px 0;">
        <h3 style="margin: 0;">Sosyal Medya Hesaplarımız</h3>
        <p></p>
        <br />
        <div style="padding: 10px 0;">
            <a href="https://www.facebook.com" target="_blank" style="margin: 0 20px;">
                <img src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png" alt="Facebook" style="width: 40px; ">
            </a>
            <a href="https://www.twitter.com" target="_blank" style="margin: 0 20px;">
                <img src="https://img.icons8.com/ios-filled/50/000000/twitter.png" alt="Twitter" style="width: 40px; height: 40px;">
            </a>
            <a href="https://www.instagram.com" target="_blank" style="margin: 0 20px;">
                <img src="https://img.icons8.com/ios-filled/50/000000/instagram-new.png" alt="Instagram" style="width: 40px; height: 40px;">
            </a>
            <a href="https://www.linkedin.com" target="_blank" style="margin: 0 20px;">
                <img src="https://img.icons8.com/ios-filled/50/000000/linkedin.png" alt="LinkedIn" style="width: 40px; height: 40px;">
            </a>
        </div>
    </div>
</footer>


        <!-- -->
    <script>    $(document).ready(function () {
            // Initialize Tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {

                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });
        })
    </script>


</body >
    </form >

</html >
