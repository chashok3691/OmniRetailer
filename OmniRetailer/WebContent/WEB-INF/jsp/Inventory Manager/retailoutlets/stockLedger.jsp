<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * Modified by              : Manasa
 * file name		        : inventorymanager/retailoutlets/stockLedger.jsp
 * file type		        : JSP
 
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 25px;
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
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
}
.textBox{  
background-image:url(iconimage.jpg);   
background-position:right;   
background-repeat:no-repeat;   
padding-left:17px;
}
.breadcrumb
{
	    padding: 8px 15px;
    margin-bottom: 0px;
    list-style: none;
    background-color: #f5f5f5;
    border-radius: 4px;
}
</style>  

<script type="text/javascript">

var typeTab = $("#typeTabs").val();

 if(typeTab == 'stockItemTrack'){
	$("#tab1").removeClass("active");
$("#tab3").addClass("active");
 }
 else{
 $("#tab3").removeClass("active");
 
 if(typeTab == 'dailystockItemDetails'){
	 $("#tab2").addClass("active");
	 $("#tab1").removeClass("active");
	  }
	  else{
	 $("#tab2").removeClass("active");
	 
	  }
 
 //$("#tab1").removeClass("active");
 }
 /* else
	 $("#tab1").removeClass("active"); */ 
/* if(typeTab == 'stockledger')
	 $("#tab1").addClass("active");
 */
 
</script>

</head>
<body>

