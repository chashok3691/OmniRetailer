<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahithya
 * file name		        : inventorymanager/retailoutlets/stockVerification.jsp
 * file type		        : JSP
 * description			: The new stock verification report form is displayed using this jsp
 * Modified by 			: Vijay
 * Modified Date		: 21-08-2017
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">

.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}


a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
table.classname td {
    font-color: #ffffff;
    background: 
    
}

</style>  
<script type="text/javascript">
$(document).ready(function(){
	
	
	$('#StockVerification').click(function(){
        var searchStockVerification = $('#searchStockVerification').val();
        return viewWarehouseStockVerification('outletStockVerificationReport','0','${flowUnder}','','','');
    })
    $('#searchStockVerification').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#StockVerification').click();//Trigger search button click event
        }
    });
		
	callCalender('startDate');
	callCalender('endDate');
	debugger;
	   var Stocktotal = [];
	   var openStockTotal=0.0;
	   $('#verifiedStocks tbody tr td:nth-child(3)').each( function(){
			 Stocktotal.push( $(this).text() );  
	   	     });
		
		for (var i = 0; i < Stocktotal.length-1; i++) {
			openStockTotal=parseFloat(openStockTotal) + parseFloat(Stocktotal[i]);
		}
		if(openStockTotal < 0)
			openStockTotal=openStockTotal*(-1);
		
		$('#totalStock').text(parseFloat(openStockTotal+0.00).toFixed(2));
		
		var Saletotal = [];
		   var opensaleTotal=0.0;
		   $('#verifiedStocks tbody tr td:nth-child(4)').each( function(){
			   Saletotal.push( $(this).text() );  
		   	     });
			
			for (var i = 0; i < Saletotal.length-1; i++) {
				opensaleTotal = parseFloat(opensaleTotal) + parseFloat(Saletotal[i]);
			}
			if(opensaleTotal < 0)
				opensaleTotal=opensaleTotal*(-1);
			$('#totalSaleQty').text(parseFloat(opensaleTotal+0.00).toFixed(2));
			
			var stockDumptotal = [];
			   var openstockdumpTotal=0.0;
			   $('#verifiedStocks tbody tr td:nth-child(6)').each( function(){
				   stockDumptotal.push( $(this).text() );  
			   	     });
				
				for (var i = 0; i < stockDumptotal.length-1; i++) {
					openstockdumpTotal=parseFloat(openstockdumpTotal) + parseFloat(stockDumptotal[i]);
				}
				
				if(openstockdumpTotal < 0)
					openstockdumpTotal=openstockdumpTotal*(-1);
				$('#totalStockDump').text(parseFloat(openstockdumpTotal+0.00).toFixed(2));
				
				var dumpTotalCost = [];
				   var dumpTotal=0.0;
				   $('#verifiedStocks tbody tr td:nth-child(7)').each( function(){
					   dumpTotalCost.push( $(this).text() );  
				   	     });
					
					for (var i = 0; i < dumpTotalCost.length-1; i++) {
						dumpTotal=parseFloat(dumpTotal) + parseFloat(dumpTotalCost[i]);
					}
					if(dumpTotal < 0)
						dumpTotal=dumpTotal*(-1);
					
					$('#totalDumpCost').text(parseFloat(dumpTotal+0.00).toFixed(2));
					
					
					
					//$('#totalStockDump').text(openstockdumpTotal+0.00);
					
					var totalStockLoss = [];
					   var stockLossTotal=0.0;
					   $('#verifiedStocks tbody tr td:nth-child(8)').each( function(){
						   totalStockLoss.push( $(this).text() );  
					   	     });
						
						for (var i = 0; i < totalStockLoss.length-1; i++) {
							stockLossTotal = parseFloat(stockLossTotal) + parseFloat(totalStockLoss[i]);
						}
						if(stockLossTotal < 0)
							stockLossTotal=stockLossTotal*(-1);
						$('#totalStockLoss').text(parseFloat(stockLossTotal+0.00).toFixed(2));
					
					var totalDeclared = [];
					   var declaredTotal=0.0;
					   $('#verifiedStocks tbody tr td:nth-child(5)').each( function(){
						   totalDeclared.push( $(this).text() );  
					   	     });
						
						for (var i = 0; i < totalDeclared.length-1; i++) {
							declaredTotal = parseFloat(declaredTotal) + parseFloat(totalDeclared[i]);
						}
						
						if(declaredTotal < 0)
							declaredTotal=declaredTotal*(-1);
						
						
						$('#totalDeclared').text(parseFloat(declaredTotal+0.00).toFixed(2));
						
						
						var totalCostLoss = [];
						   var costTotal=0.0;
						   $('#verifiedStocks tbody tr td:nth-child(9)').each( function(){
							   totalCostLoss.push( $(this).text() );  
						   	     });
							
							for (var i = 0; i < totalCostLoss.length-1; i++) {
								costTotal = parseFloat(costTotal) + parseFloat(totalCostLoss[i]);
							}
							
							if(costTotal < 0)
								costTotal=costTotal*(-1);
							
							
							$('#totalCostLoss').text(parseFloat(costTotal+0.00).toFixed(2));

							var totalClosestock = [];
							   var closeTotal=0.0;
							   $('#verifiedStocks tbody tr td:nth-child(10)').each( function(){
								   totalClosestock.push( $(this).text() );  
							   	     });
								
								for (var i = 0; i < totalClosestock.length-1; i++) {
									closeTotal = parseFloat(closeTotal) + parseFloat(totalClosestock[i]);
								}
								
								if(closeTotal < 0)
									closeTotal=closeTotal*(-1);
								
								$('#totalClosestock').text(parseFloat(closeTotal+0.00).toFixed(2));
			
								
								//added to fetch the locations based on zone
								var zone = $("#outletZone").val();
								 var location = $("#location").val();
								 if( zone != null && zone !="" && location!= null && location == "")
								{
									searchlocationsBasedOnZoneForDashboard('outletZone','location','');
								}
								 
								 
	if($("#flowUnder").val() != "outlet"){
		$("#loadverifications").css("pointer-events","none");
	}
	
	if($("#flowUnder").val() == "warehouse"){
		$("#loadverifications").css("pointer-events","visible");
	}		
	
	
	if($("#resultStr").val() != ""){
		alert($("#resultStr").val());
	}	
	
								 
});



