using KarkaThamizha.ViewModel.Models;

namespace KarkaThamizha.Interfaces.IRepository
{
    public interface IAccountRepository
    {
        
        void LogOut(AccountModel mdlAccount);
        void ChangeUsernameAndPassword(AccountModel mdlAccount);
        Task<int> LogIn(AccountModel mdlAccount);
    }
}
