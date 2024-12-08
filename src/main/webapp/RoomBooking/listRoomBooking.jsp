<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

    <title class="main-title">Quản Lý Đặt Phòng Khách Sạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>




        :root {
            --primary-color: #1a237e;
            --secondary-color: #303f9f;
            --accent-color: #3949ab;
            --success-color: #43a047;
            --danger-color: #e53935;
            --black: hsl(0, 0%, 13%);
            --white: hsl(0, 0%, 96%);
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Montserrat', sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }

        .container {
            padding: 2rem 1rem;
            animation: fadeInUp 0.8s ease-out;
        }

        h1 {
            font-size: 2.8rem;
            font-weight: 700;
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 2rem;
            text-shadow: 2px 2px 4px var(--shadow-color);
            position: relative;
            padding-bottom: 1rem;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .room-card {
            border-radius: 1.5rem;
            box-shadow: 0 10px 20px var(--shadow-color);
            background: white;
            padding: 1.5rem;
            margin-bottom: 2rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid rgba(255, 255, 255, 0.18);
            backdrop-filter: blur(10px);
        }

        .room-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .room-image {
            border-radius: 1rem;
            transition: all 0.5s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 5px 15px var(--shadow-color);
        }

        .room-image img {
            transition: transform 0.5s ease;
            width: 100%;
            height: auto;
        }

        .room-card:hover .room-image img {
            transform: scale(1.1);
        }

        .btn-custom {
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px var(--shadow-color);
            position: relative;
            overflow: hidden;
        }

        .btn-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: 0.5s;
        }

        .btn-custom:hover::before {
            left: 100%;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            color: white;
        }

        .alert {
            border-radius: 1rem;
            animation: slideInDown 0.5s ease-out;
            box-shadow: 0 5px 15px var(--shadow-color);
        }

        /* Thông tin phòng */
        .room-info {
            padding: 1rem;
        }

        .room-info h4 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .room-info h4::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 50%;
            height: 3px;
            background: linear-gradient(90deg, var(--accent-color), transparent);
        }

        .room-info p {
            margin-bottom: 0.8rem;
            color: #666;
            transition: color 0.3s ease;
        }

        .room-info p:hover {
            color: var(--primary-color);
        }

        .room-info strong {
            color: var(--secondary-color);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            h1 {
                font-size: 2rem;
            }

            .room-card {
                margin-bottom: 1.5rem;
            }
        }

        /* Loading effect */
        .page-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: white;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            animation: fadeOut 1s ease-out forwards;
            animation-delay: 0.5s;
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
                visibility: hidden;
            }
        }

        /* Form enhancements */
        form {
            margin-top: 1.5rem;
            display: inline-block;
        }

        form + form {
            margin-left: 1rem;
        }

        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
<div class="page-loader">
    <div class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>

<div class="container">
    <h1 class="main-title">QUẢN LÝ ĐẶT PHÒNG KHÁCH SẠN</h1>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
                ${errorMessage}
        </div>
    </c:if>

    <h3 class="sub-title">Những phòng mà bạn đang sở hữu hiện tại</h3>
    <div class="row">
        <c:forEach items="${roomsbookings}" var="room">
            <div class="col-md-6">
                <div class="room-card">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="room-image">
                                <img src="${room.roomImgLink}" alt="Room Image" class="img-fluid">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="room-info">
                                <h4>Phòng ${room.bookingId}</h4>
                                <p><strong>Khách hàng:</strong> ${room.customerName}</p>
                                <p><strong>Vị trí:</strong> ${room.roomLocation}</p>
                                <p><strong>Tình trạng:</strong> ${room.roomStatus}</p>
                                <p><strong>Giá cả:</strong> $${room.roomPrice}</p>
                                <p><strong>Thời gian thuê:</strong><br>
                                    From: <fmt:formatDate value="${room.bookingStartDate}" pattern="yyyy-MM-dd HH:mm"/><br>
                                    To: <fmt:formatDate value="${room.bookingEndDate}" pattern="yyyy-MM-dd HH:mm"/>
                                </p>

                                <div class="btn-group">
                                    <form action="${pageContext.request.contextPath}/rentRoomForm_Temporary" method="get">
                                        <input type="hidden" name="roomTypeId" value="${room.roomTypeId}">
                                        <input type="hidden" name="roomDescription" value="${room.roomDescription}">
                                        <input type="hidden" name="roomImgLink" value="${room.roomImgLink}">
                                        <input type="hidden" name="roomPrice" value="${room.roomPrice}">
                                        <input type="hidden" name="roomLocation" value="${room.roomLocation}">
                                        <input type="hidden" name="bookingId" value="${room.bookingId}">
                                        <button type="submit" class="btn btn-custom">
                                            <i class="fas fa-key me-1"></i> Đặt phòng
                                        </button>
                                    </form>

                                    <form action="main_roombooking" method="post">
                                        <input type="hidden" name="action" value="huyphong">
                                        <button type="submit" class="btn btn-custom">
                                            <i class="fas fa-undo-alt me-1"></i> Trả phòng
                                        </button>
                                    </form>
                                </div>
                            </div>
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