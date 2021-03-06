﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMT.BusinessLogic;
using System.Configuration;
using System.Collections;
using System.Data;
using CrystalDatabase;
using System.Data.SqlClient;
using System.Globalization;
using System.Drawing;
using System.Text.RegularExpressions;
using System.IO;
using LMT.ClassGlobal;
using ClassBarcode;

namespace LMT.Supplier
{
    //Jaipal
    
    public partial class EditProfile : System.Web.UI.Page
    {
        csSupplierDetail objSuplier = new csSupplierDetail();
        csDropDownFunction objDropDown = new csDropDownFunction();
        csGlobal globaldata = new csGlobal(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (fluSupplier.HasFile) SupplierImageUpload();
                if (fluDocument1.HasFile) StdDocUpload(fluDocument1, fluDocument1.ID);
                if (fluDocument2.HasFile) StdDocUpload(fluDocument2, fluDocument2.ID);
                
                //ShowSupplierCode();
                if (!IsPostBack)
                {
                    hfOpMode.Value = "INSERT";
                    txtFullName.Text = Convert.ToString(Session["UserName"]);
                    objDropDown.FillDropDown(ref ddlCurrentState, "select StateID,StateName from tblState", "StateName", "StateID", "Order By StateName", "Where IsVerify='Y'", false, false, false, true, false);
                    objDropDown.FillDropDown(ref ddlCurrentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where IsVerify='Y'", false, false, true, false, false);
                    if (ShowSupProfile(Convert.ToInt32(Session["UserID"])))
                    {
                        ShowSupplierCode();
                    }
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        public bool ShowSupProfile(int SupID)
        {
            try
            {
                string StrQuery = "Select * From tbl_SupplierDetail Where SupplierID=" + SupID + "";
                DataTable Supplier = csSupplierDetail.FillDataTable(StrQuery);

                if (Supplier.Rows.Count > 0)
                {
                    DataRow Dr = Supplier.Rows[0];
                    //Tab Personal
                    txtFullName.Text = Dr["FullName"].ToString();
                    txtCurrentAdd.Text = Dr["Address"].ToString();
                    ddlCurrentState.SelectedValue = Dr["Sup_State"].ToString();
                    ddlCurrentCity.SelectedValue = Dr["Sup_City"].ToString();
                    txtCurrentPincode.Text = Dr["Pincode"].ToString();
                    txtPhone.Text = Dr["Sup_Mobile"].ToString();
                    txtEmail.Text = Dr["EmailID"].ToString();
                    txtCompanyName.Text = Dr["CompanyName"].ToString();
                    txtBankName.Text = Dr["BankName"].ToString();
                    txtBankACNo.Text = Dr["BankACNo"].ToString();
                    txtIFSCCode.Text = Dr["AC_IFSC_Code"].ToString();
                    SupplierImageControl.ImageUrl = Dr["Image_Url"].ToString();
                    Session["DocURL1"] = Dr["Doc1_Url"].ToString();
                    Session["DocURL2"] = Dr["Doc2_Url"].ToString();
                    txtSupCode.Text = Dr["SupplierCode"].ToString().Substring(3,4);
                    if ('Y' == Convert.ToChar(Dr["Membership"]))
                        ChkMemberShip.Checked = true;
                    else
                        ChkMemberShip.Checked = false;
                    hfOpMode.Value = "UPDATE";
                    return false;
                }
                return true;
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
                return true;
            }
        }

        private void SupplierImageUpload()
        {
            try
            {

                if (fluSupplier.HasFile)
                {
                    Guid G;
                    if (fluSupplier.PostedFile.ContentLength <= 60720)
                    {
                        G = Guid.NewGuid();
                        string Labourfilename = "SUP" + G.ToString().Substring(0, 10);
                        string extension = Path.GetExtension(fluSupplier.PostedFile.FileName);
                        if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                        {
                            fluSupplier.SaveAs(Server.MapPath("~/SupplierImages/" + Labourfilename + ".jpg"));
                            string LabourImgPath = @"..\SupplierImages\" + Labourfilename + ".jpg";
                            //Session["StdFatherImgPath"] = StdFatherImgPath;
                            ShowLabourImage(LabourImgPath);
                            lblFileUpload.Text = Labourfilename;

                        }
                        else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmsg", "alert('This file Extension is not allowed.');", true);
                    }
                    else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmsg", "alert('File Size Should be Less then 60KB.');", true);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void ShowLabourImage(string LabourImgPath)
        {
            try
            {
                SupplierImageControl.ImageUrl = LabourImgPath;
                SupplierImageControl.Focus();
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void StdDocUpload(FileUpload fluDocument, string ControlName)
        {
            try
            {
                if (fluDocument.HasFile)
                {
                    if (fluDocument.PostedFile.ContentLength <= 2097152)
                    {
                        string LBRDocfilename = "SUP" + txtFullName.Text.Trim() + "-" + Path.GetFileNameWithoutExtension(fluDocument.PostedFile.FileName);
                        string extension = Path.GetExtension(fluDocument.PostedFile.FileName);
                        if (((extension == ".jpg") || (extension == ".JPEG") || ((extension == ".gif") || (extension == ".png") || (extension == ".txt") || (extension == ".doc") || (extension == ".docx") || (extension == ".pdf"))))
                        {
                            fluDocument.SaveAs(Server.MapPath("~/SupplierDocs/" + LBRDocfilename + extension));
                            string StdDocImgPath = @"..\SupplierDocs\" + LBRDocfilename + extension;
                            if (ControlName == "fluDocument1")
                            {
                                Session["DocURL1"] = StdDocImgPath;
                                Session["DocExt"] = extension;
                            }
                            else if (ControlName == "fluDocument2")
                            {
                                Session["DocURL2"] = StdDocImgPath;
                            }
                            else if (ControlName == "fluDocument3")
                            {
                                Session["DocURL3"] = StdDocImgPath;
                            }
                            else
                            {
                                Session["DocURL4"] = StdDocImgPath;
                            }
                            //lblFileUpload.Text = LBRDocfilename;

                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmsg", "alert('Document Successfully uploaded.');", true);
                        }
                        else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmsg", "alert('This file Extension is not allowed.');", true);
                    }
                    else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmsg", "alert('File Size Should be Less then 2MB.');", true);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Validation())
                {
                    SetProperties();
                    objSuplier.SaveData(hfOpMode.Value);

                    //ClearControls();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Record save successfully.", true);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void SetProperties()
        {
            try
            {
                objSuplier.Supplierid = Convert.ToInt32(Session["UserID"]);
                objSuplier.Suppliercode = txtPreSupCode.Text + txtSupCode.Text;
                objSuplier.Fullname = txtFullName.Text.Trim();
                objSuplier.Address = txtCurrentAdd.Text.Trim();
                objSuplier.Supstate = Convert.ToInt32(ddlCurrentState.SelectedValue);
                objSuplier.Supcity = Convert.ToInt32(ddlCurrentCity.SelectedValue);
                objSuplier.Suppincode = Convert.ToDecimal(txtCurrentPincode.Text.Trim());
                objSuplier.Supmobile = Convert.ToDecimal(txtPhone.Text.Trim());
                objSuplier.Emailid = txtEmail.Text.Trim();
                objSuplier.Companyname = txtCompanyName.Text.Trim();
                objSuplier.Bankname = txtBankName.Text.Trim();
                objSuplier.Bankacno = txtBankACNo.Text.Trim();
                objSuplier.Acifsccode = txtIFSCCode.Text.Trim();
                if (ChkMemberShip.Checked == true)
                    objSuplier.Membership = "Y";
                if (SupplierImageControl.ImageUrl != "" && SupplierImageControl.ImageUrl != null)
                    objSuplier.Imageurl = SupplierImageControl.ImageUrl.ToString();
                if (Session["DocURL1"] != null) objSuplier.Dock1url = Session["DocURL1"].ToString();
                if (Session["DocURL2"] != null) objSuplier.Dock2url = Session["DocURL2"].ToString();
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }
        public bool Validation()
        {
            if ((txtPhone.Text.Length != 10) && (txtPhone.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alertMsg('Please enter valid mobile no.');", true);
                txtPhone.Focus();
                return false;
            }
            if (txtEmail.Text != "")
            {

                Regex reg = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match isMatch = reg.Match(txtEmail.Text);
                if (!isMatch.Success)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('Please enter valid Email.');", true);
                    txtEmail.Focus();
                    return (false);
                }
            }
            return true;
        }
        public void ClearControls()
        {
            txtFullName.Text = "";
            txtCurrentAdd.Text = "";
            ddlCurrentState.SelectedValue = "-1";
            ddlCurrentCity.SelectedValue = "-1";
            txtCurrentPincode.Text = "";
            txtEmail.Text = "";
            txtCompanyName.Text = "";
            txtBankName.Text = "";
            txtBankACNo.Text = "";
            txtIFSCCode.Text = "";
            SupplierImageControl.ImageUrl = "";
            fluSupplier.Attributes.Clear();
            fluDocument1.Attributes.Clear();
            fluDocument2.Attributes.Clear();
            lblFileUpload.Text = "";
            //plBarCode.Controls.Clear();
            //rbtnExpType.ClearSelection();
            //rbtnVerify.ClearSelection();
            ChkMemberShip.Checked = false;
            txtFullName.Focus();
        }

        private void ShowSupplierCode()
        {
            txtSupCode.Text = csGlobalFunction.GenerateCodeWithLeftPad("tbl_SupplierDetail", "SupplierID", 4, "", false);
            //GenerateBarcode();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MasterPages/SupplierMenuboard.aspx");
        }


    }
}