</script>
</head>
<body>
<!-- Main content -->

			
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
	<div class="box-header" align="center">
				<h3 class="box-title" >
				Verifications
				</h3>			
				</div><!-- /.box-header -->
       <div class="box-body">
   <div class="col-lg-12" style=" background: #f4f4f4; ">

                  <div class="row">
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
<!--                         <div class="col-lg1-2 col-lg-2"> -->
<!--                        <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;"> -->
<%--                            <label><spring:message code="businessarea.label"/></label> --%>
<!--                            <select class="form-control" > -->
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
<!-- 	                        </select> -->
<!--                       </div> -->
<!--                       </div> -->
<input type="hidden" id="flowUnder" value="${flowUnder}">
<input type="hidden" id="resultStr" value="${resultStr}">

                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList}" >${categoryList.categoryName}</option>
						 								 	
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>												
                        
                    <div class="col-lg1-2 col-lg-2">
                   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                  
                   
                         <div class="col-lg1-2 col-lg-2">
             			 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startDate}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	          
	           <div class="col-lg1-2 col-lg-2"></div>
	                <div class="col-lg1-2 col-lg-2" style="background: #ccc;">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="viewWarehouseStockVerification('outlettStockVerification','0','${flowUnder}','menu','','');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                 
                   </div></div>
	           <div class="row">
                   
                     
                        
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
                           		 <option selected disabled value="Selects">Select</option>
                           		 <option value="all"><spring:message code="ALL.label"/></option>
	                            <c:forEach var="locationList" items="${locationsList}">
									<option value="${locationList}" ${locationList == location ? 'selected' : ''} id="${locationList}" >${locationList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
<!--                           <div class="col-lg1-2 col-lg-2"> -->
<!--                        <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;"> -->
<%--                            <label><spring:message code="section.label"/></label> --%>
<!--                            <select class="form-control" id="section" > -->
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
	                            
<!-- 	                        </select> -->
<!--                       </div> -->
<!--                       </div> -->
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
                     
                    
                      <div class="col-lg1-2 col-lg-2">
                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                          <select class="form-control" id="outletSubDepartmentId" >
                           		<c:set var="subDept" value="${subdepartment}" scope="page" />
                           		<c:choose>
                           		<c:when test="${empty subDept}"> 
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            </c:when>
	                            <c:otherwise>
									<option value="${subdepartment}">${subdepartment}</option>
									</c:otherwise>
						 		</c:choose>
	                        </select>
                      </div>
                      </div>
                     
                      <div class="col-lg1-2 col-lg-2" >
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${endDate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          <div class="col-lg1-2 col-lg-2"></div>
		          <div class="col-lg1-2 col-lg-2"style="background: #ccc;">
		          <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
                   
                 
                  
                </div>
                
                </div>
 

  <div class="col-lg-12 col-xs-12">
                  <br>
                  </div>
	 
          
				                 
				                       <div class="col-lg-1 col-xs-2" style="padding: 0px 0px;">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="return viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-9 col-xs-8">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchStockVerification" placeholder="<spring:message code="search.stock.verification.label" />" />
											<button id="StockVerification" class="searchbutton"></button>
											</div>
											
				                  </div>
				                   <div class="col-lg-2 col-xs-2" style="padding-right:0px" id="loadverifications">
				                   	<c:if test="${flowUnder == 'outlet'}">	
				                  <a onclick="loadstocverfications()" class="button" style="white-space: nowrap;margin-top: 0px;margin-bottom: 0px;padding: 7px 10px 22px 10px;cursor: pointer;">LOAD VERIFICATIONS</a>
									</c:if>
									<c:if test="${flowUnder == 'warehouse'}">
										  <a onclick="loadstocverficationswarehouse()" class="button" style="white-space: nowrap;margin-top: 0px;margin-bottom: 0px;padding: 7px 10px 22px 10px;cursor: pointer;">LOAD VERIFICATIONS</a>	
										</c:if>
				                  </div>
				                  
				                  <div class="row">
				                  
  <div class="col-lg-12 col-xs-12">
                  
                  </div>
				                  </div>
				                   
				                    <div style="overflow: auto;white-space: nowrap;">
                                         <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
				         <table id="verifiedStocks" class="table table-bordered table-striped"> 
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="s.no.label" /></th>
                                                <th><spring:message code="export.select.location.label" /></th>
                                            	<th>Verified Date</th>
                                            	<th><spring:message code="updated.date.label" /></th>
                                            	
                                            	<th><spring:message code="starttime.label" /></th>
                                            	<th><spring:message code="endtime.label" /></th>
                                            	
                                            	<th><spring:message code="openstock.label" /></th>
                                            	<th><spring:message code="stock.in.label" /></th>
                                            	<th><spring:message code="stock.out.label" /></th>
                                            	
                                               <%--  <th><spring:message code="sale.qty" /></th>
                                                <th><spring:message code="declared.stock.label" /></th>
                                               --%>
                                                <th><spring:message code="bookstock.label" /></th>
                                                 <th><spring:message code="actual.stock.label" /></th>
                                                
                                                 <th><spring:message code="dumpqty.label" /> </th>
                                                <th><spring:message code="dumpcost.label" /> </th>
                                                
                                                 <th>Loss </th>
                                                <th>Loss Cost</th>
                                                
<%--                                                 <th><spring:message code="losscost.label" /> </th> --%>
                                                <th><spring:message code="closestock.label" /></th>
                                                <th><spring:message code="closestockcost.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                                
                                            </tr>
                                        </thead>
                                      
								<tbody style="text-align: center;">
                                           <c:forEach var="productStockVerificationDetails" items="${StockVerificationDetailsList}"  varStatus="theCount">
                                            <tr>
                                           	<td>${theCount.count}</td>
                                           	<td>${productStockVerificationDetails.location}</td>
                                           	<td>${productStockVerificationDetails.verifiedOnStr}</td>
                                           	<td>${productStockVerificationDetails.updatedOnStr}</td>
                                           	
                                           	<td>${productStockVerificationDetails.startTimeStr}</td>
                                           	<td>${productStockVerificationDetails.endTimeStr}</td>
                                           	
                                            <td>${productStockVerificationDetails.openStock}</td>
                                            <td>${productStockVerificationDetails.stock_in_qty}</td>
                                            <td>${productStockVerificationDetails.saleQty}</td>
                                         
                                           <%--  <td>
												${productStockVerificationDetails.saleQty}
                                            </td>
                                            
                                            <td>${productStockVerificationDetails.declaredQty}</td> --%>
                                            <td>${productStockVerificationDetails.bookQty}</td>
                                               <td>${productStockVerificationDetails.sku_physical_stock}</td>
                                           	 <td>
                                           	 ${productStockVerificationDetails.dumpQty}
                                            </td>
                                            
                                            <td>
                                          <%--  	<c:set var="stockLossQty" value="0" scope="page" /> 
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="stockLossQty" value="${stockLossQty+itemList.stockLossQty}" scope="page" />
                                          
                                            </c:forEach>
 --%>                                            ${productStockVerificationDetails.dumpCost}
                                            </td>
                                            
                                            
                                            
                                            
                                            
                                           <td>${productStockVerificationDetails.stockLossQty}</td> 

                                      <td> 
                                            ${productStockVerificationDetails.stockCost}</td>
                                      
                                      <td>
                                           	
											
												${productStockVerificationDetails.closedStock}
                                            </td>
                                             <td>
                                           	
												
												${productStockVerificationDetails.closedStockCost}
												
                                            </td>
                                            <td>
												${productStockVerificationDetails.status}</td>
                                            <c:set var = "theString" value = "${productStockVerificationDetails.status}"/>
                                            <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewStockVerificationOpen('outletStockVerificationReport','0','${flowUnder}','','${productStockVerificationDetails.verification_code}','${productStockVerificationDetails.status}','${productStockVerificationDetails.verified_by}','${productStockVerificationDetails.startTimeStr}','${productStockVerificationDetails.endTimeStr}','${productStockVerificationDetails.verifiedOnStr}','${productStockVerificationDetails.verifiedUptoStr}','${productStockVerificationDetails.zone}','${productStockVerificationDetails.location}','view','');"><spring:message code="open.label" /></a>&nbsp;&nbsp;
                                             <%-- <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewStockVerificationOpen('outletStockVerificationReport','0','outlet','','${productStockVerificationDetails.verification_code}','${productStockVerificationDetails.status}','${productStockVerificationDetails.verified_by}','${productStockVerificationDetails.startTimeStr}','${productStockVerificationDetails.endTimeStr}','${productStockVerificationDetails.verifiedOnStr}','${productStockVerificationDetails.verifiedUptoStr}','${productStockVerificationDetails.zone}','${productStockVerificationDetails.location}','edit','${productStockVerificationDetails.masterVerificationCode}');">Edit</a> --%>
                                            <c:if 	test="${!fn:containsIgnoreCase(theString,'Write Off')}">
                                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewStockVerificationOpen('outletStockVerificationReport','0','${flowUnder}','','${productStockVerificationDetails.verification_code}','${productStockVerificationDetails.status}','${productStockVerificationDetails.verified_by}','${productStockVerificationDetails.startTimeStr}','${productStockVerificationDetails.endTimeStr}','${productStockVerificationDetails.verifiedOnStr}','${productStockVerificationDetails.updatedOnStr}','${productStockVerificationDetails.zone}','${productStockVerificationDetails.location}','edit','${productStockVerificationDetails.masterVerificationCode}');">Edit</a>&nbsp;&nbsp; 
                                            </c:if> 
                                           <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="PrintNonVerificationItems('${productStockVerificationDetails.verification_code}','${productStockVerificationDetails.location}');PrintVerificationItems('${productStockVerificationDetails.verification_code}','${productStockVerificationDetails.location}')">Print</a> 
                                            
                                            </td>
                                            
                                            </tr>
                                            
                                            <c:set var="dataExists" value="true"></c:set>
                                          </c:forEach>
                                          
                                          
                                          
                                          
                                         <c:if test="${dataExists == 'true'}">  
                                           <tr>
                                           
                                               <c:set var="openStock" value="0"  />
                                              <c:set var="stockIn" value="0"  />
                                                <c:set var="stockOut" value="0"  />
                                              <c:set var="bookStock" value="0"  />
                                                <c:set var="phusicalStock" value="0"  />
                                              <c:set var="dump" value="0"  />
                                                <c:set var="dumpCost" value="0"  />
                                              <c:set var="loss" value="0"  />
                                                <c:set var="lossCost" value="0"  />
                                              <c:set var="closedStock" value="0"  />
                                              <c:set var="closedStockCost" value="0"  />
                                                
                                                
                                          <c:forEach var="productStockVerificationDetails" items="${StockVerificationDetailsList}"  varStatus="theCount">
                                           <c:set var="openStock" value="${openStock+productStockVerificationDetails.openStock}"/>
                                          		 <fmt:formatNumber var="openStock" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${openStock}" />
                                          		 <c:set var="stockIn" value="${stockIn+productStockVerificationDetails.stock_in_qty}"/>
                                          		  <fmt:formatNumber var="stockInQty" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${stockIn}" />
                                           <c:set var="stockOut" value="${stockOut+productStockVerificationDetails.saleQty}"/>
                                             <fmt:formatNumber var="stockOut" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${stockOut}" />
                                            <c:set var="bookStock" value="${bookStock+productStockVerificationDetails.bookQty}"/>
                                             <c:set var="phusicalStock" value="${phusicalStock+productStockVerificationDetails.sku_physical_stock}"/>
                                             

												<c:set var="dump" value="${dump+productStockVerificationDetails.dumpQty}"/>
                                               <c:set var="dumpCost" value="${dumpCost+productStockVerificationDetails.dumpCost}"/>
                                                <c:set var="loss" value="${loss+productStockVerificationDetails.stockLossQty}"/>
                                                 <fmt:formatNumber var="loss" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${loss}" />
                                                <c:set var="lossCost" value="${lossCost+productStockVerificationDetails.stockCost}"/>
                                                   <fmt:formatNumber var="lossCost" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${lossCost}" />
                                                 <c:set var="closedStock" value="${closedStock+productStockVerificationDetails.closedStock}"/>
                                                 <fmt:formatNumber var="closedStock" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${closedStock}" />
                                         		<c:set var="closedStockCost" value="${closedStockCost+productStockVerificationDetails.closedStockCost}"/>
                                                 <fmt:formatNumber var="closedStockCost" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${closedStockCost}" />
                                          </c:forEach>
                                        
                                           
                                             <td></td>
                                         <td></td>
                                          <td></td>
                                         <td></td>
                                          <td></td>
                                      
                                       <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="#ffffff"><spring:message code="totals.label" /></font></div></td>
                                       <td  style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${openStock}</div></font></td>
                                       <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${stockInQty}</div></td>
                                          <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${stockOut}</div></td>
                                       <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${bookStock}</div></td>
                                       <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${phusicalStock}</div></td>
                                       <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${dump}</div></td>
                                       <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${dumpCost}</div></td>
                                       <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${loss}</div></td>
                                       <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1">${lossCost}</div></td>
                                        <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1">${closedStock}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1">${closedStockCost}</div></td>
												<td></td>                                    
                                      <td></td>
                                           
                                            </tr>
                                            </c:if>
                                        </tbody>
                                    


</table>
              </div>        
                                      </div>
                                     
                                    
     <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','${totalValue}','${flowUnder}','menu','','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStockVerification('outletStockVerificationReport','${index - (maxRecords + 1)}','${flowUnder}','menu','','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStockVerification('outletStockVerificationReport','${index - (maxRecords + 1)}','${flowUnder}','menu','','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','${totalValue}','${flowUnder}','menu','','')">
              	</div> 
              	</c:if>
              	
              		<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewWarehouseStockVerification('outletStockVerificationReport',document.getElementById('pagination').value,'${flowUnder}','menu','','');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>

              </div>    
          

</div>
            
            
            
            
             </div> <!-- /.box-body -->
                            </div> <!-- /.box --> 
       </div>
</div>
</section>
		
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
        

        
        
            $(function() {
                $("#verifiedstocks").dataTable(
             		{
             			"bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
       
</body>
</html>




