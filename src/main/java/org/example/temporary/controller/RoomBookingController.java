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
            showListRoomBooking(request,response);
        } catch (ServletException er) {
            er.printStackTrace();
        } catch (IOException io) {
            io.printStackTrace();
        }
        catch (Exception e) {
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
            request.setAttribute("errorMessage", "Không thể lấy danh sách phòng.");
            request.getRequestDispatcher("RoomBooking/listRoomBooking.jsp").forward(request, response);
        }
    }










    // Xử lý yêu cầu POST: Thêm phòng mới hoặc cập nhật phòng truyền từ jsp về csdl để thêm sửa xoá
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        //action dùng để lấy thông tin của thẻ 'action'
        if ("add".equals(action)) {  // tức là sẽ so sánh với value trong <input type="hidden" name="action" value="add">
            RoomBooking room = new RoomBooking();
            room.setRoomCode(request.getParameter("code"));  // Dùng ở  <label for="code">Room Code:</label>
            room.setRoomDescription(request.getParameter("description"));
            room.setRoomImgLink(request.getParameter("imgLink"));
            room.setRoomPrice(Double.parseDouble(request.getParameter("price")));
            room.setRoomStatus(request.getParameter("status"));
            roomBookingService.addRoom(room);  //lấy thông tin nhập trong form về để truyền vào csdl
        } else if ("update".equals(action)) {
            RoomBooking room = new RoomBooking();
            room.setRoomId(Integer.parseInt(request.getParameter("id")));
            room.setRoomDescription(request.getParameter("description"));
            room.setRoomImgLink(request.getParameter("imgLink"));
            room.setRoomPrice(Double.parseDouble(request.getParameter("price")));
            room.setRoomStatus(request.getParameter("status"));
            roomBookingService.updateRoom(room); //lấy thông tin nhập trong form về để sửa room trong csdl
        } else if ("delete".equals(action)) {
            int roomId = Integer.parseInt(request.getParameter("id"));
            roomBookingService.deleteRoom(roomId); //lấy ví trí thứ id nhập trong form về để xoa room trong csdl
        }

        response.sendRedirect("/main_roombooking");  // sau khi thực hiện thao tác thêm sửa xoá xong thì sẽ trả người dùng về trang chủ của bookingroom
    }
}
