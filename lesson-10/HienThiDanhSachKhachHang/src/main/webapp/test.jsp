<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
<h2>Danh sách khách hàng</h2>

<table border="1">
    <thead>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customers" items="${customerList}">
        <tr>
            <td>${customers.name}</td>
            <td>${customers.dateOfBirth}</td>
            <td>${customers.address}</td>
            <td><img src="${customers.picture}" alt="${customers.name}" width="80px" height="80px"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>