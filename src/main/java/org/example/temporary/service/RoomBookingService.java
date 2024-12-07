package org.example.temporary.service;

import org.example.temporary.model.RoomBooking;

import java.util.List;

public interface RoomBookingService {


    List<RoomBooking> getAllRooms();


    RoomBooking getRoomById(int roomId);


    RoomBooking getRoomByCode(String roomCode);

    boolean addRoom(RoomBooking room);


    boolean updateRoom(RoomBooking room);


    boolean deleteRoom(int roomId);
}
