<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uyeoldeneme.aspx.cs" Inherits="WebAppBitirmeP.uyeoldeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <!-- Theme Made By www.w3schools.com - No Copyright -->
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="navbar.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">

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
        <li><a href="anasayfa.aspx">ANASAYFA</a></li>
        <li><a href="#urunler">ÜRÜNLER</a></li>
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
        <li><a href="GirisForm.aspx"><span class="glyphicon glyphicon-log-in"></span> Giriş Yap</a></li>
      </ul>

    </div>
  </div>
</nav>
       <div  class="container" style="margin-top: 70px;">
            <h2>Kayıt Ol</h2>
            <div class="form-group">
                <label>Kullanıcı Adı:</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Şifre:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Şifre Tekrar:</label>
                <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre Tekrar"></asp:TextBox>
            </div>
            <asp:Button ID="BtnKayitOl" runat="server" CssClass="btn btn-primary" Text="Kayıt Ol" OnClick="BtnKayitOl_Click"" />
            <asp:Button ID="BtnVazgec" runat="server" CssClass="btn btn-secondary" Text="Vazgeç" OnClick="BtnVazgec_Click" />
        </div>
    </form>
</body>
</html>

