<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kullanicilar.aspx.cs" Inherits="WebAppBitirmeP.Kullanicilar" %>



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
</head>
<body>
    <form id="form1" runat="server">

        <uc1:navbarUC runat="server" ID="navbarUC" />

        <!-- Sidebar -->
        <div class="sidebar">
            <a href="AdminPanel.aspx">Ürün Yönetimi</a>
            <a href="GelenMail.aspx">Gelen Mailler</a>
            <a href="Siparisler.aspx">Siparişler</a>
            <a href="Kullanicilar.aspx">Kullanıcılar</a>
            <a href="Raporlar.aspx">Raporlar</a>
            <a href="Ayarlar.aspx">Ayarlar</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container">
                <h2>Kayıtlı Kullanıcılar</h2>
                <!-- Kullanıcılar GridView -->
                <asp:GridView ID="gvKullanicilar" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnSelectedIndexChanged="gvKullanicilar_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="KullaniciAdi" HeaderText="Kullanıcı Adı" />
                        <asp:BoundField DataField="MailAdresi" HeaderText="Mail Adresi" />
                        <asp:BoundField DataField="TelefonNo" HeaderText="Telefon Numarası" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </form>
</body>
</html>