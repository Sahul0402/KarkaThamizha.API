using KarkaThamizha.DBEntities.Entities;

namespace KarkaThamizha.Interfaces.IRepository
{
    public interface IUserRepository
    {
        public IEnumerable<Users> GetAll();
        public int AddUser(Users mdlUser);
        public int DeleteUser(Users mdlUser);
    }
}
