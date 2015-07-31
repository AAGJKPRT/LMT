<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/Site.Master" AutoEventWireup="true"
    CodeBehind="EditLabProfile.aspx.cs" Inherits="LMT.MasterPages.EditLabProfile" %>

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
                                         
                                         <div class="col-sm-3 col-md-6 col-lg-8" style="margin: 0px auto;float: none;">
                                             <div class="panel panel-default" style="margin-bottom:0px;">
                                               <div class="panel-heading">
                                                  <h3 class="panel-title">
                                                     <p class="text-center">Labour Profile</p>
                                                    
                                                      <h3>
                                                      </h3>
                                                    
                                                  </h3>
                                               </div>
                                               <div class="panel-body">
                                                  <div role="form" style="">
                                                    <div class="form-group">
                                                        <div id="dvLabPfView" runat="server" visible="true">
                                                             <table class="table" style="margin: 0px auto;text-align: left;width: 95%;">                                                           
                                                               <tbody>
                                                                  <tr>
                                                                     <td rowspan="6" style="border-top:none">
                                                                         <div>
                                                                            <asp:HiddenField ID="hfLabourID" runat="server" />
                                                                            <asp:Image ID="ImgLabour" runat="server" ImageUrl="" Height="125px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left: 6%;" />
                                                                         </div>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                         <strong>Full Name :&nbsp;</strong> <asp:Label ID="lblFullName" runat="server" Text="Name"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Father's Name :&nbsp;</strong><asp:Label ID="lblFatherName" runat="server" Text="Father's Name"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                   <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                        <strong>Current Address :&nbsp;</strong><asp:Label ID="lblCurrentAdd" runat="server" Text="Current Address"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>State :&nbsp;</strong><asp:Label ID="lblCurrentState" runat="server" Text="Current State"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                        <strong>City :&nbsp;</strong><asp:Label ID="lblCurrentCity" runat="server" Text="Current City"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Pincode :&nbsp;</strong><asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>                                                                 
                                                                     <td style="border-top:none">
                                                                        <strong>Mobile No. :&nbsp;</strong><asp:Label ID="lblPhone" runat="server" Text="Mobile No."></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Sector Type :&nbsp;</strong><asp:Label ID="lblSectorType" runat="server" Text="Sector Type"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>                                                                 
                                                                     <td style="border-top:none">  
                                                                        <strong>Labour Type :&nbsp;</strong><asp:Label ID="lblLabourType" runat="server" Text="Labour Type"></asp:Label>                                                                            
                                                                    </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Skill Type :&nbsp;</strong><asp:Label ID="lblSkillType" runat="server" Text="Skill Type"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>
                                                                    
                                                                    <td style="border-top:none">
                                                                        <strong>Work Specialization :&nbsp;</strong><asp:Label ID="lblWorkSpecialization" runat="server" Text="Work Specialization"></asp:Label> 
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>Experience :&nbsp;</strong><asp:Label ID="lblExperience" runat="server" Text="Work Specialization"></asp:Label>
                                                                    </td>
                                                                  </tr>
                                                                  
                                                                  <tr>
                                                                    <td style="border-top:none">  
                                                                        <strong>Labour Code :&nbsp;</strong><asp:Label ID="lblLabourCode" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>Document Uploaded :&nbsp;</strong><asp:Label ID="lblDocument" runat="server"></asp:Label> 
                                                                        
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>Verification :&nbsp;</strong><asp:Label ID="lblVerification" runat="server"></asp:Label>
                                                                    </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">
                                                                    
                                                                    </td>
                                                                    <td colspan="2" style="border-top:none;text-align:right;">
                                                                        
                                                                        <asp:Button ID="btnBack" runat="server" CausesValidation="false" 
                                                                            Text="Back" Width="100" 
                                                                        CssClass="btn btn-primary" onclick="btnBack_Click" ></asp:Button>
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
