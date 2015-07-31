using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csPaymentMade
    {
        DbSqlParameterCollection objParamCollection;

        private string _opmode = "";

        public string Opmode
        {
            get { return _opmode; }
            set { _opmode = value; }
        }

        private int _pmt_id;

        public int Pmt_id
        {
            get { return _pmt_id; }
            set { _pmt_id = value; }
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

            DbSqlParameter PMT_IDPara = new DbSqlParameter("@PMT_ID", SqlDbType.Int);
            PMT_IDPara.Value = _pmt_id;
            objParamCollection.Add(PMT_IDPara);

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
            CrystalConnection.DoStored("usp_PaymentMade", objParamCollection);
        }

        public void DeletePMT(string opmode, int PMT_ID)
        {
            _opmode = opmode;
            _pmt_id = PMT_ID;
            AddProcParam();
            CrystalConnection.DoStoredScalar("usp_PaymentMade", objParamCollection, true);
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

    }
}