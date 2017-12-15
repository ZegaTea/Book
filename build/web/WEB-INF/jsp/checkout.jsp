<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"></jsp:include>  
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="product-content-right">
                        <h3 id="order_review_heading">Your order</h3>
                        <div id="order_review" style="position: relative;">
                            <table class="shop_table">
                                <thead>
                                    <tr>
                                        <th class="product-name">Product</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${cart}">
                                    <tr class="cart_item">
                                        <td class="product-name">${item.getTitle()}<strong class="product-quantity"> × ${item.getQuantity()}</strong> </td>
                                        <td class="product-total"><span class="amount">$${item.getQuantity * item.getPrice()}</span> </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr class="cart-subtotal">
                                    <th>Cart Subtotal</th>
                                    <td><span class="amount">$${sessionScope.cart.stream().map(x -> (x.price * x.quantity)).sum()}</span>
                                    </td>
                                </tr>
                                <tr class="shipping">
                                    <th>Shipping and Handling</th>
                                    <td>Free Shipping
                                        <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                    </td>
                                </tr>
                                <tr class="order-total">
                                    <th>Order Total</th>
                                    <td><strong><span class="amount">$${sessionScope.cart.stream().map(x -> (x.price * x.quantity)).sum()}</span></strong> </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>                       
            </div>                    

            <div class="col-md-7">
                <h3 id="order_review_heading">Your Information</h3>
                <form action="checkout" method="POST">
                    <div class="form-group">
                        <label>Name</label>
                        <input name="ten" class="form-control" value="@user.tenNguoiDung"/>
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input name="sdt" class="form-control" value="@user.soDienThoai"/>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input name="diachi" class="form-control" value="@user.diaChi" />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" class="form-control" value="@user.email" />
                    </div>
                    <button type="submit" class="btn">Checkout</button>
                </form>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-4"></div>

        </div>
    </div>
</div>
</div>

<jsp:include page="footer.jsp"></jsp:include> 
