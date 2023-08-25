<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : inventorymanager/retailoutlets/procurement/viewWarehouseStockReturn.jsp
 * file type		        : JSP
 * description				: The viewWarehouseStockReturn form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentReturn.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	changeTotalCost();
	getstateforPOandGRN();
	if($('#returnDateStr').val() == ""){
		var dateTime = getCurrentDate();
		  var date = dateTime.split(' ');
		  date = date[0].split('/');
		  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
		  $('#returnDateStr').val(formatedDate);
	}else{
		var returnDateStr = $('#returnDateStr').val();
		returnDateStr = returnDateStr.split(' ');
		$('#returnDateStr').val(returnDateStr[0]);
	}
	callCalender("returnDateStr");
	focusDiv('Error');
	var returnReason = $("#returnReason").val();
	if(returnReason != ""){
		var id = $("input[name=returnReason][value='"+returnReason+"']").attr("id");
		$("#overStock").removeAttr("checked");
		$("#"+id).prop("checked",true);
		if($("#"+id+"Txt").length > 0){
			var returnComments = $("#returnComments").val();
			$("#"+id+"Txt").removeAttr("readonly");
			$("#"+id+"Txt").val(returnComments);
		}
	}
	var actionRequired = $("#actionRequired").val();
	if(actionRequired != ""){
		var id = $("input[name=actionRequired][value='"+actionRequired+"']").attr("id");
		if(id != undefined){
			$("#repairAndReturn").removeAttr("checked");
			$("#"+id).prop("checked",true);
		}else{
			$("#other").prop("checked",true);
			$("#otherTxt").removeAttr("readonly");
			$("#otherTxt").val(actionRequired)
		}
	}
});
</script>
	<style type="text/css">
	.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 2;
  /* background-color: white; */
}
.first-col {
 	min-width: 60px;
    max-width: 60px;
    left: 0px;  
}

.second-col {
   left: 60px;
    min-width: 75px;
    max-width: 75px;
}
.third-col {
    min-width: 100px;
    max-width: 100px;
    left: 135px;
}
.fourth-col {
    min-width: 100px;
    max-width: 100px;
    left: 235px;
}
.fifth-col {
    min-width: 150px;
    max-width: 200px;
    left: 335px;
}
.sixth-col {
    min-width: 250px;
    max-width: 250px;
    left: 488px;
}
	
	#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}
	.textboxrow
	{
	    margin-top: 8px;
	}
	.labelpadding
	{
	margin-top: 3px;
	}
	@media (min-width:1200px) and (max-width:1600px)
{
	.lbl{
		text-align:right;
		padding-right: 0px;
	}
}
@media only screen and (max-width:1200px)
{
.lbl{
		text-align:left;
	}
}
 /*  .odd{display:none!important;} */
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:0%;
}

.form-group {
    margin-bottom: 4px;
    }
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 3.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
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
.text-class{
   padding:10px;
   border:none;
   border-bottom:1px solid black;
   height:7px;
  }
</style>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: left;">
                <input type="hidden" id="tester" value="${type}">
                                
                                 <c:if test="${type == 'new'}">
                 <center> <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;"><spring:message code="new.shipment.return" /></h3></center>
						         </c:if>
						         <c:if test="${type != 'new'}">
		  <center> <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;">${shipmentReturn[0].purchaseStockReturnRef} -<spring:message code="po.details.label" /></h3></center>
						         
						         </c:if>
                                </div><!-- /.box-header -->
                                <!-- form start -->

