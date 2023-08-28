<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/skuMaster.jsp
 * file type		        : JSP
 * description				: The category details table is displayed using this jsp
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
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         
         <script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin:3px 0px 2px;
	/* margin-right: 2%;
	margin-top:1%; */
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
</style> 
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchwarehouseSKU").val($("#warehousesku").val());
//if($("#searchSKU").val().trim()!="")
	$("#searchwarehouseSKU").focus();
	
	
	$('#searchwarehouseSKU').on('input',function(e){
		if($(this).val().trim()==""){
			viewWarehouseSkuMaster('warehouseskumaster','0','');
		}
	});
	
	 $('#mySearch').click(function(){
		 debugger;
	        var search = $('#searchwarehouseSKU').val();
	        return viewWarehouseSkuMaster('warehouseskumaster','0','');
	    })
	    $('#searchwarehouseSKU').keypress(function(e){
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
                  
                  
                  <div id="Error" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                  
                  
                      
                      <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="warehouseCategory" onchange="searchSubCategories('warehouseCategory','outletSubcategory')">
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
                           <select class="form-control" id="outletLocation" ><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option> 
									                  <c:forEach var="location" items="${locationsList}">
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		
						 			<c:choose>
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
                  <a onclick="viewWarehouseSkuMaster('warehouseskumaster','0','')" style="padding: 4px 8px;     margin-bottom: 16px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
               
               
               
               
               
               
               
               
               
               <%-- 
                      <div class="box-body table-responsive">
                      <div class="row form-group">
		                     <div class="col-lg-5" style="padding-right: 5px;padding-left: 0px;">
		                      <div class="col-lg-4" style="padding-right: 5px;">
								          <label><spring:message code="location.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							              
								                 <select class="form-control" id="outletLocation" ><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                  <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
							                   </select>
							                 
								        	</div>
								        </div>
								       
								         <div class="col-lg-4" style="   padding-left: 5px;padding-right: 0px;">
								          
								        </div>
								        </div> --%>
								        <div class="col-lg-12" style="    margin-top: 18px;font-size: 16px;">
								         <span id="Errorid" style="color: red;"></span></div>
								      
								          <%--  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="padding: 4px 8px;    width: 100%;margin-top: 18px;" class="btn bg-olive btn-inline" onclick="viewWarehouseSkuMaster('warehouseskumaster','0','')" value="<spring:message code="search" />" />
								           </div> --%>
									      </div>
                          <div class="row">
		                       
		                <div class="col-lg-10" style="">
		                <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="searchwarehouseSKU" placeholder="<spring:message code="search.sku.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						
							<input type="hidden" id="warehousesku" value="${searchName}"></div>
	        	 		</div>
		              
		              
		              
		               <%--  <div class="col-lg-10">
	        	 		 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchwarehouseSKU" placeholder="<spring:message code="search.sku.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl warehouseskuMaster" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="warehousesku" value="${searchName}">
							<input type="hidden" id="flowUnder" >
	        	 		</div> --%>
		               <c:if test="${sessionScope.role == 'super admin'}"> 
		              	<div class="col-lg-1" style="padding-right: 0px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newWarehouseSku();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 2px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('warehouseSkumaster');" value="<spring:message code="delete.label" />">
								           </div>
							   
		               </c:if>
		               
                     <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                          <c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true}"> 
							<div class="col-lg-1" style="padding-right: 0px">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newWarehouseSku();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 2px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('warehouseSkumaster');" value="<spring:message code="delete.label" />">
								           </div>
						 </c:if>
					</c:forEach>
					</div>
                          <table id="example1" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                              </c:if>
                              <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                          		<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true}"> 
                             		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	</c:if>
                             </c:forEach>
                             	<th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 98px;">
										<div style="">SL No.</div></th>
                             	 <th><spring:message code="skuid.label" /></th>
                                 <th style="text-align: left;"><spring:message code="sku.description.label" /></th>
                                 <th><spring:message code="supplier.id.label" /></th>
                                 <th><spring:message code="warehouse.category.label" /></th>
                                 
                                 <th><spring:message code="status.label" /></th>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:forEach var="sku" items="${productsList}" varStatus="thecount">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${sku.skuID}' /></td>
                              </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}" varStatus="theCount">
                          		<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true}"> 
                             		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${sku.skuID}' /></td>
                             	</c:if>
                            </c:forEach>
                            	<td>${index+thecount.count-1}</td>
                            	 <td>${sku.skuID}</td>
                                 <td style="text-align: left;">${sku.description}</td>
                                 <td>${sku.supplierName}</td>
                                 <td>${sku.category}</td>
                                
                                 <td>${sku.status}</td>
                                 <td>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWarehouseSKU('${sku.skuID}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWarehouseSKU('${sku.skuID}','edit')">Edit</a>
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                         			 <c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWarehouseSKU('${sku.skuID}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach>
                                 </td> 
 							</tr>
                             </c:forEach>
                         </tbody>
                     </table>
                     
                     
 
                <div class="row" id="pagination">
              
              	<c:if test="${index-1 == 0 && totalRecords >10}">
            
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseSkuMaster('warehouseskumaster','${totalValue}','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseSkuMaster('warehouseskumaster','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseSkuMaster('warehouseskumaster','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseSkuMaster('warehouseskumaster','${totalValue}','')">
              	</div> 
              	</c:if>
              	
              	<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination1">
              		<c:if test="${(totalRecords)!= 0}">
              		<c:set var="totalRecords" value="${totalRecords-1}"></c:set>
              		</c:if>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*10)}" ${index-1 == i*10 ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-10}"></c:set>
              	</c:if>
              	
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewWarehouseSkuMaster('warehouseskumaster',document.getElementById('pagination1').value,'');" class="btn bg-olive btn-inline  addBtn" value="GO">
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
            $(function() {
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>