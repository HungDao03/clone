package org.example.temporary.controller;

import org.example.temporary.dao.RoomBookingDAO;
import org.example.temporary.dao.RoomBookingDaoImpl;
import org.example.temporary.model.RoomBooking;
import org.example.temporary.service.RoomBookingService;
import org.example.temporary.service.RoomBookingServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "Controller", urlPatterns = "/main_roombooking")
public class RoomBookingController extends HttpServlet {
    private RoomBookingDAO roomBookingDAO;
    private RoomBookingService roomBookingService;


    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Tạo kết nối tới cơ sở dữ liệu
            String url = "jdbc:mysql://localhost:3306/fake_hotell";
            String username = "root";
            String password = "hikkiroku";


            Connection conn = DriverManager.getConnection(url, username, password);
            roomBookingDAO = new RoomBookingDaoImpl(conn);
            roomBookingService = new RoomBookingServiceImpl(roomBookingDAO);


        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Lỗi kết nối csdl hoặc service", e);
        }
    }


    // Xử lý yêu cầu GET: Lấy danh sách phòng booking trên CSDL về để truyền vào view jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            showListRoomBooking(request, response);
        } catch (ServletException er) {
            er.printStackTrace();
        } catch (IOException io) {
            io.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showListRoomBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<RoomBooking> roomsbookings = roomBookingService.getAllRooms();
            request.setAttribute("roomsbookings", roomsbookings);
            request.getRequestDispatcher("RoomBooking/listRoomBooking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể lấy data.");
            request.getRequestDispatcher("RoomBooking/listRoomBooking.jsp").forward(request, response);
        }
    }


    // Xử lý yêu cầu POST: Thêm phòng mới hoặc cập nhật phòng truyền từ jsp về csdl để thêm sửa xoá
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) { // Thêm mới một bản ghi đặt phòng
                // Lấy thông tin từ request
                String customerName = request.getParameter("customerName");
                int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                String roomLocation = request.getParameter("roomLocation");
                String roomDescription = request.getParameter("roomDescription");
                String roomImgLink = request.getParameter("roomImgLink");
                double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
                String roomStatus = request.getParameter("roomStatus");
                Timestamp bookingStartDate = Timestamp.valueOf(request.getParameter("bookingStartDate"));
                Timestamp bookingEndDate = Timestamp.valueOf(request.getParameter("bookingEndDate"));
                double bookingTotalPrice = Double.parseDouble(request.getParameter("bookingTotalPrice"));

                // Tạo đối tượng RoomBooking
                RoomBooking room = new RoomBooking(
                        0, // BookingId sẽ được tự động tạo trong cơ sở dữ liệu
                        customerName,
                        roomTypeId,
                        roomLocation,
                        roomDescription,
                        roomImgLink,
                        roomPrice,
                        roomStatus,
                        bookingStartDate,
                        bookingEndDate,
                        bookingTotalPrice
                );
                // Gọi service để thêm đặt phòng
                roomBookingService.updateRoom_DatPhong(customerName,bookingStartDate,bookingEndDate);

            } else if ("datphong".equals(action)) { // Cập nhật thông tin đặt phòng
                // Lấy thông tin từ request
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                String customerName = request.getParameter("customerName");
                int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                String roomLocation = request.getParameter("roomLocation");
                String roomDescription = request.getParameter("roomDescription");
                String roomImgLink = request.getParameter("roomImgLink");
                double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
                String roomStatus = request.getParameter("roomStatus");
                Timestamp bookingStartDate = Timestamp.valueOf(request.getParameter("bookingStartDate"));
                Timestamp bookingEndDate = Timestamp.valueOf(request.getParameter("bookingEndDate"));
                double bookingTotalPrice = Double.parseDouble(request.getParameter("bookingTotalPrice"));

                // Tạo đối tượng RoomBooking
                RoomBooking room = new RoomBooking(
                        bookingId,
                        customerName,
                        roomTypeId,
                        roomLocation,
                        roomDescription,
                        roomImgLink,
                        roomPrice,
                        roomStatus,
                        bookingStartDate,
                        bookingEndDate,
                        bookingTotalPrice
                );

                // Gọi service để cập nhật đặt phòng
                roomBookingService.updateRoom_DatPhong(customerName,bookingStartDate,bookingEndDate);

            } else if ("huyphong".equals(action)) { // Xóa đặt phòng
                String customerName = request.getParameter("customerName");
                roomBookingService.updateRoom_HuyPhong(customerName);
            }

            // Chuyển hướng về trang chính sau khi thao tác xong
            response.sendRedirect("/main_roombooking");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/error_page"); // Chuyển hướng đến trang lỗi nếu có ngoại lệ
        }
    }
}

