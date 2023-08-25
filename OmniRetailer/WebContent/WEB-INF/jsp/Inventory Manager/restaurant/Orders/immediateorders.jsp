<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Orders/immediateorders.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>immediateorders | Omni Retailer</title>
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
	padding: 5px 15px 5px 15px;
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
			<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
   		</h1>
       <ol class="breadcrumb">
        <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
            <li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="outlet.management.label"/></a></li>
            <li class="active"><a style="cursor: pointer;" onclick="showOrdersFlows();"><spring:message code="customer.label"/> <spring:message code="orders.label" /></a></li>
        </ol>
</section> --%>
                
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header">


						<c:if test="${orderType == 'immediate'}">
							<h3 class="box-title">
								<spring:message code="immediate_orders.label" /> - <spring:message code="orders.label"/> 
							</h3>
						</c:if>
						<c:if test="${orderType == 'take_away'}">
							<h3 class="box-title">
								<spring:message code="take_away_orders.label" /> - <spring:message code="orders.label"/>
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
				                        <select class="form-control" id="outletLocation" onchange="viewRestaurentOrdersByPage('${orderType}','${status}');">
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
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="order_id.label" /></th>
                                            	<th><spring:message code="table_number.label" /></th>
                                                <th><spring:message code="waiter_name.label" /></th>
                                                <th><spring:message code="order_date.label" /></th>
                                                <th><spring:message code="total_bill.label" /></th>
                                                <th><spring:message code="order_status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="orderDetails" items="${orderDetails}">
                                        	 <tr>
                                            	<td>${orderDetails.orderReference}</td>
                                                <td>${orderDetails.salesLocation}</td>
                                                <td>${orderDetails.salesExecutive}</td>
                                                <td>${orderDetails.date}</td>
                                                <td>${orderDetails.grandTotal}</td>
                                                 <td>${orderDetails.status}</td>
                                            	<%--<c:choose> 
 											  <c:when test="${orderDetails.status == 'pending'}">
    												<td><a style="color:#2e7ea7 !important;" href="#" onclick="viewOrderDetails('${orderDetails.orderReference}','${orderDetails.orderType}');"><spring:message code="view.label"/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												<a style="color:#2e7ea7 !important;" href="#" onclick="editOrder('${orderDetails.orderReference}','${orderDetails.orderType}');"><spring:message code="edit.label"/></a></td>
                                          
  												</c:when>
  												<c:otherwise> --%>
    												<td><a style="color:#2e7ea7 !important;" href="#" onclick="viewRestaurentOrderDetails('${orderDetails.orderReference}','${orderDetails.orderType}');"><spring:message code="view.label"/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												</td>
  											<%-- 	</c:otherwise>
											</c:choose> --%>
                                            
                                            </tr>
                                             
                                           </c:forEach>
                                           
                                        </tbody>
                                       
                                    </table>
                                    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable();
                 });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>