using System;
using System.Collections.Generic;

namespace InsuranceService.Models
{
    public partial class OccupationRating
    {
        public OccupationRating()
        {
            Occupation = new HashSet<Occupation>();
        }

        public string Rating { get; set; }
        public decimal Factor { get; set; }

        public virtual ICollection<Occupation> Occupation { get; set; }
    }
}
