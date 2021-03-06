﻿<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/SupplierMaster.Master"
    AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="LMT.Supplier.EditProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ShowMessageBox="true" ShowSummary="false" ForeColor="Red"
        runat="server" ID="validationSummary"></asp:ValidationSummary>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="demo-wrapper">
                <header id="ccr-header">
		                <div class="ccr-hbg">			 
			                <div class="ccr-slug" style="padding-top:5px;height:715px;">
				                <div class="container">                    
                                    <div class="row">
                                         <%--<div class="col-sm-3 col-md-6 col-lg-4">
                                             <div class="panel panel-default">
                                               <div class="panel-heading">
                                                  <h3 class="panel-title">
                                                     <p class="text-center">Upload Photo</p>
                                                  </h3>
                                               </div>
                                               <div class="panel-body">
                                                  <div>
                                                     <img src="images/Lbr_imgbr.png" class="img-thumbnail" style="margin: 3%;"/>
                                                  </div>
                                                  <div role="form" style="">
                                                    <div class="form-group">                                                        
                                                        <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server"></asp:FileUpload>
                                                    </div>
                                                  </div>
                                               </div>
                                            </div>
                                         </div>--%>

                                         <div class="col-sm-3 col-md-6 col-lg-8" style="margin: 0px auto;float: none;">
                                             <div class="panel panel-default" style="margin-bottom:0px;">
                                               <div class="panel-heading">
                                                  <h3 class="panel-title">
                                                     <p class="text-center">My Profile</p>
                                                     
                                                      <h3>
                                                      </h3>
                                                     
                                                      <h3>
                                                      </h3>
                                                     
                                                  </h3>
                                               </div>
                                               <div class="panel-body">
                                                  <div role="form" style="">
                                                    <div class="form-group">                                                        
                                                        <table class="table" style="margin: 0px auto;text-align: left;width: 95%;">                                                           
                                                           <tbody>
                                                              <tr>
                                                                 <td rowspan="4" style="border-top:none">
                                                                 <div>
                                                                    <asp:HiddenField ID="hfOpMode" runat="server" />
                                                                    <asp:Image ID="SupplierImageControl" runat="server" ImageUrl="" Height="125px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left: 6%;" />
                                                                    <%--<img src="images/Lbr_imgbr.png" alt="" class="img-thumbnail" style="margin: 3%;margin-left: 15%;"/>--%>
                                                                    <asp:FileUpload ID="fluSupplier" CssClass="form-control" ClientIDMode="AutoID" Style="width: 117px;margin-left:25px;" size="14px" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                                    <asp:Label ID="lblFileUpload" runat="server" Height="14px" Style="overflow: hidden;margin-left: 66px;"></asp:Label>
                                                                </div>
                                                                 </td>
                                                                 <td style="border-top:none"><asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RFVName" ControlToValidate="txtFullName"
                                                                                Display="None" ErrorMessage="Labour name is required." />
                                                                 </td>
                                                                 <td style="border-top:none"><asp:TextBox ID="txtCurrentAdd" runat="server" placeholder="Current Address" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtCurrentAdd"
                                                                                Display="None" ErrorMessage="Current Address is required." />
                                                                 </td>
                                                              </tr>
                                                              <tr>                                                                 
                                                                 <td style="border-top:none"><asp:DropDownList ID="ddlCurrentState" ClientIDMode="AutoID" runat="server" 
                                                                                 CssClass="form-control" AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                                
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="ddlCurrentState"
                                                                                Display="None" ErrorMessage="Current State is required." />
                                                                 </td>
                                                                 <td style="border-top:none"><asp:DropDownList ID="ddlCurrentCity" ClientIDMode="AutoID" runat="server" 
                                                                                 CssClass="form-control">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="ddlCurrentCity"
                                                                                Display="None" ErrorMessage="Current City is required." />
                                                                                
                                                                 </td>
                                                                 
                                                              </tr>
                                                               <tr>                                                                 
                                                                 <td style="border-top:none"><asp:TextBox ID="txtCurrentPincode" MaxLength="6" runat="server" placeholder="Current Pincode" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator14" ControlToValidate="txtCurrentPincode"
                                                                                Display="None" ErrorMessage="Current Pincode is required." />
                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" FilterType="Numbers" TargetControlID="txtCurrentPincode" runat="server"></asp:FilteredTextBoxExtender>
                                                                                
                                                                 </td>
                                                                 <td style="border-top:none"><asp:TextBox ID="txtPhone" MaxLength="10" runat="server" placeholder="Phone no." CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtPhone"
                                                                                Display="None" ErrorMessage="Phone No. is required." />
                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" FilterType="Numbers" TargetControlID="txtPhone" runat="server"></asp:FilteredTextBoxExtender>
                                                                 </td>
                                                              </tr>
                                                              <tr>
                                                                <td style="border-top:none"><asp:TextBox ID="txtEmail" runat="server" placeholder="Email ID" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtEmail"
                                                                                Display="None" ErrorMessage="Email ID is required." />                                                                
                                                                </td>
                                                                <td style="border-top:none"><asp:TextBox ID="txtCompanyName" runat="server" placeholder="Company Name" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtCompanyName"
                                                                                Display="None" ErrorMessage="Company Name is required." />
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td style="border-top:none"><asp:TextBox ID="txtBankName" runat="server" placeholder="Bank Name" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtBankName"
                                                                                Display="None" ErrorMessage="Bank Name is required." />
                                                                </td>
                                                                <td style="border-top:none"><asp:TextBox ID="txtBankACNo" runat="server" placeholder="Bank A/C No." CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtBankACNo"
                                                                                Display="None" ErrorMessage="Bank A/C No. is required." />
                                                                </td>
                                                                <td style="border-top:none"><asp:TextBox ID="txtIFSCCode" runat="server" placeholder="A/C IFSC Code" CssClass="form-control"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtIFSCCode"
                                                                                Display="None" ErrorMessage="A/C IFSC Code is required." />
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td style="border-top:none"><asp:FileUpload ID="fluDocument1" ClientIDMode="AutoID" CssClass="form-control" onchange="this.form.submit();" runat="server" Width="175"></asp:FileUpload>
                                                                
                                                                                
                                                                </td>
                                                                <td style="border-top:none"><asp:FileUpload ID="fluDocument2" ClientIDMode="AutoID" CssClass="form-control" onchange="this.form.submit();" runat="server" Width="175"></asp:FileUpload>
                                                                                
                                                                </td>
                                                                <td style="border-top:none">
                                                                    <asp:CheckBox ID="ChkMemberShip" runat="server" Text="MemberShip"></asp:CheckBox>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td style="border-top:none">
                                                                    <asp:TextBox ID="txtPreSupCode"  runat="server" CssClass="form-control cssTextBox cssTextBox-enabled"
                                                                        Width="50px" Text="SUP" Enabled="false" Style="margin-left: 2px;display:inline" ReadOnly="True"></asp:TextBox>
                                                                        <asp:TextBox ID="txtSupCode" runat="server" CssClass="form-control cssTextBox cssTextBox-enabled"
                                                                        Width="118px" Style="margin-left: 2px;display: inline;" ReadOnly="True"></asp:TextBox>
                                                                </td>
                                                                <td colspan="2" style="border-top:none;text-align:right;">
                                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100" 
                                                                        CssClass="btn btn-primary" onclick="btnSubmit_Click" ></asp:Button>
                                                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="false" 
                                                                        Text="Cancel" Width="100" 
                                                                    CssClass="btn btn-primary" onclick="btnCancel_Click" ></asp:Button>
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
				                </div><!-- /.ccr-slug -->
			                </div>
                        </div><!-- /.ccr-hbg -->
		            </header>
                <!--end dashboard-->
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
