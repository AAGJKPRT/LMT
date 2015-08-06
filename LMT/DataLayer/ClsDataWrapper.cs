//Added by khushbu

using System;
using System.Data;
using System.Xml;
using System.Data.SqlClient;
using System.Collections;
using System.Text;
using DataLayer;


namespace DataLayer
{
	public class DataWrapper: SqlHelper,IDisposable
	{
		public delegate void SetTransId(int TransID);
		public static SetTransId SetID;
		public delegate void SetEndorsementTransIds(string TransIDs);
		public static SetEndorsementTransIds SetEndorsementIDs;
	
		public int CommandTimeout
		{
			set
			{
				mCommandTimeOut = value;
			}
			get
			{
				return mCommandTimeOut ;
			}

		}

		#region "Enums"
		public enum MaintainTransaction{YES,NO};
		public enum EDispose{YES,NO};
		public enum CloseConnection{YES,NO};
		public enum SetAutoCommit{ON,OFF};
		#endregion

		#region "Private Instance Variables"
		private string strConString;
		private CommandType objCommandType;
		public  Hashtable transactionCache;
		private ArrayList parameterCollection;
		private const string DEFAULT_TRANSACTION_NAME="Default Transaction";
		private MaintainTransaction transactionRequired=MaintainTransaction.NO;
		private SqlConnection objSqlConnection;
		private SetAutoCommit autoCommit=SetAutoCommit.OFF;
		private SqlParameter[] commandParameters;
		private string sbTransactionIDs;
		private SqlDataAdapter sqlDataAdapter;
		#endregion

		#region "Public Properties"

		public string ConnectionString
		{
			get	{return strConString;}
			set	{strConString = value;}
		}
		public CommandType CommandType
		{
			get	{return objCommandType;}
			set	{objCommandType = value;}
		}
		public SqlConnection WrapperSqlConnection
		{
			get	{return objSqlConnection;}
			set	{objSqlConnection = value;}
		}
		public MaintainTransaction TransactionRequired
		{
			get{return TransactionRequired;}
			set{transactionRequired=value;}
		}
		public SetAutoCommit AutoCommit
		{
			get{return autoCommit; }
			set{autoCommit=value;}
		}
		public string TransactionIDs
		{
			get{return sbTransactionIDs; }
			set{sbTransactionIDs = value ;}
		}
		public SqlParameter[] CommandParameters
		{
			get
			{
				try
				{
					object[] objParams= parameterCollection.ToArray();
					commandParameters=new SqlParameter[objParams.Length];
					for(int i=0;i<objParams.Length;i++)
						commandParameters[i]=(SqlParameter)objParams[i];
					return commandParameters;
				}catch(Exception objException)
				{
					throw new Exception("Error while executing non-Query!",objException);
				}
			}
			set
			{
				try
				{
					commandParameters=value;
					for(int i=0;i<commandParameters.Length;i++)
						parameterCollection.Add(commandParameters[i]);
				}catch(Exception objException)
				{
					throw new Exception("Error while executing non-Query!",objException);
				}
			}
		}
		#endregion

		#region "Constructors & EDispose"
		
        public DataWrapper(string strConString,CommandType objCommandType)//case 1 & 4
		{
            if (strConString == null || strConString == "")
            {
                throw new Exception("Connection String Not Found");
            }
			
			ConnectionString = strConString;
			CommandType = objCommandType;
			transactionCache =  new Hashtable();
			parameterCollection =  new ArrayList();

		}

		public DataWrapper(string strConString,CommandType objCommandType,MaintainTransaction transactionRequired,
						   SetAutoCommit AutoCommit):this(strConString,objCommandType,transactionRequired,
			               DEFAULT_TRANSACTION_NAME,AutoCommit){ }

