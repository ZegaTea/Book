package pojo;
// Generated Dec 15, 2017 12:20:35 AM by Hibernate Tools 4.3.1



/**
 * Book generated by hbm2java
 */
public class Book  implements java.io.Serializable {


     private Integer id;
     private String title;
     private Float price;
     private String author;
     private String publisher;
     private String description;
     private Integer categoryId;
     private String imageLink;
     private Integer chapterNum;
     private Integer numOfBooks;

    public Book() {
    }

    public Book(String title, Float price, String author, String publisher, String description, Integer categoryId, String imageLink, Integer chapterNum, Integer numOfBooks) {
       this.title = title;
       this.price = price;
       this.author = author;
       this.publisher = publisher;
       this.description = description;
       this.categoryId = categoryId;
       this.imageLink = imageLink;
       this.chapterNum = chapterNum;
       this.numOfBooks = numOfBooks;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public Float getPrice() {
        return this.price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }
    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getPublisher() {
        return this.publisher;
    }
    
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Integer getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getImageLink() {
        return this.imageLink;
    }
    
    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
    public Integer getChapterNum() {
        return this.chapterNum;
    }
    
    public void setChapterNum(Integer chapterNum) {
        this.chapterNum = chapterNum;
    }
    public Integer getNumOfBooks() {
        return this.numOfBooks;
    }
    
    public void setNumOfBooks(Integer numOfBooks) {
        this.numOfBooks = numOfBooks;
    }




}


