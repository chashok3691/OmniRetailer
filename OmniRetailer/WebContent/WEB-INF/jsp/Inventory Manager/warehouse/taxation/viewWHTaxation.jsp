<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/newLocation.jsp
 * file type		        : JSP
 * description				: The new location form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style type="text/css">
/* 	.col-xs-12 {
	 padding: 2% 10%;  
	 } */
	 	
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
	 
</style>
<script type="text/javascript">
$(document).ready(function(){
	var effectiveFrom = $("#effectiveFromStr").val().split(' ');
	$("#effectiveFrom").val(effectiveFrom[0]);
	$("#effectiveTime").val(effectiveFrom[1]);
	callCalender("effectiveFrom");
	$("#taxRate").keydown(function(){
	    $("#Error").html("");
	    $("#taxRateError").html("");
	});
	$("#effectiveTime").keydown(function(){
		    $("#Error").html("");
		    $("#effectiveTimeError").html("");
	});
	$("#workLocation").change(function(){
	    $("#Error").html("");
	});
	$("#taxName").change(function(){
	    $("#Error").html("");
	    $("#taxNameError").html("");
	});
	$("#taxCategory").change(function(){
	    $("#Error").html("");
	    $("#taxCategoryError").html("");
	});
});
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">

				<div class="box box-primary" style="padding: ">
                   <div class="box-header" style="text-align: center">
                   <br/>
                   <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;">Warehouse Taxation - View</h3>
                   </div><!-- /.box-header -->
                   <!-- form start -->
                     <form id="newLocation" method="post">
                       <div class="box-body">
                      	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                       <div class="row">
                       	  <div class="form-group col-lg-5"></div>
                          <div class="form-group col-lg-3">
                            <label><spring:message code="location.label" /></label>
                                 <select class="form-control" disabled="disabled" name="location" id="workLocation">
                                   <c:forEach var="location" items="${workLocationsList}"> 
									 <option value="${location}" ${storeTaxation.location == location ? 'selected' : ''}>${location}</option>
									 <%-- <option value="${location}">${location}</option> --%>
								  </c:forEach>
							    </select>
                         </div>
                      </div>
                       <div class="row">
                         <div class="form-group col-lg-4">
                          <div class=" col-lg-11">
                            <label><spring:message code="tax.category.label" /> <span style="color:red; font-size:2">*</span></label>
                            <select  class="form-control" disabled="disabled" id="taxCategory" onchange="getTaxDesc();">
                           	  <c:forEach var="tax" items="${taxDetails}">
								<option value="${tax.taxName}" ${storeTaxation.taxCategoryName == tax.taxName ? 'selected' : ''}>${tax.taxName}</option>
								<%-- <option value="${tax.taxName}">${tax.taxName}</option> --%>
							  </c:forEach>
                           </select>
                         	<span id="taxCategoryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         </div>
                         <div class=" col-lg-1"></div>
                       <div class="form-group col-lg-2">
                              <label><spring:message code="taxname.label" /> <span style="color:red; font-size:2">*</span></label>
                              <input type="text" class="form-control" readonly="readonly" value="${storeTaxation.taxName}" id="taxName" name="taxName" placeholder="<spring:message code="enter.taxname.label" />" />
                         	  <span id="taxNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                        <div class="form-group col-lg-2"></div>
                        
                        
                        
                        
                        
                         <div class="form-group col-lg-2 ">
                          
                            <label><spring:message code="status.label" /> <span style="color:red; font-size:2">*</span></label>
                            <select class="form-control" id="status" name="status" disabled="disabled">
                            	<option value="enable" ${storeTaxation.status == 'enable' ? 'selected' : ''}>Enable</option>
                            	<option value="disable" ${storeTaxation.status == 'disable' ? 'selected' : ''}>Disable</option>
                            </select>
                         	<span id="statusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <%-- <div class="form-group col-lg-4"></div>
                           <div class="form-group col-lg-12 ">
	                            <label><spring:message code="tax.description.label" /></label>
	                            <textarea rows="2" id="taxDescription" name="taxDescription" readonly="readonly" style="resize: none;" class="form-control allField" placeholder="" >${storeTaxation.taxDescription}</textarea>
	                            <span id="taxDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        </div> --%>
                           
                        
                        <%--   <div class="form-group col-lg-2">
                            <label><spring:message code="taxtype.label" /> <span style="color:red; font-size:2">*</span></label>
                            <select class="form-control" id="taxType">
                            	<option value = "Fixed" ${storeTaxation.taxType == 'Fixed' ? 'selected' : ''}>Fixed</option>
                            	<option value = "Percentage" ${storeTaxation.taxType == 'Percentage' ? 'selected' : ''}>Percentage</option>
                            </select>
                        	<span id="taxTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         --%>  
                          
                          
                          
                        </div>
                         <div class="row">
                        	<input type="hidden" id="effectiveFromStr" value="${storeTaxation.effectiveFromStr}">
                          
                        <div class="form-group col-lg-4">
                          <div class="form-group col-lg-6">
                           <div class="form-group col-lg-12" style="padding-left:0px;white-space: nowrap" >
                            <label><spring:message code="effective.from.date.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input class="form-control calendar_icon" disabled="disabled" style="" name="effectiveFrom" id="effectiveFrom" size="20" type="text" onfocus="callCalender('effectiveFrom')" onclick="callCalender('effectiveFrom')" placeholder="DD/MM/YYYY"/>
                         	<span id="effectiveFromError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         </div>
                          <div class="form-group col-lg-6"  style="white-space: nowrap;margin-left: -18px;">
                           <div class="form-group col-lg-12" style="padding-left:0px">
                          <div class="bootstrap-timepicker" >
                            <label><spring:message code="effective.from.time.label" /> <span style="color:red; font-size:2">*</span></label>
                            <div class="input-group">                                            
                                <input type="text" class="form-control timepicker" name="effectiveTime" disabled="disabled" id="effectiveTime"/>
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                </div>
                            </div><!-- /.input group -->
                        	<span id="effectiveTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         </div>
                         </div>
                         
                         <div class="form-group col-lg-1"></div>
                         
                         <div class="form-group col-lg-1" style="padding-right: 0px;">
                              <label><spring:message code="taxrate.label" /> <span style="color:red; font-size:2">*</span></label>
                              <input type="text" class="form-control" id="taxRate" name="taxRate" disabled="disabled" value="${storeTaxation.taxRateStr}" placeholder="<spring:message code="enter.tax.rate.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                         	  <span id="taxRateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3"></div>


                     <div class="form-group col-lg-2">
                            <label><spring:message code="taxtype.label" /> <span style="color:red; font-size:2">*</span></label>
                            <select class="form-control" id="taxType" disabled="disabled">
                            	<option value = "Fixed" ${storeTaxation.taxType == 'Fixed' ? 'selected' : ''}>Fixed</option>
                            	<option value = "Percentage" ${storeTaxation.taxType == 'Percentage' ? 'selected' : ''}>Percentage</option>
                            </select>
                        	<span id="taxTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         
                          
                        </div>
                        
                      <div class="row">
                           <div class="form-group col-lg-7" style="margin-left:13px;">
                           <div class="form-group col-lg-12"></div>
                            <div class="col-lg-12 nopadding"><h4><label style="font-weight:500"><spring:message code="taxrange.label" /></label></h4></div>
                             
                              <div class=" col-lg-4" style="padding-left: 0px;padding-right:0px;margin-top: -10px;pointer-events: none;">
                              <input type="radio" name="taxtype" value="MRPbased" ${storeTaxation.mrpBased=='true'?'checked':''}>&nbsp&nbspMRP Based <br>
                               <input type="radio" name="taxtype" value="Quantitybased"  ${storeTaxation.quantityBased=='true'?'checked':''} >&nbsp&nbspQuantity Based
                             </div>
                              <div class=" col-lg-2" style="padding-left: 0px;margin-top: 4px;">
                              <input type="number" class="form-control" id="startvalue" placeholder="<spring:message code="startvalue.label"/>"/>
                              
                              </div>
                                 <div class=" col-lg-2" style="margin-top: 4px;">
                                   <input type="number" class="form-control " id="endvalue" placeholder="<spring:message code="endvalue.label"/>"/>
                                 </div>
