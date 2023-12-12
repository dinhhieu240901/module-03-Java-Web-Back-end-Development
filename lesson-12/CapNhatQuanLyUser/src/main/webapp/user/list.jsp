<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 07/12/2023
  Time: 07:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Manager Application</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .center {
            margin-top: 20px;
            text-align: center;
        }
        .center a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #3498db;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .center a:hover {
            background-color: #2980b9;
        }
        fieldset {
            width: 80%;
            margin: auto;
            border: 2px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        legend {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            margin-right: 10px;
            padding: 8px 12px;
            border-radius: 5px;
            background-color: #3498db;
            color: white;
        }

        a:hover {
            text-decoration: underline;
            background-color: #2978b5;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1>User Manager</h1>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=create">Add New User</a>
    </h2>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=search">Search User By Country</a>
    </h2>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=sort">Sort User List By Name</a>
    </h2>
</div>
<div  style="text-align: center;">
    <table style="border: 1px; cell-padding: 5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=edit&&id=${user.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/users?action=delete&&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>