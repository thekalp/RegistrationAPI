using Microsoft.AspNetCore.Mvc;
using ServiceBase.IServices;
using ServiceContexClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RegistrationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegistrationController : Controller
    {
        private readonly IRegistrationService _Registration;
        public RegistrationController(IRegistrationService Registration)
        {
            _Registration = Registration;
        }
        [HttpGet]
        [Route("GetAllData")]
        public async Task<ActionResult> GetRegData(int id)
        {
            var client = await _Registration.GetAllData(id);
            return Ok(client);
        }
        [HttpPost]
        [Route("NewRegistraction")]
        public async Task<ActionResult<bool>> Add([FromBody] TblUserRegistration modal)
        {
            var result = await _Registration.Register(modal);
            return Ok(result);
        }
        [HttpPut]
        [Route("UpdateRegistraction")]
        public async Task<ActionResult<bool>> Update([FromBody] TblUserRegistration modal)
        {
            var result = await _Registration.UpdateReg(modal);
            return Ok(result);
        }
        [HttpDelete]
        [Route("DeleteRegistraction")]
        public async Task<ActionResult<string>> Delete(int id)
        {
            var result = await _Registration.DeleteReg(id);
            return Ok(new JsonResult(result));
        }
        [HttpGet]
        [Route("GetAllState")]
        public async Task<ActionResult> Getstate(int id)
        {
            var client = await _Registration.Getstate(id);
            return Ok(client);
        }
        [HttpGet]
        [Route("GetAllCity")]
        public async Task<ActionResult> Getcity(int id)
        {
            var client = await _Registration.Getcity(id);
            return Ok(client);
        }
    }
}
