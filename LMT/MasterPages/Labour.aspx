<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/Site.Master" AutoEventWireup="true"
    CodeBehind="Labour.aspx.cs" Inherits="LMT.MasterPages.Labour" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--[if IE]>
	<link rel="stylesheet" type="text/css" href="../css/all-ie-only.css" />
    <![endif]-->
    <%--<link href="../css/dashcss.css" rel="stylesheet" type="text/css" />--%>
    <link href="../css/plugins-dash.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" href="../colorbox.css" />
    <script type="text/javascript" language="javascript" src="../js/PopUpJScript.js"></script>
    <script type="text/javascript" language="javascript" src="../js/jquery.colorbox.js"></script>
    <link href="../css/button.css" rel="stylesheet" type="text/css" />
    <style>
        .widget-content table tr
        {
            line-height: 20px;
        }
        .widget-content table td
        {
            border: none;
            padding: 1px;
        }
        .widget-content table td > span
        {
            width: 96%;
            text-align: center;
            border: 0;
            display: inline-block;
            padding: 5px;
            position: relative;
            background-color: rgb(41,127,184);
            color: rgb(255,255,255);
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-shadow: 0px 1px 0px rgba(0,0,0,0.5);
            -webkit-box-shadow: 0px 2px 2px rgba(0,0,0,0.2);
            box-shadow: 0px 2px 2px rgba(0,0,0,0.2);
            cursor: pointer;
        }
        .widget-content table td > span > a
        {
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="demo-wrapper">
        <header id="ccr-header">
		<div class="ccr-hbg">			 
			<div class="ccr-slug">
				<div class="container">
                    
                    <div class="row">
                      
                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Profession Wise</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:PieChart ID="PW_LabourChart" runat="server" ChartHeight="200"
                                ChartWidth="200" ChartTitle="" ChartTitleColor="#0E426C" style="width: 230px;margin: 0px auto;" Font-Size="18">            
                              </asp:PieChart>
                              
                           </div>
                        </div>
                      </div>

                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Area Wise</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:PieChart ID="AW_LabourChart" runat="server" ChartHeight="200"
                                ChartWidth="200" ChartTitle="" ChartTitleColor="#0E426C" style="width: 230px;margin: 0px auto;" Font-Size="18">            
                              </asp:PieChart>
                              
                           </div>
                        </div>
                      </div>
                      
                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Skills Wise</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:PieChart ID="SW_LabourChart" runat="server" ChartHeight="200"
                                ChartWidth="200" ChartTitle="" ChartTitleColor="#0E426C" style="width: 230px;margin: 0px auto;" Font-Size="18">            
                              </asp:PieChart>
                              
                           </div>
                        </div>
                      </div>

                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Sector Wise</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:PieChart ID="SecW_LabourChart" runat="server" ChartHeight="200"
                                ChartWidth="200" ChartTitle="" ChartTitleColor="#0E426C" style="width: 230px;margin: 0px auto;" Font-Size="18">            
                              </asp:PieChart>
                              
                           </div>
                        </div>
                      </div>

                      <div class="col-sm-3 col-md-6 col-lg-4">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Overall Labour</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                              <asp:PieChart ID="OL_LabourChart" runat="server" ChartHeight="200"
                                ChartWidth="200" ChartTitle="" ChartTitleColor="#0E426C" style="width: 230px;margin: 0px auto;" Font-Size="18">            
                              </asp:PieChart>
                              
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
</asp:Content>
