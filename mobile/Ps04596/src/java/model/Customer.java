
package model;


public class Customer {
    private String username;
    private String password;
    private boolean gioitinh;
    private String hoten;
    private String email;

    public Customer() {
    }

    public Customer(String username, String password,boolean gioitinh, String hoten, String email) {
        this.username = username;
        this.password = password;
        this.gioitinh = gioitinh;
        this.hoten = hoten;
        this.email = email;
    }

    public boolean isGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(boolean gioitinh) {
        this.gioitinh = gioitinh;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
