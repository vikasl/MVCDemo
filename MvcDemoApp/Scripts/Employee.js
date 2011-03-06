
function employeeProcessor()
{



this.EmployeeRequest = null;

this.getEmployeeData = function () {

    this.showWaiting($('div#employeeContent'));

            if (this.EmployeeRequest != null)
                this.EmployeeRequest.abort();

            this.EmployeeRequest = $.ajax({
                async: true,
                url: this.GetEmployeesUrl,
                context: this,
                success: function (data) {
                    this.EmployeeRequest = null;
                    
                    this.ListEmployees(data);
                },
                type: 'POST',
                dataType: 'json'
            });


}




this.ListEmployees = function (data) {

    var targetDiv = $('div#employeeContent');

    // Clear out previous contents
    targetDiv.html('');

   


    // If there are no data rows display a message
    if (data.length == 0) {
        $('#employeeNotPresentTemplate').tmpl(null).appendTo(targetDiv);
        return;
    }

    for (var i = 0; i < data.length; i++) {
        var currentDataItem = data[i];

        if (currentDataItem != null && currentDataItem.Bdate != null && currentDataItem.Bdate != '') {
            var newDate = new Date(parseInt(currentDataItem.Bdate.replace("/Date(", "").replace(")/", ""), 10));
            currentDataItem.shortBdate = newDate.getDate() + "/" + (newDate.getMonth() + 1) + "/" + newDate.getFullYear();
        }

        $('#employeeTemplate').tmpl(currentDataItem).appendTo(targetDiv);

        // apply alternate row styling
        targetDiv.find('.gridRowContainer:odd').addClass('alternateRow');
    }
}


this.editEmployee = function (essn) {


    window.location.href = this.EditEmployeeUrl + "?essn=" + essn ;
   

}


this.addEmployee = function () {

    window.location.href = this.AddEmployeeUrl;

}


this.deleteEmployee = function (essn) {

    window.location.href = this.DeleteEmployeeUrl + "?essn=" + essn;
}


    this.showWaiting = function (targetDiv) {
        // Clear out previous contents
        targetDiv.html('');
        $('#employeeWaitingTemplate').tmpl(null).appendTo(targetDiv);
    }


    function formatDate(datetime) {

        var newDate = new Date(parseInt(datetime.replace("/Date(", "").replace(")/", ""), 10));
        shortDate = newDate.getDate() + "/" + (newDate.getMonth() + 1) + "/" + newDate.getFullYear();

        return shortDate;
    } 

}




