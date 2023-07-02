using ServiceContexClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceBase.IServices
{
    public interface IRegistrationService
    {
        Task<List<TblUserRegistration>> GetAllData(int id);
        Task<int> Register(TblUserRegistration modal);
        Task<int> UpdateReg(TblUserRegistration modal);
        Task<int> DeleteReg(int id);
        Task<List<TblState>> Getstate(int id);
        Task<List<TblCity>> Getcity(int id);
    }
}
