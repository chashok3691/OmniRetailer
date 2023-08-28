<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Orders/vieOrders.jsp
 * file type		        : JSP
 * description				: dispaly specific order details
 * */ -->

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
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
</style>  

</head>
<body>


 <!-- Content Header (Page header) -->
	<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="deliveries.label" /></small>
    			</h1>
                 <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header">
		<c:if test="${status == 'pending'}"> 
			<h3 class="box-title">
				<spring:message code="pending.deliveries"/> 
			</h3>
		</c:if> 
		 <c:if test="${status != 'pending'}">
			<h3 class="box-title">
				<spring:message code="submitted.deliveries" />
			</h3>
		</c:if> 
	</div><!-- /.box-header -->
     <div class="box-body table-responsive">
       <div class="row">
         <div class="col-lg-3"></div>
         <div class="col-lg-6">
           <div class="row">
            <div class="col-lg-4" style="text-align:center;top:5px;">
              <label><spring:message code="outletlocation.label"/></label>
            </div>
            <div class="col-lg-7">
            <input type="hidden" id="type" value="${type}">
              <select class="form-control" id="outletLocation" onchange="viewOrdersByPage('Door Delivery','0');">
                 <c:forEach var="location" items="${locationsList}">
					<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
				 </c:forEach>
             </select>
            </div>
         </div>
         </div>
         <div class="col-lg-3"></div>
       </div>
            <table id="productstocks" class="table table-bordered table-striped">
            <!-- <div class="row">
				<div class="buttons" style="margin-bottom: 7px;"> -->
					<%-- <a onclick="return viewNewProcurement();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp; --%>
					<%-- <a onclick="return viewOrders('pending','outletShipment');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a>&nbsp;&nbsp;&nbsp;
						<a onclick="return viewOrders('all','outletShipment');" class="button"><font size="2px"><spring:message code="all.deliveries.label" /></font></a>
				</div>
			</div> --%>
             <thead style="background-color: #3c8dbc; color: #ffffff">
                    <tr>
                    	<th><spring:message code="order_id.label" /></th>
                    	<th><spring:message code="order_status.label" /></th>
                        <th><spring:message code="order_amount.label" /></th>
                        <th><spring:message code="order_on.label" /></th>
                        <th><spring:message code="action.label" /></th>
                    </tr>
                </thead>
                <tbody style="text-align: center;">
              <%--   <c:if test="${operation == 'all'}"> --%>
                   <c:forEach var="orderDetails" items="${orderDetails}">
                	 <tr>
                    	<td>${orderDetails.orderId}</td>
                        <td>${orderDetails.orderStatus}</td>
                        <td>${orderDetails.totalOrderAmount}</td>
                        <td>${orderDetails.orderDate}</td>
                        <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','Door Delivery');"><spring:message code="view.label"/></a></td>
                    </tr>
                   </c:forEach>
          <%--   </c:if>
				    <c:if test="${operation == 'draft'}">       
					<c:forEach var="orderDetails" items="${orderDetails}">
                   	 <tr>
                       	<td>${orderDetails.orderId}</td>
                           <td>${orderDetails.orderStatus}</td>
                           <td>${orderDetails.totalOrderAmount}</td>
                           <td>${orderDetails.orderDate}</td>
                         <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}');"><spring:message code="view.label"/></a></td>
                       </tr>
                </c:forEach>
                </c:if> --%>
             </tbody>
               
            </table>
     		<div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrdersByPage('Door Delivery','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrdersByPage('Door Delivery','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrdersByPage('Door Delivery','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrdersByPage('Door Delivery','${totalValue}')">
              	</div> 
              	</c:if>
              </div>                                   
            </div><!-- /.box-body -->
        </div><!-- /.box -->
  
</div>
</div>
</section>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
         			  "bPaginate": false,
                      "bLengthChange": false,
                      "bFilter": false,
                      "bSort": false,
                      "bInfo": false,
                      "bAutoWidth": false
        			});
                 });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
         <input type="hidden" id="status" value="${status}"/>
</body>
</html>