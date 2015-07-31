using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csLeads
    {
        DbSqlParameterCollection objParamCollection;
        DbSqlParameterCollection objCustomerParamCollection;
        private string _opmode = "";

        public string Opmode
        {
            get { return _opmode; }
            set { _opmode = value; }
        }
        private int _lead_id;

        public int Lead_id
        {
            get { return _lead_id; }
            set { _lead_id = value; }
        }

        private int _customerid;

        public int Customerid
        {
            get { return _customerid; }
            set { _customerid = value; }
        }

        private int _labourid;

        public int Labourid
        {
            get { return _labourid; }
            set { _labourid = value; }
        }

        private DateTime _required_date = DateTime.Today;

        public DateTime Required_date
        {
            get { return _required_date; }
            set { _required_date = value; }
        }

        private string _required_time = "";

        public string Required_time
        {
            get { return _required_time; }
            set { _required_time = value; }
        }

        private string _mobileno = "";

        public string Mobileno
        {
            get { return _mobileno; }
            set { _mobileno = value; }
        }

        private string _name = "";

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private string _emailid = "";

        public string Emailid
        {
            get { return _emailid; }
            set { _emailid = value; }
        }

        private string _address1 = "";

        public string Address1
        {
            get { return _address1; }
            set { _address1 = value; }
        }

        private string _address2 = "";

        public string Address2
        {
            get { return _address2; }
            set { _address2 = value; }
        }

        private string _password = "";

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }

        private char _t_and_c = 'Y';

        public char T_and_c
        {
            get { return _t_and_c; }
            set { _t_and_c = value; }
        }

        private string _status = "";

        public string Status
        {
            get { return _status; }
            set { _status = value; }
        }

        private int _asign;

        public int Asign
        {
            get { return _asign; }
            set { _asign = value; }
        }

        private string _ticket = "";

        public string Ticket
        {
            get { return _ticket; }
            set { _ticket = value; }
        }

        private string _description = "";

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }
        private void AddProcParam()
        {
            objParamCollection = new DbSqlParameterCollection();

            DbSqlParameter _opModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            _opModePara.Value = _opmode;
            objParamCollection.Add(_opModePara);

            DbSqlParameter LeadIDPara = new DbSqlParameter("@Lead_ID", SqlDbType.Int);
            LeadIDPara.Value = _lead_id;
            objParamCollection.Add(LeadIDPara);

            DbSqlParameter LabourIDPara = new DbSqlParameter("@Labour_ID", SqlDbType.Int);
            LabourIDPara.Value = _labourid;
            objParamCollection.Add(LabourIDPara);

            DbSqlParameter CustomerIDPara = new DbSqlParameter("@Customer_ID", SqlDbType.Int);
            CustomerIDPara.Value = _customerid;
            objParamCollection.Add(CustomerIDPara);

            DbSqlParameter RequiredDatePara = new DbSqlParameter("@Required_Date", SqlDbType.Date);
            RequiredDatePara.Value = _required_date;
            objParamCollection.Add(RequiredDatePara);

            DbSqlParameter RequiredTimePara = new DbSqlParameter("@Required_Time", SqlDbType.VarChar);
            RequiredTimePara.Value = _required_time;
            objParamCollection.Add(RequiredTimePara);

            DbSqlParameter StatusPara = new DbSqlParameter("@Status", SqlDbType.VarChar);
            StatusPara.Value = _status;
            objParamCollection.Add(StatusPara);

            DbSqlParameter AsignPara = new DbSqlParameter("@Asign", SqlDbType.Int);
            AsignPara.Value = _asign;
            objParamCollection.Add(AsignPara);

            DbSqlParameter TicketPara = new DbSqlParameter("@Ticket", SqlDbType.VarChar);
            TicketPara.Value = _ticket;
            objParamCollection.Add(TicketPara);

            DbSqlParameter DescPara = new DbSqlParameter("@Description", SqlDbType.VarChar);
            DescPara.Value = _description;
            objParamCollection.Add(DescPara);
        }

        private void AddCustomerProcParam()
        {
            objCustomerParamCollection = new DbSqlParameterCollection();

            DbSqlParameter _opModePara = new DbSqlParameter("@OpMode", SqlDbType.VarChar);
            _opModePara.Value = _opmode;
            objCustomerParamCollection.Add(_opModePara);

            DbSqlParameter CustomerIDPara = new DbSqlParameter("@Customer_ID", SqlDbType.Int);
            CustomerIDPara.Value = _customerid;
            objCustomerParamCollection.Add(CustomerIDPara);

            DbSqlParameter MobileNoPara = new DbSqlParameter("@MobileNo", SqlDbType.VarChar);
            MobileNoPara.Value = _mobileno;
            objCustomerParamCollection.Add(MobileNoPara);

            DbSqlParameter NamePara = new DbSqlParameter("@Name", SqlDbType.VarChar);
            NamePara.Value = _name;
            objCustomerParamCollection.Add(NamePara);

            DbSqlParameter EmailIDPara = new DbSqlParameter("@EmailID", SqlDbType.VarChar);
            EmailIDPara.Value = _emailid;
            objCustomerParamCollection.Add(EmailIDPara);

            DbSqlParameter Address1Para = new DbSqlParameter("@Address1", SqlDbType.VarChar);
            Address1Para.Value = _address1;
            objCustomerParamCollection.Add(Address1Para);

            DbSqlParameter Address2Para = new DbSqlParameter("@Address2", SqlDbType.VarChar);
            Address2Para.Value = _address2;
            objCustomerParamCollection.Add(Address2Para);

            DbSqlParameter PasswordPara = new DbSqlParameter("@Password", SqlDbType.VarChar);
            PasswordPara.Value = _password;
            objCustomerParamCollection.Add(PasswordPara);

            DbSqlParameter TicketPara = new DbSqlParameter("@Ticket", SqlDbType.VarChar);
            TicketPara.Value = _ticket;
            objCustomerParamCollection.Add(TicketPara);
        }

        public void SaveData(string opmode)
        {
            _opmode = opmode;
            AddProcParam();
            CrystalConnection.DoStored("usp_Leads", objParamCollection);
        }

        public int SaveCustomerData(string opmode)
        {
            _opmode = opmode;
            int a;
            AddCustomerProcParam();
            a = Convert.ToInt32(CrystalConnection.DoStoredScalar("usp_Customer", objCustomerParamCollection, true));
            return a;
            //CrystalConnection.DoStored("usp_Customer", objCustomerParamCollection);
        }
        
        public void DeleteLeadInfo(string opmode, int LeadID)
        {
            _opmode = opmode;
            _lead_id = LeadID;
            AddProcParam();
            CrystalConnection.DoStoredScalar("usp_Leads", objParamCollection, true);
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

    }
}