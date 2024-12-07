<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <div><strong>${roomsrentForm.roomCode}</strong></div>
    </div>
    <div>
        <label>Mô tả phòng:</label>
        <div><strong>${roomsrentForm.roomDescription}</strong></div>
    </div>


    <div>
        <img src="${roomsrentForm.roomImgLink}" alt="Room Image" width="50" height="50" class="img-thumbnail">
    </div>

    <div>
        <label for="roomPrice">Giá phòng (VNĐ / giờ):</label>
        <input type="number" id="roomPrice" name="roomPrice" value="${roombookingsVar.roomPrice}" readonly>
    </div>
    <div>
        <label for="roomLocation">Vị trí:</label>
        <input type="text" id="roomLocation" name="roomLocation" value="${roombookingsVar.roomLocation}" readonly>
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