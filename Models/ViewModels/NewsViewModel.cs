﻿using System.Collections.Generic;
using Lab5.Models;

namespace Lab5.ViewModels
{
    public class NewsViewModel
    {
        public IEnumerable<Fan> Fans { get; set; }
        public IEnumerable<SportClub> SportClubs { get; set; }
        public IEnumerable<Subscription> Subscriptions { get; set; }
    }
}
