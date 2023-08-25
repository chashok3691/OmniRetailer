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
		    <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockVerification.js"></script>
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
.col-lg1-6{
    margin-top: 20px !important;
}
.ml-1 {
  margin-left: ($spacer-x * .25) !important;
}
@media (min-width: 1200px) {
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1 {
    width: 10%;
    padding-left: 10px;
    padding-right: 10px;
    *width: 10%;
  }
   .allignment{
  width: 20%;
  }
  
  
}
.weeklybtn
{
opacity: 1.5; 
pointer-events: none;
}

</style>
<script type="text/javascript">
$(document).ready(function(){

	callCalender('from');
	callCalender('to');
	
	selectProductGroupOnly();
	
	 $('.weeklySubblock').hide();
	    $('.dailySubblock').hide();
	    $('.monthlySubblock').hide();
	    
	    debugger
	    
	    	
	   // var repetitive=  $("#repetitive").prop( "checked", true );
	 //   $("#repetitive").prop( "checked", true );
/* $("input:checkbox").on("change",function(){ */
	
	/* if ($(this).prop('checked')) { */
		//$('input[name="repetitive"]').is(':checked')
			/*  if($('input[name="repetitive"]:checked'))
		    { 
				 if ($(this).prop('checked')) { */
					 
					 
					 
// 					 added by Vijay to view the values on creation failure
					var isPeriodicType = false;
					if($("#isPeriodicTypeHidden").length > 0 && $("#isPeriodicTypeHidden").val() != "")
				 	 isPeriodicType = $("#isPeriodicTypeHidden").val();
				 debugger;
				 	if(isPeriodicType)
				 		{
				 			$('#repetitive').prop('checked', true);
							 var periodicType = $("#periodicTypeHidden").val();
							 
							 switch(periodicType)
							 {
							 	case 'Weekly':
							 		{
							 		
							 		var daysNameList = [];
							 		  $('.daysNameList').each( function(){
							 			 	daysNameList.push($(this).val().trim()); 	
							 				  
							 			  });
							 		
							 		$("#weeklyRadioBtn").prop("checked", true);
							 		$('.weeklySubblock').show();
							 	 	for(var i=0;i<daysNameList.length;i++)
							 			{
							 			
							 			  $('.selectableCheckbox').each( function(){
							 				 if($(this).val() === daysNameList[i])
							 						$(this).prop('checked', true);	
							 				  
							 			  });
							 			
							 				
							 			}
							 			
							 			
							 			
							 			break;
							 		}
							 	case 'Daily':
						 		{
							 		$("#dailyRadioBtn").prop("checked", true);	
							 		$('.dailySubblock').show();
						 			break;
						 		}
							 	case 'Monthly':
						 		{
							 		$("#monthlyRadioBtn").prop("checked", true);
							 		$('.monthlySubblock').show();
						 			break;
						 		}
							 		
							 }
							
							 
				 		}
				 		
				 	
					if(!isPeriodicType){
				
					$("#dailyRadioBtn").attr('disabled', true); 
				    $("#weeklyRadioBtn").attr('disabled', true); 
				    $("#monthlyRadioBtn").attr('disabled', true); 	
					}

// 					 commented by vijay
					 
			 $('input[name="repetitive"]').on('click', function(){
				 
				 // $("#dailyRadioBtn").attr('disabled', true); 
// 				  if ( $(this).is(':checked') ) {
			if ( $("#repetitive").is(':checked') ) {
				 $("#dailyRadioBtn").prop("checked", true);
				    $('.dailySubblock').show();
				$("#dailyRadioBtn").attr('disabled', false); 
			    $("#weeklyRadioBtn").attr('disabled', false); 
			    $("#monthlyRadioBtn").attr('disabled', false); 	
				
			
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
				  else
					  {
					 // $('#dailyRadioBtn').addClass('weeklybtn');
					 // $('input[name="repradio"]').attr('style','opacity: 1.5; pointer-events: none;');
					  $('input[name="repradio"]').attr('checked',false);
					  $('.weeklySubblock').hide();
					    $('.dailySubblock').hide();
					    $('.monthlySubblock').hide();
					    $("#dailyRadioBtn").attr('disabled', true); 
					    $("#weeklyRadioBtn").attr('disabled', true); 
					    $("#monthlyRadioBtn").attr('disabled', true); 
					    
					  }/* else
					  }
					  {
					 
					  
					  $("#weeklyBtn").attr('disabled', ''); 
					  //$(this).prop('checked', false);
					  $('#dailyRadioBtn').prop('checked', false);
					  $('#weeklyRadioBtn').prop('checked', false);
					  $('#monthlyRadioBtn').prop('checked', false);
						 $('.weeklySubblock').hide();
						    $('.dailySubblock').hide();
						    $('.monthlySubblock').hide(); 
						     } */
				 
			 });
		   
   
/* }
}); */
    
	/* 
	$("input[type='radio']").change(function () {
		 var id = $(this).attr("id");
			id=id.replace("RadioBtn","");
			var subblocked=false;
	if($("."+id+"RadioBtn").is(":checked")){
	    $("."+id+"Subblock").show();
	  //  $(".Subblock").append( $("."+id+"Subblock").show());
	    subblocked=false;
	} else {
	    $("."+id+"Subblock").hide();
	  
	}   
		});
 */
});
/* 
function activateHeader(id,open){
	debugger
	 var id = $(this).attr("id");
		id=id.replace("RadioBtn","");
if($("."+id+"RadioBtn").is(":checked")){
    $("."+id+"Subblock").show();
} else {
    $("."+id+"Subblock").hide();
}   

} */


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
                      <div class="col-lg1-3 col-lg-3">
                      <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/><span class="requiredField">*</span></label>
                           <select class="form-control" id="outletLocation" >
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == storeStockVerificationObj.location ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == storeStockVerificationObj.productcategory ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-3 col-lg-3">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == storeStockVerificationObj.brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
	           
	           
	           
	           
	             <div class="col-lg1-3 col-lg-3">
                           <div class="col-lg-2"></div>
             			 <div class="col-lg-7" style="padding-left:0px;padding-right: 0px;">
                 		<label>Approved By<span class="requiredField">*</span></label>
                	 	<input class="form-control" name="approved_by" id="approvedBy" placeholder="Enter Name" type="text" value="${storeStockVerificationObj.approvedBy}">
	           	                <span id="approvedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	           
	              </div>
	            </div>
	           
	           
	           
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    <div class="row" style="margin-top: 5px">
                    <div class="col-lg1-3 col-lg-3">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == storeStockVerificationObj.department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
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
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == storeStockVerificationObj.subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-3 col-lg-3">
                        <div class="col-lg-2"></div>
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <%-- <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletModelId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="model" items="${modalList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select> --%>
	                   <label>Group</label>
                       <select class="form-control" name="outletProductGroup" id="outletProductGroup" onclick="selectProductGroupOnly();">
	                                        <option value="" >ALL</option>
	                                        <c:forEach var="groupsList" items="${groupsList}">
	                            			<option value="${groupsList.groupId}" ${groupsList.groupId == storeStockVerificationObj.groupId ? 'selected' : ''}>${groupsList.groupId}</option>
											</c:forEach>
	                  </select>
                      </div>
                      
                    
                    </div>
                    
                    
                    
                        
                   <div class="col-lg-3 col-xs-3 ">
		             <div class="col-lg-2"></div>
		            <div class="col-lg-7" style="padding-left:0px;padding-right: 0px;">
		             <label><spring:message code="status.label"/></label>
                                            <select class="form-control" style="height:30px;" name="searchType" id="searchType">
                                            	<option value="In Progress">In Progress</option>
                                            	<option value="Disabled">Disabled</option>
                                            </select>
                                     </div></div>    
                      
                      
                    
                    
                    </div>
                    
                    <div class="row" style="margin-top: 5px">
                    
                    <div class="col-lg1-4 col-lg-3">
                     <div class="col-lg-2"></div>
                       <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                         <c:choose>
                          <c:when test="${storeStockVerificationObj.allowMultiplesForDay ==true}">
                           <input type="checkbox"  name="allowMultipleDays"  id="allowMultipleDays"  checked="checked" style="margin-top:5px;zoom: 1.5;" > 
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
                	 					<input class="form-control calendar_icon form-group" readonly="readonly" value="${storeStockVerificationObj.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                                        <span id="fromDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        
                                        </div>
                                        
                                        </div>
                                       
                                  		<div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8" style="margin-top:-10px;">
                                            <label ><spring:message code="offer_end_date.label"/><span class="requiredField">*</span></label>
	                 					<input class="form-control calendar_icon form-group" readonly="readonly" value="${storeStockVerificationObj.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                                       <span id="toDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                     
                     
                     
                  
                     <div class="row">
                     
                     
                       <div style="padding-left:0px;">  
                                    <div class="form-group col-lg-3">
                                    <div class="row">
	                                 
                                  		 <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8 bootstrap-timepicker">
                                          <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                	 <div class="input-group"> 
                	 <input type="text" class="form-control timepicker" value="${storeStockVerificationObj.startTimeStr}"  name="startTime" id="startTime"/>
                                       <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div></div>
                                        </div>
                                        </div>
                                       
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-details col-lg-6 col-xs-8 bootstrap-timepicker">
                                           <label><spring:message code="endtime.label"/> <span class="requiredField">*</span></label>
	                 	   <div class="input-group"> 
	                 	  <input type="text" class="form-control timepicker" value="${storeStockVerificationObj.endTimeStr}" name="endTime" id="endTime"/>
                                      <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div></div>
                                        </div>
                                        </div>
                                        </div></div></div>
                     
                    
   
   
   <div class="col-lg-1"></div>
  
      <div class="col-lg-1" >
     <label class="checkbox-inline"  style="margin-top:-2px;margin-left:-96px;">
     <c:choose>
     <c:when test="${storeStockVerificationObj.isPeriodic == true}">
       <input type="checkbox"  name="repetitive"  id="repetitive"  checked="checked" style="margin-top:0px;zoom: 1.5;" > 
     </c:when>
     <c:otherwise>
      <input type="checkbox"  name="repetitive"  id="repetitive"  style="margin-top:0px;zoom: 1.5;" > 
     </c:otherwise>
     </c:choose>
      Repetitive</label>
          <div class="col-lg-1 seven-cols"  style="border-right: 3px solid #ccc;width: 15%;height:110px;padding-right:42px">
        <div id="weeklyBtn" style="" class="">
        &nbsp;
       
         <div class="radio" >
      <label style="margin-left:-40px;"><input type="radio" id="dailyRadioBtn" class="dailyRadioBtn"  style=""   name="repradio" value="Daily" ${storeStockVerificationObj.periodicType=='Daily'?'checked':''}>Daily</label>
    </div>
   <div class="radio">
      <label style="margin-left:-40px;"><input type="radio" id="weeklyRadioBtn" style=""  class="weeklyRadioBtn"  name="repradio" value="Weekly" ${storeStockVerificationObj.periodicType=='Weekly'?'checked':''} >Weekly</label></div>
      
      <div class="radio">
      <label style="margin-left:-40px;"><input type="radio" class="monthlyRadioBtn"  style="" id="monthlyRadioBtn"  name="repradio" value="Monthly" ${storeStockVerificationObj.periodicType=='Monthly'?'checked':''}>Monthly</label>
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
     Every  <input class="seven-cols" style="width:10% ;text-align:center" value="${storeStockVerificationObj.periodicdays}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" type="text"  name="weekDay" id="weekDay"> &nbsp; week(s) on:
     <br>
 <label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Mon">Mon</label>
<label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Tue">Tue</label>
<label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Wed">Wed</label>
<label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Thu">Thu</label><br>
<label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Fri">Fri</label>
<label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Sat">Sat</label>
<label class=""><input type='checkbox' name='selectall' class="selectableCheckbox" id="selectall" value="Sun">Sun</label>
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
 <div class="dailySubblock Subblock" id="" style="margin-top:-115px;padding-left:0px" >
    <div class="radio " >
      <label ><spring:message code="every.label"/></label>&nbsp;
   <input class="seven-cols" style="width:10% ;text-align:center" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${storeStockVerificationObj.periodicdays}" type="text"  name="dailiDay" id="dailiDay"> &nbsp; day(s)
   
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
 <div class="monthlySubblock Subblock" id="" style="margin-top:-135px;padding-left:0px" >
    <div class="radio " >
      <label ><spring:message code="day.label"/></label>&nbsp;
   <input class="seven-cols" style="width:10% ;text-align:center" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${storeStockVerificationObj.periodicdays}" type="text" id="day"  name="day"> &nbsp; of every &nbsp;<input class="seven-cols" style="width:10% ;text-align:center"oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${storeStockVerificationObj.specificDate}" type="text"  name="month" id="month"> &nbsp; of month(s)
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
       
        
        
        
        
        
        <%-- 
        
              <div class="row" style="">
               <div class="form-group col-lg-1 col-md-1 col-sm-1" style="margin-left:-90px;">
                <input type="checkbox" style="white-space:nowrap;"></div>
                                      <div class="col-lg-1 col-md-1 col-sm-1" style="margin-left:-80px;"> <label style="font-size: 16px;"><spring:message code="repetitive.label" /></label>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="rec" value="" > <spring:message code="daily.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="rec" value="" > <spring:message code="weekly.label"/>
                                                </label>
                                            </div>
                                            
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="rec" value=""> <spring:message code="monthly.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="rec" value=""> <spring:message code="quarterly.label"/>
                                                </label>
                                            </div>
                                     </div>
              
              </div>
              
              
           
              
              
              
              
              
             
              
               <div class="row">
                             
                            
                                   <div class="col-lg-8 col-sm-7" style="margin-top:-80px;white-space:nowrap;padding-left: 52%;padding-right: 0px;">
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
                                      
                                      
                                     
                               </div> --%>  
                               
              
              
                      
                      </div>
                     
                     
                 
                     
                     
                <%--      
                     
                      <div class="row" style="">
                      <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-2"></div>
	               <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/><span class="requiredField">*</span></label>
	                 	<input class="form-control calendar_icon " readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          <div class="col-lg-3">
		           <div class="col-lg-2"></div>
		          <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
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
		           
                    </div>
                    
                   
                     --%>
                   
          
                  
<%--                     <input type="hidden" id="maxRecords" value="${skuObj.maxRecords}"> --%>
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                    
                    
                    
                    
                  <div class="row">
                  <div class="col-lg-12">
                  <div class="">
                  <div class="">
                  <div class="">
                    <div class="form-group col-lg-12" style="padding-left: 3.6%;padding-right: 5.2%">
	                                <label><spring:message code="description.label" /></label>
	                                <textarea  rows="5" class="form-control" style="resize:none;" id="description" name="eventDescription" placeholder="<spring:message code="description.label" />" >${storeStockVerificationObj.description}</textarea>
	                                <span style="color:red; font-size:2" id="eventdescriptionError"></span>
								</div></div></div></div>
                  </div>
                  
                  </div>
                    <div class="row">
                  
                  <div class=" col-lg-12" style="">
                  <div class="row">
                  <div class="col-lg-6" style="padding-right: 0px;">
                   <div class="col-lg-6" style="padding-right: 0px;"></div>
                    <div class="col-lg-3" style=" padding-right: 0px;">
                    
                    <a class="btnCls" onclick="validatestockverificationform('new');" class="run"><spring:message code="submit.label"/></a>
                    </div>
                  
                  </div>
                  <div class="col-lg-6">
                   <div class="col-lg-3" style="padding-right: 0px;">
                   <%-- <input type="button" class="btnCls buttonMargin" style="margin-left:25%;" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" value="<spring:message code="cancel.label"/>"> --%>
                    <%--  <a class="run" onclick="viewStockVerification('outletStockVerification','0','outlet','menu');"><spring:message code="cancel.label"/></a> --%>
                  
                   <%--  <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
			           <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
			                <c:if test="${accessControl.appDocument == 'OutletStockVerification' && accessControl.write == true && accessControl.read == true}">
			                <input type="button" class="btnCls buttonMargin" style="" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" value="<spring:message code="cancel.label"/>">
		                	</c:if>
		                </c:forEach>
		             </c:if>
                   
                    <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
			           <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
			                <c:if test="${accessControl.appDocument == 'WarehouseStockVerification' && accessControl.write == true && accessControl.read == true}">
			                	<input type="button" class="btnCls buttonMargin" style="" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');" value="<spring:message code="cancel.label"/>">
		                	</c:if>
		                </c:forEach>
		             </c:if> --%>
		             
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
                   
                    </div>
                   
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
        
        <input type="hidden" value="${storeStockVerificationObj.periodicType}" id = "periodicTypeHidden"/>
        <input type="hidden" value="${storeStockVerificationObj.isPeriodic}" id = "isPeriodicTypeHidden"/>
      
         <c:forEach var="dayName" items="${storeStockVerificationObj.daysNameList}" varStatus="theCount">
         
           <input type="hidden" value="${dayName}" class = "daysNameList"/>
           </c:forEach>
           
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>