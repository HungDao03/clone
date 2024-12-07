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
<h1>Cho thuê phòng</h1>

<form action="${pageContext.request.contextPath}/RoomBooking/RoomRentFormController" method="GET" id="rentRoomForm">
    <!-- Hiển thị thông tin phòng -->
    <div>
        <label>Mã phòng:</label>
        <div><strong>${param.roomCode}</strong></div>
        <input type="hidden" name="roomCode" value="${param.roomCode}">
    </div>

    <%@ page import="java.net.URLDecoder" %>
    <%
        String roomDescription = request.getParameter("roomDescription");
        if (roomDescription != null) {
            roomDescription = new String(roomDescription.getBytes("ISO-8859-1"), "UTF-8");
        }
    %>


    <div>
        <label>Mô tả phòng:</label>
        <div><strong>${EncodingUtil.fixEncoding(param.roomDescription)}</strong></div>

<%--        Phương thức chuyển đổi ký tự lỗi này quá xịn--%>
    </div>

<%--    <div>--%>
<%--        <label>Mô tả phòng:</label>--%>
<%--        <div><strong>${param.roomDescription}</strong></div>--%>
<%--    </div>--%>

    <div>
        <img src="${param.roomImgLink}" alt="Room Image" width="50" height="50" class="img-thumbnail">
    </div>

    <div>
        <label for="roomPrice">Giá phòng (VNĐ / giờ):</label>
        <input type="number" id="roomPrice" name="roomPrice" value="${param.roomPrice}" readonly>
    </div>


    <div>
        <label>Vị trí:</label>
        <div><strong>${EncodingUtil.fixEncoding(param.roomLocation)}</strong></div>
    </div>








    <!-- Nhập thông tin khách thuê -->
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
    <!-- Trạng thái -->
    <div>
        <input type="hidden" id="roomStatus" name="roomStatus" value="Rented">
    </div>

    <!-- Nút lưu và quay lại -->
    <div>
        <button type="submit">Lưu</button>
        <a href="${pageContext.request.contextPath}/RoomBooking/roomList.jsp">Quay lại</a>
    </div>
</form>

<script>
    // Tính toán thời gian thuê nếu cần
    document.getElementById('endTime').addEventListener('change', function () {
        const startTime = new Date(document.getElementById('startTime').value);
        const endTime = new Date(this.value);
        const pricePerHour = parseFloat(document.getElementById('roomPrice').value);

        if (endTime > startTime) {
            const diffHours = Math.ceil((endTime - startTime) / (1000 * 60 * 60));
            const totalPrice = diffHours * pricePerHour;
            alert(`Thời gian thuê: ${diffHours} giờ. Tổng tiền: ${totalPrice.toLocaleString('vi-VN')} VNĐ`);
        } else {
            alert("Ngày kết thúc phải lớn hơn ngày bắt đầu!");
            this.value = '';
        }
    });
</script>
</body>
</html>