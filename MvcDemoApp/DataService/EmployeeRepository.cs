using System;
using System.Linq;

namespace MvcDemoApp.DataService
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private readonly EmployeeEntities employeeEntities = new EmployeeEntities();

        #region IEmployeeRepository Members

        public IQueryable<Employee> GetAllEmployees()
        {
            return employeeEntities.Employees;
        }

        public Employee GetEmployee(string ssn)
        {
            
            return employeeEntities.Employees.Where(x => x.Ssn == ssn).FirstOrDefault();
        }

        public void Add(Employee employee)
        {
            employeeEntities.AddObject("Employees", employee);
        }

        public void Delete(Employee employee)
        {
            employeeEntities.DeleteObject(employee);
           
        }

        public void Save()
        {
            try
            {
               
                employeeEntities.SaveChanges();
            }
            catch (Exception ex)
            {
                //log any error to log file
            }
        }

        #endregion
    }
}