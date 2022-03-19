using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiAssignment2.Models;

namespace WebApiAssignment2.Controllers
{
    public class EmployeeController : ApiController
    {
        ZensarDBEntities1 zdb = new ZensarDBEntities1();
        public IHttpActionResult GetEmployeeSalById(int eid)
        {
            var details = zdb.getEmpsalary(eid).ToList();
            return Ok(details);
        }
    }
}
