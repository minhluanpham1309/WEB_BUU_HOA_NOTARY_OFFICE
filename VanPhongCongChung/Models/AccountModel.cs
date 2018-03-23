using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.Entities;
using System.Data.SqlClient;

namespace Models
{
    public class AccountModel
    {
        private NotaryOfficeDB context = null;
        public void Dispose()
        {
            if (context != null)
            {
                context.Dispose();
                context = null;
            }
        }
        public AccountModel()
        {
            context = new NotaryOfficeDB();
        }
        public bool Login(string UserName, string Passwords)
        {
            {
                object[] Sqlparams = new SqlParameter[]
                {
                    new SqlParameter("@UserName",UserName),
                    new SqlParameter("@Passwords",Passwords)
                };
                var res = context.Database.SqlQuery<bool>("SP_Account_Login @UserName, @PassWords", Sqlparams).SingleOrDefault();
                return res;
            }
        }
    }
}
