using KarkaThamizha.Interfaces.SQLObjects;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KarkaThamizha.Repository.SQLObjects
{
    public class ConnectionFactory: IConnectionFactory
    {
        //private readonly string karkaConnectionString = ConfigurationManager.ConnectionStrings["ConnectionKARKA2021"].ConnectionString;
        //private SqlConnection? _sqlConnection;

        //public SqlConnection GetSQLConnection
        //{
        //    get
        //    {
        //        _sqlConnection = new SqlConnection(karkaConnectionString);
        //        return _sqlConnection;
        //    }
        //}        
    }
}
