using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrystalCampus.ClassGlobal
{
    public class csCommonPayrollFunction
    {
        decimal GivenBalance;
        public int calculateLastday(int mnth, int year)
        {
            // return last day of month
            #region
            switch (mnth)
            {
                case 1:
                    return 31;
                    break;
                case 2: if (year % 4 == 0)
                        return 29;
                    else
                        return 28;
                    break;
                case 3:
                    return 31;
                    break;
                case 4:
                    return 30;
                    break;
                case 5:
                    return 31;
                    break;
                case 6:
                    return 30;
                    break;
                case 7:
                    return 31;
                    break;
                case 8:
                    return 31;
                    break;
                case 9:
                    return 30;
                    break;
                case 10:
                    return 31;
                    break;
                case 11:
                    return 30;
                    break;
                case 12:
                    return 31;
                    break;
                default: return 0;
            }
            #endregion
        }
       

        public decimal GetLeaveBalanceOneTime(int Months,  int Days)
        {
            decimal DcmlNo;
            decimal Leave;
           
            if (Months == 4)
            {
                int TotalDays = 30;
                Leave = 30;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }

            if (Months == 5)
            {
                int TotalDays = 31;
                Leave = Convert.ToDecimal(27.5);
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 6)
            {
                int TotalDays = 30;
                Leave = 25;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 7)
            {
                int TotalDays = 31;
                Leave = Convert.ToDecimal(22.5);
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 8)
            {
                int TotalDays = 31;
                Leave = 20;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                return GivenBalance;
            }
            if (Months == 9)
            {
                int TotalDays = 30;
                Leave = Convert.ToDecimal(17.5);
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 10)
            {
                int TotalDays = 31;
                Leave = 15;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 11)
            {
                int TotalDays = 30;
                Leave = Convert.ToDecimal(12.5);
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 12)
            {
                int TotalDays = 31;
                Leave = 10;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 1)
            {
                int TotalDays = 31;
                Leave = Convert.ToDecimal(7.5);
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 2 && DateTime.Now.DayOfYear % 2 == 0)
            {
                int TotalDays = 29;
                Leave = 5;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 2 && DateTime.Now.DayOfYear % 2 != 0)
            {
                int TotalDays = 28;
                Leave = 5;
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            if (Months == 3)
            {
                int TotalDays = 31;
                Leave = Convert.ToDecimal(2.5);
                GivenBalance = Convert.ToDecimal(Convert.ToDecimal((2.5 / 30)) * (TotalDays - Days));
                GivenBalance = Leave - GivenBalance;
                DcmlNo = GivenBalance;
                DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                {
                    GivenBalance = Math.Round(GivenBalance);
                }
                return GivenBalance;
            }
            return 0;
        }

        public decimal GetLeaveBalanceMonthly(int lastday, int Days)
        {

            if (lastday == 28)
            {

                if (Days == 1 || Days == 2)
                {
                    GivenBalance = Convert.ToDecimal(2.5);
                    return GivenBalance;
                }
                if (Days == 3 || Days == 4 || Days == 5 || Days == 6 || Days == 7 || Days == 8)
                {
                    GivenBalance = Convert.ToDecimal(2);
                    return GivenBalance;
                }
                if (Days == 9 || Days == 10 || Days == 11 || Days == 12 || Days == 13 || Days == 14)
                {
                    GivenBalance = Convert.ToDecimal(1.5);
                    return GivenBalance;
                }
                if (Days == 15 || Days == 16 || Days == 17 || Days == 18 || Days == 19 || Days == 20)
                {
                    GivenBalance = Convert.ToDecimal(1);
                    return GivenBalance;
                }
                if (Days == 21 || Days == 22 || Days == 23 || Days == 24 || Days == 25 || Days == 26)
                {
                    GivenBalance = Convert.ToDecimal(.5);
                    return GivenBalance;
                }
                else
                {
                    GivenBalance = 0;
                    return GivenBalance;
                }
            }
            else if (lastday == 30)
            {
                if (Days == 1 || Days == 2 || Days == 3 || Days == 4)
                {
                    GivenBalance = Convert.ToDecimal(2.5);
                    return GivenBalance;
                }
                if (Days == 5 || Days == 6 || Days == 7 || Days == 8 || Days == 9 || Days == 10)
                {
                    GivenBalance = Convert.ToDecimal(2);
                    return GivenBalance;
                }
                if (Days == 11 || Days == 12 || Days == 13 || Days == 14 || Days == 15)
                {
                    GivenBalance = Convert.ToDecimal(1.5);
                    return GivenBalance;
                }
                if (Days == 16 || Days == 17 || Days == 18 || Days == 19 || Days == 20 || Days == 21 || Days == 22)
                {
                    GivenBalance = Convert.ToDecimal(1);
                    return GivenBalance;
                }
                if (Days == 23 || Days == 24 || Days == 25 || Days == 26 || Days == 27 || Days == 28)
                {
                    GivenBalance = Convert.ToDecimal(.5);
                    return GivenBalance;
                }
                else
                {
                    GivenBalance = 0;
                    return GivenBalance;
                }


            }
            else if (lastday == 31)
            {

                if (Days == 1 || Days == 2 || Days == 3 || Days == 4 || Days == 5)
                {
                    GivenBalance = Convert.ToDecimal(2.5);
                    return GivenBalance;
                }
                if (Days == 6 || Days == 7 || Days == 8 || Days == 9 || Days == 10 || Days == 11)
                {
                    GivenBalance = Convert.ToDecimal(2);
                    return GivenBalance;
                }
                if (Days == 12 || Days == 13 || Days == 14 || Days == 15 || Days == 16 || Days == 17)
                {
                    GivenBalance = Convert.ToDecimal(1.5);
                    return GivenBalance;
                }
                if (Days == 18 || Days == 19 || Days == 20 || Days == 21 || Days == 22 || Days == 23)
                {
                    GivenBalance = Convert.ToDecimal(1);
                    return GivenBalance;
                }
                if (Days == 24 || Days == 25 || Days == 26 || Days == 27 || Days == 28 || Days == 29)
                {
                    GivenBalance = Convert.ToDecimal(.5);
                    return GivenBalance;
                }
                else
                {
                    GivenBalance = 0;
                    return GivenBalance;
                }


            }
            return 0;
        }

        public decimal GetLeaveBalanceQuarterly(int Months, int Days)
        {
            decimal DcmlNo;
            decimal Leave;

           if (Months == 4 || Months == 8 || Months == 12)
                {
                    int TotalDays = 30;
                    Leave = 10;
                    GivenBalance = Convert.ToDecimal((2.5 / 30) * (TotalDays - Days));
                    GivenBalance = Leave - GivenBalance;
                    DcmlNo = GivenBalance;
                    DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                    if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                    {
                        GivenBalance = Math.Round(GivenBalance);
                    }
                    return GivenBalance;
                }

                if (Months == 5 || Months == 9 || Months == 1)
                {
                    int TotalDays = 30;
                    Leave = Convert.ToDecimal(7.5);
                    GivenBalance = Convert.ToDecimal((2.5 / 30) * (TotalDays - Days));
                    GivenBalance = Leave - GivenBalance;
                    DcmlNo = GivenBalance;
                    DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                    if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                    {
                        GivenBalance = Math.Round(GivenBalance);
                    }
                    return GivenBalance;
                }
                if (Months == 6 || Months == 10)
                {
                    int TotalDays = 30;
                    Leave = 5;
                    GivenBalance = Convert.ToDecimal((2.5 / 30) * (TotalDays - Days));
                    GivenBalance = Leave - GivenBalance;
                    DcmlNo = GivenBalance;
                    DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                    if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                    {
                        GivenBalance = Math.Round(GivenBalance);
                    }
                    return GivenBalance;
                }
                if (Months == 2 && DateTime.Now.DayOfYear % 2 == 0)
                {
                    int TotalDays = 29;
                    Leave = 5;
                    GivenBalance = Convert.ToDecimal((2.5 / 30) * (TotalDays - Days));
                    GivenBalance = Leave - GivenBalance;
                    DcmlNo = GivenBalance;
                    DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                    if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                    {
                        GivenBalance = Math.Round(GivenBalance);
                    }
                    return GivenBalance;
                }
                if (Months == 2 && DateTime.Now.DayOfYear % 2 != 0)
                {
                    int TotalDays = 28;
                    Leave = 5;
                    GivenBalance = Convert.ToDecimal((2.5 / 30) * (TotalDays - Days));
                    GivenBalance = Leave - GivenBalance;
                    DcmlNo = GivenBalance;
                    DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                    if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                    {
                        GivenBalance = Math.Round(GivenBalance);
                    }
                    return GivenBalance;
                }
                if (Months == 7 || Months == 11 || Months == 3)
                {
                    int TotalDays = 30;
                    Leave = Convert.ToDecimal(2.5);
                    GivenBalance = Convert.ToDecimal((2.5 / 30) * (TotalDays - Days));
                    GivenBalance = Leave - GivenBalance;
                    DcmlNo = GivenBalance;
                    DcmlNo = DcmlNo - Math.Truncate(DcmlNo);
                    if (DcmlNo > Convert.ToDecimal(.5) || DcmlNo < Convert.ToDecimal(.5))
                    {
                        GivenBalance = Math.Round(GivenBalance);
                    }
                    return GivenBalance;
                }
            return 0;
            }
       
    }
}