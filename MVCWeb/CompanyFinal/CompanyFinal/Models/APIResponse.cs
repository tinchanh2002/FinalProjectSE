namespace CompanyFinal.Models
{
    public class APIResponse<T>
    {
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public List<T> Data { get; set; }
    }
}
