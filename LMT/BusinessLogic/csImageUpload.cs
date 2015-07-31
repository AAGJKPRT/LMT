using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csImageUpload
    {
        #region Declaration of All Global Variables
        DbSqlParameterCollection objParamColleciton;
        #endregion

        #region Declaration of All Variables
        private string _opMode = "";
        private decimal _imgID;
        private byte[] _imgContent;
        private string _imgExt = "";
        private string _mstTableName = "";
        private decimal _userID;
        #endregion

        #region Declaration of All Properties
        public string OPMODE
        {
            get { return _opMode; }
            set { _opMode = value; }
        }
        public decimal IMGID
        {
            get { return _imgID; }
            set { _imgID = value; }
        }
        public byte[] IMGCONTENT
        {
            get { return _imgContent; }
            set { _imgContent = value; }
        }
        public string IMGEXT
        {
            get { return _imgExt; }
            set { _imgExt = value; }
        }
        public string MSTTABLENAME
        {
            get { return _mstTableName; }
            set { _mstTableName = value; }
        }
        public decimal USERID
        {
            get { return _userID; }
            set { _userID = value; }
        }
        #endregion

        #region Define All Functions here
        private void AddProcedureParameters()
        {
            objParamColleciton = new DbSqlParameterCollection();

            DbSqlParameter opModeParam = new DbSqlParameter("@opMode", SqlDbType.VarChar, 25);
            opModeParam.Value = _opMode;
            objParamColleciton.Add(opModeParam);

            DbSqlParameter imageIDParam = new DbSqlParameter("@ImageID", SqlDbType.Decimal);
            imageIDParam.Value = _imgID;
            objParamColleciton.Add(imageIDParam);

            DbSqlParameter imgContentParam = new DbSqlParameter("@ImageContent", SqlDbType.VarBinary);
            imgContentParam.Value = _imgContent;
            objParamColleciton.Add(imgContentParam);

            DbSqlParameter imgExtParam = new DbSqlParameter("@imgExt", SqlDbType.VarChar, 10);
            imgExtParam.Value = _imgExt;
            objParamColleciton.Add(imgExtParam);

            DbSqlParameter mstTableNameParam = new DbSqlParameter("@MasterTblName", SqlDbType.VarChar, 50);
            mstTableNameParam.Value = _mstTableName;
            objParamColleciton.Add(mstTableNameParam);

            DbSqlParameter userIDParam = new DbSqlParameter("@UserID", SqlDbType.Decimal);
            userIDParam.Value = _userID;
            objParamColleciton.Add(userIDParam);
        }

        public static DataSet FillDataSet(string strQuery)
        {
            DataSet dsFillData;
            dsFillData = CrystalConnection.CreateDatasetWithoutTransaction(strQuery);
            return dsFillData;
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

        public decimal ExecuteProcedure(string opMode, decimal ImgID = 0)
        {
            _opMode = opMode;
            _imgID = ImgID;
            AddProcedureParameters();
            return Convert.ToDecimal(CrystalConnection.DoStoredScalar("usp_AllImagesProc", objParamColleciton,false));
        }
        #endregion
    }
}