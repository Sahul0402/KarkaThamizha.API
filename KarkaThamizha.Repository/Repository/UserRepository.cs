using KarkaThamizha.DBEntities.Entities;
using KarkaThamizha.Interfaces.IRepository;

namespace KarkaThamizha.Repository.Repository
{
    public class UserRepository : IUserRepository
    {
        public int AddUser(Users mdlUser)
        {
            return 1;
        }

        public int DeleteUser(Users mdlUser)
        {
            return 1;
        }

        public IEnumerable<Users> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
