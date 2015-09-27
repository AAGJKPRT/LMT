<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptLabourProfile.aspx.cs"
    Inherits="LMT.Reports.rptLabourProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 175px;
        }
        .auto-style2 {
            width: 194px;
        }
        .auto-style3 {
            width: 268435424px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="border: 2px solid grey; margin: 0px auto; width: 100%;">
        <tr>
            <td>
                <table id="HeaderTable" runat="server" width="100%" style="border: 1px; margin-right: -8px;">
                    <tr>
                         <td rowspan="5" align="center" class="auto-style2">
                                <img src="../images/EL_logo.png" style="height: 116px; width: 132px" /></td>
                        <td colspan="9" class="auto-style3">
                            <center>
                                <b style="font-size: 250%;">
                                    <asp:Literal ID="Ltname" runat="server" Text=""></asp:Literal>
                                </b>
                            </center>
                        </td>
                          <td rowspan="5" align="center" class="auto-style1">
                              <br /></td>
                       
                    </tr>
                    <tr>
                        <td colspan="9" class="auto-style3">
                            <center>
                                <b>
                                    <asp:Literal ID="Ltaddress1" runat="server" Text=""></asp:Literal>
                                    <asp:Literal ID="Ltaddress2" runat="server" Text=""></asp:Literal>
                                </b>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" class="auto-style3">
                            <center>
                                <b style="font-size: 70%;">Phone :-<asp:Literal ID="Ltphone1" runat="server" Text=""></asp:Literal>
                                    <asp:Literal ID="Ltphone2" runat="server" Text=""></asp:Literal></b>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" class="auto-style3">
                            <center>
                                <b style="font-size: 70%;">Mobile :-<asp:Literal ID="LtSchoolMobile" runat="server"
                                    Text=""></asp:Literal></b></center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" class="auto-style3">
                            <center>
                                <b style="font-size: 70%;">Website :-<asp:Literal ID="Ltwebsite" runat="server" Text=""></asp:Literal></b></center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="11">
                            <hr style="margin-left: -6px; margin-right: -6px;" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="11" align="center">
                            <h2 style="margin-bottom: 0px; margin-top: 0px; margin-left: -39px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Labour Profile</h2>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="dt_example" runat="server" Width="100%" Style="margin: 0px auto; margin-top: 10px;">
                    <div id="container">
                        <div id="demo">
                            <asp:HiddenField ID="hfRegID" runat="server" />
                            <asp:HiddenField ID="hfOpmode" runat="server" />
                            <table style="border: 1px; margin: 0px auto;   width: 90%;  line-height: 3.2em;  margin-left: 10%; font-size: 13px;">
                                <tr>
                                    <td>
                                        <strong>Full Name : </strong>
                                        <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        <strong>Father's Name : </strong>
                                        <asp:Label ID="lblFatherName" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td rowspan="3">
                                        <asp:Image ID="ImgLabour" runat="server" Width="100" Height="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Current Address :&nbsp;</strong><asp:Label ID="lblCurrentAdd" runat="server"
                                            Text="Current Address"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>State :&nbsp;</strong><asp:Label ID="lblCurrentState" runat="server" Text="Current State"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>City :&nbsp;</strong><asp:Label ID="lblCurrentCity" runat="server" Text="Current City"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Pincode :&nbsp;</strong><asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Permanent Address :&nbsp;</strong><asp:Label ID="lblPermanentAddress" runat="server"
                                            Text="Permanent Address"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Permanent State :&nbsp;</strong><asp:Label ID="lblPermanentState" runat="server"
                                            Text="Permanent State fhhfdhv"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Belonging Phone 1 :&nbsp;</strong><asp:Label ID="lblBelongingPhone1" runat="server"
                                            Text="Belonging Phone 1"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Permanent City :&nbsp;</strong><asp:Label ID="lblpermanentCity" runat="server"
                                            Text="Permanent City"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Permanent Pincode :&nbsp;</strong><asp:Label ID="lblPermanentPincode" runat="server"
                                            Text="Permanent Pincode"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Belonging Phone 2 :&nbsp;</strong><asp:Label ID="lblBelongingPhone2" runat="server"
                                            Text="Belonging Phone 2"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Mobile No. :&nbsp;</strong><asp:Label ID="lblPhone" runat="server" Text="Mobile No."></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Sector Type :&nbsp;</strong><asp:Label ID="lblSectorType" runat="server"
                                            Text="Sector Type"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Belonging Phone 3 :&nbsp;</strong><asp:Label ID="lblBelongingPhone3" runat="server"
                                            Text="Belonging Phone 3"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Labour Type :&nbsp;</strong><asp:Label ID="lblLabourType" runat="server"
                                            Text="Labour Type"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Skill Type :&nbsp;</strong><asp:Label ID="lblSkillType" runat="server" Text="Skill Type"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Belonging Phone 4 :&nbsp;</strong><asp:Label ID="lblBelongingPhone4" runat="server"
                                            Text="Belonging Phone 4"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Work Specialization :&nbsp;</strong><asp:Label ID="lblWorkSpecialization"
                                            runat="server" Text="Work Specialization"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Experience :&nbsp;</strong><asp:Label ID="lblExperience" runat="server" Text="Experience"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Labour Code :&nbsp;</strong><asp:Label ID="lblLabourCode" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Document Uploaded :&nbsp;</strong><asp:Label ID="lblDocument" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                        <strong>Verification :&nbsp;</strong><asp:Label ID="lblVerification" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">
                                        <strong>Wages :&nbsp;</strong><asp:Label ID="lblWages" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-top: none">
                                    </td>
                                    <td style="border-top: none;">
                                    </td>
                                </tr>
                            </table>
                            <table id="lbrIDImg" runat="server">
                                <tr>
                                    <td>
                                        <asp:Image ID="imgDoc1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgDoc2" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgDoc3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgDoc4" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/printer_icon.png"
        ToolTip="Print All Detail" Style="margin-top: 6px" OnClick="btnPrint_Click" />
    &nbsp;
    <asp:ImageButton ID="ExportToExl" runat="server" ImageUrl="~/images/export_excel_icon.gif"
        ToolTip="Export to Excel sheet" Style="margin-top: 6px; width: 16px;" />
    </form>
</body>
</html>
