<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Book Store</title>

        <!--Custom Css-->
        <link href="<c:url value="/resources/css/owl.carousel.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/css/style1.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/css/ddsmoothmenu.css" />" rel="stylesheet" type="text/css">

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

        <!--LOGIN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,700italic,400italic'>
        <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
        <link href="../resources/css/style1login.css" rel="stylesheet" type="text/css"/>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://andwecode.com/wp-content/uploads/2015/10/jquery.leanModal.min_.js'></script>
        <script src="../resources/js/indexlogin.js" type="text/javascript"></script>


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="<c:url value="/resources/js/ddsmoothmenu.js" />" type="text/javascript"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

        <script type="text/javascript">

            ddsmoothmenu.init({
                mainmenuid: "smoothmenu1", //menu DIV id
                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })

            ddsmoothmenu.init({
                mainmenuid: "smoothmenu2", //Menu DIV id
                orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
                method: 'toggle', // set to 'hover' (default) or 'toggle'
                arrowswap: true, // enable rollover effect on menu arrow images?
                //customtheme: ["#804000", "#482400"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })

        </script>
        <!--<link href="../resources/css/style1login.css" rel="stylesheet" type="text/css"/>-->
    </head>
    <body>
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
                            <ul>
                                <li><a id="modal_trigger" href="#modal"><i class="fa fa-user"></i> My Account</a></li>
                                <!--<li><a id="modal_trigger" href="#modal"><i class="fa fa-user"></i> My Account</a></li>-->
                                <li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
                                <li><a href="cart.jsp"><i class="fa fa-user"></i> My Cart</a></li>
                                <li><a href="checkout.jsp"><i class="fa fa-user"></i> Checkout</a></li>
                                <li><a href="#"><i class="fa fa-user"></i> Login</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="header-right">
                            <ul class="list-unstyled list-inline">
                                <li class="dropdown dropdown-small">
                                    <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">currency :</span><span class="value">USD </span><b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">USD</a></li>
                                        <li><a href="#">INR</a></li>
                                        <li><a href="#">GBP</a></li>
                                    </ul>
                                </li>

                                <li class="dropdown dropdown-small">
                                    <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">language :</span><span class="value">English </span><b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">English</a></li>
                                        <li><a href="#">French</a></li>
                                        <li><a href="#">German</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End header area -->

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="${pageContext.request.contextPath}/home/index"><span>BookShop</span></a></h1>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="shopping-item">
                            <c:choose>
                                <c:when test="${sessionScope.cart != null}" >
                                    <a href="${pageContext.request.contextPath}/cart/detail">Cart - <span class="cart-amunt">${sessionScope.cart.stream().map(x -> (x.price * x.quantity)).sum()}</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">${sessionScope.cart.stream().map(x ->  x.quantity).sum()}</span></a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/cart/detail">Cart - <span class="cart-amunt">0</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">0</span></a>
                                    </c:otherwise>
                                </c:choose>

                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="ddsmoothmenu" id="smoothmenu1" >
                        <ul>
                            <li class="active"><a href="${pageContext.request.contextPath}/home/index">Home</a></li>
                            <li><a href="shop.jsp">Shop page</a></li>
                            <li><a href="${pageContext.request.contextPath}/cart/detail">Cart</a></li>

                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->
