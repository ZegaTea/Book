/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dto.BookCartDTO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pojo.Book;
import common.*;
import dao.CartDAO;
import dao.CartDetailDAO;
import java.util.stream.Collectors;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Cart;
import pojo.CartDetail;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/cart")
public class CartController {

    @RequestMapping(value = "/add-id={bookId}-quantity={quantity}", method = RequestMethod.GET)
    public String addCart(HttpServletRequest request, @PathVariable(value = "bookId") int bookId
            , @PathVariable(value = "quantity") int quantity) {
        
        saveSessionCart(bookId, quantity, request);
            
        return "redirect:/home/index";
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addCartWithQuantity(HttpServletRequest request, @RequestParam(value = "id") int bookId
            , @RequestParam(value = "quantity") int quantity) {
        
        saveSessionCart(bookId, quantity, request);
            
        return "redirect:/home/index";
    }
    
    public  void saveSessionCart(int bookId, int quantity, HttpServletRequest request){
        Book book = BookDAO.getBookById(bookId);
        BookCartDTO bc = new BookCartDTO(book.getId(), book.getImageLink(), book.getTitle(), book.getPrice(), quantity);
        HttpSession session = request.getSession();
        List<BookCartDTO> cart;
        if (session.getAttribute(Constant.CART_SESSION) == null) {
            cart = new ArrayList<>();
            cart.add(bc);
        } else {
            cart = (ArrayList<BookCartDTO>) session.getAttribute(Constant.CART_SESSION);
            int state = 0;
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getId() == book.getId()) {
                    int totalQuantities = cart.get(i).getQuantity() + quantity;
                    bc.setQuantity(totalQuantities);
                    cart.set(i, bc);
                    state = 1;
                    break;
                }
            }
            if (state == 0) {
                cart.add(bc);
            }
        }
        
        session.setAttribute(Constant.CART_SESSION, cart);
//        RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
//        response.setAttribute("
//        rd.forward(request, response);
        session.setAttribute("check", "true");
    }
    
    
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(ModelMap mm, HttpServletRequest request) {
        List<BookCartDTO> cart;
        HttpSession session = request.getSession();
        if (session.getAttribute(Constant.CART_SESSION) == null) {
            cart = new ArrayList<>();
        } else {
            cart = (ArrayList<BookCartDTO>) session.getAttribute(Constant.CART_SESSION);
        }

        mm.put("CartBook", cart);
        return "cart";
    }
    @RequestMapping(value = "/remove-{id}", method = RequestMethod.GET)
    public String remove(@PathVariable(value = "id") int id, HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        List<BookCartDTO> cart = (ArrayList<BookCartDTO>) session.getAttribute(Constant.CART_SESSION);
        
        cart = cart.stream()
                .filter(x -> x.getId() != id)
                .collect(Collectors.toList());
        session.setAttribute(Constant.CART_SESSION, cart);
        return "redirect:/cart/detail";
    }
    
    @RequestMapping(value = "/checkout" , method = RequestMethod.POST)
    public String checkout(HttpServletRequest httpServletRequest) {
        HttpSession session = httpServletRequest.getSession();
        
        List<BookCartDTO> cart ;
        if (session.getAttribute(Constant.CART_SESSION) != null) {
            cart = (ArrayList<BookCartDTO>) session.getAttribute(common.Constant.CART_SESSION);
            
            float cost = cart.stream()
                    .map(x -> (x.getPrice() * x.getQuantity()))
                    .reduce(0f, (a,b) -> a+b);
            Cart c = new Cart();
            c.setTotalPrice(cost);
            CartDAO cartDAO = new CartDAO();
            int id = cartDAO.saveToCart(c);
            
            
            CartDetailDAO cartDetailDAO = new CartDetailDAO();
            for(BookCartDTO item : cart){
                CartDetail detail = new CartDetail();
                detail.setCartId(id);
                detail.setBookId(item.getId());
                detail.setCount(item.getQuantity());
                detail.setTotalCount(item.getPrice() * item.getQuantity());
                
                cartDetailDAO.saveToCartDetail(id, detail);
            }
        }
        session.removeAttribute(Constant.CART_SESSION);
        session.setAttribute(Constant.CHECKOUT_SESSION, "true");
        return  "redirect:/home/index";
    }
}
