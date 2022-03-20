using System;
using System.Collections.Generic;

namespace InsuranceService.Models
{
    public partial class Employee
    {
        public int Eid { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Dob { get; set; }
        public string Occupation { get; set; }
        public int DeathSumInsured { get; set; }
        public decimal InsurancePremiumAmount { get; set; }

        public virtual Occupation OccupationNavigation { get; set; }
    }
}
