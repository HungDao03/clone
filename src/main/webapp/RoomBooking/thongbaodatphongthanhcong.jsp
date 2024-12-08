<%--
  Created by IntelliJ IDEA.
  User: Mr Loc
  Date: 12/8/2024
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Phòng Thành Công</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success text-center" role="alert">
        <h4 class="alert-heading">Đặt phòng thành công!</h4>
        <p>${successMessage}</p>
        <hr>
        <a href="${pageContext.request.contextPath}/main_roombooking" class="btn btn-primary mt-3">Quay lại danh sách phòng</a>
    </div>
</div>
</body>
</html>