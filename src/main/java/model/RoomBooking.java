package model;



import java.sql.Timestamp;

public class RoomBooking {
    private int roomId; // RoomId
    private int roomTypeId; // RoomTypeId
    private int roomOwner; // RoomOwner
    private String roomCode; // RoomCode
    private String roomLocation; // RoomLocation
    private String roomDescription; // RoomDescription
    private String roomImgLink; // RoomImgLink
    private double roomPrice; // RoomPrice
    private String roomStatus; // 'available' or 'rented'
    private Timestamp roomCreateDate; // RoomCreateDate
    private Timestamp roomUpdateDate; // RoomUpdateDate

    public RoomBooking() {};
    public RoomBooking(int roomId, int roomTypeId, int roomOwner, String roomCode, String roomLocation, String roomDescription, String roomImgLink, double roomPrice, String roomStatus, Timestamp roomCreateDate, Timestamp roomUpdateDate) {
        this.roomId = roomId;
        this.roomTypeId = roomTypeId;
        this.roomOwner = roomOwner;
        this.roomCode = roomCode;
        this.roomLocation = roomLocation;
        this.roomDescription = roomDescription;
        this.roomImgLink = roomImgLink;
        this.roomPrice = roomPrice;
        this.roomStatus = roomStatus;
        this.roomCreateDate = roomCreateDate;
        this.roomUpdateDate = roomUpdateDate;
    }

    // Getters and Setters
    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public int getRoomOwner() {
        return roomOwner;
    }

    public void setRoomOwner(int roomOwner) {
        this.roomOwner = roomOwner;
    }

    public String getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(String roomCode) {
        this.roomCode = roomCode;
    }

    public String getRoomLocation() {
        return roomLocation;
    }

    public void setRoomLocation(String roomLocation) {
        this.roomLocation = roomLocation;
    }

    public String getRoomDescription() {
        return roomDescription;
    }

    public void setRoomDescription(String roomDescription) {
        this.roomDescription = roomDescription;
    }

    public String getRoomImgLink() {
        return roomImgLink;
    }

    public void setRoomImgLink(String roomImgLink) {
        this.roomImgLink = roomImgLink;
    }

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    public Timestamp getRoomCreateDate() {
        return roomCreateDate;
    }

    public void setRoomCreateDate(Timestamp roomCreateDate) {
        this.roomCreateDate = roomCreateDate;
    }

    public Timestamp getRoomUpdateDate() {
        return roomUpdateDate;
    }

    public void setRoomUpdateDate(Timestamp roomUpdateDate) {
        this.roomUpdateDate = roomUpdateDate;
    }
}

