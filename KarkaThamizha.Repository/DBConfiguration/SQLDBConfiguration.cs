using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KarkaThamizha.Repository.DBConfiguration
{
    public class SQLDBConfiguration
    {
        public const string ConfigurationSetting = "KarkaConfigSettings";
        public string DatabaseName { get; set; } = null!;
        public string ConnectionString { get; set; } = null!;
    }
}