		public DataWrapper(string strConString,CommandType objCommandType,MaintainTransaction transactionRequired,
			               string transactionName,SetAutoCommit AutoCommit):this(strConString,objCommandType)
		{
			this.TransactionRequired=transactionRequired;
			this.AutoCommit=AutoCommit;
		}
		public void Dispose()
		{
			CloseSqlConnection(EDispose.YES);
		}
		#endregion

		
		#region "Execute Non-query"

		public int ExecuteNonQuery(string sql)
		{
			string SPName = "";
			try
			{
				if(objCommandType == CommandType.StoredProcedure)
					SPName = sql;
				int intResult;
				OpenConnection();
				if(transactionRequired==MaintainTransaction.YES)
				{
					intResult = ExecuteNonQuery(GetTransactionObject(DEFAULT_TRANSACTION_NAME),CommandType,sql);
					
					if(AutoCommit==SetAutoCommit.ON) CommitTransaction(CloseConnection.YES);
				}
				else
				{
					intResult = ExecuteNonQuery(WrapperSqlConnection,CommandType,sql);
					CommitTransaction(CloseConnection.YES);
				}
		
				return intResult;
			}
			catch(Exception objException)
			{
				CloseSqlConnection(EDispose.YES);
				throw new Exception("Error while executing non-Query! Store procedure :  " + SPName ,objException);
			}
		}
		

		public void ExecuteNonQuery(string[] sqlArray)
		{
			string SPName = "";
			try
			{
				OpenConnection();
				if(transactionRequired==MaintainTransaction.YES)
				{
					
					for(int i=0;i<sqlArray.Length;i++)
					{
						if(objCommandType == CommandType.StoredProcedure)
							SPName = sqlArray[i];
						ExecuteNonQuery(GetTransactionObject(DEFAULT_TRANSACTION_NAME),CommandType,sqlArray[i]);
					}
					if(AutoCommit==SetAutoCommit.ON) CommitTransaction(CloseConnection.YES);
				}
				else
				{
					StringBuilder strTemp = new StringBuilder();
					for(int i=0;i<sqlArray.Length;i++)
						strTemp.Append(sqlArray[i]+";");
					ExecuteNonQuery(WrapperSqlConnection,CommandType,strTemp.ToString());
					CommitTransaction(CloseConnection.YES);
					
				}	
			}catch(Exception objException)
			{
				CloseSqlConnection(EDispose.YES);
				throw new Exception("Error while executing non-Query! Store Proc : " + SPName ,objException);
			}
				
		}
			
  		#endregion

		#region "Execute DataSet"
		
		public DataSet ExecuteDataSet(string sql)	
		{
			DataSet objDataSet;
			if(CommandParameters==null || CommandParameters.Length==0)
			{
				if(WrapperSqlConnection != null && WrapperSqlConnection.State != ConnectionState.Closed)
				{
					objDataSet = SqlHelper.ExecuteDataset(WrapperSqlConnection,GetTransactionObject(DEFAULT_TRANSACTION_NAME),this.CommandType,sql);
				}
				else
				{
					objDataSet=SqlHelper.ExecuteDataset(ConnectionString ,this.CommandType, sql);
				}
			}
			else
			{
				if(WrapperSqlConnection != null && WrapperSqlConnection.State != ConnectionState.Closed)
				{
					objDataSet = SqlHelper.ExecuteDataset(WrapperSqlConnection,GetTransactionObject(DEFAULT_TRANSACTION_NAME),this.CommandType,sql,commandParameters );
				}
				else
				{
					objDataSet=SqlHelper.ExecuteDataset(ConnectionString,this.CommandType,sql,CommandParameters);
				}
				
			}
			return objDataSet;
		}
		
		public DataSet ExecuteDataSet(string[] sqlArray)	
		{
			string sql ="";
			for(int i=0;i<sqlArray.Length;i++)
				sql += sqlArray[i]+";";
			return ExecuteDataSet(sql);
		}
		#endregion
		
