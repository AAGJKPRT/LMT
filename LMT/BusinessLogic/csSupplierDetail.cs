using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

namespace LMT.BusinessLogic
{
    public class csSupplierDetail
    {
        DbSqlParameterCollection objParamCollection;
        //define variables..

        private string _opmode = "";

        public string Opmode
        {
            get { return _opmode; }
            set { _opmode = value; }
        }
        private int _supplierid;

        public int Supplierid
        {
            get { return _supplierid; }
            set { _supplierid = value; }
        }
        private string _suppliercode = "";

        public string Suppliercode
        {
            get { return _suppliercode; }
            set { _suppliercode = value; }
        }
        private string _fullname = "";

        public string Fullname
        {
            get { return _fullname; }
            set { _fullname = value; }
        }
        private string _address = "";

        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }
        private int _supcity;

        public int Supcity
        {
            get { return _supcity; }
            set { _supcity = value; }
        }
        private int _supstate;

        public int Supstate
        {
            get { return _supstate; }
            set { _supstate = value; }
        }
        private decimal _suppincode;

        public decimal Suppincode
        {
            get { return _suppincode; }
            set { _suppincode = value; }
        }
        private decimal _supmobile;

        public decimal Supmobile
        {
            get { return _supmobile; }
            set { _supmobile = value; }
        }
        private string _emailid = "";

        public string Emailid
        {
            get { return _emailid; }
            set { _emailid = value; }
        }
        private string _companyname = "";

        public string Companyname
        {
            get { return _companyname; }
            set { _companyname = value; }
        }
        private string _bankname = "";

        public string Bankname
        {
            get { return _bankname; }
            set { _bankname = value; }
        }
        private string _bankacno = "";

        public string Bankacno
        {
            get { return _bankacno; }
            set { _bankacno = value; }
        }
        private string _acifsccode = "";

        public string Acifsccode
        {
            get { return _acifsccode; }
            set { _acifsccode = value; }
        }
        private string _dock1url = "";

        public string Dock1url
        {
            get { return _dock1url; }
            set { _dock1url = value; }
        }
        private string _dock2url = "";

        public string Dock2url
        {
            get { return _dock2url; }
            set { _dock2url = value; }
        }
        private string _imageurl = "";

        public string Imageurl
        {
            get { return _imageurl; }
            set { _imageurl = value; }
        }
        private string _membership = "";

        public string Membership
        {
            get { return _membership; }
            set { _membership = value; }
        }

        private void AddProcParam()
        {
            objParamCollection = new DbSqlParameterCollection();

            DbSqlParameter OpModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            OpModePara.Value = _opmode;
            objParamCollection.Add(OpModePara);

            DbSqlParameter Supplier_IDPara = new DbSqlParameter("@Supplier_ID", SqlDbType.Int);
            Supplier_IDPara.Value = _supplierid;
            objParamCollection.Add(Supplier_IDPara);

            DbSqlParameter SupplierCodePara = new DbSqlParameter("@Supplier_Code", SqlDbType.VarChar);
            SupplierCodePara.Value = _suppliercode;
            objParamCollection.Add(SupplierCodePara);

            DbSqlParameter FullNamePara = new DbSqlParameter("@FullName", SqlDbType.VarChar);
            FullNamePara.Value = _fullname;
            objParamCollection.Add(FullNamePara);

            DbSqlParameter AddressPara = new DbSqlParameter("@Address", SqlDbType.VarChar);
            AddressPara.Value = _address;
            objParamCollection.Add(AddressPara);

            DbSqlParameter Sup_StatePara = new DbSqlParameter("@Sup_State", SqlDbType.Int);
            Sup_StatePara.Value = _supstate;
            objParamCollection.Add(Sup_StatePara);
            DbSqlParameter Sup_CityPara = new DbSqlParameter("@Sup_City", SqlDbType.Int);
            Sup_CityPara.Value = _supcity;
            objParamCollection.Add(Sup_CityPara);
            DbSqlParameter Sup_PincodePara = new DbSqlParameter("@Sup_Pincode", SqlDbType.Decimal);
            Sup_PincodePara.Value = _suppincode;
            objParamCollection.Add(Sup_PincodePara);
            DbSqlParameter Mobile_NoPara = new DbSqlParameter("@Sup_Mobile", SqlDbType.Decimal);
            Mobile_NoPara.Value = _supmobile;
            objParamCollection.Add(Mobile_NoPara);
            DbSqlParameter EmailIDPara = new DbSqlParameter("@EmailID", SqlDbType.VarChar);
            EmailIDPara.Value = _emailid;
            objParamCollection.Add(EmailIDPara);
            DbSqlParameter CompanyNamePara = new DbSqlParameter("@CompanyName", SqlDbType.VarChar);
            CompanyNamePara.Value = _companyname;
            objParamCollection.Add(CompanyNamePara);
            DbSqlParameter BankNamePara = new DbSqlParameter("@BankName", SqlDbType.VarChar);
            BankNamePara.Value = _bankname;
            objParamCollection.Add(BankNamePara);
            DbSqlParameter BankAcNoPara = new DbSqlParameter("@Bank_AC_No", SqlDbType.VarChar);
            BankAcNoPara.Value = _bankacno;
            objParamCollection.Add(BankAcNoPara);
            DbSqlParameter Ac_IFSC_CodePara = new DbSqlParameter("@AC_IFCS_Code", SqlDbType.VarChar);
            Ac_IFSC_CodePara.Value = _acifsccode;
            objParamCollection.Add(Ac_IFSC_CodePara);
            DbSqlParameter DocUrl1Para = new DbSqlParameter("@Doc1_Url", SqlDbType.VarChar);
            DocUrl1Para.Value = _dock1url;
            objParamCollection.Add(DocUrl1Para);
            DbSqlParameter DocUrl2Para = new DbSqlParameter("@Doc2_Url", SqlDbType.VarChar);
            DocUrl2Para.Value = _dock2url;
            objParamCollection.Add(DocUrl2Para);
            DbSqlParameter ImageUrlPara = new DbSqlParameter("@Image_Url", SqlDbType.VarChar);
            ImageUrlPara.Value = _imageurl;
            objParamCollection.Add(ImageUrlPara);
            DbSqlParameter MembershipPara = new DbSqlParameter("@Membership", SqlDbType.Char);
            MembershipPara.Value = _membership;
            objParamCollection.Add(MembershipPara);

        }

        public void SaveData(string OpMode)
        {
            _opmode = OpMode;
            AddProcParam();
            CrystalConnection.DoStored("usp_SupplierDtlProc", objParamCollection);
        }

        public void DeleteLabInfo(string opmode, int SupID)
        {
            _opmode = opmode;
            _supplierid = SupID;
            AddProcParam();
            CrystalConnection.DoStoredScalar("usp_SupplierDtlProc", objParamCollection, true);
        }
        
        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

        //Added by khushbu to fill dataset
        public static DataTable GetData(int SupId)
        {
            string DBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CrystalConnection"].ConnectionString;
            SqlParameter[] sqlParams = new SqlParameter[1];//1
            sqlParams[0] = new SqlParameter("@SupId",SupId);
            DataSet ds = DataWrapper.ExecuteDataset(DBConnectionString, CommandType.StoredProcedure, "FetchSupProfile", sqlParams);

            return ds.Tables[0];

        }
    }
}