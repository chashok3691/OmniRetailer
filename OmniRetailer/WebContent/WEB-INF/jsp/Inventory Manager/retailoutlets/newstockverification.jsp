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
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
</head>
<style>
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
  .col-lg-6{
margin-bottom: 5px;
}
.col-lg-4{
margin-bottom: 5px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 36px;
    padding-top: 7px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
    text-transform: uppercase;
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
    padding: 7px 10px 26px 10px;
    background: #777;
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
    height: 30px;
    padding: 0px 6px;
    }
    
   .form-group {
    margin-bottom: 10px;
}
</style>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	 

<script type="text/javascript">
$(document).ready(function(){
	
	callCalender('from');
	callCalender('to');
	 
	
	
	
	$("#approvedBy").keydown(function()
			{
		$("#approvedByError").html("");
		("#Error").htnl("");
			});
	
	$("#from").change(function()
			{
		$("#fromError").html("");
		("#Error").htnl("");
			});
	$("#to").change(function()
			{
		$("#toError").html("");
		("#Error").htnl("");
		});
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
      <div class="box-header" style="text-align:center;">
		<h3 class="box-title" style="    font-size: 18px;font-weight: 700;">
			<spring:message code="createstockverification_master.label" />
		</h3>
		</div><!-- /.box-header -->
		<br>
		<br>
             <div class="box-body table-responsive">
             <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
             <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                  <input type="hidden" id="flowUnder" value="${flowUnder}">
                    <input type="hidden" id="verification_code" value="${verification_code}">
                  <div class="row">
                      <div class="col-lg1-4 col-lg-4">
                      <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-4 col-lg-4">
                       <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-4 col-lg-4">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
	           
                    </div>
                    
                    <div class="row" style="margin-top: 5px">
                    <div class="col-lg1-4 col-lg-4">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-4 col-lg-4">
                         <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-4 col-lg-4">
                        <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      
                    
                    </div></div>
                    
                  
                     <div class="row">
                          <div class="col-lg1-4 col-lg-4">
                           <div class="col-lg-2"></div>
             			 <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              <span id="fromError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
	            </div>
                    <div class="col-lg-4">
                     <div class="col-lg-2"></div>
                    <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
		           <div class="bootstrap-timepicker">
                                            <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" value="00:00:00" name="startTime" id="startTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div></div>
		          
		          </div>
                      
                      
                      <div class="col-lg1-4 col-lg-4">
                           <div class="col-lg-2"></div>
             			 <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                 		<label>Approved By</label>
                	 	<input class="form-control" name="approved_by" onblur="criteria(this)" id="approvedBy" placeholder="Enter Name" type="text" value="">
	            <span id="approvedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
	            </div>
                      
                      
                      
                      
                      
                      
                      </div>
                     
                      <div class="row">
                      <div class="col-lg1-4 col-lg-4">
                       <div class="col-lg-2"></div>
	               <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		        <span id="toError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		           </div>
		          </div>
		          
		          <div class="col-lg-4">
		           <div class="col-lg-2"></div>
		          <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
		           <div class="bootstrap-timepicker">
                                            <label><spring:message code="endtime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" value="00:00:00" name="startTime" id="endTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div></div>
		          
		          </div>
		            <div class="col-lg-4 col-xs-4 ">
		             <div class="col-lg-2"></div>
		            <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
		             <label><spring:message code="status.label"/></label>
                                            <select class="form-control" style="height:30px;" name="searchType" id="searchType" onchange="searchStocks('','','0');">
                                            <option value="In Progress">In Progress</option>
                                           <!--  <option value="Write Off">Write Off</option> -->
                                            </select>
                                     </div></div>
                    </div>
                  <div class="row">
                  <div class="col-lg-12">
                  <div class="">
                  <div class="">
                  <div class="">
                    <div class="form-group col-lg-12" style="padding-left: 5.2%;padding-right: 5.2%">
	                                <label><spring:message code="description.label" /></label>
	                                <textarea  rows="5" onblur="criteria(this)" class="form-control" style="resize:none;" id="description" name="eventDescription" placeholder="<spring:message code="description.label" />" ></textarea>
	                                <span style="color:red; font-size:2" id="eventdescriptionError"></span>
								</div></div></div></div>
                  </div>
                  
                  </div>
                    <div class="row">
                  
                  <div class=" col-lg-12" style="">
                           <div class="row">
                  <div class="col-lg-6" style="    padding-right: 0px;">
                   <div class="col-lg-6" style="padding-right: 0px;"></div>
                    <div class="col-lg-3" style=" padding-right: 0px;">
                    
                    <a class="btnCls" onclick="validatestockverificationform(this);" class="run"><spring:message code="submit.label"/></a>
                    </div>
                  
                  </div>
                  <div class="col-lg-6">
                   <div class="col-lg-3" style="    padding-right: 0px;">
                    <%--  <a class="run" onclick="viewStockVerification('outletStockVerification','0','outlet','menu');"><spring:message code="cancel.label"/></a> --%>
                   </div>
                   
                    <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
			           <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
			                <c:if test="${accessControl.appDocument == 'OutletStockVerification' && accessControl.write == true && accessControl.read == true}">
			                <input type="button" class="btnCls buttonMargin" style="margin-left:25%;" onclick="viewStockVerification('outletStockVerification','0','outlet','menu');" value="<spring:message code="cancel.label"/>">
		                	</c:if>
		                </c:forEach>
		             </c:if>
                   
                   
                    <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
			           <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
			                <c:if test="${accessControl.appDocument == 'WarehouseStockVerification' && accessControl.write == true && accessControl.read == true}">
			                	<input type="button" class="btnCls buttonMargin" style="margin-left:25%;" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu');" value="<spring:message code="cancel.label"/>">
		                	</c:if>
		                </c:forEach>
		             </c:if>
                   
                   
                   
                    <div class="col-lg-6" style="    padding-right: 0px;"></div>
                   
                  </div>
                   
                  </div>
                        </div>
                       
                    </div>
                   
                  
              </div>    
            </div><!-- /.box-body -->
        </div><!-- /.box -->

</div>

</section>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
     
  });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>