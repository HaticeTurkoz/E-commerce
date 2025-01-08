<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SepeteGit.aspx.cs" Inherits="WebAppBitirmeP.SepeteGit" %>

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
                                <td><img src='<%# Eval("SepetResimPATH") %>' width="60" height="90" /> </td>
                                <td><%# Eval("SepetUrunAdi") %></td>
                                <td>
                                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Adet") %>' CssClass="form-control" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSize" runat="server" Text='<%# Eval("Beden") %>' CssClass="form-control" />
                                </td>
                                <td class="text-right"><%# Eval("SepetUrunFiyati", "{0:C}") %></td>
                                <td class="text-right">
                                    <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-sm btn-danger" Text="Remove" CommandArgument='<%# Eval("SepetID") %>' OnClick="RemoveFromCart" />
                                    <br />
                                    <asp:Button ID="btnUpdateQuantity" runat="server" CssClass="btn btn-sm btn-warning" Text="Update" CommandArgument='<%# Eval("SepetID") %>' OnClick="UpdateQuantity" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                                        
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblToplam" runat="server" Font-Bold="True" Text="Sepet Tutarı:"></asp:Label>
                    <br />
                    <br />
                    <br />
                </div>
            </div>

            <div class="col mb-2">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <asp:Button ID="btnDevam" runat="server" class="btn btn-block btn-light" Text="Alışverişe Devam Et" OnClick="btnDevam_Click1" />
                    </div>
                    <div class="col-sm-12 col-md-6 text-right">
                        <asp:Button ID="BtnOde" runat="server" class="btn btn-lg btn-block btn-success text-uppercase" Text="Ödemeye Geç" OnClick="BtnOde_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>



        <!-- **************************************************-->




        <!--******************** -->

        

       


<!-- Image of location/map  class="img-responsive-->
<!--<img src="/img/firstpage3.jpg" style="width:100%">-->
        <!-- Container (Contact Section) -->
   

        
 <!-- Footer Section -->
        <!-- Footer Section -->
<!-- Footer Section -->
        

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

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

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
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>

</body>
    </form>
<!--</body>-->
</html>