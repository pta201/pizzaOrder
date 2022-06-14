﻿using System;
using System.Collections.Generic;

namespace BackendAPI.Models
{
    public partial class Drink
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public decimal? Price { get; set; }
        public string? Image { get; set; }
    }
}
