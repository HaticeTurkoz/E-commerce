<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hesabim.aspx.cs" Inherits="WebAppBitirmeP.Hesabim" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="navbar.css">
  <link href="hesabim.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-6 text-left">
        <a class="navbar-brand" href="#myPage">                          
            <img alt="Logo" src="/img/sonlogo.png" style="max-height: 100px;" />
</a>
                    </div>
                    <div class="col-xs-6 text-right">
                        <asp:Label ID="lblKullaniciAdi" runat="server" CssClass="navbar-link username-label" Visible="true"></asp:Label>
                        <a class="navbar-link user-icon" href="Hesabim.aspx"><span class="glyphicon glyphicon-user"></span>Hesabım</a>
                        <a class="navbar-link" href="Favorilerim.aspx"><span class="glyphicon glyphicon-heart" title="Favoriler"></span>Favorilerim</a>
                        <a class="navbar-link" href="SepeteGit.aspx"><span class="glyphicon glyphicon-shopping-cart" title="Sepet"></span>Sepete Git</a>
                        <a class="navbar-link logout-link" href="cikis.aspx"><span class="glyphicon glyphicon-log-out"></span>Çıkış</a>
                    </div>
                </div>
                <div class="row">
                    <ul class="nav navbar-nav text-center" style="display: flex; justify-content: center; width: 100%;">
                        <li><a href="UserPanel.aspx">ANASAYFA</a></li>
                        <li><a href="UserPanel.aspx">ÜRÜNLER</a></li>
                        <li><a href="iletisim.aspx">İLETİŞİM</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">KATEGORİLER <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="AltGiyim.aspx">Alt Giyim</a></li>
                                <li><a href="UstGiyim.aspx">Üst Giyim</a></li>
                                <li><a href="elbise.aspx">Elbise</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- My Account Section -->
        <div class="container" style="margin-top: 70px;">
            <h2>Hesabım</h2>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#siparislerim">Siparişlerim</a></li>
                <li><a data-toggle="tab" href="#adreslerim">Adreslerim</a></li>
                <li><a data-toggle="tab" href="#hesapDetaylarim">Hesap Detaylarım</a></li>
            </ul>

            <div class="tab-content">
                <div id="siparislerim" class="tab-pane fade in active">
                    <h3>Siparişlerim</h3>
                    <p>Siparişlerinizi burada görüntüleyebilirsiniz.</p>
                    <!-- Örnek Sipariş Listesi -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Ürün</th>
                                <th>Tarih</th>
                                <th>Durum</th>
                                <th>Detaylar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Ürün A</td>
                                <td>01/01/2024</td>
                                <td>Gönderildi</td>
                                <td><a href="#">Detayları Görüntüle</a></td>
                            </tr>
                            <tr>
                                <td>Ürün B</td>
                                <td>02/01/2024</td>
                                <td>Beklemede</td>
                                <td><a href="#">Detayları Görüntüle</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="adreslerim" class="tab-pane fade">
                    <h3>Adreslerim</h3>
                    <p>Adres bilgilerinizi burada güncelleyebilirsiniz.</p>
                    <div class="form-group">
                        <asp:TextBox ID="txtAdres" runat="server" CssClass="form-control" placeholder="Adres" Required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtSehir" runat="server" CssClass="form-control" placeholder="Şehir" Required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPostaKodu" runat="server" CssClass="form-control" placeholder="Posta Kodu" Required="true"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAdresGuncelle" runat="server" CssClass="btn btn-primary" Text="Adresimi Güncelle" OnClick="btnAdresGuncelle_Click" />
                </div>
                <div id="hesapDetaylarim" class="tab-pane fade">
                                      <h3>Hesap Detaylarım</h3>
                   <p>Hesap bilgilerinizi burada güncelleyebilirsiniz.</p>
                   <div class="form-group">
                       <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" Required="true"></asp:TextBox>
                   </div>
                    <div class="form-group">
    <asp:TextBox ID="txtEskiSifre" runat="server" CssClass="form-control" placeholder="Eski Şifre" TextMode="Password" Required="true"></asp:TextBox>
