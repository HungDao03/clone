package org.example.temporary.service;

import org.example.temporary.model.RoomBooking;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public interface RoomBookingService {


    List<RoomBooking> getAllRooms();


    RoomBooking getRoomById(int roomId);


    RoomBooking getRoomByCode(String roomCode);

    boolean addRoom(RoomBooking room);


    boolean updateRoom(RoomBooking room);


    //phuong thuc thu nghiem
    boolean updateRoom(String roomCode, String customerName, String startTime, String endTime);

    boolean updateRoom_DatPhong(String customerName, Timestamp startTime, Timestamp endTime);

    boolean updateRoom_HuyPhong(String customerName);

    boolean deleteRoom(int roomId);
}
