<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KayitOl.aspx.cs" Inherits="WebAppBitirmeP.KayitOl" %>

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
        <a class="navbar-brand" href="#myPage">                          
            <img alt="Logo" src="/img/sonlogo.png" style="max-height: 50px;" />
</a>
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
            <li><a href="AltGiyim.aspx">Alt Giyim</a></li>
            <li><a href="UstGiyim.aspx">Üst Giyim</a></li>
            <li><a href="elbise.aspx">Elbise</a></li> 
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        <li><a href="KayitOl.aspx"><span class="glyphicon glyphicon-user"></span> Üye Ol</a></li>
        <li><a href="GirisForm.aspx"><span class="glyphicon glyphicon-log-in"></span> Giriş Yap</a></li>
      </ul>

    </div>
  </div>
</nav>
       

        <div class="container" style="margin-top: 70px;">
    <h2>Kayıt Ol</h2>
    <div class="form-group">
        <label>Kullanıcı Adı:</label>
        <asp:TextBox ID="txtUserNameKayit" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexUserName" runat="server" ControlToValidate="txtUserNameKayit" CssClass="text-danger"
            ValidationExpression="^[a-zA-Z0-9]{5,50}$" ErrorMessage="Kullanıcı adı en az 5 karakter olmalı ve yalnızca harf/rakam içermelidir."></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label>Telefon Numarası:</label>
        <asp:TextBox ID="txtTelNo" runat="server" CssClass="form-control" placeholder="Telefon Numarası"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexTelNo" runat="server" ControlToValidate="txtTelNo" CssClass="text-danger"
            ValidationExpression="^\+?\d{10,15}$" ErrorMessage="Telefon numarası geçersiz. (10-15 basamak olmalı)"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label>Mail Adresi:</label>
        <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" placeholder="Mail Adresi"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexMail" runat="server" ControlToValidate="txtMail" CssClass="text-danger"
            ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Geçerli bir e-posta adresi giriniz."></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label>Şifre:</label>
        <asp:TextBox ID="txtPasswordKayit" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexPassword" runat="server" ControlToValidate="txtPasswordKayit" CssClass="text-danger"
            ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&amp;.,])[A-Za-z\d@$!%*?&amp;.,]{8,}$"
            ErrorMessage="Şifre en az 8 karakter, bir büyük harf, bir küçük harf, bir rakam ve bir özel karakter içermelidir."></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label>Şifre Tekrar:</label>
        <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre Tekrar"></asp:TextBox>
        <asp:CompareValidator ID="comparePasswords" runat="server" ControlToValidate="txtPasswordConfirm" ControlToCompare="txtPasswordKayit" CssClass="text-danger"
            ErrorMessage="Şifreler eşleşmiyor."></asp:CompareValidator>
    </div>
    <asp:ValidationSummary ID="validationSummary" runat="server" CssClass="text-danger" HeaderText="Hatalar:" />
    <asp:Button ID="BtnKayitOl" runat="server" CssClass="btn btn-primary" Text="Kayıt Ol" OnClick="BtnKayitOl_Click" />
    <asp:Button ID="BtnVazgec" runat="server" CssClass="btn btn-secondary" Text="Vazgeç" OnClick="BtnVazgec_Click" />
</div>



    </form>
</body>
</html>
