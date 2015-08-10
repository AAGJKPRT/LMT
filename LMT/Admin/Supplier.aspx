<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="LMT.Admin.Supplier" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<!--[if IE]>
	<link rel="stylesheet" type="text/css" href="../css/all-ie-only.css" />
    <![endif]-->
    <%--<link href="../css/dashcss.css" rel="stylesheet" type="text/css" />--%>
    <link href="../css/plugins-dash.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" href="../colorbox.css" />
    <%--<script type="text/javascript" language="javascript" src="../js/PopUpJScript.js"></script>
    <script type="text/javascript" language="javascript" src="../js/jquery.colorbox.js"></script>--%>
    <link href="../css/button.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        $("[name$='$Select']").attr("name", $("[name$='$Select']").attr("name"));

        $("[name$='$Select]").click(function () {
            //set name for all to name of clicked 
            $("[name$='$Select]").attr("name", this.attr("name"));
        });
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
        .widget-content table td > span > a
        {
            color: #fff;
        }
    </style>
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
                     
                      <div class="col-sm-3 col-md-6 col-lg-6">
                         <div class="panel panel-default" style="height:65vh;">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Supplier/Contractor Details</p>
                                
                              </h3>
                           </div>
                           <div class="panel-body">
                              <%--<table style="border: 0px;float: left;" >
                                
                                <tr>
                                    <td style="border: 0px;" align="left" width="350">
                                        <span>Search</span>
                                        <asp:TextBox ID="txtSearch" runat="server" Text="" CssClass="cssTextBox cssTextBox-enabled"></asp:TextBox>
                                        <asp:Button BorderWidth="0" Width="35px" Height="20px" CssClass="Go" ID="btnGo" 
                                            runat="server" onclick="btnGo_Click"
                                            ></asp:Button>
                                        <asp:Button BorderWidth="0" Width="20px" Height="20px" CssClass="refresh" ID="btnRefresh"
                                            runat="server" ></asp:Button>
                                    </td>
                                </tr>
                            </table> --%>
                            <table style="border: 0px;">                                
                                <tr>
                                    <td>Total No of Supplier : <asp:Label ID="txtTotalLabour" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <table style="border: 0px;" width="97%" class="none">
                                                    <tr>
                                                        <td style="width: auto;" align="right">
                                                            
                                                            <div class="formheadingstyleRight">
                                                                <asp:LinkButton ID="lbtnAdd" CssClass="add" Text="Add New" runat="server" 
                                                                    onclick="lbtnAdd_Click" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                  <asp:Panel ID="dt_example" runat="server" Width="97%" Style="margin-top: 5px;">
                                       <div id="container">
                                           <div id="demo">
                                               <asp:Repeater ID="rptSupplierInformation" runat="server" OnDataBinding="rptSupplierInformation_DataBinding"
                                                   OnItemCommand="rptSupplierInformation_ItemCommand" OnItemDataBound="rptSupplierInformation_ItemDataBound">
                                                   <HeaderTemplate>
                                                       <table border="0" width="650" class="display" id="example">
                                                           <thead>
                                                               <th align="left" style="width: 175px;">
                                                                   Name
                                                               </th>
                                                               <th align="left" style="width: 130px;">
                                                                   Mobile No.
                                                               </th>
                                                               <th align="left" style="width: 100px;">
                                                                   City
                                                               </th>
                                                               <th style="width: 100px;">
                                                                   State
                                                               </th>
                                                               <th>
                                                                   View Labour
                                                               </th>
                                                               <th>
                                                                   View Profile
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
                                                               <asp:Label ID="lblfullName" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                                                           </td>
                                                           <td align="left">
                                                               <asp:Label ID="lblfathernme" runat="server" Text='<%#Eval("Sup_Mobile") %>'></asp:Label>
                                                           </td>
                                                           <td align="left">
                                                               <asp:Label ID="lblClass" runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                                                           </td>
                                                           <td align="left">
                                                               <asp:Label ID="lblrollno" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
                                                           </td>
                                                           <td>
                                                                <asp:LinkButton ID="lnkViewLabour" runat="server" Text="View" CommandName="View" ClientIDMode="AutoID"></asp:LinkButton>
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
                                                                 
                      <div class="col-sm-3 col-md-6 col-lg-6">
                         <div class="panel panel-default" style=" height:65vh;">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Search Labour accord. to Supplier/Contractor Wise</p>
                                  
                              </h3>
                           </div>
                           <div class="panel-body">
                              <%--<table style="border: 0px;float: left;">                                
                                <tr>
                                    <td style="border: 0px;" align="left" width="350">
                                        <span>Search</span>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button BorderWidth="0" Width="35px" Height="20px" CssClass="Go" ID="Button1" runat="server"></asp:Button>
                                        <asp:Button BorderWidth="0" Width="20px" Height="20px" CssClass="refresh" ID="Button2" runat="server"></asp:Button>
                                    </td>
                                </tr>
                              </table>         --%>
                                          <asp:Panel ID="Panel1" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="Div1">
                                                        <div id="Div2">
                                                            <asp:Repeater ID="rptLabourInformation" runat="server" OnDataBinding="rptLabourInformation_DataBinding"
                                                                OnItemDataBound="rptLabourInformation_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour Name
                                                                            </th>
                                                                            <th align="left" style="width: 130px;">
                                                                                Mobile No.
                                                                            </th>
                                                                            <th align="left" style="width: 100px;">
                                                                                City
                                                                            </th>
                                                                            <th style="width: 100px;">
                                                                                State
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
                                                                        <td align="left">
                                                                            <asp:Label ID="lblfathernme" runat="server" Text='<%#Eval("Ph_No") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblClass" runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="lblrollno" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
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
