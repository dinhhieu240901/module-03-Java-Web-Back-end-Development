<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html>
<head>
    <title>Từ điển Anh-Việt</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
    <h2>Tra cứu từ Anh-Việt</h2>
    <form action="search.jsp" method="post">
        <label for="word">Nhập từ cần tra:</label>
        <input type="text" id="word" name="word" required>
        <button type="submit">Tra cứu</button>
    </form>
</div>
</body>
</html>