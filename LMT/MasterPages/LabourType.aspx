<%@ Page Title="" Language="C#" MasterPageFile="~/TransPages/Site.Master" AutoEventWireup="true"
    CodeBehind="LabourType.aspx.cs" Inherits="LMT.MasterPages.LabourType" %>


<%@ Register TagPrefix="uc" TagName="LabourType" Src="~/MasterUC/LabourType.ascx" %>
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
    <script type="text/javascript" language="javascript">
        $("[name$='$Select']").attr("name", $("[name$='$Select']").attr("name"));

        $("[name$='$Select]").click(function () {
            //set name for all to name of clicked 
            $("[name$='$Select]").attr("name", this.attr("name"));
        });
    </script>
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
			<div class="ccr-slug" >
				<div class="container">
                    
                    <div class="row">
                    
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                     
                     
                                                                 
                      <div class="col-sm-3 col-md-6 col-lg-8">
                         <div class="panel panel-default">
                           <div class="panel-heading">
                              <h3 class="panel-title">
                                 <p class="text-center">Labour Type Master</p>
                              </h3>
                           </div>
                           <div class="panel-body">
                                
                                <uc:LabourType runat="server" ID="LabouTypeUC" Visible="true" />
                            <asp:Panel ID="Panel1" runat="server" Width="97%" Style="margin-top: 5px;">
                                <div id="Div1">
                                    <div id="Div2">
                                                            
                                    </div>
                                </div>
                            </asp:Panel>
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
