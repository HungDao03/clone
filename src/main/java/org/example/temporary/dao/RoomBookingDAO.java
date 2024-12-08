package org.example.temporary.dao;

import org.example.temporary.model.RoomBooking;

import java.util.List;


import java.sql.SQLException;

public interface RoomBookingDAO {

    List<RoomBooking> selectAllRooms() throws SQLException;

    RoomBooking selectRoomById(int roomId) throws SQLException;


    RoomBooking selectRoomByCode(String roomCode) throws SQLException;


    boolean insertRoom(RoomBooking room) throws SQLException;


    boolean updateRoomtoSQL(RoomBooking room) throws SQLException;


    //thu nghiem
    public boolean updateRoomStatustoSql(String roomCode, String status) throws SQLException;

    //thu nghiem
    public boolean insertBookingToSql(String roomCode, String customerName, String startTime, String endTime) throws SQLException;


    boolean deleteRoomtoSQL(int roomId) throws SQLException;
}

