<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<jsp:include page="header.jsp"></jsp:include>

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Shop</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <div class="product-carousel">
                        <c:forEach var="item" items="${BookCart}">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${item.getImageLink()}" alt="">
                                    <div class="product-hover">
                                        <a href="${pageContext.request.contextPath}/cart/add-id=${item.getId()}-quantity=1" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="${pageContext.request.contextPath}/detail/book-${item.getId()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="${pageContext.request.contextPath}/detail/book-${item.getId()}"> ${item.getTitle()}</a></h2>

                                <div class="product-carousel-price">
                                    <ins> $${item.getPrice()}</ins>
                                </div> 
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="product-pagination text-center">
            <nav>
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/home/item-page=1" title="Trang đầu" class="first"><i class="fa fa-angle-double-left"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/home/item-page=${prev}" title="Trang trước" class="prev"><i class="fa fa-angle-left"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/home/item-page=${current}" class="active" title="Trang @i">${current}</a></li>
                    <li><a href="${pageContext.request.contextPath}/home/item-page=${next}" class="next" title="Trang sau"><i class="fa fa-angle-right"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/home/item-page=${lastPage}" class="last" title="Trang cuối"><i class="fa fa-angle-double-right"></i></a></li>

                </ul>
            </nav>                        
        </div>
    </div>
</div>

<script>

</script>
<jsp:include page="footer.jsp"></jsp:include> 