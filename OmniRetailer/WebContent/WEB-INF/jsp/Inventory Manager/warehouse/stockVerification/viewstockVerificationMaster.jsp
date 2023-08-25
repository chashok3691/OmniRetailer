<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manasa
 * file name		        : inventorymanager/warehouse/stockVerification/viewstockVerificationMaster.jsp
 * file type		        : JSP
 * description				: All stock verification master details displayed using this jsp
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
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript">
$(document).ready(function(){
	debugger
	callCalender('from');
	callCalender('to');
	selectProductGroupOnly();
	var periodicType=$("#periodic").val();
	 var repetitive = $("#repetitive").val();
	    $('.dailySubblock').hide();
	  
	    	if(periodicType=="Weekly")
	    		$('.weeklySubblock').show();
	    	else
	    		$('.weeklySubblock').hide();
	    	if(periodicType=="Daily")
	    		$('.dailySubblock').show();
	    	else
	    		$('.dailySubblock').hide();
	    	if(periodicType=="Monthly")
	    		$('.monthlySubblock').show();
	    	else
	    		  $('.monthlySubblock').hide();
	    	debugger
	 
				 if(repetitive == "true"){
				  if ($('input[name="repetitive"]').is(':checked') ) {
					
			$('#weeklyBtn').click(function(){
			 	
	    	 if($('.weeklyRadioBtn').is(":checked")){
	             $('.weeklySubblock').show();
	         } else {
	             $('.weeklySubblock').hide();
	         }     

	    	 if($('.dailyRadioBtn').is(":checked")){
	             $('.dailySubblock').show();
	         } else {
	             $('.dailySubblock').hide();
	         }   
	    	 if($('.monthlyRadioBtn').is(":checked")){
	             $('.monthlySubblock').show();
	         } else {
	             $('.monthlySubblock').hide();
	         }   
	    	
	    });
			  }
				 
				 
			}
	 
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
                     <input type="hidden" id="periodic" value="${whstockverifiObj.periodicType}">
<%--                       <input type="hidden" id="repetitive" value="${whstockverifiObj.isPeriodic}"> --%>
                    <input type="hidden" id="verification_code" value="${whstockverifiObj.verification_code}">
                  <div class="row">
                      <div class="col-lg1-3 col-lg-3">
                      <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" readonly>
                           			<option value="${whstockverifiObj.location}">${whstockverifiObj.location}</option>
	                            <c:forEach var="location" items="${locationsList}">
									
						 		<%-- <option value="${location}" ${location == whstockverifiObj.location ? 'selected' : ''}  id="location" >${location}</option> --%>
						 		</c:forEach>
	                        </select>
                      </div>
                       <input type="hidden" id="maxRecords" value="${maxRecords}">
                      </div>
                      <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == whstockverifiObj.productcategory ? 'selected' : ''}  id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-3 col-lg-3">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId"  >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == whstockverifiObj.brand ? 'selected' : ''} id="${brandsList}"   >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
	           
	           
	           
	             <div class="col-lg1-3 col-lg-3">
                           <div class="col-lg-2"></div>
             			 <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                 		<label>Approved By</label>
                	 	<input class="form-control" name="approved_by" id="approvedBy"  placeholder="Enter Name" type="text" value="${whstockverifiObj.approvedBy}">
	              </div>
	            </div>
	           
	           
	           
	           
                    </div>
                    
                    <div class="row" style="margin-top: 5px">
                    <div class="col-lg1-3 col-lg-3">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId"  >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option  value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == whstockverifiObj.department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-3 col-lg-3">
                         <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == whstockverifiObj.subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}"  >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-3 col-lg-3">
                        <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                          <%-- <label><spring:message code="model.label"/></label>
                            	<select class="form-control" id="outletDepartmentId"  >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''}  id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select> --%>
	                        <label>Group</label>
                       		<select class="form-control" name="outletProductGroup" id="outletProductGroup" onclick="selectProductGroupOnly();">
	                                        <option value="" >ALL</option>
	                                        <c:forEach var="groupsList" items="${groupsList}">
	                            			<option value="${groupsList.groupId}" ${groupsList.groupId == whstockverifiObj.groupId ? 'selected' : ''}>${groupsList.groupId}</option>
											</c:forEach>
	                  		</select>
                      </div>
                      
                    
                    </div>
                  
                    <div class="col-lg-3 col-xs-3 ">
		             <div class="col-lg-2"></div>
		            <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
		             <label><spring:message code="status.label"/></label>
		               <%-- 
                                           <c:choose>
                                           <c:when test="${status=='Write Off'}">
                                            <select class="form-control" style="height:30px;" name="searchType" id="searchType" onchange="searchStocks('','','0');">
                                            <option value="${status}">closed</option>
                                           <!--  <option value="In Progress" >In Progress</option> -->
                                           <!--  <option value="Write Off">Write Off</option> -->
                                            </select>
                                           
                                           </c:when>  --%>
                                           
                                           <c:set var = "status" scope = "page" value = "${whstockverifiObj.status}"/>
                                           <c:choose>
                                          <c:when test="${empty status}">
                                            <input class="form-control" id="status" readonly placeholder="" type="text" value="">
                                          
                                          </c:when>
                                          <c:otherwise>
                                            <select class="form-control" style="height:30px;" name="searchType" id="searchType">
                                            <option value="In Progress" ${'In Progress' == whstockverifiObj.status ? 'selected' : ''} >In Progress</option>
                                            <option value="Disabled" ${'Disabled' == whstockverifiObj.status ? 'selected' : ''} >Disabled</option>
                                           
                                           <!--  <option value="In Progress" >In Progress</option> -->
                                           <!--  <option value="Write Off">Write Off</option> -->
                                            </select>
                                         </c:otherwise>
                                         </c:choose>
                                     </div></div>
                    
                    
                    
                    
                    
                    </div>
                    
                    
                    
                      <div class="row" style="margin-top: 5px">
                    
                    <div class="col-lg1-4 col-lg-3">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                         <c:choose>
                          <c:when test="${whstockverifiObj.allowMultiplesForDay ==true}">
                           <input type="checkbox"  name="allowMultipleDays"  id="allowMultipleDays"  checked style="margin-top:5px;zoom: 1.5;" > 
                         </c:when>
                       <c:otherwise>
                         <input type="checkbox"  name="allowMultipleDays"  id="allowMultipleDays"   style="margin-top:5px;zoom: 1.5;" >
                       </c:otherwise>
                       </c:choose>
                      </div>
                      <label style="margin-top: 6px;"><spring:message code="allow.multiple.verification.label"/></label>
                      </div>
                    
                    </div>
                  
                    
                    
                  <br>
                    <%--  <div class="row">
                          <div class="col-lg1-4 col-lg-4">
                           <div class="col-lg-2"></div>
             			 <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group"  value="${whstockverifiObj.verificationStartDateStr}"  style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
                    <div class="col-lg-4">
                     <div class="col-lg-2"></div>
                    <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
		           <div class="bootstrap-timepicker">
                                            <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" value="${whstockverifiObj.startTime}"  name="startTime" id="startTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div></div>
		          
		          </div>
                      
                      
                    
                      
                      
                      
                      
                      
                      
                      </div>
                     
                      <div class="row">
                      <div class="col-lg1-4 col-lg-4">
                       <div class="col-lg-2"></div>
	               <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group"   value="${whstockverifiObj.verificationEndDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          <div class="col-lg-4">
		           <div class="col-lg-2"></div>
		          <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
		           <div class="bootstrap-timepicker">
                                            <label><spring:message code="endtime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker"  value="00:00:00" name="startTime" id="startTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div></div>
		          
		          </div>
		            
                    </div> --%>
                    
                    
                    
                    
                    
                    
                       <div class="row">
                  
									   <div class=" col-lg-12" style="">
									   
									      <div class="col-lg-11" style="">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="verification.schedule.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                       </div>  </div>
                                      </div>
                
                     
                     <div class="row">
                     
                     
                       <div style="padding-left:0px;">  
                                    <div class=" col-lg-3">
                                    <div class="row">
	                                 
                                  		 <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8">
                                          <label><spring:message code="offer_start_date.label"/><span class="requiredField">*</span></label>
                	 	<input class="form-control calendar_icon form-group"  value="${whstockverifiObj.verificationStartDateStr}"  style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                                        </div>
                                        </div>
                                       
                                  		<div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8" style="margin-top:-10px;">
                                            <label ><spring:message code="offer_end_date.label"/><span class="requiredField">*</span></label>
	                 	<input class="form-control calendar_icon form-group"   value="${whstockverifiObj.verificationEndDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                                        </div>
                                        </div></div></div></div>
                     
                     
                     
                  
                     <div class="row">
                     
                     
                       <div style="padding-left:0px;">  
                                    <div class="form-group col-lg-3">
                                    <div class="row">
	                                 
                                  		 <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8">
                                          <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                	 <div class="input-group"> 
                	 <input type="text" class="form-control timepicker"   name="startTime" id="startTime" value="${whstockverifiObj.startTimeStr }"/>
                                       <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div></div>
                                        </div>
                                        </div>
                                       
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8">
                                           <label><spring:message code="endtime.label"/> <span class="requiredField">*</span></label>
	                 	   <div class="input-group"> 
	                 	  <input type="text" class="form-control timepicker"  name="startTime" value="${whstockverifiObj.endTimeStr}" id="endTime"/>
                                      <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div></div>
                                        </div>
                                        </div>
                                        </div></div></div>
                     
                    
                 
   
   <div class="col-lg-1"></div>
  
      <div class="col-lg-1" >
     <label class="checkbox-inline" style="margin-top:-2px;margin-left:-96px;">
      <c:if  test="${whstockverifiObj.isPeriodic == true}"> 
     <input type="checkbox"  name="repetitive"  id="repetitive"  checked="checked" style="margin-top:0px;zoom: 1.5;" > </c:if>
     <c:if  test="${whstockverifiObj.isPeriodic == false}"> 
     <input type="checkbox"  name="repetitive"  id="repetitive"  style="margin-top:0px;zoom: 1.5;" > </c:if>  Repetitive</label>
          <div class="col-lg-1 seven-cols"  style="border-right: 3px solid #ccc;width: 15%;height:110px;padding-right:42px">
        <div id="weeklyBtn" >
        &nbsp;
       
         <div class="radio" >
      <label style="margin-left:-40px;"><input type="radio" id="dailyRadioBtn"  class="dailyRadioBtn"  value="Daily" ${whstockverifiObj.periodicType=='Daily'?'checked':''}  name="repradio" >Daily</label>
    </div>
   <div class="radio">
      <label style="margin-left:-40px;"><input type="radio" id="weeklyRadioBtn"  class="weeklyRadioBtn" value="Weekly" ${whstockverifiObj.periodicType=='Weekly'?'checked':''}  name="repradio" >Weekly</label></div>
      
      <div class="radio">
      <label style="margin-left:-40px;"><input type="radio" class="monthlyRadioBtn" value="Monthly" ${whstockverifiObj.periodicType=='Monthly'?'checked':''} id="monthlyRadioBtn"  name="repradio" value="Monthly">Monthly</label>
    </div>
    <!-- <div class="radio">
      <label style="margin-left:-40px;"><input type="radio" name="repradio" >Quarterly</label>
    </div> -->
   
      </div>
       </div> 
     </div>
    
    
      
      
      
      
      
      <div class="col-lg-8"></div>
      <div class="row">
     
                                    <div class="col-lg-4">
                                    <div class="row">
                      
 <div class="weeklySubblock Subblock" id="weeklySubblock" style="margin-top:-112px;padding-left:0px">
   <!--   Recur every  <input class="seven-cols" style="width:10% ;text-align:center" value="1" type="text"  name="day"> &nbsp; week(s) on: -->
     <br>
    <%--  <c:out value="${whstockverifiObj.daysNameList}"></c:out> --%>
<c:forEach  var="dayNames" items="${featureIds}">  
  <%--  <c:if var="days" test="${whstockverifiObj.daysNameList == 'Tue'}"><input type='checkbox' checked name='selectall' class="selectableCheckbox" id="selectall" Value="">Tue</c:if> --%>
 <c:if test="${dayNames=='Mon'}">
  <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Mon" ${dayNames=='Mon'?'checked':''}>Mon</label>
</c:if> <c:if test="${dayNames=='Tue'}"> <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Tue" ${dayNames=='Tue'?'checked':''}>Tue</label>
</c:if> <c:if test="${dayNames=='Wed'}"> <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Wed" ${dayNames=='Wed'?'checked':''}>Wed</label>
</c:if> <c:if test="${dayNames=='Thu'}"> <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Thu" ${dayNames=='Thu'?'checked':''} >Thu</label><br>
</c:if> <c:if test="${dayNames=='Fri'}"> <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Fri" ${dayNames=='Fri'?'checked':''} >Fri</label>
</c:if> <c:if test="${dayNames=='Sat'}"> <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall"  value="Sat" ${dayNames=='Sat'?'checked':''}>Sat</label>
</c:if> <c:if test="${dayNames=='Sun'}"> <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Sun" ${dayNames=='Sun'?'checked':''}>Sun</label>  
</c:if> </c:forEach>
     </div>
    
      </div>   
     </div>
     </div>
   
        
        
        
       
        <div class="col-lg-7"></div>
      <div class="row" >
      <div style="">  
      <div class="col-lg-1"></div>
                                    <div class="col-lg-3">
                                 
                                    <div class="row">
 <div class="dailySubblock Subblock" id="" style="margin-top:-109px;padding-left:0px" >
    <div class="radio " >
      <label ><spring:message code="every.label"/></label>&nbsp;
   <input class="seven-cols" style="width:10% ;text-align:center" value="${whstockverifiObj.periodicdays}" type="text"  name="dailiDay" id="dailiDay"> &nbsp; day(s)
    </div> 
     
    </div>
      </div>   
     </div>
     </div></div>  
       
       
       
        
        
     
        <div class="col-lg-7"></div>
      <div class="row" >
      <div style="padding-left:0px;">  
       <div class="col-lg-1"></div>
                                    <div class="col-lg-4">
                                    <div class="row">
 <div class="monthlySubblock Subblock" id="" style="margin-top:-109px;padding-left:0px" >
    <div class="radio " >
      <label ><spring:message code="day.label"/></label>&nbsp;
   <input class="seven-cols" style="width:10% ;text-align:center"  type="text" id="day"  name="day" value="${whstockverifiObj.periodicdays }"> &nbsp; of every &nbsp;<input class="seven-cols" style="width:10% ;text-align:center" value="1" type="text"  name="month" id="month" value="${whstockverifiObj.specificDate }"> &nbsp; of month(s)
    </div>
    <!--  <div class="radio " >
      <label>The</label>&nbsp;<select id="thedays" style=" width: 68px !important;
    height: 23px;"><option>first</option><option>second</option><option>third</option><option>fourth</option><option>last</option></select> <select style="    width: 68px !important;
    height: 23px;"><option></option></select> &nbsp; of every &nbsp;<input class="seven-cols" style="width:10% ;text-align:center" value="1" type="text"  name="day"> &nbsp; of month(s)
    </div> -->
    </div>
    
      </div>   
     </div>
     </div></div>  
       
        
        
            <%--   <div class="row" style="">
               <div class="form-group col-lg-1 col-md-1 col-sm-1" style="margin-left:-90px;">
                <input type="checkbox" style="white-space:nowrap;"></div>
                                      <div class="col-lg-1 col-md-1 col-sm-1" style="margin-left:-80px;"> <label style="font-size: 16px;"><spring:message code="repetitive.label" /></label>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="" > <spring:message code="daily.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value=""> <spring:message code="weekly.label"/>
                                                </label>
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                            </div>
                                            
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="false" ${outletDetails.offlineMode=='false'?'checked':''}> <spring:message code="monthly.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="false" ${outletDetails.offlineMode=='false'?'checked':''}> <spring:message code="quarterly.label"/>
                                                </label>
                                            </div>
                                     </div>
              
              </div>
              
              
           
              
              
              
              
              
              
              
               <div class="row">
                             
                            
                                   <div class="col-lg-8 col-sm-7" style="margin-top:-80px;white-space:nowrap;padding-left: 52%;padding-right: 0px;display: block;">
                                   ->  
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Mon.label"/></label>  
                                     
                                          &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Tue.label"/></label>  
                                        
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Wed.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Thu.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Fri.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sat.label"/></label> 
                                        
                                        
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sun.label"/></label> 
                                     
                                      </div>
                                      
                                      
                                     
                               </div>  
                               
              
              
              
              
              
              
          
                 
                 
                      
                      </div>
                     
                      --%>
                 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  <div class="row">
                  <div class="col-lg-12">
                  <div class="">
                  <div class="">
                  <div class="">
                    <div class="form-group col-lg-12" style="padding-left: 4.0%;padding-right: 5.2%">
	                                <label><spring:message code="description.label" /></label>
	                                <textarea  rows="5" class="form-control" style="resize:none;" id="description" name="eventDescription" placeholder="<spring:message code="description.label" />" >${whstockverifiObj.description}</textarea>
	                                <span style="color:red; font-size:2" id="eventdescriptionError"></span>
								</div></div></div></div>
                  </div>
                  
                  </div>
                    <div class="row">
                  
                  <div class=" col-lg-12" style="text-align:center">
                   <a class="btnCls" onclick="validatestockverificationform(this);" class="run"><spring:message code="submit.label"/></a>
                         <!--   <div class="row">
                  <div class="col-lg-6" style="    padding-right: 0px;"> -->
                <!--    <div class="col-lg-6" style="padding-right: 0px;"></div> -->
            <%--   <div class="col-lg-3" style=" padding-right: 0px;">
                    
                    <a class="btnCls" onclick="validatestockverificationform(this);" class="run"><spring:message code="submit.label"/></a>
                    </div> --%>
                  
                 
                
                 <%--   <div class="col-lg-3" style="    padding-right: 0px;">
                     <a class="run" onclick="viewStockVerification('outletStockVerification','0','outlet','menu');"><spring:message code="cancel.label"/></a>
                   </div> --%>
                   
                    <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
			           <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
			                <c:if test="${accessControl.appSubDocument == 'OutletStockVerification' && accessControl.write == true && accessControl.read == true}">
			                	 <a  class="btnCls buttonMargin" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');"><spring:message code="cancel.label"/></a>
		                	</c:if>
		                </c:forEach>
		             </c:if>
                   
                   
                    <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
			           <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
			                <c:if test="${accessControl.appDocument == 'WarehouseStockVerification' && accessControl.write == true && accessControl.read == true}">
			                	<input type="button" class="btnCls buttonMargin" style="" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');" value="<spring:message code="cancel.label"/>">
		                	</c:if>
		                </c:forEach>
		             </c:if>
                   
                   
                   
                  
                   
                  <!-- </div>
                   
                  </div> -->
                      
                       
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