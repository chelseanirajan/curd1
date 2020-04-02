<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Create an account</title>
        <tiles:importAttribute name="stylesheets" />
        <c:forEach var="stylesheet" items="${stylesheets}">
            <link type="text/css" rel="stylesheet" href="${contextPath}<c:out value='${stylesheet}' /> " />
        </c:forEach>
        <tiles:importAttribute name="javascripts" />
        <c:forEach var="javascript" items="${javascripts}">
            <script src="${contextPath}<c:out value='${javascript}' />" ></script>
        </c:forEach>
    </head>
    <body>
        <section class="header-border">
            <tiles:insertAttribute name="header"/>
        </section>
        <section class="nav-border container-fluid">
            <section id="_carousel" class="carousel slide" data-ride="carousel">
                <tiles:insertAttribute name="body"/>
            </section>
        </section>
        <tiles:insertAttribute name="footer"/>
    </body>
</html>