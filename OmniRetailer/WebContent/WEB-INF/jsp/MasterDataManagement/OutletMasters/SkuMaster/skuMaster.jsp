<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/skuMaster.jsp
 * file type		        : JSP
 * description				: The category details table is displayed using this jsp
 * */ -->

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
      
       <%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/JsBarcode.ean-upc.min.js"></script> --%>
        <%--   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">

.buttons {
	float: right;
	padding-top: 0px;
	margin:3px 0px 2px;
	/* margin-right: 2%;
	margin-top:1%; */
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
.wrapper {
    /* border:1px solid #000;
    display:inline-block; */
    position:relative;
}



/* 
.searchbutton{
background-image: url(../images/search.png);
    background-position: right;
    text-align: left;
    height: 30PX;
    background-repeat: no-repeat;
    margin-bottom: 2px;
    background-origin: content-box;
    width: 41px;
    padding: 4px 10px;
    border-left: 1px solid #ccc;
    /* background: #3c8dbc; */
    z-index: 999;
    position: absolute;
    background-color: #3c8dbc;
        right: 0;
    top: 0;
} */
</style> 
<script type="text/javascript">
$(document).ready(function(){
/* 	$('#example1').dataTable( {
		 // "searching": false
		} ); */
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchSKU").val($("#sku").val());
//if($("#searchSKU").val().trim()!="")
	$("#searchSKU").focus();
});


$('document').ready(function(){
	
	
	$('#SkuMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewSkuMaster('skumaster','0');
		}
	});
	
    $('#mySearch').click(function(){
        var search = $('#SkuMaster').val();
        return searchSkuMaster(search,'','0');
    })
    $('#SkuMaster').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });

});



</script>     
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
  			<div class="box-header" align="center">
                   <h3 class="box-title"><spring:message code="allSku.label" /></h3>
               </div><!-- /.box-header -->
                      <div class="box-body table-responsive">
                      <div class=" ">
                        <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                      
                      <div class="col-lg1-2 col-lg-3 form-group">
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
                    <div class="col-lg1-2 col-lg-3 form-group">
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
                     <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                            		 <%-- <option value=""><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${locationsList}">
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 	<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           <c:choose>
                           <c:when test="${subcategory == ''}">
                             <option value=""><spring:message code="ALL.label"/></option>
                          </c:when>
                           <c:otherwise>
                              <option value="${subcategory}">${subcategory}</option>
                            <option value=""><spring:message code="ALL.label"/></option>
                           </c:otherwise>
                           		 </c:choose>
                           		
	                           
	                        </select>
                      </div>
                      </div>
                     
                   
                     
                       <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == supplierid ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-3 form-group">
                   
                      </div>
                    
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    padding: 10px 15px;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewSkuMaster('skumaster','0')" style="padding: 4px 8px;     margin-bottom: 16px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                      
                      
								        <div class="col-lg-12" style="    margin-top: 18px;font-size: 16px;">
								         <span id="Errorid" style="color: red;"></span></div>
								      
								         
									      </div>
                          <div class="row">
                               <div class="col-lg-1 col-xs-2" style="">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewSkuMaster('skumaster','0')">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
		                <div class="col-lg-8">
		                <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="SkuMaster" placeholder="<spring:message code="search.sku.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						
							<input type="hidden" id="sku" value="${searchName}"></div>
	        	 		</div>
		               <c:if test="${sessionScope.role == 'super admin'}"> 
		           	<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newSku();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('sku');" value="<spring:message code="delete.label" />">
								           </div>
								           
		               </c:if>
                     <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                          <c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true}"> 
							<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newSku();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('sku');" value="<spring:message code="delete.label" />">
								           </div>
								          
						 </c:if>
					</c:forEach>
					 <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return printBarcodes('sku');" value="Print">
