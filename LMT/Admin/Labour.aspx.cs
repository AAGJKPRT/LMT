using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDatabase;
using LMT.ClassGlobal;

namespace LMT.Admin
{
    public partial class Labour : System.Web.UI.Page
    {
        csDropDownFunction objDropDown = new csDropDownFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            PW_Labour();
            AW_Labour();
            SW_Labour();
            SecW_Labour();
            OL_Labour();
        }

        //All Lines commented by khushbu 
        //no need to use inline queries
        private void PW_Labour()
        {
            //string strQuery = "Select total=COUNT(LabourType),Lbr_Type,LabourType from tbl_LabourRegistration " +
            //                  "Inner Join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
            //                  "group by LabourType,Lbr_Type";
            DataTable dt = new DataTable();
            //dt = FillDataTable(strQuery);
            dt = objDropDown.FillPieChartTable("PW",0);
            foreach (DataRow dr in dt.Rows)
            {
                PW_LabourChart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = dr["Lbr_Type"].ToString(),
                    Data = Convert.ToDecimal(dr["total"].ToString()),
                });
            }
        }

        private void AW_Labour()
        {
            //string strQuery = "Select total=COUNT(CCity),CCity,CityName from tbl_LabourRegistration " +
            //                  "Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID " +
            //                  "group by CCity,CityName";
            DataTable dt = new DataTable();

            //dt = FillDataTable(strQuery);
            dt = objDropDown.FillPieChartTable("AW", 0);
            foreach (DataRow dr in dt.Rows)
            {
                AW_LabourChart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = dr["CityName"].ToString(),
                    Data = Convert.ToDecimal(dr["total"].ToString()),
                });
            }
        }

        private void SW_Labour()
        {
            //string strQuery = "Select total=COUNT(Experience_Type),Experience_Type from tbl_LabourRegistration group by Experience_Type";
            DataTable dt = new DataTable();

            //dt = FillDataTable(strQuery);
            dt = objDropDown.FillPieChartTable("SW", 0);
            dt.Columns.Add("Status", typeof(string));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if ("1" == Convert.ToString(dt.Rows[i][1]))
                {
                    dt.Rows[i][2] = "Skilled";
                }
                else if ("2" == Convert.ToString(dt.Rows[i][1]))
                {
                    dt.Rows[i][2] = "Semi-Skilled";
                }
                else
                    dt.Rows[i][2] = "Fresher";
            }
            foreach (DataRow dr in dt.Rows)
            {
                SW_LabourChart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = dr["Status"].ToString(),
                    Data = Convert.ToDecimal(dr["total"].ToString()),
                });
            }
        }

        private void SecW_Labour()
        {
            //string strQuery = "Select total=COUNT(SectorType),SectorType from tbl_LabourRegistration group by SectorType";
            DataTable dt = new DataTable();

            //dt = FillDataTable(strQuery);
            dt = objDropDown.FillPieChartTable("SECW", 0);
            //dt.Columns.Add("Sector", typeof(string));
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    if ("1" == Convert.ToString(dt.Rows[i][1]))
            //    {
            //        dt.Rows[i][2] = "House Hold";
            //    }
            //    else if ("2" == Convert.ToString(dt.Rows[i][1]))
            //    {
            //        dt.Rows[i][2] = "General";
            //    }
            //    else
            //        dt.Rows[i][2] = "Industrial";
            //}
            foreach (DataRow dr in dt.Rows)
            {
                SecW_LabourChart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = dr["Sector"].ToString(),
                    Data = Convert.ToDecimal(dr["total"].ToString()),
                });
            }
        }

        private void OL_Labour()
        {
            //string strQuery = "Select total=COUNT(Experience_Type),Experience_Type from tbl_LabourRegistration where SupplierID=" + Convert.ToString(Session["UserID"]) + " group by Experience_Type";
            DataTable dt = new DataTable();

           // dt = FillDataTable(strQuery);
            dt = objDropDown.FillPieChartTable("OLW",Convert.ToInt32(Session["UserID"]));
            dt.Columns.Add("Status", typeof(string));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if ("1" == Convert.ToString(dt.Rows[i][1]))
                {
                    dt.Rows[i][2] = "Skilled";
                }
                else if ("2" == Convert.ToString(dt.Rows[i][1]))
                {
                    dt.Rows[i][2] = "Semi-Skilled";
                }
                else
                    dt.Rows[i][2] = "Fresher";
            }
            foreach (DataRow dr in dt.Rows)
            {
                OL_LabourChart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = dr["Status"].ToString(),
                    Data = Convert.ToDecimal(dr["total"].ToString()),
                });
            }
        }

        //public static DataTable FillDataTable(string query)
        //{
        //    DataTable dtFillData;
        //    dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
        //    return dtFillData;
        //}
    }
}