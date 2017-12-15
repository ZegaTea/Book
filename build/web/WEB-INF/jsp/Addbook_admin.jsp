<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="pojo.Category"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header_admin.jsp"></jsp:include>
   
    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create new book</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               
                                <div class="col-lg-6">
                                    <form role="form" method="post" action="/WebsiteBook/admin/book/AddBookPost.html" enctype="multipart/form-data">
                                         <div class="form-group">
                                             <label style="color: red">${err}</label>
                                        </div>
                                        <div class="form-group">
                                            <label>Title (*)</label>
                                            <input class="form-control" name="title">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Image (*)</label>
                                            <input type="file" id="exampleInputFile" name="file">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Price (*)</label>
                                            <input class="form-control" name="price">
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>Author</label>
                                            <input class="form-control" name="author">
                                            
                                        </div>
                                         <div class="form-group">
                                            <label>Publisher</label>
                                            <input class="form-control" name="publisher">
                                            
                                        </div>
                                         <div class="form-group">
                                            <label>Description</label>
                                            <textarea class="form-control" rows="5" name="description"></textarea>
                                            
                                        </div>
                                         <div class="form-group">
                                            <label>Number of chapters</label>
                                            <input class="form-control" type="number" name="chapNum">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Number of pages (*)</label>
                                            <input class="form-control" type="number" name="pageNum">
                                            <label style="color: red">${errPagenum}</label>
                                        </div>                                       
                                        <div class="form-group">
                                            <label>Kind of book</label>
                                            <select class="form-control" name="cate">
                                                <c:forEach var="item" items="${ListCate}"> 
                                                    <option value="${item.getId()}">${item.getName()}</option>
                                           
                                                </c:forEach>
                                            </select>
                                        </div>
                                        
                                         <button type="submit" class="btn btn-primary">Submit</button>
                                         <button type="reset" class="btn btn-info"><a href="${pageContext.request.contextPath}/admin/book/bookmanagement" >Back</a></button>
                                    </form>
                                </div>
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-4">
                                        <img id="anh"  alt="" style="width: 350px;height:500px; ">                                       
                                    </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
 <jsp:include page="footer_admin.jsp"></jsp:include>