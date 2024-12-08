<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Đặt Phòng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <style>
        :root {
            --white: #FCFCFC;
            --gray: #CBCDD3;
            --dark: #777777;
            --success: #B0DB7D;
            --secondary: #99DBB4;
        }

        html, body {
            min-height: 100%;
            font-family: 'Lato', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            overflow-x: hidden;
        }

        .container {
            position: relative;
            max-width: 1000px;
            margin: 50px auto;
        }

        .booking-success {
            background: linear-gradient(to bottom right, var(--success) 40%, var(--secondary) 100%);
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
            transform: translateY(30px);
            opacity: 0;
            animation: slideUp 0.8s ease-out forwards;
        }

        .success-icon {
            position: relative;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: white;
            margin: 0 auto 20px;
            animation: bounce 1s ease-in infinite;
        }

        .success-icon::before {
            content: '';
            position: absolute;
            top: 45%;
            left: 25%;
            width: 40%;
            height: 20%;
            border: 3px solid var(--dark);
            border-top: 0;
            border-right: 0;
            transform: rotate(-45deg);
        }


        .alert-heading {
            font-size: 2.2rem;
            font-weight: 700;
            color: white;
            text-transform: uppercase;
            margin: 1.5rem 0;
            padding: 0.5rem 1rem;
            border: 3px solid white;
            display: inline-block;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            letter-spacing: 1px;
        }

        .text-white {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 2rem;
        }


        .booking-details {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            margin-top: 2rem;
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.8s ease-out 0.3s forwards;
        }

        .room-image {
            position: relative;
            overflow: hidden;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.8s ease-out 0.6s forwards;
        }

        .room-image img {
            transition: transform 0.5s ease;
        }

        .room-image:hover img {
            transform: scale(1.05);
        }

        .booking-id {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255,255,255,0.95);
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            font-size: 1.1em;
            font-weight: 600;
            transform: translateX(100px);
            opacity: 0;
            animation: slideLeft 0.8s ease-out 0.9s forwards;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .info-item {
            margin: 15px 0;
            padding: 15px;
            border-radius: 12px;
            background: rgba(255,255,255,0.7);
            transform: translateX(-50px);
            opacity: 0;
            animation: slideRight 0.5s ease-out forwards;
            font-size: 1.1rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }


        .info-item strong {
            font-weight: 700;
            color: #444;
            margin-right: 10px;
        }


        .info-item:nth-child(1) { animation-delay: 0.4s; }
        .info-item:nth-child(2) { animation-delay: 0.6s; }
        .info-item:nth-child(3) { animation-delay: 0.8s; }
        .info-item:nth-child(4) { animation-delay: 1s; }

        .btn-return {
            background: white;
            border: none;
            padding: 15px 35px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 1.1rem;
            letter-spacing: 1.5px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.8s ease-out 1.2s forwards;
            text-transform: uppercase;
        }

        .btn-return:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            background: var(--secondary);
            color: white;
        }

        @keyframes bounce {
            50% { transform: translateY(-10px); }
        }

        @keyframes slideUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideLeft {
            from {
                transform: translateX(100px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideRight {
            from {
                transform: translateX(-50px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* Floating particles animation */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            width: 10px;
            height: 10px;
            background: rgba(255,255,255,0.5);
            border-radius: 50%;
            animation: float 4s infinite;
        }


        .room-image {
            position: relative;
            overflow: hidden;
            border-radius: 15px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.15);
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.8s ease-out 0.6s forwards;
        }

        /* Các animation giữ nguyên */
        @keyframes bounce {
            50% { transform: translateY(-10px); }
        }

        @keyframes slideUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideLeft {
            from {
                transform: translateX(100px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideRight {
            from {
                transform: translateX(-50px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

    </style>
</head>
<body>
<div class="container">
    <div class="booking-success text-center">
        <!-- Floating particles -->
        <div class="particles">
            <script>
                for(let i = 0; i < 20; i++) {
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    particle.style.left = Math.random() * 100 + '%';
                    particle.style.top = Math.random() * 100 + '%';
                    particle.style.animationDelay = Math.random() * 4 + 's';
                    document.querySelector('.particles').appendChild(particle);
                }
            </script>
        </div>

        <div class="success-icon"></div>



        <h4 class="alert-heading">Đặt phòng thành công!</h4>
        <p class="text-white">Thông tin đặt phòng vừa được xác nhận.</p>
        <div class="booking-id">Mã đặt phòng: ${param.bookingId}</div>

        <div class="booking-details">
            <div class="row">
                <div class="col-md-6">
                    <div class="info-item">
                        <strong>Tên khách hàng:</strong> ${param.customerName}
                    </div>
                    <div class="info-item">
                        <strong>Thời gian bắt đầu:</strong> ${param.startTime}
                    </div>
                    <div class="info-item">
                        <strong>Thời gian kết thúc:</strong> ${param.endTime}
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="room-image">
                        <img src="${param.roomImgLink}" alt="Room Image"
                             class="img-fluid"
                             onerror="this.src='https://via.placeholder.com/400x300?text=No+Image+Available'">
                    </div>
                </div>
            </div>
        </div>

        <a href="${pageContext.request.contextPath}/main_roombooking" class="btn btn-return mt-4">
            Quay lại danh sách phòng
        </a>
    </div>
</div>

<script>
    // Add floating animation
    document.addEventListener('DOMContentLoaded', function() {
        const particles = document.querySelectorAll('.particle');
        particles.forEach(particle => {
            particle.style.animation = `float ${3 + Math.random() * 4}s ease-in-out infinite`;
        });
    });
</script>
</body>
</html>