		#region fill dataset
		public  void FillDataset(string commandText, DataSet dataSet, string[] tableNames)
		{
			SqlCommand command = new SqlCommand();
			bool mustCloseConnection = false;
			SqlTransaction objTransaction=GetTransactionObject(DEFAULT_TRANSACTION_NAME);
			SqlHelper.PrepareCommand(command, this.WrapperSqlConnection	,objTransaction , this.CommandType, commandText, CommandParameters, out mustCloseConnection );
    		sqlDataAdapter=new SqlDataAdapter(command);
			
			if (tableNames != null && tableNames.Length > 0)
			{
				string tableName = "Table";
				for (int index=0; index < tableNames.Length; index++)
				{
					if( tableNames[index] == null || tableNames[index].Length == 0 ) throw new ArgumentException( "The tableNames parameter must contain a list of tables, a value was provided as null or empty string.", "tableNames" );
					sqlDataAdapter.TableMappings.Add(tableName, tableNames[index]);
					tableName += (index + 1).ToString();
				}
			}	
		
			sqlDataAdapter.Fill(dataSet);
			
		}
		#endregion
		#region  updatedateSet
		public int UpdateDataset(DataSet dsChangedDataSet,string strTableName)	
		{
			try
			{
				SqlCommandBuilder objCmdBuider = new SqlCommandBuilder(sqlDataAdapter);
				
				SqlCommand insertCommand =objCmdBuider.GetInsertCommand();
				SqlCommand UpdateCommand =objCmdBuider.GetUpdateCommand();
				SqlCommand DeleteCommand =objCmdBuider.GetDeleteCommand();
				SqlHelper.UpdateDataset(insertCommand,DeleteCommand,UpdateCommand,dsChangedDataSet,strTableName);
				return 1;
			}
			catch(Exception ex)
			{
				throw(ex);
				
			}
			
		}

		#endregion

		#region "Public Utility Methods"
	
		public void CommitTransaction(CloseConnection closeConnection)
		{
			CommitTransaction(DEFAULT_TRANSACTION_NAME,closeConnection);
		}
		

		public void CommitTransaction(string transactionName,CloseConnection closeConnection)
		{
			try
			{
				SqlTransaction objSqlTransaction = (SqlTransaction) transactionCache[transactionName];
				if(objSqlTransaction!=null)
				{
					objSqlTransaction.Commit();
					transactionCache.Remove(transactionName);
				}
				if(closeConnection==CloseConnection.YES)
					CloseSqlConnection(EDispose.YES);				
			}
			catch(Exception objException)
			{
				throw new Exception("CAN NOT COMMIT! "+objException.ToString(),objException);
			}
		}
	
        public void RollbackTransaction(CloseConnection closeConnection)
		{
			RollbackTransaction(DEFAULT_TRANSACTION_NAME,closeConnection);
		}
	
		public void RollbackTransaction(string transactionName,CloseConnection closeConnection)
		{
			try
			{
				SqlTransaction objSqlTransaction = (SqlTransaction) transactionCache[transactionName];
				if(objSqlTransaction!=null)
				{
					objSqlTransaction.Rollback();
					transactionCache.Remove(transactionName);
				}
				if(closeConnection==CloseConnection.YES)
					CloseSqlConnection(EDispose.YES);
			}
			catch(Exception objException)
			{
				throw new Exception("Error while Rollback! "+objException.ToString(),objException);
			}
		}
		
		public void AddParameter(string name,object pvalue)
		{
			parameterCollection.Add(new SqlParameter(name,pvalue));
		}
		
		public void AddParameter(string name,object pValue,SqlDbType dbType)
		{
			SqlParameter objSqlParameter  = new SqlParameter(name,dbType);
			objSqlParameter.Value=pValue;
			parameterCollection.Add(objSqlParameter);
		}
		
		public object AddParameter(string name,object pvalue,ParameterDirection direction)
		{
			SqlParameter objSqlParameter  = new SqlParameter(name,pvalue);
			objSqlParameter.Direction=direction;
			parameterCollection.Add(objSqlParameter);
			return objSqlParameter;
		}
	
