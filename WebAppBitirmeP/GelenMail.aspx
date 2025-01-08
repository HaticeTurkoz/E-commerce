<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GelenMail.aspx.cs" Inherits="WebAppBitirmeP.GelenMail" %>



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
            <a href="GelenMail.aspx">Gelen Mailler</a>
            <a href="Siparisler.aspx">Siparişler</a>
            <a href="Kullanicilar.aspx">Kullanıcılar</a>
            <a href="Raporlar.aspx">Raporlar</a>
            <a href="Ayarlar.aspx">Ayarlar</a>
        </div>

        <!-- Main Content -->
 <div class="main-content">
    <div class="container">
        <h2>Gelen Mailler</h2>
        <asp:GridView ID="gvGelenMailler" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvGelenMailler_RowCommand" OnSelectedIndexChanged="gvGelenMailler_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="iletisimID" HeaderText="Mail ID" />
                <asp:BoundField DataField="iletisimMail" HeaderText="Gönderen" />
                <asp:BoundField DataField="iletisimMesaji" HeaderText="İçerik" />
                <asp:BoundField DataField="iletisimSaati" HeaderText="Tarih" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnCevapla" runat="server" Text="Cevap Ver" CommandName="Cevapla" CommandArgument='<%# Eval("iletisimID") %>' CssClass="btn btn-primary btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>

<!-- Cevap Verme Alanı -->
<div class="main-content" id="cevapFormu" runat="server"  style="display:none;">
    <div class="container">
        <h3>Mail Cevaplama</h3>
        <asp:HiddenField ID="hfMailID" runat="server" />
        <div class="form-group">
            <label for="txtCevap">Cevabınız:</label>
            <asp:TextBox ID="txtCevap" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="Cevabınızı yazınız"></asp:TextBox>
        </div>
        <asp:Button ID="btnCevapGonder" runat="server" Text="Gönder" CssClass="btn btn-success" OnClick="btnCevapGonder_Click" />
    </div>
</div>



    </form>
</body>
</html>