<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Contact book</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet">
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead"><img height="40" width="40" src="<c:url value="/static/logo.png"/>"/><a href="/"> List of contacts </a></span></div>
        <table class="table table-hover" align="center">
            <thead>
            <tr>
                <td><b>Name</b></td>
                <td><b>Surname</b></td>
                <td><b>Phone</b></td>
                <td><b>E-mail</b></td>
                <td><b>Group</b></td>
                <th width="100"></th>
                <th width="100"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contacts}" var="contact">
                <tr>
                    <td>${contact.name}</td>
                    <td>${contact.surname}</td>
                    <td>${contact.phone}</td>
                    <td>${contact.email}</td>
                    <c:choose>
                        <c:when test="${contact.group ne null}">
                            <td>${contact.group.name}</td>
                        </c:when>
                        <c:otherwise>
                            <td>Default</td>
                        </c:otherwise>
                    </c:choose>
                    <td><a href="<c:url value='/contact-edit-${contact.id}' />" class="btn btn-success custom-width">edit</a></td>
                    <td><a href="<c:url value="/contact-delete-${contact.id}"/>" class="btn btn-danger custom-width">delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <nav aria-label="Page navigation">
             <ul class="pagination">
                 <c:forEach var="i" begin="1" end="${pages}">
                  <li><a href="/?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>
                 </c:forEach>
             </ul>
        </nav>

    </div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="groupList" class="nav navbar-nav">
                    <li><button type="button" id="add_contact" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal">Add Contact</button></li>
                    <li><button type="button" id="add_group" class="btn btn-default navbar-btn">Add Group</button></li>
                    <li><button type="button" id="delete_group" class="btn btn-default navbar-btn">Delete Group</button></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Groups <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/">Default</a></li>
                            <c:forEach items="${groups}" var="group">
                                <li><a href="/group/${group.id}">${group.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search" action="/search" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="pattern" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </nav>

</div>
    <script>
        $('.dropdown-toggle').dropdown();

        $('#add_contact').click(function(){
            window.location.href='<spring:url value="/contact_add_page"/>';
        });

        $('#add_group').click(function(){
            window.location.href='<spring:url value="/group_add_page"/>';
        });
    </script>
</body>
</html>