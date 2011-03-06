<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcDemoApp.Models.ListEmployeeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    EmployeeList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            employeeProcessor = new employeeProcessor();

            // Initialize URL properties
            employeeProcessor.GetEmployeesUrl = '<%=Url.Action("GetEmployeeList","Employee") %>';
            employeeProcessor.EditEmployeeUrl = '<%=Url.Action("EditEmployee", "Employee") %>';
            employeeProcessor.AddEmployeeUrl = '<%=Url.Action("AddEmployee", "Employee") %>';
            employeeProcessor.DeleteEmployeeUrl = '<%=Url.Action("DeleteEmployee", "Employee") %>';

            employeeProcessor.getEmployeeData();



        }
   );


    </script>
    <script id="employeeWaitingTemplate" type="text/x-jquery-tmpl">
        <div class="gridMinimumHeight" style="width:100%;height:100%;background:white;background-image:url('<%=Url.Content("~/Content/Images/busy.gif")%>');background-repeat:no-repeat;background-position:center center"></div>
    </script>
    <script id="employeeTemplate" type="text/x-jquery-tmpl">
        <div class="gridRowContainer">
            <div class="gridRow employeeGridRow">
                <div class="gridRowItem gridColumnFname">
                    ${Fname}
                </div>
                <div class="gridRowItem gridColumnMinit">
                    ${Minit}
                </div>
                <div class="gridRowItem gridColumnLname">
                    ${Lname}
                </div>
                <div class="gridRowItem gridColumnSsn">
                    ${Ssn}
                </div>
                    <div class="gridRowItem gridColumnBdate">
                    ${shortBdate}


                   
                </div>
                    <div class="gridRowItem gridColumnAddress">
                    ${Address}
                </div>
                   <div class="gridRowItem gridColumnSex">
                    ${Sex}
                </div>
                  <div class="gridRowItem gridColumnSalary">
                    ${Salary}
                </div>
                  <div class="gridRowItem gridColumnSuper_ssn">
                    ${Super_ssn}
                </div>
                   <div class="gridRowItem gridColumnDno">
                    ${Dno}
                </div>


                <div class="gridRowItem gridColumnCommands">
                    <a href="#" onclick='employeeProcessor.editEmployee(${Ssn}); return false;'>[ Edit ]</a>
                    <a href="#" onclick='employeeProcessor.deleteEmployee(${Ssn}); return false;'>[ Delete ]</a>
                       
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
    </script>
    <h2>
        EmployeeList</h2>
    <div style="padding-top: 5px; padding-left: 10px; float: left">
        <a href="#" onclick="employeeProcessor.addEmployee(); return false;">[ Add Employee]</a>
    </div>
    <div class="gridHeaderRow gridMinimumWidth employeeGridRow" id="employeeGridHeaderContainer"
        style="overflow: hidden">
        <div class="gridHeaderRowItem gridColumnFname withBorder">
            First Name</div>
        <div class="gridHeaderRowItem gridColumnMinitial withBorder">
            Middle Init</div>
        <div class="gridHeaderRowItem gridColumnLName withBorder">
            Last Name</div>
        <div class="gridHeaderRowItem gridColumnSsn withBorder">
            Soc No</div>
        <div class="gridHeaderRowItem gridColumnBdate withBorder">
            Birth Date</div>
        <div class="gridHeaderRowItem gridColumnAddress withBorder">
            Address
        </div>
        <div class="gridHeaderRowItem gridColumnSex withBorder">
            Sex</div>
        <div class="gridHeaderRowItem gridColumnSalary withBorder">
            Salary </div>
        <div class="gridHeaderRowItem gridColumnSuper_ssn withBorder">
            Supervisor Soc No</div>
        <div class="gridHeaderRowItem gridColumnDno">
            Department No</div>
        <div style="clear: both">
        </div>
    </div>
    <div id="employeeContent" class="gridData gridMinimumWidth gridMinimumHeight">
    </div>
    <div id="editEmployeeContent" style="display: none">
    </div>
</asp:Content>
