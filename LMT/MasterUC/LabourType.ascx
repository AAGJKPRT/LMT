<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LabourType.ascx.cs" Inherits="LMT.MasterUC.LabourType" %>
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
            <asp:Repeater ID="rptLabourType" runat="server" OnDataBinding="rptLabourType_OnDataBinding" OnItemCommand="rptLabourType_OnItemCommand"
                OnItemDataBound="rptLabourType_OnItemDataBound">
                <HeaderTemplate>
                    <table border="0" style="width: 650px;" class="display" id="example1">
                        <thead>
                            <th align="left" style="width: 290px;">
                                Labour Type
                            </th>
                            <th align="left" style="width: 180px;">
                                Sector
                            </th>
                            <th style="width: 60px;">
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
                            <asp:Label ID="lblLabourType" runat="server" Text='<%#Eval("Lbr_Type") %>'></asp:Label>
                            <asp:TextBox ID="txtLabourType" CssClass="cssTextBox cssTextBox-enabled" runat="server"
                                Style="width: 150px;" Visible="false" Text='<%#Eval("Lbr_Type") %>'></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblSector" runat="server" Text='<%#Eval("SectorName") %>'></asp:Label>
                            <asp:DropDownList ID="ddlSector" runat="server" Style="width: 150px;" Visible="false"
                                CssClass="cssDropDownList cssDropDownList-enabled">
                                
                            </asp:DropDownList>
                        </td>
                        <td align="left">
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
                        <th colspan="2" align="left" style="border: 0px;">
                            <asp:LinkButton ID="lbtnAdd"  Text="Add" ClientIDMode="AutoID" runat="server" CommandName="Add" style="float:right;margin-right:25px;font-size: 14px;" />
                        </th>
                    </tr>
                    </tbody> </table></FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Panel>
<table style="border: 0px;" width="650">
    <tr align="center">
        <td style="height:35px; width: auto; border: 0px;">
            <asp:LinkButton ID="lbtnPrev" CssClass="prevBtn" runat="server" 
                onclick="lbtnPrev_Click" ></asp:LinkButton>
            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
            <asp:LinkButton ID="lbtnNext" CssClass="nextBtn" runat="server" OnClick="lbtnNext_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
<asp:SqlDataSource ID="srcLabourType" runat="server" ConnectionString="<%$ ConnectionStrings:Mainconnstr %>"
    SelectCommand="Select Lbr_type_id,Lbr_Type,tbl_Sector.SectorName,tbl_Lbr_Type.Sector,tbl_Lbr_Type.IsVerify,'True' UpdateMode,'False' InsertMode From tbl_Lbr_Type Inner Join tbl_Sector On tbl_Lbr_Type.Sector=tbl_Sector.SectorID order by Lbr_Type"
    InsertCommand="usp_LabourTypeProc" InsertCommandType="StoredProcedure" UpdateCommand="usp_LabourTypeProc"
    UpdateCommandType="StoredProcedure" DeleteCommand="usp_LabourTypeProc" DeleteCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="Lbr_type_id" Type="Decimal" />
        <asp:Parameter Name="Sector" Type="Decimal" />
        <asp:Parameter Name="Lbr_Type" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="Lbr_type_id" Type="Decimal" />
        <asp:Parameter Name="Sector" Type="Decimal" />
        <asp:Parameter Name="Lbr_Type" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="opMode" Type="String" />
        <asp:Parameter Name="Lbr_type_id" Type="Decimal" />
        <asp:Parameter Name="Sector" Type="Decimal" />
        <asp:Parameter Name="Lbr_Type" Type="String" />
        <asp:Parameter Name="IsVerify" Type="String" />
    </DeleteParameters>
</asp:SqlDataSource>
