using KarkaThamizha.API.BaseController;
using KarkaThamizha.Interfaces.IService;
using KarkaThamizha.ViewModel.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace KarkaThamizha.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : BaseAPIController
    {
        private readonly IAccountService _accountService;
        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [AllowAnonymous]
        [HttpPost("LogIn")]
        public async Task<IActionResult> LogIn(AccountModel mdlAccount)
        {
            var response = await _accountService.LogIn(mdlAccount);
            return Ok(response);
        }

        [Authorize]
        [HttpPost("LogOut")]
        public void LogOut()
        {

        }

        [Authorize]
        [HttpPatch()]
        public ActionResult ChangeUsernameAndPassword(AccountModel mdlAccount)
        {
            ActionResult ret;

            //var token = GetToken();
            //bool ok = svc.ChangeUsernameAndPassword(token, mdlAccount);
            //ret = ok ? Ok() : BadRequest($"Username {mdlAccount.Username} already exists.");
            ret = null;
            return ret;
        }
    }
}
