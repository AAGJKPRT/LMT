<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/SupplierMaster.master"
    AutoEventWireup="true" CodeBehind="LabourDetail.aspx.cs" Inherits="LMT.Supplier.LabourDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/button.css" rel="stylesheet" type="text/css" />
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
    <style type="text/css">
        .ddl
        {
            BackColor="#F6F1DB";
            ForeColor="#7d6754";
            border: 2px solid #7d6754;
            Font-Names="Andalus";
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
                                  <div class="col-sm-3 col-md-6 col-lg-12">
                                     <div class="panel panel-default">
                                       <div class="panel-heading">
                                          <h3 class="panel-title">
                                             <p class="text-center">Labour Information</p>
                                          </h3>
                                       </div>
                                       <div class="panel-body">
                                        <div>
                                            <asp:Panel ID="panel1" runat="server" CssClass="panelclass">
                                                <table style="border: 0px;" width="97%" class="none">
                                                    <tr>
                                                        <td  align="center">
                                                            <asp:ImageButton ID="btnprint" runat="server" 
                                                             ImageUrl="~/images/printer_icon.png" onclick="btnprint_Click" 
                                                             ToolTip="Go to Print All Detail"/>
                                                        </td>
                                                        <td style="width: 70px;" align="right">
                                                            
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
                                                            <asp:Repeater ID="rptLabourInformation" runat="server" OnDataBinding="rptLabourInformation_DataBinding"
                                                                OnItemCommand="rptLabourInformation_ItemCommand" OnItemDataBound="rptLabourInformation_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table border="0" width="650" class="display" id="example">
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
                                                                            <th>
                                                                                Report
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
                                                                            <%--<asp:Label ID="lblStdImgUrl" runat="server" Visible="false" Text='<%#Eval("StdURL") %>'></asp:Label>
                                                                            <asp:Label ID="lblFatherImgUrl" runat="server" Visible="false" Text='<%#Eval("FatherURL") %>'></asp:Label>
                                                                            <asp:Label ID="lblMotherImgUrl" runat="server" Visible="false" Text='<%#Eval("MotherURL") %>'></asp:Label>--%>
                                                                        </td>
                                                                        <td align="center">
                                                                          <input id="btnprint" type="button" runat="server"  class="print" CommandName="Print" />
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
