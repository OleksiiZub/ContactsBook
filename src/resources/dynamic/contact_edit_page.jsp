<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <style>
        <%@include file='css/style.css' %>
    </style>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.js"></script>
</head>
<body>
<div align="center">
    <form action="contact-edit-{id}" method="post">
        <h3>Edit contact</h3>
        <select name="group">
            <option value="-1">Default</option>
            <c:forEach items="${groups}" var="group">
                <option value="${group.id}">${group.name}</option>
            </c:forEach>
        </select>
        <input type="text" id="name" name="name">
        <input type="text" id="surname" name="surname">
        <input type="text" id="phone" name="phone">
        <input type="text" id="email" name="email">
        <input type="submit" id="send" value="Save changes">
    </form>
</div>
<script>
    $('.selectpicker').selectpicker();
</script>
</body>
</html>
