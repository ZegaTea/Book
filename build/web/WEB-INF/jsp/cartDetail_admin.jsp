 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header_admin.jsp"></jsp:include>
    
    
 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Cart Detail</h1>
                    <button type="reset" style="margin-bottom: 10px;" class="btn btn-info"><a href="${pageContext.request.contextPath}/admin/cart/cartmanagement" >Back</a></button><br/>
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
                            
                            <c:choose>
                                                   <c:when test="${item.getStatus()==1}">
                                                    <button type="button" class="btn btn-danger"> Chưa giao hàng</button>
                                             
                                                   </c:when>
                                               <c:when test="${item.getStatus()==2}">
                                                    <button type="button" class="btn btn-warning"> Đang giao hàng</button>
                                               </c:when>
                                                 <c:when test="${item.getStatus()==3}">
                                                          <button type="button" class="btn btn-success"> Đã giao hàng</button>
                                                 </c:when>
                                           
                                            </c:choose>       
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Book</th>
                                        <th>Image</th>
                                        <th>Quantity</th>
                                        <th>Total Price</th>                                      
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${ListCartDetail}"> 
                                    <tr class="odd gradeX">
                                         
                                        
                                        <td>${ListBook.stream().filter(x->x.getId()==item.getBookId()).findFirst().get().getTitle()}</td>                               
                                     
                                        <td class="center"><img src="${ListBook.stream().filter(x->x.getId()==item.getBookId()).findFirst().get().getImageLink()}" alt="" style="width: 70px;height:100px; "></td>
                             
                                        <td class="center" name="deDate">${item.getCount()}</td>
                                       <td name="phone">${item.getTotalCount()}</td>
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