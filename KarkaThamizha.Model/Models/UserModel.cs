using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace KarkaThamizha.ViewModel.Models
{
    public class UserModel
    {
        public int UserID { get; set; }
        public string Initial { get; set; } = null!;
        public string UserName { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string MailID { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string Mobile { get; set; } = null!;
        public string ProfessionID { get; set; } = null!;
        public string UserTypeID { get; set; } = null!;
        public string SpecialNameID { get; set; } = null!;
        public string LastActivity { get; set; } = null!;
        public string CreatedDate { get; set; } = null!;
        public string ModifiedDate { get; set; } = null!;
        public string RecStatus { get; set; } = null!;   
    }
}