<!--                                     <div class=" col-lg-1"></div> -->
                                       <div class=" col-lg-3" style="padding-right: 0px;margin-top: 4px;">
                                       <input type="number" class="form-control" id="taxrate" placeholder="<spring:message code="enter.tax.rate.label"/>"/>
                                       </div>
<!--                                           <div class=" col-lg-1"></div> -->
                                       <div class=" col-lg-1" style="margin-top: -2px;">
                                         <a onclick="addtaxranges();" style="font-size: 26px;" disabled="disabled">
                                  <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                      </a>
                                       </div>
                                       
                                       <div>
                                        <table id="taxranges" class="table table-bordered table-striped" style="">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                             
                                            	<th><spring:message code="s.no.label" /></th>
                                                <th><spring:message code="startvalue.label" /></th>
                                                <th><spring:message code="endvalue.label" /></th>
                                                <th><spring:message code="taxrate.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="storeTax" items="${storeTaxation.saleRangesList}" varStatus="theCount">
                                            <tr id="dynamicdiv${theCount.index+1}">
                                           
                                          	    <td class='slno'>${theCount.index+1}</td>
                                          	    <input type="hidden" id="autoNumber${theCount.index+1}" value="${storeTax.autoNumber}"/>
                                                <td id="startvalue${theCount.index+1}">${storeTax.saleValueFrom}</td>
                                                <td id="endvalue${theCount.index+1}">${storeTax.saleValueTo}</td>
                                                <td id="taxrate${theCount.index+1}">${storeTax.taxRate}</td>
                                                <td id="Del${theCount.index+1}"><a id="Dele${theCount.index+1}" style=" text-decoration: underline;margin-left:3px;" onclick="deleteItem(this);" title="Delete">Delete</a></td>
                                              
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                       </div>
                           </div>
                           <div class="form-group col-lg-1"></div>
                           <div class="form-group col-lg-3 nopadding">
                           <div class="form-group col-lg-12"></div>
                              <div class="form-group col-lg-12"></div>
                           <div class="form-group col-lg-8">
                           <%--  <label><spring:message code="status.label" /> <span style="color:red; font-size:2">*</span></label>
                            <select class="form-control" id="status" name="status">
                            	<option value="enable" ${storeTaxation.status == 'enable' ? 'selected' : ''}>Enable</option>
                            	<option value="disable" ${storeTaxation.status == 'disable' ? 'selected' : ''}>Disable</option>
                            </select>
                         	<span id="statusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                         </div>
                         <div class="form-group col-lg-4"></div>
                           <div class="form-group col-lg-12 " style="margin-top: 11px;margin-left: -11px;">
	                            <label><spring:message code="tax.description.label" /></label>
	                            <textarea rows="2" id="taxDescription" name="taxDescription" readonly="readonly" style="resize: none;" class="form-control allField" placeholder="" >${storeTaxation.taxDescription}</textarea>
	                            <span id="taxDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        </div>
                           </div>
                        </div>
                         
						 
                       </div><!-- /.box-body -->
                       <input type="hidden" id="searchStoreTaxation" value="${searchName}">
                        <input type="hidden" id="maxRecords" value="${maxRecords}">
						<br>			
						<div class="row" style="text-align: center;">
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls" style="margin-left:5%;" onclick="return viewWarehouseTaxation('Whtaxation','0','${taxlocation}');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            <c:if test="${accessControl.appDocument == 'Taxation' && accessControl.write == true && accessControl.read == true}">
						 		<input type="button" class="btnCls" style="margin-left:5%;" onclick="return viewWarehouseTaxation('Whtaxation','0','${taxlocation}');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
						 </c:forEach>
						</div>
					<br/>
                    <div class="box-footer">
                                    
                    </div>
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
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