<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/SupplierMaster.master"
    AutoEventWireup="true" CodeBehind="LabourDetail.aspx.cs" Inherits="LMT.Supplier.LabourDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

                .widget-content table td > span > a {
                    color: #fff;
                }
    </style>
    <style type="text/css">
        .ddl {
            BackColor ="#F6F1DB";
            ForeColor ="#7d6754";
            border: 2px solid #7d6754;
            Font-Names ="Andalus";
            border-radius: 5px;
            padding: 3px;
            -webkit-appearance: none;
            background-image: url('Images/Arrowhead-Down-01.png');
            background-position: 88px;
            background-repeat: no-repeat;
            text-indent: 0.01px; /*In Firefox*/
            text-overflow: ''; /*In Firefox*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="demo-wrapper">
                <header id="ccr-header">
		            <div class="ccr-hbg">			 
			            <div class="ccr-slug" style="padding-top:5px;height:600px;">
				            <div class="container">
                                <div class="row">
                                  <div class="col-lg-12">
                                     <div class="panel panel-default">
                                       <div class="panel-heading">
                                          <h3 class="panel-title">
                                             <p class="text-center">Labour Information</p>
                                          </h3>
                                       </div>
                                       <div class="panel-body">
                                        <div>
                                            <asp:Panel ID="panel1" runat="server" CssClass="panelclass">
                                                <asp:Panel ID="dt_example" runat="server" Width="97%" Style="margin-top: 5px;">
                                                    <div id="container">
                                                          <div class="pull-right">
                                                             <a href="../Reports/AllLabours.aspx" class="btn btn-info btn-xs"  title="Go to labour list">Show all</a>
                                                             <a href="RegisterLabour.aspx" class="btn btn-info btn-xs"  title="Add new labour">Add Labour</a>
                                                          </div>
                                                        <div id="demo" class="table-responsive">
                                                            <asp:Repeater ID="rptLabourInformation" runat="server" OnDataBinding="rptLabourInformation_DataBinding"
                                                                OnItemCommand="rptLabourInformation_ItemCommand" OnItemDataBound="rptLabourInformation_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table class="table" style="width:100%;" id="example">
                                                                        <thead>
                                                                            <th align="left" style="width: 175px;">
                                                                                Labour Code
                                                                            </th>
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
                                                                            <th align="left">
                                                                                Address
                                                                            </th>
                                                                            <th style="width: 50px;">
                                                                                Report
                                                                            </th>
                                                                            <th style="width: 50px;">
                                                                                Update
                                                                            </th>
                                                                            <th style="width: 50px;">
                                                                                Remove
                                                                            </th>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr align="left" class="gradeC">
                                                                        <td align="left">
                                                                            <asp:Label ID="lblStudentCode" runat="server" Text='<%#Eval("Labour_Code") %>'></asp:Label>
                                                                        </td>
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
                                                                        <td align="left">
                                                                            <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("C_Address") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                          <input id="btnprint" type="button" runat="server" class="btn btn-default btn-xs" title='<%# "Details of "+Eval("FullName") %>' value="Show" CommandName="Print" /> <%--class="print"--%>
                                                                        </td>
                                                                        <td >
                                                                            <asp:Button ID="btnEdit" runat="server" class="btn btn-default btn-xs" Text="Update" CommandName="Edit" /> <%--CssClass="edit"--%>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="btnDelete" runat="server" class="btn btn-default btn-xs" Text="Remove" CommandName="Delete"
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
                                            </asp:Panel>
                                        </div>
                                       </div>
                                    </div>
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>
                </header>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
