using System;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoPoco;
using AutoPoco.DataSources;
using AutoPoco.Engine;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using MvcDemoApp.Controllers;
using MvcDemoApp.DataService;
using MvcDemoApp.Models;

namespace MvcDemoApp.Tests.Controllers
{
    [TestClass]
    public class EmploeeControllerTest
    {
        private IGenerationSessionFactory _generationSessionFactory;



        [TestInitialize]
        public void Setup()
        {

        }




        [TestMethod]
        public void IndexAction_Should_Return_View_For_ListEmployee()
        {
            var testRepository = new TestRepository();
            var employeeController = new EmployeeController(testRepository);
            var result = employeeController.Index();
            Assert.IsNotNull(result);
            Assert.AreEqual("ListEmployee", result.ViewName);
        }


        [TestMethod]
        public void GetEmployeeList_Should_Return_List_Of_Employee()
        {
            var testRepository = new TestRepository();
            var employeeController = new EmployeeController(testRepository);
            var result = employeeController.GetEmployeeList();
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Data);
            Assert.IsInstanceOfType(result.Data, typeof(IQueryable<Employee>));
            Assert.AreEqual(((IQueryable<Employee>)(result.Data)).Count( ), 2);
            Assert.AreEqual(((IQueryable<Employee>)(result.Data)).First().Fname, "John");
        }



        [TestMethod]
        public void EditEmployee_Should_Return_EditEmployee_View_With_Populated_View_Models()
        {
            var testRepository = new TestRepository();
            var employeeController = new EmployeeController(testRepository);
            var result = employeeController.EditEmployee("123-321-1234");
            Assert.IsNotNull(result);   
            Assert.IsInstanceOfType(result.ViewData.Model,typeof(EmployeeViewModel) );
            Assert.AreEqual(((EmployeeViewModel)result.ViewData.Model).Fname, "John");
            Assert.AreEqual(((EmployeeViewModel)result.ViewData.Model).Lname, "Doe");

        }

        [TestMethod]
        public void EditEmployee_Post_Should_Return_EditEmployee_View_With_Required_Data_Missing()
        {

            var employee = new EmployeeViewModel {Fname = "Ray", Lname = "Romano"/*, Ssn = "123-09-3214"*/};
            var validationContext = new ValidationContext(employee, null, null);
            var testRepository = new TestRepository();
 
            var employeeController = new EmployeeController(testRepository);

            var validationResults = new List<ValidationResult>();
            Validator.TryValidateObject(employee, validationContext, validationResults);
            foreach (var validationResult in validationResults)
            {
                employeeController.ModelState.AddModelError(validationResult.MemberNames.First(), validationResult.ErrorMessage);
            }

            var result = employeeController.EditEmployee(employee);

            Assert.IsNotNull(result);

            Assert.AreEqual( "EditEmployee", ((ViewResult)result).ViewName  );
        }


        [TestMethod]
        public void EditEmployee_Post_Should_Return_EditEmployee_View_When_Invalid_Ssn()
        {
            var employee = new EmployeeViewModel { Fname = "Ray", Lname = "Romano", Ssn = "ABC-09"};
            var validationContext = new ValidationContext(employee, null, null);
            var testRepository = new TestRepository();

            var employeeController = new EmployeeController(testRepository);

            var validationResults = new List<ValidationResult>();
            Validator.TryValidateObject(employee, validationContext, validationResults,true);
            foreach (var validationResult in validationResults)
            {
                employeeController.ModelState.AddModelError(validationResult.MemberNames.First(), validationResult.ErrorMessage);
            }

            var result = employeeController.EditEmployee(employee);

            Assert.IsNotNull(result);

            Assert.AreEqual("EditEmployee", ((ViewResult)result).ViewName);

        }



        [TestMethod]
        public void EditEmployee_Post_Should_Return_EditEmployee_View_When_Dept_No_Is_Not_In_Range()
        {
            var employee = new EmployeeViewModel {Fname = "Ray", Lname = "Romano", Ssn = "123-02-1234", Dno = 1001};
            var validationContext = new ValidationContext(employee, null, null);
            var testRepository = new TestRepository();

            var employeeController = new EmployeeController(testRepository);

            var validationResults = new List<ValidationResult>();
            Validator.TryValidateObject(employee, validationContext, validationResults, true);
            foreach (var validationResult in validationResults)
            {
                employeeController.ModelState.AddModelError(validationResult.MemberNames.First(),
                                                            validationResult.ErrorMessage);
            }

            var result = employeeController.EditEmployee(employee);

            Assert.IsNotNull(result);

            Assert.AreEqual("EditEmployee", ((ViewResult) result).ViewName);
        }





        [TestMethod]
        public void EditEmployee_Post_Should_Save_And_Redirect_ToIndex_When_Data_Is_Valid()
        {
            var employee = new EmployeeViewModel { Fname = "Ray", Lname = "Romano", Ssn = "123-02-1234", Dno = 99 };
            var validationContext = new ValidationContext(employee, null, null);
            var testRepository = new TestRepository();

            var employeeController = new EmployeeController(testRepository);

            var validationResults = new List<ValidationResult>();
            Validator.TryValidateObject(employee, validationContext, validationResults, true);
            foreach (var validationResult in validationResults)
            {
                employeeController.ModelState.AddModelError(validationResult.MemberNames.First(),
                                                            validationResult.ErrorMessage);
            }
            var result = (RedirectToRouteResult)employeeController.EditEmployee(employee);
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            Assert.AreEqual("Index", result.RouteValues["action"]);
           
        }


        [TestMethod]
        public void AddEmployee_Get_Should_Return_Add_Employee_View()
        {
            var testRepository = new TestRepository();

            var employeeController = new EmployeeController(testRepository);
            var result =  employeeController.AddEmployee();
            Assert.IsNotNull(result);
 
            Assert.AreEqual( "AddEmployee", ((ViewResult)result).ViewName);



        }


        [TestMethod]
        public void AddEmployee_Post_Should_Call_Save_On_Reposiotry_And_Redirect_To_Index()
        {
            var employee = new EmployeeViewModel { Fname = "Ray", Lname = "Romano", Ssn = "123-02-1234", Dno = 99 };
            var validationContext = new ValidationContext(employee, null, null);

            //Create a mock repository 
            var mockRepository = new Mock<IEmployeeRepository>();
           
            var employeeController = new EmployeeController(mockRepository.Object);

            var validationResults = new List<ValidationResult>();
            Validator.TryValidateObject(employee, validationContext, validationResults, true);
            foreach (var validationResult in validationResults)
            {
                employeeController.ModelState.AddModelError(validationResult.MemberNames.First(),
                                                            validationResult.ErrorMessage);
            }
            var result = (RedirectToRouteResult)employeeController.AddEmployee(employee);
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
            Assert.AreEqual("Index", result.RouteValues["action"]);

            mockRepository.Verify(x=>x.Save(), Times.AtMostOnce() );


        }


        [TestMethod]
        public void DeleTemployee_Call_Delete_Method_On_Repository()
        {
            var mockRepository = new Mock<IEmployeeRepository>();

            var employeeController = new EmployeeController(mockRepository.Object);
            employeeController.DeleteEmployee("123-45-4321");
            mockRepository.Verify(x=>x.Delete(It.IsAny<Employee>()), Times.AtMostOnce() );
        }


    }
}
