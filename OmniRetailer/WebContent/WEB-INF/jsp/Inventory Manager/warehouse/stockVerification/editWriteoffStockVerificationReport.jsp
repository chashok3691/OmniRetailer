<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : vijay
 * file name		        : inventorymanager/retailoutlets/stockVerification.jsp
 * file type		        : JSP
 * description			: The new stock verification report form is displayed using this jsp
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockVerification.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
    
<style type="text/css">

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


.summaryImg {
    width: 50%;
    float: right;
    /* margin-right: 0%; */
    padding-bottom: 5px;
}



a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
a.back{
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

.col-lg1-1
{
width:10.5%;
}

</style>  
<script type="text/javascript">
$(document).ready(function(){
	
	debugger;
	
	$('#StockVerification').click(function(){
        var searchStockVerification = $('#searchStockVerification').val();
        return viewWarehouseStockVerification('outletWareHouseStockVerification','0','outlet','','','');
    })
    $('#searchStockVerification').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#StockVerification').click();//Trigger search button click event
        }
    });
		
	callCalender('startDateStr');
	callCalender('endDateStr');
	debugger;
	   var Stocktotal = [];
	   var openStockTotal=0.0;
	   $(".openStock").each( function(){
			 Stocktotal.push( $(this).text() );  
	   	     });
	
		for (var i = 0; i < Stocktotal.length; i++) {
			 openStockTotal+=Stocktotal[i];
		}
		if(openStockTotal < 0)
			openStockTotal = openStockTotal * (-1);
		$('#totalOpenStock').text(parseFloat(openStockTotal+0.00).toFixed(2));
		
		var Saletotal = [];
		   var opensaleTotal=0.0;
		   $(".saleQty").each( function(){
			   Saletotal.push( $(this).text() );  
		   	     });
			
			for (var i = 0; i < Saletotal.length; i++) {
				opensaleTotal+= Saletotal[i];
			}
			if(opensaleTotal < 0)
				opensaleTotal = opensaleTotal * (-1);
			$('#totalSaleQty').text(parseFloat(opensaleTotal+0.00).toFixed(2));
			
			var stockBooktotal = [];
			   var openStockBookTotal=0.0;
			   $('.skuBookStock').each( function(){
				   stockBooktotal.push( $(this).text() );  
			   	     });
				
				for (var i = 0; i < stockBooktotal.length; i++) {
					openStockBookTotal = parseFloat(openStockBookTotal) + parseFloat(stockBooktotal[i]);
				}
				if(openStockBookTotal < 0)
					openStockBookTotal = openStockBookTotal * (-1);
				$('#stockBookTotal').text(parseFloat(openStockBookTotal+0.00).toFixed(2));
				
				var actualStockTotal = [];
				   var actualTotal=0.0;
				   $('.skuPhyStock').each( function(){
					   actualStockTotal.push( $(this).text() );  
				   	     });
					
					for (var i = 0; i < actualStockTotal.length; i++) {
						actualTotal = parseFloat(actualTotal) + parseFloat(actualStockTotal[i]);
					}
					if(actualTotal < 0)
						actualTotal = actualTotal * (-1);
					$('#actualStockTotal').text(parseFloat(actualTotal+0.00).toFixed(2));
					
					
					
					//$('#totalStockDump').text(openstockdumpTotal+0.00);
					
					var declaredtotalCost = [];
					   var declaredTotal=0.0;
					   $('.declaredQty').each( function(){
						   declaredtotalCost.push( $(this).text() );  
					   	     });
						
						for (var i = 0; i < declaredtotalCost.length; i++) {
							declaredTotal = parseFloat(declaredTotal) + parseFloat(declaredtotalCost[i]);
						}
						if(declaredTotal < 0)
							declaredTotal = declaredTotal * (-1);
						$('#declaredtotalCost').text(parseFloat(declaredTotal+0.00).toFixed(2));
					
					
					
					var totalDump = [];
					   var dumpTotal=0.0;
					   $('.dumpQty').each( function(){
						   totalDump.push( $(this).text() );  
					   	     });
						
						for (var i = 0; i < totalDump.length; i++) {
							dumpTotal = parseFloat(dumpTotal) + parseFloat(totalDump[i]);
							
						}
						if(dumpTotal < 0)
							dumpTotal = dumpTotal * (-1);
						$('#totalDump').text(parseFloat(dumpTotal+0.00).toFixed(2));
						
						
						var totalDifference = [];
						   var diffTotal=0.0;
						   $('.stockLossQty').each( function(){
							   totalDifference.push( $(this).text() );  
						   	     });
							
							for (var i = 0; i < totalDifference.length; i++) {
								diffTotal = parseFloat(diffTotal) + parseFloat(totalDifference[i]);
							}
								if(diffTotal < 0)
									diffTotal = diffTotal * (-1);
							
							$('#totalDifference').text(parseFloat(diffTotal+0.00).toFixed(2));

							var totalClose = [];
							   var closeTotal=0.0;
							   $('.closedAtock').each( function(){
								   totalClose.push( $(this).text() );  
							   	     });
								
								for (var i = 0; i < totalClose.length; i++) {
									closeTotal = parseFloat(closeTotal) + parseFloat(totalClose[i]);
								}
								if(closeTotal < 0)
									closeTotal = closeTotal * (-1);
								
								$('#totalClose').text(parseFloat(closeTotal+0.00).toFixed(2));
	
});



