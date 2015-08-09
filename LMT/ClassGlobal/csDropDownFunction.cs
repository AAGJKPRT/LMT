using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using CrystalDatabase;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DataLayer;

namespace LMT.ClassGlobal
{
    public class csDropDownFunction
    {
        DataSet dsCommon;

        public void FillDropDown(ref DropDownList objDropDown, string strQuery, string strTextField, string strValueField, string strOrderBy, string strQueryCondition = "", bool showOther = false, bool showAll = false, bool showcity = false, bool showstate = false, bool showSelect = true)
        {
            dsCommon = new DataSet();
            dsCommon = CrystalConnection.CreateDatasetWithoutTransaction(strQuery + " " + strQueryCondition + " " + strOrderBy);

            if (showSelect == true)
            {
                DataRow dr = dsCommon.Tables[0].NewRow();
                dr[strTextField] = "-- Select --";
                dr[strValueField] = "-1";
                dsCommon.Tables[0].Rows.InsertAt(dr, 0);
            }

            if (showcity == true)
            {
                DataRow dr1 = dsCommon.Tables[0].NewRow();
                dr1[strTextField] = "-- City --";
                dr1[strValueField] = "-1";
                dsCommon.Tables[0].Rows.InsertAt(dr1, 0);
            }

            if (showstate == true)
            {
                DataRow dr1 = dsCommon.Tables[0].NewRow();
                dr1[strTextField] = "-- State --";
                dr1[strValueField] = "-1";
                dsCommon.Tables[0].Rows.InsertAt(dr1, 0);
            }

            if (showOther == true)
            {
                DataRow dr1 = dsCommon.Tables[0].NewRow();
                dr1[strTextField] = "-- Other --";
                dr1[strValueField] = "-2";
                dsCommon.Tables[0].Rows.InsertAt(dr1, dsCommon.Tables[0].Rows.Count);
            }

            if (showAll == true && showSelect == true)
            {
                DataRow dr2 = dsCommon.Tables[0].NewRow();
                dr2[strTextField] = "-- All --";
                dr2[strValueField] = "-3";
                dsCommon.Tables[0].Rows.InsertAt(dr2, 1);
            }
            else if (showAll == true && showSelect == false)
            {
                DataRow dr2 = dsCommon.Tables[0].NewRow();
                dr2[strTextField] = "-- All --";
                dr2[strValueField] = "-3";
                dsCommon.Tables[0].Rows.InsertAt(dr2, 0);
            }

            //objDropDown.SelectedValue = "-1";
            objDropDown.DataTextField = strTextField;
            objDropDown.DataValueField = strValueField;
            objDropDown.DataSource = dsCommon.Tables[0].DefaultView;
            objDropDown.DataBind();
        }

        public void FillDropDownWithoutValue(ref DropDownList objDropDown, string strQuery, string strTextField, string strOrderBy, string strQueryCondition = "")
        {
            dsCommon = new DataSet();
            dsCommon = CrystalConnection.CreateDatasetWithoutTransaction(strQuery + " " + strQueryCondition + " " + strOrderBy);

            DataRow dr = dsCommon.Tables[0].NewRow();
            dr[strTextField] = "-- Select --";
            dsCommon.Tables[0].Rows.InsertAt(dr, 0);

            objDropDown.DataTextField = strTextField;
            objDropDown.DataValueField = strTextField;
            objDropDown.DataSource = dsCommon.Tables[0].DefaultView;
            objDropDown.DataBind();
        }

        public void FillRadiobtnList(ref RadioButtonList objrbtnList, string strQuery, string strTextField, string strValueField, string strOrderBy, string strQueryCondition = "")
        {
            dsCommon = new DataSet();
            dsCommon = CrystalConnection.CreateDatasetWithoutTransaction(strQuery + " " + strQueryCondition + " " + strOrderBy);

            objrbtnList.DataTextField = strTextField;
            objrbtnList.DataValueField = strValueField;
            objrbtnList.DataSource = dsCommon.Tables[0].DefaultView;
            objrbtnList.DataBind();
        }

        public void FillCheckBoxList(ref CheckBoxList objchkList, string strQuery, string strTextField, string strValueField, string strOrderBy, string strQueryCondition = "")
        {
            dsCommon = new DataSet();
            dsCommon = CrystalConnection.CreateDatasetWithoutTransaction(strQuery + " " + strQueryCondition + " " + strOrderBy);

            objchkList.DataTextField = strTextField;
            objchkList.DataValueField = strValueField;
            objchkList.DataSource = dsCommon.Tables[0].DefaultView;
            objchkList.DataBind();
        }

         public DataTable GetLookupTable(string lookupCode)
        {
            string DBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CrystalConnection"].ConnectionString;
            SqlParameter[] sqlParams = new SqlParameter[1];//1
            sqlParams[0] = new SqlParameter("@LookupCode", lookupCode);
            
            DataSet ds = DataWrapper.ExecuteDataset(DBConnectionString, CommandType.StoredProcedure, "usp_GetLookup", sqlParams);

            ds.Tables[0].Columns["LID"].ColumnName = "LID";
            ds.Tables[0].Columns["LDESC"].ColumnName = "LDESC";
          
            return ds.Tables[0];

        }

        public DataTable FillPieChartTable(string PieChart, int UserId)
         {
             string DBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CrystalConnection"].ConnectionString;
             SqlParameter[] sqlParams = new SqlParameter[2];//1
             sqlParams[0] = new SqlParameter("@PieChart", PieChart);
             sqlParams[1] = new SqlParameter("@UserId", UserId);
 
             DataSet ds = DataWrapper.ExecuteDataset(DBConnectionString, CommandType.StoredProcedure, "usp_FillLabourChartData", sqlParams);
 
             return ds.Tables[0];
 
         }
    }
}