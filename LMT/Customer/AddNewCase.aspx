<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/CustMaster.Master" AutoEventWireup="true"
    CodeBehind="AddNewCase.aspx.cs" Inherits="LMT.Customer.AddNewCase" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--[if IE]>
	<link rel="stylesheet" type="text/css" href="../css/all-ie-only.css" />
    <![endif]-->
    <%--<link href="../css/dashcss.css" rel="stylesheet" type="text/css" />--%>
    <link href="../css/plugins-dash.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" href="../colorbox.css" />
    <script type="text/javascript" language="javascript" src="../js/PopUpJScript.js"></script>
    <script type="text/javascript" language="javascript" src="../js/jquery.colorbox.js"></script>
    <link href="../css/button.css" rel="stylesheet" type="text/css" />
    <style>
        .widget-content table tr {
            line-height: 20px;
        }

        .widget-content table td {
            border: none;
            padding: 1px;
        }

            .widget-content table td > span {
                width: 96%;
                text-align: center;
                border: 0;
                display: inline-block;
                padding: 5px;
                position: relative;
                background-color: rgb(41,127,184);
                color: rgb(255,255,255);
                text-decoration: none;
                text-transform: uppercase;
                letter-spacing: 1px;
                text-shadow: 0px 1px 0px rgba(0,0,0,0.5);
                -webkit-box-shadow: 0px 2px 2px rgba(0,0,0,0.2);
                box-shadow: 0px 2px 2px rgba(0,0,0,0.2);
                cursor: pointer;
            }

            .widget-content table td > .lnk {
                width: 96%;
                text-align: center;
                border: 0;
                display: inline-block;
                padding: 5px;
                position: relative;
                background-color: rgb(41,127,184);
                color: rgb(255,255,255);
                text-decoration: none;
                text-transform: uppercase;
                letter-spacing: 1px;
                text-shadow: 0px 1px 0px rgba(0,0,0,0.5);
                -webkit-box-shadow: 0px 2px 2px rgba(0,0,0,0.2);
                box-shadow: 0px 2px 2px rgba(0,0,0,0.2);
                cursor: pointer;
            }

            .widget-content table td > span > a {
                color: #fff;
            }
    </style>
    <script type="text/javascript">
        function SaveSuccess() {
            $('#myModal').modal();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="demo-wrapper">
        <header id="ccr-header">
		    <div class="ccr-hbg">			 
			    <div class="ccr-slug" >
				    <div class="container">
                    
                        <div class="row">
                    
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
                     
                         <div class="col-sm-3 col-md-6 col-lg-5">
                             <div class="panel panel-default" style="">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Book New Case</p>
                                      <h3>
                                      </h3>
                                      <h3>
                                      </h3>
                                      <h3>
                                      </h3>
                                      <h3></h3>
                                  </h3>
                               </div>
                               <div class="panel-body">
                                <div class="form-inline form-group inline-inputs">
                                    <div class="form-group" style="margin-bottom: 8px;">
                                        <asp:HiddenField ID="hdfReg_DI" runat="server" Value="0" />
                                        <asp:DropDownList ID="ddlLabourCategory" runat="server" class="form-control" 
                                            style="width: 194px;" 
                                            onselectedindexchanged="ddlLabourCategory_SelectedIndexChanged" AutoPostBack="true" ClientIDMode="AutoID">
                                            <asp:ListItem value="-1">Select Labour Category</asp:ListItem>
                                            <asp:ListItem value="1">Household</asp:ListItem>
                                            <asp:ListItem value="2">Labour for General Business</asp:ListItem>
                                            <asp:ListItem value="3">Industrial Labour</asp:ListItem>                                        
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlLabourType" runat="server" class="form-control" 
                                            style="width: 194px;" AutoPostBack="True" 
                                            onselectedindexchanged="ddlLabourType_SelectedIndexChanged">
                                            <asp:ListItem value="-1">--Select Labour Type--</asp:ListItem>                                        
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-inline form-group inline-inputs">
                                                <div class="form-group" style="width: 92%;" >
                                                    <asp:TextBox ID="txtPickDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                        CssClass="form-control cssTextBox cssTextBox-enabled"  Enabled="False" Style="width:100px;float:left;margin-left: 3px;">
                                                    </asp:TextBox>
                                                    <asp:Image ID="imgBillDueDate"  runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;float: left;margin: 9px 0px 0px 3px;" />
                                                    
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtPickDate"
                                                        PopupButtonID="imgBillDueDate" Format="dd/MM/yyyy" Enabled="true">
                                                    </asp:CalendarExtender>
                                                    <asp:RequiredFieldValidator runat="server" ID="RFVName" ControlToValidate="txtPickDate"
                                                                                    ValidationGroup="HHG"  Display="None" ErrorMessage="Date is required." />
                                                    <asp:DropDownList ID="ddlRequiredTime" runat="server" class="form-control" style="width: 194px; float:right;">
                                                        <asp:ListItem value="Morning (9AM - 12PM)">Morning (9AM - 12PM)</asp:ListItem>
                                                        <asp:ListItem value="Afternoon (12PM - 3PM)">Afternoon (12PM - 3PM)</asp:ListItem>
                                                        <asp:ListItem value="Evening (3PM - 6PM)">Evening (3PM - 6PM)</asp:ListItem>
                                                        <asp:ListItem value="Night (6PM - 9PM)">Night (6PM - 9PM)</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <asp:FileUpload ID="fluLabour" Visible="false" CssClass="form-control" ClientIDMode="AutoID" Style="width: 117px;margin-top:4px;" size="14px" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                    <asp:Label ID="lblFileUpload" Visible="false" runat="server" Height="14px" Style="overflow: hidden; width: 195px;"></asp:Label>
                                                
                                                </div>
                                                
                                                <div class="form-group" style="width:92%;">
                                                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" placeholder="Enter your Address" CssClass="form-control" Columns="45" style="margin-top:4px;resize:none;"></asp:TextBox>
                                                </div>
                                                <div  class="form-group">
                                                     <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                                                     <asp:TextBox ID="txtPincode" runat="server" MaxLength="6" CssClass="form-control" Width="75" placeholder="Pincode" style="width:75px;display:inline;margin-left: 277px;"></asp:TextBox>                         
                                                     <asp:Button ID="Button3" runat="server" Text="Search" Width="30" 
                                                        CssClass="btn btnimg" OnClick="Button3_Click" ClientIDMode="AutoID"></asp:Button>
                                                </div>
                                                <div class="clearfix"></div>
                                                    <div class="form-action-controls form-group" style="margin-top: 5px;">
                                                        <div class="row">                                                            
                                                            <div class="col-md-3">
                                                                <asp:Button ID="btnBookNow" Visible="false" runat="server" Text="Book Now" 
                                                                    CssClass="btn btn-info" data-loading-text="Hold On..."                                                                     
                                                                    ValidationGroup="HHG" onclick="btnBookNow_Click1"></asp:Button>                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div> 
                                    <div>
                                        <div class="form-group" style="width:92%;">                                             
                                            <div id="dvLbr" runat="server" visible="true" 
                                                style="height: 230px; overflow-y: auto;">
                                                <table style="width:99%">
                                                <asp:Repeater ID="rptLabourInformation" runat="server" ondatabinding="rptLabourInformation_DataBinding" 
                                                  onitemdatabound="rptLabourInformation_ItemDataBound"  OnItemCommand="rptLabourInformation_ItemCommand">
                                                         <ItemTemplate> 
                                                <tr>
                                                    <td>
                                                       <asp:HiddenField ID="hfReg_ID" runat="server" Value='<%#Eval("Reg_ID") %>' />
                                                       <asp:Image ID="LabourImageControl" runat="server" ImageUrl='<%#Eval("Image_URL") %>' 
                                                            Style="float:left; height:80px;" class="img-thumbnail" 
                                                            onerror="this.src='https://raw.githubusercontent.com/AAGJKPRT/LMT/2c35092f42028585b70f35e4f7e9a7acda72a9c9/LMT/images/dummy.jpg'"   />
                                                    </td>
                                                    <td>
                                                        <span style="float:left;">
                                                        <asp:Label ID="lblName" Text='<%#Eval("FullName") %>' runat="server" Style="display:inherit;" ></asp:Label><%--<br />--%>
                                                        <asp:Label ID="lblContact" Text="9999999999" runat="server" Style="display:inherit;" ></asp:Label><%--<br />--%>
                                                        <asp:Label ID="lblRating" runat="server" Text="5 Stars" Style="display:inherit;" ></asp:Label>
                                                        </span>
                                                       
                                                    </td> 
                                                    <td>
                                                         <asp:LinkButton ID="link" runat="server" ClientIDMode="AutoID"   CssClass="btn btn-info" data-loading-text="Hold On..." CommandName="BOOK" Text="Book Now" CommandArgument='<%#Eval("Reg_ID") %>'  
                                                          ></asp:LinkButton> 
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                               
                                                </asp:Repeater>
                                                      </table>    
                                            </div>
                                            <div id="dvRNF" runat="server" visible="false">
                                                <div>
                                                    <p style="text-align: center; font-weight: 600; padding-top: 80px;">Record Not Found</p>
                                                </div>
                                            </div>
                                            <div style="display:none" id="PrvNxtbtn" runat="server" visible="false">
                                                <table  style="border: 0px;width: 160px;margin: 0px auto;margin-left: 25%;position: absolute;bottom: 30px;" width="200px">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lbtnPrev" CssClass="prevBtn" runat="server" ClientIDMode="AutoID" ></asp:LinkButton>
                                                        <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                                                        <asp:LinkButton ID="lbtnNext" CssClass="nextBtn" runat="server" ClientIDMode="AutoID" ></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                </table>
                                            </div>                                            
                                            <div class="clearfix"></div>
                                                                                       
                                        </div> 
                                    </div>
                                </div>
                               </div>
                            </div>
                          </div>
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
                       
                          <div class="col-sm-3 col-md-6 col-lg-7">
                             <div class="panel panel-default" style="height:65vh;">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Old Cases</p>
                                      <div style="float:right;">
                                          <asp:LinkButton ID="BtnShowOldCases" runat="server" Text="My Cases" OnClick="BtnShowOldCases_Click"  ></asp:LinkButton>
                                      </div>
                                      <h3>
                                      </h3>
                                      <h3>
                                      </h3>
                                      <h3>
                                      </h3>
                                      <h3></h3>
                                  </h3>
                               </div>
                               <div class="panel-body">
                                
                                
                             <div id="Div1" runat="server" visible="true" style="height:230px; min-height:300px; overflow-y:auto;">
                                                <asp:Repeater ID="rptOldLeads" runat="server"  >
                                                    <HeaderTemplate>
                                                        <table>
                                                            <thead>
                                                                <td align="center">
                                                                   <b>Ticket</b> 
                                                                </td>
                                                                <td align="center">
                                                                   <b> Assgined To</b> 
                                                                </td>
                                                                <td  align="center" >
                                                                   <b> Date</b> 
                                                                </td>
                                                                <td align="center">
                                                                   <b> Time</b> 
                                                                </td>
                                                                <td align="left">
                                                                  <b> Labour Name</b> 
                                                                </td>
                                                            </thead>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                            <tr>
                                                                <td align="center" style="width: 150px;">
                                                                    <asp:HiddenField ID="hfLeadID" runat="server" Value='<%#Eval("Lead_ID") %>' />
                                                      <asp:Label ID="lblTicket" Text='<%#Eval("Ticket") %>' runat="server"></asp:Label>
                                                                </td>
                                                                <td align="center"  style="width: 150px; cursor:pointer;">
                                                      <asp:Label ID="lblSupplierName" Text='<%#Eval("SupplierName") +" ["+Eval("LabourName") +"]" %>' 
                             ToolTip='<%# "Please note: " + Eval("SupplierName")+" is the vendor and "+Eval("LabourName")+" is tagged with him." %>'   runat="server"></asp:Label>
                                                                </td>
                                                                  <td align="center" style="width: 150px;">
                                                      <asp:Label ID="lblRequired_Date" Text='<%#Eval("Required_Date") %>' runat="server"></asp:Label>
                                                                </td>
                                                                 <td align="left" style="width: 200px;">
                                                      <asp:Label ID="lblRequired_Time" Text='<%#Eval("Required_Time")%>' runat="server"></asp:Label>
                                                                </td>
                                                                  <td align="left" style="width: 150px; padding-right:35px;">
                                                      <asp:Label ID="lblLabourName" Text='<%#Eval("LabourName") %>' runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>    
                                            </div>
                               </div>
                            </div>
                          </div>
                    
                        </ContentTemplate>
                       </asp:UpdatePanel>
				    </div><!-- /.ccr-slug -->
			    </div>
            </div><!-- /.ccr-hbg -->
            </div>
		</header>
        <!--end dashboard-->
    </div>

</asp:Content>
