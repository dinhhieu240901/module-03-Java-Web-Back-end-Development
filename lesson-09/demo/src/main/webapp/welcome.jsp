<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Chào mừng</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .welcome-container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .welcome-text {
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .username {
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="welcome-container">
    <p class="welcome-text">Xin chào <span class="username">${username}</span>, chào mừng bạn đến với trang web của chúng tôi!</p>
</div>
</body>
</html>