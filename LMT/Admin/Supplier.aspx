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

    <style type="text/css">
        ::-webkit-scrollbar {
            width: 4px;
            height: 4px;
        }

        ::-webkit-scrollbar-button {
            width: 0px;
            height: 0px;
        }

        ::-webkit-scrollbar-thumb {
            background: #e1e1e1;
            border: 0px none #ffffff;
            border-radius: 50px;
        }

            ::-webkit-scrollbar-thumb:hover {
                background: #ffffff;
            }

            ::-webkit-scrollbar-thumb:active {
                background: #000000;
            }

        ::-webkit-scrollbar-track {
            background: #666666;
            border: 0px none #ffffff;
            border-radius: 50px;
        }

            ::-webkit-scrollbar-track:hover {
                background: #666666;
            }

            ::-webkit-scrollbar-track:active {
                background: #333333;
            }

        ::-webkit-scrollbar-corner {
            background: transparent;
        }
    </style>
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

                .widget-content table td > span > a {
                    color: #fff;
                }


        .fixed_headers {
            width: 522px;
            table-layout: fixed;
            border-collapse: collapse;
        }

            .fixed_headers th {
                text-decoration: underline;
            }

            .fixed_headers th,
            .fixed_headers td {
                padding: 5px;
                text-align: left;
            }

                .fixed_headers td:nth-child(1),
                .fixed_headers th:nth-child(1) {
                    min-width: 100px;
                }

                .fixed_headers td:nth-child(2),
                .fixed_headers th:nth-child(2) {
                    min-width: 100px;
                }

                .fixed_headers td:nth-child(3),
                .fixed_headers th:nth-child(3) {
                    width: 100px;
                }

                .fixed_headers td:nth-child(4),
                .fixed_headers th:nth-child(4) {
                    width: 100px;
                }

                .fixed_headers td:nth-child(5),
                .fixed_headers th:nth-child(5) {
                    width: 100px;
                }

                .fixed_headers td:nth-child(6),
                .fixed_headers th:nth-child(6) {
                    width: 100px;
                }

                .fixed_headers td:nth-child(7),
                .fixed_headers th:nth-child(7) {
                    width: 100px;
                }

            .fixed_headers thead {
                background-color: #FFFFFF;
                color: #333333;
                border-bottom: 1px solid;
            }

                .fixed_headers thead tr {
                    display: block;
                    position: relative;
                }

            .fixed_headers tbody {
                display: block;
                overflow: auto;
                width: 100%;
                height: 300px;
            }

                .fixed_headers tbody tr:nth-child(even) {
                    background-color: #FFF;
                }

        .old_ie_wrapper {
            height: 200px;
            width: 400px;
            overflow-x: hidden;
            overflow-y: auto;
        }

            .old_ie_wrapper tbody {
                height: auto;
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
                         <div class="panel panel-default" style="height:auto;">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Supplier/Contractor Details</p>
                                
                              </h3>
                           </div>
                           <div class="panel-body" >
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
                            <table style="border: 0px;" width="97%" class="none">
                                                    <tr>
                                                         <td style="text-align: left;">
                                                             Total No of Suppliers : <b> <asp:Label ID="lblTotalLabour" runat="server"></asp:Label> </b>
                                                         </td>
                                                        <td style="width: auto;" align="right">
                                                            
                                                            <div class="formheadingstyleRight">
                                                                <asp:LinkButton ID="lbtnAdd" CssClass="btn btn-primary btn-xs" Text="Add New" runat="server" 
                                                                    onclick="lbtnAdd_Click" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                  <asp:Panel ID="dt_example" runat="server">
                                       <div id="container">
                                           <div id="demo">
                                               <asp:Repeater ID="rptSupplierInformation" runat="server" OnDataBinding="rptSupplierInformation_DataBinding"
                                                   OnItemCommand="rptSupplierInformation_ItemCommand" OnItemDataBound="rptSupplierInformation_ItemDataBound">
                                                   <HeaderTemplate>
                                                       <table class="fixed_headers">
                                                           <thead>
                                                               <th >
                                                                   Name
                                                               </th>
                                                               <th  >
                                                                   Mobile No.
                                                               </th>
                                                               <th  >
                                                                   City
                                                               </th>
                                                               <th >
                                                                   State
                                                               </th>
                                                               <th style="text-align:center;" >
                                                                    Labour
                                                               </th>
                                                               <th align="center">
                                                                    Profile
                                                               </th>
                                                               <th align="center" >
                                                                   Delete
                                                               </th>
                                                           </thead>
                                                           <tbody>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                       <tr>
                                                           <td >
                                                               <asp:Label ID="lblfullName" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                                                           </td>
                                                           <td >
                                                               <asp:Label ID="lblfathernme" runat="server" Text='<%#Eval("Sup_Mobile") %>'></asp:Label>
                                                           </td>
                                                           <td >
                                                               <asp:Label ID="lblClass" runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                                                           </td>
                                                           <td >
                                                               <asp:Label ID="lblrollno" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
                                                           </td>
                                                           <td align="center">
                                                                <asp:LinkButton ID="lnkViewLabour" runat="server" CssClass="btn btn-info btn-xs"  Text="View" CommandName="View" ClientIDMode="AutoID"></asp:LinkButton>
                                                           </td>
                                                           <td align="center">
                                                               <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-info btn-xs" Text="Edit" CommandName="Edit" />
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
                                                                                Profile
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
                                                                            <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-info btn-xs" Text="Show" CommandName="Edit" />
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
