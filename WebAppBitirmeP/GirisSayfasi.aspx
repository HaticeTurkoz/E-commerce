<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisSayfasi.aspx.cs" Inherits="WebAppBitirmeP.GirisSayfasi" %>

<%@ Register Src="~/ortakUC.ascx" TagPrefix="uc1" TagName="ortakUC" %>
<%@ Register Src="~/navbarUC.ascx" TagPrefix="uc1" TagName="navbarUC" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="login.css" rel="stylesheet" />

</head>
<body>

    <form id="form1" runat="server">
        
                <uc1:navbarUC runat="server" ID="navbarUC" />
                    <uc1:ortakUC runat="server" ID="ortakUC" />

        <!--<h2>Kullanıcı Giriş Formu</h2>-->
 
<div class="container">
<div class="row">
<h2 style="text-align:center">Sosyal Medya Hesabınızla ya da Manuel Giriş Yapınız</h2>
<div class="vl">
<span class="vl-innertext">veya</span>
</div>
 
      <div class="col">
<a href="#" class="fb btn">
<i class="fa fa-facebook fa-fw"></i> Login with Facebook
</a>
<a href="#" class="twitter btn">
<i class="fa fa-twitter fa-fw"></i> Login with Twitter
</a>
<a href="#" class="google btn"><i class="fa fa-google fa-fw">
</i> Login with Google+
</a>
</div>
 
      <div class="col">
<div class="hide-md-lg">
<p>Or sign in manually:</p>
</div>
 
<asp:TextBox ID="txtUserName" placeholder="Kullanıcı Adı " runat="server"></asp:TextBox>
<asp:TextBox ID="txtPassword" placeholder="Şifre " runat="server" TextMode="Password"></asp:TextBox>
<asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" OnClick="btnLogin_Click" />
</div>
</div>
</div>
 
<div class="bottom-container">
<div class="row">
<div class="col">
<a href="https://ankaraka.org.tr/" target="_blank" style="color:white" class="btn">Ankara Klkınma Ajansı</a>
</div>
<div class="col">
<a href="https://www.bilisimegitim.com/" target="_blank" style="color:white" class="btn">Bilişim Eğitim Merkezi</a>
</div>
</div>
</div>

    </form>
</body>
</html>
