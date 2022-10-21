using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;

namespace KarkaThamizha.Repository.DBConfiguration
{
    public static class ConnectionSettings
    {
        public static IServiceCollection AddDBConnections(this IServiceCollection service, ConfigurationManager configuration)
        {
            
            //service.Configure<SQLDBConfiguration>(configuration.GetSection(SQLDBConfiguration.ConfigurationSetting));
            return service;
        }
    }
}
