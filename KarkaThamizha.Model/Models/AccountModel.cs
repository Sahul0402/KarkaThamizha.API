using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KarkaThamizha.ViewModel.Models
{
    public class AccountModel
    {
        public string UserName { get; set; } = null!;
        [Required]
        public string Email { get; set; } = null!;
        [PasswordPropertyText]
        [Required]
        public string Password { get; set; } = null!;
        [PasswordPropertyText]
        [Required]
        public string ConfirmPassword { get; set; } = null!;
    }
}
