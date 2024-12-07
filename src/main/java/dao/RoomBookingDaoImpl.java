package dao;

import model.RoomBooking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomBookingDaoImpl implements RoomBookingDAO {
    private Connection connection;

    public RoomBookingDaoImpl(Connection connection) {
        this.connection = connection;    // phương thức cần thiết để kết nối với cơ sở dữ liệu, cần phải có để thực hiện các câu truy vấn CSDL
    }

    public List<RoomBooking> selectAllRooms() throws SQLException {   //lấy thông tin trên CSDL về để nhét vào arraylist rooms.
        String query = "SELECT * FROM rooms";
        List<RoomBooking> rooms = new ArrayList<>();
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                RoomBooking room = new RoomBooking(
                        rs.getInt("room_id"),
                        rs.getInt("room_type_id"),
                        rs.getInt("room_owner"),
                        rs.getString("room_code"),
                        rs.getString("room_location"),
                        rs.getString("room_description"),
                        rs.getString("room_img_link"),
                        rs.getDouble("room_price"),
                        rs.getString("room_status"),
                        rs.getTimestamp("room_create_date"),
                        rs.getTimestamp("room_update_date")
                );
                rooms.add(room);
            }
        }
        return rooms;
    }

    public RoomBooking selectRoomById(int roomId) throws SQLException { // tìm roomID từ CSDL ở vị trí id thứ ? rồi lấy toàn bộ CSDL của dòng id ấy
        String query = "SELECT * FROM rooms WHERE room_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, roomId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new RoomBooking(
                            rs.getInt("room_id"),
                            rs.getInt("room_type_id"),
                            rs.getInt("room_owner"),
                            rs.getString("room_code"),
                            rs.getString("room_location"),
                            rs.getString("room_description"),
                            rs.getString("room_img_link"),
                            rs.getDouble("room_price"),
                            rs.getString("room_status"),
                            rs.getTimestamp("room_create_date"),
                            rs.getTimestamp("room_update_date")
                    );
                }
            }
        }
        return null;   //Đây là else if, nếu không có dữ liệu sau khi đã (rs.next) thì nó sẽ trả về null.
    }

    public boolean insertRoom(RoomBooking room) throws SQLException {   //Truyền room chứa những dữ liệu do người dùng cung cấp vào phương thức này rồi sau đó gửi room chứa những dữ liệu mới này lên CSDL
        String query = "INSERT INTO rooms (room_type_id, room_owner, room_code, room_location, room_description, room_img_link, room_price, room_status, room_create_date, room_update_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

    public boolean updateRoomtoSQL(RoomBooking room) throws SQLException { //sửa thông tin ở một ví trí nào đó trong CSDL
        String query = "UPDATE rooms SET room_type_id = ?, room_owner = ?, room_code = ?, room_location = ?, room_description = ?, room_img_link = ?, room_price = ?, room_status = ?, room_update_date = ? WHERE room_id = ?";
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

    public boolean deleteRoomtoSQL(int roomId) throws SQLException {
        String query = "DELETE FROM rooms WHERE room_id = ? AND room_status = 'available'";  //Chỉ các bản ghi có cột room_status có giá trị available mới được phép xóa.
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, roomId);
            return pstmt.executeUpdate() > 0;
        }
    }
}
