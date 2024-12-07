package org.example.temporary.service;

//import controller.RoomBooking;
import org.example.temporary.dao.RoomBookingDAO;
import org.example.temporary.model.RoomBooking;

import java.sql.SQLException;
import java.util.List;

public class RoomBookingServiceImpl implements RoomBookingService {

    private final RoomBookingDAO roomBookingDAO;

    public RoomBookingServiceImpl(RoomBookingDAO roomBookingDAO) {
        this.roomBookingDAO = roomBookingDAO;
    }  //RoomService không trực tiếp quản lý Connection, mà chỉ sử dụng DAO để thực hiện các tác vụ.

    @Override
    public List<RoomBooking> getAllRooms() {
        try {
            return roomBookingDAO.selectAllRooms();
        } catch (SQLException e) {
            e.printStackTrace();
            return null; // Trả về null nếu có lỗi xảy ra
        }
    }

    @Override
    public RoomBooking getRoomById(int roomId) {
        try {
            return roomBookingDAO.selectRoomById(roomId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    @Override
    public boolean addRoom(RoomBooking room) {
        try {
            return roomBookingDAO.insertRoom(room);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateRoom(RoomBooking room) {
        try {
            return roomBookingDAO.updateRoomtoSQL(room);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteRoom(int roomId) {
        try {
            return roomBookingDAO.deleteRoomtoSQL(roomId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

