<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
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

        form {
            width: 60%;
            margin: auto;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        input[type="text"] {
            width: 100%;
            padding: 6px 10px;
            margin: 4px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 2px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 7px 10px;
            margin: 4px 0;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="center">
    <h1>Search user by country</h1>
    <form method="post">
        <p>Enter country: </p>
        <label>
            <input type="text" name="country">
        </label>
        <br>
        <input type="submit" value="Search">
    </form>
</div>
</body>
</html>