</script>
</head>
<body>
<!-- Main content -->

			
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
	<div class="box-header" align="center">
				<h3 class="box-title" >
					${verificationCode} - <spring:message code="stock.verification.report.item.label"/>
				</h3>			
				</div><!-- /.box-header -->
       <div class="box-body">
       
       <div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
	           <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: 0px">${success}</div>
	              
	            </div>
	            
	         <div class="row" style="float:right">
                <div class="col-lg-12" >
<%--                  <div class="col-lg-1" style=""><input type="button" style="margin-left:-75px" class="btnCls" onclick="PrintVerificationItems('${verificationCode}','${productStockOpenVerificationDetailsList.location}');PrintNonVerificationItems('${verificationCode}','${productStockOpenVerificationDetailsList.location}')" value="Save"></div>
 --%>                  
 
 
 
  <c:if test="${status != 'Write Off'}">  
 <div class="col-lg-1" style=""><input type="button" style="" class="btnCls" onclick="doWriteOffVerification('outletStockVerificationReport','${verificationCode}','')" value="<spring:message code="submit.label" />"></div>
</c:if>            
         <div class="col-lg-1" style="margin-left: 76px;margin-right: -103px;"><input type="button" onclick="viewWarehouseStockVerification('outlettStockVerification','0','${flowUnder}','menu','','');" class="btnCls" value="<spring:message code="back.label"/>">

                     </div>
                  </div>
              </div>
       
       <div class="row">
       
   <div class="col-lg-12">

                  <div class="row">
                  
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                            <select class="form-control" name="stockZone" id="zone">
						     	 <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
								<%-- <option value="${zone}">${zone}</option> --%>
                                           </select>
                         </div>
                      </div>
                      <div class="col-lg1-1 col-lg-1"></div>
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group"   value="${verifiedOnStr}" style="background-color: white;" id="startDateStr" size="20" type="text" onfocus="callCalender('startDateStr')" onclick="callCalender('startDateStr')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	          
	           <div class="col-lg1-1 col-lg-1"></div>
	           <c:set var="startTime" scope="page" value="${startTimeStr}"></c:set>
	           <c:if test="${not empty startTime}">  
                         <div class="col-lg1-2 col-lg-2  bootstrap-timepicker">
              <div class="col-lg-12 input-group" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="starttime.label"/></label>
<%--                 	 	//<input class="form-control calendar_icon form-group" readonly="readonly" value="${startTime}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" /> --%>
	            <input type="text" name="startTime"  class="form-control timepicker" id="startTime" value="${startTimeStr}"  />
					<span id="Error" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                    	 
	              </div>
	            </div>
	            </c:if>
	            
	              <c:if test="${empty startTime}">  
                         <div class="col-lg1-2 col-lg-2  bootstrap-timepicker">
              <div class="col-lg-12 input-group"  style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="starttime.label"/></label>
