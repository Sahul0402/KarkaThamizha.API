using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KarkaThamizha.Middleware.ExceptionHandlerMiddleware
{
    public class HttpResponseException
    {
        public int StatusCode { get; set; }
        public string Message { get; set; } = null!;
    }
}
