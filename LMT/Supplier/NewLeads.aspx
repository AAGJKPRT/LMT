<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/SupplierMaster.Master" AutoEventWireup="true"
    CodeBehind="NewLeads.aspx.cs" Inherits="LMT.Supplier.NewLeads" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .row-centered
        {
            text-align: center;
        }
        .col-centered
        {
            display: inline-table;
            float: none;
            text-align: left;
            margin-right: -4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="demo-wrapper">
        <header id="ccr-header">
		<div class="ccr-hbg">			 
			<div class="ccr-slug" >
				<div class="container">
                    
                    <div class="row row-centered">

                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                     
                      <div class="col-sm-3 col-md-6 col-lg-4 col-centered">
                         <asp:HiddenField ID="hfLeadID" runat="server" />
                         <asp:HiddenField ID="hfLeadMode" runat="server" />
                         <asp:HiddenField ID="hfOpmode" runat="server" />
                         <asp:HiddenField  ID="hfUserName" runat="server"/>
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Customer Details</p>
                                  <h3>
                                  </h3>
                                  <h3>
                                  </h3>
                                  <h3>
                                  </h3>
                                  <h3></h3>
                              </h3>
                           </div>

                           <div class="panel-body">
                               <div class="form-horizontal">
                                    <div class="form-group">
                                        <label for="CustName" class="control-label col-xs-4" style="text-align:left;">Name</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtCustName" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                            <asp:HiddenField ID="hfSupplierID" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="CustMobNo" class="control-label col-xs-4" style="text-align:left;">Mobile No.</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtCustMobNo" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="CustEmail" class="control-label col-xs-4" style="text-align:left;">Email ID</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="CustAddress" class="control-label col-xs-4" style="text-align:left;">Address</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="Custlookingfor" class="control-label col-xs-4" style="text-align:left;">Looking For</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtLookFor" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="CustDate" class="control-label col-xs-4" style="text-align:left;">Date</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtCustDate" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="CustTime" class="control-label col-xs-4" style="text-align:left;">Time</label>
                                        <div class="col-xs-8">
                                            <asp:TextBox ID="txtCustTime" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                                        </div>
                                    </div>                                     
                                </div>                      
                           </div>
                        </div>
                      </div>
                                                                 
                      <div class="col-sm-3 col-md-6 col-lg-4 col-centered">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Assign Lead to Supplier</p>
                                  <h3>
                                  </h3>
                                  <h3>
                                  </h3>
                                  <h3>
                                  </h3>
                                  <h3></h3>
                              </h3>
                           </div>
                           <div class="panel-body">
                               <div >
                                  <asp:Image ID="LabourImageControl" runat="server" ImageUrl="" Height="125px" Width="150px" />
                                  <div class="caption">                                    
                                    <p><strong>Name : </strong><asp:Label ID="lblName" runat="server"></asp:Label>
                                    <br />
                                   <p><asp:CheckBox ID="chkIsCompleted" runat="server" Text="Lead Completed" OnCheckedChanged="chkIsCompleted_CheckedChanged" /></p>
                                    <p><asp:Button ID="btnAccept" runat="server" CssClass="btn btn-primary" 
                                            Text="Accept" onclick="btnAccept_Click"></asp:Button></p>
                                  <p><asp:Button ID="btnComplete" runat="server" CssClass="btn btn-primary" 
                                            Text="Complete" onclick="btnComplete_Click"></asp:Button></p>
                                  </div>
                                </div>        
                                          
                           </div>
                        </div>
                      </div>
                    
                    </ContentTemplate>
                   </asp:UpdatePanel>
				</div><!-- /.ccr-slug -->
			</div>
        </div><!-- /.ccr-hbg -->
        </div>
		</header>
        <!--end dashboard-->
    </div>
</asp:Content>
