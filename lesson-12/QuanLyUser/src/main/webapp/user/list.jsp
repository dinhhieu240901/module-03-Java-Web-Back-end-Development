<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        #user-table {
            background: #fff;
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        #user-table table {
            width: 100%;
        }
        #user-table th {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            background-color: #49c1a2;
            color: white;
        }
        #user-table td {
            padding: 10px;
        }
        #user-table a {
            color: #49c1a2;
            text-decoration: none;
        }
        #user-table a:hover {
            color: #37a08e;
        }
    </style>
</head>
<body>
<div class="container">
    <center>
        <h1>User Management</h1>
        <h2>
            <a href="${pageContext.request.contextPath}/users?action=create">Add New User</a>
        </h2>
    </center>
    <div id="user-table">
        <table border="1" cellpadding="5">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Edit</a>
                        <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
