<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CityUC.ascx.cs" Inherits="LMT.MasterUC.CityUC" %>
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
            <asp:Repeater ID="rptCity" runat="server" OnDataBinding="rptCity_OnDataBinding" OnItemCommand="rptCity_OnItemCommand"
                OnItemDataBound="rptCity_OnItemDataBound">
                <HeaderTemplate>
                    <table border="0" style="width: 450px;" class="display" id="example1">
                        <thead>
                            <th align="left" style="width: 200px;">
                                City
                            </th>
                            <th align="left" style="width: 180px;">
                                State
                            </th>
                            <th style="width: 50px;">
                                City Code
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
                            <asp:Label ID="lblCityName" runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                            <asp:TextBox ID="txtCityName" CssClass="cssTextBox cssTextBox-enabled" runat="server"
                                Style="width: 80px;" Visible="false" Text='<%#Eval("CityName") %>'></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblState" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                            <asp:DropDownList ID="ddlState" runat="server" Style="width: 80px;" Visible="false"
                                CssClass="cssDropDownList cssDropDownList-enabled">
                            </asp:DropDownList>
                        </td>
                        <td align="center">
                            <asp:Label ID="lblCityCode" runat="server" Text='<%#Eval("CityCode") %>'></asp:Label>
                            <asp:TextBox ID="txtCityCode" CssClass="cssTextBox cssTextBox-enabled" runat="server"
                                Style="width: 80px;" Visible="false" Text='<%#Eval("CityCode") %>'></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:Label ID="lblIsVerify" runat="server" Text='<%#Eval("IsVerify") %>'></asp:Label>
                            <asp:CheckBox ID="chkIsVerify" Text="." ForeColor="White" Visible="false" runat="server"
                                Checked='<%#Eval("IsVerify").ToString().Trim()=="Y" %>' />
                        </td>
                        <td align="center">
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
                    <tr align="right">
                        <th colspan="3" style="border: 0px;">
                        </th>
                        <th colspan="3" align="left" style="border: 0px;">
                            <asp:LinkButton ID="lbtnAdd"  Text="Add" ClientIDMode="AutoID" runat="server" CommandName="Add" style="float:right;margin-right:25px;font-size: 14px;" />
                        </th>
                    </tr>
                    </tbody> </table></FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Panel>
<table style="border: 0px;" width="450">
    <tr align="center">
        <td style="height:35px; width: auto; border: 0px;">
            <asp:LinkButton ID="lbtnPrev" CssClass="prevBtn" runat="server" 
                onclick="lbtnPrev_Click" ></asp:LinkButton>
            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
            <asp:LinkButton ID="lbtnNext" CssClass="nextBtn" runat="server" OnClick="lbtnNext_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
<asp:SqlDataSource ID="srcCity" runat="server" ConnectionString="<%$ ConnectionStrings:Mainconnstr %>"
    SelectCommand="Select CityID,CityName,tblState.StateName State,tblCity.StateID,CityCode,tblCity.IsVerify,'True' UpdateMode,'False' InsertMode From tblCity Inner Join tblState On tblState.StateID=tblCity.StateID order by CityName"
    InsertCommand="usp_CityProc" InsertCommandType="StoredProcedure" UpdateCommand="usp_CityProc"
    UpdateCommandType="StoredProcedure" DeleteCommand="usp_CityProc" DeleteCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="CityID" Type="Decimal" />
        <asp:Parameter Name="StateID" Type="Decimal" />
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="CityCode" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
        <asp:Parameter Name="UserID" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="CityID" Type="Decimal" />
        <asp:Parameter Name="StateID" Type="Decimal" />
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="CityCode" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
        <asp:Parameter Name="UserID" Type="Decimal" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="CityID" Type="Decimal" />
        <asp:Parameter Name="StateID" Type="Decimal" />
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="CityCode" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
        <asp:Parameter Name="UserID" Type="Decimal" />
    </DeleteParameters>
</asp:SqlDataSource>
