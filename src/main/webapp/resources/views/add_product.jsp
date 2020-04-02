<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
</head>
<body>

<div class="container">
    <div class="py-5 text-center">
        <h2>Product</h2>
    </div>
    <form:form method="POST" action="${contextPath}/new" modelAttribute="userForm" class="form-signup">
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
        </div>
    </div>
</div>
</body>
</html>
