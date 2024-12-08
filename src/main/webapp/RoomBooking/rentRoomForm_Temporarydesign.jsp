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

    <!-- Google Fonts - Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            padding: 2rem 0;
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
            url('https://images.unsplash.com/photo-1564013799919-ab600027ffc6?auto=format&fit=crop&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        .title-container {
            text-align: center;
            margin-bottom: 3rem;
            padding: 2rem 0;
            position: relative;
        }

        .title-frame {
            position: relative;
            display: inline-block;
            padding: 2rem 4rem;
        }

        .title-frame::before,
        .title-frame::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            border: 2px solid transparent;
            animation: frameAnimation 2s linear infinite;
        }

        .title-frame::before {
            border-image: linear-gradient(45deg, #3498db, transparent 30%) 1;
            animation-delay: -1s;
        }

        .title-frame::after {
            border-image: linear-gradient(225deg, #2ecc71, transparent 30%) 1;
        }

        .frame-corner {
            position: absolute;
            width: 20px;
            height: 20px;
            border: 3px solid #3498db;
        }

        .corner-top-left {
            top: 0;
            left: 0;
            border-right: none;
            border-bottom: none;
        }

        .corner-top-right {
            top: 0;
            right: 0;
            border-left: none;
            border-bottom: none;
        }

        .corner-bottom-left {
            bottom: 0;
            left: 0;
            border-right: none;
            border-top: none;
        }

        .corner-bottom-right {
            bottom: 0;
            right: 0;
            border-left: none;
            border-top: none;
        }

        .animated-title {
            color: transparent;
            -webkit-text-stroke: 1px #fff;
            font-size: 4rem;
            font-weight: 700;
            background-image: linear-gradient(45deg, #3498db, #2ecc71);
            background-repeat: no-repeat;
            -webkit-background-clip: text;
            background-position: -600px 0;
            transition: background-position 1s, text-shadow 1s;
            transition-delay: 0.6s, 0s;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        .animated-title::before {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            filter: blur(10px);
            opacity: 0.5;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            -webkit-background-clip: text;
            color: transparent;
        }

        .animated-title:hover {
            transition: background-position 1s, text-shadow 1s;
            transition-delay: 0s, 1s;
            background-position: 0 0;
            text-shadow: 0 0 10px #3498db,
            0 0 20px #3498db,
            0 0 40px #3498db,
            0 0 80px #2ecc71;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            padding: 2rem;
            max-width: 800px;
            margin: auto;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .room-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
            margin: 1rem 0;
            transition: transform 0.3s ease;
        }

        .room-image:hover {
            transform: scale(1.02);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #34495e;
        }

        .form-control {
            border-radius: 8px;
            border: 2px solid #eee;
            padding: 0.7rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52,152,219,0.25);
        }

        .room-info {
            background: rgba(255, 255, 255, 0.9);
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            backdrop-filter: blur(10px);
        }

        .btn-submit {
            background: linear-gradient(45deg, #3498db, #2ecc71);
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46,204,113,0.3);
        }

        .btn-back {
            background: #95a5a6;
            color: white;
            padding: 12px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background: #7f8c8d;
            color: white;
        }

        .price-tag {
            background: linear-gradient(45deg, #3498db, #2ecc71);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            display: inline-block;
            font-weight: 600;
            box-shadow: 0 2px 10px rgba(46,204,113,0.2);
        }

        .title-glow {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 120%;
            height: 120%;
            background: radial-gradient(circle, rgba(52, 152, 219, 0.2) 0%, rgba(46, 204, 113, 0.1) 50%, transparent 70%);
            filter: blur(20px);
            z-index: -1;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes frameAnimation {
            0% {
                clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
            }
            25% {
                clip-path: polygon(0 0, 0 0, 0 100%, 0 100%);
            }
            50% {
                clip-path: polygon(100% 0, 100% 0, 100% 100%, 100% 100%);
            }
            75% {
                clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
            }
            100% {
                clip-path: polygon(0 100%, 100% 100%, 100% 100%, 0 100%);
            }
        }

        .animate-fade-in {
            animation: fadeIn 0.5s ease-out forwards;
        }

        .shine-effect {
            position: relative;
            overflow: hidden;
        }

        .shine-effect::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                    to right,
                    rgba(255,255,255,0) 0%,
                    rgba(255,255,255,0.3) 50%,
                    rgba(255,255,255,0) 100%
            );
            transform: rotate(30deg);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            from {
                transform: translateX(-100%) rotate(30deg);
            }
            to {
                transform: translateX(100%) rotate(30deg);
            }
        }
    </style>
</head>
<body>
<div class="title-container">
    <div class="title-frame">
        <div class="frame-corner corner-top-left"></div>
        <div class="frame-corner corner-top-right"></div>
        <div class="frame-corner corner-bottom-left"></div>
        <div class="frame-corner corner-bottom-right"></div>
        <div class="title-glow"></div>
        <h1 class="animated-title" data-text="Cho thuê phòng">Cho thuê phòng</h1>
    </div>
</div>

<div class="container animate-fade-in">
    <form action="${pageContext.request.contextPath}/RoomBooking/RoomRentFormController"
          method="GET"
          id="rentRoomForm"
          class="needs-validation"
          novalidate>

        <div class="room-info animate__animated animate__fadeIn shine-effect">
            <div class="row">
                <div class="col-md-6">
                    <img src="${param.roomImgLink}"
                         alt="Room Image"
                         class="room-image shadow"
                         onerror="this.src='https://via.placeholder.com/400x300?text=No+Image+Available'">
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Mã phòng:</label>
                        <div class="h5">${param.roomCode}</div>
                        <input type="hidden" name="roomCode" value="${param.roomCode}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mô tả phòng:</label>
                        <div class="h6">${EncodingUtil.fixEncoding(param.roomDescription)}</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Vị trí:</label>
                        <div class="h6">
                            <i class="fas fa-map-marker-alt text-danger"></i>
                            ${EncodingUtil.fixEncoding(param.roomLocation)}
                        </div>
                    </div>

                    <div class="price-tag shine-effect">
                        <i class="fas fa-tag"></i>
                        ${param.roomPrice} VNĐ/giờ
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="customerName" class="form-label">
                <i class="fas fa-user"></i> Tên khách hàng
            </label>
            <input type="text"
                   class="form-control"
                   id="customerName"
                   name="customerName"
                   required>
            <div class="invalid-feedback">
                Vui lòng nhập tên khách hàng
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="startTime" class="form-label">
                        <i class="fas fa-calendar-alt"></i> Ngày bắt đầu thuê
                    </label>
                    <input type="datetime-local"
                           class="form-control"
                           id="startTime"
                           name="startTime"
                           required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="endTime" class="form-label">
                        <i class="fas fa-calendar-check"></i> Ngày kết thúc thuê
                    </label>
                    <input type="datetime-local"
                           class="form-control"
                           id="endTime"
                           name="endTime"
                           required>
                </div>
            </div>

            <div class="d-flex justify-content-between mt-4 shine-effect">
                <a href="${pageContext.request.contextPath}/RoomBooking/roomList.jsp"
                   class="btn btn-back">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </a>
                <button type="submit" class="btn btn-submit shine-effect">
                    <i class="fas fa-save "></i> Xác nhận đặt phòng
                </button>
            </div>
        </div>
    </form>
</div>
</body>
</html>