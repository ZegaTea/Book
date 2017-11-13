package pojo;
// Generated Nov 13, 2017 9:47:49 AM by Hibernate Tools 4.3.1



/**
 * CartDetail generated by hbm2java
 */
public class CartDetail  implements java.io.Serializable {


     private Integer id;
     private Integer bookId;
     private Integer cartId;
     private Integer count;
     private Float totalCount;

    public CartDetail() {
    }

    public CartDetail(Integer bookId, Integer cartId, Integer count, Float totalCount) {
       this.bookId = bookId;
       this.cartId = cartId;
       this.count = count;
       this.totalCount = totalCount;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getBookId() {
        return this.bookId;
    }
    
    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }
    public Integer getCartId() {
        return this.cartId;
    }
    
    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }
    public Integer getCount() {
        return this.count;
    }
    
    public void setCount(Integer count) {
        this.count = count;
    }
    public Float getTotalCount() {
        return this.totalCount;
    }
    
    public void setTotalCount(Float totalCount) {
        this.totalCount = totalCount;
    }




}


