<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        }
        #user-form {
            background: #fff;
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        #user-form table {
            width: 100%;
        }
        #user-form th {
            text-align: left;
            padding: 10px;
        }
        #user-form td {
            padding: 10px;
        }
        #user-form input[type="text"] {
            width: 90%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        #user-form input[type="submit"] {
            padding: 10px 20px;
            background: #49c1a2;
            color: white;
            border: none;
        }
        #user-form input[type="submit"]:hover {
            background: #37a08e;
        }
    </style>
</head>
<body>
<div class="container">
    <center>
        <h1>User Management</h1>
        <h2>
            <a href="users?action=users">List All Users</a>
        </h2>
    </center>
    <div id="user-form">
        <form method="post">
            <table>
                <caption>
                    <h2>Add New User</h2>
                </caption>
                <tr>
                    <th>User Name:</th>
                    <td>
                        <input type="text" name="name" id="name"/>
                    </td>
                </tr>
                <tr>
                    <th>User Email:</th>
                    <td>
                        <input type="text" name="email" id="email"/>
                    </td>
                </tr>
                <tr>
                    <th>Country:</th>
                    <td>
                        <input type="text" name="country" id="country"/>
                    </td>
                </tr>
                <tr>
                    <th>Permission:</th>
                    <td>
                        <input type="checkbox" name="add" size="15"/> add |
                        <input type="checkbox" name="edit" size="15"/> edit |
                        <input type="checkbox" name="delete" size="15"/> delete |
                        <input type="checkbox" name="view" size="15"/> view
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
