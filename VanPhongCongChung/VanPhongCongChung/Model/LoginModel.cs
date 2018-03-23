﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VanPhongCongChung.Model
{
    public class LoginModel
    {
        [Required]
        public string UserName { get; set; }
        public string Passwords { get; set; }
        public bool RememberMe { get; set; }
    }
}