<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twoRowNav.aspx.cs" Inherits="WebAppBitirmeP.twoRowNav" %>

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
    <link href="navbar.css" rel="stylesheet" />
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
        <a class="navbar-brand" href="#myPage">Logo</a>
      </div>
      <div class="col-xs-6 text-right">
        <a class="navbar-link" href="KayitOl.aspx"><span class="glyphicon glyphicon-user"></span> Üye Ol</a>
        <a class="navbar-link" href="GirisForm.aspx"><span class="glyphicon glyphicon-log-in"></span> Giriş Yap</a>
      </div>
    </div>

    <!-- Alt satır (Ortalanmış Menüler) -->
    <div class="row">
      <ul class="nav navbar-nav text-center" style="display: flex; justify-content: center; width: 100%;">
        <li><a href="#myPage">ANASAYFA</a></li>
        <li><a href="#urunler">ÜRÜNLER</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">KATEGORİLER
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">Alt Giyim</a></li>
            <li><a href="#">Üst Giyim</a></li>
            <li><a href="#">Elbise</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>





<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/img/firstpage3.jpg" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>İstanbul</h3>
          <p>Hamidiye, Cendere Cad. No:2333, 34448 Kâğıthane/İstanbul</p>
        </div>      
      </div>

      <div class="item">
        <img src="/i" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Ankara</h3>
          <p>Kızılırmak, Mevlana Blv., 06000 Çankaya/Ankara</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="/img/firstpage3.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>İzmir</h3>
          <p>Kazımdirik Mah. 123 Sk. No:123 D Blok No:1234/B, 30000 Bornova/İzmir</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>


  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Tickets</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span> Tickets, $23 per person</label>
              <input type="number" class="form-control" id="psw" placeholder="How many?">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Send To</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
              <button type="submit" class="btn btn-block">Pay 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <p>Need <a href="#">help?</a></p>
        </div>
      </div>
    </div>
  </div>
</div>
    <!--****************************************-->
       <!-- Ürünler Kısmı -->

        <!--******************** -->

        

       

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid">
    <p></p>
    <p></p>
    <br/>
    <br />
  <h3 class="text-center">İLETİŞİM</h3>
  <p class="text-center"><em>Bizimle Burdan İletişime Geçebilirsiniz</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>Notunuzu Bırakın</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>İstanbul, Türkiye</p>
      <p><span class="glyphicon glyphicon-phone"></span>Telefon: +00 123456789</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
            <!-- .net toollarına çevrildi-->
         <!-- <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>-->
            <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Name" Required="true"></asp:TextBox>

        </div>
        <div class="col-sm-6 form-group">
         <!-- <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>-->
            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" Required="true"></asp:TextBox>

        </div>
      </div>
      <!--<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>-->
        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control" Placeholder="Comment" Rows="5"></asp:TextBox>

      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <!--<button class="btn pull-right" type="submit">Send</button>-->
            <asp:Button ID="btnSend" runat="server" CssClass="btn pull-right" Text="Send" OnClick="btnSend_Click" />

        </div>
      </div>
    </div>
  </div>
  <br>
  <h3 class="text-center">Ortak Kurucular</h3>  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Aliye Koş</a></li>
    <li><a data-toggle="tab" href="#menu1">Ayşe Can</a></li>
    <li><a data-toggle="tab" href="#menu2">Gül Kaçtı</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>Aliye Koş</h2>
      <p>...</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>Ayşe Can</h2>
      <p>...</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2>Gül Kaçtı</h2>
      <p>...</p>
    </div>
  </div>
</div>

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
                <img src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png" alt="Facebook" style="width: 40px; height: 40px;">
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
