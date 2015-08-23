using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csUserRegistration
    {
        #region Declaration of All Global Variables
        DbSqlParameterCollection objParamColleciton;
        #endregion

        #region Declaration of Procedure Valiables
        private string _opMode = "";
        private int _userID;
        private string _userName = "";
        private string _loginName = "";
        private string _pwd = "";
        private decimal _userTypeID;
        private decimal _userCategoryID;
        private string _emailid = "";
        private string _isVerify = "N";
        private string _phoneno = "";
        //private string _imageURL = "";

        #endregion

        #region Declaration of Procedure Valiables
        public string OPMODE
        {
            get { return _opMode; }
            set { _opMode = value; }
        }
        public int USERID
        {
            get { return _userID; }
            set { _userID = value; }
        }
        public string USERNAME
        {
            get { return _userName; }
            set { _userName = value; }
        }
        public string LOGINNAME
        {
            get { return _loginName; }
            set { _loginName = value; }
        }
        public string PWD
        {
            get { return _pwd; }
            set { _pwd = value; }
        }
        public decimal USERTYPEID
        {
            get { return _userTypeID; }
            set { _userTypeID = value; }
        }
        public decimal USERCATEGORYID
        {
            get { return _userCategoryID; }
            set { _userCategoryID = value; }
        }
        public string Emailid
        {
            get { return _emailid; }
            set { _emailid = value; }
        }
        public string ISVERIFY
        {
            get { return _isVerify; }
            set { _isVerify = value; }
        }
        public string Phoneno
        {
            get { return _phoneno; }
            set { _phoneno = value; }
        }
        //public string ImageURL
        //{
        //    get { return _imageURL; }
        //    set { _imageURL = value; }
        //}
        #endregion

        #region Declaration of All Functions

        private void AddProcedureParameters()
        {
            objParamColleciton = new DbSqlParameterCollection();

            DbSqlParameter opModeParam = new DbSqlParameter("@OpMode", SqlDbType.VarChar, 20);
            opModeParam.Value = _opMode;
            objParamColleciton.Add(opModeParam);

            DbSqlParameter userIDParam = new DbSqlParameter("@UserID", SqlDbType.Decimal);
            userIDParam.Value = _userID;
            objParamColleciton.Add(userIDParam);

            DbSqlParameter userNameParam = new DbSqlParameter("@UserName", SqlDbType.VarChar, 50);
            userNameParam.Value = _userName;
            objParamColleciton.Add(userNameParam);

            DbSqlParameter loginNameParam = new DbSqlParameter("@LoginName", SqlDbType.VarChar, 50);
            loginNameParam.Value = _loginName;
            objParamColleciton.Add(loginNameParam);

            DbSqlParameter pwdParam = new DbSqlParameter("@Pwd", SqlDbType.VarChar, 50);
            pwdParam.Value = _pwd;
            objParamColleciton.Add(pwdParam);

            DbSqlParameter userTypeIDParam = new DbSqlParameter("@UserTypeID", SqlDbType.Decimal);
            userTypeIDParam.Value = _userTypeID;
            objParamColleciton.Add(userTypeIDParam);

            DbSqlParameter userCategoryIDParam = new DbSqlParameter("@UserCategoryID", SqlDbType.Decimal);
            userCategoryIDParam.Value = _userCategoryID;
            objParamColleciton.Add(userCategoryIDParam);

            DbSqlParameter EmailIDPara = new DbSqlParameter("@EmailID", SqlDbType.VarChar);
            EmailIDPara.Value = _emailid;
            objParamColleciton.Add(EmailIDPara);

            DbSqlParameter isVerifyParam = new DbSqlParameter("@IsVerify", SqlDbType.Char, 1);
            isVerifyParam.Value = _isVerify;
            objParamColleciton.Add(isVerifyParam);

            DbSqlParameter phoneno = new DbSqlParameter("@phoneno", SqlDbType.Char, 10);
            phoneno.Value = _phoneno;
            objParamColleciton.Add(phoneno);

            //DbSqlParameter ImageURLParam = new DbSqlParameter("@ImageURL", SqlDbType.VarChar);
            //ImageURLParam.Value = _imageURL;
            //objParamColleciton.Add(ImageURLParam);
        }
        private void AddProcParamChangePwd()
        {
            objParamColleciton = new DbSqlParameterCollection();

            DbSqlParameter loginNameParam = new DbSqlParameter("@LoginName", SqlDbType.VarChar, 50);
            loginNameParam.Value = _loginName;
            objParamColleciton.Add(loginNameParam);

            DbSqlParameter pwdParam = new DbSqlParameter("@Pwd", SqlDbType.VarChar, 50);
            pwdParam.Value = _pwd;
            objParamColleciton.Add(pwdParam);
        }

        public static DataSet FillDataSet(string strQuery)
        {
            DataSet dsFillData;
            dsFillData = CrystalConnection.CreateDatasetWithoutTransaction(strQuery);
            return dsFillData;
        }

        public int ExecuteProcedure(string opMode, int userID = 0)
        {
            _opMode = opMode;
            _userID = userID;
            AddProcedureParameters();
            _userID = Convert.ToInt32(CrystalConnection.DoStoredScalar("usp_UserRegProc", objParamColleciton, true));

            return _userID;
        }
        public void ExecuteProcedureChangePwd(string loginName)
        {
            _loginName = loginName;
            AddProcParamChangePwd();
            CrystalConnection.DoStored("usp_UserChangePwd", objParamColleciton);
        }
        public DataTable ExecuteProcedureFromStudentStaff(string opMode, string loginName)
        {
            _opMode = opMode;
            _loginName = loginName;
            AddProcedureParameters();
            return (CrystalConnection.DoStoredTable("usp_UserRegProc", objParamColleciton));
        }

        public int ExecuteQuery(string strQuery)
        {
            return (int)CrystalConnection.SqlScalartoObj(strQuery);
        }

        public void ExecuteCommand(string strQuery)
        {
            CrystalConnection.DoCommandWithoutTransaction(strQuery);
        }

        //this function Convert to Encord your Password 
        public string EncodePasswordToBase64(string password)
        {
            try
            {
                byte[] encData_byte = new byte[password.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
                string encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        }
        #endregion

        #region Call using Store Procedure 
        
        public int SP_ValidateCredential(string valtext, int mode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.
    ConnectionStrings["crystalconnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ValidateCredential", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@valtext", valtext);
                        cmd.Parameters.AddWithValue("@mode", mode);
                        con.Open();
                        int i=(int) cmd.ExecuteScalar();
                        con.Close();
                        return i;
                    }

                }
            }
            catch (Exception ex)
            {
                return 100;  
            }

        }

        #endregion


   }
}