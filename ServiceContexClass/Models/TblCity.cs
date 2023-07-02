using System;
using System.Collections.Generic;

#nullable disable

namespace ServiceContexClass.Models
{
    public partial class TblCity
    {
        public int Id { get; set; }
        public int? StateId { get; set; }
        public string CityName { get; set; }
    }
}
