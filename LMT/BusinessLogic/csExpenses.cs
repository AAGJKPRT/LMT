using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csExpenses
    {
        DbSqlParameterCollection objParamCollection;

        private string _opmode = "";

        public string Opmode
        {
            get { return _opmode; }
            set { _opmode = value; }
        }

        private int _exp_id;

        public int Exp_id
        {
            get { return _exp_id; }
            set { _exp_id = value; }
        }
        private DateTime _exp_date = DateTime.Today;

        public DateTime Exp_date
        {
            get { return _exp_date; }
            set { _exp_date = value; }
        }
        private string _exp_type = "";

        public string Exp_type
        {
            get { return _exp_type; }
            set { _exp_type = value; }
        }
        private string _exp_amount = "";

        public string Exp_amount
        {
            get { return _exp_amount; }
            set { _exp_amount = value; }
        }
        private string _exp_towhome = "";

        public string Exp_towhome
        {
            get { return _exp_towhome; }
            set { _exp_towhome = value; }
        }
        private string _exp_under = "";

        public string Exp_under
        {
            get { return _exp_under; }
            set { _exp_under = value; }
        }

        private void AddProcParam()
        {
            objParamCollection = new DbSqlParameterCollection();

            DbSqlParameter _opModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            _opModePara.Value = _opmode;
            objParamCollection.Add(_opModePara);

            DbSqlParameter Exp_IDPara = new DbSqlParameter("@Exp_ID", SqlDbType.Int);
            Exp_IDPara.Value = _exp_id;
            objParamCollection.Add(Exp_IDPara);

            DbSqlParameter Exp_DatePara = new DbSqlParameter("@Exp_Date", SqlDbType.Date);
            Exp_DatePara.Value = _exp_date;
            objParamCollection.Add(Exp_DatePara);

            DbSqlParameter Exp_TypePara = new DbSqlParameter("@Exp_Type", SqlDbType.VarChar);
            Exp_TypePara.Value = _exp_type;
            objParamCollection.Add(Exp_TypePara);

            DbSqlParameter Exp_AmountPara = new DbSqlParameter("@Exp_Amount", SqlDbType.VarChar);
            Exp_AmountPara.Value = _exp_amount;
            objParamCollection.Add(Exp_AmountPara);

            DbSqlParameter Exp_TowhomePara = new DbSqlParameter("@Exp_ToWhome", SqlDbType.VarChar);
            Exp_TowhomePara.Value = _exp_towhome;
            objParamCollection.Add(Exp_TowhomePara);

            DbSqlParameter Exp_UnderPara = new DbSqlParameter("@Exp_Under", SqlDbType.VarChar);
            Exp_UnderPara.Value = _exp_under;
            objParamCollection.Add(Exp_UnderPara);
        }

        private void AddProcParam_Select()
        {
            objParamCollection = new DbSqlParameterCollection();

            DbSqlParameter _opModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            _opModePara.Value = _opmode;
            objParamCollection.Add(_opModePara);

            DbSqlParameter Exp_IDPara = new DbSqlParameter("@Exp_ID", SqlDbType.Int);
            Exp_IDPara.Value = _exp_id;
            objParamCollection.Add(Exp_IDPara);
        }

        public void SaveData(string opmode)
        {
            _opmode = opmode;
            AddProcParam();
            CrystalConnection.DoStored("usp_Expenses", objParamCollection);
        }

        public void DeleteExp(string opmode, int Exp_ID)
        {
            _opmode = opmode;
            _exp_id = Exp_ID;
            AddProcParam();
            CrystalConnection.DoStoredScalar("usp_Expenses", objParamCollection, true);
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

        public DataTable SelectProc(string OpMode, int Exp_ID)
        {
            DataTable dtFillData;
            _opmode = OpMode;
            _exp_id = Exp_ID;
            AddProcParam_Select();
            //dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            dtFillData = CrystalConnection.DoStoredTable("usp_Select_Expenses", objParamCollection);
            return dtFillData;
        }


    }
}