<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LMT.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<!--<![endif]-->
<head runat="server">
    <title>Labour Management Tool</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link href="css/loginstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        window.history.forward(1);
        document.attachEvent("onkeydown", my_onkeydown_handler);
        function my_onkeydown_handler() {
            switch (event.keyCode) {
                case 116: // F5;
                    event.returnValue = false;
                    event.keyCode = 0;
                    window.status = "We have disabled F5";
                    break;
            }
        }
    </script>
    <script type="text/javascript">
        function LoginPass() {
            $('#myModal').modal();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnLogin">
        <div>
            <div class="container">
                <div class="login">
                    <h1>Login to LMT App</h1>
                    <p>
                        <span>Username or email</span><br />
                        <asp:TextBox ID="txtUsername" runat="server" TabIndex="1" autocomplete="off" placeholder="User Name" MaxLength="25"></asp:TextBox>
                    </p>
                    <p>
                        <span>Password</span><br />
                        <asp:TextBox ID="txtPassword" runat="server" TabIndex="2" autocomplete="off" TextMode="Password" placeholder="Password"
                            MaxLength="20"></asp:TextBox>
                    </p>
                    <p class="submit">
                        <asp:LinkButton ID="lnkForgotPassword" runat="server" CssClass="fgp" TabIndex="5"
                            OnClick="lnkForgotPassword_Click">Forgot Password ?</asp:LinkButton>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" TabIndex="3"
                            OnClick="btnLogin_Click" />
                    </p>
                    <p class="submit">
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" TabIndex="4"
                            OnClick="btnSignUp_Click" />
                    </p>

                </div>
                <div class="login-help">
                    <p>
                        Copyright &#169; <a href="index.aspx" style="text-decoration: none;">Labour Management Tool Version 1.0.1.1.</a> All Rights Reserved.
                   
                    </p>
                </div>

                <!-- Modal Popup-->
                <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel" style="color: Black;">Forgot Password</h4>
                            </div>
                            <div class="modal-body">
                                Enter Your Registered Email ID :
                               
                                <asp:TextBox ID="txtFgEmail" runat="server"></asp:TextBox><br>
                                <br>
                                Your password will be send on your registered email id.
                           
                            </div>

                            <div class="modal-footer">
                                <asp:Button ID="btnOk" runat="server" Text="OK" class="btn btn-default" OnClick="btnOk_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--js library-->
            <script src="http://code.jquery.com/jquery-1.10.1.min.js" type="text/javascript"></script>
            <!--Isotop library-->
            <script src="js/jquery.isotope.min.js" type="text/javascript"></script>
            <!--Bootstrap JS-->
            <script src="js/bootstrap.min.js" type="text/javascript"></script>
            <!-- Main Javascript File -->
            <script src="js/main.js" type="text/javascript"></script>
        </div>
    </form>
</body>
</html>
