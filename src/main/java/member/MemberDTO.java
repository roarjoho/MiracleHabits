package member;

import java.sql.Timestamp;

public class MemberDTO {
    private String id,pass,name,email,address,address_detail,phone,mobile;
    private Timestamp date;
    private int postalNum;
    
//Getter-----------------------------------------------
    public String getId() {
        return id;
    }
    public String getPass() {
        return pass;
    }
    public String getName() {
        return name;
    }
    public String getEmail() {
        return email;
    }
    public String getAddress() {
        return address;
    }  
    public String getAddress_detail() {
        return address_detail;
    }
    public String getPhone() {
        return phone;
    }
    public String getMobile() {
        return mobile;
    }
    public Timestamp getDate() {
        return date;
    }
    public int getPostalNum() {
        return postalNum;
    }
    
//Setter----------------------------------------------------
    public void setId(String id) {
        this.id = id;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setAddress_detail(String address_detail) {
        this.address_detail = address_detail;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public void setDate(Timestamp date) {
        this.date = date;
    }
    public void setPostalNum(int postalNum) {
        this.postalNum = postalNum;
    }
    
}
