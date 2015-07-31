using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csPaymentRecieve
    {
        DbSqlParameterCollection objParamCollection;

        private string _opmode = "";

        public string Opmode
        {
            get { return _opmode; }
            set { _opmode = value; }
        }

        private int _pr_id;

        public int Pr_id
        {
            get { return _pr_id; }
            set { _pr_id = value; }
        }
        private string _particulars = "";

        public string Particulars
        {
            get { return _particulars; }
            set { _particulars = value; }
        }
        private decimal _amount;

        public decimal Amount
        {
            get { return _amount; }
            set { _amount = value; }
        }
        private DateTime _date = DateTime.Now;

        public DateTime Date
        {
            get { return _date; }
            set { _date = value; }
        }
        private string _purpose = "";

        public string Purpose
        {
            get { return _purpose; }
            set { _purpose = value; }
        }

        private void AddProcParam()
        {
            objParamCollection = new DbSqlParameterCollection();

            DbSqlParameter _opModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            _opModePara.Value = _opmode;
            objParamCollection.Add(_opModePara);

            DbSqlParameter PR_IDPara = new DbSqlParameter("@PR_ID", SqlDbType.Int);
            PR_IDPara.Value = _pr_id;
            objParamCollection.Add(PR_IDPara);

            DbSqlParameter ParticularsPara = new DbSqlParameter("@Particulars", SqlDbType.VarChar);
            ParticularsPara.Value = _particulars;
            objParamCollection.Add(ParticularsPara);

            DbSqlParameter AmountPara = new DbSqlParameter("@Amount", SqlDbType.Decimal);
            AmountPara.Value = _amount;
            objParamCollection.Add(AmountPara);

            DbSqlParameter DatePara = new DbSqlParameter("@Date", SqlDbType.Date);
            DatePara.Value = _date;
            objParamCollection.Add(DatePara);

            DbSqlParameter PurposePara = new DbSqlParameter("@Purpose", SqlDbType.VarChar);
            PurposePara.Value = _purpose;
            objParamCollection.Add(PurposePara);
        }

        public void SaveData(string opmode)
        {
            _opmode = opmode;
            AddProcParam();
            CrystalConnection.DoStored("usp_PaymentRecieve", objParamCollection);
        }

        public void DeletePR(string opmode, int PR_ID)
        {
            _opmode = opmode;
            _pr_id = PR_ID;
            AddProcParam();
            CrystalConnection.DoStoredScalar("usp_PaymentRecieve", objParamCollection, true);
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }
    }
}