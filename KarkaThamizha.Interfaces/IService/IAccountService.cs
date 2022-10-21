using KarkaThamizha.ViewModel.Models;

namespace KarkaThamizha.Interfaces.IService
{
    public interface IAccountService
    {
        Task<int> LogIn(AccountModel mdlAccount);
        void LogOut(AccountModel mdlAccount);
        void ChangeUsernameAndPassword(AccountModel mdlAccount);        
    }
}
