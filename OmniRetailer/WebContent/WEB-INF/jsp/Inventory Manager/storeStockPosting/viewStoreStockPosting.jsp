<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/warehouse/stockverification/stockposting.jsp
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
        
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/outlet.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
        	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/stockUpload.js"></script>
      
        
        <style>
        
        a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
        </style>



<script type="text/javascript">
$(document).ready(function(){

	
});
</script>  

</head>
<body>
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary" style="padding: 10px;pointer-events:none">
   <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Stock Uploading-View
		</h3>
		</div>
		
	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
		
<div class="row" style="margin-top:15px;padding:14px">
<div class="col-lg-12">

<div class="row">
<div class="col-lg-2">
<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;">Upload Ref</label>
                	 	<input class="form-control" style="background-color: white;" id="uploadReferenceId" type="text" value="${StockPostingList[0].verification_code}" placeholder="Upload Reference" />
	              </div>

</div>
<div class="col-lg-2">
<div class="bootstrap-timepicker">
           <label style="font-family: Calibri;color: gray;">Verify Start Time</label>
             <input type="text" class=" form-control timepicker" value="00:00:00" name="startTime" id="startTime">
               <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
 			</div>
 
</div>

<div class="col-lg-2">
 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;">Devision</label>
                	 	<input class="form-control" style="background-color: white;" id="devision" type="text" value="" placeholder="Devision" />
	              </div>

</div>

<div class="col-lg-2">
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
<div class="col-lg-2">
	               
 </div>
 <div class="col-lg-2">
	               
 </div>
</div>
<div class="row" style="margin-top: 20px;">
<div class="col-lg-2">
  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;">Date Time</label>
                	 	<input class="form-control calendar_icon form-group" style="background-color: white;padding: 5px !important;" id="dateTime" size="20" type="text" onfocus="callCalender('dateTime')" onclick="callCalender('dateTime')" value="${StockPostingList[0].verifiedOn}" placeholder="Date/time" />
	              </div>

</div>
<div class="col-lg-2">
  <div class="bootstrap-timepicker">
         <label style="font-family: Calibri;color: gray;">Verify End Time</label>
            <input type="text" class=" form-control timepicker" value="00:00:00" name="endTime" id="endTime">
                <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
          </div>

</div>

<div class="col-lg-2">
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

<div class="col-lg-2">
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
<div class="col-lg-2">
	               
 </div>
 <div class="col-lg-2">
	               
 </div>
</div>

 


</div>

</div>

 <div class="row" style="margin-top: 30px;">
   <%-- <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div> --%>
                       
                        <%-- <div class="col-lg-12" style="width: 98.5%;">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchStockPosting" placeholder="Search Items" />
											<button id="StockPosting" class="searchbutton"></button>
											</div>
											
				                  </div> --%>
                       
                        
                       
                       
                       </div> 

<%-- <div class="row" style="margin-top: 30px;">
   <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                       
                        <div class="col-lg-11 col-xs-10" style="margin-left: -15px;">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchStockPosting" placeholder="Search Items" />
											<button id="StockPosting" class="searchbutton"></button>
											</div>
											
				                  </div>
                       
                        
                       
                       
                       </div> --%>

 
                                    <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;pointer-events: all;">
                   
                     <table id="StockUploadingList" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             
                              <tr>
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="sku.id.label" /></th>
                             	<th><spring:message code="sku.description.label" /></th>
                             	<th>EAN</th>
                             	<th>MRP</th>
                             	<th>Size</th>
                             	<th>Color</th>
                             	<th>Model</th>
                             	<th>Batch NO</th>
                             	<!-- <th>Expiry Date</th> -->
                             	<th><spring:message code="costprice.label" /></th> 
                             	<th>Stock Qty</th> 
                             	<th>Dump Qty</th>
                             	<!-- <th>Action</th> -->
                             
                            </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="item" items="${StockPostingList}" varStatus="theCount">
                        
                         <tr>  
                           <td id="slno${theCount.count}">${theCount.count}</td>
                           <td id="skuid${theCount.count}">${item.sku_id}</td>
                           <td id="description${theCount.count}">${item.skuDescription}</td>
                           <td id="ean${theCount.count}">${item.ean}</td>
                           <td id="mrp${theCount.count}">${item.mrp}</td>
                           <td id="size${theCount.count}">${item.size}</td>
                           <td id="color${theCount.count}">${item.color}</td>
                           <td id="model${theCount.count}">${item.model}</td>
                           <td id="batchno${theCount.count}">${item.productBatchNo}</td>
                          <%--  <td id="expirydate${theCount.count}"></td> --%>
                           <td id="skucostprice${theCount.count}">${item.skuCostPrice}</td>
                           <td id="stockqty${theCount.count}">${item.sku_physical_stock}</td>
                           <td id="dumpqty${theCount.count}">${item.dumpQty}</td>
         				   <%-- <td id="action${theCount.count}"></td> --%>
                           <%-- <td id="stock${theCount.count}" contenteditable="true" onblur="addclassslNo('${theCount.count}')" >${item.sku_physical_stock}</td> --%> 
         
          <input type="hidden" id="slnos${theCount.count}" value="${item.s_no}">
          <input type="hidden" id="verefcode${theCount.count}" value="${item.verification_code}">
         <input type="hidden" id="verefref${theCount.count}" value="${item.verification_reference}">
         <input type="hidden" id="masterver${theCount.count}" value="${item.masterVerificationCode}">
         <input type="hidden" id="verefby${theCount.count}" value="${item.verifiedby}">
         <input type="hidden" id="plucode${theCount.count}" value="${item.pluCode}">
         <input type="hidden" id="location${theCount.count}" value="${item.location}">
         <input type="hidden" id="status${theCount.count}" value="${item.status}">
         <input type="hidden" id="bookqty${theCount.count}" value="${item.bookedQty}">
         
                           </tr>
                         </c:forEach>
                         </tbody>
                     </table>
          </div>
					
					<div class="row" style="margin-top: 10px;">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStoreStockPostingData('','${totalValue}','${flowUnder}','${StockPostingList[0].verification_code}','view');">
              	</div>                                                                   
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStoreStockPostingData('','${index - 11}','${flowUnder}','${StockPostingList[0].verification_code}','view');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStoreStockPostingData('','${index - 11}','${flowUnder}','${StockPostingList[0].verification_code}','view');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStoreStockPostingData('','${totalValue}','${flowUnder}','${StockPostingList[0].verification_code}','view');">
              	</div> 
              	</c:if>
              	
              	
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
              		  <input type="button" onclick="viewStoreStockPostingData('',document.getElementById('pagination').value,'${flowUnder}','${StockPostingList[0].verification_code}','view');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>	
	
	<div class="row" style="text-align: center;margin-top:50px;pointer-events:all">
						<input type="button" class="btnCls " style="margin-left:50px" onclick="viewOutletStockUploading('outletStockUploading','0','outlet','menu','','');" value="<spring:message code="cancel.label" />" />
						</div>
	
						 
          
</div>
</div>
</div>
</section>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
      
  });

  </script>
</body>
</html>