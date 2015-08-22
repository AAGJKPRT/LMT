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
namespace LMT.Supplier
{
    public partial class RegisterLabour1 : System.Web.UI.Page
    {
        csLabourRegistration objLbrReg = new csLabourRegistration();
        csDropDownFunction objDropDown = new csDropDownFunction();
        Barcode b = new Barcode();
        public string strRestrict = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {   
                if (fluLabour.HasFile) LabourImageUpload();
                if (fluDocument1.HasFile) StdDocUpload(fluDocument1, fluDocument1.ID);
                if (fluDocument2.HasFile) StdDocUpload(fluDocument2, fluDocument2.ID);
                if (fluDocument3.HasFile) StdDocUpload(fluDocument3, fluDocument3.ID);
                if (fluDocument4.HasFile) StdDocUpload(fluDocument4, fluDocument4.ID);
                if (!IsPostBack)
                {
                    hfUserName.Value = Convert.ToString(Session["UserName"]);
                    objDropDown.FillDropDown(ref ddlLbrType, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type");
                    objDropDown.FillDropDown(ref ddlCurrentState, "select StateID,StateName from tblState", "StateName", "StateID", "Order By StateName", "Where IsVerify='Y'", false, false, false, true, false);
                    objDropDown.FillDropDown(ref ddlCurrentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where IsVerify='Y'", false, false, true, false, false);
                    objDropDown.FillDropDown(ref ddlPermanetState, "select StateID,StateName from tblState", "StateName", "StateID", "Order By StateName", "Where IsVerify='Y'", false, false, false, true, false);
                    objDropDown.FillDropDown(ref ddlPermanentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where IsVerify='Y'", false, false, true, false, false);
                    if (Request.QueryString["ID"] != null)
                    {
                        hfRegID.Value = Request.QueryString["ID"].ToString();
                        hfOpmode.Value = "UPDATE";
                        ShowLabourData(Convert.ToInt32(hfRegID.Value));
                    }
                    else
                    {
                        hfOpmode.Value = "INSERT";
                        dvLabPfView.Visible = false;
                        dvLabPfEdit.Visible = true;
                        
                    }
                }

                if (ddlLbrType.SelectedValue != "-1")
                {
                    plBarCode.Controls.Clear();
                    GenerateBarcode();
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
                    objLbrReg.SaveData(hfOpmode.Value);
                    hfRegID.Value = Convert.ToString(objLbrReg.Reg_id);
                    //ClearControls();
                    ShowLabourData(Convert.ToInt32(hfRegID.Value));
                    dvLabPfView.Visible = true;
                    dvLabPfEdit.Visible = false;
                    
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage",  "alert('Record save successfully.);", true);
                }
                if (strRestrict == "NotAllowed")
                {
                    Response.Redirect("~/MasterPages/SupplierMenuboard.aspx");
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
                if (hfOpmode.Value == "UPDATE")
                {
                    objLbrReg.Reg_id = Convert.ToInt32(hfRegID.Value);
                }
                else
                {
                    objLbrReg.Reg_id = 0;
                }
                objLbrReg.Labourcode = txtPreLabourCode.Text + txtLabourCode.Text;
                objLbrReg.Fullname = txtFullName.Text.Trim();
                objLbrReg.Fathername = txtFatherName.Text.Trim();
                objLbrReg.C_address = txtCurrentAdd.Text.Trim();
                objLbrReg.C_state = Convert.ToInt32(ddlCurrentState.SelectedValue);
                objLbrReg.C_city = Convert.ToInt32(ddlCurrentCity.SelectedValue);
                objLbrReg.C_pincode = Convert.ToDecimal(txtCurrentPincode.Text.Trim());
                objLbrReg.P_address = txtPermanentAdd.Text.Trim();
                objLbrReg.P_state = Convert.ToInt32(ddlPermanetState.SelectedValue);
                objLbrReg.P_city = Convert.ToInt32(ddlPermanentCity.SelectedValue);
                objLbrReg.P_pincode = Convert.ToDecimal(txtPermanentPicode.Text.Trim());
                objLbrReg.Phno = Convert.ToDecimal(txtPhone.Text.Trim());
                objLbrReg.Sectortype = Convert.ToDecimal(ddlSectorType.SelectedValue);
                objLbrReg.Work_specialization = txtWorkSpe.Text.Trim();
                objLbrReg.Experience = txtExp.Text.Trim();
                objLbrReg.Labourtype = Convert.ToInt32(ddlLbrType.SelectedValue);
                objLbrReg.Ph_belonging1 = Convert.ToDecimal(txtb1.Text.Trim());
                objLbrReg.Ph_belonging2 = Convert.ToDecimal(txtb2.Text.Trim());
                objLbrReg.Ph_belonging3 = Convert.ToDecimal(txtb3.Text.Trim());
                objLbrReg.Ph_belonging4 = Convert.ToDecimal(txtb4.Text.Trim());
                objLbrReg.Exp_type = Convert.ToInt32(rbtnExpType.SelectedValue);
                objLbrReg.Verification = Convert.ToChar(rbtnVerify.SelectedValue);
                if (LabourImageControl.ImageUrl != "" && LabourImageControl.ImageUrl != null)
                    objLbrReg.Imageurl = LabourImageControl.ImageUrl.ToString();
                if (Session["DocURL1"] != null) objLbrReg.Docurl1 = Session["DocURL1"].ToString();
                if (Session["DocURL2"] != null) objLbrReg.Docurl2 = Session["DocURL2"].ToString();
                if (Session["DocURL3"] != null) objLbrReg.Docurl3 = Session["DocURL3"].ToString();
                if (Session["DocURL4"] != null) objLbrReg.Docurl4 = Session["DocURL4"].ToString();
                objLbrReg.Supplierid = Convert.ToInt32(Session["UserID"]);
                objLbrReg.Wages = txtWages.Text;
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void ShowLabourData(int Reg_ID)
        {
            try
            {
                //string StrQuery = "Select Reg_ID,Labour_Code,tbl_LabourRegistration.FullName LabourName,FatherName,C_Address,CState,StateName,CCity,CityName,CPincode,P_Address,PState,PCity,PPincode,Ph_No, " +
                //                  "Ph_belonging1,Ph_belonging2,Ph_belonging3,Ph_belonging4,SectorType,SectorName,Work_Specialization,Experience, " +
                //                  "LabourType,Lbr_Type,Experience_Type,Varification,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.Doc1_URL,tbl_LabourRegistration.Doc2_URL, "+
                //                  "tbl_LabourRegistration.Doc3_URL,tbl_LabourRegistration.Doc4_URL,tbl_SupplierDetail.FullName SupName,Wages from tbl_LabourRegistration " +
                //                  "Inner join tblState on tbl_LabourRegistration.CState=tblState.StateID and tbl_LabourRegistration.PState=tblState.StateID " +
                //                  "Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID and tbl_LabourRegistration.PCity=tblCity.CityID " +
                //                  "Inner Join tbl_Sector on tbl_LabourRegistration.SectorType=tbl_Sector.SectorID " +
                //                  "Inner Join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                //                  "Inner Join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                //                  " Where Reg_ID=" + hfRegID.Value + "";               
                DataTable Labour = csLabourRegistration.GetLabourData(Reg_ID);
                if (Labour.Rows.Count > 0)
                {
                    DataRow Dr = Labour.Rows[0];
                    //EditLabour
                    txtFullName.Text = Dr["LabourName"].ToString();
                    txtFatherName.Text = Dr["FatherName"].ToString();
                    txtCurrentAdd.Text = Dr["C_Address"].ToString();
                    ddlCurrentState.SelectedValue = Dr["CState"].ToString();
                    ddlCurrentCity.SelectedValue = Dr["CCity"].ToString();
                    txtCurrentPincode.Text = Dr["CPincode"].ToString();
                    txtPermanentAdd.Text = Dr["P_Address"].ToString();
                    ddlPermanetState.SelectedValue = Dr["PState"].ToString();
                    ddlPermanentCity.SelectedValue = Dr["PCity"].ToString();
                    txtPermanentPicode.Text = Dr["PPincode"].ToString();
                    txtPhone.Text = Dr["Ph_No"].ToString();
                    ddlSectorType.SelectedValue = Dr["SectorType"].ToString();
                    txtWorkSpe.Text = Dr["Work_Specialization"].ToString();
                    txtExp.Text = Dr["Experience"].ToString();
                    ddlLbrType.SelectedValue = Dr["LabourType"].ToString();
                    txtb1.Text = Dr["Ph_belonging1"].ToString();
                    txtb2.Text = Dr["Ph_belonging2"].ToString();
                    txtb3.Text = Dr["Ph_belonging3"].ToString();
                    txtb4.Text = Dr["Ph_belonging4"].ToString();
                    rbtnExpType.SelectedValue = Dr["Experience_Type"].ToString();
                    rbtnVerify.SelectedValue = Dr["Varification"].ToString();
                    LabourImageControl.ImageUrl = Dr["Image_URL"].ToString();
                    Session["DocURL1"] = Dr["Doc1_URL"].ToString();
                    Session["DocURL2"] = Dr["Doc2_URL"].ToString();
                    Session["DocURL3"] = Dr["Doc3_URL"].ToString();
                    Session["DocURL4"] = Dr["Doc4_URL"].ToString();
                    txtPreLabourCode.Text = Dr["Labour_Code"].ToString().Substring(0, 8);
                    txtLabourCode.Text = Dr["Labour_Code"].ToString().Substring(8, 6);
                    txtWages.Text = Dr["Wages"].ToString();
                    //ViewLabour
                    lblFullName.Text = Dr["LabourName"].ToString();
                    lblFatherName.Text = Dr["FatherName"].ToString();
                    lblCurrentAdd.Text = Dr["C_Address"].ToString();
                    lblCurrentState.Text = Dr["CStateName"].ToString();
                    lblCurrentCity.Text = Dr["CCityName"].ToString();
                    lblPincode.Text = Dr["CPincode"].ToString();
                    lblPermanentAddress.Text = Dr["P_Address"].ToString();
                    lblPermanentState.Text = Dr["PStateName"].ToString(); ;
                    lblpermanentCity.Text = Dr["PCityName"].ToString();
                    lblPermanentPincode.Text = Dr["PPincode"].ToString();
                    lblPhone.Text = Dr["Ph_No"].ToString();
                    lblBelongingPhone1.Text = Dr["Ph_belonging1"].ToString();
                    lblBelongingPhone2.Text = Dr["Ph_belonging2"].ToString();
                    lblBelongingPhone3.Text = Dr["Ph_belonging3"].ToString();
                    lblBelongingPhone4.Text = Dr["Ph_belonging4"].ToString();
                    lblSectorType.Text = Dr["SectorName"].ToString();
                    lblWorkSpecialization.Text = Dr["Work_Specialization"].ToString();
                    lblExperience.Text = Dr["Experience"].ToString();
                    lblLabourType.Text = Dr["Lbr_Type"].ToString();

                    //lblex = Dr["Experience_Type"].ToString();
                    if (Convert.ToString(Dr["Varification"]) == "1")
                        lblVerification.Text = "Done";
                    else
                        lblVerification.Text = "Not Done";
                    ImgLabour.ImageUrl = Dr["Image_URL"].ToString();
                    string StrDoc=Dr["Doc1_URL"].ToString();

                    imgDoc1.ImageUrl = Dr["Doc1_URL"].ToString();
                    aDoc1.HRef = Dr["Doc1_URL"].ToString();
                    imgDoc2.ImageUrl = Dr["Doc2_URL"].ToString();
                    aDoc2.HRef = Dr["Doc2_URL"].ToString();
                    imgDoc3.ImageUrl = Dr["Doc3_URL"].ToString();
                    aDoc3.HRef = Dr["Doc3_URL"].ToString();
                    imgDoc4.ImageUrl = Dr["Doc4_URL"].ToString();
                    aDoc4.HRef = Dr["Doc4_URL"].ToString();
                    if (Convert.ToString(Dr["Doc1_URL"].ToString()) != "")
                        lblDocument.Text = "Yes";
                    else
                        lblDocument.Text = "No";
                    lblLabourCode.Text = Dr["Labour_Code"].ToString();
                    lblWages.Text = Dr["Wages"].ToString();
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        private void LabourImageUpload()
        {
            try
            {

                if (fluLabour.HasFile)
                {
                    Guid G;
                    if (fluLabour.PostedFile.ContentLength <= 60720)
                    {
                        G = Guid.NewGuid();
                        string Labourfilename = "LBR" + G.ToString().Substring(0, 10);
                        string extension = Path.GetExtension(fluLabour.PostedFile.FileName);
                        if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                        {
                            fluLabour.SaveAs(Server.MapPath("~/LabourImages/" + Labourfilename + ".jpg"));
                            string LabourImgPath = @"..\LabourImages\" + Labourfilename + ".jpg";
                            //Session["StdFatherImgPath"] = StdFatherImgPath;
                            ShowLabourImage(LabourImgPath);
                            lblFileUpload.Text = Labourfilename;

                        }
                        else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('This file Extension is not allowed.');", true);
                    }
                    else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('File Size Should be Less then 60KB.');", true);
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
                LabourImageControl.ImageUrl = LabourImgPath;
                LabourImageControl.Focus();
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
                        string LBRDocfilename = "LBR" + txtFullName.Text.Trim() + "-" + Path.GetFileNameWithoutExtension(fluDocument.PostedFile.FileName);
                        string extension = Path.GetExtension(fluDocument.PostedFile.FileName);
                        if (((extension == ".jpg") || (extension == ".JPEG") || ((extension == ".gif") || (extension == ".png") || (extension == ".txt") || (extension == ".doc") || (extension == ".docx") || (extension == ".pdf"))))
                        {
                            fluDocument.SaveAs(Server.MapPath("~/LabourDocs/" + LBRDocfilename + extension));
                            string StdDocImgPath = @"..\LabourDocs\" + LBRDocfilename + extension;
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
                        else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('This file Extension is not allowed.');", true);
                    }
                    else ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('File Size Should be Less then 2MB.');", true);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        public void ClearControls()
        {
            txtFullName.Text = "";
            txtFatherName.Text = "";
            txtCurrentAdd.Text = "";
            ddlCurrentState.SelectedValue = "-1";
            ddlCurrentCity.SelectedValue = "-1";
            txtCurrentPincode.Text = "";
            txtPermanentAdd.Text = "";
            ddlPermanetState.SelectedValue = "-1";
            ddlPermanentCity.SelectedValue = "-1";
            txtPermanentPicode.Text = "";
            ddlSectorType.SelectedValue = "-1";
            txtb1.Text = "";
            txtb2.Text = "";
            txtb3.Text = "";
            txtb4.Text = "";
            txtPhone.Text = "";
            txtExp.Text = "";
            txtWorkSpe.Text = "";
            LabourImageControl.ImageUrl = "";
            fluLabour.Attributes.Clear();
            fluDocument1.Attributes.Clear();
            fluDocument2.Attributes.Clear();
            fluDocument3.Attributes.Clear();
            fluDocument4.Attributes.Clear();
            ddlLbrType.SelectedValue = "-1";
            txtPreLabourCode.Text = "";
            txtLabourCode.Text = "";
            lblShowBarCode.Text = "";
            lblFileUpload.Text = "";
            plBarCode.Controls.Clear();
            rbtnExpType.ClearSelection();
            rbtnVerify.ClearSelection();
            txtFullName.Focus();
        }

        private void ShowLabourCode()
        {
            if (ValidateFields())
            {
                string SectorType = "";
                txtLabourCode.Text = csGlobalFunction.GenerateCodeWithLeftPad("tbl_LabourRegistration", "Reg_ID", 6, "", false);
                if (ddlSectorType.SelectedValue == "1")
                    SectorType = "HH";
                else if (ddlSectorType.SelectedValue == "2")
                    SectorType = "GL";
                else
                    SectorType = "IL";
                txtPreLabourCode.Text = SectorType + ddlLbrType.SelectedItem.Text.Substring(0, 2) + ddlCurrentCity.SelectedItem.Text.Substring(0, 2) + txtCurrentPincode.Text.Substring(4, 2);
                GenerateBarcode();
            }
        }
        public bool Validation()
        {
            if ((txtPhone.Text.Length != 10) && (txtPhone.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid mobile no.');", true);
                txtPhone.Focus();
                return false;
            }
            if ((txtb1.Text.Length != 10) && (txtb1.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid belonging1 mobile no.');", true);
                txtb1.Focus();
                return false;
            }
            if ((txtb2.Text.Length != 10) && (txtb2.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid belonging2 mobile no.');", true);
                txtb2.Focus();
                return false;
            }
            if ((txtb3.Text.Length != 10) && (txtb3.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid belonging3 mobile no.');", true);
                txtb3.Focus();
                return false;
            }
            if ((txtb4.Text.Length != 10) && (txtb4.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid belonging4 mobile no.');", true);
                txtb4.Focus();
                return false;
            }
            if (hfUserName.Value != Convert.ToString(Session["UserName"]))
            {
                strRestrict = "NotAllowed";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('You are loged in with another user.');", true);
                
                return false;
            }
            return true;
        }
        public bool ValidateFields()
        {
            if (ddlSectorType.SelectedValue == "0")
                return false;
            if (ddlLbrType.SelectedValue == "-1")
                return false;
            if (ddlCurrentCity.SelectedValue == "-1")
                return false;
            if (txtCurrentPincode.Text == "")
                return false;
            else
                return true;
        }

        private void GenerateBarcode()
        {
            string LabourCode = txtPreLabourCode.Text.Trim() + txtLabourCode.Text.Trim();
            int W = 250;// Convert.ToInt32(this.txtWidth.Text.Trim());
            int H = 40;// Convert.ToInt32(this.txtHeight.Text.Trim());
            b.Alignment = AlignmentPositions.CENTER;
            TYPE type = TYPE.CODE128;
            try
            {
                if (type != TYPE.UNSPECIFIED)
                {
                    System.Drawing.Image imgBarCode;
                    imgBarCode = b.Encode(type, LabourCode, Color.Black, Color.White, W, H);
                    System.Web.UI.WebControls.Image imgBarCodeWC = new System.Web.UI.WebControls.Image();
                    string abc = ImageToBase64(imgBarCode);
                    imgBarCodeWC.ImageUrl = "data:image/png;base64," + abc;
                    plBarCode.Controls.Add(imgBarCodeWC);
                    ViewState["imgBarCodeWC"] = imgBarCodeWC.ImageUrl;
                    lblShowBarCode.Text = LabourCode;
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private string ImageToBase64(System.Drawing.Image image)
        {

            using (MemoryStream ms = new MemoryStream())
            {
                // Convert Image to byte[]
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] imageBytes = ms.ToArray();

                // Convert byte[] to Base64 String
                string base64String = Convert.ToBase64String(imageBytes);
                return base64String;
            }
        }

        protected void ddlLbrType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowLabourCode();
        }

        protected void ddlCurrentState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCurrentState.SelectedValue != "-1")
            {
                string sid = ddlCurrentState.SelectedValue;
                objDropDown.FillDropDown(ref ddlCurrentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where  StateID=" + sid + "");
                ddlCurrentCity.Enabled = true;
                txtCurrentPincode.Enabled = true;
            }
            else
            {
                ddlCurrentCity.Enabled = false;
                objDropDown.FillDropDown(ref ddlCurrentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where IsVerify='Y'");
                txtCurrentPincode.Enabled = false;
            }
        }

        protected void ddlPermanetState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPermanetState.SelectedValue != "-1")
            {
                string sid = ddlPermanetState.SelectedValue;
                objDropDown.FillDropDown(ref ddlPermanentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where  StateID=" + sid + "");
                ddlPermanentCity.Enabled = true;
                txtPermanentPicode.Enabled = true;
            }
            else
            {
                ddlPermanentCity.Enabled = false;
                objDropDown.FillDropDown(ref ddlPermanentCity, "select CityID,CityName from tblCity", "CityName", "CityID", "Order By CityName", "Where IsVerify='Y'");
                txtPermanentPicode.Enabled = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //ClearControls();
            if (hfOpmode.Value == "INSERT")
            {
                Response.Redirect("~/Supplier/LabourDetail.aspx");
            }
            else
            {
                dvLabPfView.Visible = true;
                dvLabPfEdit.Visible = false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            dvLabPfView.Visible = false;
            dvLabPfEdit.Visible = true;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Supplier/LabourDetail.aspx");
        }

        protected void ddlSectorType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string Str = "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type Where Sector=" + ddlSectorType.SelectedValue + " and IsVerify='Y' Order By Lbr_Type";
            objDropDown.FillDropDown(ref ddlLbrType, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type", "Where Sector=" + ddlSectorType.SelectedValue + " and IsVerify='Y'");
        }
    }
}