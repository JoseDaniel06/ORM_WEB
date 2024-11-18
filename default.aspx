<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ORMWeb._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ORM Web - Login</title>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <!-- <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css"/> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />

    <link href="Content/LoginFormElements.css" rel="stylesheet" />
    <link href="Content/EstilosLogin.css" rel="stylesheet" />

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 3 -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function ShowPopup() {
            $('#myModal').modal('show');
        }
    </script>  
</head>
<body>
    <!-- Modal Popup -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-danger" role="document">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ff3547; box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12); border: 0; color: #fff;">
                    <button type="button" class="close" data-dismiss="modal" style="color: #fff;  opacity: 1.0;">
                        &times;</button>
                    <h4 class="modal-title" style="text-align:left">
                        <asp:Label ID="lblTitle" runat="server" />
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row vertical-align">
                        <div class="col-sm-3">
                            <p></p>
                            <p class="text-center">
                                <i class="fas fa-times fa-5x"></i>
                            </p>
                        </div>

                        <div class="col-sm-9">
                            <strong><asp:Label ID="lblMessage" runat="server" style="font-size:20px;" /></strong>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>

    <div class="login-background">
        <div class="top-content">
            <div class="inner-bg" style="padding-top: 50px;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <div class="description">
                                <img src="img/ORM-2017v2.png" style="height: 180px;" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Bienvenido a</h3>
                                    <h2 style="color: #fff;"><strong>ORM Web <asp:Label ID="lblVersion" runat="server" Text=""></asp:Label></strong></h2>
                                    <p style="font-size: 20px;">Data discovery and analytics platform.</p>
                                </div>
                                <div class="form-top-right">
                                    <img src="img/Usuario.png" style="padding-top: 25px;" />
                                </div>
                            </div>
                            <div class="form-center">
                                <form role="form" action="" method="post" class="login-form" runat="server">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon" style="border-top-width: 0px; border-bottom-width: 0px;">
                                                <i class="fas fa-user"></i>
                                            </span>
                                            <label class="sr-only" for="form-username">Usuario</label>
                                            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario..." CssClass="form-username form-control" autofocus="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon" style="border-top-width: 0px; border-bottom-width: 0px;">
                                                <i class="fas fa-unlock"></i>
                                            </span>
                                            <label class="sr-only" for="form-password">Contraseña</label>
                                            <asp:TextBox ID="txtClave" type="password" runat="server" placeholder="Contraseña..." CssClass="form-password form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <button id="btnLogin" runat="server" onserverclick="btnLogin_Click" type="submit" class="btn"><i class="fas fa-check"></i>&ensp;Ingresar</button>
                                    <!-- <div style="text-align:center; padding-top:10px">
                                        <a href="#" style="color:#fff;">&iquest;Has olvidado tu contraseña?</a>
                                    </div>-->

                                </form>
                            </div>
                            <div class="form-bottom">
                                <div class="form-bottom-left">
                                    <p style="margin-bottom: 0px;height: 20px;">ORM &copy; 2011 - <asp:Label ID="lblAño" runat="server" Text=""></asp:Label>  Reservados todos los derechos.</p>
                                     <a href="http://optima.net.co" target="_blank"><p style="margin-bottom: 0px;font-size: 10px">Optima Corporation</p></a>
                                </div>
                                <div class="form-bottom-right">
                                    <a href="http://optima.net.co" target="_blank">
                                        <img src="img/OPT-Corp.-blanco-peq.png" style="height: 60px;" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</body>
</html>