package org.example.temporary.dao;

import org.example.temporary.model.RoomBooking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomBookingDaoImpl implements RoomBookingDAO {
    private Connection connection;

    public RoomBookingDaoImpl(Connection connection) {
        this.connection = connection;    // phương thức cần thiết để kết nối với cơ sở dữ liệu, cần phải có để thực hiện các câu truy vấn CSDL
    }

    public List<RoomBooking> selectAllRooms() throws SQLException {   //lấy thông tin trên CSDL về để nhét vào arraylist rooms.
        String query = "SELECT * FROM room";
        List<RoomBooking> rooms = new ArrayList<>();
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                RoomBooking room = new RoomBooking(
                        rs.getInt("RoomId"),
                        rs.getInt("RoomTypeId"),
                        rs.getInt("RoomOwner"),
                        rs.getString("RoomCode"),
                        rs.getString("RoomLocation"),
                        rs.getString("RoomDescription"),
                        rs.getString("RoomImgLink"),
                        rs.getDouble("RoomPrice"),
                        rs.getString("RoomStatus"),
                        rs.getTimestamp("RoomCreateDate"),
                        rs.getTimestamp("RoomUpdateDate")
                );
                rooms.add(room);
            }
        }
        return rooms;
    }

    public RoomBooking selectRoomById(int roomId) throws SQLException { // tìm roomID từ CSDL ở vị trí id thứ ? rồi lấy toàn bộ CSDL của dòng id ấy
        String query = "SELECT * FROM room WHERE room_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, roomId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new RoomBooking(
                            rs.getInt("RoomId"),
                            rs.getInt("RoomTypeId"),
                            rs.getInt("RoomOwner"),
                            rs.getString("RoomCode"),
                            rs.getString("RoomLocation"),
                            rs.getString("RoomDescription"),
                            rs.getString("RoomImgLink"),
                            rs.getDouble("RoomPrice"),
                            rs.getString("RoomStatus"),
                            rs.getTimestamp("RoomCreateDate"),
                            rs.getTimestamp("RoomUpdateDate")
                    );
                }
            }
        }
        return null;   //Đây là else if, nếu không có dữ liệu sau khi đã (rs.next) thì nó sẽ trả về null.
    }


    public RoomBooking selectRoomByCode(String roomCode) throws SQLException {
        // Truy vấn SQL để tìm phòng theo mã phòng
        String query = "SELECT * FROM room WHERE room_code = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            // Gán giá trị tham số roomCode vào câu lệnh SQL
            pstmt.setString(1, roomCode);
            try (ResultSet rs = pstmt.executeQuery()) {
                // Nếu tìm thấy kết quả, tạo và trả về đối tượng RoomBooking
                if (rs.next()) {
                    return new RoomBooking(
                            rs.getInt("RoomId"),
                            rs.getInt("RoomTypeId"),
                            rs.getInt("RoomOwner"),
                            rs.getString("RoomCode"),
                            rs.getString("RoomLocation"),
                            rs.getString("RoomDescription"),
                            rs.getString("RoomImgLink"),
                            rs.getDouble("RoomPrice"),
                            rs.getString("RoomStatus"),
                            rs.getTimestamp("RoomCreateDate"),
                            rs.getTimestamp("RoomUpdateDate")
                    );
                }
            }
        }
        // Trả về null nếu không tìm thấy phòng
        return null;
    }






    public boolean insertRoom(RoomBooking room) throws SQLException {   //Truyền room chứa những dữ liệu do người dùng cung cấp vào phương thức này rồi sau đó gửi room chứa những dữ liệu mới này lên CSDL
        String query = "INSERT INTO room (room_type_id, room_owner, room_code, room_location, room_description, room_img_link, room_price, room_status, room_create_date, room_update_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, room.getRoomTypeId());
            pstmt.setInt(2, room.getRoomOwner());
            pstmt.setString(3, room.getRoomCode());
            pstmt.setString(4, room.getRoomLocation());
            pstmt.setString(5, room.getRoomDescription());
            pstmt.setString(6, room.getRoomImgLink());
            pstmt.setDouble(7, room.getRoomPrice());
            pstmt.setString(8, room.getRoomStatus());
            pstmt.setTimestamp(9, room.getRoomCreateDate());
            pstmt.setTimestamp(10, room.getRoomUpdateDate());
            return pstmt.executeUpdate() > 0;
        }
    }

//thu nghiem Phương thức này cập nhật trạng thái của phòng dựa trên mã phòng (roomCode).
    public boolean updateRoomStatustoSql(String roomCode, String room_owner, Timestamp startime, Timestamp endTime) throws SQLException {
        String query = "UPDATE Room SET room_status = rented, room_owner = ?, room_update_date = ? WHERE room_code = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, room_owner);
            pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            pstmt.setString(3, roomCode);
            return pstmt.executeUpdate() > 0;
        }
    }
//thu nghiem Phương thức này sẽ nhận một đối tượng RoomBooking (hoặc thông tin cần thiết khác) để chèn thông tin đặt phòng vào cơ sở dữ liệu.
public boolean insertBookingToSql(String roomCode, String customerName, String startTime, String endTime) throws SQLException {
    String query = "INSERT INTO Booking (room_code, customer_name, start_time, end_time) VALUES (?, ?, ?, ?)";
    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setString(1, roomCode); // Đặt mã phòng
        pstmt.setString(2, customerName); // Đặt tên khách hàng
        pstmt.setTimestamp(3, Timestamp.valueOf(startTime)); // Chuyển startTime thành Timestamp
        pstmt.setTimestamp(4, Timestamp.valueOf(endTime)); // Chuyển endTime thành Timestamp
        return pstmt.executeUpdate() > 0; // Thực hiện truy vấn và kiểm tra kết quả
    }
}


    public boolean updateRoomtoSQL(RoomBooking room) throws SQLException { //sửa thông tin ở một ví trí nào đó trong CSDL
        String query = "UPDATE room SET BookingId = ?, Userid = ?, room_code = ?, room_location = ?, room_description = ?, room_img_link = ?, room_price = ?, room_status = ?, room_update_date = ? WHERE room_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, room.getRoomTypeId());
            pstmt.setInt(2, room.getRoomOwner());
            pstmt.setString(3, room.getRoomCode());
            pstmt.setString(4, room.getRoomLocation());
            pstmt.setString(5, room.getRoomDescription());
            pstmt.setString(6, room.getRoomImgLink());
            pstmt.setDouble(7, room.getRoomPrice());
            pstmt.setString(8, room.getRoomStatus());
            pstmt.setTimestamp(9, room.getRoomUpdateDate());
            pstmt.setInt(10, room.getRoomId());
            return pstmt.executeUpdate() > 0; //Phương thức trả về số lượng số nguyên đại diện cho số dòng bị thay đổi dữ liệu, trong trường hợp này nếu > 0 tức là đã có hơn 1 dòng bị thay đổi, nếu =0 tức là không có dòng nào bị thay đổi.
        }
    }

    public boolean deleteRoomtoSQL(int bookingId) throws SQLException {
        String query = "DELETE FROM booking WHERE BookingId = ? AND Bookingtatus = 'available'";  //Chỉ các bản ghi có cột room_status có giá trị available mới được phép xóa.
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, bookingId);
            return pstmt.executeUpdate() > 0;
        }
    }
}
