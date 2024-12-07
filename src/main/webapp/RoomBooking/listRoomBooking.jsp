<%--
  Created by IntelliJ IDEA.
  User: Mr Loc
  Date: 12/7/2024
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room List</title>
    <link rel="stylesheet" href="styles.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<h1>Danh sách phòng</h1>

<!-- Hiển thị thông báo nếu có lỗi -->
<c:if test="${not empty errorMessage}">
    <p style="color: red;">${errorMessage}</p>
</c:if>

<!-- Hiển thị bảng danh sách phòng -->
<table border="1">
    <thead>
    <tr>
        <th>Mã phòng</th>
        <th>Mô tả phòng</th>
        <th>Giá phòng</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Ngày cập nhật</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <!-- Lặp qua danh sách phòng và hiển thị thông tin -->
    <c:forEach var="roombookingsVar" items="${roomsbookings}">
<%--         thông tin trong item đến từ [ request.setAttribute("roomsbooking", roomsbooking)  ] trong doGet hoặc doPost trong Controller--%>
<%--        roomsbooking này là List<RoomBooking>  lấy từ Model, các biến roomCode,roomDescriptrong là lấy từ Model RoomBooking--%>
        <tr>
            <td>${roombookingsVar.roomCode}</td>
            <td>${roombookingsVar.roomDescription}</td>
            <td>${roombookingsVar.roomPrice}</td>
            <td>${roombookingsVar.roomStatus}</td>
            <td>${roombookingsVar.roomCreateDate}</td>
            <td>${roombookingsVar.roomUpdateDate}</td>
            <td>

<%--                GET: Lấy danh sách phòng booking trên CSDL về để truyền vào view jsp--%>
            <%--    POST: Thêm phòng mới hoặc cập nhật phòng truyền từ jsp về csdl để thêm sửa xoá--%>

           <%-- pageContext.request.contextPath} chính là : http://localhost:8080/myHotelApp, contextPath chính là dòng myHotelApp--%>
                <form action="${pageContext.request.contextPath}/RoomBooking/rentRoomForm_Temporary.jsp" method="POST">  <%--                    đoạn này phải sử dụng Post để sửa lại dữ liệu trên CSDL đoạn avaible sang rented.--%>
                    <input type="hidden" name="roomCode" value="${roombookingsVar.roomCode}">
                    <button type="submit" class="btn btn-danger">CHO THUÊ PHÒNG</button>
                </form>
                <form action="${pageContext.request.contextPath}/RoomBooking/returnRoom.jsp" method="POST">
                    <input type="hidden" name="roomCode" value="${roombookingsVar.roomCode}">
                    <button type="submit" class="btn btn-primary">TRẢ PHÒNG</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>

