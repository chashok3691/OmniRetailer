<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/rawmaterialstocks.jsp
 * file type		        : JSP
 * description				: The raw materials stocks details is displayed using this jsp
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

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >


						<c:if test="${stockType == 'Normal Stock'}">
							<h3 class="box-title">
								<spring:message code="rawmaterial.label"/> - <spring:message code="normalstock.label" />s
							</h3>
						</c:if>
						<c:if test="${stockType == 'Critical Stock'}">
							<h3 class="box-title">
								<spring:message code="rawmaterial.label"/> - <spring:message code="criticalstock.label" />s
							</h3>
						</c:if>

					</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	
				                  
				                    
				                    <div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-3">
				                        <label><spring:message code="outletlocation.label"/></label>
				                        <select class="form-control" id="outletLocation" onchange="getRawMaterialStocksByCriteria()">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                      </div>
				                      <div class="col-lg-3">
				                        <label><spring:message code="stocktype.label"/></label>
				                        <select class="form-control" id="rawmaterialStockType" onchange="getRawMaterialStocksByCriteria();">
 				                           <c:choose>
                                             <c:when test="${stockType == 'Normal Stock'}">
                                               <option value='<spring:message code="normalstock.label"/>' selected ><spring:message code="normalstock.label"/></option>
                                               <option value='<spring:message code="criticalstock.label"/>'><spring:message code="criticalstock.label"/></option>
                                             </c:when>
                                             <c:otherwise>
                                               <option value='<spring:message code="normalstock.label"/>' ><spring:message code="normalstock.label"/></option>
                                               <option value='<spring:message code="criticalstock.label"/>' selected ><spring:message code="criticalstock.label"/></option>
                                             </c:otherwise>
                                           </c:choose>
										</select>
				                      </div>
				                      <div class="col-lg-3"></div>
				                    </div>
				                    
				                    
                                    <table id="rawmaterialstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label" /></th>
                                            	<th><spring:message code="description.label" /></th>
                                                <th><spring:message code="product.code.label" /></th>
                                                <th><spring:message code="quantity.label" /></th>
                                                <th><spring:message code="category.label" /></th>
                                                <th><spring:message code="subcategory.label" /></th>
                                                <th><spring:message code="reorderpoint.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="stockDetails" items="${skuDetailsList}">
                                        	 <tr>
                                            	<td>${stockDetails.skuID}</td>
                                                <td>${stockDetails.description}</td>
                                                <td>${stockDetails.productId}</td>
                                                <td>
                                                   <c:choose>
                                                     <c:when test="${stockDetails.quantity == '0'}">
                                                       <span class="blinking">${stockDetails.quantity}</span>
                                                     </c:when>
                                                     <c:otherwise>
                                                       <span>${stockDetails.quantity}</span>
                                                     </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${stockDetails.category}</td>
                                                <td>${stockDetails.subCategory}</td>
                                                <td>${stockDetails.reorderPoint}</td>
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
                $("#rawmaterialstocks").dataTable();
                 });
        </script>
        
</body>
</html>