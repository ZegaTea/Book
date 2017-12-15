package pojo;
// Generated Dec 15, 2017 12:20:35 AM by Hibernate Tools 4.3.1



/**
 * Cart generated by hbm2java
 */
public class Cart  implements java.io.Serializable {


     private Integer id;
     private Float totalPrice;
     private Integer userId;
     private Long orderDate;
     private Long deliveryDate;
     private Integer status;
     private String phoneNumber;
     private String address;
     private String email;

    public Cart() {
    }

    public Cart(Float totalPrice, Integer userId, Long orderDate, Long deliveryDate, Integer status, String phoneNumber, String address, String email) {
       this.totalPrice = totalPrice;
       this.userId = userId;
       this.orderDate = orderDate;
       this.deliveryDate = deliveryDate;
       this.status = status;
       this.phoneNumber = phoneNumber;
       this.address = address;
       this.email = email;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Float getTotalPrice() {
        return this.totalPrice;
    }
    
    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public Long getOrderDate() {
        return this.orderDate;
    }
    
    public void setOrderDate(Long orderDate) {
        this.orderDate = orderDate;
    }
    public Long getDeliveryDate() {
        return this.deliveryDate;
    }
    
    public void setDeliveryDate(Long deliveryDate) {
        this.deliveryDate = deliveryDate;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }




}


