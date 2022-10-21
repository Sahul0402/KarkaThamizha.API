using KarkaThamizha.ViewModel.Models;

namespace KarkaThamizha.Interfaces.IRepository
{
    public interface IUserDetailsRepository
    {
        int AddUserDetails(UserDetailsModel mdlUser);
    }
}