<br>                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 0px;margin-top: -25px">${err}</div>
	        						 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                 <div class="row">
	                 <div class="form-group col-lg-5" style="margin-bottom:6px;">
	                 <div class="row textboxrow">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="location.label" /> <span style="color:red; font-size:2"></span></label>
							</div>
		                   <!--  <input type="hidden" id="outletLocation"> -->
		                    <input type="hidden" id="desc">
		                     <c:if test="${type == 'new'}">
		            <input type="hidden" class="form-control" name="purchaseStockReturnRef" id="purchaseStockReturnRef" readonly="readonly"  value="${shipmentReturn.purchaseStockReturnRef}"/>
		                     
		                     </c:if>
		                     <c:if test="${type != 'new'}">
 		                     <input type="hidden" class="form-control" name="purchaseStockReturnRef" id="purchaseStockReturnRef" readonly="readonly"  value="${shipmentReturn[0].purchaseStockReturnRef}"/>
		                 		</c:if>
		                  <div class="form-group col-lg-6 col-xs-8" style="">
		                   <select class="form-control" name="fromLocation"  id="fromLocation" onchange="getstateforPOandGRN()" >
		                   		<c:forEach var="location" items="${locationBeanList}">
		                   		 <c:if test="${type == 'new'}">

									<option value="${location.businessActivity}" ${location.locationId == shipmentReturn.fromLocation ? 'selected' : ''}>${location.locationId}</option>
		                   		 </c:if>
		                   		  <c:if test="${type != 'new'}">
									<option value="${location.businessActivity}" ${location.locationId == shipmentReturn[0].fromLocation ? 'selected' : ''}>${location.locationId}</option>
								</c:if>
								 </c:forEach>
						   </select>
						</div>        
	                 </div>
	                 <div class="row textboxrow">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="returned.by.label" /> <span style="color:red; font-size:2"></span></label>
							</div>
		                                    
		                <div class="form-group col-lg-5 col-xs-5" style="">
		                		                     <c:if test="${type == 'new'}">
		                
		                	<input type="text" class="form-control" name="returnBy" id="returnBy" value="${shipmentReturn.returnBy}" placeholder="<spring:message code="enter.return.by.label" />"/>
		                </c:if>
		                		                     <c:if test="${type != 'new'}">
		                
							<input type="text" class="form-control" name="returnBy" id="returnBy" value="${shipmentReturn[0].returnBy}" placeholder="<spring:message code="enter.return.by.label" />"/>
						</c:if>
							<span id="returnByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>        
	                 </div>
	                 <div class="row textboxrow">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="transport.mode.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
		                                    
		                <div class="form-group col-lg-5 col-xs-8" style="">
		                
		                		                     <c:if test="${type == 'new'}">
		                		                     
		                		                      <select class="form-control" name="transportMode" id="transportMode">
							 <option value="Ordinary" ${'Ordinary' == shipmentReturn.transportMode ? 'selected' : ''}>Ordinary</option>
		                           <option value="Rail" ${'Rail' == shipmentReturn.transportMode ? 'selected' : ''}>Rail</option>
		                           <option value="Flight" ${'Flight' == shipmentReturn.transportMode ? 'selected' : ''}>Flight</option>
		                           <option value="Express" ${'Express' == shipmentReturn.transportMode ? 'selected' : ''}>Express</option>
		                     </select>
		                		                     
		                		                     </c:if>
		                		
		                		  <c:if test="${type != 'new'}">
		                		                     
		               
							 <select class="form-control" name="transportMode" id="transportMode">
							 <option value="Ordinary" ${'Ordinary' == shipmentReturn[0].transportMode ? 'selected' : ''}>Ordinary</option>
		                           <option value="Rail" ${'Rail' == shipmentReturn[0].transportMode ? 'selected' : ''}>Rail</option>
		                           <option value="Flight" ${'Flight' == shipmentReturn[0].transportMode ? 'selected' : ''}>Flight</option>
		                           <option value="Express" ${'Express' == shipmentReturn[0].transportMode ? 'selected' : ''}>Express</option>
		                     </select>
		                     </c:if>
							<span id="transportModeError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>   
	                 </div>
	                 <div class="row textboxrow">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="po.reference.label" /></label>
						</div>
		                <div class="form-group col-lg-6 col-xs-8" style="">
		                			                	  <c:if test="${type == 'new'}">
		                								<input type="text" class="form-control searchItems searchBar" value="${shipmentReturn.poRef}" style="" placeholder="<spring:message code="enter.po.reference.label" />"  id="po_reference" />
		                	
		                	</c:if>
		                	
		                	
		                	  <c:if test="${type != 'new'}">
		                
							<input type="text" class="form-control searchItems searchBar" value="${shipmentReturn[0].poRef}" style="" placeholder="<spring:message code="enter.po.reference.label" />"  id="po_reference" />
							</c:if>
							<div class=services>
					    		<div class="items">
					     			<ul class="matchedStringUl poRef" style="width: 89%!important;padding: 0px!important;z-index:10"></ul>
					   			</div>
							</div>	
									                	  <c:if test="${type == 'new'}">
							
														<input type="hidden" name="po_reference" id="selected_po_ref" value="${shipmentReturn.poRef}">
							</c:if>
									                	  <c:if test="${type != 'new'}">
							
											<input type="hidden" name="po_reference" id="selected_po_ref" value="${shipmentReturn[0].poRef}">
									
									</c:if>
						</div>  
						
				
						 
	                 </div>
	                 	<div class="row textboxrow">
						<div class="form-group col-lg-4 col-xs-4 lbl" >                   
							<label><spring:message code="pickedby.label" /> <span style="color:red; font-size:2"></span></label>
							</div>
		                                    
		                <div class="form-group col-lg-5 col-xs-5" style="">
		                		                     <c:if test="${type == 'new'}">
		                
		                	<input type="text" class="form-control" name="pickedby" id="pickedby" value="${shipmentReturn.pickedBy}" placeholder="<spring:message code="enter.picked.by.label" />"/>
		                </c:if>
		                		                     <c:if test="${type != 'new'}">
		                
							<input type="text" class="form-control" name="pickedby" id="pickedby" value="${shipmentReturn[0].pickedBy}" placeholder="<spring:message code="enter.picked.by.label" />"/>
						</c:if>
							<span id="pickedbyError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>        
	                 </div>
                </div> 
                
                    
                <div class="form-group col-lg-1"></div> 
                <div class="form-group col-lg-5">
                <div class="row textboxrow">
	                <div class="form-group col-lg-4 col-xs-4 lbl"  style="">
                         <label><spring:message code="return.date.label" /> <span style="color:red; font-size:2">*</span></label>
                   </div>
                    <div class="form-group col-lg-4 col-xs-8" style="">
                       <c:if test="${type == 'new'}">
                    
                    	<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="returnDateStr" id="returnDateStr" size="20" type="text" value="${shipmentReturn.returnDateStr}" onfocus="callCalender('returnDateStr')" onclick="callCalender('returnDateStr')" placeholder="DD/MM/YYYY"/>
					</c:if>
                    <c:if test="${type != 'new'}">
                    
                    	<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="returnDateStr" id="returnDateStr" size="20" type="text" value="${shipmentReturn[0].returnDateStr}" onfocus="callCalender('returnDateStr')" onclick="callCalender('returnDateStr')" placeholder="DD/MM/YYYY"/>
					</c:if>
						<span id="returnDateStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                   </div>
                </div>
                <div class="row textboxrow">
	                <div class="form-group col-lg-4 col-xs-4 lbl"  style="">
                         <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                   </div>
                    <div class="form-group col-lg-7 col-xs-8" style="">
                    
                     <c:if test="${type == 'new'}">
                    
                    	<input type="text"  class="form-control searchItems searchBar" placeholder="<spring:message code="search.supplier.label" />"  style="" name="supplier_name" id="searchSupplier" value="${shipmentReturn.supplierDescription}" />
					</c:if>
                    
                     <c:if test="${type != 'new'}">
                    
                    	<input type="text"  class="form-control searchItems searchBar" placeholder="<spring:message code="search.supplier.label" />"  style="" name="supplier_name" id="searchSupplier" value="${shipmentReturn[0].supplierDescription}" />
					</c:if>
						<div class="services">
				    		<div class="items">
				     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;z-index:10"></ul>
				   			</div>
						</div>
						<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												<c:if test="${type == 'new'}">
												 <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${shipmentReturn.supplierId}"/>
					                   </c:if>
					                     <c:if test="${type != 'new'}">
						
						 <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${shipmentReturn[0].supplierId}"/>
                   </c:if>
                   </div>
                </div>
                <div class="row textboxrow">
					<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
						<label><spring:message code="supplier.location.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                                    
	                <div class="form-group col-lg-7 col-xs-8" style="">
	                <c:if test="${type == 'new'}">
						<input type="text" class="form-control" name="supplierLocation" id="supplierLocation" value="${shipmentReturn.supplierLocation}" placeholder="<spring:message code="enter.supplier.location.label" />"/>
						</c:if>
	                	   <c:if test="${type != 'new'}">
	                
						<input type="text" class="form-control" name="supplierLocation" id="supplierLocation" value="${shipmentReturn[0].supplierLocation}" placeholder="<spring:message code="enter.supplier.location.label" />"/>
						</c:if>
						<span id="supplierLocationError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>        
                </div>
				<div class="row textboxrow">
					<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
						<label><spring:message code="grn.ref.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-7 col-xs-8" style="">
	                 <c:if test="${type == 'new'}">
	                
						<input type="text" class="form-control" name="supplierShipmentRef" id="supplierShipmentRef" value="${shipmentReturn.supplierShipmentRef}" placeholder="<spring:message code="grn.ref.label" />"/>
						</c:if>
	                <c:if test="${type != 'new'}">
	                
						<input type="text" class="form-control" name="supplierShipmentRef" id="supplierShipmentRef" value="${shipmentReturn[0].supplierShipmentRef}" placeholder="<spring:message code="grn.ref.label" />"/>
						</c:if>
						<span id="supplierShipmentRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>   
				</div>
                </div>                     
                </div>   
              <br>
              
              
              		<%-- <div class="col-lg-12" style="    background: #eee; padding: 10px 0px 10px 0px;margin-bottom: 10px;">
      									
      									
      									<div class="row">
              			 <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
              			 <c:forEach var="previousWorkFlowDate" items="${shipmentReturn[0].previousWorkFlowLogList}" varStatus="TheCount">
              			 <fmt:formatDate value="${previousWorkFlowDate.updatedDate}" var="startFormat" pattern="dd-MM-yyyy HH:mm:ss"/> 
						<input class="form-control" readonly="readonly" style="background-color: white;width: 14%;margin: 0px;display: inline-block;margin-right: 10px;" name="updated_due_date" id="updatedDate" size="20" type="text" value="${startFormat}"/>
						
                         </c:forEach>
                          </div>
              			</div>
      									
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 13px;">
      									  <c:forEach var="previousWorkFlowList" items="${shipmentReturn[0].previousWorkFlowLogList}">
      									  <div class="p" style="display:inline-block;"></div>
                                      <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList.status}
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2">
      								
      									<c:if test="${not empty shipmentReturn[0].nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                             <select class="form-control" id="statusissue" name="status">
                                             <option value="${procurementReceipt.status}">Action Required</option>
                                               <c:forEach var="activity" items="${shipmentReturn[0].nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                             
                                           </select>
      									</c:if>
      								
      									
      									</div>	
      									<div class="form-group col-lg-1"></div>
      									</div> --%>
      									
      									<div class="col-lg-12" style="background: #eee; padding: 10px 0px 10px 0px;margin-bottom: 10px;">
      									
      									
      									<div class="row">
              			 <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
              			 <c:forEach var="previousWorkFlowDate" items="${shipmentReturn[0].WHShipmentReturnWorkFlowLogList}" varStatus="TheCount">
						<span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;margin-right: 30px;">
      									${previousWorkFlowDate.userName}
      									</span>
                         </c:forEach>
                          </div>
              			 <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
              			 <c:forEach var="previousWorkFlowDate" items="${shipmentReturn[0].WHShipmentReturnWorkFlowLogList}" varStatus="TheCount">
              			 <fmt:formatDate value="${previousWorkFlowDate.updatedDate}" var="startFormat" pattern="dd-MM-yyyy HH:mm:ss"/> 
						<input class="form-control" readonly="readonly" style="background-color: white;width: 14%;margin: 0px;display: inline-block;margin-right: 10px;" name="updated_due_date" id="updatedDate" size="20" type="text" value="${startFormat}"/>
						
                         </c:forEach>
                          </div>
                          
                          <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
                          <c:forEach var="previousWorkFlowList" items="${shipmentReturn[0].WHShipmentReturnWorkFlowLogList}">
      									  <div class="p" style="display:inline-block;"></div>
                                      <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;margin-right: 40px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList.status}
      									</span>
      									
                                             </c:forEach>
                                          </div>   
              			</div>
      									
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 13px;">
      									  <%-- <c:forEach var="previousWorkFlowList" items="${shipmentReturn[0].WHShipmentReturnWorkFlowLogList}">
      									  <div class="p" style="display:inline-block;"></div>
                                      <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList.status}
      									</span>
      									
                                             </c:forEach> --%></div>
      									</div>
      									<div class="col-lg-2">
      								
      									<c:if test="${not empty shipmentReturn[0].nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                             <select class="form-control" id="statusissue" name="status">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${shipmentReturn[0].nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                             
                                           </select>
      									</c:if>
      								
      									
      									</div>	
      									<div class="form-group col-lg-1"></div>
      									</div>
      									<br>
              
              
              
			<div class="row">
			<br>
			
			 <div class="form-group col-lg-10" style="text-align:center;  margin-bottom: 0.3%;">
				<input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="" />
					<!-- <datalist id="skuList"></datalist> -->
					<div class="services">
			    		<div class="items">
			     			<ul class="matchedStringUl apparel" style="z-index:10"></ul>
			   			</div>
					</div>
			</div>
			<div class="form-group col-lg-1 col-xs-1" style="padding: 0px;padding-top: 5px;margin-bottom: 0px !important;">
											<input type="checkbox" style="vertical-align: -2px" id="taxInclusive" />
											 &nbsp;&nbsp;Inclusive
										</div>
			 <div class="form-group col-lg-1" style="margin-left: -4%;">
							    	<input type="button" class="btnCls buttonMargin" style="margin-left: 34%;padding: 3px;width: 134%;"  onclick="clearAll()" value="<spring:message code="storage_systems_clear.label" />" />
			</div>
		</div>	                   
             <div class="row">
         <div class="form-group col-lg-12" style="margin-top: -0.2%;">
          <div class="table-responsive" style="overflow:auto">
            <table id="productsList" class="table table-bordered table-hover">
              <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                	<th class="sticky-col first-col" style="width: 60px;background-color: #a1dbf1 !important;"><spring:message code="sl.no.label" /></th>
                        	<th class="sticky-col second-col"style="background-color: #a1dbf1 !important;"><spring:message code="skuid.label"/></th>
                        	<th class="sticky-col third-col"style="background-color: #a1dbf1 !important;"><spring:message code="ean.label"/></th>
                        	<th class="sticky-col fourth-col"style="background-color: #a1dbf1 !important;"><spring:message code="hsnCode.label"/></th>
