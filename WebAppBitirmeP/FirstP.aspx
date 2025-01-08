<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstP.aspx.cs" Inherits="WebAppBitirmeP.FirstP" %>

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


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
  body {
    font: 400 15px/1.8 Lato, sans-serif;
    color: #777;
  }
  h3, h4 {
    margin: 10px 0 30px 0;
    letter-spacing: 10px;      
    font-size: 20px;
    color: #111;
  }
  .container {
    padding: 80px 120px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  .carousel-inner img {
    -webkit-filter: grayscale(90%);
    filter: grayscale(90%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin: auto;
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }
  #googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
  }  
  .navbar {

    font-family: Montserrat, sans-serif;
    margin-bottom: 0;
    background-color: #2d2d30;
    border: 0;
    font-size: 11px !important;
    letter-spacing: 4px;
    opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32px;
  }
  footer a {
    color: #f5f5f5;
  }
  footer a:hover {
    color: #777;
    text-decoration: none;
  }  
  .form-control {
    border-radius: 0;
  }
  textarea {
    resize: none;
  }

  .thumbnail img {
    width: 100%;  /* Görselin genişliğini kapsayıcısının genişliğine ayarlar */
    height: 200px; /* Sabit bir yükseklik ayarlayarak görselin boyutunu kontrol et */
    object-fit: cover; /* Görselin kalıbına göre kesilmesini sağlar */
}

  /*  *****/

  /**********/
  </style>
</head>
<body>
    <form id="form1" runat="server">
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">ANASAYFA</a></li>
        <li><a href="#urunler">ÜRÜNLER</a></li>
        <!--<li><a href="#tour">TOUR</a></li>-->
        <li><a href="#contact">İLETİŞİM</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">KATEGORİLER
          <span class="caret"></span></a>
        
            <ul class="dropdown-menu">
            <li><a href="#">Alt Giyim</a></li>
            <li><a href="#">Üst Giyim</a></li>
            <li><a href="#">Elbise</a></li> 
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        <li><a href="UyeOl.aspx"><span class="glyphicon glyphicon-user"></span> Üye Ol</a></li>
        <li><a href="GirisSayfasi.aspx"><span class="glyphicon glyphicon-log-in"></span> Giriş Yap</a></li>
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
        <img src="/img/f" alt="Chicago" width="1200" height="700">
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
     <!--
        <br />
        <p></p>
        <img src="/img/firstpage3.jpg" class="img-responsive" style="width:100%">
        <br />
        <p></p>
        <img src="/img/firstpage3.jpg" class="img-responsive" style="width:100%">
        <br />
        <p></p>
        <img src="/img/firstpage3.jpg" class="img-responsive" style="width:100%">
        <br />
        <p></p>
        -->
        <!-- urunelr-->
        <div id="urunler" class="container">
   <!-- <h3 class="text-center">Ürünler</h3>-->
<asp:Label ID="lblProducts" runat="server" CssClass="text-center" Style="display: block; text-align: center;  font-size: 24px; color:black" Text="Ürünler"></asp:Label>
            <p></p>
    <div class="row">

        <!-- Ürün 1 -->
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="/img/product1.jpg" alt="Ürün 1" class="img-responsive" style="width: 100%; height: auto;">
                <div class="caption" style="text-align: center;">
                   <!-- <h4 style="margin: 0; font-size: 14px;">Ürün Adı 1</h4>-->
                                <asp:Label ID="lblProductName1" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                       <!-- <p style="font-size: 16px; margin: 0; display: inline-block;">$19.99</p>-->
                                        <asp:Label ID="lblPrice1" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                        <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                            <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                        </button>
                        <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                            <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ürün 2 -->
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="/img/product2.jpg" alt="Ürün 2" class="img-responsive" style="width: 100%; height: auto;">
                <div class="caption" style="text-align: center;">
                   <!-- <h4 style="margin: 0; font-size: 14px;">Ürün Adı 2</h4>-->
                                <asp:Label ID="lblProductName2" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                       <!-- <p style="font-size: 16px; margin: 0; display: inline-block;">$29.99</p>-->
                                        <asp:Label ID="lblPrice2" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                        <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                            <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                        </button>
                        <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                            <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ürün 3 -->
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="/img/product3.jpg" alt="Ürün 3" class="img-responsive" style="width: 100%; height: auto;">
                <div class="caption" style="text-align: center;">
                    <!--<h4 style="margin: 0; font-size: 14px;">Ürün Adı 3</h4>-->
                                <asp:Label ID="lblProductName3" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                       <!-- <p style="font-size: 16px; margin: 0; display: inline-block;">$39.99</p>-->
                                        <asp:Label ID="lblPrice3" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                        <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                            <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                        </button>
                        <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                            <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row">

        <!-- Ürün 4 -->
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="/img/product4.jpg" alt="Ürün 4" class="img-responsive" style="width: 100%; height: auto;">
                <div class="caption" style="text-align: center;">
                    <!--<h4 style="margin: 0; font-size: 14px;">Ürün Adı 4</h4>-->
                                <asp:Label ID="lblProductName4" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                      <!--  <p style="font-size: 16px; margin: 0; display: inline-block;">$49.99</p>-->
                        <asp:Label ID="lblPrice4" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                        <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                            <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                        </button>
                        <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                            <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ürün 5 -->
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="/img/product5.jpg" alt="Ürün 5" class="img-responsive" style="width: 100%; height: auto;">
                <div class="caption" style="text-align: center;">
                    <!--<h4 style="margin: 0; font-size: 14px;">Ürün Adı 5</h4>-->
                                <asp:Label ID="lblProductName5" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                        <!--p style="font-size: 16px; margin: 0; display: inline-block;">$59.99</!--p>-->
                                        <asp:Label ID="lblPrice5" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                        <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                            <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                        </button>
                        <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                            <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ürün 6 -->
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="/img/product6.jpg" alt="Ürün 6" class="img-responsive" style="width: 100%; height: auto;">
                <div class="caption" style="text-align: center;">
                   <!-- <h4 style="margin: 0; font-size: 14px;">Ürün Adı 6</h4>-->
                                <asp:Label ID="lblProductName6" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                       <!-- <p style="font-size: 16px; margin: 0; display: inline-block;">$69.99</p>-->
                                        <asp:Label ID="lblPrice6" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                        <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                            <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                        </button>
                        <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                            <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

    <!-- Ürün 7 -->
    <div class="col-md-4">
        <div class="thumbnail">
            <img src="/img/product1.jpg" alt="Ürün 1" class="img-responsive" style="width: 100%; height: auto;">
            <div class="caption" style="text-align: center;">
                <!--<h4 style="margin: 0; font-size: 14px;">Ürün Adı 1</h4>-->
                            <asp:Label ID="lblProductName7" runat="server" CssClass="product-name" 
Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>
                <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                    <!--<p style="font-size: 16px; margin: 0; display: inline-block;">$19.99</p>-->
     <asp:Label ID="lblPrice7" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>
                    <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                    </button>
                    <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                        <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
     <!-- Ürün 8 -->
 <!-- Ürün 8 -->
    <div class="col-md-4">
        <div class="thumbnail">
            <img src="/img/product2.jpg" alt="Ürün 2" class="img-responsive" style="width: 100%; height: auto;">
            <div class="caption" style="text-align: center;">
                <!--<h4 style="margin: 0; font-size: 14px;">Ürün Adı 2</h4>-->
                <asp:Label ID="lblProductName8" runat="server" Style="margin: 0; font-size: 14px;" Text="Ürün Adı 8"></asp:Label>

                <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                    <!--<p style="font-size: 16px; margin: 0; display: inline-block;">$29.99</p>-->
                <asp:Label ID="lblPrice8" runat="server" CssClass="price-label" 
Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>


                    <button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                    </button>
                    <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                        <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
   
<!-- ürün8 denem .net-->

        
            <!-- ****-- 
    <!-- Ürün 9 -->
    <div class="col-md-4">
        <div class="thumbnail">
            <img src="/img/product3.jpg" alt="Ürün 3" class="img-responsive" style="width: 100%; height: auto;">
          
            
            <div class="caption" style="text-align: center;">
                <!--<h4 style="margin: 0; font-size: 14px;">Ürün Adı 3</h4>-->
                <asp:Label ID="lblProductName9" runat="server" CssClass="product-name" 
    Text="Ürün Adı 3" style="margin: 0; font-size: 14px;"></asp:Label>

                <div style="display: flex; justify-content: center; align-items: center; margin-top: 10px;">
                    <!--<p style="font-size: 16px; margin: 0; display: inline-block;">$39.99</p>-->
                    <asp:Label ID="lblPrice9" runat="server" CssClass="price-label" 
    Text="$39.99" style="font-size: 16px; margin: 0; display: inline-block;"></asp:Label>

                    <!--<button class="btn btn-default btn-xs" aria-label="Add to Cart" style="margin-left: 10px; position: relative; background: none; border: none;">
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black;"></span>
                    </button>-->
                    <asp:Button ID="btnAddCard9" runat="server" CssClass="btn btn-default btn-xs" OnCllick="btnAddCard9_Click"
                        style="margin-left: 10px; position: relative; background: none; border: none;" OnClick="btnAddCard9_Click"/>
                    <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px; color: black; width: 4px;"></span>

                   <!-- <button class="btn btn-default btn-xs" aria-label="Add to Favorites" style="margin-left: 5px; background: none; border: none;">
                        <span class="glyphicon glyphicon-heart" style="font-size: 24px; color: black;"></span>
                    </button>-->
                       


                </div>
            </div>
        </div>
    </div>

</div>

    </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
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

<!-- Image of location/map -->
<img src="/img/firstpage3.jpg" class="img-responsive" style="width:100%">

<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>H Store<a href="https://www.w3schools.com" data-toggle="tooltip" title="Visit w3schools">www.w3schools.com</a></p> 
</footer>

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
</body>
</html>


