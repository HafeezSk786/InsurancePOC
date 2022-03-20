using InsuranceService.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceService.Controllers
{
    [EnableCors("AllowOrigin")]
    [Route("api/[controller]")]
    [ApiController]
    public class InsuranceController : ControllerBase
    {

        private readonly ILogger<InsuranceController> _logger;

        public InsuranceController(ILogger<InsuranceController> logger)
        {
            _logger = logger;
        }

        [Route("GetEmp")]
        [HttpGet]
        public async Task<string> GetEmployees()
        {
            try
            {
                return "testing";
            }
            catch (Exception)
            {
                return "error";
            }
        }

        [Route("Calculate")]
        [HttpPost]
        public async Task<ActionResult<Employee>> CreateEmployee(IFormCollection collection)
        {
            int _deathCoverAmt = 0;
            int _age = 0;
            decimal _premium = 0;
            Employee emp = new Employee();
            try
            {
                if(collection.Keys.Count>0)
                {
                    _deathCoverAmt = Convert.ToInt32(collection["suminsured"]);
                    _age = Convert.ToInt32(collection["age"]);

                    using (var _context = new InsuranceContext())
                    {
                        var _rating = _context.Occupation.Single(p => p.Occupation1 == collection["occupation"].ToString()).Rating;

                        var _ratingFactor = _context.OccupationRating.Single(p => p.Rating == _rating).Factor;

                        _premium = CalculateFormula(_deathCoverAmt, _ratingFactor, _age);

                        if (_premium > 0)
                        {
                            emp.Name = collection["name"].ToString();
                            emp.Age = _age;
                            emp.Dob = collection["dob"].ToString();
                            emp.Occupation = collection["occupation"].ToString();
                            emp.DeathSumInsured = _deathCoverAmt;
                            emp.InsurancePremiumAmount = _premium;
                            _context.Add(emp);
                            _context.SaveChanges();
                        }
                        return emp;
                    }                
                }
                else
                {
                    return Content("Form Collection is null");
                }
                
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error creating new employee record");
            }
        }

        private decimal CalculateFormula(int _deathCoverAmt, decimal _OccRatingFactor, int _age)
        {
            return (_deathCoverAmt * _OccRatingFactor * _age) / 1000 * 12;
        }
    }
}
