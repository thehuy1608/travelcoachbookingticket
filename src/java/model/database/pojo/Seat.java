package model.database.pojo;
// Generated Apr 19, 2018 11:52:07 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Seat generated by hbm2java
 */
public class Seat  implements java.io.Serializable {


     private Integer seatId;
     private Long version;
     private Coach coach;
     private byte seatNumber;
     private byte seatStatus;
     private String seatDescription;
     private Date modifiedDate;
     
     public Seat() {
         
     }
	
    public Seat(Coach coach, byte seatNumber, byte seatStatus, Date modifiedDate) {
        this.coach = coach;
        this.seatNumber = seatNumber;
        this.seatStatus = seatStatus;
        this.modifiedDate = modifiedDate;
    }
    public Seat(Coach coach, byte seatNumber, byte seatStatus, String seatDescription, Date modifiedDate) {
       this.coach = coach;
       this.seatNumber = seatNumber;
       this.seatStatus = seatStatus;
       this.seatDescription = seatDescription;
       this.modifiedDate = modifiedDate;
    }
   
    public Integer getSeatId() {
        return this.seatId;
    }
    
    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }
    public Long getVersion() {
        return this.version;
    }
    
    public void setVersion(Long version) {
        this.version = version;
    }
    public Coach getCoach() {
        return this.coach;
    }
    
    public void setCoach(Coach coach) {
        this.coach = coach;
    }
    public byte getSeatNumber() {
        return this.seatNumber;
    }
    
    public void setSeatNumber(byte seatNumber) {
        this.seatNumber = seatNumber;
    }
    public byte getSeatStatus() {
        return this.seatStatus;
    }
    
    public void setSeatStatus(byte seatStatus) {
        this.seatStatus = seatStatus;
    }
    public String getSeatDescription() {
        return this.seatDescription;
    }
    
    public void setSeatDescription(String seatDescription) {
        this.seatDescription = seatDescription;
    }
    public Date getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }




}


