using KarkaThamizha.Interfaces.IRepository;
using KarkaThamizha.Interfaces.SQLObjects;
using KarkaThamizha.Repository.DBConfiguration;
using KarkaThamizha.ViewModel.Models;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace KarkaThamizha.Repository.Repository
{
    public class AccountRepository : IAccountRepository
    {
        //IConnectionFactory _connectionFactory;
        private IConfiguration _configuration;

        public AccountRepository(
            //IConnectionFactory connectionFactory,
            IConfiguration configuration)
        {
            //_connectionFactory = connectionFactory;
            _configuration = configuration;
        }

        public Task<int> LogIn(AccountModel mdlAccount)
        {
            int result;
            //using (SqlConnection con = _connectionFactory.GetSQLConnection)
            using (SqlConnection con = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                using (SqlCommand cmd = new SqlCommand(SQLObjects.SQLObjects.CheckUserExists, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", mdlAccount.UserName.Trim().ToLower());
                    cmd.Parameters.AddWithValue("@Password", mdlAccount.Password.Trim());

                    cmd.Parameters.Add("@Result", SqlDbType.Int);
                    cmd.Parameters["@Result"].Direction = ParameterDirection.Output;
                    try
                    {
                        con.Open();
                        result = cmd.ExecuteNonQuery();
                        //userId = DataConversion.Convert2Int32(cmd.Parameters["@Result"].Value.ToString());                        
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }

                }
            }
            return Task.FromResult(result);
        }

        public void LogOut(AccountModel mdlAccount)
        {

        }

        public void ChangeUsernameAndPassword(AccountModel mdlAccount)
        { }
    }
}