		public object AddParameter(string name,object pValue,SqlDbType dbType,ParameterDirection direction)
		{
			SqlParameter objSqlParameter  = new SqlParameter(name,dbType);
			objSqlParameter.Value=pValue;
			objSqlParameter.Direction=direction;
			parameterCollection.Add(objSqlParameter);
			return objSqlParameter;
		}

		
		public object AddParameter(string name,SqlDbType dbType,ParameterDirection direction)
		{
			SqlParameter objSqlParameter  = new SqlParameter(name,dbType);
			objSqlParameter.Direction=direction;
			parameterCollection.Add(objSqlParameter);
			return objSqlParameter;
		}

		public object AddParameter(string name,object pValue,SqlDbType dbType,ParameterDirection direction,int size)
		{
			SqlParameter objSqlParameter  = new SqlParameter(name,dbType);
			objSqlParameter.Value=pValue;
			objSqlParameter.Direction=direction;
			objSqlParameter.Size=size;
			parameterCollection.Add(objSqlParameter);
			return objSqlParameter;
		}
		public object GetParameterValue(string parameterName)
		{
			object obj = null;
			SqlParameter[] objSqlParameter = commandParameters;
			for(int i=0;i<objSqlParameter.Length;i++)
			{
				if(objSqlParameter[i].ParameterName.ToUpper().Equals(parameterName.ToUpper()) && (objSqlParameter[i].Direction == ParameterDirection.Output || objSqlParameter[i].Direction == ParameterDirection.InputOutput || objSqlParameter[i].Direction == ParameterDirection.ReturnValue))
				{
					obj = objSqlParameter[i].Value;
				}
			}
			return obj;
		}
		
		public void ClearParameteres()
		{
			commandParameters=null;
			parameterCollection=new ArrayList();
		}
		#endregion

		#region "Private Utility Methods"
	
		private void OpenConnection()
		{
			if (WrapperSqlConnection==null)
				objSqlConnection = new SqlConnection(ConnectionString);
			if(WrapperSqlConnection.State==ConnectionState.Closed)
				WrapperSqlConnection.Open();
		}

		private void CloseSqlConnection(EDispose disposeAfterClosing)
		{
			if(WrapperSqlConnection!=null)
			{
				RollbackTransaction(CloseConnection.NO);
				if(WrapperSqlConnection.State!=ConnectionState.Closed)
					WrapperSqlConnection.Close();
				if(disposeAfterClosing==EDispose.YES)
					WrapperSqlConnection.Dispose();
				WrapperSqlConnection=null;
			}
		}
		
		private SqlTransaction GetTransactionObject(string transactionName)
		{
			
			if (transactionName==null || transactionName.Length==0) transactionName=DEFAULT_TRANSACTION_NAME; 
			if(!transactionCache.ContainsKey(transactionName))
				transactionCache.Add(transactionName,WrapperSqlConnection.BeginTransaction(transactionName));
			return (SqlTransaction)transactionCache[transactionName];
		}
        public SqlTransaction GetSqlTransaction()
        {
            return GetTransactionObject(DEFAULT_TRANSACTION_NAME);
        }
		
		private int ExecuteNonQuery(SqlConnection connection, CommandType commandType, string commandText)
		{
			if(CommandParameters==null || CommandParameters.Length==0)
				return SqlHelper.ExecuteNonQuery(connection,commandType,commandText);
			else
				return SqlHelper.ExecuteNonQuery(connection,commandType,commandText,CommandParameters);
		}
		
		private int ExecuteNonQuery(SqlTransaction transaction, CommandType commandType, string commandText)
		{
			if(CommandParameters.Length==0)
				return SqlHelper.ExecuteNonQuery(transaction,commandType,commandText);
			else
				return SqlHelper.ExecuteNonQuery(transaction,commandType,commandText,CommandParameters);
		}
	
		#endregion
	}
}