<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs"
    Inherits="LMT.User.UserRegistration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%--<%@ Register TagPrefix="uc" TagName="ImageUploadUC" Src="~/MasterUC/ImageUploadUC.ascx" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Labour Management Tool</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link href="../css/loginstyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ddl {
            width: 195px;
            margin: 5px 2px;
            padding: 0 10px;
            height: 26px;
            color: #404040;
            background: white;
            border: 1px solid;
            border-color: #c4c4c4 #d1d1d1 #d4d4d4;
            border-radius: 2px;
            -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ValidationSummary ShowMessageBox="true" ShowSummary="false" ForeColor="Red"
            runat="server" ID="validationSummary"></asp:ValidationSummary>
        <div>
            <div class="container">
                <div class="login">
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <asp:Panel ID="Panel1" runat="server" Width="100%" CssClass="divModalBackground"
                                Visible="true">
                                <div style="position: fixed; top: 40%; left: 45%; z-index: 10000;">
                                    <asp:Image runat="Server" ID="ImageLoader" ImageUrl="~/images/ajax-loader.gif" Height="80px" Width="80px" />
                                </div>
                            </asp:Panel>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div id="dvProstectusSaleAdd" class="form-container">
                                <h1>User Registration</h1>
                                <div style="height: 20px; display: none">
                                    &nbsp
                                <asp:Label ID="lblopMode" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="lblUserID" runat="server" Text="" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <fieldset style="width: 430px;">
                                <div>
                                    <table width="345">
                                        <tr style="height: 25px;">
                                            <td>User Name :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtUserName" runat="server" CssClass="cssTextBox cssTextBox-enabled"
                                                    MaxLength="50" Width="174px" Style="margin-left: 2px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RFVUserName" ControlToValidate="txtUserName"
                                                    Display="None" ErrorMessage="User name is required." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td>Login Name :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLoginName" runat="server" CssClass="cssTextBox cssTextBox-enabled"
                                                    AutoCompleteType="None" AutoComplete="OFF" AutoPostBack="true" ClientIDMode="AutoID" MaxLength="20" Width="174px"
                                                    Style="margin-left: 2px;" OnTextChanged="txtLoginName_TextChanged"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLoginName"
                                                    Display="None" ErrorMessage="Login name is required." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td>Password :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPwd" runat="server" CssClass="cssTextBox cssTextBox-enabled"
                                                    AutoCompleteType="None" AutoComplete="OFF" MaxLength="15" TextMode="Password"
                                                    Width="174px" Style="margin-left: 2px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtPwd"
                                                    Display="None" ErrorMessage="Password is required." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td>Confirm Password :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtConfPwd" runat="server" CssClass="cssTextBox cssTextBox-enabled"
                                                    AutoCompleteType="None" AutoComplete="OFF" MaxLength="15" TextMode="Password"
                                                    Width="174px" Style="margin-left: 2px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtConfPwd"
                                                    Display="None" ErrorMessage="Confirm Password is required." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td>User Type :
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="cssDropDownList cssDropDownList-enabled ddl">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="ddlUserType"
                                                    Display="None" ErrorMessage="Please select User Type." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td>User Category :
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlUserCategory" runat="server" CssClass="cssDropDownList cssDropDownList-enabled ddl">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="ddlUserCategory"
                                                    Display="None" ErrorMessage="Please select User Category." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td>Phone no. :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno" runat="server" CssClass="cssTextBox cssTextBox-enabled"
                                                    AutoCompleteType="None" Width="174px" Style="margin-left: 2px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtphoneno"
                                                    Display="None" ErrorMessage="Phone no. is required." />
                                            </td>
                                        </tr> 
                                        <tr style="height: 25px;">
                                            <td>E-Mail ID :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="cssTextBox cssTextBox-enabled"
                                                    AutoCompleteType="None" Width="174px" Style="margin-left: 2px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtEmail"
                                                    Display="None" ErrorMessage="E-mail ID is required." />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td></td>
                                            <td align="left">
                                                <asp:CheckBox ID="chkIsVerify" Checked="true" Visible="false" runat="server" Text="Verify User"
                                                    CssClass="cssCheckbox" TextAlign="Right" />
                                            </td>
                                        </tr>
                                        <tr style="height: 25px;">
                                            <td></td>
                                            <td align="left">
                                                <asp:ImageButton ID="btnSubmit" runat="server" Width="100" OnClick="btnSave_Click"
                                                    ImageUrl="~/images/btn_submit.png" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </fieldset>

                            <div style="text-align: center;">
                                <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="true" ForeColor="Red"
                                    Style="margin-left: 10px;"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="login-help">
                    <p>
                        Copyright &#169; <a href="../index.aspx" style="text-decoration: none;">Labour Management Tool.</a> All Rights Reserved.
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
