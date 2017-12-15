<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="newjsp.jsp"></jsp:include>
    
    <div class="slider-area">
        <div class="zigzag-bottom"></div>
        <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

            <div class="slide-bulletz">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="carousel-indicators slide-indicators">
                                <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-list" data-slide-to="1"></li>
                                <li data-target="#slide-list" data-slide-to="2"></li>
                            </ol>                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="single-slide">
                        <div class="slide-bg slide-one"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>Are you finding some books?</h2>
                                                <p>At this site you'll find that there are many communities made specifically online for book lovers of any possible genre, 
                                                    whether to buy, browser, or talk about the books that have impacted your life. </p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-two"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>You are looking for a site offer books in a variety of formats?</h2>
                                                <p> Whether you're looking for a textbook, a comic book, a romance, or a cookbook, the chances are very good 
                                                    that you'll find it with one of the book websites listed below. </p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-three"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>You love talking about books?</h2>
                                                <p>This site offer the reader a chance to get involved in discussion, reviews, and active conversation; 
                                                    in addition, buying books on the Web can end up in some serious savings, not to mention the amazing variety that is available to you.</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>        
    </div> <!-- End slider area -->

    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-refresh"></i>
                        <p>3 Days return</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-truck"></i>
                        <p>Free shipping</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-lock"></i>
                        <p>Secure payments</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-gift"></i>
                        <p>New Books</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->

    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Best Sellers</h2>
                        <div class="product-carousel">
                            <c:forEach var="item" items="${ListBook}">
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
    </div> <!-- End main content area -->

    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <h2 class="section-title">Popular Publishers</h2>
                        <div class="brand-list">
                            <img src="/WebsiteBook/resources/image/Brand/1.jpg" alt=""/>
                            <img src="/WebsiteBook/resources/image/Brand/2.jpg" alt=""/>
                            <img src="/WebsiteBook/resources/image/Brand/3.jpg" alt=""/>
                            <img src="/WebsiteBook/resources/image/Brand/4.jpg" alt=""/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->

<jsp:include page="footer.jsp"></jsp:include>