<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stocks.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
          <div class="box-header" align="center">
				<h3 class="box-title" >
					${skuId} - <spring:message code="po.details.label" />
				</h3>			
				</div><!-- /.box-header -->
				<div class="row">
				
				<%-- 	<div class="buttons">
						<c:if test="${stockOrVerify == 'stock'}">
						
						 <input type="button" class="btnCls" style="" onclick="viewOutletStocks('${flowUnder}Stocks','${stockType}','0','${flowUnder}');" value="<spring:message code="back.label" />" />
					        <a onclick="viewOutletStocks('outletStocks','${stockType}','0');" class="button">
					        <font size="2px"><spring:message code="back.label" />
					        </font>
					        </a>
						</c:if>
						<c:if test="${stockOrVerify == 'verify'}">
						<input type="button" class="btnCls" style="" onclick="viewOutletStocks('outletStocks','${stockType}','0');" value="<spring:message code="back.label" />" />
					        <a onclick="viewOutletStockVerificationReport('outletStockVerificationReport','0');" class="button"><font size="2px"><spring:message code="back.label" /></font></a>
						</c:if>
						
						
					</div> --%>
				</div>
				<div class="row">
				<div class="col-lg-12"><br></div>
				</div>
				
                    <div class="row">
                     <div class="col-lg-12">
                     
                     
                       <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="skuid.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${skuId}" style="" id="skuId" size="20" type="text" />
		           </div>
		          </div>
		           <div class="col-lg-1 col-lg-1">
		           </div>
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="ean.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${ean}" style="" id="ean" size="20" type="text" />
		           </div>
		          </div>
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="category.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${category}" style="" id="category" size="20" type="text" />
		           </div>
		          </div>
		          
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="department.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${productDepartment}" style="" id="department" size="20" type="text" />
		           </div>
		          </div>
		          
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="class.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${productClass}" style="" id="class" size="20" type="text" />
		           </div>
		          </div>
		         
		          </div>
                  
                         <div class="col-lg-12">
                       <div class="col-lg-3 col-lg-3">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;padding-top: 15px;">
	                   <label><spring:message code="product.description.label"/></label>
	                 	<input class="form-control" class="description" readonly="readonly" value="${description}" style="" id="productDescription" size="20" type="text" />
		           </div>
		          </div>
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px; padding-top: 15px;">
	                   <label><spring:message code="report.uom.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${uom}" style="" id="uom" size="20" type="text" />
		           </div>
		          </div>
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;padding-top: 15px;">
	                   <label><spring:message code="subcategory.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${subCategory}" style="" id="subCategory" size="20" type="text" />
		           </div>
		          </div>
		          
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;padding-top: 15px;">
	                   <label><spring:message code="subdepartment.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${productSubDepartment}" style="" id="subDepartment" size="20" type="text" />
		           </div>
		          </div>
		          
		          <div class="col-lg-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;padding-top: 15px;">
	                   <label><spring:message code="sub.class.label"/></label>
	                 	<input class="form-control" readonly="readonly" value="${productSubClass}" style="" id="subClass" size="20" type="text" />
		           </div>
		          </div>
		          </div>
		        
                       <div class="col-lg-12"></div>
                     
                       <div class="col-lg-8" style="    margin-left: 58px;"></div>
                       
                        <div class="col-lg-2" style="margin-top: 12px;">
                    <ul class="breadcrumb">
    					<li style="font-size:15px;">Last 60 days</li>
                    </ul>
                      </div>
                        <div class="col-lg-1" style="margin-top: 12px;">
                      
		          						<input type="button" class="btnCls" style="margin-top: 0px;  margin-right: 4px;  margin-left: -14px;" onclick="viewOutletStocks('${flowUnder}Stocks','${stockType}','0','${flowUnder}');" value="<spring:message code="back.label" />" />
		             
                        </div>
               
               <!--written By manasa to display tabs  -->
                      
                <div class="col-lg-12">      
                <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                
                                <li id="tab1" class="active"><a href="#tab_1" onclick="stockLedger('${skuId}','0','${stockType}','stock', '${ean}','${uom}','${category}','${subCategory}','${productClass}','${productSubClass}','${productDepartment}','${productSubDepartment}','${description}','${pluCode}','stockTransaction')" data-toggle="tab"><spring:message code="stock.transaction.details.label"/></a></li>
                              <c:if test="${flowUnder == 'outlet'}">
                              
                                <li id="tab2"><a href="#tab_2" onclick="dailyStockItem('${skuId}','0','${stockType}','stock', '${ean}','${uom}','${category}','${subCategory}','${productClass}','${productSubClass}','${productDepartment}','${productSubDepartment}','${description}','${pluCode}')" data-toggle="tab"><spring:message code="dailystock.label"/></a></li>

										<li id="tab3" class="active"><a onclick="stockitemTrack('${skuId}','0','${stockType}','stock', '${ean}','${uom}','${category}','${subCategory}','${productClass}','${productSubClass}','${productDepartment}','${productSubDepartment}','${description}','${pluCode}');" href="#tab_3" data-toggle="tab"><spring:message code="itemTrack.lanel"/></a></li>
                              
                              </c:if>
                              
                                <c:if test="${flowUnder == 'warehouse'}">
                                	<li id="tab3" class="active"><a onclick="stockitemTrack('${skuId}','0','${stockType}','stock', '${ean}','${uom}','${category}','${subCategory}','${productClass}','${productSubClass}','${productDepartment}','${productSubDepartment}','${description}','${pluCode}');" href="#tab_3" data-toggle="tab"><spring:message code="itemTrack.lanel"/></a></li>
                                </c:if>
                              
                              
                                </ul>
                              
                              
                              <input type="hidden" id="stockledgerLocation" value="${storeLocation}"> 
                              <input type="hidden" id="typeTabs"  value="${type}">
                                <div class="tab-content">
                                <c:if test="${type != 'stockItemTrack' && type != 'dailystockItemDetails'}">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        				<%@ include file="stocktransactionDetails.jsp" %>  
                                  	 	</div>
                                  	 	
                                  	 	</div>
                                </div>  
                                </c:if>
                                <input type="hidden" value="${type}" id="itemTrack">
                                
                                
                                <c:if test="${type == 'stockItemTrack'}">
                                 <div class="tab-pane  active" id="tab_3" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        			<%@ include file="viewTrackedItemDetails.jsp" %>
                                  	 	</div>
                                  	 	
                                  	 	</div>
                              
                            </div>     
                                </c:if>   
                                
                                
                                <c:if test="${type == 'dailystockItemDetails'}">
                                 <div class="tab-pane active" id="tab_2" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        			<%@ include file="dailyastockDetails.jsp" %>
                                  	 	</div>
                                  	 	
                                  	 	</div>
                              
                            </div>     
                                </c:if>  
                                
                      </div>
                   <input type="hidden" id="flowUnder" value="${flowUnder}">   
                        <!--added by manasa  -->
                       <input type="hidden" id="outletCategory" value="${skuObj.category}">
   <input type="hidden" id="outletBrandId" value="${skuObj.brand}">
    <input type="hidden" id="outletLocation" value="${skuObj.storeLocation}"> 
      <input type="hidden" id="outletSubcategory" value="${skuObj.subCategory}">
       <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierName}"> 
        <input type="hidden" id="outletZone" value="${zone}">
       <input type="hidden" id="from" value="${skuObj.startDate}">
        <input type="hidden" id="to" value="${skuObj.endDate}">
         <input type="hidden" id="outletStartPrice" value="${skuObj.startPriceRange}">
        <input type="hidden" id="outletEndPrice" value="${skuObj.endPriceRange}"> 
         <input type="hidden" id="searchType" value="${skuObj.status}">    
          <input type="hidden" id="searchStocks" value="${skuObj.searchCriteria}">    
          
          </div>
  </div> 
</div></div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#stockLedger").dataTable({
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
</body>
</html>