﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Configs
{
    public const string CONNECTION_STRING = @"Server=CHIPHONG\SQLEXPRESS_2012;Database=Service_Login;Trusted_Connection=True;";

    public const string MAIL_SENDER_NAME = "Drink Smile - Administrator";

    public const string MAIL_SENDER = "chungtu3108@gmail.com";

    public const string MAIL_SENDER_PASSWORD = "qwer1234";

    public const string CHANGE_FORGOT_PASS_URL = "http://localhost:8082/Account/ResetPassword?token={0}";

    public const string SYNC_TO_MANAGEMENT_SERVICE = "http://localhost:8080/Service_Management/webresources/NhanVien/syncfuheigenhiegheukjenf";

    public const string TOKEN_PASSWORD = "&YH*hf4JEUFHKEKLRJH93#$i";
}
