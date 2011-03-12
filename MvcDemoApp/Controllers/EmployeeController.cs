using System;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using MvcDemoApp.DataService;
using MvcDemoApp.Models;

namespace MvcDemoApp.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly IEmployeeRepository _repository;

        public EmployeeController() : this(new EmployeeRepository())
        {
        }

        public EmployeeController(IEmployeeRepository employeeRepository)
        {
            _repository = employeeRepository;

            //Automapper configuration to map domain entity to viewmodel entity
            Mapper.CreateMap<Employee, EmployeeViewModel>();
            //Conversion function to convert string type to char. Middle Initial and Sex are defined as string in domain
            // and they are character type in view model
            Mapper.CreateMap<string, char>().ConvertUsing(x => x != null ? Convert.ToChar(x) : ' ');
            //Automaper configuration to map viewmodel entity to domain entity
            
            //Automapper configuration to map viewmodel back to entity
            Mapper.CreateMap<EmployeeViewModel, Employee>();
            Mapper.CreateMap<char, string>().ConvertUsing(x => x!= null?Convert.ToString(x):null);

        }

        public ViewResult Index()
        {
            return View("ListEmployee", null);
        }

     


        public JsonResult GetEmployeeList()
        {
            var employeeList = _repository.GetAllEmployees();

            //Sleep to simulate some delay on server side in procuring data
            System.Threading.Thread.Sleep(1000);

            return Json(employeeList);
        }



        /// <summary>
        /// Action method gets called when user clicks on Edit Employee link on 
        /// List Employee view
        /// </summary>
        /// <param name="essn"></param>
        /// <returns></returns>
        [HttpGet]
        public ViewResult EditEmployee(string essn)
        {
            //Get employee entity  with given ssn from the repository
            Employee employee = _repository.GetEmployee(essn);
            //Map domain entity with EmployeeViewModel
            EmployeeViewModel employeeViewModel = Mapper.Map<Employee, EmployeeViewModel>(employee);

            employeeViewModel.EditMode = true;
            return View("EditEmployee", employeeViewModel);
        }


        /// <summary>
        /// This action method gets called when user clicks on 
        /// save button after editing employee data on the form
        /// </summary>
        /// <param name="employeeViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult EditEmployee(EmployeeViewModel employeeViewModel)
        {
            if (employeeViewModel == null)
                return View("Error");

            if (!ModelState.IsValid)
            {
                employeeViewModel.EditMode = true;
                return View("EditEmployee", employeeViewModel);
            }
            else
            {
                var employee = _repository.GetEmployee(employeeViewModel.Ssn);

                if (employee != null)
                {
                    employee.Fname = employeeViewModel.Fname;
                    employee.Lname = employeeViewModel.Lname;
                    employee.Minit = employeeViewModel.Minit.ToString();
                    employee.Bdate = employeeViewModel.Bdate;
                    employee.Dno = employeeViewModel.Dno;
                    employee.Salary = employeeViewModel.Salary;
                    employee.Sex = employeeViewModel.Sex.ToString();

                    employee.Super_ssn = employeeViewModel.Super_ssn;
                    employee.Address = employeeViewModel.Address;

                    //Map ViewModel object to domain object
                    //employee = Mapper.Map<EmployeeViewModel, Employee>(employeeViewModel);



                    employee.Salary = 20000;
                }



                _repository.Save();
            }


            return RedirectToAction("Index");
        }



        /// <summary>
        /// This action method gets called when user clicks on Add Employee LInk on
        /// ListEmployee View
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ViewResult AddEmployee()
        {
            var employee = new EmployeeViewModel();
            return View("AddEmployee", employee);
        }

        /// <summary>
        /// This action method is called when user clicks on save button after entering
        /// data on form for a new employee to be added
        /// </summary>
        /// <param name="employeeViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddEmployee(EmployeeViewModel employeeViewModel)
        {
            if (employeeViewModel == null)
                return View("Error");
            if (!ModelState.IsValid)
            {
                return View("AddEmployee", employeeViewModel);
            }

            Employee employee = Mapper.Map<EmployeeViewModel, Employee>(employeeViewModel);
            _repository.Add(employee);
            _repository.Save();
            return RedirectToAction("Index");
        }



        public ActionResult DeleteEmployee(string essn)
        {


            var employee = _repository.GetEmployee(essn);
            _repository.Delete(employee);
            _repository.Save();
            return RedirectToAction("Index");
        }
    }
}