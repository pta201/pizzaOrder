using System;
using System.Collections.Generic;

namespace BackendAPI.Models
{
    public partial class OrderPizza
    {
        public int Id { get; set; }
        public int? OrderId { get; set; }
        public int? PizzaId { get; set; }
        public int? Quantity { get; set; }

        public virtual Order? Order { get; set; }
        public virtual Pizza? Pizza { get; set; }
    }
}
