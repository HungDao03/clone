<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="utils.EncodingUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cho thuê phòng</title>
</head>
<body>
<div>
    <h1>Cho thuê phòng</h1>
</div>

<div>
    <form action="${pageContext.request.contextPath}/RoomBooking/RoomRentFormController" method="GET">
        <div>
            <img src="${param.roomImgLink}" alt="Room Image" onerror="this.src='https://via.placeholder.com/400x300?text=No+Image+Available'">
            <div>
                <label>Mã phòng:</label>
                <div>${param.roomCode}</div>
                <input type="hidden" name="roomCode" value="${param.roomCode}">
            </div>

            <div>
                <label>Mô tả phòng:</label>
                <div>${EncodingUtil.fixEncoding(param.roomDescription)}</div>
            </div>

            <div>
                <label>Vị trí:</label>
                <div>${EncodingUtil.fixEncoding(param.roomLocation)}</div>
            </div>

            <div>
                <label>Giá:</label>
                <div>${param.roomPrice} VNĐ/giờ</div>
            </div>
        </div>

        <div>
            <label for="customerName">Tên khách hàng:</label>
            <input type="text" id="customerName" name="customerName" required>
        </div>

        <div>
            <label for="startTime">Ngày bắt đầu thuê:</label>
            <input type="datetime-local" id="startTime" name="startTime" required>
        </div>

        <div>
            <label for="endTime">Ngày kết thúc thuê:</label>
            <input type="datetime-local" id="endTime" name="endTime" required>
        </div>

        <div>
            <a href="${pageContext.request.contextPath}/RoomBooking/roomList.jsp">Quay lại</a>
            <button type="submit">Xác nhận đặt phòng</button>
        </div>
    </form>
</div>
</body>
</html>
