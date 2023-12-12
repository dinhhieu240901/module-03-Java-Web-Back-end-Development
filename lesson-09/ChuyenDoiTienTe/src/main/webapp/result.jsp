<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Conversion Result</title>
</head>
<body>
<h1>Conversion Result</h1>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } else { %>
<p>VND Amount: <%= request.getAttribute("result") %></p>
<% } %>
<a href="${pageContext.request.contextPath}/index.jsp">Back to Converter</a>
</body>
</html>