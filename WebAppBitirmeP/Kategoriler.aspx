﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kategoriler.aspx.cs" Inherits="WebAppBitirmeP.Kategoriler" %>


<%@ Register Src="~/navbarUC.ascx" TagPrefix="uc1" TagName="navbarUC" %>



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

<link href="adminNav.css" rel="stylesheet" />
    <style>
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
   
<uc1:navbarUC runat="server" ID="navbarUC" />

        <!-- Sidebar -->
        <div class="sidebar">
            <a href="AdminPanel.aspx">Ürün Yönetimi</a>
            <a href="Kategoriler.aspx">Kategoriler</a>
            <a href="Siparisler.aspx">Siparişler</a>
            <a href="Kullanicilar.aspx">Kullanıcılar</a>
            <a href="Raporlar.aspx">Raporlar</a>
            <a href="Ayarlar.aspx">Ayarlar</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container">
            <h2>Yeni Ürün Ekle</h2>
            <div class="form-group">
                <label for="txtUrunAdi">Ürün Adı:</label>
                <asp:TextBox ID="txtUrunAdi" runat="server" CssClass="form-control" placeholder="Ürün adı giriniz"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtFiyat">Fiyat:</label>
                <asp:TextBox ID="txtFiyat" runat="server" CssClass="form-control" placeholder="Fiyat giriniz"></asp:TextBox>
            </div>
                 <div class="form-group">
     <label for="txtFiyat">Fiyat:</label>
     <asp:TextBox ID="txtUrunBilgisi" runat="server" CssClass="form-control" placeholder="Ürün Bilgilerini giriniz"></asp:TextBox>
 </div>
            <div class="form-group">
                <label for="ddlKategori">Kategori Ekle:</label>
                <asp:DropDownList ID="ddlKategori" runat="server" CssClass="form-control">
                    <asp:ListItem Value="0">Kategori seçiniz</asp:ListItem>
                    <asp:ListItem Value="2">Alt Giyim</asp:ListItem>
                    <asp:ListItem Value="1">Üst Giyim</asp:ListItem>
                    <asp:ListItem Value="3">Elbise</asp:ListItem>
                </asp:DropDownList>
            </div>
           
       
        </div>
        </div>



    </form>
</body>
</html>