<%--                 	 	//<input class="form-control calendar_icon form-group" readonly="readonly" value="${startTime}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" /> --%>
	            <input type="text" name="startTime"  class="form-control timepicker" id="startTime" value="00:00:00"  />
					<span id="Error" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                    	 
	              </div>
	            </div>
	            </c:if>
	            
	            <div class="col-lg1-1 col-lg-1"></div>
	                   <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="verified.by.label"/></label>
	            <input type="text" name="verifiedBy"  class="form-control" id="verifiedBy" value="${verified_by}"  />
	              </div>
	            </div>
	         <%--   <div class="col-lg-1">
                  <label></label>
				   <a onclick="viewWarehouseStockVerification('outlettStockVerification','0','outlet','menu','','');" class="back"><spring:message code="back.label"/></a>

</div> --%>
	                </div>
	           <div class="row">
                   
                    
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                          	             <select class="form-control"  name="location" id="locationStr">
											 <c:forEach var="outletlocationsList" items="${locationsList}">
												<option value="${outletlocationsList}" ${outletlocationsList == productStockOpenVerificationDetailsList.location ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option>
											 </c:forEach>
												<%-- <option value="${location}">${location}</option> --%>
                                           </select>
                      </div>
                      </div>
                     <div class="col-lg1-1 col-lg-1"></div>
                     
                  
                     
                      <div class="col-lg1-2 col-lg-2" >
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group"  value="${verifiedUptoStr}" style="background-color: white;" id="endDateStr" size="20" type="text" onfocus="callCalender('endDateStr')" onclick="callCalender('endDateStr')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		           <div class="col-lg1-1 col-lg-1"></div>
		           <c:set var="endTime" scope="page" value="${endTimeStr}"></c:set>
	           <c:if test="${not empty endTime}"> 
		               <div class="col-lg1-2 col-lg-2 bootstrap-timepicker" >
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="endtime.label"/></label>
	                      <input type="text" name="endTime"  class="form-control glyphicon glyphicon-time timepicker" id="endTime" value="${endTimeStr}"  />
		           </div>
		          </div>
		          </c:if>
		          <c:if test="${empty endTime}"> 
		               <div class="col-lg1-2 col-lg-2" >
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="endtime.label"/></label>
	                    <input type="text" name="endTime"  class="form-control glyphicon glyphicon-time timepicker" id="endTime" value="00:00:00"  />
		           </div>
		          </div>
		          </c:if>
		          
		           <div class="col-lg1-1 col-lg-1"></div>
		            

                 <%-- <div class="col-lg1-2 col-lg-2" >
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="status.label"/></label>
	                   <input type="text" name="status"  class="form-control" id="status" value="${status}"  />
		           </div>
		          </div> --%>
		          

                  <div class="col-lg-1">

</div>

                
                </div>
                
               
                
 

  <div class="col-lg-12 col-xs-12">
                  <br>
                  </div>
	 
          
				              <c:if test="${not empty varificationStatus}">  
   							<div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;margin-bottom: 10px">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${status}
      									
      									</span>
      									
</div>
      									</div>
      						
      									<div class="col-lg-1"></div>
      									</div>
				                  </c:if>
				                    
				                    
				                    
				                    
				                    <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${productStockOpenVerificationDetailsList.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach>
                                             </div>
      									</div>
      										<div class="col-lg-1"></div>
      									<div class="col-lg-2" style="">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${productStockOpenVerificationDetailsList.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty productStockOpenVerificationDetailsList.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${productStockOpenVerificationDetailsList.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <!-- <option value="">Action Required</option> -->
                                               <c:forEach var="activity" items="${productStockOpenVerificationDetailsList.nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockRequestsObj.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty productStockOpenVerificationDetailsList.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <!-- <option value="">Action Required</option> -->
                                               <c:forEach var="activity" items="${productStockOpenVerificationDetailsList.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${productStockOpenVerificationDetailsList.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									</div>
      									
      									</div>
      									<div class="col-lg-1"></div>
      									</div>
				                    
				                    
				                    
				                    
				                    
				                    
				                    <div class="col-lg-12" style="padding: 10px 0px 10px 0px;margin-bottom: 10px">
                                         <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
				         			<table id="verifiedStocks" class="table table-bordered table-striped"> 
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="s.no.label" /></th>
                                            	<th><spring:message code="skuid.label" /></th>
                                            	<th><spring:message code="sku.desc.label" /></th>
                                            	<th>Ean</th>
                                            	<th>Mrp</th>
                                            	<th>Cost price</th>
                                                <th><spring:message code="openstock.label" /></th>
                                                <th><spring:message code="saleqty.label" /></th>
                                                <th>System Stock</th>
                                             <th><spring:message code="actualstock.label" /> </th>
                                                <th><spring:message code="declared.stock.label" /> </th>
                                               
                                                <th><spring:message code="dump.label" /></th>
                                                <th><spring:message code="diff.label" /> </th>
                                                <th><spring:message code="closestock.label" /></th>
                                                  <th><spring:message code="closestockcost.label" /></th>
                                                <th><spring:message code="losstype.label" /></th>
                                                
                                            </tr>
                                        </thead>
                                      
								<tbody style="text-align: center;">
                                           <c:forEach var="itemList" items="${productStockOpenVerificationDetailsList.itemsList}"  varStatus="theCount">
                                            <tr  id="itemsRow${theCount.count}">
                                           	<td id="sNo${theCount.count}">${theCount.count+index-1}</td>
                                           	<td id="skuId${theCount.count}">${itemList.sku_id}</td>
                                            <td id="skuDescription${theCount.count}">${itemList.skuDescription}</td>
                                            <td id="ean${theCount.count}">${itemList.ean}</td>
                                            <td id="mrpValue${theCount.count}">${itemList.skuMrp}</td>
                                            <td id="costPriceValue${theCount.count}">${itemList.skuCostPrice}</td>
                                            <input type="hidden" id="verificationCode${theCount.count}" value="${itemList.verification_code}">
                                             <input type="hidden" id="color${theCount.count}" value="${itemList.color}">
                                              <input type="hidden" id="size${theCount.count}" value="${itemList.size}">
                                              <input type="hidden" id="modal${theCount.count}" value="${itemList.modal}">
                                              <input type="hidden" id="pluCode${theCount.count}" value="${itemList.pluCode}">
                                            <td class="openStock"  id="openStock${theCount.count}">${itemList.openStock}</td>
                                            <td class="saleQty" id="saleQty${theCount.count}"> ${itemList.saleQty}</td>
                                            <td class="skuBookStock" id="skuBookStock${theCount.count}">${itemList.sku_book_stock} </td>
											<td class="skuPhyStock" onkeypress='return (this.innerText.length < 10)' onBlur="changeStockQty(this)" contenteditable='true' id="skuPhyStock${theCount.count}">${itemList.sku_physical_stock}</td>
										    <td class="declaredQty" contenteditable='true' id="declaredQty${theCount.count}" >${itemList.declaredQty}</td>
											
											<td class="dumpQty" onkeypress='return (this.innerText.length < 10)' onBlur="changeDumpQty(this)" contenteditable='true' id="dumpQty${theCount.count}">${itemList.dumpQty}</td>
                                            <td class="stockLossQty" id="stockLosssqty${theCount.count}">${itemList.stockLossQty} </td>
                                            <td class="closedAtock" id="closedStock${theCount.count}">${itemList.closedStock} </td>
                                              <td class="closedStockCost" id="closedStockCost${theCount.count}">${itemList.closedStockCost} </td>
                                            <td><select  style='width:100px;height:25px;text-align:center' id="lossType${theCount.count}">
                                            <option value="Damaged" ${itemList.loss_type == 'Damaged' ? 'selected' : ''}>Damaged</option>
			                  		<option value="Expired" ${itemList.loss_type  == 'Expired' ? 'selected' : ''}>Expired</option>
			                  		<option value="Manufacturing Defect" ${itemList.loss_type  == 'Manufacturing Defect' ? 'selected' : ''}>Manufacturing Defect</option>
			                  		</select>  </td> 
                                   </tr>
                                            </c:forEach>
<%-- <tr>
                                             <td></td>
                                         <td></td>
                                       <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                       <td  style="padding:3px;width: 160px;"><div id="totalOpenStock" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalSaleQty" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="stockBookTotal" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="actualStockTotal" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="declaredtotalCost" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalDump" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalDifference" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                                       <td style="padding:3px;width: 160px;"><div id="totalClose"style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
										<td> </td>                                    
                                      
                                            </tr> --%>
                                        </tbody>
                                    
</table>
              </div>        
                                      </div>
                                      
                                      
                                      
       <%--                  <div class="row">
                  
                 <div class="row" style="padding-left:12px;padding-right:12px">
        
                  
                  
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockVerificationOpen('outletStockVerificationReport','${totalValue}','${flowUnder}','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','','${zone}','${location}','edit','${masterVerificationCode}'); ">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockVerificationOpen('outletStockVerificationReport','${index - (maxRecords + 1)}','${flowUnder}','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','','${zone}','${location}','edit','${masterVerificationCode}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockVerificationOpen('outletStockVerificationReport','${index - (maxRecords + 1)}','${flowUnder}','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','','${zone}','${location}','edit','${masterVerificationCode}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockVerificationOpen('outletStockVerificationReport','${totalValue}','${flowUnder}','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','','${zone}','${location}','edit','${masterVerificationCode}');">
              	</div> 
              	</c:if>
              	
              	
                  
                  
                  <div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="viewStockVerificationOpen('outletStockVerificationReport',document.getElementById('pagination').value,'${flowUnder}','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','','${zone}','${location}','edit','${masterVerificationCode}');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div>
            </div>
                                
                            --%>           
                                      
                                      
                                     
                  
                 <input type="hidden" id="masterVerificationCode" value="${masterVerificationcode}">
                 <input type="hidden" id="flowUnder" value="${flowUnder}">
                   <!-- added by manasa -->
<input type="hidden" id="outletCategory" value="${verifiObj.productCategory}">

     <input type="hidden" id="location" value="${verifiObj.store_location}">
      <input type="hidden" id="outletSubcategory" value="${verifiObj.subCategory}">
       <input type="hidden" id="outletDepartmentId" value="${verifiObj.department}">
        <input type="hidden" id="outletSubDepartmentId" value="${verifiObj.subDepartment}">
        
  <input type="hidden" id="startDate" value="${verifiObj.startDate}">
   <input type="hidden" id="endDate" value="${verifiObj.endDate}">
<!-- //..added by manasa -->
                                    

<div class=row>
<div><br></div>
</div>          
<div class="row" style="float:right">
<div class="col-lg-12" >
<%--  <div class="col-lg-1" style=""><input type="button" style="margin-left:-75px" class="btnCls" onclick="PrintVerificationItems('${verificationCode}','${productStockOpenVerificationDetailsList.location}');PrintNonVerificationItems('${verificationCode}','${productStockOpenVerificationDetailsList.location}')" value="Save"></div>
 --%>
  <c:if test="${status != 'Write Off'}">  
 <div class="col-lg-1" style=""><input type="button" style="" class="btnCls" onclick="doWriteOffVerification('outletStockVerificationReport','${verificationCode}','')" value="<spring:message code="submit.label" />"></div>
</c:if>
<div class="col-lg-1" style="margin-left: 76px;margin-right: -103px;"><input type="button" onclick="viewWarehouseStockVerification('outlettStockVerification','0','${flowUnder}','menu','','');" class="btnCls" value="<spring:message code="back.label"/>">

</div>
</div>
 </div>
</div>
            
            
            
            
             </div><!-- /.box-body -->
                            </div><!-- /.box --> 
       </div></div></div>

</section>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
        
        $(".timepicker").timepicker({
            showInputs: false,
            showMeridian:false,
            showSeconds:true,
            
         });
        
        
            $(function() {
                $("#verifiedstocks").dataTable(
             		{
             			"bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
       
</body>
</html>


