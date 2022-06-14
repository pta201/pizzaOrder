using System;
using System.Collections.Generic;

namespace BackendAPI.Models
{
    public partial class Pizza
    {
        public Pizza()
        {
            OrderPizzas = new HashSet<OrderPizza>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        public int? SizeId { get; set; }

        public virtual Size? Size { get; set; }
        public virtual ICollection<OrderPizza> OrderPizzas { get; set; }
    }
}
