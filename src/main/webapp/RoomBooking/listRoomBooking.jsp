<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Đặt Phòng Khách Sạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>

        .btn-custom {
            background-color: #007bff; /* Màu nền */
            color: white; /* Màu chữ */
            border: none; /* Không viền */
            padding: 10px 20px; /* Khoảng cách padding */
            font-size: 16px; /* Cỡ chữ */
            border-radius: 5px; /* Bo góc */
            cursor: pointer; /* Con trỏ chuột */
            transition: background-color 0.3s, transform 0.2s; /* Hiệu ứng chuyển màu và thu phóng */
        }

        .btn-custom:hover {
            background-color: #0056b3; /* Màu nền khi hover */
            transform: scale(1.05); /* Hiệu ứng phóng to */
        }

        .btn-custom:focus {
            outline: none; /* Xóa viền focus */
        }




        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
            --success-color: #2ecc71;
            --danger-color: #e74c3c;
            --black: hsl(0, 0%, 13%);
            --white: hsl(0, 0%, 96%);
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Montserrat', sans-serif;
            font-size: 16px;
            min-height: 100vh;
        }

        .container {
            padding: 2rem 1rem;
        }

        .room-card {
            border-radius: 1.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            background: white;
            padding: 1.5rem;
            margin-bottom: 2rem;
            transition: transform 0.3s ease-in-out;
        }

        .room-card:hover {
            transform: translateY(-5px);
        }

        .room-image {
            border-radius: 1rem;
            transition: transform 0.3s ease-in-out;
        }

        .room-image:hover {
            transform: scale(1.1);
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }

        .btn {
            border-radius: 0.5rem;
            padding: 0.7rem 1.2rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .btn-success {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }

        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .alert {
            border-radius: 0.5rem;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>QUẢN LÝ ĐĂT PHÒNG KHÁCH SẠN  </h1>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
                ${errorMessage}
        </div>
    </c:if>

    <h3 class="my-4">Những phòng mà bạn đang sở hữu hiện tại </h3>
    <div class="row">
        <c:forEach items="${roomsbookings}" var="room">
            <div class="col-md-6">
                <div class="room-card">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="${room.roomImgLink}" alt="Room Image" class="room-image img-thumbnail">
                        </div>
                        <div class="col-md-8">
                            <h4>Phòng ${room.bookingId}</h4>
                            <p><strong>Khách hàng:</strong> ${room.customerName}</p>
                            <p><strong>Vị trí:</strong> ${room.roomLocation}</p>
                            <p><strong>Tình trạng:</strong> ${room.roomStatus}</p>
                            <p><strong>Giá cả:</strong> $${room.roomPrice}</p>
                            <p><strong>Thời gian thuê:</strong><br>
                                From: <fmt:formatDate value="${room.bookingStartDate}" pattern="yyyy-MM-dd HH:mm"/><br>
                                To: <fmt:formatDate value="${room.bookingEndDate}" pattern="yyyy-MM-dd HH:mm"/>
                            </p>


<%--                            <form action="${pageContext.request.contextPath}/RoomBooking/rentRoomForm_Temporary.jsp" method="POST" accept-charset="UTF-8" class="d-inline">--%>
<%--                                <input type="hidden" name="roomCode" value="${roombookingsVar.roomCode}">--%>
<%--                                <input type="hidden" name="roomDescription" value="<c:out value="${fn:escapeXml(roombookingsVar.roomDescription)}" />">--%>
<%--                                <input type="hidden" name="roomImgLink" value="${roombookingsVar.roomImgLink}">--%>
<%--                                <input type="hidden" name="roomPrice" value="${roombookingsVar.roomPrice}">--%>
<%--                                <input type="hidden" name="roomLocation" value="${roombookingsVar.roomLocation}">--%>
<%--                                <button type="submit" class="btn btn-primary">--%>
<%--                                    <i class="fas fa-key me-1"></i> Cho thuê--%>
<%--                                </button>--%>
<%--                            </form>--%>
<%--                            <form action="${pageContext.request.contextPath}/RoomBooking/returnRoom.jsp" method="POST" class="d-inline">--%>
<%--                                <input type="hidden" name="roomCode" value="${roombookingsVar.roomCode}">--%>
<%--                                <button type="submit" class="btn btn-danger">--%>
<%--                                    <i class="fas fa-undo-alt me-1"></i> Trả phòng--%>
<%--                                </button>--%>
<%--                            </form>--%>



                            <form action="${pageContext.request.contextPath}/rentRoomForm_Temporary" method="get" class="mt-2">

                            <!-- Tham số cho trang rentRoomForm.jsp -->
<%--                                khong dung rooomtypeid keo bi loan--%>
                              <input type="hidden" name="roomTypeId" value="${room.roomTypeId}">
                              <input type="hidden" name="roomDescription" value="${room.roomDescription}">
                                <input type="hidden" name="roomImgLink" value="${room.roomImgLink}">
                               <input type="hidden" name="roomPrice" value="${room.roomPrice}">
                               <input type="hidden" name="roomLocation" value="${room.roomLocation}">
                                <input type="hidden" name="bookingId" value="${room.bookingId}">

                                <!-- Nút bấm "Đặt phòng" -->
                                <button type="submit" class="btn btn-custom">
                                    <i class="fas fa-key me-1"></i> Đặt phòng
                                </button>
                            </form>





                            <form action="main_roombooking" method="post" class="mt-2">
                                <input type="hidden" name="action" value="huyphong">
                                <button type="submit" class="btn btn-custom">
                                    <i class="fas fa-undo-alt me-1"></i> Trả phòng
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
