<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage2.aspx.cs" Inherits="WebAppBitirmeP.FirstPage2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styleF.css" rel="stylesheet" />
    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
<body>
    <form id="form1" runat="server">
        <nav class=" navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <!--<a class="navbar-brand" href="#">WebSiteName</a>-->
             <a class="navbar-brand" href="#">
                 <img alt="Logo" src="/img/logo.png" style="max-height: 40px;" />

            </a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">Page 1</a></li>
            <li><a href="#">Page 2</a></li>
        </ul>
    <div class="navbar-form navbar-left">
            <div class="input-group">
                <asp:TextBox ID="txtSearch" class="form-control" placeholder="Search" runat="server" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

            </div>
        </div>
         <ul class="nav navbar-nav navbar-right">
            <li><a href="Uyelik.aspx"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="GirisSayfasi.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>
              <img src="/img/firstpage3.jpg"  class="customize-img" />

       <!-- <div> 
<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer> </div>-->
    

    </form>
</body>
</html>

