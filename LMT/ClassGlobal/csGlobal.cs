using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMT.ClassGlobal
{
    public class csGlobal
    {
        public static bool loginSuccessfull = false;

        #region Declaration of User Variables
        public decimal _userID;

        private string _userType = "";
        public string UserTypedata
        {
            get { return _userType; }
            set { _userType = value; }
        }

        private string _userCategory = "";
        public string UserCategorydata
        {
            get { return _userCategory; }
            set { _userCategory = value; }
        }

        private decimal _userImageID;
        public decimal UserImageIDdata
        {
            get { return _userImageID; }
            set { _userImageID = value; }
        }
        private string _userImageURL;
        public string UserImageURLdata
        {
            get { return _userImageURL; }
            set { _userImageURL = value; }
        }

        private decimal _userStdStaffID;
        public decimal UserStdStaffIDdata
        {
            get { return _userStdStaffID; }
            set { _userStdStaffID = value; }
        }
        public static string _ImgName = "";
        #endregion


        #region Declaration of User Type Variables
        public decimal _userAdmin = 1;
        public decimal _userFrontOfc = 2;
        public decimal _userTeacher = 3;
        public decimal _userAccountant = 4;
        public decimal _userLibrarian = 5;
        public decimal _userExamination = 6;
        public decimal _userPrinciple = 7;
        public decimal _userStudent = 8;
        public decimal _userParent = 9;
        #endregion

        #region Declaration of User Category Variables
        public decimal _userCategory_A = 1;
        public decimal _userCategory_B = 2;
        public decimal _userCategory_C = 3;
        public decimal _userCategory_D = 4;
        public decimal _userCategory_E = 5;
        #endregion

        public static int pageSize = 10;
        public static string alertMessage = "";

        public string _clubMember = "Club";
        public string _communityMember = "Community";

        #region Declaration of Operation Variables
        public string _insertMode = "INSERT";
        public string _updateMode = "UPDATE";
        public string _viewMode = "VIEW";
        public string _deleteMode = "DELETE";
        #endregion

        #region Declaration of UserRights Operation Variables
        public string _insertUserRcd = "INSERTRECORD";
        public string _updateUserRcd = "UPDATERECORD";
        public string _deleteUserRcd = "DELETERECORD";
        public string _deleteForeignUserRcd = "DELETEFOREIGNRECORD";
        #endregion

        #region Declaration of FinYear Variables
        public static string _finYear = "";
        public static string _startFinYear = "";
        public static string _endFinYear = "";
        #endregion

        #region Declaration of DropDown Default Values Variables
        public string _countryDetaultValue = "India";
        public string _stateDetaultValue = "Delhi";
        public string _categoryDetaultValue = "General";
        public string _boardDefaultValue = "CBSE";
        public string _employmentTypeDefaultValue = "Permanent";
        #endregion

        #region HTML Email Header and Footer
        public static string _EmailHeader = "<html> <head> <a href='http://www.easylabour.com'><div style='text-align:center'> <img src='http://www.easylabour.com/images/emailheader.png' style='width: 76%;' alt='' title='Easy Labour' /> </div> </a></head> <body> ";
        public static string _EmailFooter = "<div id='footer' style='text-align:center'> <p>In case of any further clarification, feel free to call or write to us at the contacts given in this email.</p> need help ? Mailto:hello@easylabour.com </div></body> </html>";
        #endregion
    }
}