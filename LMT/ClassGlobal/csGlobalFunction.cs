using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI.WebControls;
using System.Data;
using CrystalDatabase;
using System.Net;
using System.Net.Mail;
using System.Data.OleDb;
using System.Web.UI;
using LMT.ClassGlobal;
using System.Text;

namespace LMT.ClassGlobal
{
    public class csGlobalFunction
    {
        csGlobal globaldata = new csGlobal();
        public static PagedDataSource BindRepeaterWithPaging(ref Repeater objRepeater, int currentPage, string strSelectQuery, string strSearchCondition = "", string strAddNewRow = "")
        {
            //create new instance of PagedDataSource
            PagedDataSource objPds = new PagedDataSource();
            DataSet dsBindData = new DataSet();
            DataView dv = new DataView();

            //set number of pages will appear
            objPds.PageSize = csGlobal.pageSize;
            objPds.AllowPaging = true;

            //Fill DataSet And Create Dataview
            dsBindData = CrystalConnection.CreateDatasetWithoutTransaction(strSelectQuery);
            dv = dsBindData.Tables[0].DefaultView;

            //Filter the DataView According to Search Condition
            if (strSearchCondition != "")
            {
                dv.RowFilter = strSearchCondition;
            }

            objPds.DataSource = dv;

            //Setting CurrentPageIndex, Which page is to be set Current Page
            if (strAddNewRow == "")
                objPds.CurrentPageIndex = currentPage;
            else
                objPds.CurrentPageIndex = objPds.PageCount - 1;

            //Bind the Repeader with PageDataSource
            objRepeater.DataSource = objPds;
            objRepeater.DataBind();

            return objPds;
        }
        public static PagedDataSource BindRepeaterWithPagingReports(ref Repeater objRepeater, int currentPage, string strSelectQuery, int pageSize, string strAddNewRow = "")
        {
            //create new instance of PagedDataSource
            PagedDataSource objPds = new PagedDataSource();
            DataSet dsBindData = new DataSet();
            DataView dv = new DataView();

            //set number of pages will appear
            objPds.PageSize = pageSize;
            objPds.AllowPaging = true;

            //Fill DataSet And Create Dataview
            dsBindData = CrystalConnection.CreateDatasetWithoutTransaction(strSelectQuery);
            dv = dsBindData.Tables[0].DefaultView;

            //Filter the DataView According to Search Condition
            //if (strSearchCondition != "")
            //{
            //    dv.RowFilter = strSearchCondition;
            //}

            objPds.DataSource = dv;

            //Setting CurrentPageIndex, Which page is to be set Current Page
            if (strAddNewRow == "")
                objPds.CurrentPageIndex = currentPage;
            else
                objPds.CurrentPageIndex = objPds.PageCount - 1;

            //Bind the Repeader with PageDataSource
            objRepeater.DataSource = objPds;
            objRepeater.DataBind();

            return objPds;
        }
        public static void BindRepeater(ref Repeater objRepeater, string strSelectQuery)
        {
            DataSet dsBindData = new DataSet();
            DataView dv = new DataView();

            //Fill DataSet And Create Dataview
            dsBindData = CrystalConnection.CreateDatasetWithoutTransaction(strSelectQuery);
            dv = dsBindData.Tables[0].DefaultView;

            //Bind the Repeader with PageDataSource
            objRepeater.DataSource = dv;
            objRepeater.DataBind();
        }
        public static string GenerateCodewithLeftPad(decimal codeValue, int noOfPad)
        {
            string strPadCode = "";
            if (codeValue > 0)
            {
                strPadCode = codeValue.ToString().PadLeft(noOfPad, '0');
            }
            return strPadCode;
        }
        public static string GenerateCodeWithLeftPad(string mstTblName, string codeFieldName, int noOfPad, string strQueryCondition = "", bool finYear = false, string finYearColName = "")
        {
            string strQuery = "";
            string strPadCode = "";
            decimal maxCode = 0;
            if (strQueryCondition == "")
            {
                if (finYear == false)
                {
                    strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + "";
                }
                else
                {
                    if (finYearColName != "") strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + " Where " + finYearColName + "='" + csGlobal._finYear + "'";
                }
            }
            else
            {
                if (finYear == false)
                {
                    strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + " " + strQueryCondition;
                }
                else
                {
                    if (finYearColName != "") strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + " " + strQueryCondition + " And " + finYearColName + "='" + csGlobal._finYear + "'";
                }
            }

            if (strQuery != "") maxCode = Convert.ToDecimal((CrystalConnection.SqlScalartoObj(strQuery)));
            if (maxCode > 0)
            {
                strPadCode = maxCode.ToString().PadLeft(noOfPad, '0');
            }

            return strPadCode;
        }
        public static string GenerateCodeLftPaded(string mstTblName, string codeFieldName, int noOfPad, string strQueryCondition = "", string finYear = "", string finYearColName = "")
        {
            string strQuery = "";
            string strPadCode = "";
            decimal maxCode = 0;
            if (strQueryCondition == "")
            {
                if (finYear.Trim() == "")
                {
                    strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + "";
                }
                else
                {
                    if (finYearColName != "") strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + " Where " + finYearColName + "='" + finYear + "'";
                }
            }
            else
            {
                if (finYear.Trim() == "")
                {
                    strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + " " + strQueryCondition;
                }
                else
                {
                    if (finYearColName != "") strQuery = " Select isnull(max(" + codeFieldName + "),0)+1 From " + mstTblName + " " + strQueryCondition + " And " + finYearColName + "='" + finYear + "'";
                }
            }

            if (strQuery != "") maxCode = (decimal)CrystalConnection.SqlScalartoObj(strQuery);
            if (maxCode > 0)
            {
                strPadCode = maxCode.ToString().PadLeft(noOfPad, '0');
            }

            return strPadCode;
        }
        public static string GetServerDate()
        {
            string currentDate = Convert.ToString(CrystalConnection.SqlScalartoObj("Select Convert(Varchar(10),GETDATE(),103) CurrentDate"));
            return currentDate;

        }
        //Without Attechment
        public static void SendEmail(string sendto, string subject, string body)
        {
            string CompanyName = "Easy Labour Team";// Convert.ToString(CrystalConnection.SqlScalar("select top 1 CompanyName from tbl_ReportHeader"));
            string from = "easylabour.supplier@gmail.com";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient client = new SmtpClient();
            string[] allemails = sendto.Split(',');
            foreach (string recipientemail in allemails)
            {
                mail.To.Add(recipientemail);
            }
            //mail.To.Add(txtFatherEmail.Text.Trim()); 
            mail.From = new MailAddress(from, CompanyName, System.Text.Encoding.UTF8);
            mail.Subject = subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8; mail.Body = body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true; mail.Priority = MailPriority.High;

            //Add the Creddentials- use your own email id and password

            client.Credentials = new System.Net.NetworkCredential(from, "easylabour");

            client.Port = 587; // Gmail works on this port          
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail works on Server Secured Layer
            try
            {
                client.Send(mail);
                mail.To.Clear();
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                } HttpContext.Current.Response.Write(errorMessage);
            }
        }
        //Without Attechment
        public static void SendHTMLEmail(string recipientemailto, string strSubject, string username, string password)
        {
            StringBuilder stringBuilder = new StringBuilder();
            string CompanyName = "Easy Labour Team";
            string from = "easylabour.supplier@gmail.com";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient client = new SmtpClient();
            //string[] allemails = sendto.Split(',');
            //foreach (string recipientemail in allemails)
            //{
            mail.To.Add(recipientemailto);
            //}
            //mail.To.Add(txtFatherEmail.Text.Trim()); 
            mail.From = new MailAddress(from, CompanyName, System.Text.Encoding.UTF8);
            mail.Subject = strSubject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;

            #region Body Format...
            stringBuilder.Append(csGlobal._EmailHeader);
            stringBuilder.Append("<div style='text-align:left;font-size:larger;'><p><p>Dear <b> " + username + "</b></p><br />Welcome to Easy labour! Thanks so much for joining us. You’re on your way to super-productivity and beyond!<br /> <br />We are pleased to meet you ! </p>");
            //stringBuilder.Append("<p>Our expert labour will get in touch with you as per Service Request no.</p> <b>Service Request no</b><br />");
            stringBuilder.Append("<p>Please find the below details for your account: </p>");
            stringBuilder.Append("<p>Login name: <b>" + username + "</b></p>");
            stringBuilder.Append("<p>Password: <b>" + password + "</b> </p> </div>");
            stringBuilder.Append(csGlobal._EmailFooter);
            #endregion

            mail.Body = stringBuilder.ToString();
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            //Add the Creddentials- use your own email id and password

            client.Credentials = new System.Net.NetworkCredential(from, "easylabour");

            client.Port = 587; // Gmail works on this port          
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail works on Server Secured Layer
            try
            {
                client.Send(mail);
                mail.To.Clear();
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                } HttpContext.Current.Response.Write(errorMessage);
            }
        }
        //With Attechment
        public static void SendEmail(string sendto, string subject, string body, string filename)
        {
            string SchoolName = (String)CrystalConnection.SqlScalar("select top 1 CompanyName from tbl_ReportHeader");
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            string from = "easylabour.supplier@gmail.com";
            SmtpClient client = new SmtpClient();
            string[] allemails = sendto.Split(',');
            foreach (string recipientemail in allemails)
                mail.To.Add(recipientemail);
            mail.From = new MailAddress(from, SchoolName, System.Text.Encoding.UTF8);
            mail.Subject = subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8; mail.Body = body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true; mail.Priority = MailPriority.High;
            if (filename != "")
            {
                Attachment attach = new Attachment(filename);
                if (attach != null)
                    mail.Attachments.Add(attach);
            }

            //Add the Creddentials- use your own email id and password

            client.Credentials = new System.Net.NetworkCredential(from, "easylabour@123");
            client.Port = 587; // Gmail works on this port          
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail works on Server Secured Layer
            try
            {
                client.Send(mail);
                mail.To.Clear();
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                } HttpContext.Current.Response.Write(errorMessage);
            }
        }
        //Import Data From Excel To DataSet
        public static DataSet ImportExcelXLS(string FileName, bool hasHeaders)
        {
            string HDR = hasHeaders ? "Yes" : "No";
            string strConn;
            if (FileName.Substring(FileName.LastIndexOf('.')).ToLower() == ".xlsx")
                strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + FileName + ";Extended Properties=\"Excel 12.0;HDR=" + HDR + ";IMEX=0\"";
            else
                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + FileName + ";Extended Properties=\"Excel 8.0;HDR=" + HDR + ";IMEX=0\"";

            DataSet output = new DataSet();

            using (OleDbConnection conn = new OleDbConnection(strConn))
            {
                conn.Open();

                DataTable schemaTable = conn.GetOleDbSchemaTable(
                    OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });

                foreach (DataRow schemaRow in schemaTable.Rows)
                {
                    string sheet = schemaRow["TABLE_NAME"].ToString();

                    if (!sheet.EndsWith("_"))
                    {
                        try
                        {
                            OleDbCommand cmd = new OleDbCommand("SELECT * FROM [" + sheet + "]", conn);
                            cmd.CommandType = CommandType.Text;

                            DataTable outputTable = new DataTable(sheet);
                            output.Tables.Add(outputTable);
                            new OleDbDataAdapter(cmd).Fill(outputTable);
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message + string.Format("Sheet:{0}.File:F{1}", sheet, FileName), ex);
                        }
                    }
                }
            }
            return output;
        }
        public static string GetSMSBalance(DataTable dtSmsUserConfig)
        {
            HttpWebRequest myReq1 =
                //(HttpWebRequest)WebRequest.Create("http://" + dtSmsUserConfig.Rows[0]["smsIPAddress"] + "/balance.jsp?username=" + dtSmsUserConfig.Rows[0]["UserName"] + "&password=" + dtSmsUserConfig.Rows[0]["pwd"] + "");
            (HttpWebRequest)WebRequest.Create("http://sms.denizeninfotech.com/sendsms?uname=" + dtSmsUserConfig.Rows[0]["UserName"] + "&pwd=" + dtSmsUserConfig.Rows[0]["pwd"] + "&route=A");
            HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
            System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
            string strSmsBalance = respStreamReader1.ReadToEnd();
            respStreamReader1.Close();
            myResp1.Close();

            return strSmsBalance;
        }
        public static void ScheduleSMS(DataTable dtSmsUserConfig, string smsTo, string smsOriginalMessage, string scheduleDate, string scheduleTime)
        {
            string strMsgToSend;
            for (int cnt = smsOriginalMessage.Length; cnt > 0; )
            {
                if (cnt > 140)
                {
                    strMsgToSend = smsOriginalMessage.Substring(0, 140);
                    smsOriginalMessage = smsOriginalMessage.Substring(140, (smsOriginalMessage.Length - 140));
                    cnt = cnt - 140;
                }
                else
                {
                    strMsgToSend = smsOriginalMessage;
                    cnt = cnt - 140;
                }

                HttpWebRequest myReq =
               (HttpWebRequest)WebRequest.Create("http://" + dtSmsUserConfig.Rows[0]["smsIPAddress"] + "/ScheduleAPI.jsp?username=" + dtSmsUserConfig.Rows[0]["UserName"] + "&password=" + dtSmsUserConfig.Rows[0]["pwd"] + "&sendername=" + dtSmsUserConfig.Rows[0]["FromID"] + "&mobileno=" + smsTo + "&message=" + strMsgToSend + "&ScheduleDate=" + scheduleDate + "&ScheduleTime=" + scheduleTime + "");
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
            }
        }
        public static void SendSMS(DataTable dtSmsUserConfig, string smsTo, string smsOriginalMessage)
        {
            string strMsgToSend;
            for (int cnt = smsOriginalMessage.Length; cnt > 0; )
            {
                if (cnt > 140)
                {
                    strMsgToSend = smsOriginalMessage.Substring(0, 140);
                    smsOriginalMessage = smsOriginalMessage.Substring(140, (smsOriginalMessage.Length - 140));
                    cnt = cnt - 140;
                }
                else
                {
                    strMsgToSend = smsOriginalMessage;
                    cnt = cnt - 140;
                }

                HttpWebRequest myReq =
                    //(HttpWebRequest)WebRequest.Create("http://" + dtSmsUserConfig.Rows[0]["smsIPAddress"] + "/SMSAPI.jsp?username=" + dtSmsUserConfig.Rows[0]["UserName"] + "&password=" + dtSmsUserConfig.Rows[0]["pwd"] + "&sendername=" + dtSmsUserConfig.Rows[0]["FromID"] + "&mobileno=" + smsTo + "&message=" + strMsgToSend + " ");

               (HttpWebRequest)WebRequest.Create("http://sms.denizeninfotech.com/sendsms?uname=" + dtSmsUserConfig.Rows[0]["UserName"] + "&pwd=" + dtSmsUserConfig.Rows[0]["pwd"] + "&senderid=" + dtSmsUserConfig.Rows[0]["FromID"] + "&to=" + smsTo + "&msg=" + strMsgToSend + " ");
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
            }
        }
        public static void BindGrid(ref GridView objGrid, string strSelectQuery)
        {
            DataSet dsBindData = new DataSet();
            DataView dv = new DataView();

            //Fill DataSet And Create Dataview
            dsBindData = CrystalConnection.CreateDatasetWithoutTransaction(strSelectQuery);
            dv = dsBindData.Tables[0].DefaultView;

            //Bind the Grid View with PageDataSource
            objGrid.DataSource = dv;
            objGrid.DataBind();


        }
        public static DataTable TableRowConvert(DataTable inputTable)
        {
            DataTable outputTable = new DataTable();

            // Add columns by looping rows

            // Header row's first column is same as in inputTable
            outputTable.Columns.Add(inputTable.Columns[2].ColumnName.ToString());

            // Header row's second column onwards, 'inputTable's first column taken
            foreach (DataRow inRow in inputTable.Rows)
            {
                string newColName = inRow[0].ToString();
                outputTable.Columns.Add(newColName);
            }

            // Add rows by looping columns        
            for (int rCount = 1; rCount <= inputTable.Columns.Count - 2; rCount++)
            {
                DataRow newRow = outputTable.NewRow();

                // First column is inputTable's Header row's second column
                //newRow[0] = inputTable.Columns[rCount].ColumnName.ToString();
                for (int cCount = 0; cCount < inputTable.Rows.Count; cCount++)
                {
                    string colValue = inputTable.Rows[cCount][rCount].ToString();
                    newRow[cCount + 1] = colValue;
                }
                outputTable.Rows.Add(newRow);
            }
            outputTable.Rows[0]["Period"] = 0;
            return outputTable;
        }
        public static DataTable CreateDataTableForTimeTable(DataTable dtPeriodDtlTbl, DataTable dtSubDtlTbl)
        {
            DataTable dtWithPeriodAsCol = new DataTable();

            // Header row's first column is Day
            dtWithPeriodAsCol.Columns.Add("Days");
            dtWithPeriodAsCol.Rows.Add("0");
            dtWithPeriodAsCol.Rows.Add("Monday");
            dtWithPeriodAsCol.Rows.Add("Tuesday");
            dtWithPeriodAsCol.Rows.Add("Wednesday");
            dtWithPeriodAsCol.Rows.Add("Thursday");
            dtWithPeriodAsCol.Rows.Add("Friday");
            dtWithPeriodAsCol.Rows.Add("Saturday");
            dtWithPeriodAsCol.Rows.Add("Sunday");

            // Header row's second column onwards, 'inputTable's first column taken
            foreach (DataRow inRow in dtPeriodDtlTbl.Rows)
            {
                string newColName = inRow[1].ToString();
                dtWithPeriodAsCol.Columns.Add(newColName);
            }

            // Add periodID In first Row
            for (int rowCnt = 0; rowCnt < dtPeriodDtlTbl.Rows.Count; rowCnt++)
            {
                dtWithPeriodAsCol.Rows[0][rowCnt + 1] = dtPeriodDtlTbl.Rows[rowCnt]["PeriodDtlMstID"];
            }

            int iMondayColIndex = dtSubDtlTbl.Columns.IndexOf("MondaySubID");
            int iSundayColIndex = dtSubDtlTbl.Columns.IndexOf("SundaySubID");


            for (int rowCnt = 0; rowCnt < dtSubDtlTbl.Rows.Count; rowCnt++)
            {
                int periodRowCnt = 1;
                for (int colCnt = iMondayColIndex; colCnt <= iSundayColIndex; colCnt++)
                {
                    dtWithPeriodAsCol.Rows[periodRowCnt][rowCnt + 1] = dtSubDtlTbl.Rows[rowCnt][colCnt];
                    periodRowCnt++;
                }
            }

            return dtWithPeriodAsCol;
        }
        public static DataTable CreateDataTableForTeacherTimeTable(DataTable dtPeriodDtlTbl, DataTable dtTeacherDtlTbl)
        {
            DataTable dtWithPeriodAsCol = new DataTable();

            // Header row's first column is Day
            dtWithPeriodAsCol.Columns.Add("Days");
            dtWithPeriodAsCol.Rows.Add("0");
            dtWithPeriodAsCol.Rows.Add("Monday");
            dtWithPeriodAsCol.Rows.Add("Tuesday");
            dtWithPeriodAsCol.Rows.Add("Wednesday");
            dtWithPeriodAsCol.Rows.Add("Thursday");
            dtWithPeriodAsCol.Rows.Add("Friday");
            dtWithPeriodAsCol.Rows.Add("Saturday");
            dtWithPeriodAsCol.Rows.Add("Sunday");

            // Header row's second column onwards, 'inputTable's first column taken
            foreach (DataRow inRow in dtPeriodDtlTbl.Rows)
            {
                string newSubjectIDCol = inRow[1].ToString() + "SubjectID";
                dtWithPeriodAsCol.Columns.Add(newSubjectIDCol);

                string newSubjectNameCol = inRow[1].ToString() + "SubjectName";
                dtWithPeriodAsCol.Columns.Add(newSubjectNameCol);

                string newPeriodNameCol = inRow[1].ToString();
                dtWithPeriodAsCol.Columns.Add(newPeriodNameCol);
            }

            // Add periodID In first Row
            int colCnt1 = 1;
            for (int rowCnt = 0; rowCnt < dtPeriodDtlTbl.Rows.Count; rowCnt++)
            {
                dtWithPeriodAsCol.Rows[0][colCnt1] = dtPeriodDtlTbl.Rows[rowCnt]["PeriodDtlMstID"];
                dtWithPeriodAsCol.Rows[0][colCnt1 + 1] = dtPeriodDtlTbl.Rows[rowCnt]["PeriodDtlMstID"];
                dtWithPeriodAsCol.Rows[0][colCnt1 + 2] = dtPeriodDtlTbl.Rows[rowCnt]["PeriodDtlMstID"];
                colCnt1 += 3;
            }

            int iMondayColIndex = dtTeacherDtlTbl.Columns.IndexOf("MondaySubID");
            int iSundayStaffIDColIndex = dtTeacherDtlTbl.Columns.IndexOf("SundayStaffID");

            int periodColCnt = 1;
            for (int rowCnt = 0; rowCnt < dtTeacherDtlTbl.Rows.Count; rowCnt++)
            {
                int periodRowCnt = 1;
                for (int colCnt = iMondayColIndex; colCnt <= iSundayStaffIDColIndex; )
                {
                    dtWithPeriodAsCol.Rows[periodRowCnt][periodColCnt] = dtTeacherDtlTbl.Rows[rowCnt][colCnt];
                    dtWithPeriodAsCol.Rows[periodRowCnt][periodColCnt + 1] = dtTeacherDtlTbl.Rows[rowCnt][colCnt + 1];
                    dtWithPeriodAsCol.Rows[periodRowCnt][periodColCnt + 2] = dtTeacherDtlTbl.Rows[rowCnt][colCnt + 2];
                    periodRowCnt++;
                    colCnt += 3;
                }
                periodColCnt += 3;
            }

            return dtWithPeriodAsCol;
        }
        public static DataTable CreateDataTableForClassTimeTable(DataTable dtPeriodDtlTbl, DataTable dtTeacherDtlTbl)
        {
            DataTable dtWithPeriodAsCol = new DataTable();

            // Header row's first column is Day
            dtWithPeriodAsCol.Columns.Add("Days");
            dtWithPeriodAsCol.Rows.Add("0");
            dtWithPeriodAsCol.Rows.Add("Monday");
            dtWithPeriodAsCol.Rows.Add("Tuesday");
            dtWithPeriodAsCol.Rows.Add("Wednesday");
            dtWithPeriodAsCol.Rows.Add("Thursday");
            dtWithPeriodAsCol.Rows.Add("Friday");
            dtWithPeriodAsCol.Rows.Add("Saturday");
            dtWithPeriodAsCol.Rows.Add("Sunday");

            // Header row's second column onwards, 'inputTable's first column taken
            foreach (DataRow inRow in dtPeriodDtlTbl.Rows)
            {
                string newSubjectNameCol = inRow[1].ToString() + "SubjectName";
                dtWithPeriodAsCol.Columns.Add(newSubjectNameCol);

                string newPeriodNameCol = inRow[1].ToString();
                dtWithPeriodAsCol.Columns.Add(newPeriodNameCol);
            }

            // Add periodID In first Row
            int colCnt1 = 1;
            for (int rowCnt = 0; rowCnt < dtPeriodDtlTbl.Rows.Count; rowCnt++)
            {
                dtWithPeriodAsCol.Rows[0][colCnt1] = dtPeriodDtlTbl.Rows[rowCnt]["PeriodDtlMstID"];
                dtWithPeriodAsCol.Rows[0][colCnt1 + 1] = dtPeriodDtlTbl.Rows[rowCnt]["PeriodDtlMstID"];
                colCnt1 += 2;
            }

            int iMondayColIndex = dtTeacherDtlTbl.Columns.IndexOf("MonSubject");
            int iSundayStaffColIndex = dtTeacherDtlTbl.Columns.IndexOf("SunStaff");

            int periodColCnt = 1;
            for (int rowCnt = 0; rowCnt < dtTeacherDtlTbl.Rows.Count; rowCnt++)
            {
                int periodRowCnt = 1;
                for (int colCnt = iMondayColIndex; colCnt < iSundayStaffColIndex; )
                {
                    dtWithPeriodAsCol.Rows[periodRowCnt][periodColCnt] = dtTeacherDtlTbl.Rows[rowCnt][colCnt];
                    dtWithPeriodAsCol.Rows[periodRowCnt][periodColCnt + 1] = dtTeacherDtlTbl.Rows[rowCnt][colCnt + 2];
                    periodRowCnt++;
                    colCnt += 3;
                }
                periodColCnt += 2;
            }

            return dtWithPeriodAsCol;
        }
        public static DataTable ReportTableRowConvert(DataTable inputTable)
        {
            DataTable outputTable = new DataTable();

            // Add columns by looping rows

            // Header row's first column is same as in inputTable
            outputTable.Columns.Add(inputTable.Columns[0].ColumnName.ToString());

            // Header row's second column onwards, 'inputTable's first column taken
            foreach (DataRow inRow in inputTable.Rows)
            {
                string newColName = inRow[0].ToString();
                outputTable.Columns.Add(newColName);
            }

            // Add rows by looping columns        
            for (int rCount = 1; rCount <= inputTable.Columns.Count - 1; rCount++)
            {
                DataRow newRow = outputTable.NewRow();

                // First column is inputTable's Header row's second column
                newRow[0] = inputTable.Columns[rCount].ColumnName.ToString();
                for (int cCount = 0; cCount <= inputTable.Rows.Count - 1; cCount++)
                {
                    string colValue = inputTable.Rows[cCount][rCount].ToString();
                    newRow[cCount + 1] = colValue;
                }
                outputTable.Rows.Add(newRow);
            }

            return outputTable;
        }
        public static bool CheckUserInsert()
        {
            csGlobal globalobject = new csGlobal();
            bool rsltOut = false;
            string StrUserCat = "";
            if (HttpContext.Current.Session["UserCategory"] == null)
                HttpContext.Current.Response.Redirect("~/login.aspx");
            else
                StrUserCat = HttpContext.Current.Session["UserCategory"].ToString();
            if (StrUserCat.Trim().ToUpper() == "A" || StrUserCat.Trim().ToUpper() == "B" || StrUserCat.Trim().ToUpper() == "C")
                rsltOut = true;

            return rsltOut;
        }
        public static bool CheckUserUpdate()
        {
            csGlobal globalobject = new csGlobal();
            bool rsltOut = false;
            string StrUserCat = "";
            if (HttpContext.Current.Session["UserCategory"] == null)
                HttpContext.Current.Response.Redirect("~/login.aspx");
            else
                StrUserCat = HttpContext.Current.Session["UserCategory"].ToString();
            if (StrUserCat.Trim().ToUpper() == "A" || StrUserCat.Trim().ToUpper() == "B" || StrUserCat.Trim().ToUpper() == "D")
                rsltOut = true;

            return rsltOut;
        }
        public static bool CheckUserDelete()
        {
            csGlobal globalobject = new csGlobal();
            bool rsltOut = false;
            string StrUserCat = "";
            if (HttpContext.Current.Session["UserCategory"] == null)
                HttpContext.Current.Response.Redirect("~/login.aspx");
            else
                StrUserCat = HttpContext.Current.Session["UserCategory"].ToString();
            if (StrUserCat.Trim().ToUpper() == "A")
                rsltOut = true;

            return rsltOut;
        }
        //public static decimal[] rollbranchfunction()
        //{
        //    decimal[] moduleid = new decimal[20] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
        //    //for(int i=0;i<20;i++)
        //    //{
        //    //    moduleid[i] = 0;
        //    //}
        //    DataTable dttable = BusinessLogic.csSchoolMgt.FillDataTable("select ModuleID,Isverify from tblSchoolManagement order by ModuleID");
        //    for (int i = 0; i < dttable.Rows.Count; i++)
        //    {
        //        moduleid[i] = Convert.ToDecimal(dttable.Rows[i]["Isverify"].ToString());
        //    }
        //    return moduleid;
        //}
        //public static decimal findcode(string query)
        //{

        //    DataTable dttable = BusinessLogic.csSchoolMgt.FillDataTable(query);
        //    if (dttable.Rows.Count > 0)
        //    {
        //        decimal maxvalue = Convert.ToDecimal(dttable.Rows[0][0]);
        //        return maxvalue;
        //    }
        //    else
        //    {
        //        return 0;
        //    }
        //}
        public static void DownLoadFileFromServer(string fileName)
        {
            //This is used to get Project Location.
            string filePath = ServerMapPath(fileName);
            //This is used to get the current response.
            HttpResponse res = GetHttpResponse();
            res.Clear();
            res.AppendHeader("content-disposition", "attachment; filename=" + filePath);
            res.ContentType = "application/octet-stream";
            res.WriteFile(filePath);
            res.Flush();
            res.End();
        }
        public static HttpResponse GetHttpResponse()
        {
            return HttpContext.Current.Response;
        }
        public static string ServerMapPath(string path)
        {
            return HttpContext.Current.Server.MapPath(path);
        }
    }
}









