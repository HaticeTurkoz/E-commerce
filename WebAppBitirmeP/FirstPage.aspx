<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="WebAppBitirmeP.FirstPage" %>

<%@ Register Src="~/ortakUC.ascx" TagPrefix="uc1" TagName="ortakUC" %>
<%@ Register Src="~/navbarUC.ascx" TagPrefix="uc1" TagName="navbarUC" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styleF.css" rel="stylesheet" />
    <uc1:ortakUC runat="server" ID="ortakUC" />
</head>
<body>


    <form id="form1" runat="server">
     
            <uc1:navbarUC runat="server" ID="navbarUC" />
        
              <img src="/img/firstpage.jpg"  class="customize-img" />


    </form>
</body>
</html>
