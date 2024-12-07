<%--
  Created by IntelliJ IDEA.
  User: Mr Loc
  Date: 12/7/2024
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Montserrat', sans-serif;
            font-size: 16px;
            min-height: 100vh;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2.5rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 1.5rem 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .page-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .container-fluid {
            padding: 0 2rem;
        }

        .card {
            border: none;
            border-radius: 1.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            background: white;
            padding: 1.5rem;
            margin: 0 1rem;
        }

        .table {
            margin-bottom: 0;
            font-size: 1.1rem;
        }

        .table thead th {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 1.2rem 1rem;
            font-weight: 600;
            font-size: 1.2rem;
            white-space: nowrap;
        }

        .table tbody td {
            padding: 1.2rem 1rem;
            vertical-align: middle;
            font-size: 1.1rem;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.02);
        }

        .btn {
            border-radius: 0.5rem;
            padding: 0.7rem 1.2rem;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 1rem;
            letter-spacing: 0.5px;
            margin: 0.25rem;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }

        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: #e74c3c;
            border-color: #e74c3c;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #c0392b;
            transform: translateY(-1px);
        }

        .alert {
            border-radius: 0.5rem;
            border: none;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }

        .room-status {
            padding: 0.7rem 1.2rem;
            border-radius: 2rem;
            font-weight: 600;
            text-align: center;
            display: inline-block;
            min-width: 120px;
            font-size: 1rem;
        }

        .status-available {
            background-color: #2ecc71;
            color: white;
        }

        .status-occupied {
            background-color: #e74c3c;
            color: white;
        }

        .price {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.2rem;
        }

        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        @media (min-width: 1400px) {
            .container-fluid {
                max-width: 1920px;
                margin: 0 auto;
            }
        }

        /* Tối ưu cho màn hình nhỏ */
        @media (max-width: 768px) {
            .btn {
                width: 100%;
                margin: 0.25rem 0;
            }

            .page-header h1 {
                font-size: 2rem;
            }

            .table {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="page-header">
    <div class="container-fluid">
        <h1 class="text-center mb-0">
            <i class="fas fa-hotel me-2"></i>
            Danh sách phòng
        </h1>
    </div>
</div>

<div class="container-fluid">
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
                ${errorMessage}
        </div>
    </c:if>

    <div class="card">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th><i class="fas fa-hashtag me-2"></i>Mã phòng</th>
                    <th><i class="fas fa-info-circle me-2"></i>Mô tả phòng</th>
                    <th><i class="fas fa-image me-2"></i>Ảnh</th>
                    <th><i class="fas fa-tag me-2"></i>Giá phòng</th>
                    <th><i class="fas fa-clock me-2"></i>Trạng thái</th>
                    <th><i class="fas fa-user me-2"></i>Khách hàng đang thuê</th>
                    <th><i class="fas fa-map-marker-alt me-2"></i>Vị trí</th>
                    <th><i class="fas fa-cogs me-2"></i>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="roombookingsVar" items="${roomsbookings}">
                    <tr>
                        <td><strong>${roombookingsVar.roomCode}</strong></td>
                        <td>${roombookingsVar.roomDescription}</td>

                        <td>
                            <img src="${roombookingsVar.roomImgLink}" alt="Room Image" width="50" height="50" class="img-thumbnail">
                        </td>

                        <td class="price">${roombookingsVar.roomPrice} VNĐ</td>


                        <td>
                                    <span class="room-status ${roombookingsVar.roomStatus == 'Available' ? 'status-available' : 'status-occupied'}">
                                            ${roombookingsVar.roomStatus}
                                    </span>
                        </td>


                        <td>${roombookingsVar.roomOwner}</td>
                        <td>${roombookingsVar.roomLocation}</td>

<%--                       phai bo sung accept-charset="UTF-8, khong thi se bị loi font--%>
                        <td>
                            <form action="${pageContext.request.contextPath}/RoomBooking/rentRoomForm_Temporary.jsp" method="POST"   accept-charset="UTF-8" class="d-inline">

                                <input type="hidden" name="roomCode" value="${roombookingsVar.roomCode}">
<%--                                <input type="hidden" name="roomDescription" value="${roombookingsVar.roomDescription}">--%>
                                <input type="hidden" name="roomDescription" value="<c:out value="${fn:escapeXml(roombookingsVar.roomDescription)}" />">



                                <input type="hidden" name="roomImgLink" value="${roombookingsVar.roomImgLink}">
                                <input type="hidden" name="roomPrice" value="${roombookingsVar.roomPrice}">
                                <input type="hidden" name="roomLocation" value="${roombookingsVar.roomLocation}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-key me-1"></i> Cho thuê
                                </button>
                            </form>
                            <form action="${pageContext.request.contextPath}/RoomBooking/returnRoom.jsp" method="POST" class="d-inline">
                                <input type="hidden" name="roomCode" value="${roombookingsVar.roomCode}">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fas fa-undo-alt me-1"></i> Trả phòng
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>