﻿using System;
using System.Collections.Generic;

namespace BackendAPI.Models
{
    public partial class OrderDrink
    {
        public int? OrderId { get; set; }
        public int? DrinkId { get; set; }
        public int? Quantity { get; set; }
    }
}
