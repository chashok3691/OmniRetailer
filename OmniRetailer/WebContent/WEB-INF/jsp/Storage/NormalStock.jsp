<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/availableSrock.jsp
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
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
</head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
    white-space: nowrap;
    
  }

} 
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
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
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
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
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	if($("#flowUnder").val()=='outlet'){
		$("#productstocks").removeClass("dataTable2");
		$("#productstocks").addClass("dataTable1");
		
	}
	else{
		$("#productstocks").removeClass("dataTable1");
		$("#productstocks").removeClass("dataTable");
		$("#productstocks").addClass("dataTable2");
	}
	callCalender('from');
	callCalender('to');
	 
	 $("#searchStocks").val($("#stock").val());
		$("#searchStocks").focus();  
	$('#searchStocks').on('input',function(e){
		if($(this).val().trim()==""){
			viewWarehouseStorageStocks('warehouseStorageNormalStock','Normal','0','warehouse','menu');
		}
	});
	
	 $('#mySearch').click(function(){
	        var search = $('#searchStocks').val();
	        return viewWarehouseStorageStocks('warehouseStorageNormalStock','Normal','0','warehouse','menu');
	    })
	    
	    $('#searchStocks').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });
	
	
});
</script>




<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" >
			<spring:message code="availablestock.label" />
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
              <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
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
                           <select class="form-control" id="outletCategory" >
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
                           <select class="form-control" id="outletDepartmentId" ><!-- onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');" -->
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
	                            <c:forEach var="location" items="${locationsList}">
								<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
								<%--  </c:when> --%>
								<%--  <c:otherwise>
								 <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
                                   <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
								 </c:otherwise> --%>
								 
							
									
									<%-- <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
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
                           <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == suppliername ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Storage Area</label>
                           <select class="form-control" id="storageArea" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                                <option value="Shelf" ${StorageArea == 'Shelf' ? 'selected' : ''} >Shelf</option>
									<option value="Racks" ${StorageArea == 'Racks' ? 'selected' : ''}>Racks</option>
									<option value="Bins" ${StorageArea == 'Bins' ? 'selected' : ''}>Bins</option>
									<option value="Fridge" ${StorageArea == 'Fridge' ? 'selected' : ''}>Fridge</option>
									<option value="Empty area" ${StorageArea == 'Empty area' ? 'selected' : ''}>Empty area</option>
									<option value="Bin Array" ${StorageArea == 'Bin Array' ? 'selected' : ''}>Bin Array</option>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','0');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br>
                    <br>
                    <div class="row">
                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
				                      
				                      
				                       <div class="col-lg-5 col-xs-8" style="padding-left:0px;padding-right:0px">
                      
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="${searchName}" id="searchStocks" placeholder="<spring:message code="search.stocks.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
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
                  <a onclick="viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','0');" class="run"><spring:message code="runbutton.label"/></a>
                  </div>
                  <div class="col-lg-6">
                     <a class="run" onclick="downloadStorgaestockreport(this)">SAVE</a>
                  </div>
                   <input type="hidden" id="stockType" value="${stockType}">
                     <!--   <input type="hidden" id="maxRecords" value="10"> -->
                       <input type="hidden" id="stockdownload" value="false">
                       <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                   
                  </div>
                        </div>
                       
                    </div>
                    
                    <input type="hidden" id="stockType" value="${stockType}">
                     <input type="hidden" id="flowUnder" value="${flowUnder}">
                     <div>
                      <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="productStoragestocks" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                                <th>Storage Area</th>
                                <th>Storage System</th>
                             	<th><spring:message code="skuid.label" /></th>
                             	<th ><spring:message code="description.label" /></th>
                             	<th >Loaded Date</th>
                             	<th >Unloaded Date</th>
                             	<th ><spring:message code="size.label" />/Range</th>
                             	<th ><spring:message code="grade.label" /></th>
                               <th style="width:80px"><spring:message code="ean.label" /></th> 
                                <th><spring:message code="brand.label" /></th>
                                <th><spring:message code="category.label" /></th>
                                <th><div ><spring:message code="reorderpoint.label" /></div></th>
                                <th><spring:message code="uom.label" /></th>
                                <th><spring:message code="packqty.label" /></th>
                                <th><spring:message code="stock.qty.label" /></th>
                               	<th><spring:message code="salevalue.label" /></th>
                               	   <th><spring:message code="stockvalue.label" /></th>
                                <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="stockDetails" items="${skuDetailsList}" varStatus="theCount">
                         	 <tr>
                                <td>${stockDetails.slNo}</td>
                               
                             	<td></td>
                             	<td>${stockDetails.storageAreaRef}</td>
                             	<td>${stockDetails.skuID}</td>
                                <td  style="text-align: left;"  >${stockDetails.description}</td>
                                <input type="hidden" class="description${theCount.count}" value="${stockDetails.description}"/>
                                
                                 <input type="hidden" class="" id="plucode" value="${stockDetails.pluCode}"/>
                                  <input type="hidden" class="" id="storeLocation" value="${stockDetails.pluCode}"/>
                                    <input type="hidden" class="" id="stockledgerLocation" value="${stockDetails.location}"/>
                                <td style=""></td>
                                <td style=""></td>
                                <td style="">${stockDetails.measurementRange}</td>
                                <td style="">${stockDetails.grade}</td>
                               <td>${stockDetails.ean}</td>
                                <%-- <td>${stockDetails.productId}</td> --%>
                                <td>${stockDetails.brandCode}</td>
                                <td>${stockDetails.category}</td>
                                
                                <td>${stockDetails.reorderPoint}</td>
                                <%--  <fmt:formatNumber var="formattedBillableTime" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${stockDetails.quantity}" /> --%>
                                <td style="">${stockDetails.uom}</td>
                                <td class="packQty">${stockDetails.quantity}</td>
                                <td class="stockQty">${stockDetails.stockQty}</td>
                                 <%-- <fmt:formatNumber var="price" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockDetails.price}" /> --%>
                                <td>${stockDetails.price}</td>
                                <%-- <fmt:formatNumber var="stockvalue" type="number" minFractionDigits="2" maxFractionDigits="2" value="${formattedBillableTime*price}" /> --%>
                                 <td class="stockVal">${stockDetails.stockValue}</td>
                                 
                                 <c:set var="description" value="${stockDetails.description}"></c:set>
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
                             <td></td>
                             <td></td>
                             <td></td>
                            
                             
                             <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                    
                                       <td style="padding:3px;width: 160px;"><div id="totalPackQty" style="white-space: nowrap;padding: 5px;background: #c1c1c1;">0.00</div></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalStockQty" style="white-space: nowrap;padding: 5px;background: #c1c1c1;">0.00</div></td>
                                       <td></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalStockValue" style="white-space: nowrap;padding: 5px;background: #c1c1c1;">0.00</div></td>
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}','${totalValue}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewWarehouseStorageStocks('warehouseStorageNormalStock','${stockType}',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>    
              </div>    
            </div><!-- /.box-body -->
        </div><!-- /.box -->

</div>

</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
            	debugger;
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false,
                 
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>