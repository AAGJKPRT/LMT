<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/Site.Master" AutoEventWireup="true"
    CodeBehind="MenuBoard.aspx.cs" Inherits="LMT.MasterPages.MenuBoard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--[if IE]>
	<link rel="stylesheet" type="text/css" href="../css/all-ie-only.css" />
    <![endif]-->
    <%--<link href="../css/dashcss.css" rel="stylesheet" type="text/css" />--%>
    <link href="../css/plugins-dash.css" rel="stylesheet" type="text/css" />
    <%--<link rel="Stylesheet" href="../colorbox.css" />
    <script type="text/javascript" language="javascript" src="../js/PopUpJScript.js"></script>
    <script type="text/javascript" language="javascript" src="../js/jquery.colorbox.js"></script>--%>
    <link href="../css/button.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function LoginPass() {
            $('#myModal').modal();
        }        
    </script>
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
        .widget-content table td > span > a
        {
            color: #fff;
        }
    </style>
    <script type="text/javascript">
        function AddExpForm() {
            $('#DvExpForm').modal();
        }
        function AddPayRecieveForm() {
            $('#DvPayRecieve').modal();
        }
        function AddPayMadeForm() {
            $('#DvPayMade').modal();
        }        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                                <asp:LinkButton ID="lnkNL" runat="server" CssClass="lnk" 
                                                    onclick="lnkNL_Click">New Leads</asp:LinkButton>
                                                <%--<span id="lnkNewLeads" runat="server">New Leads</span>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkInp" runat="server" CssClass="lnk" 
                                                    onclick="lnkInp_Click">In Process</asp:LinkButton>
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
                                                <%--<span id="lnkExpenses" runat="server">Expenses</span>--%>
                                                <asp:LinkButton ID="lnkExpenses" runat="server" CssClass="lnk" onclick="lnkExpenses_Click">Expenses</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkPaymentRecieve" runat="server" CssClass="lnk" onclick="lnkPaymentRecieve_Click">Payment Recieve</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkPaymentMade" runat="server" CssClass="lnk" onclick="lnkPaymentMade_Click">Payment Made</asp:LinkButton>
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
                                            <asp:LinkButton ID="lnkTransferLeads" runat="server" CssClass="lnk" 
                                                    onclick="lnkTransferLeads_Click">Transfer Leads</asp:LinkButton>
                                                <%--<span id="lnkTransferLeads" runat="server">Transfer Leads</span>--%>
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
                                                                            <asp:Label ID="lblStudentCode" runat="server" Text='<%#Eval("Lbr_Type") %>'></asp:Label>
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
                      <div id="dvExp" runat="server" visible="false" class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Expenses</p>                                
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:Panel ID="panelExp" runat="server" Width="97%" Style="margin-top: 5px;">
                                    <div id="Div7">
                                        <div id="Div8">
                                            <table style="border: 0px;width:100%;margin:0px auto;" >     
                                                <tr>
                                                    <td align="left">
                                                        Date: 
                                                        <asp:TextBox ID="txtPickDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                        CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                        </asp:TextBox>
                                                        <asp:Image ID="imgBillDueDate" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />
                                                    
                                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtPickDate"
                                                            PopupButtonID="imgBillDueDate" Format="dd/MM/yyyy" Enabled="true">
                                                        </asp:CalendarExtender>
                                                    </td>
                                                    <td align="right">
                                                        <%--<asp:Button ID="btnAddExpense" runat="server" Text="Add New Expenses"></asp:Button>--%>
                                                        <asp:Button ID="btnAddExpense" runat="server" onclick="btnAddExpense_Click" Text="Add New Expenses" 
                                                          CssClass="btn btn-info" data-loading-text="Hold On..."></asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Repeater ID="rptExpense" runat="server" OnDataBinding="rptExpense_DataBinding"
                                                OnItemCommand="rptExpense_ItemCommand" OnItemDataBound="rptExpense_ItemDataBound">
                                                <HeaderTemplate>
                                                    <table border="0" width="650" class="display" id="example">
                                                        <thead>
                                                            <th align="left" style="width: 175px;">
                                                                Date
                                                            </th>
                                                            <th align="left" style="width: 175px;">
                                                                Particular Expense
                                                            </th>
                                                            <th align="left" style="width: 130px;">
                                                                Amount
                                                            </th>
                                                            <th style="width: 30px;">
                                                                To Whom
                                                            </th>
                                                            <th style="width: 30px;">
                                                                Comes Under head of 
                                                            </th>
                                                            <th style="width: 30px;">
                                                                Edit 
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
                                                            <asp:HiddenField ID="hfExpID" runat="server" Value='<%#Eval("Exp_ID") %>' />
                                                            
                                                            <asp:Label ID="lblExpDate" runat="server" Text='<%#Eval("Exp_Date") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblExpType" runat="server" Text='<%#Eval("Exp_Type") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Exp_Amount") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblExpToW" runat="server" Text='<%#Eval("Exp_ToWhome") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblUnder" runat="server" Text='<%#Eval("Exp_Under") %>'></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Button ID="btnEdit" runat="server" CssClass="edit" CommandName="Edit" />
                                                        </td>
                                                        <td align="center">
                                                            <asp:LinkButton ID="lnkbtnDelete" runat="server" Text="Delete" CommandName="Delete"
                                                                OnClientClick="return confirm('Do you want to delete this record ?');" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody> </table></FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="modal fade" id="DvExpForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                             <div class="modal-dialog">
                                             <div class="modal-content">
                                                 <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="H1" style="color:Black;">All Expenses Details</h4>
                                                 </div>
                                                 <div class="modal-body" style="padding-bottom:0px;">
                                                     <table style="width:100%;">
                                                        <tr>
                                                            <td align="right">
                                                                Date :
                                                            </td>
                                                            <td align="left"> 
                                                                <asp:HiddenField ID="hfOpModeExp" runat="server" />
                                                                <asp:HiddenField ID="hfExpID" runat="server" />
                                                                <asp:TextBox ID="txtExpDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                                </asp:TextBox>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />                                                    
                                                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtExpDate"
                                                                    PopupButtonID="Image1" Format="dd/MM/yyyy" Enabled="true">
                                                                </asp:CalendarExtender><br />
                                                                <br />
                                                            </td>
                                                            <td>
                                                                
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                Expenses Type :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtExpenseType" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px"></asp:TextBox><br /><br />
                                                            </td>
                                                            <td align="right">
                                                                Amount (in Rs.) :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtExpAmount" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br /><br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                To Whom :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtWhome" runat="server" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br />
                                                            </td>
                                                            <td align="right">
                                                                Comes Under Head :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtCUH" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br />
                                                            </td>
                                                        </tr>
                                                     </table>
                                                 </div>
                                                 <div class="modal-footer">
                                                 <asp:Button ID="btn_Save" runat="server" Text="Save" onclick="btn_Save_Click"  class="btn btn-default"/>
                                                 </div>
                                             </div>
                                             </div>
                                         </div>
                                    </div>
                                </asp:Panel>
                           </div>
                        </div>
                      </div>
                       <div id="dvPayR" runat="server" visible="false">
                          <div class="col-sm-3 col-md-6 col-lg-8">
                             <div class="panel panel-default">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Payment Recieve</p>
                                  </h3>
                               </div>
                               <div class="panel-body">
                                    <asp:Panel ID="panel4" runat="server" Width="97%" Style="margin-top: 5px;">
                                    <div id="Div9">
                                        <div id="Div10">
                                            <table style="border: 0px;width:100%;margin:0px auto;" >     
                                                <tr>
                                                    <td align="left">
                                                        Date: 
                                                        <asp:TextBox ID="TextBox1" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                        CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                        </asp:TextBox>
                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />
                                                    
                                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TextBox1"
                                                            PopupButtonID="Image2" Format="dd/MM/yyyy" Enabled="true">
                                                        </asp:CalendarExtender>
                                                    </td>
                                                    <td align="right">
                                                        <%--<asp:Button ID="btnAddExpense" runat="server" Text="Add New Expenses"></asp:Button>--%>
                                                        <asp:Button ID="btnAddPayRecieve" runat="server" Text="Add New" onclick="btnAddPayRecieve_Click" 
                                                          CssClass="btn btn-info" data-loading-text="Hold On..."></asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Repeater ID="rpt_PR" runat="server" OnDataBinding="rpt_PR_DataBinding"
                                                OnItemCommand="rpt_PR_ItemCommand" OnItemDataBound="rpt_PR_ItemDataBound">
                                                <HeaderTemplate>
                                                    <table border="0" width="650" class="display" id="example">
                                                        <thead>
                                                            <th align="left" style="width: 175px;">
                                                                Date
                                                            </th>
                                                            <th align="left" style="width: 175px;">
                                                                Particular
                                                            </th>
                                                            <th align="left" style="width: 130px;">
                                                                Amount
                                                            </th>
                                                            <th style="width: 30px;">
                                                                Purpose
                                                            </th>
                                                            <th style="width: 30px;">
                                                                Edit 
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
                                                            <asp:HiddenField ID="hfPR_ID" runat="server" Value='<%#Eval("PR_ID") %>' />
                                                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblPR_Particular" runat="server" Text='<%#Eval("Particulars") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblPR_Amount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblPR_Purpose" runat="server" Text='<%#Eval("Purpose") %>'></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Button ID="btnEditPR" runat="server" CssClass="edit" CommandName="Edit" />
                                                        </td>
                                                        <td align="center">
                                                            <asp:LinkButton ID="lnkbtnDeletePR" runat="server" Text="Delete" CommandName="Delete"
                                                                OnClientClick="return confirm('Do you want to delete this record ?');" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody> </table></FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="modal fade" id="DvPayRecieve" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                             <div class="modal-dialog">
                                             <div class="modal-content">
                                                 <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="H2" style="color:Black;">Add New Payment Recieve Details</h4>
                                                 </div>
                                                 <div class="modal-body" style="padding-bottom:0px;">
                                                     <table style="width:100%;">
                                                        <tr>
                                                            <td align="right">
                                                                Date :
                                                            </td>
                                                            <td align="left">
                                                                <asp:HiddenField ID="hfOpModePR" runat="server" />
                                                                <asp:HiddenField ID="hfPRID" runat="server" />
                                                                <asp:TextBox ID="txtPayRDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                                </asp:TextBox>
                                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />                                                    
                                                                <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtPayRDate"
                                                                    PopupButtonID="Image4" Format="dd/MM/yyyy" Enabled="true">
                                                                </asp:CalendarExtender><br />
                                                                <br />
                                                            </td>
                                                            <td>
                                                                
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                Particulars :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtPayRPart" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px"></asp:TextBox><br /><br />
                                                            </td>
                                                            <td align="right">
                                                                Amount (in Rs.) :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtPayRAmt" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br /><br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                Purpose :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtPayRPur" runat="server" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br />
                                                            </td>
                                                            <td align="right">
                                                               
                                                            </td>
                                                            <td align="left">
                                                               
                                                            </td>
                                                        </tr>
                                                     </table>
                                                 </div>
                                                 <div class="modal-footer">
                                                    <asp:Button ID="btnSavePayRecieve" runat="server" Text="Save" OnClick="btnSavePayRecieve_Click"  class="btn btn-default"/>
                                                 </div>
                                             </div>
                                             </div>
                                         </div>
                                    </div>
                                </asp:Panel>
                               </div>
                            </div>
                          </div>
                       </div>
                       <div id="dvPayM" runat="server" visible="false">
                          <div class="col-sm-3 col-md-6 col-lg-8">
                             <div class="panel panel-default">
                               <div class="panel-heading">
                                  <h3 class="panel-title">
                                     <p class="text-center">Payment Made</p>                                    
                                  </h3>
                               </div>
                               <div class="panel-body">
                                    <asp:Panel ID="panel5" runat="server" Width="97%" Style="margin-top: 5px;">
                                    <div id="Div11">
                                        <div id="Div12">
                                            <table style="border: 0px;width:100%;margin:0px auto;" >     
                                                <tr>
                                                    <td align="left">
                                                        Date: 
                                                        <asp:TextBox ID="txtPmtDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                        CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                        </asp:TextBox>
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />
                                                    
                                                        <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtPmtDate"
                                                            PopupButtonID="Image3" Format="dd/MM/yyyy" Enabled="true">
                                                        </asp:CalendarExtender>
                                                    </td>
                                                    <td align="right">
                                                        <%--<asp:Button ID="btnAddExpense" runat="server" Text="Add New Expenses"></asp:Button>--%>
                                                        <asp:Button ID="btnAddPayMade" runat="server" Text="Add New" onclick="btnAddPayMade_Click"
                                                          CssClass="btn btn-info" data-loading-text="Hold On..."></asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Repeater ID="rptPMT" runat="server" OnDataBinding="rptPMT_DataBinding"
                                                OnItemCommand="rptPMT_ItemCommand" OnItemDataBound="rptPMT_ItemDataBound">
                                                <HeaderTemplate>
                                                    <table border="0" width="650" class="display" id="example">
                                                        <thead>
                                                            <th align="left" style="width: 175px;">
                                                                Date
                                                            </th>
                                                            <th align="left" style="width: 175px;">
                                                                Particular
                                                            </th>
                                                            <th align="left" style="width: 130px;">
                                                                Amount
                                                            </th>
                                                            <th style="width: 30px;">
                                                                Purpose
                                                            </th>
                                                            <th style="width: 30px;">
                                                                Edit 
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
                                                            <asp:HiddenField ID="hfPMT_ID" runat="server" Value='<%#Eval("PMT_ID") %>' />
                                                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblPR_Particular" runat="server" Text='<%#Eval("Particulars") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblPR_Amount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lblPR_Purpose" runat="server" Text='<%#Eval("Purpose") %>'></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Button ID="btnEditPMT" runat="server" CssClass="edit" CommandName="Edit" />
                                                        </td>
                                                        <td align="center">
                                                            <asp:LinkButton ID="lnkbtnDeletePMT" runat="server" Text="Delete" CommandName="Delete"
                                                                OnClientClick="return confirm('Do you want to delete this record ?');" />
                                                        </td>
                                                    </tr>

                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody> </table></FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="modal fade" id="DvPayMade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                             <div class="modal-dialog">
                                             <div class="modal-content">
                                                 <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="H3" style="color:Black;">Add New Payment Made Details</h4>
                                                 </div>
                                                 <div class="modal-body" style="padding-bottom:0px;">
                                                     <table style="width:100%;">
                                                        <tr>
                                                            <td align="right">
                                                                Date :
                                                            </td>
                                                            <td align="left"> 
                                                                <asp:TextBox ID="txtPayMDate" ValidationGroup="billDueDate" runat="server" MaxLength="12"
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Enabled="False" Style="margin-left: 2px;">
                                                                </asp:TextBox>
                                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/images/Calendar_scheduleHS.jpg" style="display: inline;" />                                                    
                                                                <asp:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtPayMDate"
                                                                    PopupButtonID="Image5" Format="dd/MM/yyyy" Enabled="true">
                                                                </asp:CalendarExtender><br />
                                                                <br />
                                                            </td>
                                                            <td>
                                                                
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                Particulars :
                                                            </td>
                                                            <td align="left">
                                                                <asp:HiddenField ID="hfOpModePMT" runat="server" />
                                                                <asp:HiddenField ID="hfPMTID" runat="server" />
                                                                <asp:TextBox ID="txtPayMpart" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px"></asp:TextBox><br /><br />
                                                            </td>
                                                            <td align="right">
                                                                Amount (in Rs.) :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtPayMAmt" runat="server" MaxLength="12" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br /><br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                Purpose :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtPayMPur" runat="server" 
                                                                CssClass="cssTextBox cssTextBox-enabled" Width="100px" Style="margin-left: 2px;"></asp:TextBox><br />
                                                            </td>
                                                            <td align="right">
                                                               
                                                            </td>
                                                            <td align="left">
                                                               
                                                            </td>
                                                        </tr>
                                                     </table>
                                                 </div>
                                                 <div class="modal-footer">
                                                    <asp:Button ID="btnSavePayMade" runat="server" Text="Save" OnClick="btnSavePayMade_Click" class="btn btn-default"/>
                                                 </div>
                                             </div>
                                             </div>
                                         </div>
                                    </div>
                                </asp:Panel>
                              
                              
                               </div>
                            </div>
                          </div>
                      </div>

                      <div id="divTL" runat="server" visible="false">
                        <div class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Transfer Leads</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                             <table style="border: 0px;float: left;" >     
                                <tr>
                                    <td style="border: 0px;" align="left">
                                        Per Day :
                                        <asp:RadioButton ID="rbtnPerDay" GroupName="TransferLeads" runat="server" 
                                            oncheckedchanged="rbtnPerDay_CheckedChanged" AutoPostBack="true" />
                                    </td>
                                    <td>
                                        Weekly :
                                        <asp:RadioButton ID="rbtnWeekly" GroupName="TransferLeads" runat="server" 
                                            oncheckedchanged="rbtnWeekly_CheckedChanged" AutoPostBack="true" />
                                    </td>
                                    <td>
                                        Monthly :
                                        <asp:RadioButton ID="rbtnMonthly" GroupName="TransferLeads" runat="server" 
                                            oncheckedchanged="rbtnMonthly_CheckedChanged" AutoPostBack="true" />
                                    </td>
                                </tr>
                            </table> 
                              <asp:Panel ID="dt_example" runat="server" Width="97%" Style="margin-top: 5px;">
                                       <div id="container">
                                           <div id="demo">
                                               <asp:Repeater ID="rptTransferLeads" runat="server" OnDataBinding="rptTransferLeads_DataBinding"
                                                   OnItemCommand="rptTransferLeads_ItemCommand" OnItemDataBound="rptTransferLeads_ItemDataBound">
                                                   <HeaderTemplate>
                                                       <table border="0" width="650" class="display" id="example">
                                                           <thead>
                                                               <th align="left" style="width: 175px;">
                                                                   Supplier Name
                                                               </th>
                                                               <th align="left" style="width: 130px;">
                                                                   No. of leads assign
                                                               </th>
                                                           </thead>
                                                           <tbody>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                       <tr align="left" class="gradeC">
                                                           <td align="left">
                                                               <asp:HiddenField ID="hfSupplierID" runat="server" Value='<%#Eval("Asign") %>' />
                                                               <asp:LinkButton ID="lnkSupplierName" ClientIDMode="AutoID" CommandName="View" runat="server" Text='<%#Eval("FullName") %>'></asp:LinkButton>
                                                           </td>
                                                           <td align="left">
                                                               <asp:Label ID="lblleadsno" runat="server" Text='<%#Eval("NoOfLeads") %>'></asp:Label>
                                                           </td>
                                                       </tr>
                                                   </ItemTemplate>
                                                   <FooterTemplate>
                                                       </tbody> </table></FooterTemplate>
                                               </asp:Repeater>
                                           </div>
                                           <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                             <div class="modal-dialog">
                                             <div class="modal-content">
                                                 <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="myModalLabel" style="color:Black;">Leads Info</h4>
                                                 </div>
                                                 <div class="modal-body">
                                                                                                         <asp:Panel ID="Panel6" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div13">
                                                        <div id="Div14">
                                                            <asp:Repeater ID="rptSupplier_LeadsDtl" runat="server" ><%--OnDataBinding="rptLeadInformation_DataBinding"
                                                                OnItemCommand="rptLeadInformation_ItemCommand" OnItemDataBound="rptLeadInformation_ItemDataBound">--%>
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour
                                                                            </th>
                                                                            <th align="left" style="width: 175px;">
                                                                                Customer
                                                                            </th>
                                                                            <th align="left" style="width: 130px;">
                                                                                Required Date
                                                                            </th>
                                                                            <th style="width: 30px;">
                                                                                Status
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                        <td align="left">
                                                                            <asp:HiddenField ID="hfLeadID" runat="server" Value='<%#Eval("Lead_ID") %>' />
                                                                            <asp:Label ID="lblSupplier" runat="server" Text='<%#Eval("Labour") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblCustomerName" runat="server" Text='<%#Eval("Customer") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblRequiredDate" runat="server" Text='<%#Eval("Required_Date") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
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
                                                 
                                                 <div class="modal-footer">
                                                 <asp:Button ID="btnOk" runat="server" Text="OK"  class="btn btn-default"/>
                                                 </div>
                                             </div>
                                             </div>
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
    <script src="http://code.jquery.com/jquery-1.10.1.min.js" type="text/javascript"></script>
</asp:Content>
