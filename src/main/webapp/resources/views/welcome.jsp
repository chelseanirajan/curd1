
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Manager</title>
</head>
<body>
<div align="center">
    <h1>Product List</h1>
    <a href="/getForm">Create New Product</a> || <a href="/excel">Upload Excel File</a> || <a href="/test">Test</a>
    <br/><br/>
    <table border="1" cellpadding="10">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Made In</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="contact" items="${all}">


        <tr>
            <td>${contact.id}</td>
            <td>${contact.brand}</td>
            <td>${contact.madein}</td>
            <td>${contact.price}</td>
            <td>${contact.name}</td>
            <td>
                <a href="/edit?id=${contact.id}" >Edit</a>
                <a href="/delete?id=${contact.id}" onclick="confirm('Do you want to delete?')">Delete</a>
            </td>
        </tr>
            </c:forEach>
    </table>
</div>
<h1>hello miracle</h1>

</body>

<body>

</body>
</html>