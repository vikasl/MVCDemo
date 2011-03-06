using System.Linq;

namespace MvcDemoApp.DataService
{
    public interface IEmployeeRepository
    {
        IQueryable<Employee> GetAllEmployees();
       
        Employee GetEmployee(string ssn);     
        void Add(Employee employee);     
        void Delete(Employee dinner);     
        void Save();
    }
}