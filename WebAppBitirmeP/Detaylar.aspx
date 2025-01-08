<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detaylar.aspx.cs" Inherits="WebAppBitirmeP.Detaylar" %>

<!DOCTYPE html>
<html lang="en">
<head>
     
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="navbar.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eCommerce Product Detail</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="details.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
            height: 136px;
            width: 91px;
        }
        .auto-style2 {
            width: 89px;
            height: 136px;
        }
        .auto-style3 {
            width: 91px;
            height: 135px;
        }
        .auto-style4 {
            width: 91px;
            height: 136px;
        }
        .auto-style5 {
            width: 92px;
            height: 136px;
        }
    </style>
</head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">



                <nav class="navbar navbar-inverse navbar-fixed-top">
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
    <form runat="server">
    <div class="container">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">
                        <div class="preview-pic tab-content">
                            <!-- Ürün resmi burada gösterilecek -->
                            <asp:Image ID="imgUrun" runat="server" CssClass="tab-pane active" Width="400px" Height="599px" />
                        </div>
                        <ul class="preview-thumbnail nav nav-tabs">
                        </ul>
                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">
                            &nbsp;</h3>
                        <h3 class="product-title">
                            <asp:Label ID="LblUrunAdi" runat="server" Text="ürün adı"></asp:Label>
                        </h3>
                        <div class="rating">
                            <div class="stars">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </div>
                        </div>
                        <p class="product-description">
                            &nbsp;</p>
                        <p class="product-description">
                            &nbsp;<asp:Label ID="LblUrunBilgisi" runat="server" Text="ürün bilgsi"></asp:Label>
                        </p>
                        <p class="product-description">
                            &nbsp;</p>
                        <h4 class="price">FİYATI:
                            <asp:Label ID="LblFiyat" runat="server" ForeColor="White"></asp:Label>
                        </h4>
                        <h5 class="sizes">&nbsp;</h5>
                        <h5 class="sizes">&nbsp;</h5>
                        <h5 class="sizes">sizes:
                            <asp:RadioButton ID="RbSmall" runat="server" Text="S" GroupName="SizeGroup" />
                            <asp:RadioButton ID="RbMedium" runat="server" Text="M" GroupName="SizeGroup" />
                            <asp:RadioButton ID="RbLarge" runat="server" Text="L" GroupName="SizeGroup" />
                            <asp:RadioButton ID="RbXLarge" runat="server" Text="XL" GroupName="SizeGroup" />
                        </h5>
                        <p class="sizes">&nbsp;</p>
                        <p class="sizes">&nbsp;</p>
                        <div class="action">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to cart" CssClass="add-to-cart btn btn-default" OnClick="btnAddToCart_Click" BackColor="#6E6E6E" />
                            <asp:Button ID="btnLike" runat="server" Text="&#xf004;" CssClass="like btn btn-default fa" OnClick="btnLike_Click" BackColor="#6E6E6E" />
                        </div>
                    </div>
                </div>
            </div>
            <asp:Label ID="LblKategori" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</form>

        
<script>
    $(document).ready(function () {
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
</body>
</html>
