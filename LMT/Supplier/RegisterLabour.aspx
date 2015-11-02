<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/SupplierMaster.Master"
    AutoEventWireup="true" CodeBehind="RegisterLabour.aspx.cs" Inherits="LMT.Supplier.RegisterLabour1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .thumbs {
            float: left;
            height: 50px;
            width: 50px;
            padding-right: 4px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ShowMessageBox="true" ShowSummary="false" ForeColor="Red"
        runat="server" ID="validationSummary"></asp:ValidationSummary>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="demo-wrapper">
                <header id="ccr-header">
		            <div class="ccr-hbg">			 
			            <div class="ccr-slug" style="padding-top:5px;height:585px;">
				            <div class="container">                    
                                <div class="row">
                                    <div class="col-sm-3 col-md-6 col-lg-10" style="margin: 0px auto;float: none;">
                                        <div class="panel panel-default" style="margin-bottom:0px;">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">
                                                    <p class="text-center">Entry Form</p>
                                                </h3>
                                            </div>
                                            <div class="panel-body">
                                                <div role="form" style="">
                                                    <div class="form-group">
                                                        <div id="dvLabPfView" runat="server" visible="true">
                                                             <table class="table" style="margin: 0px auto;margin-left: 6%;text-align: left;width: 95%;">                                                           
                                                               <tbody>
                                                                  <tr>
                                                                     <td rowspan="4" style="border-top:none">
                                                                         <div>
                                                                            <asp:Image ID="ImgLabour" runat="server" ImageUrl="" Height="125px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left: 6%;" />
                                                                         </div>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                         <strong>Full Name :&nbsp;</strong> <asp:Label ID="lblFullName" runat="server" Text="Name"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Father's Name</strong><asp:Label ID="lblFatherName" runat="server" Text="Father's Name"></asp:Label>
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
                                                                        <strong>Permanent Address :&nbsp;</strong><asp:Label ID="lblPermanentAddress" runat="server" Text="Permanent Address"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Permanent State :&nbsp;</strong><asp:Label ID="lblPermanentState" runat="server" Text="Permanent State"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr> 
                                                                     <td style="border-top:none">
                                                                        <strong>Belonging Phone 1 :&nbsp;</strong><asp:Label ID="lblBelongingPhone1" runat="server" Text="Belonging Phone 1"></asp:Label>
                                                                     </td>                                                                 
                                                                     <td style="border-top:none">
                                                                        <strong>Permanent City :&nbsp;</strong><asp:Label ID="lblpermanentCity" runat="server" Text="Permanent City"></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Permanent Pincode :&nbsp;</strong><asp:Label ID="lblPermanentPincode" runat="server" Text="Permanent Pincode"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>  
                                                                     <td style="border-top:none">
                                                                        <strong>Belonging Phone 2 :&nbsp;</strong><asp:Label ID="lblBelongingPhone2" runat="server" Text="Belonging Phone 2"></asp:Label>
                                                                     </td>                                                               
                                                                     <td style="border-top:none">
                                                                        <strong>Mobile No. :&nbsp;</strong><asp:Label ID="lblPhone" runat="server" Text="Mobile No."></asp:Label>
                                                                     </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Sector Type :&nbsp;</strong><asp:Label ID="lblSectorType" runat="server" Text="Sector Type"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>           
                                                                     <td style="border-top:none">
                                                                        <strong>Belonging Phone 3 :&nbsp;</strong><asp:Label ID="lblBelongingPhone3" runat="server" Text="Belonging Phone 3"></asp:Label>
                                                                     </td>                                                      
                                                                     <td style="border-top:none">  
                                                                        <strong>Labour Type :&nbsp;</strong><asp:Label ID="lblLabourType" runat="server" Text="Labour Type"></asp:Label>                                                                            
                                                                    </td>
                                                                     <td style="border-top:none">
                                                                        <strong>Skill Type :&nbsp;</strong><asp:Label ID="lblSkillType" runat="server" Text="Skill Type"></asp:Label>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="border-top:none">
                                                                        <strong>Belonging Phone 4 :&nbsp;</strong><asp:Label ID="lblBelongingPhone4" runat="server" Text="Belonging Phone 4"></asp:Label>
                                                                     </td> 
                                                                    <td style="border-top:none">
                                                                        <strong>Work Specialization :&nbsp;</strong><asp:Label ID="lblWorkSpecialization" runat="server" Text="Work Specialization"></asp:Label> 
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <strong>Experience :&nbsp;</strong><asp:Label ID="lblExperience" runat="server" Text="Experience"></asp:Label>
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
                                                                        <strong>Wages :&nbsp;</strong><asp:Label ID="lblWages" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <a id="aDoc1" href="" runat="server"><asp:Image ID="imgDoc1" runat="server" CssClass="thumbs" /></a>
                                                                        <a id="aDoc2" href="" runat="server"><asp:Image ID="imgDoc2" runat="server" CssClass="thumbs" /></a>
                                                                        <a id="aDoc3" href="" runat="server"><asp:Image ID="imgDoc3" runat="server" CssClass="thumbs" /></a>
                                                                        <a id="aDoc4" href="" runat="server"><asp:Image ID="imgDoc4" runat="server" CssClass="thumbs" /></a>
                                                                    </td>
                                                                    <td  style="border-top:none;">
                                                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="70" 
                                                                            CssClass="btn btn-primary" onclick="btnEdit_Click" ></asp:Button>
                                                                        
                                                                        <asp:Button ID="btnBack" runat="server" CausesValidation="false" 
                                                                            Text="Back" Width="70" CssClass="btn btn-primary" onclick="btnBack_Click" ></asp:Button>
                                                                    </td>
                                                                  </tr>
                                                               </tbody>
                                                            </table>
                                                        </div> 
                                                        <div id="dvLabPfEdit" runat="server" visible="false">                                                       
                                                            <table class="table" style="margin: 0px auto;text-align: left;width: 95%;">                                                           
                                                                <tbody>
                                                                    <tr>
                                                                        <td rowspan="5" style="border-top:none">
                                                                        <div>
                                                                        <asp:HiddenField ID="hfRegID" runat="server" />
                                                                        <asp:HiddenField ID="hfOpmode" runat="server" />
                                                                        <asp:HiddenField  ID="hfUserName" runat="server"/>
                                                                        <asp:Image ID="LabourImageControl" runat="server" ImageUrl="" Height="125px" Width="150px" class="img-thumbnail" style="margin: 3%;margin-left: 15%;" />
                                                                        <%--<img src="images/Lbr_imgbr.png" alt="" class="img-thumbnail" style="margin: 3%;margin-left: 15%;"/>--%>
                                                                        <asp:FileUpload ID="fluLabour" CssClass="form-control" ClientIDMode="AutoID" Style="width: 117px;margin-left:52px;" size="14px" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                                        <asp:Label ID="lblFileUpload" runat="server" Height="14px" Style="overflow: hidden;margin-left: 66px;"></asp:Label>
                                                                    </div>
                                                                        </td>
                                                                        <td style="border-top:none"><asp:TextBox ID="txtFullName" runat="server" Width="200" placeholder="Full Name" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RFVComapnyName" ControlToValidate="txtFullName"
                                                                                    Display="None" ErrorMessage="Labour name is required." />
                                                                        </td>
                                                                        <td style="border-top:none"><asp:TextBox ID="txtFatherName" runat="server" Width="200" placeholder="Father's Name" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtFatherName"
                                                                                    Display="None" ErrorMessage="Father name is required." />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>                                                                 
                                                                        <td style="border-top:none"><asp:TextBox ID="txtCurrentAdd" runat="server" placeholder="Current Address" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtCurrentAdd"
                                                                                    Display="None" ErrorMessage="Current Address is required." />
                                                                        </td>
                                                                        <td style="border-top:none">
                                                                                    <asp:DropDownList ID="ddlCurrentState" ClientIDMode="AutoID" runat="server" 
                                                                                        CssClass="form-control" AutoPostBack="true" 
                                                                                        onselectedindexchanged="ddlCurrentState_SelectedIndexChanged">
                                                                                         <asp:ListItem Text="--Select--" Value="-1" />
                                                                                    </asp:DropDownList>
                                                                                
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="ddlCurrentState"
                                                                                    Display="None" ErrorMessage="Current State is required." />
                                                                        </td>
                                                                 
                                                                    </tr>
                                                                    <tr>                                                                 
                                                                        <td style="border-top:none">
                                                                                    <asp:DropDownList ID="ddlCurrentCity" Enabled="false" ClientIDMode="AutoID" runat="server" 
                                                                                        CssClass="form-control"> <asp:ListItem Text="--Select--" Value="-1" />
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="ddlCurrentCity"
                                                                                    Display="None" ErrorMessage="Current City is required." />
                                                                        </td>
                                                                        <td style="border-top:none"><asp:TextBox ID="txtCurrentPincode" MaxLength="6" Enabled="false" runat="server" placeholder="Current Pincode" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator14" ControlToValidate="txtCurrentPincode"
                                                                                    Display="None" ErrorMessage="Current Pincode is required." />
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" FilterType="Numbers" TargetControlID="txtCurrentPincode" runat="server"></asp:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="border-top:none"><asp:TextBox ID="txtPermanentAdd" runat="server" placeholder="Permanent Address" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPermanentAdd"
                                                                                    Display="None" ErrorMessage="Permanent Address is required." />
                                                                        </td>
                                                                        <td style="border-top:none">
                                                                                    <asp:DropDownList ID="ddlPermanetState" ClientIDMode="AutoID" runat="server" 
                                                                                        CssClass="form-control" AutoPostBack="true" 
                                                                                        onselectedindexchanged="ddlPermanetState_SelectedIndexChanged">
                                                                                         <asp:ListItem Text="--Select--" Value="-1" />
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator16" ControlToValidate="ddlPermanetState"
                                                                                    Display="None" ErrorMessage="Permanent State is required." />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="border-top:none">
                                                                                    <asp:DropDownList ID="ddlPermanentCity" Enabled="false" ClientIDMode="AutoID" runat="server" 
                                                                                        CssClass="form-control">
                                                                                         <asp:ListItem Text="--Select--" Value="-1" />
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator15" ControlToValidate="ddlPermanentCity"
                                                                                    Display="None" ErrorMessage="Permanent City is required." />
                                                                        </td>
                                                                 
                                                                        <td style="border-top:none"><asp:TextBox ID="txtPermanentPicode" Enabled="false" MaxLength="6" runat="server" placeholder="Permanent Pincode" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator17" ControlToValidate="txtPermanentPicode"
                                                                                    Display="None" ErrorMessage="Permanent Pincode is required." />
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" FilterType="Numbers" TargetControlID="txtPermanentPicode" runat="server"></asp:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="border-top:none">
                                                                        <asp:TextBox ID="txtb1" runat="server" Width="229" MaxLength="10" placeholder="Phone no. of Belonging 1" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtb1"
                                                                                    Display="None" ErrorMessage="Belonging-1 is required." />
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" FilterType="Numbers" TargetControlID="txtb1" runat="server"></asp:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td style="border-top:none"><asp:TextBox ID="txtPhone" MaxLength="10" runat="server" Width="200" placeholder="Phone no." CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtPhone"
                                                                                    Display="None" ErrorMessage="Phone No. is required." />
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" FilterType="Numbers" TargetControlID="txtPhone" runat="server"></asp:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td style="border-top:none">
                                                                        <asp:DropDownList ID="ddlSectorType" ClientIDMode="AutoID" runat="server" 
                                                                            CssClass="form-control" AutoPostBack="True" 
                                                                                onselectedindexchanged="ddlSectorType_SelectedIndexChanged">
                                                                            <asp:ListItem Value="0">Sector type</asp:ListItem>
                                                                            <asp:ListItem Text="HH" Value="1">House hold</asp:ListItem>
                                                                            <asp:ListItem Text="GL" Value="2">General labor</asp:ListItem>
                                                                            <asp:ListItem Text="IL" Value="3">Industrial labour</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="ddlSectorType"
                                                                                    Display="None" ErrorMessage="Sector type is required." />
                                                                    
                                                                        </td>                                                                 
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtb2" runat="server" MaxLength="10" Width="229" placeholder="Phone no. of Belonging 2" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtb2"
                                                                                    Display="None" ErrorMessage="Belonging-2 is required." />
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" FilterType="Numbers" TargetControlID="txtb2" runat="server"></asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td style="border-top:none"><asp:FileUpload ID="fluDocument1" ClientIDMode="AutoID" CssClass="form-control" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                                
                                                                                
                                                                    </td>
                                                                    <td style="border-top:none"><asp:FileUpload ID="fluDocument2" ClientIDMode="AutoID" CssClass="form-control" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                                                
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtb3" runat="server" MaxLength="10" Width="229" placeholder="Phone no. of Belonging 3" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="txtb3"
                                                                                    Display="None" ErrorMessage="Belonging-3 is required." />
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" FilterType="Numbers" TargetControlID="txtb3" runat="server"></asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td style="border-top:none"><asp:FileUpload ID="fluDocument3" ClientIDMode="AutoID" CssClass="form-control" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                                    
                                                                        </td>
                                                                    <td style="border-top:none"><asp:FileUpload ID="fluDocument4" ClientIDMode="AutoID" CssClass="form-control" onchange="this.form.submit();" runat="server"></asp:FileUpload>
                                                                            </td>
                                                                    </tr>
                                                              
                                                                    <tr>
                                                                    <td style="border-top:none"><asp:TextBox ID="txtb4" runat="server" MaxLength="10" Width="229" placeholder="Phone no. of Belonging 4" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtb4"
                                                                                    Display="None" ErrorMessage="Belonging-4 is required." />
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" FilterType="Numbers" TargetControlID="txtb4" runat="server"></asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <asp:DropDownList ID="ddlLbrType" ClientIDMode="AutoID" runat="server" 
                                                                            CssClass="form-control" AutoPostBack="true" 
                                                                            onselectedindexchanged="ddlLbrType_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td style="border-top:none">
                                                                        <asp:TextBox ID="txtExp" runat="server" Width="200" placeholder="Experience" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtExp"
                                                                                    Display="None" ErrorMessage="Experience is required." />
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="border-top:none">
                                                                    <asp:TextBox ID="txtWages" runat="server" Width="200" placeholder="Wages(Rs./Day)" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator19" ControlToValidate="txtWages"
                                                                                    Display="None" ErrorMessage="Wages is required." />
                                                                    </td>
                                                                    <td rowspan="3" style="border-top:none">
                                                                    <asp:TextBox ID="txtWorkSpe" runat="server" Width="200" placeholder="Work Specialization" CssClass="form-control"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtWorkSpe"
                                                                                    Display="None" ErrorMessage="Work Specialization is required." />
                                                                    
                                                                        <br />
                                                                        <label for="name">Verification</label>
                                                                        <asp:RadioButtonList ID="rbtnVerify" ClientIDMode="AutoID" runat="server">
                                                                            <asp:ListItem Value="1">Done</asp:ListItem>
                                                                            <asp:ListItem Value="0">Not Done</asp:ListItem>                                                                        
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                    <td rowspan="3" style="border-top:none">
                                                                        <label for="name">Skill type</label>
                                                                        <asp:RadioButtonList ID="rbtnExpType" ClientIDMode="AutoID" runat="server">
                                                                          <%--  <asp:ListItem Value="1">Skilled</asp:ListItem>
                                                                            <asp:ListItem Value="2">Semi Skilled</asp:ListItem>
                                                                            <asp:ListItem Value="3">Fresher</asp:ListItem>--%>
                                                                        </asp:RadioButtonList>
                                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator18" ControlToValidate="rbtnExpType"
                                                                                    Display="None" ErrorMessage="Skyll type is required." />
                                                                    
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="border-top:none; width: 246px;">
                                                                        <asp:TextBox ID="txtPreLabourCode"  runat="server" CssClass="form-control cssTextBox cssTextBox-enabled"
                                                                            MaxLength="2" Width="100px" Style="margin-left: 2px;display:inline" ReadOnly="True"></asp:TextBox>
                                                                            <asp:TextBox ID="txtLabourCode" runat="server" CssClass="form-control cssTextBox cssTextBox-enabled"
                                                                            MaxLength="4" Width="118px" Style="margin-left: 2px;display: inline;" ReadOnly="True"></asp:TextBox>

                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td>
                                                                        <div style="width: 250px; height: 30px; margin-bottom: 10px;">
                                                                            <asp:PlaceHolder ID="plBarCode" runat="server" />
                                                                            <div style="margin-left: 74px;">
                                                                                <asp:Label ID="lblShowBarCode" runat="server" Font-Size="16px" Font-Bold="True"></asp:Label></div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="border-top:none">
                                                                    
                                                                    </td>
                                                                    <td colspan="2" style="border-top:none;text-align:center;">
                                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100" 
                                                                            CssClass="btn btn-primary" onclick="btnSubmit_Click"></asp:Button>
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
