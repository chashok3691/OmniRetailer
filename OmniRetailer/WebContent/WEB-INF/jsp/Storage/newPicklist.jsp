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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/warehousepickList.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>

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
/*  
 * width: 100%; 
 
 margin-bottom: 15px; 
overflow-x: auto;
overflow-y: hidden;
-webkit-overflow-scrolling: touch;
-ms-overflow-style: -ms-autohiding-scrollbar;
border: 1px solid #DDD;

display: inline-block;
white-space: nowrap;
 */
$(document).ready(function(){
	debugger;
	callCalender('from');
		 
});
</script>
<body>



<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Pick List-New
			
		</h3>
		<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
            <div id="SuccessGenerate" style="text-align:center;color:blue;font-weight:bold;">${updateDtos[0].responseMsg}</div>
                
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
              <div class="col-lg-12" style=" background: #f4f4f4;    padding: 10px 20px;">
                  <div class="row">
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/> <span style="color:red; font-size:2">*</span></label>
                           <select class="form-control" id="outletLocation" >
	                            <c:forEach var="location" items="${locationsList}">
								<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:otherwise>
							    </c:choose>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
                    <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/> <span style="color:red; font-size:2">*</span></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
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
                 		<label>Picklist By <span style="color:red; font-size:2">*</span></label>
                	 	<input class="form-control  "  value="" style="background-color: white;" id="picklistby" size="20" type="text"  placeholder="Picklist By" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label>Picklist Name <span style="color:red; font-size:2">*</span></label>
                	 	<input class="form-control"  value="" style="background-color: white;" id="picklistName" size="20" type="text"  placeholder="Picklist Name" />
	              </div>
	            </div>
	           
                   
                      
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Stock Req Type</label>
                           <select class="form-control" id="stockReqtype" >
                           		 <option value="B2C Orders">B2C Orders</option>
                           		  <option value="Outlet Indents">Outlet Indents</option>
                           		   <option value="Both">Both</option>
	                           
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
                           <label>Section</label>
                           <select class="form-control" id="storageArea" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	              <div class="row" style="width:105%;">
				                                
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				                                    <label style="white-space:nowrap"><spring:message code="starttime.label" /></label>
                                         <div style="width:120%">
                                         <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">   
                                          <input type="text" name="starttimeOutStr" value='00:00:00' id="starttimeOutStr" class="form-control timepicker"  />
                                         
                                         </div>
                                         </div>
                                         </div>

				                                  </div>
				                                  
				                            
				                                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
				                                   <label style="white-space:nowrap"><spring:message code="endtime.label" /></label>
                                         <div style="width:120%">
                                         <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">   
                                          <input type="text" name="endtimeOutStr" value='00:00:00' id="endttimeOutStr" class="form-control timepicker"  />
                                         
                                         </div>
                                         </div>
                                         </div>
				                                  </div>
				                             </div>
		          </div>
                    </div>
                  </div>
                 
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
                       <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
				                      
				                      
				                       <div class="col-lg-8 col-xs-8" style="padding-left:0px;padding-right:0px">
                      
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="${searchName}" id="searchStocks" placeholder="Search Picklist" />
							<button id="mySearch" class="searchbutton"></button>
							
							</div>
						<input type="hidden" id="stock" value="${searchName}">
                    </div>
				                      
                 
                  
                  <div class=" col-lg-3" style="">
                           <div class="row">
                  <div class="col-lg-8" style="    padding-right: 0px;">
                  <a onclick="generatePickList()" class="run">Generate PickList....</a>
                  </div>
                  <div class="col-lg-4">
                     <a class="run" onclick="productStoragestocks()">Clear All</a>
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
                     <div id="picklistPage">
                      <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;min-height: 200px;">
                     <table id="productStoragestocks" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                                <th>Storage ref</th>
                                <th>SKU ID</th>
                             	<th>Description</th>
                             	<th >EAN/Scan Code</th>
                             	<th >Open Qty</th>
                             	<th >Required Qty</th>
                             	<th >Picked Qty</th>
                             	<th >Dif Qty</th>
                                <th >Closed Qty</th> 
                                <th>Damaged Qty</th>
                                <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                           <c:forEach var="stockDetails" items="${skuDetailsList}" varStatus="theCount">
                            <tr>
                                <td>${stockDetails.slNo}</td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td>${stockDetails.storageAreaRef}</td>
                             	<td>${stockDetails.skuID}</td>
                                <td>${stockDetails.description}</td>
                           </tr>
                           </c:forEach>
                         </tbody>
                     </table>
                     </div>
                     </div>


 <div class="row" style="text-align: right; margin-right: 25px;margin-top:10px">
							<input type="button" class="btnCls" style="padding: 4px 12px; !important"
								onclick="validatePickList('new');"
								value="<spring:message code="submit.label" />" />
							 <input type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="" value="Save" /> 
							 <input type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="viewWarehouseStoragePickList('warehouseStoragePickList','pickList','0','warehouse','menu');" value="Cancel" /> 
							
						</div>   
             
              </div>  
              
              
            </div><!-- /.box-body -->
        </div><!-- /.box -->

</div>

</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
        $(".timepicker").timepicker({
            showInputs: false,
            showMeridian:false,
            showSeconds:true,
            
        });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>