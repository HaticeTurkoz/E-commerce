<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uyelik.aspx.cs" Inherits="WebAppBitirmeP.Uyelik" %>

<%@ Register Src="~/ortakUC.ascx" TagPrefix="uc1" TagName="ortakUC" %>
<%@ Register Src="~/navbarUC.ascx" TagPrefix="uc1" TagName="navbarUC" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="uyelikFormu.css" rel="stylesheet" />
    <uc1:ortakUC runat="server" ID="ortakUC" />
</head>
<body>
    <uc1:navbarUC runat="server" ID="navbarUC" />
    <form id="form1" runat="server">
               <div class="container">
<h1>Üye Ol</h1>
<p>Please fill in this form to create an account.</p>
<hr>
 
    <label for="email"><b>Email</b></label>
 <asp:TextBox ID="txtEmail" placeholder="Enter Email" runat="server"></asp:TextBox>





    <label for="psw"><b>Password</b></label>
 <asp:TextBox ID="txtSifre" placeholder="Enter Password" runat="server"></asp:TextBox>




    <label for="psw-repeat"><b>Repeat Password</b></label>
<asp:TextBox ID="txtSifreTekrari" placeholder="Repeat Password" runat="server"></asp:TextBox>




 
    <div class="clearfix">
<asp:Button ID="BtnIptal" runat="server" class="cancelbtn" Text="Vazgeç" />
<asp:Button ID="BtnKayit" runat="server" class="signupbtn" Text="Kayıt Ol" />
</div>


</div>

    </form>
</body>
</html>