</div>
                   <div class="form-group">
                       <asp:TextBox ID="txtSifre" runat="server" CssClass="form-control" placeholder="Yeni Şifre" TextMode="Password" Required="true"></asp:TextBox>
                   </div>
                    <div class="form-group">
    <asp:TextBox ID="txtYeniSifreTekrar" runat="server" CssClass="form-control" placeholder="Yeni Şifre Tekrar" TextMode="Password" Required="true"></asp:TextBox>
</div>
                   <asp:Button ID="btnHesapGuncelle" runat="server" CssClass="btn btn-primary" Text="Hesap Bilgilerimi Güncelle" OnClick="btnHesapGuncelle_Click" />
               </div>
           </div>
       </div>


        <!-- Container (Contact Section) -->
<div id="contact" class="container-fluid">
    <p></p>
    <p></p>
    <br/>
    <br />
  <h3 class="text-center">İLETİŞİM</h3>
  <p class="text-center"><em>Bizimle Burdan İletişime Geçebilirsiniz</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>Notunuzu Bırakın</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>İstanbul, Türkiye</p>
      <p><span class="glyphicon glyphicon-phone"></span>Telefon: +00 123456789</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
            <!-- .net toollarına çevrildi-->
         <!-- <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>-->
            <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Name" Required="true"></asp:TextBox>

        </div>
        <div class="col-sm-6 form-group">
         <!-- <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>-->
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" Required="true"></asp:TextBox>

        </div>
      </div>
      <!--<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>-->
        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control" Placeholder="Comment" Rows="5"></asp:TextBox>

      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <!--<button class="btn pull-right" type="submit">Send</button>-->
            <asp:Button ID="btnSend" runat="server" CssClass="btn pull-right" Text="Send" OnClick="btnSend_Click" />

        </div>
      </div>
    </div>
  </div>
  <br>
  <h3 class="text-center">Ortak Kurucular</h3>  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Aliye Koş</a></li>
    <li><a data-toggle="tab" href="#menu1">Ayşe Can</a></li>
    <li><a data-toggle="tab" href="#menu2">Gül Kaçtı</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>Aliye Koş</h2>
      <p>...</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>Ayşe Can</h2>
      <p>...</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2>Gül Kaçtı</h2>
      <p>...</p>
    </div>
  </div>
</div>

<!-- Image of location/map  class="img-responsive-->
<!--<img src="/img/firstpage3.jpg" style="width:100%">-->
        <!-- Container (Contact Section) -->
   




        <footer style="width: 100%; margin: 0; padding: 0; background-color: transparent;">
            <p style="margin: 0; text-align: center;">© 2024 Şirket Adı</p>
            <img src="/img/forfooter.png" alt="Footer Resmi" style="width: 100%; height: auto; display: block;">
            <div style="text-align: center; padding: 10px 0;">
                <h3 style="margin: 0;">Sosyal Medya Hesaplarımız</h3>
                <div style="padding: 10px 0;">
                    <a href="https://www.facebook.com" target="_blank" style="margin: 0 20px;">
                        <img src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png" alt="Facebook" style="width: 40px;">
                    </a>
                    <a href="https://www.twitter.com" target="_blank" style="margin: 0 20px;">
                        <img src="https://img.icons8.com/ios-filled/50/000000/twitter.png" alt="Twitter" style="width: 40px; height: 40px;">
                    </a>
                    <a href="https://www.instagram.com" target="_blank" style="margin: 0 20px;">
                        <img src="https://img.icons8.com/ios-filled/50/000000/instagram-new.png" alt="Instagram" style="width: 40px; height: 40px;">
                    </a>
                    <a href="https://www.linkedin.com" target="_blank" style="margin: 0 20px;">
                        <img src="https://img.icons8.com/ios-filled/50/000000/linkedin.png" alt="LinkedIn" style="width: 40px; height: 40px;">
                    </a>
                </div>
            </div>
        </footer>

        <script>
            $(document).ready(function () {
                // Initialize Tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
                    if (this.hash !== "") {
                        event.preventDefault();
                        var hash = this.hash;
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function () {
                            window.location.hash = hash;
                        });
                    }
                });
            })
        </script>
    </form>
</body>
</html>
