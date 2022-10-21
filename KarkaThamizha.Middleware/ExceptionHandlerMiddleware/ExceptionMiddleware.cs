using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace KarkaThamizha.Middleware.ExceptionHandlerMiddleware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionMiddleware> _logger;
        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger)
        {
            _logger = logger;
            _next = next;
        }
        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Something went wrong: {ex}");
                await HandleExceptionAsync(httpContext, ex);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var response = new HttpResponseException
            {
                StatusCode = (int)HttpStatusCode.InternalServerError,
                Message = exception.Message
            };

            switch (exception)
            {
                case ApplicationException ex:
                    // custom application error
                    response.StatusCode = (int)HttpStatusCode.BadRequest;
                    response.Message = ex.Message;
                    break;
                case KeyNotFoundException ex:
                    // not found error
                    response.StatusCode = (int)HttpStatusCode.NotFound;
                    response.Message = ex.Message;
                    break;
                case UnauthorizedAccessException ex:
                    // Unauthorized Access error
                    response.StatusCode = (int)HttpStatusCode.Unauthorized;
                    response.Message = ex.Message;
                    break;
                default:
                    // unhandled error
                    response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    response.Message = exception.InnerException?.ToString() ?? exception.Message.ToString();
                    break;
            }

            var result = JsonSerializer.Serialize(response);
            await context.Response.WriteAsync(result);
        }
    }
}
    