<!--                         	<th class="sticky-col fifth-col"style="background-color: #a1dbf1 !important;">PO Ref</th>
 -->                             <th class="sticky-col fifth-col"style="background-color: #a1dbf1 !important;"><div style="width:200px"><spring:message code="item.desc.label"/></div></th>
                             <th style="width: 121px;"><spring:message code="batch.label" />
                             <th>M Range</th>
                            <th><spring:message code="uom.label"/></th>
                            <th><spring:message code="mrp.label"/></th>
                            <th><spring:message code="poqty.label"/></th>
                            <th><spring:message code="poprice.label"/></th>
                            <th><spring:message code="tax.label"/>%</th>
                            <th><spring:message code="cgst.label"/></th>
                            <th><spring:message code="sgst.label"/></th>
                            <th><spring:message code="igst.label"/></th>
                            <th>CESS</th>
                            <th>Return Qty</th>
                            <th><spring:message code="suppliedprice.label"/></th>
                            <th><spring:message code="cost"/></th>
                            <th>Reason</th>
                            <th><spring:message code="action.label"/></th>
               </tr>
              </thead>
                  <tbody style="text-align: center;" id="clearall">
                  
                  <c:if test="${type == 'new'}">
                  
                    <c:forEach var="itemList" items="${shipmentReturn.stockReturnItems}" varStatus="theCount">
	                         <td class="slno sticky-col first-col" style='background: #f9f9f9;'>${theCount.count}</td>
              									<td id="Name${theCount.count}"  class='sticky-col second-col' style='background: #f9f9f9;' >${itemList.skuId}</td>
              									<td id="ean${theCount.count}" class='sticky-col third-col' style='background: #f9f9f9;' >${itemList.ean}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${itemList.skuId}" />
              									<input type="hidden" id="sno${theCount.count}" value="${itemList.sno}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${itemList.pluCode}"/>
              									<input type="hidden" id="category${theCount.count}" value="${itemList.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${itemList.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${itemList.productRange}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${itemList.measurementRange}"/>
              									<input type="hidden" id="color${theCount.count}" value="${itemList.color}"/>
              									<input type="hidden" id="size${theCount.count}" value="${itemList.size}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${itemList.utility}"/>
              								   <input type='hidden' id="trackingRequired${theCount.count}" class="trackingRequired" value="${itemList.trackingRequired}"/>
              								   <input type='hidden' id='cessTaxRate${theCount.count}' value="${itemList.cessRate}"/>
              								     <input type='hidden' id='igsttaxRate${theCount.count}' value="${itemList.igstRate}"/>
              								      <input type='hidden' id='cgstsgsttaxRate${theCount.count}' value="${itemList.cgstRate}"/>
             								     <input type='hidden' id='taxationlist${theCount.count}' value='${itemList.taxdetailsStr}'/>
              								   
              								   <td id="hsnCode${theCount.count}" class='sticky-col fourth-col' style='background: #f9f9f9;'>${itemList.hsnCode}</td>
                  	                           <td id="Desc${theCount.count}" class='sticky-col fifth-col' style='width:300px!important;background: #f9f9f9;'><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${itemList.itemDesc}">${itemList.itemDesc}</a></div></td>    
                 								<td><textarea id="batchNum${theCount.count}" rows=1 style='resize:none;width: 87px;'>${itemList.productBatchNo}</textarea></td>
                  								<td>${itemList.measurementRange}</td>
                  								<td id="Make${theCount.count}" >${itemList.uom}</td>
                  								<td><input type="text" id="mrp${theCount.count}"  style="width:70px;text-align:center" value="${itemList.mrp}"></td>
                  								<td id="Requested${theCount.count}"  >${itemList.orderQty }</td>
                  								<td class='Price${theCount.count}' id="SPrice${theCount.count}" >${itemList.orderPrice}</td>
                  								<td id="tax${theCount.count}" onblur="changeGrnTax(this);" contenteditable="true" >${itemList.itemTax}</td>
                  								<td id="cgsttax${theCount.count}">${itemList.cgstValue}</td>
                  								<td id="sgsttax${theCount.count}">${itemList.sgstValue}</td>
                  								<td id="igsttax${theCount.count}">${itemList.igstValue}</td>
                  								<td id="cess${theCount.count}">${itemList.cessAmt}</td>
                  								<c:choose>
                  								<c:when test="${itemList.trackingRequired == false}">
                  								<td  class='Pack' onBlur='changePack(this);' id="Pack${theCount.count}" onkeypress='return (this.innerText.length < 10)' contenteditable="true"> ${itemList.suppliedQty }</td>
                  							    </c:when>
                  							    <c:otherwise>
                  							   <td  class='Pack' onBlur='changePack(this);' id="Pack${theCount.count}" onkeypress='return (this.innerText.length < 10)'> ${itemList.suppliedQty }</td>
                  							   </c:otherwise>
                  							   </c:choose>
                  							    <td  onBlur="changeSupplyPrice(this);" id="Price${theCount.count}" onkeypress='return (this.innerText.length < 10)' contenteditable="true" >${itemList.supplyPrice}</td>
                  								<td id="Cost${theCount.count}" >${itemList.totalCost}</td>
                  								<td><textarea id='remarks${theCount.count}' rows=1 style='resize:none;width: 150px;'>${itemList.remarks}</textarea></td>
                  								 
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${itemList.skuId}'/></td>
                  	   				
                  	   </tr>
              		   </c:forEach> 
                  
                  
                  </c:if>
                  
                  
        <c:if test="${type != 'new'}">
                  
                       <c:forEach var="itemList" items="${shipmentReturn[0].stockReturnItems}" varStatus="theCount">
	                       <tr id='dynamicdiv${theCount.count}' style='margin-top:5px;'>
    	                     <td class="slno sticky-col first-col" style='background: #f9f9f9;'>${theCount.count}</td>
              									<td id="Name${theCount.count}"  class='sticky-col second-col' style='background: #f9f9f9;' >${itemList.itemId}</td>
              									<td id="ean${theCount.count}" class='sticky-col third-col' style='background: #f9f9f9;' >${itemList.ean}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${itemList.itemId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${itemList.pluCode}"/>
              									<input type="hidden" id="category${theCount.count}" value="${itemList.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${itemList.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${itemList.productRange}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${itemList.measurementRange}"/>
              									<input type="hidden" id="color${theCount.count}" value="${itemList.color}"/>
              									<input type="hidden" id="size${theCount.count}" value="${itemList.size}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${itemList.utility}"/>
              								   <input type='hidden' id='cessTaxRate${theCount.count}' value="${itemList.cessRate}"/>
              								     <input type='hidden' id='igsttaxRate${theCount.count}' value="${itemList.igstRate}"/>
              								      <input type='hidden' id='cgstsgsttaxRate${theCount.count}' value="${itemList.cgstRate}"/>
              								     
              								     <input type='hidden' id='taxationlist${theCount.count}' value='${itemList.taxdetailsStr}'/>
              								   
              								   <td id="hsnCode${theCount.count}" class='sticky-col fourth-col' style='background: #f9f9f9;'>${itemList.hsnCode}</td>
<%--                   	                           <td  id="itemScanCode${theCount.count}"   class="itemScanCode sticky-col fifth-col" style='background: #f9f9f9;' ></td>  
 --%>                  	                           
                  	                           <td id="Desc${theCount.count}" class='sticky-col fifth-col' style='width:300px!important;background: #f9f9f9;'><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${itemList.itemDesc}">${itemList.itemDesc}</a></div></td>    
                 								<td><textarea id="batchNum${theCount.count}" rows=1 style='resize:none;width: 87px;'>${itemList.productBatchNo}</textarea></td>
                  								<td>${itemList.measurementRange}</td>
                  								<td id="Make${theCount.count}" >${itemList.uom}</td>
                  								<td><input type="text" id="mrp${theCount.count}"  style="width:70px;text-align:center" value="${itemList.mrp}"></td>
                  								<td id="Requested${theCount.count}"  >${itemList.orderQty }</td>
                  								<td class='Price${theCount.count}' id="SPrice${theCount.count}" >${itemList.orderPrice}</td>
                  								<td id="tax${theCount.count}" onblur="changeGrnTax(this);" contenteditable="true" >${itemList.itemTax}</td>
                  								<td id="cgsttax${theCount.count}">${itemList.cgstRate}</td>
                  								<td id="sgsttax${theCount.count}">${itemList.sgstRate}</td>
                  								<td id="igsttax${theCount.count}">${itemList.igstRate}</td>
                  								<td id="cess${theCount.count}">${itemList.cessAmt}</td>
                  						
                  								<td  class='Pack' onBlur='changePack(this);' id="Pack${theCount.count}" onkeypress='return (this.innerText.length < 10)' contenteditable="true"> ${itemList.suppliedQty }</td>
                  							   
                  							    <td  onBlur="changeSupplyPrice(this);" id="Price${theCount.count}" onkeypress='return (this.innerText.length < 10)' contenteditable="true" >${itemList.supplyPrice}</td>
                  								<td id="Cost${theCount.count}" >${itemList.costPrice}</td>
                  								<td><textarea id='remarks${theCount.count}' rows=1 style='resize:none;width: 150px;'>${itemList.remarks}</textarea></td>
                  								 
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${itemList.itemId}'/></td>
                  	   				
	  	 				  </tr>
              		   </c:forEach> 
              		   </c:if>
		 </tbody>
      </table>
   </div>
   </div>
   </div>
             <br>
             <div class="row ">
             		<div class="col-lg-7"></div>
             		
             			<div class="col-lg-5" style="border:1px solid #ccc;width:41%">
             			
             			<div class="col-lg-6" style="margin-top:3px">
					<div class="form-group col-lg-8 lbl labelpadding" style="text-align: right;"><label><spring:message code="sub.total.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                 <div class="form-group col-lg-4 " style="padding-right: 0px;
    padding-left: 2px;">    
       <c:if test="${type == 'new'}">
						<input type="text" class="form-control" name="goodsVal" readonly="readonly" id="goodsVal" value="${shipmentReturn.goodsVal}" placeholder=""/>
					</c:if>
					   <c:if test="${type != 'new'}">
					   						<input type="text" class="form-control" name="goodsVal" readonly="readonly" id="goodsVal" value="${shipmentReturn[0].goodsVal}" placeholder=""/>
					   
					   </c:if>
						<span id="subTotalError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>         
             </div>
             	<div class="col-lg-6" style="margin-top:3px">
					<div class="form-group col-lg-8 lbl labelpadding" style="text-align: right;">                 
						<label><spring:message code="Tax.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
	              <div class="form-group col-lg-4" style="padding-right: 0px;
    padding-left: 2px;">  
     <c:if test="${type == 'new'}">
	              <input type="text" class="form-control" name="taxValue" id="taxValue"  readonly="readonly" value="${shipmentReturn.taxValue}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
				</c:if>
      <c:if test="${type != 'new'}">
	              <input type="text" class="form-control" name="taxValue" id="taxValue"  readonly="readonly" value="${shipmentReturn[0].taxValue}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
				</c:if>
						<span id="totalTaxError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>    
					</div>
					
					
					
					<div class="col-lg-6"  >
					    
					<div class="form-group col-lg-8 lbl labelpadding" style="text-align: right; white-space: nowrap;">                   
						<label><spring:message code="shipment_charges.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
	                  <div class="form-group col-lg-4" style="padding-right: 0px;padding-left: 2px">  
	                  
	                   <c:if test="${type == 'new'}">
	              	<input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" style="" value="${shipmentReturn.shipmentCharges}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
					</c:if>
					 <c:if test="${type != 'new'}">
	               <input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" style="" value="${shipmentReturn[0].shipmentCharges}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
					 
					 </c:if>
						<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div> 
					</div>        
					
					
					<div class="col-lg-6">
					    
					<div class="form-group col-lg-8 lbl labelpadding" style="text-align: right;white-space: nowrap;">                   
						<label><spring:message code="total.price.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
	                  <div class="form-group col-lg-4" style="padding-right: 0px;padding-left: 2px">  
	                  <c:if test="${type == 'new'}">
	              	<input type="text" class="form-control" name="totalcost" id="totalcost" value="${shipmentReturn.shipmentCharges}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
					</c:if>
	                 
	                   <c:if test="${type != 'new'}">
	              	<input type="text" class="form-control" name="totalcost" id="totalcost" value="${shipmentReturn[0].shipmentCharges+shipmentReturn[0].goodsVal+shipmentReturn[0].taxValue}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
					</c:if>
						<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div> 
					</div>                      
             	</div>
             	</div>
             
              
                          
			<br><br><br>
			<div class="table-responsive" style="width:100%">
               <table id="returnAndAction" class="table table-bordered" style="margin-top: -2.07%;border:1px solid #857979;">
                 <thead style="background-color: #D3D3D3; color: #454242;">
                  <tr>
                    <th><spring:message code="Reason.For.Return"/></th>
                    <th><spring:message code="Action.Requested"/></th>
                 </tr>
                </thead>
                <tbody style="text-align: left;">
                  <tr>
                  	<td style="height:100px;width: 50%;">
                  	   <div><input type="radio" name="returnReason" id="overStock" checked="checked" onchange="activateTextBox(this)" value="Over Stock" >&nbsp;&nbsp;&nbsp;<spring:message code="Over.Stock.label"/></div>
                  	   <div><input type="radio" name="returnReason" id="overShipment" onchange="activateTextBox(this)" value="Over Shipment" >&nbsp;&nbsp;&nbsp;<spring:message code="Over.Shipment.on.po.label"/><input type="text" id="overShipmentTxt" style="width: 250px;" readonly="readonly" class="text-class returnReason"></div>
                  	   <div><input type="radio" name="returnReason" id="substitution" onchange="activateTextBox(this)" value="Substitution" >&nbsp;&nbsp;&nbsp;<spring:message code="Substitution.on.po.label"/><input type="text" id="substitutionTxt" readonly="readonly" style="width: 256px;" class="text-class returnReason"></div>
                  	   <div><input type="radio" name="returnReason" id="defective" onchange="activateTextBox(this)" value="Defective" >&nbsp;&nbsp;&nbsp;<spring:message code="Defective.explain.label"/><input type="text" id="defectiveTxt" style="width: 279px;" readonly="readonly" class="text-class returnReason"></div>
                   </td>
                   <td style="height:100px;border:1px solid #857979;">
                  	   <div><input type="radio" name="actionRequired" id="repairAndReturn" checked="checked" onchange="activateTextBox(this)" value="Repair and Return" >&nbsp;&nbsp;&nbsp;<spring:message code="Repair.and.Return.noCharge.label"/></div>
                  	   <div><input type="radio" name="actionRequired" id="repairAndBill" onchange="activateTextBox(this)" value="Repair and Bill" >&nbsp;&nbsp;&nbsp;<spring:message code="Repair.and.Bill.label"/></div>
                  	   <div><input type="radio" name="actionRequired" id="replace" onchange="activateTextBox(this)" value="Replace" >&nbsp;&nbsp;&nbsp;<spring:message code="Replace.no.Charge"/></div>
                  	   <div><input type="radio" name="actionRequired" id="fullCredit" onchange="activateTextBox(this)" value="Issue Full Credit" >&nbsp;&nbsp;&nbsp;<spring:message code="Issue.Full.Credit"/></div>
                  	   <div><input type="radio" name="actionRequired" id="other" onchange="activateTextBox(this)" value="Other" >&nbsp;&nbsp;&nbsp;<spring:message code="Other.label"/><input type="text" id="otherTxt" readonly="readonly" style="width: 300px;" class="text-class actionRequired"></div>
                   </td>
                 </tr>
               </tbody>
              </table>
            <div>
          </div>
          </div>
          <input type="hidden" id="status">
           <c:if test="${type == 'new'}">
	         		
          <input type="hidden" id="returnReason" value="${shipmentReturn.returnReason}">	
          <input type="hidden" id="returnComments" value="${shipmentReturn.returnComments}">	
          <input type="hidden" id="actionRequired" value="${shipmentReturn.actionRequired}">	
         
          </c:if>		
           <c:if test="${type != 'new'}">
	         		
          <input type="hidden" id="returnReason" value="${shipmentReturn[0].returnReason}">	
          <input type="hidden" id="returnComments" value="${shipmentReturn[0].returnComments}">	
          <input type="hidden" id="actionRequired" value="${shipmentReturn[0].actionRequired}">	
             <input type="hidden" id="currentstatus" value="${shipmentReturn[0].status}">
          </c:if>		                                    
		<br>
		    <input type="hidden" id="whreturnflag" value="1">     
		
		 <!--added by manasa  -->
<input type="hidden" id="flowUnder" value="${flowUnder}">
 <input type="hidden" id="outletLocation" value="${skuObj.fromLocation}">
  <input type="hidden" id="from" value="${skuObj.startDate}">
    <input type="hidden" id="to" value="${skuObj.endDate}">
      <input type="hidden" id="searchShipmentReturnsId" value="${skuObj.searchCriteria}">
    <!--//..added by manasa  -->
		
		</div><!-- /.box-body -->
				<div class="row" style="text-align: center;">
					<input type="hidden" id="flowUnder" value="${flowUnder}">
					
					
					<c:if test="${type == 'new'}">
				       <input type="button" class="btnCls" style="margin-right: 1%;" onclick="validateShipmentReturn('Submitted','new');" value="<spring:message code="submit.label" />" />
				    </c:if>
				    <c:if test="${type != 'new'}">
				    
				      <c:if test="${shipmentReturn[0].status == 'Draft'}">
				    	<input type="button" class="btnCls" style="margin-right: 1%;margin-right: 20%;" onclick="validateShipmentReturn('Draft','edit');" value="<spring:message code="save.label" />" />				   
				     
				       <input type="button" class="btnCls" style="margin-right: 1%;" onclick="validateShipmentReturn('Submitted','edit');" value="<spring:message code="submit.label" />" />
				   </c:if>
				    </c:if>
				    <c:if test="${type == 'new'}">
				     
				    <c:if test="${sessionScope.role == 'super admin'}">
				    	<input type="button" class="btnCls buttonMargin" onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" />
				    </c:if>
				    <c:if test="${sessionScope.role != 'super admin'}">
	        			<c:if test="${flowUnder == 'procurement'}">
		        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                           <c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" onclick="searchShipmentReturns('','','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        			<c:if test="${flowUnder == 'warehouse'}">
		        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" onclick="searchShipmentReturns('','','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        		</c:if>
	        		
	        		</c:if>
	        		
	        		<c:if test="${type != 'new'}">
	        		  <c:if test="${shipmentReturn[0].status == 'Draft'}">
	        			    <c:if test="${sessionScope.role == 'super admin'}">
				    	<input type="button" class="btnCls buttonMargin" onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" />
				    </c:if>
				    <c:if test="${sessionScope.role != 'super admin'}">
	        			<c:if test="${flowUnder == 'procurement'}">
		        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                           <c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" onclick="searchShipmentReturns('','','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        			<c:if test="${flowUnder == 'warehouse'}">
		        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" onclick="searchShipmentReturns('','','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        		</c:if>
	        		</c:if>
	        		<c:if test="${type != 'new'}">
	        			  <c:if test="${shipmentReturn[0].status != 'Draft'}">
	        			    <c:if test="${sessionScope.role == 'super admin'}">
				    	<input type="button" class="btnCls " onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" />
				    </c:if>
				    <c:if test="${sessionScope.role != 'super admin'}">
	        			<c:if test="${flowUnder == 'procurement'}">
		        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                           <c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btnCls " onclick="searchShipmentReturns('','','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        			<c:if test="${flowUnder == 'warehouse'}">
		        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btnCls " onclick="searchShipmentReturns('','','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        		</c:if>
	        		</c:if>
	        		</c:if>
	        		</c:if>
	        		
	        		
	        		
	        		
				</div>
			<div class="box-footer"></div>
          </form>
      </div>
      
      
      
        <input type="hidden" id="desc">
                <!-- COMPOSE MESSAGE MODAL -->
               	<div id="triggerEvent"></div>
               	<div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
      <!-- Modal content-->
      <div class="modal-content ">
        <div class="modal-header">
       
          <button type="button" class="close"  data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you want to Close the  PO Ref
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-10"></div>
   
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" id="closepo" onclick="validateShipmentReceipt('save','true')"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" id="openpo" onclick="validateShipmentReceipt('save','false')" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
   
  
        </div>
        <br/>
        
        
        
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
         <div class="modal fade popup-display" id="items-modals" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: fit-content;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" style="/* overflow:auto; */">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                         <th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                               <th style="width:10"><spring:message code="item.desc.label"/></th>
                             <th>Batch Id</th>
                             <th>Expiry Date</th>
                             <th>Quantity in Hand</th>
                             <th><spring:message code="price.label"/></th>
                             <th><spring:message code="color.label"/></th>
                             <th><spring:message code="size.label"/></th>
                             <th><spring:message code="ean.label"/></th>
                         
                             <th>Mrp</th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;overflow-x:auto;width:100%">
                       
			 			</tbody>
                    </table>
                 </div>
               
                     <div class="col-lg-8 col-sm-8 col-xs-12" style=""></div>
          <div class="form-group col-lg-4 col-sm-4 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="getPriceshipmentreturn();"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
              </div>
             </form> 
          
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
		<input type="hidden" class="form-control"  id="supplier_state" readonly="readonly" value="${shipmentReturn[0].supplier_state}"/>
		 <input type="hidden" class="form-control"  id="location_state" readonly="readonly" value="${shipmentReturn[0].location_state}"/>
</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 