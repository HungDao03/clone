package org.example.temporary.controller;



import org.example.temporary.dao.RoomBookingDAO;
import org.example.temporary.dao.RoomBookingDaoImpl;
import org.example.temporary.model.RoomBooking;
import org.example.temporary.service.RoomBookingService;
import org.example.temporary.service.RoomBookingServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RoomRentFormController", urlPatterns = "/rentRoomForm")
public class RoomRentFormController extends HttpServlet {
    private RoomBookingDAO roomrentBookingDAO;
    private RoomBookingService roomrentBookingService;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Tạo kết nối tới cơ sở dữ liệu
            String url = "jdbc:mysql://localhost:3306/fake_hotell";
            String username = "root";
            String password = "hikkiroku";


            Connection conn = DriverManager.getConnection(url, username, password);
            roomrentBookingDAO = new RoomBookingDaoImpl(conn);
            roomrentBookingService = new RoomBookingServiceImpl(roomrentBookingDAO);


        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Lỗi kết nối csdl hoặc service", e);
        }
    }

    // Xử lý yêu cầu GET: Lấy trên CSDL về để truyền vào view jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            showRentRoomForm(request,response);
        } catch (ServletException er) {
            er.printStackTrace();
        } catch (IOException io) {
            io.printStackTrace();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void showRentRoomForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<RoomBooking> roomsrentForm = roomrentBookingService.getAllRooms();
            request.setAttribute("roomsrentForm", roomsrentForm);
            request.getRequestDispatcher("RoomBooking/rentRoomForm_Temporary.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể lấy danh sách phòng.");
            request.getRequestDispatcher("RoomBooking/rentRoomForm_Temporary.jsp").forward(request, response);
        }
    }

}

