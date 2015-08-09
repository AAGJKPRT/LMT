using System;
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

namespace LMT.Admin
{
    public partial class EditSupProfile : System.Web.UI.Page
    {
        csSupplierDetail objSuplier = new csSupplierDetail();
        csUserRegistration objUserRegistration = new csUserRegistration();
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
                    hfSupID.Value = "0";
                    //hfOpMode.Value = "INSERT";
                    if (Request.QueryString["ID"] != null)
                    {
                        hfSupID.Value = Request.QueryString["ID"].ToString();
                        txtFullName.Text = Convert.ToString(Request.QueryString["NAME"].ToString());
                        hfOpMode.Value = "UPDATE";

                    }
                    else
                    {
                        hfOpMode.Value = "INSERT";
                        dvSupPfView.Visible = false;
                        dvSupPfEdit.Visible = true;

                    }
                    //else
                    //{
                    //    string strQuery = "Select ISNULL(Max(SupplierID),0)+1 From tbl_SupplierDetail";
                    //    Session["SUPID"] = CrystalConnection.SqlScalartoObj(strQuery);
                    //}
                    //txtFullName.Text = Convert.ToString(Request.QueryString["NAME"].ToString());
                    //hfSupID.Value = Request.QueryString["ID"].ToString();
                    // objDropDown.FillDropDown(ref ddlCurrentState, "select StateID,StateName from tblState", "StateName", "StateID", "Order By StateName", "Where IsVerify='Y'", false, false, false, true, false);
                    //objDropDown.FillDropDown(ref ddlCurrentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where IsVerify='Y'", false, false, true, false, false);
                    Binddropdown();
                    if (ShowSupProfile(Convert.ToInt32(hfSupID.Value)))
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

        // Added by khushbu kansal for binding dropdowns
        public void Binddropdown()
        {
            ddlCurrentState.DataSource = objDropDown.GetLookupTable(Convert.ToString(GetLocalResourceObject("StateLookup")));
            ddlCurrentState.DataTextField = "LDESC";
            ddlCurrentState.DataValueField = "LID";
            ddlCurrentState.DataBind();
            ddlCurrentCity.DataSource = objDropDown.GetLookupTable(Convert.ToString(GetLocalResourceObject("CityLookup")));
            ddlCurrentCity.DataTextField = "LDESC";
            ddlCurrentCity.DataValueField = "LID";
            ddlCurrentCity.DataBind();
        }

        public bool ShowSupProfile(int SupID)
        {
            try
            {
                //string StrQuery = "Select SupplierID,SupplierCode,FullName,Address,Sup_City,CityName,Sup_State,StateName,Pincode,Sup_Mobile, " +
                //                  "EmailID,CompanyName,BankName,BankACNo,AC_IFSC_Code,Doc1_Url,Doc2_Url,Image_Url,MemberShip from tbl_SupplierDetail " +
                //                  "Inner join tblState on tbl_SupplierDetail.Sup_State=tblState.StateID " +
                //                  "Inner Join tblCity on tbl_SupplierDetail.Sup_City=tblCity.CityID" +
                //                  " Where SupplierID=" + SupID + "";
                DataTable Supplier = csSupplierDetail.GetData(SupID);

                if (Supplier.Rows.Count > 0)
                {
                    DataRow Dr = Supplier.Rows[0];

                    //Textbox Binding
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
                    txtSupCode.Text = Dr["SupplierCode"].ToString().Substring(3, 4);
                    if ('Y' == Convert.ToChar(Dr["Membership"]))
                        ChkMemberShip.Checked = true;
                    else
                        ChkMemberShip.Checked = false;
                    hfOpMode.Value = "UPDATE";

                    //Label Binding
                    lblFullName.Text = Dr["FullName"].ToString();
                    lblCurrentAdd.Text = Dr["Address"].ToString();
                    lblCurrentState.Text = Dr["StateName"].ToString();
                    lblCurrentCity.Text = Dr["CityName"].ToString();
                    lblPincode.Text = Dr["Pincode"].ToString();
                    lblPhone.Text = Dr["Sup_Mobile"].ToString();
                    lblEmail.Text = Dr["EmailID"].ToString();
                    lblCompanyName.Text = Dr["CompanyName"].ToString();
                    lblBankName.Text = Dr["BankName"].ToString();
                    lblBankAccNo.Text = Dr["BankACNo"].ToString();
                    lblIFSCCode.Text = Dr["AC_IFSC_Code"].ToString();
                    ImgSupplier.ImageUrl = Dr["Image_Url"].ToString();
                    lblSupCode.Text = Dr["SupplierCode"].ToString().Substring(3, 4);
                    if (Convert.ToString(Dr["Doc1_Url"]) != "")
                        lblDocument.Text = "Yes";
                    else
                        lblDocument.Text = "No";
                    if ('Y' == Convert.ToChar(Dr["Membership"]))
                        lblMembership.Text = "Yes";
                    else
                        lblMembership.Text = "No";
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
                    Set_UserRegProperties();
                    decimal userID = objUserRegistration.ExecuteProcedure("INSERT", 0);
                    SetProperties(userID);

                    if (txtEmail.Text.Trim() != "")
                    {
                        {
                            string recipientemailto = txtEmail.Text.Trim();
                            string strMessage = "Dear Subscriber,<br> Your registration is comfirmed.<br> Your Login ID :" + txtFullName.Text.Trim().Substring(0, 4) + txtPreSupCode.Text + txtSupCode.Text + ". <br> Password :" + txtPreSupCode.Text + txtSupCode.Text + "";
                            string strSubject = "Registration Confirmation mail";
                            if (txtEmail.Text.Trim() != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                        }
                    }
                    objSuplier.SaveData(hfOpMode.Value);
                    ClearControls();
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

        private void SetProperties(decimal SupID)
        {
            try
            {
                if (hfOpMode.Value == "UPDATE")
                    objSuplier.Supplierid = Convert.ToInt32(hfSupID.Value);
                else
                    objSuplier.Supplierid = Convert.ToInt32(SupID);
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
        private void Set_UserRegProperties()
        {
            try
            {
                objUserRegistration.USERNAME = txtFullName.Text.Trim();
                objUserRegistration.LOGINNAME = txtFullName.Text.Trim().Substring(0, 4) + txtPreSupCode.Text + txtSupCode.Text;
                objUserRegistration.PWD = objUserRegistration.EncodePasswordToBase64(txtPreSupCode.Text + txtSupCode.Text);
                objUserRegistration.USERTYPEID = Convert.ToDecimal("2");
                objUserRegistration.USERCATEGORYID = Convert.ToDecimal("2");
                objUserRegistration.Emailid = txtEmail.Text.Trim();
                objUserRegistration.ISVERIFY = "Y";
                //if (ddlUserType.SelectedValue != "8" && ddlUserType.SelectedValue != "3") objUserRegistration.ImageURL = "";//UserPicControl.ImageUrl.ToString();
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
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

                Regex reg = new Regex(Convert.ToString(GetLocalResourceObject("EmailRegExp")));
                //@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
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
            txtPhone.Text = "";
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
            if (hfOpMode.Value == "INSERT")
            {
                Response.Redirect("~/MasterPages/Supplier.aspx");
            }
            else
            {
                dvSupPfView.Visible = true;
                dvSupPfEdit.Visible = false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            dvSupPfView.Visible = false;
            dvSupPfEdit.Visible = true;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MasterPages/Supplier.aspx");
        }
    }
}