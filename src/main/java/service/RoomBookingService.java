package service;

import model.RoomBooking;

import java.util.List;

public interface RoomBookingService {


    List<RoomBooking> getAllRooms();


    RoomBooking getRoomById(int roomId);

    boolean addRoom(RoomBooking room);


    boolean updateRoom(RoomBooking room);


    boolean deleteRoom(int roomId);
}
