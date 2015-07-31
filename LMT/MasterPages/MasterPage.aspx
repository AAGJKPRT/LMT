<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterPage.aspx.cs" MasterPageFile="~/TransPages/Site.Master"
    Inherits="CrystalCampus.MasterPages.MasterPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="StateUC" Src="~/MasterUC/StateUC.ascx" %>

<%@ Register TagPrefix="uc" TagName="CityUC" Src="~/MasterUC/CityUC.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/common.css" />
    <link rel="Stylesheet" href="../media/table/table1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div class="sc_leftmenu">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    
                    <uc:StateUC runat="server" ID="stateUC" Visible="false" />
                    <uc:CityUC runat="server" ID="cityUC" Visible="false" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
