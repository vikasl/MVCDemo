using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MvcDemoApp.DataService;

namespace MvcDemoApp.Tests
{
    class TestRepository:IEmployeeRepository

    {
        private List<Employee> employeeList ;

        public TestRepository()
        {
            InitializeEmployeeList();
        }

        private void InitializeEmployeeList()
        {
            employeeList = new List<Employee>
                       {
                           new Employee
                               {
                                   Fname = "John",
                                   Lname = "Doe",
                                   Address = "1234 Street, #B234, Cleveland Oh",
                                   Bdate = new DateTime(1980, 1, 1),
                                   Minit = "S",
                                   Salary = 60000,
                                   Ssn = "123-321-1234"
                               },
                           new Employee
                               {
                                   Fname = "Sally",
                                   Lname = "Fisher",
                                   Minit = "A",
                                   Address = "123 Street, 45 Mayfield Heights, Oh",
                                   Bdate = new DateTime(1982, 2, 2),
                                   Salary = 78000,
                                   Ssn = "123-03-0989"
                               }
                       };

        }

        public IQueryable<Employee> GetAllEmployees()
        {
            return employeeList.AsQueryable();
        }

        public Employee GetEmployee(string ssn)
        {
            return GetAllEmployees().Where(x => x.Ssn == ssn).FirstOrDefault();
        }

        public void Add(Employee employee)
        {
            employeeList.Add(employee);
        }

        public void Delete(Employee employee)
        {
            employeeList.Remove(employee);
        }

        public void Save()
        {
            //do nothing
        }
    }
}
