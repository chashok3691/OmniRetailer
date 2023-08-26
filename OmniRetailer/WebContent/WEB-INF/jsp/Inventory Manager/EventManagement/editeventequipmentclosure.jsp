<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/packagingandprocessing/packagingandprocessingsummary.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
</head>
<style>
.allignment{
   /*width: 13.3%; */
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
   /*  height: 24px; */
    padding: 0px 6px;
    margin-bottom:4px;
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
	callCalender('Eventstart');
	callCalender('EventEnd');
	callCalender('Date');
		
	if($("#statusoftheevents").val() !="Approved"){
		$("#eventEquipmentClosureeditable").css("pointer-events","none");
		$("#EquipmentClosureSubmit").css("display","none");
	}
	
	if(parseInt($("#lengthofEquClosure").val()) != 0 ){
		$("#EquipmentClosureSubmit").css("display","none");
	}
	
	
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
			Event Closure
		</h3>
		
		 <div id="ErrorEquipmentClosure" style="text-align:center;color:red;font-weight:bold;">${ErrorEquipmentClosure}</div>
           <div id="SuccessEquipmentClosure" style="text-align:center;color:blue;font-weight:bold;">${SuccessEquipmentClosure}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive" id="eventEquipmentClosureeditable">
         <div class="row">
         <div class="col-lg-12">
  <div class="col-lg-4"></div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control"   id="eventrefEquipmentClosure" value="${eventRef}" placeholder="Sales Person" readonly="readonly"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                      <select class="form-control" id="outletEquipmentClosure" disabled="disabled" >
                                <c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>	                           
	                        </select>
                         </div>
             </div>
             </div>
              
      
         
           <div class="col-lg-12" style="  margin-top: 30px;">
          <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   <label style=" font-weight: bold;background: lightgray; padding: 3px;">Equipment Return</label>
                     <table id="productstocksEquipmentClosure" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	                <th><spring:message code="s.no.label" /></th>
                                                <th>Equipment ID</th>
                                                <th>Description</th>
                                                <th>Issue Qty</th>
                                                <th>Return Qty</th>
                                                <th>Action</th>

                             </tr>
                         </thead>
                                  <tbody style="text-align: center;">
                         <c:choose>
                         <c:when test="${fn:length(eventMastersList.eventEquipmentReturnDetails)>0}">
                          <c:forEach var="inventories" items="${eventMastersList.eventEquipmentReturnDetails}"  varStatus="theCount">
                             <tr>
                         	 	<td class="slnoEquipmentClosure" id="EquClosureSno${theCount.count}">${theCount.count}</td>
                         	 	<td id="EquClosureItemCode${theCount.count}">${inventories.machineEquipmentId}</td>
                             	<td id="EquClosureDesc${theCount.count}">${inventories.description}</td>
                             	<td><input id="EquClosureIssue${theCount.count}" type="number"    min="0" value="${inventories.issueQuantity}" style="text-align: center;" readonly="readonly"></td>
                         	 	<td><input id="EquClosureReturn${theCount.count}" type="number"    min="0" value="${inventories.returnQuantity}" style="text-align: center;" ></td>
                             	<td><img id="Img1${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20%;cursor:pointer;" onclick="" title="Delete ${inventories.machineEquipmentId}"/></td>
                             </tr>
                           </c:forEach>                

                             <%-- <c:forEach var="inventories" items="${ReturnUniqueList}" varStatus="theCount">
                             <tr>
                         	 <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}" /></td>
                         	 	<td class="slnoInventoryClosure" id="InvClosureSno${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}">${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}</td>
                         	 	<td id="InvClosureItemCode${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}">${inventories.skuId}</td>
                             	<td id="InvClosureDesc${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}">${inventories.item_description}</td>
                             	<td id="InvClosureUom${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}">${inventories.uom}</td>
                             	<td id="InvClosureSize${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}">${inventories.size}</td>
                             	<td><input id="invClosureIssue${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}" type="number"    min="0" value="${inventories.issueQuantity}" style="text-align: center;" readonly="readonly"></td>
                         	 	<td><input id="invClosureCons${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}" onchange="inventoryClosureCal('${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}')"   type="number"    min="${inventories.consQuantity}" value="0" style="text-align: center;"></td>
                             	<td><input id="invClosureWastage${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}" onchange="inventoryClosureCal('${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}')" type="number"    min="0" value="${inventories.wastageQuantity}" style="text-align: center;"></td>
                             	<td><input id="invClosureReturn${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}" type="number"    min="0" value="${inventories.returnQuantity}" style="text-align: center;" readonly="readonly"></td>
                             	<td><img id="Img1${theCount.count+fn:length(eventMastersList.eventInventoryReturnDetails)}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20%;cursor:pointer;" onclick="" title="Delete ${inventories.skuId}"/></td>
                             </tr>
                           </c:forEach> --%>
                           
                          </c:when>
                         <c:otherwise>
                         <c:forEach var="inventories" items="${eventMastersList.eventEquipmentDetails}"  varStatus="theCount">
                             <tr>
                         	 	<td class="slnoEquipmentClosure" id="EquClosureSno${theCount.count}">${theCount.count}</td>
                         	 	<td id="EquClosureItemCode${theCount.count}">${inventories.equipmentId}</td>
                             	<td id="EquClosureDesc${theCount.count}">${inventories.equipmentName}</td>
                             	<td><input id="EquClosureIssue${theCount.count}" type="number"    min="0" value="${inventories.equipmentQuantity}" style="text-align: center;" readonly="readonly"></td>
                         	 	<td><input id="EquClosureReturn${theCount.count}" type="number"    min="0" value="${inventories.equipmentQuantity}" style="text-align: center;" onchange="validateEquReturnQty('${theCount.count}')"></td>
                             	<td><img id="Img1${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20%;cursor:pointer;" onclick="" title="Delete ${inventories.equipmentId}"/></td>
                             </tr>
                           </c:forEach>
                         </c:otherwise>
                         </c:choose>
                        
                           
                         </tbody>
                     </table>
                    </div>
  
         
         
         
         
         </div>
         
      
  
  </div>
   
                    <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
                    <c:if test="${not empty eventMastersList.userActivitiesForEquipment}">
							<input type="button" id="EquipmentClosureSubmit" class="btnCls" style="padding: 4px 12px; !important"
								onclick="EquipmentClosure()"
								value="<spring:message code="submit.label" />" />
								</c:if>
<%-- 							 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" onclick="PrintEventDetails('${eventRef}','${eventMastersList.eventStatus}','edit','');" value="Print" /> 
 --%>														<input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
						</div>    
                    </div>
                     </div>
                    


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
             
              	


  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>