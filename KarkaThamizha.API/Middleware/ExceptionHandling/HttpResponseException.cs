namespace KarkaThamizha.API.Middleware.ExceptionHandling
{
    public class HttpResponseException
    {
        public int StatusCode { get; set; }
        public string Message { get; set; } = null!;
    }
}
