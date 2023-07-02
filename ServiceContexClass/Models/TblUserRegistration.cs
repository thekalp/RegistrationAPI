using System;
using System.Collections.Generic;

#nullable disable

namespace ServiceContexClass.Models
{
    public partial class TblUserRegistration
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public int? StateId { get; set; }
        public int? CityId { get; set; }
    }
}
