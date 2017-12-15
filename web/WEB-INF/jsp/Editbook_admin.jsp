<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header_admin.jsp"></jsp:include>
    
    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit book</h1>
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
                                    <form role="form" method="post" action="/WebsiteBook/admin/book/EditBookPost.html" enctype="multipart/form-data">
                                        <div class="form-group">
                                             <label style="color: red">${err}</label>
                                        </div>
                                        <input type="hidden" value="${BookDetails.getId()}" name="id"/>
                                        <div class="form-group">
                                            <label>Title (*)</label>
                                            <input class="form-control" name="title" value="${BookDetails.getTitle()}">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input type="file" id="exampleInputFile" name="file" value="${BookDetails.getImageLink()}">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Price (*)</label>
                                            <input class="form-control" name="price" value="${BookDetails.getPrice()}">
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>Author</label>
                                            <input class="form-control" name="author" value="${BookDetails.getAuthor()}">
                                            
                                        </div>
                                         <div class="form-group">
                                            <label>Publisher</label>
                                            <input class="form-control" name="publisher" value="${BookDetails.getPublisher()}">
                                            
                                        </div>
                                         <div class="form-group">
                                            <label>Description</label>
                                            <textarea class="form-control" rows="5" name="description" >${BookDetails.getDescription()}</textarea>
                                            
                                        </div>
                                         <div class="form-group">
                                            <label>Number of chapters</label>
                                            <input class="form-control" type="number" name="chapNum" value="${BookDetails.getChapterNum()}">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Number of pages (*)</label>
                                            <input class="form-control" type="number" name="pageNum" value="${BookDetails.getNumOfBooks()}">
                                            <label style="color: red">${errPagenum1}</label>
                                        </div>                                       
                                        <div class="form-group">
                                            <label>Kind of book</label>
                                            <select class="form-control" name="cate">
                                                <c:forEach var="item" items="${ListCate}"> 
                                                    <c:choose> 
                                                        <c:when test="${item.getId()==BookDetails.getCategoryId()}">
                                                            <option value="${item.getId()}" selected="true">${item.getName()}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${item.getId()}">${item.getName()}</option>
                                                        </c:otherwise>
                                                    </c:choose> 
                                                    
                                           
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" name="image" value="${BookDetails.getImageLink()}"/> 
                                        </div>
                                        
                                         <button type="submit" class="btn btn-primary">Submit</button>
                                         <button type="reset" class="btn btn-info"><a href="${pageContext.request.contextPath}/admin/book/bookmanagement" >Back</a></button>
                                    </form>
                                </div>
                                 <div class="col-lg-1"></div>
                                    <div class="col-lg-4">
                                        <img id="anh" src="${BookDetails.getImageLink()}"  alt="" style="width: 350px;height:500px; " >                                       
                                        
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