using System;
using System.Collections.Generic;

namespace BackendAPI.Models
{
    public partial class Size
    {
        public Size()
        {
            Pizzas = new HashSet<Pizza>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public decimal? Price { get; set; }

        public virtual ICollection<Pizza> Pizzas { get; set; }
    }
}
