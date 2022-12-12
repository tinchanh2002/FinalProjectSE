using CompanyFinal.Ulitilies;
using System.ComponentModel.DataAnnotations;

namespace CompanyFinal.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public UserRole Role { get; set; }

        public virtual List<Order>? Orders { get; set; }
    }
}
