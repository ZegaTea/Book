/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.Constant;
import dao.BookDAO;
import dao.CategoryDAO;
import dao.LoginDAO;
import java.io.File;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pojo.Book;
import pojo.Category;

/**
 *
 * @author k3mshiro
 */
@Controller
@RequestMapping(value = "/admin/book")
public class BookController {
    
    @RequestMapping(value = "/bookmanagement")
    public String book_admin(ModelMap model, HttpServletRequest request){
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{
          List<Book> books = BookDAO.getAllBooks_admin();
        model.put("ListBook", books);
        model.put("ListCate", CategoryDAO.getAllCategory());
        
      return "book_admin"; 
       }
       
    }
     @RequestMapping(value = "/AddBook", method = RequestMethod.GET)
    public String themsanpham(ModelMap mm , @RequestParam(value = "err") String err, HttpServletRequest request) {
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{
         mm.put("ListCate", CategoryDAO.getAllCategory());        
         mm.put("err", err);
        return "Addbook_admin";
       }
    }

    @RequestMapping(value = "/AddBookPost", method = RequestMethod.POST)
    public String themsanpham1(@RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, ModelMap mm)  {
        String nameFile = commonsMultipartFiles.getOriginalFilename();
        System.out.println(nameFile);
        String URL="";
        if (!"".equals(nameFile)) {
            
            String dirFile = request.getServletContext().getRealPath("");
            System.out.println(dirFile);
            String thai = dirFile.replace("\\build\\web\\", "\\build\\web\\resources\\image\\BookImg");
            File fileDir = new File(thai);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            try {
                
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + nameFile));
                System.out.println("Upload file thành công!");
                //modelMap.addAttribute("filename", nameFile);
            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println("Upload file thất bại!");
            }
        } else {
            mm.put("err", "You need to import image");
            return "redirect:/admin/book/AddBook";

        }
        try{
            Float.parseFloat(request.getParameter("price"));
                }
        catch(NumberFormatException e){
            mm.put("err", "You need to import the number");
            return "redirect:/admin/book/AddBook";
        }
        try {
            Integer.parseInt(request.getParameter("pageNum"));
        }
        catch(NumberFormatException e){
            mm.put("err", "You need to import the number of page");
            return "redirect:/admin/book/AddBook";
        }
        if(request.getParameter("title")==""){
             mm.put("err", "You need to import the title");
            return "redirect:/admin/book/AddBook";
        }
        URL= "/WebsiteBook/resources/image/BookImg/"+ nameFile;
        Integer chapNum=null;
        try{
           chapNum= Integer.parseInt(request.getParameter("chapNum"));
        }
         catch(NumberFormatException e){
           chapNum=null; 
        }
        int check = BookDAO.addBook(request.getParameter("title"), Float.parseFloat(request.getParameter("price")),request.getParameter("author"),request.getParameter("publisher"),request.getParameter("description"),Integer.parseInt(request.getParameter("cate")),URL,chapNum,Integer.parseInt(request.getParameter("pageNum")));
        return "redirect:/admin/book/bookmanagement";
    }
    
     @RequestMapping(value = "/EditBook-{id}",method = RequestMethod.GET)
    public String suasanpham(ModelMap mm ,@PathVariable(value = "id") int id, @RequestParam(value = "err") String err, HttpServletRequest request) {
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{ 
        mm.put("ListCate", CategoryDAO.getAllCategory());
          Book book = BookDAO.getBookById(id);
        mm.put("BookDetails", book);
         mm.put("err", err);
        return "Editbook_admin";
       }
    }

    
    @RequestMapping(value = "/EditBookPost", method = RequestMethod.POST)
    public String suasanpham1(@RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, ModelMap mm)  {
        String nameFile = commonsMultipartFiles.getOriginalFilename();
        System.out.println(nameFile);
        String URL="";
        if (!"".equals(nameFile)) {
            
            String dirFile = request.getServletContext().getRealPath("");
            System.out.println(dirFile);
            String thai = dirFile.replace("\\build\\web\\", "\\build\\web\\resources\\image\\BookImg");
            File fileDir = new File(thai);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            try {
                
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + nameFile));
                System.out.println("Upload file thành công!");
                //modelMap.addAttribute("filename", nameFile);
            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println("Upload file thất bại!");
            }
            URL= "/WebsiteBook/resources/image/BookImg/"+ nameFile;
        } 
        else {
           URL= request.getParameter("image");
        }
         try{
            Float.parseFloat(request.getParameter("price"));
                }
        catch(NumberFormatException e){
            mm.put("err", "You need to import the number");
            return ("redirect:/admin/book/EditBook-"+request.getParameter("id"));
        }
        try {
            Integer.parseInt(request.getParameter("pageNum"));
        }
        catch(NumberFormatException e){
            mm.put("err", "You need to import the number of page");
             return ("redirect:/admin/book/EditBook-"+request.getParameter("id"));
        }
        if(request.getParameter("title").isEmpty()){
             mm.put("err", "You need to import the title");
             return("redirect:/admin/book/EditBook-"+request.getParameter("id"));
        }
      
        Integer chapNum=null;
        try{
           chapNum= Integer.parseInt(request.getParameter("chapNum"));
        }
         catch(NumberFormatException e){
           chapNum=null; 
        }
        int check = BookDAO.editBook(Integer.parseInt(request.getParameter("id")), request.getParameter("title"), Float.parseFloat(request.getParameter("price")),request.getParameter("author"),request.getParameter("publisher"),request.getParameter("description"),Integer.parseInt(request.getParameter("cate")),URL,chapNum,Integer.parseInt(request.getParameter("pageNum")));
        return "redirect:/admin/book/bookmanagement";
    }
      @RequestMapping("/DeleteBook/{id}")
    public String deletePrdoduct(@PathVariable(value = "id") Integer id) {
        int check=BookDAO.deleteBook(id);
        return "redirect:/admin/book/bookmanagement";
    }

}
