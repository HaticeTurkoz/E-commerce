<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="WebAppBitirmeP.sepet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="navbar.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="sepet.css" rel="stylesheet" />

</head>
    <form id="form1" runat="server">

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">



                <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <!-- Üst satır -->
    <div class="row">
      <div class="col-xs-6 text-left">
        <a class="navbar-brand" href="#myPage">Logo</a>
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
    <a class="navbar-link logout-link" href="anasayfa.aspx"><span class="glyphicon glyphicon-log-out"></span>Çıkış</a>

      </div>
    </div>

    <!-- Alt satır (Ortalanmış Menüler) -->
    <div class="row">
      <ul class="nav navbar-nav text-center" style="display: flex; justify-content: center; width: 100%;">
        <li><a href="#myPage">ANASAYFA</a></li>
        <li><a href="#urunler">ÜRÜNLER</a></li>
        <li><a href="#contact">İLETİŞİM</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">KATEGORİLER
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="AltGiyim.aspx">Alt Giyim</a></li>
            <li><a href="UstGiyim.aspx">Üst Giyim</a></li>
            <li><a href="#">Elbise</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
        
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">E-COMMERCE CART</h1>
        </div>
    </section>

    <div class="container mb-4">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <asp:Repeater ID="RepeaterSepet" runat="server">
                        <HeaderTemplate>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col"> </th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col" class="text-center">Size</th>
                                        <th scope="col" class="text-right">Price</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><img src='<%# Eval("SepetResimPATH") %>' width="50" height="50" /> </td>
                                <td><%# Eval("SepetUrunAdi") %></td>
                                <td><asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="form-control" /></td>
                                <td><asp:TextBox ID="txtSize" runat="server" CssClass="form-control" /></td>
                                <td class="text-right"><%# Eval("SepetUrunFiyati", "{0:C}") %></td>
                                <td class="text-right">
                                    <button class="btn btn-sm btn-danger" onclick="RemoveFromCart()">Remove</button>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="col mb-2">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <asp:Button ID="BtnDevam" runat="server" class="btn btn-block btn-light" Text="Continue Shopping" OnClick="Button1_Click1" />
                    </div>
                    <div class="col-sm-12 col-md-6 text-right">
                        <asp:Button ID="BtnOdeme" runat="server" class="btn btn-lg btn-block btn-success text-uppercase" Text="Save Cart" OnClick="BtnSaveCart_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
              



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
                </form>

</html>
