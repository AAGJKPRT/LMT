<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="LMT.index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html;" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Labour Management Tool</title>
    <!--Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <!--MainStyle-->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!--Font-->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/button.css" />
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900'
        rel='stylesheet' type='text/css' />
    <!-- Modernizr /-->
    <script src="js/modernizr-2.6.2.min.js" type="text/javascript"></script>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />--%>
    <link href="css/full-slider.css" rel="stylesheet" type="text/css" />
    <%--    <script type="text/javascript"  language="javascript">
            function pageLoad(sender, args) {
                $(function () {
                    $('#<%# txtSearch.ClientID %>').autocomplete({
                        source: function (request, response) {
                            $.ajax({
                                url: "GetLabour.asmx/GetLabourTypeNames",
                                data: "{'prefix':'" + request.term + "'}",
                                type: "POST",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    response(data.d);
                                },
                                error: function (result) {
                                    alert("Error");
                                }
                            });
                        },
                        minLength: 1
                    });
                });
        }
</script>
    --%>
    <style type="text/css">
        .carousel-fade .carousel-inner .item {
            opacity: 0;
            -webkit-transition-property: opacity;
            transition-property: opacity;
        }

        .carousel-fade .carousel-inner .active {
            opacity: 1;
        }

            .carousel-fade .carousel-inner .active.left, .carousel-fade .carousel-inner .active.right {
                left: 0;
                opacity: 0;
                z-index: 1;
            }

        .carousel-fade .carousel-inner .next.left, .carousel-fade .carousel-inner .prev.right {
            opacity: 1;
        }

        .carousel-fade .carousel-control {
            z-index: 2;
        }
    </style>
    <style type="text/css">
        .info_box {
            width: 165px;
            height: 92px;
            height: 30px; /*background-color: rgba(0,0,0,0.5);*/
            overflow: hidden;
        }

        #bank {
            /*display: none;*/
        }

        #btn_bk {
            /*display: none;*/
        }

        #step-1-img {
            width: 100%;
            max-width: 270px;
            margin: 30px 60px 0;
            display: none;
        }
    </style>
    <script type="text/javascript">
        function LoginPass() {
            $('#Div1').modal();
        }
    </script>

    <script type="text/javascript">
        function SaveSuccess() {
            $('#myModal').modal();
        }
        function onLoginClick() {
            window.location.href = "login.aspx";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:ValidationSummary ShowMessageBox="true" ShowSummary="false" ForeColor="Red"
            runat="server" ID="validationSummary"></asp:ValidationSummary>
        <div>
            <!-- Preloader -->
            <%-- <div class="mask">
            <div id="loader">
            </div>
        </div>--%>
            <!--/Preloader -->
            <!-- Full Page Image Background Carousel Header -->
            <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel" data-interval="6000"
                data-pause="false" style="position: relative; width: 100%; height: 100%; top: 0; left: 0; z-index: 9999;">
                <!-- Wrapper for Slides -->
                <div class="carousel-inner" style="position: absolute;">
                    <div class="item active">
                        <!-- Set the first background image using inline CSS below. -->
                        <div class="fill" style="background-image: url('images/ind_slid1.jpg');">
                        </div>
                    </div>
                    <div class="item">
                        <!-- Set the second background image using inline CSS below. -->
                        <div class="fill" style="background-image: url('images/ind_slid2.jpg');">
                        </div>
                    </div>
                    <div class="item">
                        <!-- Set the third background image using inline CSS below. -->
                        <div class="fill" style="background-image: url('images/ind_slid3.jpg');">
                        </div>
                    </div>
                    <div class="item">
                        <!-- Set the second background image using inline CSS below. -->
                        <div class="fill" style="background-image: url('images/ind_slid4.jpg');">
                        </div>
                    </div>
                </div>
                <section id="ccr-header">
		    <div class="ccr-hbg" style="background: rgba(0,0,0,.2);-webkit-transition: all .5s ease-in-out;-moz-transition: all .5s ease-in-out;transition: all .5s ease-in-out;-o-transition: all .5s ease-in-out;z-index: 1;position: relative;">
			    <div class="container">
				    <div class="ccr-headarea">
					    <div class="col-xs-12 col-md-2">
						    <div class="ccr-logo element_from_left">
							    <a href="#"><img class="img-responsive" alt="logo" src="images/EL_logo.png" width="100" /></a>
						    </div><!-- /.ccr-logo -->
					    </div>
					    <div class="col-xs-12 col-md-10">
						    <div class="ccr-menu">
							    <nav class="navbar navbar-default" role="navigation">
								    <!-- Brand and toggle get grouped for better mobile display -->
								    <div class="navbar-header">
									    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
										    <span class="sr-only">Toggle navigation</span>
										    <span class="icon-bar"></span>
										    <span class="icon-bar"></span>
										    <span class="icon-bar"></span>
									    </button>
								    </div>
								    <!-- Collect the nav links, forms, and other content for toggling -->
								    <div class="collapse navbar-collapse navbar-ex1-collapse  element_from_right">
									    <ul class="nav navbar-nav" style="font-weight: bold;font-size: 19px;">
										    <li><a href="#ccr-header">Home</a></li>
										    <li><a href="#ccr-service">Service</a></li>
										    <li><a href="#ccr-works">How It Works</a></li>
										    <li><a href="#ccr-skill">Pricing & Membership</a></li>										
										    <%--<li><a href="#ccr-about-us">Membership</a></li>--%>
                                            <li><a href="#">Blog</a></li>
                                            <li style="cursor:pointer;" ><a onclick="onLoginClick()">Login</a></li>
                                            <%--<li class="dropdown">
                                                <a href="login.aspx" class="dropdown-toggle" data-toggle="dropdown">
                                                   Login 
                                                  <%-- <b class="caret"></b>--%>
                                             <%--   </a>--%>
                                                <%--<ul class="dropdown-menu">
                                                   <li><a href="login.aspx" target="_new"></a></li>                                               
                                                </ul>--%>
                                              <%-- </li>--%>
                                             <li><a href="#" target="_offer">Offer</a></li>
										    <%--<li><a href="#ccr-touch">Contact</a></li>
                                            <li><a href="#ccr-enquiry">Enquiry</a></li>--%>
									    </ul>
								    </div><!-- /.navbar-collapse -->
							    </nav>
						    </div>
						    <!-- /.ccr-menu -->
					    </div>
				    </div>
				    <!-- /.ccr-headarea -->
			    </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate> 
			    <div class="ccr-slug">
				    <div class="container">                    
                        <div class="row">

                          <%--<div class="col-sm-3 col-md-6 col-lg-4">
                            <img id="step-1-img" src="images/step-1.png" alt="Step-1" style="display: inline;">
                          </div>--%>
                          <div class="col-sm-3 col-md-6 col-lg-4">
                             <div class="panel panel-default" style="height:420px;">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Household</p>                                     
                                     
                                  </h3>
                               </div>
                               <div class="panel-body" style=" position:relative;height: 360px;">
                                    <div id="fancy" runat="server" visible="true">
                                      <div style="float:left;padding-right: 8px;">
                                          <asp:DropDownList ID="ddlLbrType" ClientIDMode="AutoID" Width="200px" runat="server" 
                                              CssClass="form-control">
                                          </asp:DropDownList>
                                               
                                               <asp:HiddenField ID="hfSearchId" runat="server" />
                                      </div>
                                      <div role="form" style="float:left;padding-right: 8px;">
                                        <div class="form-group" style="margin-bottom: 0px;">
                                            <asp:HiddenField ID="hdfReg_DI" runat="server" Value="0" />
                                            <asp:TextBox ID="txtPincode" runat="server" MaxLength="6" CssClass="form-control" Width="75" placeholder="Pincode" style="display:inline;"></asp:TextBox>                         
                                            <asp:Button ID="Button3" runat="server" Text="Search" Width="30" 
                                                CssClass="btn btnimg" onclick="Button3_Click" ClientIDMode="AutoID"></asp:Button>
                                        </div>
                                      </div>
                                      <div id="divDefault" runat="server" visible="true">
                                        <div style="float:left;padding-right: 8px;">
                                           <img src="images/labour_defaultimg.jpg" alt="Labour Image" style="padding-top: 10px; height: 290px; width: 60%;" />
                                        </div>
                                      </div>
                                      <div id="HS_rep" runat="server" visible="false" style="height: 300px; overflow-y: scroll; position: absolute; width: 95%;
                                            margin: 37px 0px 0px -11px;" >
                                      <asp:LinkButton ID="lnkShowDetails" runat="server" onclick="lnkShowDetails_Click">
                                           <table style="width:85%;">
                                               <tbody>
                                            <asp:Repeater ID="rptLabourInformation" runat="server"   ondatabinding="rptLabourInformation_DataBinding" 
                                                  onitemdatabound="rptLabourInformation_ItemDataBound">
                                            <ItemTemplate> 
                                                <tr>
                                                    <td>
                                                       <asp:HiddenField ID="hfReg_ID" runat="server" Value='<%#Eval("Reg_ID") %>' />
                                                       <asp:Image ID="LabourImageControl" runat="server" ImageUrl='<%#Eval("Image_URL") %>' 
                                                                    Height="80px" Width="80px" class="img-thumbnail" style="margin: 3%;margin-left:10%;" />
                                                    </td>
                                                    <td>
                                                        <div style="float:left;">
                                                        <asp:Label ID="lblName" Text='<%#Eval("FullName") %>' runat="server" Style="display:inherit;" ></asp:Label><%--<br />--%>
                                                        <asp:Label ID="lblContact" Text="9999999999" runat="server" Style="display:inherit;" ></asp:Label><%--<br />--%>
                                                        <asp:Label ID="lblRating" runat="server" Text="5 Stars" Style="display:inherit;" ></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            </asp:Repeater>
                                                   </tbody>
                                            </table>
                                     </asp:LinkButton>
                                      </div>
                                      <div id="HS_RecordNF" runat="server" visible="false">
                                        <div>
                                            <p style="text-align: center; font-weight: 600; padding-top: 80px;">Record Not Found</p>
                                        </div>
                                      </div>
                                     <%-- <div id="PrvNxtbtn" runat="server" visible="false">
                                          <table  style="border: 0px;width: 160px;margin: 0px auto;margin-left: 25%;position: absolute;bottom: 30px;" width="200px">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lbtnPrev" CssClass="prevBtn" runat="server" ClientIDMode="AutoID" OnClick="lbtnPrev_Click"></asp:LinkButton>
                                                    <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                                    <asp:LinkButton ID="lbtnNext" CssClass="nextBtn" runat="server" ClientIDMode="AutoID" OnClick="lbtnNext_Click"></asp:LinkButton>
                                                </td>
                                            </tr>
                                          </table>
                                      </div>  --%>
                                      <div style="position: absolute;bottom:0px;">
                                        <%--Show Details &gt;--%>
                                      </div>
                                    </div>
                                                                  
                                    <div id="bank" runat="server" visible="false" class="new-enquiry-form" >
                                        <asp:Label ID="lblFor" runat="server"></asp:Label>
                                        <div class="form-inline form-group">
                                            <label class="lbl-required">Choose your preferred time</label>
                                            <div class="clearfix"></div>
                                            <div class="form-inline form-group inline-inputs">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPickDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                        CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                    </asp:TextBox>
                                                    <asp:Image ID="imgBillDueDate" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />
                                                    
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtPickDate"
                                                        PopupButtonID="imgBillDueDate" Format="dd/MM/yyyy" Enabled="true">
                                                    </asp:CalendarExtender>
                                                    <asp:RequiredFieldValidator runat="server" ID="RFVName" ControlToValidate="txtPickDate"
                                                                                   ValidationGroup="HHG"  Display="None" ErrorMessage="Date is required." />
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlRequiredTime" runat="server" class="form-control" style="width: 194px;">
                                                        <asp:ListItem value="Morning (9AM - 12PM)">Morning (9AM - 12PM)</asp:ListItem>
                                                        <asp:ListItem value="Afternoon (12PM - 3PM)">Afternoon (12PM - 3PM)</asp:ListItem>
                                                        <asp:ListItem value="Evening (3PM - 6PM)">Evening (3PM - 6PM)</asp:ListItem>
                                                        <asp:ListItem value="Night (6PM - 9PM)">Night (6PM - 9PM)</asp:ListItem>
                                                    </asp:DropDownList>
                                                
                                                </div>
                                            </div>
                                            <div class="form-inline form-group inline-inputs">
                                                <label class="lbl-required">Help us with your details</label><div class="clearfix"></div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" class="form-control" placeholder="Your Mobile No."></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtMobileNo"
                                                                                 ValidationGroup="HHG"   Display="None" ErrorMessage="Mobile No. is required." />
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <label id="existing-user-check">
                                                        <asp:CheckBox ID="chkPreUser" runat="server" AutoPostBack="true" ClientIDMode="AutoID" Text="I'm a returning user" 
                                                        oncheckedchanged="chkPreUser_CheckedChanged" />
                                                    </label>
                                                </div>
                                            </div>
                                        
                                            <div id="new-user-details" style="display: block;margin-top: 5px;">
                                                <div class="form-inline form-group inline-inputs">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtFullName" runat="server" class="form-control" placeholder="Your Full Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtFullName"
                                                                                  ValidationGroup="HHG"  Display="None" ErrorMessage="Name is required." />
                                                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Visible="false" class="slimField form-control" placeholder="Password" style="display:block;"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtPassword"
                                                                                  ValidationGroup="HHG"  Display="None" ErrorMessage="Password is required." />
                                                        <asp:LinkButton ID="lnkForgotPassword" runat="server" Visible="false" 
                                                            style="font-size: 11px;display:inline;" onclick="lnkForgotPassword_Click">Forgot password.</asp:LinkButton>
                                                        
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtEmail"
                                                                                  ValidationGroup="HHG"  Display="None" ErrorMessage="Email is required." />
                                                        
                                                    </div>
                                                </div>
                                                <div class="form-inline form-group inline-inputs">
                                                    <div id="address-fields">
                                                        <asp:TextBox ID="txtHouseNo" runat="server" class="form-control" placeholder="House No, Flat No..."></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtHouseNo"
                                                                                  ValidationGroup="HHG"  Display="None" ErrorMessage="Address is required." />
                                                        

                                                        <asp:TextBox ID="txtLocation" runat="server" class="form-control" placeholder="Sector, Locality, Colony..." style="border-right:1px solid #ccc !important;margin-top: 5px;"></asp:TextBox>
                                                        
                                                   
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="form-action-controls form-group" style="margin-top: 5px;">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <p class="weak conditions">
                                                                    <small>
                                                                        <asp:CheckBox ID="chkAgree" runat="server" AutoPostBack="true" ClientIDMode="AutoID" Text="I agree to terms" 
                                                                        oncheckedchanged="chkAgree_CheckedChanged" />
                                                                    </small>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <asp:Button ID="btnBookNow" runat="server" Text="Book Now" 
                                                                    CssClass="btn btn-info" Enabled="false" data-loading-text="Hold On..."                                                                     
                                                                    ValidationGroup="HHG" onclick="btnBookNow_Click"></asp:Button>

                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="Div1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="H1" style="color:Black;">Forgot Password</h4>
                                            </div>
                                            <div class="modal-body">
                                                Enter Your Registered Email ID : <asp:TextBox ID="txtFgEmail" runat="server"></asp:TextBox><br><br>
                                                Your password will be send on your registered email id.
                                            </div>
                                            
                                            <div class="modal-footer">
                                            <asp:Button ID="btnOk" runat="server" Text="OK"  class="btn btn-default"/>
                                            </div>
                                        </div>
                                        </div>
                                      </div>
                                    <div id="btn_bk" runat="server" visible="false" style="position: absolute;bottom:0px;">
                                        <asp:LinkButton ID="lnkBack" runat="server" CausesValidation="false" onclick="lnkBack_Click">&lt; Back</asp:LinkButton>                                        
                                    </div>
                                  
                               </div>
                            </div>
                          </div>

                          

                          <div class="col-sm-3 col-md-6 col-lg-4">
                             <div class="panel panel-default" style="height:420px;">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Labour for General Business</p>
                                     
                                  </h3>
                               </div>
                               <div class="panel-body" style=" position:relative;height: 360px;">
                                  <div id="LGB" runat="server" visible="true">
                                      <div style="float:left;padding-right: 8px;">
                                          <asp:DropDownList ID="ddlLbrTypeLGB" Width="200px" runat="server" 
                                              CssClass="form-control">
                                          </asp:DropDownList>
                                           
                                           <asp:HiddenField ID="hfSearchIdLGB" runat="server" />
                                      </div>
                                      <div role="form" style="float:left;padding-right: 8px;">
                                        <div class="form-group" style="margin-bottom: 0px;">
                                            <asp:HiddenField ID="hdfRegIDLGB" runat="server" Value="0" />
                                            <asp:TextBox ID="txtPincodeLGB" runat="server" MaxLength="6" CssClass="form-control" Width="75" placeholder="Pincode" style="display:inline;"></asp:TextBox>                         
                                            <asp:Button ID="btnSearchLGB" runat="server" Text="Search" Width="30" 
                                                CssClass="btn btnimg"  ClientIDMode="AutoID" 
                                                onclick="btnSearchLGB_Click"></asp:Button>
                                        </div>
                                      </div>
                                      <div id="divDefaultLGB" runat="server" visible="true">
                                        <div style="float:left;padding-right: 8px;">
                                           <img src="images/labour_defaultimg.jpg" alt="Labour Image" style="padding-top: 10px; height: 290px; width: 60%;" />
                                        </div>
                                      </div>
                                      <div id="LGBRep" runat="server" visible="false" style="">
                                        <asp:LinkButton ID="lnkShowDetailsLGB" runat="server" onclick="lnkShowDetailsLGB_Click">
                                          <asp:Repeater ID="rptLGB" runat="server" 
                                                  ondatabinding="rptLGB_DataBinding" 
                                                  onitemdatabound="rptLGB_ItemDataBound">
                                                <ItemTemplate>
                                                <tbody>
                                                    <table border="0" width="150" class="display" id="example" style="width: 200px;margin: 0px auto;">
                                                        <tr>
                                                            <td align="left" style="width: 150px;">
                                                                <asp:HiddenField ID="hfReg_ID" runat="server" Value='<%#Eval("Reg_ID") %>' />
                                                               <asp:Image ID="LabourImageControl" runat="server" ImageUrl='<%#Eval("Image_URL") %>' Height="150px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left:10%;" />
                                                            </td>
                                                        </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tfoot>
                                                        <tr>
                                                            <td>
                                                                Name : <asp:Label ID="lblName" Text='<%#Eval("FullName") %>' runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Contact No. : <asp:Label ID="lblContact" Text="9999123456" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Rating : <asp:Label ID="lblRating" runat="server"></asp:Label> 
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                    </tbody></table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </asp:LinkButton>
                                      </div>
                                      <div id="LGBRecordNF" runat="server" visible="false">
                                        <div>
                                            <p style="text-align: center; font-weight: 600; padding-top: 80px;">Record Not Found</p>
                                        </div>
                                      </div>
                                       <div id="LGBPrevNext" runat="server" visible="false">
                                          <table style="border: 0px;width: 160px;margin: 0px auto;margin-left: 25%;position: absolute;bottom: 30px;" width="200px">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lbtnPrevLGB" CssClass="prevBtn" runat="server" ClientIDMode="AutoID"></asp:LinkButton>
                                                    <asp:Label ID="lblCurrentPageLGB" runat="server"></asp:Label>
                                                    <asp:LinkButton ID="lbtnNextLGB" CssClass="nextBtn" runat="server" ClientIDMode="AutoID"></asp:LinkButton>
                                                </td>
                                            </tr>
                                          </table>
                                      </div>
                                      <div style="position: absolute;bottom:0px;">
                                        <%--Show Details &gt;</asp:LinkButton>--%>
                                      </div>
                                    </div>
                                  <div id="LGBFrm" runat="server" visible="false" class="new-enquiry-form" >
                                    <asp:Label ID="lblForLGB" runat="server"></asp:Label>
                                    <div class="form-inline form-group">
                                        <label class="lbl-required">Choose your preferred time</label>
                                        <div class="clearfix"></div>
                                        <div class="form-inline form-group inline-inputs">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPicDateLGB" runat="server" MaxLength="12"
                                                    CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                </asp:TextBox>
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />
                                                
                                                <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtPicDateLGB"
                                                    PopupButtonID="Image2" Format="dd/MM/yyyy" Enabled="true">
                                                </asp:CalendarExtender>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator14" ControlToValidate="txtPicDateLGB"
                                                                               ValidationGroup="LGB" Display="None" ErrorMessage="Date is required." />
                                                
                                            </div>
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddlRequiredTimeLGB" runat="server" class="form-control" style="width: 194px;">
                                                    <asp:ListItem value="Morning (9AM - 12PM)">Morning (9AM - 12PM)</asp:ListItem>
                                                    <asp:ListItem value="Afternoon (12PM - 3PM)">Afternoon (12PM - 3PM)</asp:ListItem>
                                                    <asp:ListItem value="Evening (3PM - 6PM)">Evening (3PM - 6PM)</asp:ListItem>
                                                    <asp:ListItem value="Night (6PM - 9PM)">Night (6PM - 9PM)</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>
                                        <div class="form-inline form-group inline-inputs">
                                            <label class="lbl-required">Help us with your details</label><div class="clearfix"></div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMobileLGB" runat="server" MaxLength="10" class="form-control" placeholder="Your Mobile No."></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator15" ControlToValidate="txtMobileLGB"
                                                                               ValidationGroup="LGB" Display="None" ErrorMessage="Mobile No. is required." />
                                                
                                            </div>
                                            <div class="form-group">
                                                <label id="Label3">
                                                    <asp:CheckBox ID="chkPreUserLGB" runat="server" AutoPostBack="true" 
                                                    ClientIDMode="AutoID" Text="I'm a returning user" 
                                                    oncheckedchanged="chkPreUserLGB_CheckedChanged"/>
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div id="Div3" style="display: block;margin-top: 5px;">
                                            <div class="form-inline form-group inline-inputs">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtFullNameLGB" runat="server" class="form-control" placeholder="Your Full Name"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator16" ControlToValidate="txtFullNameLGB"
                                                                               ValidationGroup="LGB" Display="None" ErrorMessage="Name is required." />
                                                    <asp:TextBox ID="txtPasswordLGB" runat="server" TextMode="Password" Visible="false" class="slimField form-control" placeholder="Password" style="display:block;"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator17" ControlToValidate="txtPasswordLGB"
                                                                               ValidationGroup="LGB" Display="None" ErrorMessage="Password is required." />
                                                    <asp:LinkButton ID="lnkFPLGB" runat="server" Visible="false" onclick="lnkFPLGB_Click" style="font-size: 11px;display:inline;">Forgot password.</asp:LinkButton>
                                                   
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtEmailLGB" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator18" ControlToValidate="txtEmailLGB"
                                                                               ValidationGroup="LGB" Display="None" ErrorMessage="Email is required." />
                                                    
                                                </div>
                                            </div>
                                            <div class="form-inline form-group inline-inputs">
                                                <div id="Div4">
                                                    <asp:TextBox ID="txtHouseNoLGB" runat="server" class="form-control" placeholder="House No, Flat No..."></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator19" ControlToValidate="txtHouseNoLGB"
                                                                               ValidationGroup="LGB" Display="None" ErrorMessage="Address is required." />
                                                    

                                                    <asp:TextBox ID="txtLocationLGB" runat="server" class="form-control" placeholder="Sector, Locality, Colony..." style="border-right:1px solid #ccc !important;margin-top: 5px;"></asp:TextBox>
                                                    
                                                   
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="form-action-controls form-group" style="margin-top: 5px;">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p class="weak conditions">
                                                                <small>
                                                                    <asp:CheckBox ID="chkAgreeLGB" runat="server" AutoPostBack="true" ClientIDMode="AutoID" Text="I agree to terms" 
                                                                    oncheckedchanged="chkAgreeLGB_CheckedChanged" />
                                                                </small>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:Button ID="btnBookLGB" runat="server" Text="Book Now" 
                                                                CssClass="btn btn-info" Enabled="false" data-loading-text="Hold On..." 
                                                               ValidationGroup="LGB" onclick="btnBookLGB_Click"></asp:Button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                  
                                  </div>
                                  <div id="LGBbtnbk" runat="server" visible="false" style="position: absolute;bottom:0px;">
                                    <asp:LinkButton ID="lnkBackLGB" runat="server"
                                          onclick="lnkBackLGB_Click">&lt; Back</asp:LinkButton>                                        
                                  </div>
                               </div>
                            </div>
                          </div>

                          <div class="col-sm-3 col-md-6 col-lg-4">
                             <div class="panel panel-default" style="height:420px;">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Industrial Labour</p>
                                      
                                  </h3>
                               </div>
                               <div class="panel-body" style=" position:relative;height: 360px;">
                                  <div id="IL" runat="server" visible="true">
                                      <div style="float:left;padding-right: 8px;">
                                          <asp:DropDownList ID="ddlLbrTypeIL" ClientIDMode="AutoID" Width="200px" runat="server" 
                                              CssClass="form-control">
                                          </asp:DropDownList>
                                           
                                           <asp:HiddenField ID="hfSearchIDIL" runat="server" />
                                      </div>
                                      <div role="form" style="float:left;padding-right: 8px;">
                                        <div class="form-group" style="margin-bottom: 0px;">
                                            <asp:HiddenField ID="hfRegIDIL" runat="server" Value="0" />
                                            <asp:TextBox ID="txtPinCodeIL" runat="server" MaxLength="6" CssClass="form-control" Width="75" placeholder="Pincode" style="display:inline;"></asp:TextBox>                         
                                            <asp:Button ID="btnSearchIL" runat="server" Text="Search" Width="30" 
                                                CssClass="btn btnimg"  ClientIDMode="AutoID" 
                                                onclick="btnSearchIL_Click"></asp:Button>
                                        </div>
                                      </div>
                                      <div id="divDefaultIL" runat="server" visible="true">
                                        <div style="float:left;padding-right: 8px;">
                                           <img src="images/labour_defaultimg.jpg" alt="Labour Image" style="padding-top: 10px; height: 290px; width: 60%;" />
                                        </div>
                                      </div>
                                      <div id="ILRep" runat="server" visible="false" style="">
                                        <asp:LinkButton ID="lnkShowDetailsIL" runat="server" onclick="lnkShowDetailsIL_Click">
                                            <asp:Repeater ID="rptIL" runat="server"
                                                      ondatabinding="rptIL_DataBinding" 
                                                      onitemdatabound="rptIL_ItemDataBound">
                                                    <ItemTemplate>
                                                    <tbody>
                                                        <table border="0" width="150" class="display" id="example" style="width: 200px;margin: 0px auto;">
                                                            <tr>
                                                                <td align="left" style="width: 150px;">
                                                                    <asp:HiddenField ID="hfReg_ID" runat="server" Value='<%#Eval("Reg_ID") %>' />
                                                                    <asp:Image ID="LabourImageControl" runat="server" ImageUrl='<%#Eval("Image_URL") %>' Height="150px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left:10%;" />
                                                                </td>
                                                            </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tfoot>
                                                            <tr>
                                                                <td>
                                                                    Name : <asp:Label ID="lblName" Text='<%#Eval("FullName") %>' runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Contact No. : <asp:Label ID="lblContact" Text="9999123456" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Rating : <asp:Label ID="lblRating" runat="server"></asp:Label> 
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                        </tbody></table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                        </asp:LinkButton>
                                      </div>
                                      <div id="ILRecordNF" runat="server" visible="false">
                                        <div>
                                            <p style="text-align: center; font-weight: 600; padding-top: 80px;">Record Not Found</p>
                                        </div>
                                      </div>
                                       <div id="ILPrevNext" runat="server" visible="false">
                                          <table style="border: 0px;width: 160px;margin: 0px auto;margin-left: 25%;position: absolute;bottom: 30px;" width="200px">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lbtnPrevIL" CssClass="prevBtn" runat="server" 
                                                        ClientIDMode="AutoID" onclick="lbtnPrevIL_Click"></asp:LinkButton>
                                                    <asp:Label ID="lblCurrentPageIL" runat="server"></asp:Label>
                                                    <asp:LinkButton ID="IbtnNextIL" CssClass="nextBtn" runat="server" 
                                                        ClientIDMode="AutoID" onclick="IbtnNextIL_Click"></asp:LinkButton>
                                                </td>
                                            </tr>
                                          </table>
                                      </div>
                                      <div style="position: absolute;bottom:0px;">
                                        <%--Show Details &gt;</asp:LinkButton>--%>
                                      </div>
                                    </div>
                                  <div id="ILFrm" runat="server" visible="false" class="new-enquiry-form" >
                                    <asp:Label ID="lblForIL" runat="server"></asp:Label>
                                    <div class="form-inline form-group">
                                        <label class="lbl-required">Choose your preferred time</label>
                                        <div class="clearfix"></div>
                                        <div class="form-inline form-group inline-inputs">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPicDateIL" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                    CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                </asp:TextBox>
                                                <asp:Image ID="imgIL" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />
                                                
                                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtPicDateIL"
                                                    PopupButtonID="imgIL" Format="dd/MM/yyyy" Enabled="true">
                                                </asp:CalendarExtender>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtPicDateIL"
                                                                                ValidationGroup="IL" Display="None" ErrorMessage="Date is required." />
                                                
                                            </div>
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddlRequiredTimeIL" runat="server" class="form-control" style="width: 194px;">
                                                    <asp:ListItem value="Morning (9AM - 12PM)">Morning (9AM - 12PM)</asp:ListItem>
                                                    <asp:ListItem value="Afternoon (12PM - 3PM)">Afternoon (12PM - 3PM)</asp:ListItem>
                                                    <asp:ListItem value="Evening (3PM - 6PM)">Evening (3PM - 6PM)</asp:ListItem>
                                                    <asp:ListItem value="Night (6PM - 9PM)">Night (6PM - 9PM)</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>
                                        <div class="form-inline form-group inline-inputs">
                                            <label class="lbl-required">Help us with your details</label><div class="clearfix"></div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMobileIL" runat="server" MaxLength="10" class="form-control" placeholder="Your Mobile No."></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtMobileIL"
                                                                               ValidationGroup="IL" Display="None" ErrorMessage="Mobile No. is required." />
                                                
                                            </div>
                                            <div class="form-group">
                                                <label id="Label4">
                                                    <asp:CheckBox ID="chkPreUserIL" runat="server" AutoPostBack="true" 
                                                    ClientIDMode="AutoID" Text="I'm a returning user" oncheckedchanged="chkPreUserIL_CheckedChanged" 
                                                     />
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div id="Div8" style="display: block;margin-top: 5px;">
                                            <div class="form-inline form-group inline-inputs">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtFullNameIL" runat="server" class="form-control" placeholder="Your Full Name"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="txtFullNameIL"
                                                                               ValidationGroup="IL" Display="None" ErrorMessage="Name is required." />
                                                    <asp:TextBox ID="txtPasswordIL" runat="server" Visible="false" class="slimField form-control" placeholder="Password" style="display:block;"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtPasswordIL"
                                                                               ValidationGroup="IL" Display="None" ErrorMessage="Password is required." />
                                                    <asp:LinkButton ID="lbtnFPasswordIL" runat="server" Visible="false" style="font-size: 11px;display:inline;">Forgot password.</asp:LinkButton>
                                                   
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtEmailIL" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="txtEmailIL"
                                                                               ValidationGroup="IL" Display="None" ErrorMessage="Email is required." />
                                                    
                                                </div>
                                            </div>
                                            <div class="form-inline form-group inline-inputs">
                                                <div id="Div9">
                                                    <asp:TextBox ID="txtHouseIL" runat="server" class="form-control" placeholder="House No, Flat No..."></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="txtHouseIL"
                                                                               ValidationGroup="IL" Display="None" ErrorMessage="Address is required." />
                                                    

                                                    <asp:TextBox ID="txtLocationIL" runat="server" class="form-control" placeholder="Sector, Locality, Colony..." style="border-right:1px solid #ccc !important;margin-top: 5px;"></asp:TextBox>
                                                    
                                                   
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="form-action-controls form-group" style="margin-top: 5px;">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p class="weak conditions">
                                                                <small>
                                                                    <asp:CheckBox ID="chkAgreeIL" runat="server" AutoPostBack="true" 
                                                                    ClientIDMode="AutoID" Text="I agree to terms" 
                                                                    oncheckedchanged="chkAgreeIL_CheckedChanged"/>
                                                                </small>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:Button ID="btnBookNowIL" runat="server" Text="Book Now" 
                                                                CssClass="btn btn-info" Enabled="false" data-loading-text="Hold On..." onclick="btnBookNowIL_Click" 
                                                               ValidationGroup="IL" ></asp:Button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                                  <div id="ILbtnbk" runat="server" visible="false" style="position: absolute;bottom:0px;">
                                    <asp:LinkButton ID="lnkBackIL" runat="server" CausesValidation="false" 
                                          onclick="lnkBackIL_Click">&lt; Back</asp:LinkButton>                                        
                                  </div>
                               </div>
                            </div>
                          </div>

                          <!-- Modal Popup-->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel" style="color:Black;">Success</h4>
                                    </div>
                                    <div class="modal-body">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    </div>
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                                            
                                    </div>
                                </div>
                                </div>
                            </div>
                      
					    <%--<span>
						    <h1 class="element_fade_in">Hi there! We are the new kids on the block <br/>
							    and we build awesome websites and mobile apps.</h1>
						    </span>
						    <button type="button" class="ccr-button btn btn-default element_from_bottom">WORK WITH US!</button>
						    <!-- /.ccr-button -->--%>
					    </div>
				    </div><!-- /.ccr-slug -->
			    </div>
        </ContentTemplate>
        
        </asp:UpdatePanel>
            </div>
            <!-- /.ccr-hbg -->
            </section>
            </div>
            <!-- /#ccr-header -->
            <!-- /header -->
            <section id="ccr-service">
			<div class="ccr-service-bg">
				<div class="container">
					<div class="ccr-title element_from_right">
						<h1 class="element_from_top">SERVICES WE PROVIDE</h1>
						<div class="ccr-line"></div>
						<!-- /.ccr-line -->
						<div class="ccr-service-slug make-it-appear-left animated fadeInLeft">
							<h4>We classified our services into three sectors 
							</h4>
						</div>
					</div>
					<!-- /.ccr-title -->
					<!-- /.ccr-service-slug -->
					<div class="ccr-item element_from_top">
						<div class="col-xs-12 col-sm-4 element_from_left">
						<div class="ccr-first-item">
								<img class="img-responsive" src="images/Household.png" alt="">
								<h3>Household Sector</h3>
								<p>We cover all services related to labour work like Electrician, Plumber, Carpenter, Locksmith, RO Repair services, Crown-modelling, drivers, Building and construction services, Maid services, Security etc. </p>
							</div>
							<!-- /.ccr-first-item -->
						</div>	
						<div class="col-xs-12 col-sm-4 element_from_left">
							<div class="ccr-second-iteam">
								<img class="img-responsive" src="images/Microbusiness.PNG" alt="">
								<h3>Micro business Sector</h3>
								<p>We provide workers/labours to companies/firms or making contract with them. There are so many Services like packers, movers, field workers, computer operator, security guard, leather workers, barber, loaders and machine operator etc. </p>
							</div>
						</div>
						<div class="col-xs-12 col-sm-4 element_from_right">
							<div class="ccr-third-iteam">
								<img class="img-responsive" src="images/Indusrtrial.PNG" alt="">
								<h3>Industrial Sector</h3>
								<p>There are so many industries in India, in which millions of companies are exist. Every companies has their different requirements like machine operator, security, production workers etc. Apart from this, we search workers/technician as per there requirement to provide them.  </p>
							</div>
						</div>
						<%--<div class="col-xs-12 col-sm-3 element_from_right">
							<div class="ccr-fourth-iteam">
								<img class="img-responsive" src="images/rocket.png" alt="">
								<h3>Rocket Science</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur explicabo commodi </p>
							</div>
						</div>--%>
					</div>
					<!-- /.ccr-item -->
				</div>
			</div>
			<!-- /.ccr-service-bg -->
		</section>
            <!-- /#ccr-service -->
            <section id="ccr-works">
            <div class="ccr-works-bg" style="position: relative;">
                <div class="container">
                    <div class="ccr-works-title element_fade_in">
                        <img class="img-responsive" src="images/howdo_wework.png" alt="">
                        <%--<h1>How It Works</h1>
                        <div class="ccr-line"></div>
                        <!-- /.ccr-line -->
						<div class="ccr-works-slug">
							<p>We are a small team of designers and developers, who help brands with big ideas.
							</p>
						</div>--%><!-- /.ccr-works-slug -->
                    </div>
                </div>
            </div>
        </section>
            <!-- /#ccr-works -->
            <%--<section id="ccr-team">
			<div class="ccr-team-bg" style="position: relative;">
				<div class="container">
					<div class="ccr-team-title element_fade_in">
						<h1>MEET OUR BEAUTIFUL TEAM</h1>
						<div class="ccr-line"></div>
						<!-- /.ccr-line -->
						<div class="ccr-team-slug">
							<p>We are a small team of designers and developers, who help brands with big ideas.
							</p>
						</div><!-- /.ccr-team-slug -->
					</div><!-- /.ccr-team-title -->
					<div class="ccr-team-item element_from_top">
						<div class="col-xs-12 col-sm-3 ccr-first-team element_from_left">
							<img class="img-responsive" src="images/author.jpg" alt="">
							<h3>ANNE HATHAWAY</h3>
							<p class="designation">CEO / Marketing Guru</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur explicabo commodi </p>
							<div class="ccr-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-linkedin"></i></a>
								<a href="#"><i class="fa fa-envelope"></i></a>
							</div>
							<!-- /.ccr-social -->
						</div>	
						<div class="col-xs-12 col-sm-3 ccr-second-team element_from_left">
							<img class="img-responsive" src="images/author.jpg" alt="">
							<h3>Kate Upton</h3>
							<p class="designation">Creative director</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur explicabo commodi </p>
							<div class="ccr-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-linkedin"></i></a>
								<a href="#"><i class="fa fa-envelope"></i></a>
							</div>
							<!-- /.ccr-social -->
						</div>
						<div class="col-xs-12 col-sm-3 ccr-third-team element_from_right">
							<img class="img-responsive" src="images/author.jpg" alt="">
							<h3>Olivia Wilde</h3>
							<p class="designation">Lead Designer</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur explicabo commodi </p>
							<div class="ccr-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-linkedin"></i></a>
								<a href="#"><i class="fa fa-envelope"></i></a>
							</div>
							<!-- /.ccr-social -->
						</div>
						<div class="col-xs-12 col-sm-3 ccr-fourth-team element_from_right">
							<img class="img-responsive" src="images/author.jpg" alt="">
							<h3>Ashley Greene</h3>
							<p class="designation">SEO / Developer</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur explicabo commodi </p>
							<div class="ccr-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-linkedin"></i></a>
								<a href="#"><i class="fa fa-envelope"></i></a>
							</div>
							<!-- /.ccr-social -->
						</div>
					</div>
					<!-- /.ccr-team-item -->
				</div>
			</div>	    <!-- /.ccr-item-bg -->
		</section>--%>
            <!-- /.ccr-item -->

            <div class="ccr-skill-bg">
                <div class="container">
                    <%--	<div class="ccr-skill-title element_from_top">
						<h1>WE GOT SKILLS</h1>
						<div class="ccr-line"></div>
						<!-- /.ccr-line -->
						<div class="ccr-skill-slug element_from_bottom">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, animi similique doloribus doloremque quibusdam quaerat<br/>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit, alias.
							</p>
						</div> <!-- /.ccr-skill-slug -->
					</div> <!-- /.ccr-skill-title -->--%>
                    <section id="ccr-skill">
					<div class="ccr-skill-item ">
						<div class="col-xs-12 col-sm-6 ccr-first-skill element_from_right">
                            <img class="img-responsive"  src="images/Pricing.PNG" />
						<%--	<div class="tw-circle-chart" data-color="#30bae7" data-padding="5px" data-percent="90">90%</div>
							<h3>Lorem ipsum dolor.</h3>--%>
						</div>	<!-- /.ccr-first-skill -->
						<div class="col-xs-12 col-sm-6 ccr-second-skill element_from_right">
                            <h3>Pricing and membership</h3>
                            <p>Pricing is the most important thing meant to everyone, they may be workers, services provider, customers or companies. Everyone needs good service with satisfaction, but in respect of workers they need a proper value to their work in which can run their livelihood and Service providers need an income so that they can give best services for life long with new innovations to their services.</p>
							<div style="text-align: left;">
                            <h3>FOR HOUSE HOLD</h3>
                            <p>RS 100 PER HOUR<br />
                                RS.800 FOR WORKING HOUR</p>
                                  <h3>MICRO BUSINESS</h3>
                            <p>As per Industry Standard</p>
                                 <h3>FOR INDUSTRIAL</h3>
                            <p>As per Industry Standard</p>
                                  <br />
                                <p style="color: red; font-size: smaller;">
                                    In Membership, we provide various schemes and discount to the customer and companies, which will be decided on meetings.
                                </p>
							</div>
                            <%--<div class="tw-circle-chart" data-color="#d74680" data-percent="75">75%</div>
							--%>
						</div> <!-- /.ccr-second-skill -->
						<%--<div class="col-xs-12 col-sm-3 ccr-third-skill element_from_left">
							<div class="tw-circle-chart" data-color="#15c7a8" data-percent="70">70%</div>
							<h3>Lorem ipsum dolor sit amet, consectetur.</h3>
						</div><!-- /.ccr-third-skill -->
						<div class="col-xs-12 col-sm-3 ccr-fourth-skill element_from_left">
							<div class="tw-circle-chart" data-color="#eb7d4b" data-percent="85">85%</div>
							<h3>Lorem ipsum dolor.</h3>
						</div><!-- /.ccr-fourth-skill -->--%>
					</div>
					<!-- /.ccr-skill-item -->
                           </section>
                </div>
            </div>
            <!-- /#ccr-skill-bg -->

            <!-- /#ccr-skill -->
            <%--<section id="ccr-about-us">
			<div class="ccr-about-us-bg">
				<div class="container">
					<div class="ccr-about-us-title element_from_right">
						<h1>WHAT POEPLE SAY ABOUT US</h1>
						<div class="ccr-line"></div>
						<!-- /.ccr-line -->
					</div>
					<!-- /.ccr-about-us-title -->
					<div class="ccr-about-us-slug element_from_left">
						<p>Our clients love us!</p>
					</div>
					<!-- /.ccr-about-us-slug -->
					<div class="ccr-us-item">
						<div class="col-xs-12 col-sm-6 ccr-us-first-item element_from_left">
							<img class="pull-left" src="images/author.jpg" alt="">
							<span>“Nullam dapibus blandit orci, viverra gravida dui lobortis eget. Maecenas fringilla urna eu nisl scelerisque.”</span>
							<div class="ccr-designation">
								<h3>Chanel Iman</h3>
								<p>CEO of Pinterest</p>
							</div>
							<!-- /.ccr-designation -->
						</div>
						<div class="col-xs-12 col-sm-6 ccr-us-second-item element_from_right">
							<img class="pull-left" src="images/author.jpg" alt="">
							<span>“Nullam dapibus blandit orci, viverra gravida dui lobortis eget. Maecenas fringilla urna eu nisl scelerisque.”</span>
							<div class="ccr-designation">
								<h3>Chanel Iman</h3>
								<p>CEO of Pinterest</p>
							</div>
							<!-- /.ccr-designation -->
						</div>
						<div class="col-xs-12 col-sm-6 ccr-us-third-item element_from_left">
							<img class="pull-left" src="images/author.jpg" alt="">
							<span>“Nullam dapibus blandit orci, viverra gravida dui lobortis eget. Maecenas fringilla urna eu nisl scelerisque.”</span>
							<div class="ccr-designation">
								<h3>Chanel Iman</h3>
								<p>CEO of Pinterest</p>
							</div>
							<!-- /.ccr-designation -->
						</div>
						<div class="col-xs-12 col-sm-6 ccr-us-fourth-item element_from_right">
							<img class="pull-left" src="images/author.jpg" alt="">
							<span>“Nullam dapibus blandit orci, viverra gravida dui lobortis eget. Maecenas fringilla urna eu nisl scelerisque.”>
							<div class="ccr-designation">
								<h3>Chanel Iman</h3>
								<p>CEO of Pinterest</p>
							</div>
							<!-- /.ccr-designation -->
						</div>
					</div>
					<!-- /.ccr-us-item -->	
				</div>	
			</div>	<!-- /#ccr-about-us -->
		</section>--%>
            <section id="ccr-touch">
			<div class="ccr-touch-bg">
				<div class="container">
					<div class="ccr-touch-title element_from_top">
						<h2>GET IN TOUCH</h2>
						<div class="ccr-line"></div>
						<!-- /.ccr-line -->
					</div>
					<!-- /.ccr-touch-title -->
					<span class="ccr-touch-slug">1600 Pennsylvania Ave NW, Washington, DC 20500, United States of America. Tel: (202) 456-1111</span>
					<div class="ccr-touch-form col-xs-12 col-sm-12">
						<div class="input-group col-xs-12 col-sm-6 element_from_left">
							<input type="text" class="form-control" placeholder="* Your Name">
						</div>

						<div class="input-group col-xs-12 col-sm-6 element_from_right">
							<input type="text" class="form-control" placeholder="* Your Email">
						</div>
						<div class="input-group col-xs-12 col-sm-12 element_from_bottom">
							<textarea name="msg" rows="6" placeholder="* Your Massage"></textarea>
						</div>
					</div>
					<!-- /.ccr-touch-form -->
					<button type="button" class="ccr-button btn btn-default">SEND MESSAGE</button>
				</div>			
			</div>  	<!-- /#ccr-touch bg-->
		</section>
            <!-- /ccr touch section -->
            <section id="ccr-enquiry">
            <%--<div class="ccr-enquiry-bg">
				<div class="container">
					<div class="ccr-enquiry-title element_fade_in">
						<h1>Need help with home services?</h1>
						<div class="ccr-line"></div>
						<!-- /.ccr-line -->
						<div class="ccr-enquiry-slug">
							<p>We are a small team of designers and developers, who help brands with big ideas.
							</p>
						</div><!-- /.ccr-team-slug -->
					</div><!-- /.ccr-team-title -->
                    
                    
                 </div>
             </div>--%>   <!-- /#ccr-enquiry bg-->
        </section>
            <!-- /ccr enquiry section-->
            <footer id="ccr-footer">
			<%--<div class="ccr-footer-bg">
				<ul class="ccr-footer-menu">
					<li><a href="#">Facebook</a></li>
                    <li><a href="#">Linkedin</a></li>
					<li><a href="#">Behance</a></li>
					<li><a href="#">Dribbble</a></li>
				</ul>
			</div>--%>
			<!-- /#ccr-footer -->
		</footer>
            <!-- /footer -->
            <a href="#ccr-header" id="ccr-back-top" title="Back to Top" style="display: inline;">Back to Top</a>
            <!--========================================end===========================-->
            <!--js library-->
            <script src="http://code.jquery.com/jquery-1.10.1.min.js" type="text/javascript"></script>
            <!--Isotop library-->
            <script src="js/jquery.isotope.min.js" type="text/javascript"></script>
            <!--Bootstrap JS-->
            <script src="js/bootstrap.min.js" type="text/javascript"></script>
            <!-- Main Javascript File -->
            <script src="js/main.js" type="text/javascript"></script>
            <!-- jQuery -->
            <%--<script>
            $('#btn_Show').click(function (e) {
                $('#fancy, #btn_Show').fadeOut('slow', function () {
                    $('#bank, #btn_bk').fadeIn('slow');
                });
            });

            $('#btn_bk').click(function (e) {
                $('#bank, #btn_bk').fadeOut('slow', function () {
                    $('#fancy, #btn_Show').fadeIn('slow');
                });
            });

        </script>--%>
            <!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
  chromium.org/developers/how-tos/chrome-frame-getting-started -->
            <!--[if lt IE 7 ]>
  <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
  <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->
        </div>
    </form>
</body>
</html>