<!-- 								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return printbarcodes('sku');" value="Print"> -->
								           </div>
					</div>
					
					  <c:forEach var="sku" items="${skuList}" >
                             
                       <c:forEach var="pluvalue" items="${sku.skuPriceLists}" varStatus="condition">
                       		<c:set var="priceListExist" value="${true}"/>        
						</c:forEach>
					</c:forEach>
					
					
					
                          <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             
                           
                             		<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	
                             	<th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 98px;">
									SL No.</th>
									<c:choose>
									<c:when test="${priceListExist}"> 
									<th colspan="2" ><spring:message code="skuid.label" /></th>
								
                            		<th colspan="2" style="text-align: left;"><spring:message code="sku.description.label" /></th>
                            	
                               </c:when>
                               <c:otherwise>
                               <th><spring:message code="skuid.label" /></th>
                            		<th style="text-align: left;"><spring:message code="sku.description.label" /></th>
                               
                               </c:otherwise>
                               </c:choose>
                                 <th><spring:message code="manufacturer.label" /></th>
                                 <th><spring:message code="model.name.label" /></th>
                                  <th><spring:message code="stocks.label" /></th>
                                  <th>Category</th>
                                 <th><spring:message code="status.label" /></th>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                                  	 <th>No. of Prints</th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:forEach var="sku" items="${skuList}" varStatus="totalskus">
                             <tr>
                               <c:forEach var="pluvalue" items="${sku.skuPriceLists}" varStatus="condition">
                                <c:set var="singleplucode" value="${pluvalue.pluCode}"  />
                                <c:set var="conditioncount" value="${condition.count}"  />
                                <!-- added by Manoj for Print Barcodes Service  -->
                                	<input type="hidden" id="sltdSkuId${singleplucode}" value="${pluvalue.skuId}">
                             		<input type="hidden" id="sltdSkuEan${singleplucode}" value="${pluvalue.ean}">
                             		<input type="hidden" id="sltdSkuPlu${singleplucode}" value="${pluvalue.pluCode}">
                             		<input type="hidden" id="sltdSkuDesc${singleplucode}" value="${pluvalue.description}">
                             		<input type="hidden" id="sltdSkuMrp${singleplucode}" value="${pluvalue.price}">
                             		<input type="hidden" id="sltdSkuSaleprice${singleplucode}" value="${pluvalue.salePrice}">
                             	<!-- added by Manoj for Print Barcodes Service  -->
                                
                               </c:forEach>
                        
                             		<td>
                             		<c:choose>
                             		<c:when test="${sessionScope.customerId eq 'CID8995460' || sessionScope.customerId eq 'CID8995456'}">
                                    <c:if test="${conditioncount == '1' && fn:length(sku.skuId)>6}">
                             		<input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${singleplucode}' />
                             		</c:if>														
									</c:when>
									<c:otherwise>
									<c:if test="${conditioncount == '1' && fn:length(sku.ean)>12}">
                             		<input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${singleplucode}' />
                             		</c:if>
									</c:otherwise>
									</c:choose>
                             		</td>
                             
                            	<td>${sku.slNo}</td>
                            	<c:choose>
									<c:when test="${priceListExist}"> 
                            	
                            	 <td>${sku.skuId}</td>
                            	  <td></td>
                                 <td style="text-align: left;">${sku.description}</td>
                                 <td></td>
                                </c:when>
                                <c:otherwise>
                                 <td>${sku.skuId}</td>
                                 <td style="text-align: left;">${sku.description}</td>
                                </c:otherwise>
                                </c:choose>
                                 <input type="hidden" id="${singleplucode}ean" value="${sku.ean}"/>
                                    <c:set var="stock" value="0"  />
                                 <td>${sku.make}
                                 </td>
                                 <td>${sku.model}</td>
                                  <td>
                                   <c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="thecount">
                                   <c:choose>
                                   <c:when test="${selectedLocation eq plu.storeLocation}">
                                     <c:set var="stock" value="${stock+plu.quantityInHand}"  />
                                   </c:when>
                                   <c:when test="${selectedLocation eq ''}">
                                   <c:set var="stock" value="${stock+plu.quantityInHand}"  />
                                   </c:when>
                                   </c:choose>
                                   
                                   </c:forEach>
                                   <fmt:formatNumber type = "number" maxIntegerDigits = "5" value = "${stock}" />
                                  
                                  </td>
                                  <td>${sku.productCategory}</td>
                                 <td>${sku.status}</td>
                                 <td>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSKU('${sku.skuId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSKU('${sku.skuId}','edit')">Edit</a>
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                         			 <c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSKU('${sku.skuId}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach>
                                 </td> 
                                 <td>
                                 <c:if test="${conditioncount == '1' }">
                                 <input type="number" style="width:50px;text-align: center;" value="1" id="${singleplucode}no"/>
                                 </c:if>
                                  <c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="defaultplu">
                                  <c:if test="${defaultplu.count == 2}">
                                  <a  class="clickable" data-toggle="collapse" id="row${totalskus.count}" data-target=".row${totalskus.count}"> <span style="font-size: 17px" onclick="expand(${totalskus.count})" id="categoryExpand${totalskus.count}"><i class="fa fa1 fa-sort-desc"></i></span></a>
                               </c:if>
                                </c:forEach>
                               </td>
 							</tr>
 							  <tr  class="collapse rowone${totalskus.count}">
                                             
                                             <td style="" align="center" ><%-- <input type='checkbox' name='selectall'  value="${sku.skuId}"> --%></td>
                                            	 <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">SL No.</div></td>
                                            	 <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">Description</div></td>
                                            	 
                                            	<td style="padding:3px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="measurement.range.label" /></div></td>
                                            	<td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">Batch No.</div></td>
                                            	
                                            	<td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="grade.label" /></div></td>
                                            	<td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="color.label" /></div></td>
                                                <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="size.label" /></div></td>
                                                 <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="ean.label" /></div></td>
                                                <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="stock.label" /></div></td>
                                               <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="location.label" /></div></td>
                                             
                                               <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">No. of Prints</div></td>
                                              
                                                </tr>
                                                
                                                <c:forEach var="plucode" items="${sku.skuPriceLists}" varStatus="totalpricelists">
                                                  <tr  class="collapse rowone${totalskus.count}">
                                             
                                            	<td >
                                            	
                                            	
                                            		<c:choose>
                             		<c:when test="${sessionScope.customerId eq 'CID8995460'|| sessionScope.customerId eq 'CID8995456'}">

                                   <c:if test="${ fn:length(sku.skuId)>6}">
                             		<input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${singleplucode}' />
                             		</c:if>														
									</c:when>
									<c:otherwise>
									 <c:if test="${fn:length(plucode.ean)>12}">
                                            	<input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${plucode.pluCode}' />
                                            	</c:if>
									</c:otherwise>
									</c:choose>
                                            	
                                            	
                                            	
                                            	
                                            	
                                            	</td>
                                            	 <td>${totalpricelists.count}</td>
                                            	<td>${plucode.description}</td>
                                            	<td >${plucode.measureRange}</td>
                                            	<td>${plucode.productBatchNo}</td>
                                            	<td >
                                            	${plucode.productRange}</td>
                                                <td >${plucode.color}</td>
                                                 <td >${plucode.size}</td>
                                                 <input type="hidden" id="${plucode.pluCode}ean" value="${plucode.ean}"/>
                                                <td >${plucode.ean}</td>
                                               <td >${plucode.quantityInHand}</td>
                                             
                                               <td>${plucode.storeLocation}</td>
                                               <td><input type="number" style="width:50px;text-align: center;" value="1" id="${plucode.pluCode}no"/></td>
                                              
                                                </tr>
                                                
                                                </c:forEach>
                                                
                                                
                             </c:forEach>
                         </tbody>
                     </table>
                     
                     
                    <!--  below code is for barcode Generation -->
						<div style="display: none;">
						<c:set var="distictvalue" value="0"></c:set>
							<c:forEach var="skulist" items="${skuList}">
								<c:set var="dataExists" value="false"></c:set>
								
								
								<c:forEach var="plu" items="${skulist.skuPriceLists}"
									varStatus="distict">
									<input type="hidden"  value="${plu.measureRange}" id="measureRange">
										<input type="hidden"  value="${plu.expiry_date}" id="expirydate">
								<input type="hidden" value="${distict.count}"/>
								<c:set var="distictvalue" value="${distictvalue+1}"></c:set>
								<c:if test="${sessionScope.customerId eq 'CID8995456'}">
							
								<c:set var="ean" value="111112222212345"></c:set>
								
								</c:if>
								<c:if test="${sessionScope.customerId ne 'CID8995456'}">
								<c:set var="ean" value="${plu.ean}"></c:set>
								</c:if>
									<c:set var="skuidbarcode" value="${plu.skuId}"></c:set>
								
										
<%-- <c:if test="${ean.matches('[0-9]+')}"> --%>
										<c:choose>
										
										<c:when test="${ean.matches('[0-9]+') }">
										<c:choose>
											<c:when test="${fn:length(plu.ean)>12 }">
												<c:choose>
												<c:when test="${sessionScope.customerId eq 'CID8995456'}">
<!-- 													<input type="hidden" value="vmart"> -->
														<%@ include file="navyug.jsp"%>
													</c:when>
													<c:when test="${sessionScope.customerId eq 'CID8995457'}">
													<input type="hidden" value="vmart">
														<%@ include file="vmart.jsp"%>
													</c:when>
													<c:when test="${sessionScope.customerId eq 'CID8995464'}">
<!-- 													<input type="hidden" value="vmart"> -->
														<%@ include file="goodSeeds.jsp"%>
													</c:when>
													
													<c:when test="${sessionScope.customerId eq 'CID8995460'}">
<!-- 													<input type="hidden" value="vmart"> -->
														<%@ include file="victoryBazar.jsp"%>
													</c:when>
													
													<c:when test="${category eq 'APPAREL'}">
														<%@ include file="barcodeprint.jsp"%>
													</c:when>
													<c:when test="${category eq ''}">
														<%@ include file="barcodeprint.jsp"%>
													</c:when>
													<c:otherwise>
														<input type="hidden" id="testweugf" />
														<%@ include file="barcodefootwear.jsp"%></c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
											<c:choose>
													 	<c:when test="${sessionScope.customerId eq 'CID8995460'}">
<!-- 													<input type="hidden" value="vmart"> -->
														<%@ include file="victoryBazar.jsp"%>
													</c:when> 
													<c:when test="${sessionScope.customerId eq 'CID8995456'}">
<!-- 													<input type="hidden" value="vmart"> -->
														<%@ include file="navyug.jsp"%>
													</c:when>
													</c:choose>
													
													</c:otherwise>
											</c:choose>
										
										</c:when>
										
								
										
										
									
											
										</c:choose>
									

									
								</c:forEach>
							</c:forEach>

						</div>

						<div class="row" id="pagination">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSkuMaster('skumaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSkuMaster('skumaster','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSkuMaster('skumaster','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSkuMaster('skumaster','${totalValue}')">
              	</div> 
              	</c:if>
              		<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination1">
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
              		  <input type="button" onclick="viewSkuMaster('skumaster',document.getElementById('pagination1').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>
                 </div><!-- /.box-body -->
             </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
           /*  $(function() { 
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "scrollX": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            }); */
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>