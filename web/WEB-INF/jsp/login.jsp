<%-- 
    Document   : login
    Created on : Nov 13, 2017, 9:07:14 AM
    Author     : k3mshiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/loginstyle.css" />" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
    <div>Book<span>Store</span></div>
</div>
<br>
<div class="login">
    <form method="POST" action="${pageContext.request.contextPath}/admin/login">
        <input type="text" placeholder="username" name="username"><br>
        <input type="password" placeholder="password" name="password"><br>
        <input type="submit" value="Login">
    </form>

</div>