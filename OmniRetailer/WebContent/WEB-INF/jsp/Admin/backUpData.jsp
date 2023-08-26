<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> --%>
<title>Backup Data</title>
<script type="text/javascript">
function backupDB(id) {
	 var contextPath = $('#contextPath').val();
	  var URL = contextPath + "/admin/backupDB.do";
	  $.ajax({
		url : URL,
		data : {
			id : id
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result){
			//$("#right-side").html(result);
			//activeMenu(id);
			alert(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
}

</script>
</head>
<body>
<div class="row">
</div>
<div class="row">
<div class="col-lg-12">
</div>
	<div class="col-lg-12" style="margin-top: 20px; margin-left: 20px;">
		<input type="button" id="fullBackupDb" value="Backup Full Database" onclick="return backupDB('fullBackupDb');">
		&nbsp;&nbsp;
		<input type="button" id="incrementalBackupDb" value="Backup Incremental Database" onclick="return backupDB('incrementalBackupDb');">
	</div>
</div>

</body>
</html>