using System;
using System.Collections.Generic;

namespace BackendAPI.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderPizzas = new HashSet<OrderPizza>();
        }

        public int Id { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerAddress { get; set; }
        public string? CustomerPhone { get; set; }
        public decimal? TotalPrice { get; set; }

        public virtual ICollection<OrderPizza> OrderPizzas { get; set; }
    }
}
