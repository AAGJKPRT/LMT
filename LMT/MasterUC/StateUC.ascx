<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StateUC.ascx.cs" Inherits="LMT.MasterUC.StateUC" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
<table style="border: 0px;" width="715px">
   
    <tr>
        <td style="border: 0px;" align="left" width="350">
            <span>Search</span>
            <asp:TextBox ID="txtSearch" runat="server" Text="" CssClass="cssTextBox cssTextBox-enabled"></asp:TextBox>
            <asp:Button BorderWidth="0" Width="35px" Height="20px" CssClass="Go" ID="btnGo" runat="server"
                OnClick="btnGo_Click"></asp:Button>
            <asp:Button BorderWidth="0" Width="60px" Height="20px" CssClass="refresh" ID="btnRefresh"
                runat="server" OnClick="btnRefresh_Click"></asp:Button>
        </td>
    </tr>
</table>
<asp:Panel ID="dt_example" runat="server" Width="100%">
    <div id="container">
        <div id="demo">
            <asp:Repeater ID="rptState" runat="server" OnDataBinding="rptState_DataBinding" OnItemCommand="rpttate_ItemCommand"
                OnItemDataBound="rptState_ItemDataBound">
                <HeaderTemplate>
                    <table border="0" style="width: 330px;" class="display" id="example1">
                        <thead>
                            <th align="left" style="width: 200px;">
                                State
                            </th>
                            <th style="width: 150px;">
                                Verify
                            </th>
                            <th align="center" style="width: 30px;">
                                Edit
                            </th>
                            <th align="center" style="width: 30px;">
                                Delete
                            </th>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="gradeC">
                        <td align="left" width="200px">
                            <asp:Label ID="lblStateName" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
                            <asp:TextBox ID="txtStateName" CssClass="cssTextBox cssTextBox-enabled" Visible="false" style="width:80px;"
                                runat="server" Text='<%#Eval("StateName") %>'></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:Label ID="lblIsVerify" runat="server" Text='<%#Eval("IsVerify") %>'></asp:Label>
                            <asp:CheckBox ID="chkIsVerify" Text="." ForeColor="White" ClientIDMode="AutoID" Visible="false" runat="server"
                                CssClass="cssCheckbox" Checked='<%#Eval("IsVerify").ToString().Trim()=="Y" %>' />
                        </td>
                        <td align="left">
                            <asp:Button ID="btnEdit" runat="server" ClientIDMode="AutoID" CssClass="edit" CommandName="Edit" Visible='<%#Eval("UpdateMode").ToString().Trim()=="True" %>' />
                            <asp:LinkButton ID="lbtnUpdate" runat="server" ClientIDMode="AutoID" CssClass="update" CommandName="Update"
                                Visible="false" Text="Update" Style="color: Blue;"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnInsert" runat="server" ClientIDMode="AutoID" CssClass="insert" CommandName="Insert"
                                Visible='<%#Eval("InsertMode").ToString().Trim()=="True" %>' Text="Save" Style="color: Blue;"></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Button ID="btnDelete" runat="server" ClientIDMode="AutoID" CssClass="delete" CommandName="Delete"
                                Visible='<%#Eval("UpdateMode").ToString().Trim()=="True" %>' OnClientClick="return confirm('Do you want to delete this record ?');" />
                            <asp:LinkButton ID="lbtnCancel" runat="server" ClientIDMode="AutoID" CssClass="cancel" CommandName="Cancel"
                                Visible="false" Text="Cancel" Style="color: Blue;"></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr align="right" >
                        <th colspan="3" style="border: 0px;">
                        </th>
                        <th colspan="2" align="left" style="border: 0px;">
                            <asp:LinkButton ID="lbtnAdd" Text="Add" ClientIDMode="AutoID" runat="server" CommandName="Add" style="float:right;margin-right:25px;font-size: 14px;" />
                        </th>
                    </tr>
                    </tbody> </table></FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Panel>
<table style="border: 0px;" width="330">
    <tr align="center">
        <td style="height: 35px; width: auto; border: 0px;">
            <asp:LinkButton ID="lbtnPrev" CssClass="prevBtn" runat="server" 
                onclick="lbtnPrev_Click1"></asp:LinkButton>
            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
            <asp:LinkButton ID="lbtnNext" CssClass="nextBtn" runat="server" 
                onclick="lbtnNext_Click1" ></asp:LinkButton>
        </td>
    </tr>
</table>
<asp:SqlDataSource ID="srcState" runat="server" ConnectionString="<%$ ConnectionStrings:Mainconnstr %>"
    SelectCommand="Select StateID,StateName,tblState.IsVerify,'True' UpdateMode,'False' InsertMode From tblState Order by StateName"
    InsertCommand="usp_StateProc" InsertCommandType="StoredProcedure" UpdateCommand="usp_StateProc"
    UpdateCommandType="StoredProcedure" DeleteCommand="usp_StateProc" DeleteCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="StateID" Type="Decimal" />
        <asp:Parameter Name="StateName" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
        <asp:Parameter Name="UserID" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="StateID" Type="Decimal" />
        <asp:Parameter Name="StateName" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
        <asp:Parameter Name="UserID" Type="Decimal" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="StateID" Type="Decimal" />
        <asp:Parameter Name="StateName" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
        <asp:Parameter Name="UserID" Type="Decimal" />
    </DeleteParameters>
</asp:SqlDataSource>
</ContentTemplate>
</asp:UpdatePanel>