
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header_admin.jsp"></jsp:include>
    
    
 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Category Management</h1>
                    <div style="margin-bottom: 10px">  <button type="button" class="btn btn-outline btn-info"><a href="${pageContext.request.contextPath}/admin/category/AddCategory" >Add</a></button></div>
               
                </div>
            
                 <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        
                                        <th></th>
                                       
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${ListCategory}"> 
                                    

                                    <tr class="odd gradeX">
                                        <td>${item.getName()}</td>
                                      
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/category/EditCategory-${item.getId()}" class="btn btn-xs btn-primary btn-block">Edit</a>
                                           
                                            <a  data-toggle="modal" data-target="#myModal" class="btn btn-xs btn-danger btn-block">
                                            Delete
                                            </a>
                                            <!-- Modal -->
                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="myModalLabel">Warning</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                           Are you sure?
                                                        </div>
                                                        <div class="modal-footer">
                                                             <button type="button" class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/category/DeleteCategory/${item.getId()}" >Yes</a></button>
                                                            <button type="button" class="btn btn-primary">No</button>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>                                  
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
        </div>
        <!-- /#page-wrapper -->
<jsp:include page="footer_admin.jsp"></jsp:include>