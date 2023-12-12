<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<div class="container">
    <h2>Kết quả tra cứu</h2>
    <% String word = request.getParameter("word");
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("welcome", "chào mừng");
        dictionary.put("to", "đến với");
        dictionary.put("my world", "thế giới của tôi");
        String meaning = dictionary.get(word);
        if (meaning != null) {
    %>
    <p>Nghĩa của từ "<%= word %>" là: <%= meaning %></p>
    <%
    } else {
    %>
    <p>Không tìm thấy từ "<%= word %>".</p>
    <%
        }
    %>
%>


</div>
</body>
</html>
