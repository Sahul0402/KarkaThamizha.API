using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KarkaThamizha.ViewModel.Models
{
    public class UserRatingModel
    {
        public int RatingId { get; set; }
        public int UserId { get; set; }
        public int BookId { get; set; }
        public int RatingValue { get; set; }
    }
}
