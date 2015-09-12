<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="AdminMenuboard.aspx.cs" Inherits="LMT.MasterPages.AdminMenuboard" %>

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
        function displayLabour() {
            document.getElementById('divLabourdetails').style.display = 'block';
        }
        function HideLabour() {
            document.getElementById('divLabourdetails').style.display = 'none';
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="demo-wrapper">

        <header id="ccr-header">
		<div class="ccr-hbg">			 
			<div class="ccr-slug">
				<div class="container">
                    
                    <div class="row">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                              <ContentTemplate>
                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">                           
                           <div class="panel-body">
                              <div class="widget-content text-right clearfix">
                                <div style="text-align: left;">
                                    <table width="100%" style="border: none;">
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkNL" runat="server" CssClass="lnk" onclick="lnkNL_Click">New Leads</asp:LinkButton>
                                                <%--<span id="lnkNewLeads" runat="server">New Leads</span>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkInp" runat="server" CssClass="lnk" onclick="lnkInp_Click">In Process</asp:LinkButton>
                                                <%--<span id="lnkInProcess" runat="server">In Process</span>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkCL" runat="server" CssClass="lnk" onclick="lnkCL_Click">Close Leads</asp:LinkButton>
                                                <%--<span id="lnkCloseDeals" runat="server">Close Deals</span>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span id="lnkExpenses" runat="server">Expenses</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span id="lnkPayment" runat="server">Payment</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span id="lnkNotes" runat="server">Notes</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span id="lnkCalender" runat="server">Calender</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span id="lnkTransferLeads" runat="server">Transfer Leads</span>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                            </div>
                              
                              
                        </div>
                         </div>
                      </div>

                      <div id="dvEW" runat="server" visible="true">
                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Expenses Chart</p>
                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                                                  

                              
                           </div>
                        </div>
                      </div>

                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Work Status</p>
                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                              
                              
                              
                           </div>
                        </div>
                      </div>

                      <div class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Search Labour</p>
                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                              
                              
                              
                           </div>
                        </div>
                      </div>
                      </div>
                      <div id="dvNL" runat="server" visible="false">
                        <div class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">New Leads</p>
                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:Panel ID="Panel2" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div3">
                                                        <div id="Div4" style="max-height: 300px; overflow: auto;">
                                                            <asp:Repeater ID="rptLeadInformation" runat="server" OnDataBinding="rptLeadInformation_DataBinding"
                                                                OnItemCommand="rptLeadInformation_ItemCommand" OnItemDataBound="rptLeadInformation_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 125px;">
                                                                              Request Number
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Request owner
                                                                            </th>
                                                                            <th align="left" style="width: 130px;">
                                                                                Required Date
                                                                            </th>
                                                                            <th>
                                                                                Labour Name
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                View
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                Delete
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                        <td align="left">
                                                                            <asp:HiddenField ID="hfLeadID" runat="server" Value='<%#Eval("Lead_ID") %>' />
                                                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Labour_ID") %>' />
                                                                              <asp:HiddenField ID="HiddenField2" runat="server" Value='<%#Eval("UserID") %>' />
                                                                           <asp:HiddenField ID="HiddenField3" runat="server" Value='<%#Eval("SuppilerID") %>' />
                                                                            <asp:Label ID="lblRequestNumber" runat="server" Text='<%#Eval("RequestNumber") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblRequestDate" runat="server" Text='<%#Eval("RequestDate") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <div onmouseover="displayLabour()" onmouseout="HideLabour()">
                                                                                <asp:Label ID="lblLabourName"    runat="server" Text='<%#Eval("LabourName") %>'></asp:Label>
                                                                            </div>
                                                                            
                                                                            <div id="divLabourdetails" style="display:none; position:absolute;">
                                                                                <asp:Image ID="imglabourImage" runat="server" style="width: 100px; height: 100px;" ImageUrl='<%#Eval("LabourImageURL") %>' onerror="this.src='https://raw.githubusercontent.com/AAGJKPRT/LMT/2c35092f42028585b70f35e4f7e9a7acda72a9c9/LMT/images/dummy.jpg'" AlternateText="" />
                                                                                '<%#Eval("Labour_Code") %>' and '<%#Eval("RatesPerDay") %>'
                                                                            </div>
                                                                            
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnEdit" runat="server" CssClass="edit" CommandName="Edit" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnDelete" runat="server" CssClass="delete" CommandName="Delete"
                                                                                OnClientClick="return confirm('Do you want to delete this record ?');" />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </tbody> </table></FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                              
                              
                           </div>
                        </div>
                      </div>
                      </div>
                      <div id="dvInP" runat="server" visible="false">
                        <div class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">In Process Leads</p>                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:Panel ID="Panel3" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div5">
                                                        <div id="Div6">
                                                            <asp:Repeater ID="rptIPLeads" runat="server" OnDataBinding="rptIPLeads_DataBinding"
                                                                OnItemCommand="rptIPLeads_ItemCommand" OnItemDataBound="rptIPLeads_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                             <th align="center" style="width: 100px;">
                                                                                Ticket
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour type
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Supplier
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                               Request owner
                                                                            </th>
                                                                            <th align="left" style="width: 160px;">
                                                                                Required Date
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                View
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                Delete
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                        <td align="center" style="width: 100px;">
                                                                            <asp:Label ID="lblTicket" runat="server" Text='<%#Eval("Ticket") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:HiddenField ID="hfLeadID" runat="server" Value='<%#Eval("Lead_ID") %>' />
                                                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Labour_ID") %>' />
                                                                            <asp:Label ID="lblStudentCode" runat="server" Text='<%#Eval("Lbr_Type") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblSupplier" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblfullName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblfathernme" runat="server" Text='<%#Eval("Required_Date") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnEdit" runat="server" CssClass="edit" CommandName="Edit" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnDelete" runat="server" CssClass="delete" CommandName="Delete"
                                                                                OnClientClick="return confirm('Do you want to delete this record ?');" />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </tbody> </table></FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                   

                              
                           </div>
                        </div>
                      </div>
                      </div>                    
                      <div id="dvCL" runat="server" visible="false">
                        <div class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Close Leads</p>
                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                                <asp:Panel ID="Panel1" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div1">
                                                        <div id="Div2">
                                                            <asp:Repeater ID="rptClosedLeads" runat="server" ><%--OnDataBinding="rptLeadInformation_DataBinding"
                                                                OnItemCommand="rptLeadInformation_ItemCommand" OnItemDataBound="rptLeadInformation_ItemDataBound">--%>
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650px" class="display" id="example" >
                                                                        <thead style="display: block;">
                                                                            <th align="center" style="width: 100px;">
                                                                                Ticket
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour type
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Supplier
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Request owner
                                                                            </th>
                                                                            <th align="left" style="width: 160px;">
                                                                                Required Date
                                                                            </th>
                                                                          <%--  <th style="width: 30px;">
                                                                                View
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                Delete
                                                                            </th>--%>
                                                                        </thead>
                                                                        <tbody style="overflow-y: auto; display: block; height: 300px;">
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                         <td align="center" style="width: 100px;">
                                                                            <asp:Label ID="lblTicket" runat="server" Text='<%#Eval("Ticket") %>'></asp:Label>
                                                                       </td>
                                                                        <td align="left" style="width: 175px;">
                                                                            <asp:HiddenField ID="hfLeadID" runat="server" Value='<%#Eval("Lead_ID") %>' />
                                                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Labour_ID") %>' />
                                                                            <asp:Label ID="lblStudentCode" runat="server" Text='<%#Eval("Lbr_Type") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="width: 175px;">
                                                                            <asp:Label ID="lblSupplier" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="width: 175px;">
                                                                            <asp:Label ID="lblfullName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="width: 175px;">
                                                                            <asp:Label ID="lblfathernme" runat="server" Text='<%#Eval("Required_Date") %>'></asp:Label>
                                                                        </td>
                                                                       <%-- <td align="center">
                                                                            <asp:Button ID="btnEdit" runat="server" CssClass="edit" CommandName="Edit" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnDelete" runat="server" CssClass="delete" CommandName="Delete"
                                                                                OnClientClick="return confirm('Do you want to delete this record ?');" />
                                                                        </td>--%>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </tbody> </table></FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                           </div>
                        </div>
                      </div>
                      </div> 
					</ContentTemplate>
                    </asp:UpdatePanel>
					</div>
                    
				</div><!-- /.ccr-slug -->
			</div>
        </div><!-- /.ccr-hbg -->
		</header>
        <!--end dashboard-->
    </div>
    <script src="../dashboardmenu/js/scripts.js" type="text/javascript"></script>
</asp:Content>
