<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>New Group</title>
        <style>
            <%@include file='css/style.css' %>
        </style>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div align="center">
            <form role="form" action="/group/add" method="post">
                <div ><h3>New Group</h3></div>
                <div ><input type="text" name="name" placeholder="Group name"></div>
                <div ><input type="submit" id="send" value="Add"></div>
            </form>
        </div>
    </body>
</html>