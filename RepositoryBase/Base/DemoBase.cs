using ServiceContexClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryBase.Base
{
    public class DemoBase
    {
        protected readonly TestContext _context;

        public DemoBase()
        {
        }
        public DemoBase(TestContext context)
        {
            _context = context;
        }
    }
}
