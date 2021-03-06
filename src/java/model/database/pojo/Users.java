package model.database.pojo;
// Generated Apr 19, 2018 11:52:07 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private Integer userId;
     private Role role;
     private byte isGoogleLogin;
     private byte isFacebookLogin;
     private Date modifiedDate;
     private Logininfo logininfo;
     private Userinfo userinfo;

    public Users() {
    }

	
    public Users(Role role, byte isGoogleLogin, byte isFacebookLogin, Date modifiedDate) {
        this.role = role;
        this.isGoogleLogin = isGoogleLogin;
        this.isFacebookLogin = isFacebookLogin;
        this.modifiedDate = modifiedDate;
    }
    public Users(Role role, byte isGoogleLogin, byte isFacebookLogin, Date modifiedDate, Logininfo logininfo, Userinfo userinfo) {
       this.role = role;
       this.isGoogleLogin = isGoogleLogin;
       this.isFacebookLogin = isFacebookLogin;
       this.modifiedDate = modifiedDate;
       this.logininfo = logininfo;
       this.userinfo = userinfo;
    }
   
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    public byte getIsGoogleLogin() {
        return this.isGoogleLogin;
    }
    
    public void setIsGoogleLogin(byte isGoogleLogin) {
        this.isGoogleLogin = isGoogleLogin;
    }
    public byte getIsFacebookLogin() {
        return this.isFacebookLogin;
    }
    
    public void setIsFacebookLogin(byte isFacebookLogin) {
        this.isFacebookLogin = isFacebookLogin;
    }
    public Date getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    public Logininfo getLogininfo() {
        return this.logininfo;
    }
    
    public void setLogininfo(Logininfo logininfo) {
        this.logininfo = logininfo;
    }
    public Userinfo getUserinfo() {
        return this.userinfo;
    }
    
    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }




}


