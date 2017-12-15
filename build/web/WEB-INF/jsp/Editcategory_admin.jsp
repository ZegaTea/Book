<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header_admin.jsp"></jsp:include>
    
    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit category</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="post" action="/WebsiteBook/admin/category/EditCategoryPost.html" >
                                       
                                        <input type="hidden" value="${CategoryDetails.getId()}" name="id"/>
                                        <div class="form-group">
                                            <label>Name (*)</label>
                                            <input class="form-control" name="name" value="${CategoryDetails.getName()}">
                                            <label style="color: red">${err}</label>
                                        </div>
                                        
                                        
                                         <button type="submit" class="btn btn-primary">Submit</button>
                                         <button type="reset" class="btn btn-info"><a href="${pageContext.request.contextPath}/admin/category/categorymanagement" >Back</a></button>
                                    </form>
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