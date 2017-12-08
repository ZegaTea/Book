<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header.jsp"></jsp:include>
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Book Details</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Search</h2>
                    <form action="">
                        <input type="text" placeholder="Search books...">
                        <input type="submit" value="Search">
                    </form>
                </div>

                <div class="single-sidebar">
                    
                    <h2 class="sidebar-title">Category</h2>
                    <ul>
                    <c:forEach var="item" items="${Cats}">
                        <li><a href="${pageContext.request.contextPath}/detail/book-${item.getId()}">${item.getName()}</a></li>
                    </c:forEach>
                    </ul>
                    
                    <h2 class="sidebar-title">Author</h2>
                    <ul>
                    <c:forEach var="item" items="${Authorzxc}">
                        <li><a href="${pageContext.request.contextPath}/detail/book-${item.getId()}">${item.getAuthor()}</a></li>
                    </c:forEach>
                    </ul>
                    
                    <h2 class="sidebar-title">More Suggestions</h2>
                    <ul>
                    <c:forEach var="item" items="${SuggestionBooks}">
                        <li><a href="${pageContext.request.contextPath}/detail/book-${item.getId()}">${item.getTitle()} - ${item.getAuthor()}</a></li>
                    </c:forEach>
                    </ul>
                    
                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="${pageContext.request.contextPath}/home/index">Home</a>
                        <a href="">Details</a>
                        <a href="">${CategoryName}</a>
                        <a href="">${BookDetails.getTitle()}</a>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">
                                <div class="product-main-img">
                                    <img src="${BookDetails.getImageLink()}" alt="">
                                </div>

                                <div class="product-gallery">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name"></h2>
                                <div class="product-inner-price">
                                    <ins><h3>Price: </h3>$${BookDetails.getPrice()}</ins>
                                </div>    

                                <form action="CartServlet" class="cart" method="post">
                                    <div class="quantity">
                                        <input type="hidden" name="id" value="">
                                        <input type="hidden" name="link" value="">
                                        <input type="hidden" name="price" value="">
                                        <input type="hidden" name="title" value="">
                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
                                    </div>
                                    <button class="add_to_cart_button" type="submit">Add to cart</button>
                                </form>   

                                <div class="product-inner-category">
                                    <p>Category: <a href="">${CategoryName}</a></p>
                                </div> 

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Reviews</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>Book Description</h2>  
                                            <p>
                                                ${BookDetails.getDescription()}
                                            </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                                
                    <div class="related-products-wrapper">
                        <h2 class="related-products-title">Related Books</h2>
                        <div class="related-products-carousel">
                            <c:forEach var="item" items="${RelatedBooks}">
                                 <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${item.getImageLink()}" alt="">
                                    <div class="product-hover">
                                        <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href=""> ${item.getTitle()}</a></h2>

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
</div>

<jsp:include page="footer.jsp"></jsp:include> 
