<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditSupProfile.aspx.cs" Inherits="LMT.Admin.EditSupProfile" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ShowMessageBox="True" ShowSummary="False" ForeColor="Red"
        runat="server" ID="validationSummary" meta:resourcekey="validationSummaryResource1"></asp:ValidationSummary>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="demo-wrapper">
                <header id="ccr-header">
		                <div class="ccr-hbg">			 
			                <div class="ccr-slug" style="padding-top:5px;height:715px;">
				                <div class="container">                    
                                    <div class="row">

                                         <div class="col-sm-3 col-md-6 col-lg-8" style="margin: 0px auto;float: none;">
                                             <div class="panel panel-default" style="margin-bottom:0px;">
                                               <div class="panel-heading">
                                                  <h3 class="panel-title">
                                                     <p class="text-center">Supplier Profile</p>
                                                    
                                                  </h3>
                                               </div>
                                               <div class="panel-body">
                                                  <div role="form" style="">
                                                    <div class="form-group">
                                                        <div id="dvSupPfView" runat="server">
                                                             <table class="table" style="margin: 0px auto;text-align: left;width: 95%;">                                                           
                                                               <tbody>
                                                                  <tr>
                                                                     <td rowspan="4" style="border-top:none">
                                                                         <div>
                                                                            <asp:Image ID="ImgSupplier" runat="server" Height="125px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left: 6%;" meta:resourcekey="ImgSupplierResource1" />
                                                                         </div>
                                                                     </td>
                                                                     <td style="border-top:none">                                                                         
                                                                         <strong>Full Name :&nbsp;</strong> 
                                                                         <asp:Label ID="lblFullName" runat="server" Text="Name" meta:resourcekey="lblFullNameResource"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                         <strong>Current Address :&nbsp;</strong>
                                                                         <asp:Label ID="lblCurrentAdd" runat="server"
                                                                             Text="Current Address" meta:resourcekey="lblCurrentAddResource"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                         <strong>State :&nbsp;</strong>
                                                                         <asp:Label ID="lblCurrentState" 
                                                                            runat="server" Text="Current State" meta:resourcekey="lblCurrentStateResource"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                         <strong>City :&nbsp;</strong>
                                                                         <asp:Label ID="lblCurrentCity" runat="server" 
                                                                            Text="Current City" meta:resourcekey="lblCurrentCityResource"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                        <strong>Pincode :&nbsp;</strong>
                                                                         <asp:Label ID="lblPincode" runat="server" Text="Pincode" 
                                                                            meta:resourcekey="lblPincodeResource"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Mobile No. :&nbsp;</strong>
                                                                         <asp:Label ID="lblPhone"
                                                                             runat="server" Text="Mobile No." meta:resourcekey="lblPhoneResource"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">
                                                                        <strong>Email ID :&nbsp;</strong>
                                                                        <asp:Label ID="lblEmail" runat="server"
                                                                             Text="Email ID" meta:resourcekey="lblEmailResource"></asp:Label>                                                               
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                      <strong>Company Name :&nbsp;</strong>
                                                                        <asp:Label ID="lblCompanyName" runat="server" 
                                                                            Text="Company Name" meta:resourcekey="lblCompanyNameResource"></asp:Label>
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">
                                                                        <strong>Bank Name :&nbsp;</strong>
                                                                        <asp:Label ID="lblBankName" runat="server" 
                                                                            Text="Bank Name" meta:resourcekey="lblBankNameResource"></asp:Label>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                       <strong>Bank A/C No. :&nbsp;</strong>
                                                                        <asp:Label ID="lblBankAccNo" 
                                                                            runat="server" Text="Bank Account No." meta:resourcekey="lblBankAccNoResource"></asp:Label>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>A/C IFSC Code :&nbsp;</strong>
                                                                        <asp:Label ID="lblIFSCCode" runat="server" Text="A/C IFSC Code" 
                                                                            meta:resourcekey="lblIFSCCodeResource"></asp:Label>
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">  
                                                                        <strong>Document Uploaded :&nbsp;</strong>
                                                                        <asp:Label ID="lblDocument" runat="server"
                                                                             meta:resourcekey="lblDocumentResource"></asp:Label>       
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>&nbsp;</strong>
                                                                        <asp:Label ID="lblPreSupCode" runat="server" Text="SUP" 
                                                                            meta:resourcekey="lblPreSupCodeResource"></asp:Label>
                                                                        <asp:Label ID="lblSupCode" runat="server" Text="Supplier Code" meta:resourcekey="lblSupCodeResource"></asp:Label>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>Membership :&nbsp;</strong>
                                                                        <asp:Label ID="lblMembership" runat="server"
                                                                             meta:resourcekey="lblMembershipResource"></asp:Label>
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">
                                                                    
                                                                    </td>
                                                                    <td colspan="2" style="border-top:none;text-align:right;">
                                                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="100px" 
                                                                            CssClass="btn btn-primary" onclick="btnEdit_Click" meta:resourcekey="btnEditResource" ></asp:Button>
                                                                        <asp:Button ID="btnBack" runat="server" CausesValidation="False" 
                                                                            Text="Back" Width="100px" 
                                                                        CssClass="btn btn-primary" onclick="btnBack_Click" meta:resourcekey="btnBackResource" ></asp:Button>
                                                                    </td>
                                                                  </tr>
                                                               </tbody>
                                                            </table>
                                                        </div>    
                                                        <div id="dvSupPfEdit" runat="server" visible="False">
                                                        
                                                            <table class="table" style="margin: 0px auto;text-align: left;width: 95%;">                                                           
                                                               <tbody>
                                                                  <tr>
                                                                     <td rowspan="4" style="border-top:none">
                                                                     <div>
                                                                        <asp:HiddenField ID="hfOpMode" runat="server" />
                                                                        <asp:HiddenField ID="hfSupID" runat="server" />
                                                                        <asp:Image ID="SupplierImageControl" runat="server" Height="125px" Width="150px" class="img-thumbnail"
                                                                             style="margin: 3%;margin-left: 6%;" meta:resourcekey="SupplierImageControlResource" />
                                                                        <asp:FileUpload ID="fluSupplier" CssClass="form-control" ClientIDMode="AutoID"
                                                                             Style="width: 117px;margin-left:25px;" size="14px" onchange="this.form.submit();" runat="server" meta:resourcekey="fluSupplierResource"></asp:FileUpload>
                                                                        <asp:Label ID="lblFileUpload" runat="server" Height="14px" Style="overflow: hidden;margin-left: 66px;" meta:resourcekey="lblFileUploadResource"></asp:Label>
                                                                    </div>
                                                                     </td>
                                                                     <td style="border-top:none">                                                                                
                                                                                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name" CssClass="form-control" 
                                                                                        meta:resourcekey="txtFullNameResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtFullName"
                                                                                    Display="None" meta:resourcekey="rfvNameResource" />
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                         <asp:TextBox ID="txtCurrentAdd" runat="server" placeholder="Current Address"
                                                                          CssClass="form-control" meta:resourcekey="txtCurrentAddResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvCurrentAdd" ControlToValidate="txtCurrentAdd"
                                                                                    Display="None" meta:resourcekey="rfvCurrentAddResource" />
                                                                     </td>
                                                                  </tr>
                                                                  <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                         <asp:DropDownList ID="ddlCurrentState" ClientIDMode="AutoID" runat="server" 
                                                                                     CssClass="form-control" AutoPostBack="True" meta:resourcekey="ddlCurrentStateResource" AppendDataBoundItems="True">
                                                                          <asp:ListItem Text="<%$ Resources:ListITEMEmptyText %>" Value="<%$ Resources:ListITEMEmptyValue %>" />
                                                                                    </asp:DropDownList>
                                                                                
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvCurrentState" ControlToValidate="ddlCurrentState"
                                                                                    Display="None" meta:resourcekey="rfvCurrentStateResource" />
                                                                     </td>
                                                                     <td style="border-top:none"><asp:DropDownList ID="ddlCurrentCity" ClientIDMode="AutoID" runat="server" 
                                                                                     CssClass="form-control" meta:resourcekey="ddlCurrentCityResource" AppendDataBoundItems="True">
                                                                          <asp:ListItem Text="<%$ Resources:ListITEMEmptyText %>" Value="<%$ Resources:ListITEMEmptyValue %>" />
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvCurrentCity" ControlToValidate="ddlCurrentCity"
                                                                                    Display="None" meta:resourcekey="rfvCurrentCityResource" />
                                                                                
                                                                     </td>
                                                                 
                                                                  </tr>
                                                                   <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                         <asp:TextBox ID="txtCurrentPincode" MaxLength="6" runat="server" placeholder="Current Pincode" CssClass="form-control" 
                                                                             meta:resourcekey="txtCurrentPincodeResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvPinCode" ControlToValidate="txtCurrentPincode"
                                                                                    Display="None"  meta:resourcekey="rfvPinCodeResource" />

                                                                    <asp:FilteredTextBoxExtender ID="fltPinCode" FilterType="Numbers" TargetControlID="txtCurrentPincode" runat="server" Enabled="True"></asp:FilteredTextBoxExtender>
                                                                                
                                                                     </td>
                                                                     <td style="border-top:none"><asp:TextBox ID="txtPhone" MaxLength="10" runat="server" placeholder="Phone no." 
                                                                         CssClass="form-control" meta:resourcekey="txtPhoneResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvPhone" ControlToValidate="txtPhone"
                                                                                    Display="None"  meta:resourcekey="rfvPhoneResource" />
                                                                    <asp:FilteredTextBoxExtender ID="fltPhone" FilterType="Numbers" TargetControlID="txtPhone" runat="server" Enabled="True"></asp:FilteredTextBoxExtender>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtEmail" runat="server" placeholder="Email ID" CssClass="form-control"
                                                                         meta:resourcekey="txtEmailResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail"
                                                                                    Display="None" meta:resourcekey="rfvEmailResource" />                                                                
                                                                    </td>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtCompanyName" runat="server" placeholder="Company Name" CssClass="form-control"
                                                                         meta:resourcekey="txtCompanyNameResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvCompanyName" ControlToValidate="txtCompanyName"
                                                                                    Display="None"  meta:resourcekey="rfvCompanyNameResource" />
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtBankName" runat="server" placeholder="Bank Name" CssClass="form-control"
                                                                         meta:resourcekey="txtBankNameResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvBankName" ControlToValidate="txtBankName"
                                                                                    Display="None"  meta:resourcekey="rfvBankNameResource" />
                                                                    </td>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtBankACNo" runat="server" placeholder="Bank A/C No." CssClass="form-control"
                                                                         meta:resourcekey="txtBankACNoResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvBankACNo" ControlToValidate="txtBankACNo"
                                                                                    Display="None" meta:resourcekey="rfvBankACNoResource" />
                                                                    </td>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtIFSCCode" runat="server" placeholder="A/C IFSC Code" CssClass="form-control"
                                                                         meta:resourcekey="txtIFSCCodeResource"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="rfvIFSCCode" ControlToValidate="txtIFSCCode"
                                                                                    Display="None"  meta:resourcekey="rfvIFSCCodeResource" />
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none"><asp:FileUpload ID="fluDocument1" ClientIDMode="AutoID" CssClass="form-control" 
                                                                        onchange="this.form.submit();" runat="server" Width="175px" meta:resourcekey="fluDocument1Resource"></asp:FileUpload>
                                                                
                                                                                
                                                                    </td>
                                                                    <td style="border-top:none"><asp:FileUpload ID="fluDocument2" ClientIDMode="AutoID" CssClass="form-control" 
                                                                        onchange="this.form.submit();" runat="server" Width="175px" meta:resourcekey="fluDocument2Resource"></asp:FileUpload>
                                                                                
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <asp:CheckBox ID="ChkMemberShip" runat="server" Text="MemberShip" meta:resourcekey="ChkMemberShipResource"></asp:CheckBox>
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">
                                                                        <asp:TextBox ID="txtPreSupCode"  runat="server" CssClass="form-control cssTextBox cssTextBox-enabled"
                                                                            Width="50px" Text="SUP" Enabled="False" Style="margin-left: 2px;display:inline" ReadOnly="True" meta:resourcekey="txtPreSupCodeResource"></asp:TextBox>
                                                                            <asp:TextBox ID="txtSupCode" runat="server" CssClass="form-control cssTextBox cssTextBox-enabled"
                                                                            Width="118px" Style="margin-left: 2px;display: inline;" ReadOnly="True" meta:resourcekey="txtSupCodeResource"></asp:TextBox>
                                                                    </td>
                                                                    <td colspan="2" style="border-top:none;text-align:right;">
                                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" 
                                                                            CssClass="btn btn-primary" onclick="btnSubmit_Click" meta:resourcekey="btnSubmitResource" ></asp:Button>
                                                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                                                            Text="Cancel" Width="100px" 
                                                                        CssClass="btn btn-primary" onclick="btnCancel_Click" meta:resourcekey="btnCancelResource" ></asp:Button>
                                                                    </td>
                                                                  </tr>
                                                               </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                  </div>
                                               </div>
                                            </div>
                                          </div>
					                </div>
				                </div><!-- /.ccr-slug -->
			                </div>
                        </div><!-- /.ccr-hbg -->
		            </header>
                <!--end dashboard-->
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
