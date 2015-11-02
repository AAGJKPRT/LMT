using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMT
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {


            #region Get service configurations

            string servicesPath = "http://services.easylabour.com/Service1.svc/";//ConfigurationManager.AppSettings["ServicePath"].ToString();
            string serviceName = "UploadFile";//ConfigurationManager.AppSettings["FileUploadServiceName"].ToString();

            #endregion




            #region File upload functionality

            if (Uploader.HasFile)
            {
                //string parameters = HttpUtility.UrlEncode(InvoiceSetUp.Text.Replace("'", "''")) + "," + HttpUtility.UrlEncode(InvoiceDescription.Text.Replace("'", "''")) + "," + ddlClient.SelectedValue + "," + Convert.ToDateTime(startdatetime).ToString("MM/dd/yyyy") + "," + Convert.ToDateTime(enddatetime).ToString("MM/dd/yyyy") + "," + Lbltotalamountfine.Text.Replace("'", "''") + "," + Lbltotalamount.Text.Replace("'", "''") + "," + Calculate + "," + InvoiceTaxFinalNumber.Text.Replace("'", "''") + "," + Discounts + "," + InvoiceDiscountFinalNumber.Text.Replace("'", "''") + "," + "2" + "," + LastPaymentDate.Text.Replace("'", "''") + "," + FinePaymentAmount.Text.Replace("'", "''") + "," + HttpUtility.UrlEncode(numSelected.ToString()) + "," + HttpUtility.UrlEncode(Session[SessionConstant.Email].ToString()) + "," + ctBusinessLayer.Encode64Encode(HttpUtility.UrlEncode(TempPasswordManual.Text.Replace("'", "''"))) + "," + HttpUtility.UrlEncode(Convert.ToString(ViewState["Str"])) + "," + HttpUtility.UrlEncode(Convert.ToString(ViewState["other"])) + "," + Session[SessionConstant.UserId].ToString() + "," + InvoiceSelectContact.SelectedValue + " ," + lblDiscountamount.Text + "," + lblTaxamount.Text + "," + "Null" + "";

                // string EncodedParameter = ctBusinessLayer.GetEncryptedQueryString(parameters);


                //string requestString = "http://services.easylabour.com/Service1.svc/UploadFile";// servicesPath + serviceName;
                string requestString = "http://localhost:1494/Service1.svc/UploadFile";

                //    WebRequest addlayerhistoryrequest = WebRequest.Create(requestString);
                WebRequest webRequestEvents = WebRequest.Create(requestString);
                webRequestEvents.Method = "POST";

                webRequestEvents.Headers["FileExtension"] = System.IO.Path.GetExtension(Uploader.FileName);
                webRequestEvents.Headers["FileUploadType"] = "Document";
                Stream stream = Uploader.FileContent;
                stream.Seek(0, SeekOrigin.Begin);
                byte[] byteArray = new byte[stream.Length];
                int count = 0;
                while (count < stream.Length)
                {
                    byteArray[count++] = Convert.ToByte(stream.ReadByte());
                }


                string json;

                // Set the ContentType property of the WebRequest.
                webRequestEvents.ContentType = "application/x-www-form-urlencoded";
                // Set the ContentLength property of the WebRequest.
                webRequestEvents.ContentLength = byteArray.Length;
                // Get the request stream.
                Stream dataStream = webRequestEvents.GetRequestStream();
                // Write the data to the request stream.
                dataStream.Write(byteArray, 0, byteArray.Length);
                // Close the Stream object.
                dataStream.Close();
                // Get the response.
                WebResponse response = webRequestEvents.GetResponse();
                JavaScriptSerializer js = new JavaScriptSerializer();
                HttpWebResponse httpWebResponseEvents = webRequestEvents.GetResponse() as HttpWebResponse;
                using (var sr = new StreamReader(httpWebResponseEvents.GetResponseStream()))
                {
                    json = sr.ReadToEnd();
                }
                var jsonObject = js.Deserialize<dynamic>(json);
                Response.Write(json);
                //Stream stream = Uploader.FileContent;
                //stream.Seek(0, SeekOrigin.Begin);
                // byteArray = new byte[stream.Length];
                //int count = 0;
                //while (count < stream.Length)
                //{
                //    byteArray[count++] = Convert.ToByte(stream.ReadByte());
                //}



                //byte[] byteArray = Encoding.UTF8.GetBytes(EncodedParameter);
                //// Set the ContentType property of the WebRequest.
                //webRequestEvents.ContentType = "application/x-www-form-urlencoded";
                //// Set the ContentLength property of the WebRequest.
                //webRequestEvents.ContentLength = byteArray.Length;
                //// Get the request stream.
                //Stream dataStream = webRequestEvents.GetRequestStream();
                //// Write the data to the request stream.
                //dataStream.Write(byteArray, 0, byteArray.Length);
                //// Close the Stream object.
                //dataStream.Close();
                //// Get the response.
                //#region Create WebRequest for file upload service

                //string requestURL = servicesPath + serviceName;
                //WebRequest fileUploadRequest = WebRequest.Create(requestURL);
                //fileUploadRequest.Method = "POST";

                //#endregion

                //#region Get Request Stream

                //Stream serverStream = fileUploadRequest.GetRequestStream();
                //serverStream.Write(byteArray, 0, byteArray.Length);
                //serverStream.Close();

                //#endregion

                //#region Service Call and Get the response

                //HttpWebResponse bucketResponse = fileUploadRequest.GetResponse() as HttpWebResponse;
                //Stream dataStream = bucketResponse.GetResponseStream();
                //StreamReader reader = new StreamReader(dataStream);
                //string responseFromServer = reader.ReadToEnd();

                //#endregion

            }
            else
            {
                //  fileUploadStatus = "Select File First!";

            }

            #endregion

        }

        public byte[] byteArray { get; set; }
    }
}