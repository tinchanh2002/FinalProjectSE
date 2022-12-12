using System.ComponentModel.DataAnnotations;

namespace CompanyFinal.Models
{
    public class Product
    {
        [Key]
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public int quantity { get; set; }
        public DateTime DateDelivery { get; set; }
        public DateTime DateReceived { get; set; }
        public int PriceDelivery { get; set; }
        public int PriceReceived { get; set; }
        public int price { get; set; }
    }
}
