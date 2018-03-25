﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VanPhongCongChung.Controllers;

namespace VanPhongCongChung
{
    public class SessionHelper
    {
        public static void SetSession(UserSession session)
        {
            HttpContext.Current.Session["LoginSession"] = session;
        }
        public static UserSession GetSession()
        {
            var session = HttpContext.Current.Session["LoginSession"];
            if (session == null)
                return null;
            else
            {
                return session as UserSession;
            }
        }
    }
}