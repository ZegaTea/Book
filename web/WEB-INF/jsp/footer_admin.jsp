<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<c:url value="/resources/admin/vendor/jquery/jquery.min.js" />" type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/admin/vendor/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/resources/admin/vendor/metisMenu/metisMenu.min.js" />" type="text/javascript"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<c:url value="/resources/admin/vendor/raphael/raphael.min.js" />" type="text/javascript"></script>
    
    <script src="<c:url value="/resources/admin/vendor/morrisjs/morris.min.js" />" type="text/javascript"></script>
    
    <script src="<c:url value="/resources/admin/data/morris-data.js" />" type="text/javascript"></script>

    
      <!-- DataTables JavaScript -->
    <script src="<c:url value="/resources/admin/vendor/datatables/js/jquery.dataTables.min.js"/>"type="text/javascript"></script>
    <script src="<c:url value="/resources/admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"/>"type="text/javascript"></script>
    <script src="<c:url value="/resources/admin/vendor/datatables-responsive/dataTables.responsive.js"/>"type="text/javascript"></script>
<!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/admin/dist/js/sb-admin-2.js" />" type="text/javascript"></script>
     <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    
                                           $(document).ready(function() {
                                                  $('#exampleInputFile').change(function (event) {
                                                  var tmppath = URL.createObjectURL(event.target.files[0]);
                                                   $('#anh').fadeIn('fast').attr('src', tmppath);
                                                    });
                                                });
                                         
    </script>
    
</body>

</html>

