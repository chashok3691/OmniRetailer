<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/outletNotification/newNotification.jsp
 * file type		        : JSP
 * description				: The new Notification is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		 <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
 <script src="${pageContext.request.contextPath}/js/dayopen.js"></script> 
	<style type="text/css">
	.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: white;
    display: inline-block;
    padding: 5px 10px 5px 10px;
    background: rgb(60, 141, 188);
	border-radius: 5px;
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
	/* font-weight: bold; */
	color: black;
    background-color: rgb(195,195,195);
    border-color: gray;
}
.rowleft
{
margin-left:15px;
}
#receiverType option { color: black; }
#notificationType option { color: black; }
.empty { color: #c3c3c3; }


.labelpadding
{
margin-left:-50px;
}
.rowpadding
{
margin-left:-28px;
}
td {
    /* width: 50%;
    height: 2em;
    border: 1px solid #ccc; */
}
tablepr {
    border-collapse: collapse;
    border: 5px solid black;
    width: 100%;
}
.column-right {
     border-right: 1px solid #dddddd;
}
.rowheight
{
margin-top:5px;
}


@media only screen and (max-width: 800px) {
/* Force table to not be like tables anymore */
#no-more-tables table,
#no-more-tables thead,
#no-more-tables tbody,
#no-more-tables th,
#no-more-tables td,
#no-more-tables tr {
display: block;
}



	</style>
	<script type="text/javascript">
$(document).ready(function(){
});

$("#notificationType").change(function () {
    if($(this).val() == "Notification Type") $(this).addClass("empty");
    else $(this).removeClass("empty");
});
$("#notificationType").change();
/* $("#receiverType").change(function () {
    if($(this).val() == "Receiver Type") $(this).addClass("empty");
    else $(this).removeClass("empty");
});
$("#receiverType").change(); */
	</script>
</head>
<body>

<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <c:if test="${type == 'new'}">
	                                <h3><spring:message code="new.Quotation.label" /></h3>
                                </c:if>
                                <c:if test="${type != 'new'}">
	                                <h3><spring:message code="supplier.quotation.ref" /> - ${quoteObj.quoteRef}</h3>
                                </c:if>
                               
                                </div><!-- /.box-header -->
                                <!-- form start -->
                               
<form class="form-horizontal">
<div class="row">
    <div class="form-group">
    
      <label class="col-sm-2 control-label"><spring:message code="location.label" /></label>
                                      <div class="col-lg-2 col-xs-10 " style="">
		                                 
                                 <select class="form-control" name="location" id="outletLocation">
                                   <c:forEach var="location" items="${workLocationsList}"> 
									 <option value="${location}" ${selectedLocation == location ? 'selected' : ''}>${location}</option>
								  </c:forEach>
							    </select></div>
    
    </div>
    
    
     <div class="form-group">
    
     <label class="col-sm-2 control-label"><spring:message code="location.label" /></label>
                                      <div class="col-lg-2 col-xs-10 " style="">
                                          
                                             <select class="form-control" name="shipped_from" id="businessCounter">
                                             <c:forEach var="location" items="${counterDetails}">
												<option value="${location}">${location}</option>
											</c:forEach>
                                           </select>

		                                 </div>
    
    </div>
    
    </div>
 
    
    
    
    <div class="form-group">
      <div class="col-xs-2">
        <label for="ex1">col-xs-2</label>
        <input class="form-control" id="ex1" type="text">
      </div>
      <div class="col-xs-3">
        <label for="ex2">col-xs-3</label>
        <input class="form-control" id="ex2" type="text">
      </div>
      <div class="col-xs-4">
        <label for="ex3">col-xs-4</label>
        <input class="form-control" id="ex3" type="text">
      </div>
