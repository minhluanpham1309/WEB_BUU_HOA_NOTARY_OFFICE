using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Entities;
using System.Data.SqlClient;

namespace VanPhongCongChung.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AdminAccount()
        {
            NotaryOfficeDB db = new NotaryOfficeDB();
            List<Account> accounts = db.Accounts.ToList();
            List<Account> showAccount = accounts.Select(x => new Account
            {
                ID_Account = x.ID_Account,
                UserName = x.UserName,
                Passwords = x.Passwords,
                ID_Account_Type = x.ID_Account_Type,
                Note = x.Note,
                AccountID = x.AccountID,
                Create_Account = x.Create_Account,
                Update_Account = x.Update_Account,
                Is_Delete = x.Is_Delete,
                Is_Not_Delete = x.Is_Not_Delete,
                Folder_Path = x.Folder_Path
            }).ToList();
            return View(showAccount);
        }
        
    }
}