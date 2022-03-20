using System;
using System.Collections.Generic;

namespace InsuranceService.Models
{
    public partial class Occupation
    {
        public Occupation()
        {
            Employee = new HashSet<Employee>();
        }

        public string Occupation1 { get; set; }
        public string Rating { get; set; }

        public virtual OccupationRating RatingNavigation { get; set; }
        public virtual ICollection<Employee> Employee { get; set; }
    }
}
