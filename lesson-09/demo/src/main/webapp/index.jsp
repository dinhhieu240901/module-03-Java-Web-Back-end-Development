<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>

        a {
            background-color: cyan;
            border-radius: 10px;
            padding: 20px;
            text-decoration: none;
            color: black;
        }

        .login {
            margin: 0 auto;
            height: 300px;
            width: 230px;
            padding: 10px;
            border: 1px #CCC solid;
            display: flex;
            flex-direction: column;

        }

        .login input {
            padding: 5px;
            margin: 5px;
        }
       .login button{
            align-items: center;
           justify-content: center;
        }
        .error {
            padding-top:20px;
            text-align: center;
            color: red;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <div class="login">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit" name="loginButton" data-target="#exampleModal">Login</button>
    </div>
</form>
<div class=error>
    ${sessionScope.error}
</div>

</body>
</html>