<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/BlockedStock.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
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
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
</head>
<style>
.allignment{
    /*  width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}

a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
    /* height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}

.stickyheader {
  position: sticky !important;
  top: 0;
 z-index: 10 !important;
}

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 2;
  
}
.first-col {
 	min-width: 35px;
    max-width: 35px; 
    left: 0px;  
}

.second-col {
   left: 50px;
    min-width: 125px;
    max-width: 125px;
}
.third-col {
    min-width: 310px;
    max-width: 310px;
    left: 190px;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	  $("#searchStocks").val($("#stock").val());
		$("#searchStocks").focus();  
	$('#searchStocks').on('input',function(e){
		if($(this).val().trim()==""){
			viewOutletStocks('','','0');
		}
	});
	
	callCalender('from');
	callCalender('to');
	
	
	/*added by manasa to search stocks when trigger search button  */
	$('#mySearch').click(function(){
        var search = $('#searchStocks').val();
        return searchStocks(search,'','0');
    })
    $('#searchStocks').keypress(function(e){
    
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });
	
	var reorderTotal = [];
	   var totalReorder=0.0;
	   $('.reorder').each( function(){
		   reorderTotal.push( $(this).text() );  
	   	     });
		
		for (var i = 0; i < reorderTotal.length; i++) {
// 			totalReorder += reorderTotal[i] << 0;
			totalReorder= parseFloat(totalReorder) + parseFloat(reorderTotal[i]);

		}
		
		$('#totalReorder').text(parseFloat(totalReorder+0.00).toFixed(2));
	
	
	 var packTotal = [];
	   var totalPack=0.0;
	   $('.packQty').each( function(){
		   if($(this).text()=="")
			   packTotal.push("0");
		   else
			   {
			   packTotal.push( $(this).text() );  
			   }
	   	     });
		
		for (var i = 0; i < packTotal.length; i++) {
			totalPack  = parseFloat(totalPack ) + parseFloat(packTotal[i]);
		}
		
		$('#totalPackQty').text(parseFloat(totalPack+0.00).toFixed(2));
		
		 var StockTotal = [];
		   var totalStock=0.0;
		   $('.stockQty').each( function(){
			   if($(this).text()=="")
				   StockTotal.push("0");
			   else
				   {
				   StockTotal.push( $(this).text() );  
				   }
		   	     });
			
			for (var i = 0; i < StockTotal.length; i++) {
				totalStock  = parseFloat(totalStock ) + parseFloat(StockTotal[i]);

			}
			
			$('#totalStockQty').text(parseFloat(totalStock+0.00).toFixed(2));
		
			 var CostTotal = [];
			   var totalCost=0.0;
			   $('#productstocks tbody tr td:nth-child(14)').each( function(){
				   CostTotal.push( $(this).text() );  
			   	     });
				
				for (var i = 0; i < CostTotal.length; i++) {
					totalCost += CostTotal[i] << 0;
				}
				
				$('#totalCostPrice').text(parseFloat(totalCost+0.00).toFixed(2));

					var StockTotal = [];
				   var totalStock=0.0;
				   $('.stockVal').each( function(){
					   if($(this).text()=="")
						   StockTotal.push("0");
					   else
						   {
						   StockTotal.push( $(this).text() );  
						   }
				   	     });
					
					for (var i = 0; i < StockTotal.length; i++) {
						totalStock  = parseFloat(totalStock ) + parseFloat(StockTotal[i]);

					}
					
					$('#totalStockValue').text(parseFloat(totalStock+0.00).toFixed(2));
	
	
					
					
					// added to fetch locations based on zone 
				/* 	var zone = $("#outletZone").val();
					var flowUnder = $("#flowUnder").val();
					 var location = $("#outletLocation").val();
					 if( zone != null && zone !="" && location!= null && location == "")
						 {
						searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation',flowUnder);
					} */
});
</script>
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
				<spring:message code="blockedstock.label" />
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
                        <div class="col-lg-11" style="background: #f4f4f4;   padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                         <c:choose>
                         <c:when test ="${flowUnder == 'warehouse' }" > 
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
	                         <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
	                        
	                        </c:otherwise>
                         </c:choose>
                         </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
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
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
	                            <%-- <c:choose>
								 <c:when test="${flowUnder == 'outlet'}"> --%>
								 <c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
								 <%-- </c:when>
								 <c:otherwise>
								 <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
								 </c:otherwise>
								 
								 </c:choose> --%>
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
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
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                         
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                   <input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		               <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="   width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewOutletStocks('outletStocks','${stockType}','0');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       <div class="col-lg-1">
                      
                      </div>
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      <span id="priceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                      </div>
                    
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewOutletStocks('outletStocks','${stockType}','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      
				                      <!--added by manasa  -->
				                      
				                        <div class="col-lg-5 col-xs-8" style="padding-left:0px;padding-right:0px">
                      	 <input type="text"  class="form-control" style="" value="" id="searchStocks" placeholder="<spring:message code="search.stocks.label" />" />
						
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
						<input type="hidden" id="stock" value="${searchName}">
                    </div>
				                      
                   <%--  <div class="col-lg-5 col-xs-8">
                      	 <input type="text"  class="form-control searchItems searchBar" style="" value="" id="searchStocks" placeholder="<spring:message code="search.stocks.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div>
						<input type="hidden" id="stock" value="${searchName}">
                    </div> --%>
                    <div class="col-lg-3" style="padding-right: 0px">
                     <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        
       						<div class="col-lg-6 col-md-6" style="padding-left: 0px;">
	                            <input type="text" style="height: 30px;" class="form-control clearError" id="outletStartPrice" value="${startprice}" required="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="Start Price">
       						</div>
       						<div class="col-lg-6 col-md-6" style="padding-left: 0px;">
	                            <input type="text" style="height: 30px;" class="form-control clearError" id="outletEndPrice" value="${endprice}" required="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="End Price">
       						</div>
       					</div>
                    </div>
                        <div class="col-lg-1 col-xs-4 allignment">
                                            <select class="form-control" style="height:30px;" name="searchType" id="searchType" onchange="searchStocks('','','0');">
                                            <option value="active" ${'active' == searchType ? 'selected' : ''}>Active</option>
                                            <option value="inactive" ${'inactive' == searchType ? 'selected' : ''}>In-Active</option>
                                            </select>
                                     </div>
                  <div class=" col-lg-2" style="">
                           <div class="row">
                  <div class="col-lg-6" style="    padding-right: 0px;">
                  <a onclick="viewOutletStocks('outletStocks','${stockType}','0');" class="run"><spring:message code="runbutton.label"/></a>
                  </div>
                  <div class="col-lg-6">
                     <a class="run" onclick="downloadstockreport(this)">SAVE</a>
                  </div>
                   <input type="hidden" id="stockType" value="${stockType}">
                       <input type="hidden" id="maxRecords" value="10">
                       <input type="hidden" id="stockdownload" value="false">
                       <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                   
                  </div>
                        </div>
                    </div>
                  <input type="hidden" id="stockType" value="${stockType}">
                   <input type="hidden" id="flowUnder" value="${flowUnder}">
                   <div>
                     <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th class="sticky-col first-col stickyheader" style="background-color: #a1dbf1 !important;"><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th class="sticky-col second-col stickyheader" style="background-color: #a1dbf1 !important;"><spring:message code="skuid.label" /></th>
                             	<th class="sticky-col third-col stickyheader" style="background-color: #a1dbf1 !important;"><spring:message code="description.label" /></th>
                             	
                             		<th ><spring:message code="color.label" /></th>
                             	<th ><spring:message code="size.label" /></th>
                             	<th >Batch Number</th>
                             	<th ><spring:message code="measure.range.label" /></th>
                             	<th ><spring:message code="grade.label" /></th>
                             	
                                <th style=""><spring:message code="ean.label" /></th>
                                
                                <th><div ><spring:message code="reorderpoint.label" /></div></th>
                                <th><spring:message code="uom.label" /></th>
                                <th><spring:message code="packqty.label" /></th>
                                <th><spring:message code="stock.qty.label" /></th>
                               	   
                                <th><spring:message code="category.label" /></th>
                                <th><spring:message code="salevalue.label" /></th>
                                
                                    	   <th><spring:message code="stockvalue.label" /></th>
                                
                                <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="stockDetails" items="${skuDetailsList}">
                         	 <tr>
                         	    <td class='sticky-col first-col' style='background: #f9f9f9;'>${stockDetails.slNo}</td>
                             	<td class='sticky-col second-col' style='background: #f9f9f9;'>${stockDetails.skuID}</td>
                                <td class='sticky-col third-col' style='background: #f9f9f9;'>${stockDetails.description}</td>
                                <input type="hidden" class="description${theCount.count}" value="${stockDetails.description}"/>
                                <input type="hidden" class="" id="stockledgerLocation" value="${stockDetails.location}"/>
                                <td>${stockDetails.color}</td>
                                <td>${stockDetails.size}</td>
                                <td style="">${stockDetails.productBatchNumber}</td>
                                <td>${stockDetails.measurementRange}</td>
                                <td>${stockDetails.productRange}</td>
                                
                                  <td>${stockDetails.ean}</td>
                                   <td>${stockDetails.reorderPoint}</td>
                                                               <td style="">${stockDetails.uom}</td>
                                 <td class="packQty">${stockDetails.quantity}</td>
                                <td class="stockQty">${stockDetails.stockQty}</td>
                                
                                <td>${stockDetails.category}</td>
                                
                                <td>${stockDetails.price}</td>
                                                               <td class="stockVal">${stockDetails.stockValue}</td>
                                
                       <%--          <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return stockLedger('${stockDetails.skuID}','0','${stockType}','stock')"><spring:message code="stockcard.label" /></a></td> --%>
                          <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return stockLedger('${stockDetails.skuID}','0','${stockType}','stock', '${stockDetails.ean}','${stockDetails.uom}','${stockDetails.category}','${stockDetails.subCategory}','${stockDetails.productClass}','${stockDetails.productSubClass}','${stockDetails.department}','${stockDetails.subDepartment}','description${theCount.count}','${stockDetails.pluCode}')"><spring:message code="stockcard.label" /></a></td>
                             </tr>
                            </c:forEach>
                            <c:if test="${ not empty skuDetailsList}">
                             <tr>
                             
                           
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                              <td></td>
                                  
                                   <td></td>
                             
                             <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                   
                                       <td  style="padding:3px;width: 160px;"><div id="totalPackQty" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalStockQty" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                        <td></td>
                                       <td></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalStockValue" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                      <td></td>
                             </tr>
                             </c:if>
                         </tbody>
                     </table>
                        </div>
                     </div>


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
             <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;">
                 <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Quantity</div>
					<div class="col-lg-6 col-sm-6" style="text-align: left;">: ${totalquantity} </div>
				
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Cost Value</div>
					<div class="col-lg-6 col-sm-6" style="text-align: left;">: ${totalcost} </div>
					</div>
              </div>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletStocks('outletStocks','${stockType}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletStocks('outletStocks','${stockType}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletStocks('outletStocks','${stockType}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletStocks('outletStocks','${stockType}','${totalValue}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords-maxRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewOutletStocks('outletStocks','${stockType}',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
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
</body>
</html>