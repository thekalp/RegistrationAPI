using RepositoryBase.IRepository;
using ServiceBase.IServices;
using ServiceContexClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceBase.Services
{
    //Can Write any logic or method/condition to get data is here 
    public class RegistractionService : IRegistrationService
    {
        private readonly IRegistrationRepository _RegistrationRepository;
        public RegistractionService(IRegistrationRepository RegistrationRepository)
        {
            _RegistrationRepository = RegistrationRepository;
        }
        public async Task<List<TblUserRegistration>> GetAllData(int id)
        {
            return await _RegistrationRepository.GetData(id);
        }
        public async Task<int> Register(TblUserRegistration modal)
        {
            return await _RegistrationRepository.RegisterUser(modal);
        }
        public async Task<int> UpdateReg(TblUserRegistration modal)
        {
            return await _RegistrationRepository.UpdateReg(modal);
        }
        public async Task<int> DeleteReg(int id)
        {
            return await _RegistrationRepository.DeleteReg(id); ;
        }
        public async Task<List<TblState>> Getstate(int id)
        {
            return await _RegistrationRepository.Getstate(id);
        }
        public async Task<List<TblCity>> Getcity(int id)
        {
            return await _RegistrationRepository.Getcity(id);
        }
    }
}
