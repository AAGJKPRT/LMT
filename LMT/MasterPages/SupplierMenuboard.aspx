<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/SupplierMaster.Master"
    AutoEventWireup="true" CodeBehind="SupplierMenuboard.aspx.cs" Inherits="LMT.MasterPages.SupplierMenuboard" %>

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
    <style>
        .widget-content table tr
        {
            line-height: 20px;
        }
        .widget-content table td
        {
            border: none;
            padding: 1px;
        }
        .widget-content table td > span
        {
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
        .widget-content table td > .lnk
        {
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
    </style>
    <style>
        #ContentPlaceHolder1_LabourChart__ParentDiv
        {
            border-style: none !important;
            border-width: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div class="demo-wrapper">
        <div class="row" style="">
            <%--<div class="col-sm-6 col-lg-3" style="width: 30%; float: left;">
                <a href="#" class="widget">
                    <div class="widget-content widget-content-mini themed-background-warning text-light-op">
                        <strong style="font-size: 14px; text-transform: uppercase;">Data Entry</strong>
                    </div>
                    <div class="widget-content text-right clearfix">
                        <div style="text-align: left;">
                            <table width="100%" style="border: none;">
                                <tr>
                                    <td>
                                        <span id="lnkAirlineMst" runat="server">Airline Master</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="lnkAirlineContacts" runat="server">Airline Contacts</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="lnkAirportMst" runat="server">Airport Master</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="lnkAirlineWiseOrgDes" runat="server">Airline Wise Origin & Destination</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="lnkAirlineServiceEntry" runat="server">Airline Service Entry</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="lnkAirlineRatesEntry" runat="server">Airline Rates Entry</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="lnkAirlineSurchargesEntry" runat="server">Airline Surcharges Entry</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </a>
            </div>--%>
        </div>
        <header id="ccr-header">
		<div class="ccr-hbg">			 
			<div class="ccr-slug">
				<div class="container">
                    
                    <div class="row">
                      <div class="col-sm-3 col-md-6 col-lg-2">
                         <div class="panel panel-default">                           
                           <div class="panel-body">
                              <div class="widget-content text-right clearfix">
                                <div style="text-align: left;">
                                    <table width="100%" style="border: none;height: 247px;">
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkNL" runat="server" CssClass="lnk" 
                                                    onclick="lnkNL_Click">Assigned Leads</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkInp" runat="server" CssClass="lnk" 
                                                    onclick="lnkInp_Click">In Process</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkCL" runat="server" CssClass="lnk" onclick="lnkCL_Click">Close Leads</asp:LinkButton>
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
                                                <span id="lnkAssignLeads" runat="server">Assign Leads</span>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                <br />
                                               
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                            </div>
                              
                              
                        </div>
                         </div>
                      </div>

                      <div id="dvLWS" runat="server" visible="true">
                      <div class="col-sm-3 col-md-6 col-lg-3">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Labour Chart</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:PieChart ID="LabourChart" runat="server" ChartHeight="200"
                                ChartWidth="200" ChartTitle="Labour under supplier" ChartTitleColor="#0E426C" style="width: 230px;margin: 0px auto;" Font-Size="18">            
                              </asp:PieChart>
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

                      <div class="col-sm-3 col-md-6 col-lg-2" style="z-index: 99999;float: right;">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Total Labour</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:Label ID="lblTotalLabour" runat="server" style="font-size:20px"></asp:Label>
                              
                           </div>
                        </div>
                      </div>

                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Search Labour</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <table>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlLbrType" ClientIDMode="AutoID" runat="server" 
                                                            CssClass="form-control" AutoPostBack="true" Width="131%" 
                                            onselectedindexchanged="ddlLbrType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                        <asp:Panel ID="dt_example" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="container">
                                                        <div id="demo">
                                                            <asp:Repeater ID="rptLabourInformation" runat="server" ><%--OnDataBinding="rptLabourInformation_DataBinding"
                                                                OnItemCommand="rptLabourInformation_ItemCommand" OnItemDataBound="rptLabourInformation_ItemDataBound">--%>
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 155px;">
                                                                                Labour Name
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                View Profile
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                        <td align="left">
                                                                            <asp:Label ID="lblfullName" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:LinkButton ID="lbtnView" runat="server" Text="View"></asp:LinkButton>
                                                                            <%--<asp:Button ID="btnEdit" runat="server" Text="View"  CommandName="Edit" />--%>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </tbody> </table></FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </asp:Panel>

                                </tr>
                              </table>
                              
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
                                  <h3>
                                  </h3>
                              </h3>
                           </div>
                           <div class="panel-body">
                              
                                                   <asp:Panel ID="Panel2" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div3">
                                                        <div id="Div4">
                                                            <asp:Repeater ID="rptLeadInformation" runat="server" OnDataBinding="rptLeadInformation_DataBinding"
                                                                OnItemCommand="rptLeadInformation_ItemCommand" OnItemDataBound="rptLeadInformation_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour type
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Customer
                                                                            </th>
                                                                            <th align="left" style="width: 130px;">
                                                                                Required Date
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                View
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                        <td align="left">
                                                                            <asp:HiddenField ID="hfLeadID" runat="server" Value='<%#Eval("Lead_ID") %>' />
                                                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Labour_ID") %>' />
                                                                            <asp:Label ID="lblStudentCode" runat="server" Text='<%#Eval("Lbr_Type") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblfullName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblfathernme" runat="server" Text='<%#Eval("Required_Date", "{0:dd/MM/yy}") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnEdit" runat="server" CssClass="edit" CommandName="Edit" />
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
                                  <h3>
                                  </h3>
                              </h3>
                           </div>
                           <div class="panel-body">
                                                  <asp:Panel ID="Panel3" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div5">
                                                        <div id="Div6">
                                                            <asp:Repeater ID="rptIPLeads" runat="server" ><%--OnDataBinding="rptLeadInformation_DataBinding"
                                                                OnItemCommand="rptLeadInformation_ItemCommand" OnItemDataBound="rptLeadInformation_ItemDataBound">--%>
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour type
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Supplier
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Customer
                                                                            </th>
                                                                            <th align="left" style="width: 130px;">
                                                                                Required Date
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                View
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
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
                                  <h3>
                                  </h3>
                              </h3>
                           </div>
                           <div class="panel-body">
                                             <asp:Panel ID="Panel1" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div1">
                                                        <div id="Div2">
                                                            <asp:Repeater ID="rptClosedLeads" runat="server" OnDataBinding="rptClosedLeads_DataBinding"
                                                                OnItemCommand="rptClosedLeads_ItemCommand" OnItemDataBound="rptClosedLeads_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour type
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Supplier
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Customer
                                                                            </th>
                                                                            <th align="left" style="width: 130px;">
                                                                                Required Date
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                View
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
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

                      
                      
					<%--<span>
						<h1 class="element_fade_in">Hi there! We are the new kids on the block <br/>
							and we build awesome websites and mobile apps.</h1>
						</span>
						<button type="button" class="ccr-button btn btn-default element_from_bottom">WORK WITH US!</button>
						<!-- /.ccr-button -->--%>
					</div>
				</div><!-- /.ccr-slug -->
			</div>
        </div><!-- /.ccr-hbg -->
		</header>
        <!--end dashboard-->
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../dashboardmenu/js/scripts.js" type="text/javascript"></script>
</asp:Content>
