
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload a excel file</title>
</head>
<body>
<div class="container">
    <div class="py-5 text-center">
        <h2>Upload Excel File to MySQL</h2>
        <form method="POST"  enctype="multipart/form-data" action="/newexcel">
            <div class="form-group">
                <label class="control-label">Upload File:</label>
                <input type="file" class="form-control" placeholder="Upload File" name="uploadfile" />
            </div>
            <button type="submit" class="btn btn-default" id="btnSubmit">Upload</button>
        </form>
        <div>
            <h3>${message}</h3>
            <a href="/file">Download Excel File from MySQL</a>
        </div>
    </div>

    <h1>${message}</h1>
</div>
</body>
</html>

