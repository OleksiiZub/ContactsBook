<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Contact</title>
    <style>
    <%@include file='css/style.css' %>
</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.js"></script>
</head>
<body>
<div align="center">
    <form action="/contact/add" method="post">
        <h3>New contact</h3>
        <select name="group">
            <option value="-1">Default</option>
            <c:forEach items="${groups}" var="group">
                <option value="${group.id}">${group.name}</option>
            </c:forEach>
        </select>
        <input type="text" id="name" name="name" placeholder="Name">
        <input type="text" id="surname" name="surname" placeholder="Surname">
        <input type="text" id="phone" name="phone" placeholder="Phone">
        <input type="text" id="email" name="email" placeholder="Email">
        <input type="submit" id="send" value="Add">
    </form>
</div>
<script>
    $('.selectpicker').selectpicker();
</script>
</body>
</html>