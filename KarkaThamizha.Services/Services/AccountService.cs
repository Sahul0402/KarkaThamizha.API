using KarkaThamizha.Interfaces.IRepository;
using KarkaThamizha.Interfaces.IService;
using KarkaThamizha.ViewModel.Models;

namespace KarkaThamizha.Services.Services
{
    public class AccountService: IAccountService
    {
        private readonly IAccountRepository _accountRepository;
        public AccountService(IAccountRepository accountRepository)
        {
            _accountRepository = accountRepository;
        }
        public async Task<int> LogIn(AccountModel mdlAccount)
        {
            var value = await _accountRepository.LogIn(mdlAccount);
            return value;
        }

        public void LogOut(AccountModel mdlAccount)
        {

        }

        public void ChangeUsernameAndPassword(AccountModel mdlAccount)
        { }
        
    }
}
