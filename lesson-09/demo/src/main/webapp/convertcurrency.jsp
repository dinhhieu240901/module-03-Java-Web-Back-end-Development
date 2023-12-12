<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        form{
            vertical-align: center;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        label{
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"]{
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/convert" method="post" >
            <label for="fahrenheit">Enter Temperature in Fahrenheit</label>
            <input type="text" id="fahrenheit" name="fahrenheit" required>
            <input type="submit" value="Convert">
    </form>
</body>
</html>
