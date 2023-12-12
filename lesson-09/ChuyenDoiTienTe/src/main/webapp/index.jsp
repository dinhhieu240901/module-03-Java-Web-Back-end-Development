<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<h1>Currency Converter</h1>
<form action="${pageContext.request.contextPath}/convert" method="post">
    <label for="amount">Amount:</label>
    <input type="text" id="amount" name="amount" required>

    <label for="fromCurrency">From Currency:</label>
    <select id="fromCurrency" name="fromCurrency" required>
        <option value="USD">USD</option>
        <option value="EUR">EUR</option>
    </select>

    <label for="toCurrency">To Currency:</label>
    <select id="toCurrency" name="toCurrency" required>
        <option value="USD">USD</option>
        <option value="EUR">EUR</option>
    </select>
    <button type="submit">Convert</button>
</form>
</body>
</html>