using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using RepositoryBase.Base;
using RepositoryBase.IRepository;
using ServiceContexClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryBase.Repository
{
    public class RegistrationRepository : DemoBase, IRegistrationRepository
    {
        private new readonly TestContext _context = new TestContext();

        public RegistrationRepository(TestContext context) : base(context)
        {
        }
        public async Task<List<TblUserRegistration>> GetData(int id)
        {
            try
            {
                string sql = "EXEC [sp_UserRegistration] @Mode,@Id";
                List<SqlParameter> parms = new List<SqlParameter>
                     {
                         new SqlParameter { ParameterName = "@Mode", Value = "Select" },
                         new SqlParameter { ParameterName = "@Id", Value = id}

                      };
                _context.Database.SetCommandTimeout(120);
                return  _context.TblUserRegistrations.FromSqlRaw(sql, parms.ToArray()).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<int> RegisterUser(TblUserRegistration modal)
        {
            try
            {
                string sql = "EXEC [sp_UserRegistration] @Mode,@Id,@Name,@Email,@phone,@Address,@StateId,@CityId";
                List<SqlParameter> parameter = new List<SqlParameter>
            {
                new SqlParameter("@Mode", "Insert"),
                new SqlParameter("@Id", modal.Id),
                new SqlParameter("@Name", !string.IsNullOrEmpty(modal.Name) ? modal.Name : DBNull.Value),
                new SqlParameter("@Email", !string.IsNullOrEmpty(modal.Email) ? modal.Email : DBNull.Value),
                new SqlParameter("@phone", !string.IsNullOrEmpty(modal.Phone) ? modal.Phone : DBNull.Value),
                new SqlParameter("@Address", !string.IsNullOrEmpty(modal.Address) ? modal.Address: DBNull.Value),
                new SqlParameter("@StateId",modal.StateId),
                new SqlParameter("@CityId",modal.CityId)
            };
                _context.Database.SetCommandTimeout(120);
                return await _context.Database.ExecuteSqlRawAsync(sql, parameter.ToArray());
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<int> UpdateReg(TblUserRegistration modal)
        {
            try
            {
                string sql = "EXEC [sp_UserRegistration] @Mode,@Id,@Name,@Email,@phone,@Address,@StateId,@CityId";
                List<SqlParameter> parameter = new List<SqlParameter>
            {
                new SqlParameter("@Mode", "Update"),
                new SqlParameter("@Id", modal.Id),
                new SqlParameter("@Name", !string.IsNullOrEmpty(modal.Name) ? modal.Name : DBNull.Value),
                new SqlParameter("@Email", !string.IsNullOrEmpty(modal.Email) ? modal.Email : DBNull.Value),
                new SqlParameter("@phone", !string.IsNullOrEmpty(modal.Phone) ? modal.Phone : DBNull.Value),
                new SqlParameter("@Address", !string.IsNullOrEmpty(modal.Address) ? modal.Address: DBNull.Value),
                new SqlParameter("@StateId",modal.StateId),
                new SqlParameter("@CityId",modal.CityId)
            };
                _context.Database.SetCommandTimeout(120);
                return await _context.Database.ExecuteSqlRawAsync(sql, parameter.ToArray());
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<int> DeleteReg(int id)
        {
            try
            {
                string sql = "EXEC [sp_UserRegistration] @Mode,@Id";
                List<SqlParameter> parms = new List<SqlParameter>
                     {
                         new SqlParameter { ParameterName = "@Mode", Value = "Delete" },
                         new SqlParameter { ParameterName = "@Id", Value = id}
                      };
                _context.Database.SetCommandTimeout(120);
                return await _context.Database.ExecuteSqlRawAsync(sql, parms.ToArray());
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<TblState>> Getstate(int id)
        {
            try
            {
                string sql = "EXEC [sp_State] @Mode,@Id";
                List<SqlParameter> parms = new List<SqlParameter>
                     {
                         new SqlParameter { ParameterName = "@Mode", Value = "Select" },
                         new SqlParameter { ParameterName = "@Id", Value = id}
                      };
                _context.Database.SetCommandTimeout(120);
                return _context.TblStates.FromSqlRaw(sql, parms.ToArray()).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<TblCity>> Getcity(int id)
        {
            try
            {
                string sql = "EXEC [sp_City] @Mode,@Id";
                List<SqlParameter> parms = new List<SqlParameter>
                     {
                         new SqlParameter { ParameterName = "@Mode", Value = "Select" },
                         new SqlParameter { ParameterName = "@Id", Value = id}
                      };
                _context.Database.SetCommandTimeout(120);
                return _context.TblCities.FromSqlRaw(sql, parms.ToArray()).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}