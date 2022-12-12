using System.ComponentModel.DataAnnotations;

namespace CompanyFinal.Models
{
    public class Order
    {

        [Key]
        public int Id { get; set; }
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public string Status { get; set; }
        public string paymethod { get; set; }
        public DateTime DateReceived { get; set; }
        public DateTime DateDelivery { get; set; }
        public int PriceDelivery { get; set; }
        public int PriceReceived { get; set; }
        public int Profit { get; set; }
        public int UserId { get; set; }
        public int Amount { get; set; }

        public  User User { get; set; }
    }
}
