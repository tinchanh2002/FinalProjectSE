using CompanyFinal.Data;
using CompanyFinal.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace CompanyFinal.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AppDbContext _context;

        public HomeController(ILogger<HomeController> logger, AppDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()  
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Product()
        {
            var products = _context.Product.OrderByDescending(x=>x.ProductId).ToList();
            return View(products);
        }
        [HttpPost]
        public async Task<IActionResult> Order(string productId, int amount,string paymethod)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return Ok(
                    new APIResponse<object>(){
                        StatusCode = 403,
                        Message = "You must be logged in to order",
                        Data =null
                    }
                );
            }
            var userLogin = User.Claims.ToList();
            int userId = Convert.ToInt32(userLogin[0].Value);
            object result = new { };



            if(string.IsNullOrEmpty(productId) || amount==null)
            {
                return Ok(
                    new APIResponse<object>(){
                        StatusCode = 404,
                        Message = "Please provide productId and amount",
                         Data =null
                    }
                );
            }
            var product = await _context.Product.FirstOrDefaultAsync(x => x.ProductId == productId);
            if(product==null)
            {
                return Ok(
                    new APIResponse<object>(){
                        StatusCode = 201,
                        Message = "Product not found",
                        Data =null
                    }
                );
            }
            if(product.quantity<amount)
            {
                return Ok(
                    new APIResponse<object>(){
                        StatusCode = 201,
                        Message = "Product quantity is not enough",
                        Data =null
                    }
                );
            }
            // check exist order
            var order = _context.Order.FirstOrDefault(x => x.ProductId == productId && x.UserId ==userId && x.Status=="Wait");
            if (order != null)
            {
                // update order
                order.Amount += amount;
                order.Profit =order.Amount +((amount*product.PriceDelivery) -(amount*product.PriceDelivery));
                _context.Order.Update(order);
                product.quantity -= amount;
                _context.Product.Update(product);
                if(await _context.SaveChangesAsync() > 0)
                {
                    return Ok(
                        new APIResponse<object>(){
                            StatusCode = 200,
                            Message = "Do order đã tồn tại nên đã cập nhật số lượng lên "+amount,
                            Data =null
                        }
                    );
                }
            }
            product.quantity -= amount;
            _context.Entry(product).State = EntityState.Modified;
            // add order
            var orderNew = new Order
            {
                ProductId = productId,
                ProductName = product.ProductName,
                DateDelivery = product.DateDelivery,
                DateReceived  = product.DateReceived,
                paymethod = paymethod,
                PriceDelivery = product.PriceDelivery,
                PriceReceived = product.PriceReceived,
                Amount = amount,
                Profit = (amount*product.PriceDelivery)-(amount*product.PriceReceived),
                Status = "Wait",
                UserId = userId

            };
             await _context.Order.AddAsync(orderNew);
            if(await _context.SaveChangesAsync()>0)
            {
                return Ok(
                    new APIResponse<object>(){
                        StatusCode = 200,
                        Message = "Order success",
                        Data = null
                    }
                );
            }
            return Ok(
                new APIResponse<object>(){
                    StatusCode = 203,
                    Message = "Order failed",
                    Data = null
                }
            );

        }
    }
}