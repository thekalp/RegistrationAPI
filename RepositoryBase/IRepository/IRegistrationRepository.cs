using ServiceContexClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryBase.IRepository
{
    public interface IRegistrationRepository
    {
        Task<List<TblUserRegistration>> GetData(int id);
        Task<int> RegisterUser(TblUserRegistration modal);
        Task<int> UpdateReg(TblUserRegistration modal);
        Task<int> DeleteReg(int id);
        Task<List<TblState>> Getstate(int id);
        Task<List<TblCity>> Getcity(int id);
    }
}
