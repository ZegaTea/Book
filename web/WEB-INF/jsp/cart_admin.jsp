<jsp:useBean id="dateObject" class="java.util.Date" /> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:include page="header_admin.jsp"></jsp:include>
    
    
 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Cart Management</h1>
                   
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
                                        <th>User</th>
                                        <th>Order Date</th>
                                        <th>Delivery Date</th>                                      
                                        <th>Phone Number</th>
                                        <th>Address</th>
                                        <th>Email</th>
                                        <th>Total Price</th>
                                        <th>Status</th>
                                        <th></th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${ListCart}"> 
                                   
                                    <tr class="odd gradeX">
                                        <td name="userId">${item.getUserId()}</td>
                                         <td name="orderDate">
                                           <c:set target="${dateObject}" property="time" value="${item.getDeliveryDate()}"/>
                                           <fmt:formatDate value="${dateObject }" pattern="dd/MM/yyyy" /> 
                                           
                                         </td>
                                         <td class="center" name="deDate">
                                                     
                                             <c:set target="${dateObject}" property="time" value="${item.getDeliveryDate()}"/>
                                              <fmt:formatDate value="${dateObject }" pattern="dd/MM/yyyy" />                   
                                             </td>
                                        <td name="phone">${item.getPhoneNumber()}</td>
                                        <td name="address">${item.getAddress()}</td>
                                        <td name="email">${item.getEmail()}</td>
                                        <td class="center" name="price">${item.getTotalPrice()}</td>
                                        <td>
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
                                            
                                        </td>
                                         <td>
                                              <c:choose>
                                                   <c:when test="${item.getStatus()==3}">
                                                   </c:when>
                                                  <c:otherwise>
                                                         <button type="submit" class="btn btn-xs btn-outline btn-danger btn-block"><a href="${pageContext.request.contextPath}/admin/cart/UpdateCart/${item.getId()}" > Update Status</a></button>
                                           
                                                  </c:otherwise>
                                              </c:choose>
                                           <a href="${pageContext.request.contextPath}/admin/cart/CartDetail-${item.getId()}" class="btn btn-outline btn-xs btn-primary btn-block">View Detail</a>
                                           <input type="hidden" value="${item.getId()}" name="id"/>
                                      
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