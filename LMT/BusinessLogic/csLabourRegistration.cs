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
    public class csLabourRegistration
    {
        DbSqlParameterCollection objParamCollection;
        //define variables..

        private string _opmode = "";

        public string Opmode
        {
            get { return _opmode; }
            set { _opmode = value; }
        }
        private int _reg_id;

        public int Reg_id
        {
            get { return _reg_id; }
            set { _reg_id = value; }
        }
        private string _labourcode = "";

        public string Labourcode
        {
            get { return _labourcode; }
            set { _labourcode = value; }
        }
        private string _fullname = "";

        public string Fullname
        {
            get { return _fullname; }
            set { _fullname = value; }
        }
        private string _fathername = "";

        public string Fathername
        {
            get { return _fathername; }
            set { _fathername = value; }
        }
        private string _c_address = "";

        public string C_address
        {
            get { return _c_address; }
            set { _c_address = value; }
        }
        private decimal _c_state;

        public decimal C_state
        {
            get { return _c_state; }
            set { _c_state = value; }
        }
        private decimal _c_city;

        public decimal C_city
        {
            get { return _c_city; }
            set { _c_city = value; }
        }
        private decimal _c_pincode;

        public decimal C_pincode
        {
            get { return _c_pincode; }
            set { _c_pincode = value; }
        }
        private string _p_address = "";

        public string P_address
        {
            get { return _p_address; }
            set { _p_address = value; }
        }
        private decimal _p_state;

        public decimal P_state
        {
            get { return _p_state; }
            set { _p_state = value; }
        }
        private decimal _p_city;

        public decimal P_city
        {
            get { return _p_city; }
            set { _p_city = value; }
        }
        private decimal _p_pincode;

        public decimal P_pincode
        {
            get { return _p_pincode; }
            set { _p_pincode = value; }
        }
        private decimal _phno;

        public decimal Phno
        {
            get { return _phno; }
            set { _phno = value; }
        }
        private decimal _sectortype;

        public decimal Sectortype
        {
            get { return _sectortype; }
            set { _sectortype = value; }
        }

        
        private string _work_specialization = "";

        public string Work_specialization
        {
            get { return _work_specialization; }
            set { _work_specialization = value; }
        }
        private string _experience = "";

        public string Experience
        {
            get { return _experience; }
            set { _experience = value; }
        }
        private int _labourtype;

        public int Labourtype
        {
            get { return _labourtype; }
            set { _labourtype = value; }
        }
        private decimal _ph_belonging1;

        public decimal Ph_belonging1
        {
            get { return _ph_belonging1; }
            set { _ph_belonging1 = value; }
        }
        private decimal _ph_belonging2;

        public decimal Ph_belonging2
        {
            get { return _ph_belonging2; }
            set { _ph_belonging2 = value; }
        }
        private decimal _ph_belonging3;

        public decimal Ph_belonging3
        {
            get { return _ph_belonging3; }
            set { _ph_belonging3 = value; }
        }
        private decimal _ph_belonging4;

        public decimal Ph_belonging4
        {
            get { return _ph_belonging4; }
            set { _ph_belonging4 = value; }
        }
        private int _exp_type;

        public int Exp_type
        {
            get { return _exp_type; }
            set { _exp_type = value; }
        }
        private char _verification = 'N';

        public char Verification
        {
            get { return _verification; }
            set { _verification = value; }
        }
        private string _imageurl = "";

        public string Imageurl
        {
            get { return _imageurl; }
            set { _imageurl = value; }
        }
        private string _docurl1 = "";

        public string Docurl1
        {
            get { return _docurl1; }
            set { _docurl1 = value; }
        }
        private string _docurl2 = "";

        public string Docurl2
        {
            get { return _docurl2; }
            set { _docurl2 = value; }
        }
        private string _docurl3 = "";

        public string Docurl3
        {
            get { return _docurl3; }
            set { _docurl3 = value; }
        }
        private string _docurl4 = "";

        public string Docurl4
        {
            get { return _docurl4; }
            set { _docurl4 = value; }
        }

        private int _supplierid;

        public int Supplierid
        {
            get { return _supplierid; }
            set { _supplierid = value; }
        }

        private string _wages = "";

        public string Wages
        {
            get { return _wages; }
            set { _wages = value; }
        }

        private void AddProcParam()
        {
            objParamCollection = new DbSqlParameterCollection();

            DbSqlParameter _opModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            _opModePara.Value = _opmode;
            objParamCollection.Add(_opModePara);

            DbSqlParameter Reg_IDPara = new DbSqlParameter("@Reg_ID", SqlDbType.Int);
            Reg_IDPara.Value = _reg_id;
            objParamCollection.Add(Reg_IDPara);

            DbSqlParameter LabourCodePara = new DbSqlParameter("@Labour_Code", SqlDbType.VarChar);
            LabourCodePara.Value = _labourcode;
            objParamCollection.Add(LabourCodePara);

            DbSqlParameter FullNamePara = new DbSqlParameter("@FullName", SqlDbType.VarChar);
            FullNamePara.Value = _fullname;
            objParamCollection.Add(FullNamePara);

            DbSqlParameter FatherNamePara = new DbSqlParameter("@FatherName", SqlDbType.VarChar);
            FatherNamePara.Value = _fathername;
            objParamCollection.Add(FatherNamePara);
            DbSqlParameter C_AddressPara = new DbSqlParameter("@C_Address", SqlDbType.VarChar);
            C_AddressPara.Value = _c_address;
            objParamCollection.Add(C_AddressPara);
            DbSqlParameter C_StatePara = new DbSqlParameter("@C_State", SqlDbType.Int);
            C_StatePara.Value = _c_state;
            objParamCollection.Add(C_StatePara);
            DbSqlParameter C_CityPara = new DbSqlParameter("@C_City", SqlDbType.Int);
            C_CityPara.Value = _c_city;
            objParamCollection.Add(C_CityPara);
            DbSqlParameter C_PincodePara = new DbSqlParameter("@C_Pincode", SqlDbType.Decimal);
            C_PincodePara.Value = _c_pincode;
            objParamCollection.Add(C_PincodePara);
            DbSqlParameter P_AddressPara = new DbSqlParameter("@P_Address", SqlDbType.VarChar);
            P_AddressPara.Value = _p_address;
            objParamCollection.Add(P_AddressPara);
            DbSqlParameter P_StatePara = new DbSqlParameter("@P_State", SqlDbType.Int);
            P_StatePara.Value = _p_state;
            objParamCollection.Add(P_StatePara);
            DbSqlParameter P_CityPara = new DbSqlParameter("@P_City", SqlDbType.Int);
            P_CityPara.Value = _p_city;
            objParamCollection.Add(P_CityPara);
            DbSqlParameter P_PincodePara = new DbSqlParameter("@P_Pincode", SqlDbType.Decimal);
            P_PincodePara.Value = _p_pincode;
            objParamCollection.Add(P_PincodePara);
            DbSqlParameter Ph_NoPara = new DbSqlParameter("@Ph_No", SqlDbType.Decimal);
            Ph_NoPara.Value = _phno;
            objParamCollection.Add(Ph_NoPara);
            DbSqlParameter SectorTypePara = new DbSqlParameter("@SectorType", SqlDbType.Decimal);
            SectorTypePara.Value = _sectortype;
            objParamCollection.Add(SectorTypePara);
            DbSqlParameter Work_SpecializationPara = new DbSqlParameter("@Work_Specialization", SqlDbType.VarChar);
            Work_SpecializationPara.Value = _work_specialization;
            objParamCollection.Add(Work_SpecializationPara);
            DbSqlParameter ExperiencePara = new DbSqlParameter("@Experience", SqlDbType.VarChar);
            ExperiencePara.Value = _experience;
            objParamCollection.Add(ExperiencePara);
            DbSqlParameter LabourTypePara = new DbSqlParameter("@LabourType", SqlDbType.Int);
            LabourTypePara.Value = _labourtype;
            objParamCollection.Add(LabourTypePara);
            DbSqlParameter Ph_Belonging1Para = new DbSqlParameter("@Ph_belonging1", SqlDbType.Decimal);
            Ph_Belonging1Para.Value = _ph_belonging1;
            objParamCollection.Add(Ph_Belonging1Para);
            DbSqlParameter Ph_Belonging2Para = new DbSqlParameter("@Ph_belonging2", SqlDbType.Decimal);
            Ph_Belonging2Para.Value = _ph_belonging2;
            objParamCollection.Add(Ph_Belonging2Para);
            DbSqlParameter Ph_Belonging3Para = new DbSqlParameter("@Ph_belonging3", SqlDbType.Decimal);
            Ph_Belonging3Para.Value = _ph_belonging3;
            objParamCollection.Add(Ph_Belonging3Para);
            DbSqlParameter Ph_Belonging4Para = new DbSqlParameter("@Ph_belonging4", SqlDbType.Decimal);
            Ph_Belonging4Para.Value = _ph_belonging4;
            objParamCollection.Add(Ph_Belonging4Para);
            DbSqlParameter Experience_TypePara = new DbSqlParameter("@Experience_Type", SqlDbType.Int);
            Experience_TypePara.Value = _exp_type;
            objParamCollection.Add(Experience_TypePara);
            DbSqlParameter VarificationPara = new DbSqlParameter("@Verification", SqlDbType.Char);
            VarificationPara.Value = _verification;
            objParamCollection.Add(VarificationPara);
            DbSqlParameter ImageUrlPara = new DbSqlParameter("@Image_Url", SqlDbType.VarChar);
            ImageUrlPara.Value = _imageurl;
            objParamCollection.Add(ImageUrlPara);
            DbSqlParameter DocUrl1Para = new DbSqlParameter("@Doc1_Url", SqlDbType.VarChar);
            DocUrl1Para.Value = _docurl1;
            objParamCollection.Add(DocUrl1Para);
            DbSqlParameter DocUrl2Para = new DbSqlParameter("@Doc2_Url", SqlDbType.VarChar);
            DocUrl2Para.Value = _docurl2;
            objParamCollection.Add(DocUrl2Para);
            DbSqlParameter DocUrl3Para = new DbSqlParameter("@Doc3_Url", SqlDbType.VarChar);
            DocUrl3Para.Value = _docurl3;
            objParamCollection.Add(DocUrl3Para);
            DbSqlParameter DocUrl4Para = new DbSqlParameter("@Doc4_Url", SqlDbType.VarChar);
            DocUrl4Para.Value = _docurl4;
            objParamCollection.Add(DocUrl4Para);
            DbSqlParameter SupplierIDPara = new DbSqlParameter("@SupplierID", SqlDbType.Int);
            SupplierIDPara.Value = _supplierid;
            objParamCollection.Add(SupplierIDPara);
            DbSqlParameter WagesPara = new DbSqlParameter("@Wages", SqlDbType.VarChar);
            WagesPara.Value = _wages;
            objParamCollection.Add(WagesPara);

        }

        public void SaveData(string opmode)
        {
            _opmode = opmode;
            AddProcParam();
            CrystalConnection.DoStored("usp_LabourRegProc", objParamCollection);
        }

        public void DeleteLabInfo(string opmode, int RegID)
        {
            _opmode = opmode;
            _reg_id = RegID;
            AddProcParam();
            CrystalConnection.DoStoredScalar("usp_LabourRegProc", objParamCollection, true);
        }
        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

        //Added by khushbu to fill dataset
        public static DataTable GetLabourData(int Reg_ID)
        {
            string DBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CrystalConnection"].ConnectionString;
            SqlParameter[] sqlParams = new SqlParameter[1];//1
            sqlParams[0] = new SqlParameter("@Reg_ID", Reg_ID);
            DataSet ds = DataWrapper.ExecuteDataset(DBConnectionString, CommandType.StoredProcedure, "usp_GetLabourData", sqlParams);

            return ds.Tables[0];

        }


    }
}