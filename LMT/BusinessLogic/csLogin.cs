using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using CrystalDatabase;
using System.Data;
using System.Data.SqlClient;

namespace LMT.BusinessLogic
{
    public class csLogin
    {
        #region Declaration of All Global Variables
        DbSqlParameterCollection objParamColleciton;
        #endregion

        #region Declaration of Procedure Valiables
        private string _loginName = "";
        #endregion

        #region Declaration of All Functions

        private void AddProcedureParameters()
        {
            objParamColleciton = new DbSqlParameterCollection();

            DbSqlParameter loginNameParam = new DbSqlParameter("@LoginName", SqlDbType.VarChar, 50);
            loginNameParam.Value = _loginName;
            objParamColleciton.Add(loginNameParam);
        }

        public DataTable ExecuteProcedure(string loginName)
        {
            _loginName = loginName;
            AddProcedureParameters();
            return (CrystalConnection.DoStoredTable("usp_UserLoginProc", objParamColleciton));
        }
        public DataTable ExecuteQuery(string StrQuery)
        {
            return (CrystalConnection.CreateDataTableWithoutTransaction(StrQuery));
        }

        //this function Convert to Decord your Password
        public static string DecodeFrom64(string encodedData)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encodedData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new String(decoded_char);
            return result;
        }
        #endregion
    }
}