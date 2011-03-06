Create a database named Employee in SQL server 
Run employee.sql from Databasescript folder
Open ths MvcDemoApp.sln 
Change the servername in connection string named EmployeeEntities in web.configfile to sql server instance running on your machine
<add name="EmployeeEntities" connectionString="metadata=res://*/DataService.Employee.csdl|res://*/DataService.Employee.ssdl|res://*/DataService.Employee.msl;provider=System.Data.SqlClient;provider connection string=&quot;Data Source=(local)\sqlserver2005;Initial Catalog=Employee;Integrated Security=True;MultipleActiveResultSets=True&quot;" providerName="System.Data.EntityClient" />
