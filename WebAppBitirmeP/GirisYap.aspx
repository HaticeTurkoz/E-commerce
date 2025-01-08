<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisYap.aspx.cs" Inherits="WebAppBitirmeP.GirisYap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                        <li><a href="#myPage">ANASAYFA</a></li>
                        <li><a href="#band">ÜRÜNLER</a></li>
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
                        <li><a href="GirisYap.aspx"><span class="glyphicon glyphicon-log-in"></span> Giriş Yap</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top: 70px;">
            <h2 style="text-align:center"></h2>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı"></asp:Label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Şifre"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifre"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-black" Text="Giriş Yap" OnClick="btnLogin_Click" />
                        <asp:Button ID="BtnVazgec" runat="server" CssClass="btn btn-secondary" Text="Vazgeç" OnClick="BtnVazgec_Click" />

                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>
