<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllLabours.aspx.cs" Inherits="LMT.Reports.AllLabours" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>All Labours</title>
</head>
<body>
    <form id="form1" runat="server">
    <table style="border: 2px solid grey;">
        <tr>
            <td>
                <table id="HeaderTable" runat="server" width="100%" style="border: 1px; margin-right: -8px;">
                        <tr>
                            <td colspan="9">
                                <center>
                                    <b style="font-size: 250%;">
                                        <asp:Literal ID="Ltname" runat="server" Text=""></asp:Literal>
                                    </b>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <center>
                                    <b>
                                        <asp:Literal ID="Ltaddress1" runat="server" Text=""></asp:Literal>
                                        <asp:Literal ID="Ltaddress2" runat="server" Text=""></asp:Literal>
                                    </b>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <center>
                                    <b style="font-size: 70%;">Phone :-<asp:Literal ID="Ltphone1" runat="server" Text=""></asp:Literal>
                                        <asp:Literal ID="Ltphone2" runat="server" Text=""></asp:Literal></b>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <center>
                                    <b style="font-size: 70%;">Mobile :-<asp:Literal ID="LtSchoolMobile" runat="server"
                                        Text=""></asp:Literal></b></center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <center>
                                    <b style="font-size: 70%;">Website :-<asp:Literal ID="Ltwebsite" runat="server" Text=""></asp:Literal></b></center>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <hr style="margin-left: -6px; margin-right:-6px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9" align="center">
                                <h2 style="margin-bottom: 0px; margin-top: 0px; margin-left: -39px;">
                                     All Labours</h2>
                            </td>
                        </tr>
                    </table>
                <asp:Panel ID="dt_example" runat="server" Width="97%" Style="margin-top: 5px;">
                    <div id="container">
                        <div id="demo">
                            <asp:Repeater ID="rptAllLabour" runat="server">
                                <HeaderTemplate>
                                    <table border="1" width="1000" id="example">
                                        <thead>
                                            <th align="center" style="width: 40px; background-color:Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;">
                                                S No.
                                            </th>
                                            <th align="left" style="width: 120px; background-color: Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;  padding-left:5px;">
                                                Labour Name
                                            </th>
                                            <th align="left" style="width: 120px; background-color: Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;  padding-left:5px;">
                                               Supplier
                                            </th>
                                            <th align="center" style="width: 70px; background-color: Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;">
                                                Mobile No
                                            </th>
                                            <th align="center" style="width: 85px; background-color: Silver; border-bottom-style: solid;
                                                 border-bottom-width: 4px;">
                                               Sector
                                            </th>
                                            <th  align="left" style="width: 250px; background-color: Silver; border-bottom-style: solid; 
                                                border-bottom-width: 4px;  padding-left:5px;">
                                               Type
                                            </th>
                                            <th align="left" style="width: 80px; background-color: Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;  padding-left:5px;">
                                                Address
                                            </th>
                                            <%--<th align="center" style="width: 60px; background-color: Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;">
                                                In Time
                                            </th>
                                            <th align="center" style="width: 60px; background-color: Silver; border-bottom-style: solid;
                                                border-bottom-width: 4px;">
                                                Out Time
                                            </th>--%>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr align="left" class="gradeC">
                                        <td align="center">
                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#Eval("SerialNo") %>'></asp:Label>
                                        </td>
                                        <td align="left" style=" padding-left:5px;">
                                            <asp:Label ID="lblProspectusNo"  runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                                        </td>
                                        <td align="left" style=" padding-left:5px;">
                                            <asp:Label ID="lblCandidateName" runat="server" Text='<%#Eval("SupplierName") %>'></asp:Label>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="lblClassName" runat="server" Text='<%#Eval("Ph_No") %>'></asp:Label>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="lblSaleDate" runat="server" Text='<%#Eval("SectorName") %>'></asp:Label>
                                        </td>
                                        <td align="left" style=" padding-left:5px;">
                                            <asp:Label ID="lblMobileNo" runat="server" Text='<%#Eval("Lbr_Type") %>'></asp:Label>
                                        </td>
                                        <td align="left" style=" padding-left:5px;">
                                            <asp:Label ID="lblPaymentMode" runat="server" Text='<%#Eval("C_Address") %>'></asp:Label>
                                        </td>
                                        <%--<td align="center">
                                            <asp:Label ID="lblChequeNo" runat="server" Text='<%#Eval("InTime") %>'></asp:Label>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("OutTime") %>'></asp:Label>
                                        </td>--%>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <%-- <tr align="right">
                                        <td colspan="8">
                                            <b>Total :</b>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                        </td>
                                    </tr>--%>
                                    </tbody> </table></FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/printer_icon.png"
       ToolTip="Print All Detail" style="margin-top: 6px" 
        onclick="btnPrint_Click"  /> 
          &nbsp;
    <asp:ImageButton ID="ExportToExl" runat="server" ImageUrl="~/images/export_excel_icon.gif"
        ToolTip="Export to Excel sheet" Style="margin-top: 6px; width: 16px;" 
        onclick="ExportToExl_Click"  />
    </form>
</body>
</html>
