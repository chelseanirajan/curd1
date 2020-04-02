<%--
  Created by IntelliJ IDEA.
  User: Jugal
  Date: 3/19/2020
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
</head>
<body>
<body>
<div align="center">
    <h1>Create New Product</h1>
    <br />
    <form:form method="POST"
               action="/spring-mvc-xml/addEmployee" modelAttribute="employee">
        <table>
            <tr>
                <td><form:label path="name">Name</form:label></td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td><form:label path="id">Id</form:label></td>
                <td><form:input path="id"/></td>
            </tr>
            <tr>
                <td><form:label path="contactNumber">
                    Contact Number</form:label></td>
                <td><form:input path="contactNumber"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form:form>
    <form action="#" action="@{/save}" object="${product}" method="post">
        <table border="0" cellpadding="10">
            <tr>
                <td>Product Name:</td>
                <td><input type="text" field="*{name}" /></td>
            </tr>
            <tr>
                <td>Brand:</td>
                <td><input type="text" th:field="*{brand}" /></td>
            </tr>
            <tr>
                <td>Made In:</td>
                <td><input type="text" th:field="*{madein}" /></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" th:field="*{price}" /></td>
            </tr>
            <tr>
                <td colspan="2"><button type="submit">Save</button> </td>
            </tr>
        </table>
    </form>
</div>
</body>
</body>
</html>
<div class="row">
<div class="col-md-12 order-md-1">
<form:form method="POST" action="${contextPath}/new"  class="form-signup">
    <input type="hidden" id='id' name="id" value="${userForm.id}">
    <div class="row">
        <div class="col-md-4 mb-3">
            <spring:bind path="name">
                <div class="form-group required ${status.error ? 'has-error' : ''}">
                    <label class="form-check-label" for="name">
                        <spring:message
                                code=" " text="First Name"></spring:message>
                    </label>
                    <form:input type="text" path="name" class="form-control"
                                autofocus="true"></form:input>
                    <form:errors class="error-message" path="name"></form:errors>
                </div>
            </spring:bind>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 mb-3">
            <spring:bind path="brand">
                <div class="form-group  ${status.error ? 'has-error' : ''}">
                    <label class="form-check-label" for="brand">Gender</label>
                    <form:input type="text" path="brand" class="form-control"
                                required="required"
                                autofocus="true"></form:input>
                    <form:errors path="brand"></form:errors>
                </div>
            </spring:bind>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 mb-3">
            <spring:bind path="madein">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="form-check-label" for="madein">Made In</label>
                    <form:input type="text" path="madein" class="form-control"
                                required="required"
                                autofocus="true"></form:input>
                    <form:errors path="madein"></form:errors>
                </div>
            </spring:bind>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 mb-3">
            <spring:bind path="price">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="form-check-label" for="price">price</label>
                    <form:input type="number" path="price" class="form-control"
                                required="required"
                                autofocus="true"></form:input>
                    <form:errors path="price"></form:errors>
                </div>
            </spring:bind>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">
        Submit
    </button>
</form:form>