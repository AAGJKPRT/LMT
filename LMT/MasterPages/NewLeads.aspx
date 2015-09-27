<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/AdminMaster.Master" AutoEventWireup="true" EnableEventValidation="false"
    CodeBehind="NewLeads.aspx.cs" Inherits="LMT.MasterPages.NewLeads" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .row-centered {
            text-align: center;
        }

        .col-centered {
            display: inline-table;
            float: none;
            text-align: left;
            margin-right: -4px;
        }

    </style>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        //window.onload = onPageLoad();
        //function onPageLoad() {
        //    debugger;
        //    BindSupplierList();
        //}
        function BindSupplierList() {
            var $supplier = $.noConflict();
            $supplier.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "NewLeads.aspx/getSupplierList",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    debugger;
                    var json = JSON.parse(data.d);
                    $supplier('#ddlsupplier').empty();
                    var option = $supplier("<option />");
                    option.attr("value", '0').text('-- Choose Item --');
                    $supplier('#ddlsupplier').append(option)
                    $supplier.each(json, function (key, value) {
                        $supplier("#ddlsupplier").append($supplier("<option></option>").val(value.SupplierID).html(value.SupplierName));
                    });
                },
                error: function (result) {
                    alert('Oops something went wrong !, Please retry or contact support team.');
                }
            });

        }
        function updateLabelSupID() {
            // document.getElementById('lblSupID').value = document.getElementById('ddlsupplier').selectedOptions[0].value;
        }

    </script>
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
                              </h3>
                           </div>
                           <div class="panel-body">
                               <div > 
                                  <asp:Image ID="LabourImageControl" runat="server"  onerror="this.src='https://raw.githubusercontent.com/AAGJKPRT/LMT/2c35092f42028585b70f35e4f7e9a7acda72a9c9/LMT/images/dummy.jpg'" AlternateText="" Height="125px" Width="150px" />
                                  <div class="caption">                                    
                                    <p><strong>Supplier Name : </strong><asp:DropDownList ID="ddlsupplier" ClientIDMode="Static" style="display:none;" onchange="updateLabelSupID" runat="server"></asp:DropDownList>
                                         <asp:Label ID="lblSuppilerName"  runat="server" ></asp:Label>
                                    <br />
                                    <strong>Labour Name : </strong><asp:Label ID="lblName" runat="server"></asp:Label></p>
                                    <p><asp:Button ID="btnAssign" runat="server" CssClass="btn btn-primary" 
                                            Text="Assign" enableEventValidation="false" OnClick="btnAssign_Click"></asp:Button></p>
                                    <p><asp:Button ID="btnCloseLeads" runat="server" Visible="false" CssClass="btn btn-primary" 
                                            Text="Close Lead" onclick="btnCloseLeads_Click"></asp:Button></p>
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
