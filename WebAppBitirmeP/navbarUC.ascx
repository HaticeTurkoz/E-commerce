<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navbarUC.ascx.cs" Inherits="WebAppBitirmeP.navbarUC" %>

     <!-- Navbar -->
     <nav class="navbar navbar-default navbar-fixed-top">
         <div class="container-fluid">
             <div class="navbar-header">
                 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>                        
                 </button>
                 <a class="navbar-brand" href="#myPage">Admin Panel</a>
             </div>
             <div class="collapse navbar-collapse" id="myNavbar">
                 <ul class="nav navbar-nav navbar-right">
                     <li><a href="cikis.aspx"><span class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
                 </ul>
             </div>
         </div>
     </nav>