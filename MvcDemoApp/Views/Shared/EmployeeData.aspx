<%@ Page Title="" Language="C#"  Inherits="System.Web.Mvc.ViewPage<MvcDemoApp.Models.EmployeeViewModel>" %>


<div>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Fname) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Fname) %>
                <%= Html.ValidationMessageFor(model => model.Fname) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Minit) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Minit) %>
                <%= Html.ValidationMessageFor(model => model.Minit) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Lname) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Lname) %>
                <%= Html.ValidationMessageFor(model => model.Lname) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Ssn) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Ssn) %>
                <%= Html.ValidationMessageFor(model => model.Ssn) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Bdate) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Bdate, String.Format("{0:g}", Model.Bdate)) %>
                <%= Html.ValidationMessageFor(model => model.Bdate) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Address) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Address) %>
                <%= Html.ValidationMessageFor(model => model.Address) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Sex) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Sex) %>
                <%= Html.ValidationMessageFor(model => model.Sex) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Salary) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Salary) %>
                <%= Html.ValidationMessageFor(model => model.Salary) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Super_ssn) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Super_ssn) %>
                <%= Html.ValidationMessageFor(model => model.Super_ssn) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Dno) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Dno) %>
                <%= Html.ValidationMessageFor(model => model.Dno) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>



</div>