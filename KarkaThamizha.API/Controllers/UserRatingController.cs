using KarkaThamizha.API.BaseController;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace KarkaThamizha.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserRatingController : BaseAPIController
    {
        public UserRatingController()
        {

        }

        public IActionResult GetRatingByBookID(int bookId)
        {
            return Ok();
        }

        public IActionResult GetRatingByAuthor(int authorId)
        {
            return Ok();
        }

        public IActionResult GetRatingByPublisher(int authorId)
        {
            return Ok();
        }
    }
}
