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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
        	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/packagingAndProcessing.js"></script>
      
        
        <style>
        
        table, th, td {
  width: 85px ;
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
    width: 140%;
}
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
.modal-header .close {
    margin-top: -9px;
    color: #000;
    /* border: 1px solid #000; */
}

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 9;
  /* background-color: white; */
}

.first-col {
 /*  width: 100px;
  min-width: 100px;
  max-width: 100px; */
  left: 0px;    
}

.second-col {
    left: 30px;
}
.third-col {
    min-width: 100px;
    max-width: 100px; 
    left: 112px;
}
.fourth-col {
    min-width: 200px;
    max-width: 200px;
    left: 195px;
}


.matchedStringUl {
   
    z-index: 15;
   
}
        </style>



<script type="text/javascript">
$(document).ready(function(){
		debugger
	setData();
	var errorSku="";
	var length=$(".dynamicdiv").length
	var workFlow =  $("#workFlow").val();
	
if(workFlow == "Submitted"){
	for (var i =1 ;i<=length ;i++){
		var l =$(".rowone"+i).length - 1 ;
		
		for(var j=1;j<=l ;j++){
			
			var packagesListavlQty = $("#packagesListavlQty"+i+""+j).val();
			var isZeroBillingFlag = $("#packagesListzeroflag"+i+""+j).val();
			if(packagesListavlQty == "0.0" && isZeroBillingFlag == "false"){
				if(i == i && j == 1){
					errorSku += "We can't process your request, Due to " + $("#packagesListSkuId"+i+""+j).val();
				}else{
					if(errorSku != ""){
						errorSku += ","+$("#packagesListSkuId"+i+""+j).val();
					}else{
						"We can't process your request, Due to " + $("#packagesListSkuId"+i+""+j).val();
					}
				}
			}
		}
		//var packagesListavlQty = $("#packagesListavlQty"+i).val();
	}
}
	if(errorSku != ""){
		errorSku += " SKU(s) has insufficient quantity."
		$(".submit").attr('disabled','disabled');
		$("#ErrorDetail").html(errorSku);
	}
	
});


</script>  

</head>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Edit-Package
		</h3>
		</div>
             <div id="ErrorDetail" class="Error" style="text-align: center; color: red; font-size: 2; font-weight: bold; margin-bottom: 20px;">${err}</div>
			 <div id="SuccessDetail" class="Error" style="text-align: center; color: blue; font-size: 2; font-weight: bold; margin-bottom: 20px;">${success}</div>
              <input type="hidden" id="Errorskus"value=""/>
               <div class="box-body table-responsive">
               
                  <div class="row" style="margin-left: 0px;">
                         <div class="col-lg1-2 col-lg-2">
                        <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                          <c:choose>
                         <c:when test ="${flowUnder == 'warehouse' }" > 
                           <select class="form-control" id="warehouseZone" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == packages.zone? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
	                         <select class="form-control" id="warehouseZone" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == packages.zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
	                        
	                        </c:otherwise>
                         </c:choose>
                         </div>
                       </div>
                       
                        <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.name.label" /></label>
                        <input type="text"  class="form-control searchItems" placeholder="Enter Supplier Name " name="supplier_name" id="searchSupplier" value="${packages.supplierName}" style="height:30PX;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;" />
						<!-- <datalist id="supplierList"></datalist> -->
						<div class="services">
				    		<div class="items">
				     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   			</div>
						</div>
						<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div>
                       
                       
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Packer</label>
                            <input type="text" id="packedBy" class="form-control" value="${packages.packer}">
                       </div>
                       </div>
                         <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Storage Area</label>
                               <select id="storageArea" class="form-control">
                                   <option value="Shelf" ${packages.storageArea == "Shelf" ? 'selected' : ''}>Shelf</option>
									<option value="Racks" ${packages.storageArea == "Racks" ? 'selected' : ''}>Racks</option>
									<option value="Bins" ${packages.storageArea == "Bins" ? 'selected' : ''}>Bins</option>
									<option value="Fridge" ${packages.storageArea == "Fridge" ? 'selected' : ''}>Fridge</option>
									<option value="Empty area" ${packages.storageArea == "Empty area" ? 'selected' : ''}>Empty area</option>
									<option value="Bin Array" ${packages.storageArea == "Bin Array" ? 'selected' : ''} >Bin Array</option>
                            
                            </select>

                       </div>
                       </div>
                       
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Packed By</label>
                            <input type="text" id="packedbyadd"  class="form-control" value="${packages.packedBy}">
                       </div>
                       </div>
                       
                       
                       
                       </div>
                         <div class="row" style="margin-left: 0px; margin-bottom: 20px;">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="warehouseLocation" disabled>
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
	                          <%--   <c:choose>
								 <c:when test="${flowUnder == 'outlet'}"> --%>
								 <c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == packages.storeLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == packages.storeLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
								<%--  </c:when>
								 <c:otherwise>
								 <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
								 </c:otherwise>
								 
								 </c:choose> --%>
	                            
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		</c:forEach>
	                        </select>
                      </div>
                       </div>
                       
                        <div class="col-lg1-3 col-lg-3">
                        <label>GRN Ref</label>
                          
                            <input type="text" onblur="criteria(this)" readonly="readonly" class="form-control allField searchItems searchBar" value="" style="height:30PX;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;" name="searchIssue" id="searchIssue" placeholder="Goods Issue Ref Num">
                       <div class="services">
										    		<div class="items">
										     			<ul class="matchedStringUl searchIssuePack" style="width: 89% !important; padding: 0px !important; display: none;"></ul>
										   			</div>
												</div>
                       </div>
                       
                       
                       
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Package Line/Area</label>
                            <input type="text"  id="packagelinearea" class="form-control" value="${packages.packageLine}">
                       </div>
                       </div>
                         <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Storage Level</label>
                            <select id="storageLevel" class="form-control">
                          
                       	<option value="1" ${packages.storageLevel == "1" ? 'selected' : ''} >1</option>
                        <option value="2" ${packages.storageLevel == "2" ? 'selected' : ''} >2</option>
                            
                            
                            </select>
                       </div>
                       </div>
                       
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Verified By</label>
                            <input type="text" id="verifiedby"  class="form-control" value="${packages.verifiedBy}">
                       </div>
                       </div>
                       
                       
                       
                       </div>
                       <input type="hidden" id="packageRef" value="${packages.packagingRefId}"/>
                       <input type="hidden" id="editPackageList" value='${packagesLists}'/>
                       
                       <div class="row" style="margin-right: 0px;margin-left: 0px;margin-bottom: 20px;">
									
									 <c:if test="${not empty previousStates}"> 
									   <div class="col-lg-12" style="min-height: 38px;/* width: 104%; */background-color: lightgray;padding:5px;" >
									       
      									<%-- <c:forEach var="previousWorkFlowList" items="${previousStates}">
      									  
      									<div class="col-lg-3" style="padding-right: 0px;padding-left: 0px;width: 150px;display:inline-block;margin-top: 12px;">
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="/OmniRetailer/images/workflow_arrow.png">${previousWorkFlowList }
      									
      										</span>
      									     </div>
                                 	  </c:forEach> --%>
                                 	  
                                 	    <c:forEach var="previousWorkFlowList" items="${previousStates}">
                                     	<c:choose>
                                     	   <c:when test="${not empty nextWorkFlowStates}">
                                     	      <div class="col-lg-3" style="padding-right: 0px;padding-left: 0px;width: 150px;display:inline-block;margin-top: 12px;">
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="/OmniRetailer/images/workflow_arrow.png">${previousWorkFlowList }
      									
      										</span>
      									     </div>
                                     	   </c:when>
                                     	   <c:otherwise>
                                     	      <div class="col-lg-3" style="padding-right: 0px;padding-left: 0px;width: 150px;display:inline-block;margin-top: 12px;margin-bottom: 12px;">
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="/OmniRetailer/images/workflow_arrow.png">${previousWorkFlowList }
      									
      										</span>
      									     </div>
                                     	   </c:otherwise>
                                     	</c:choose>
      									  
                                 	  </c:forEach>
      									
      									     
      									<div class="col-lg-4 " style="margin-bottom: 5px;margin-right: 5px;float: right;padding-right: 0px;padding-left: 0px;width: 150px;display:inline-block;/* margin-top: 4px; */">
                                                 <!-- <label>Action Required</label>
										        <select class="form-control">
										            <option>Submitted</option>
										        </select>  -->
												<c:choose>
													<c:when test="${not empty nextWorkFlowStates}">
														<label style="font-family: Calibri;"><spring:message
																code="actionrecquired.label" /></label>
														<c:forEach var="previousWorkFlowList"
															items="${previousStates}">
															<c:set var="action" value="${previousWorkFlowList}" />
															
														</c:forEach>
														<c:set var="Submitted" value="Submitted" />
														<c:choose>
																<c:when test="${action eq Submitted}">
																	<input type="hidden" id="isUpdateQty" value="true"/>
																</c:when>
																<c:otherwise>
																	<input type="hidden" id="isUpdateQty" value="false"/>
																</c:otherwise>
															</c:choose>
														
														<input type="hidden" id="workFlow" value="${action }"/>
														
														<!--  <select class="form-control" name="shipped_from" id="statusissue"> -->
														<select class="form-control" name="status"
															id="status">
															<option value="${action }">Action Required</option>
															<c:forEach var="activity" items="${nextWorkFlowStates}">
																<option value="${activity}">${activity}</option>
															</c:forEach>

														</select>
													</c:when>

													<c:otherwise>
														<c:forEach var="previousWorkFlowList"
															items="${previousStates}">
															<c:set var="action" value="${previousWorkFlowList}" />
														</c:forEach>
														<input type="hidden" class="form-control"
															name="status" value="${action }" id="status">
													</c:otherwise>
												</c:choose>
											</div>
      									
									   </div>
									
									 </c:if>
									
									
								</div>
                       
                       <div class="row">
                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                       <div class="col-lg-9">
              	<input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl packaging" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	   </div>
                       
                        <div class="col-lg-2">
                         <div class="col-lg-6">
             <a onclick="deleteSelected();" class="button" style="margin-top:0px;margin-bottom:0px;padding: 2px 5px 26px 4px;margin-left: -30%;">Delete</a>
                       </div>
                        <div class="col-lg-6">
             <a onclick="clearAll();" class="button" style="margin-top:0px;margin-bottom:0px;padding: 2px 5px 26px 4px;margin-left: -15%;">Clear All</a>
                       </div>
                       
                       
                       </div>
                       
                       
                       </div>
                       
                
                	       <div style="overflow: auto;">         
                          <table id="packagingList"   class="table table-bordered table-striped" style="table-layout: fixed;">
                              <thead style="background-color: #3c8dbc; color:#ffffff">
                               <tr>
                             	<th  class="sticky-col first-col" style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	<th class="sticky-col second-col" style="background-color: #a1dbf1 !important;"><div ><spring:message code="sl.no.label" /></div></th>
                             	<th class="sticky-col third-col" style="background-color: #a1dbf1 !important;"><spring:message code="sku.id.label" /></th>
                             	<th  class="sticky-col fourth-col" style="background-color: #a1dbf1 !important;width:200px !important"><spring:message code="sku.description.label" /></th>
                             	<th>Batch ID</th>
                             	<th>UPC/EAN</th>
                             	 <th>BOM Qty</th>
                             	<th>Inward Qty</th>
                             	<th>Proc Qty</th> 
                             	<th><spring:message code="noof.packs.label" /></th>
                             	<th ><spring:message code="saleprice.label" /></th>
                             	<th ><spring:message code="costprice.label" /></th>
                             	<th ><spring:message code="sale.value" /></th>
                               <th ><spring:message code="cost.value.label" /></th>
                                 <th style="width:70px"><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:set var = "parent" scope = "session" value = "1"/>
                           <c:forEach var="SKUidsList" items="${SKUids}" varStatus="theCount">
                          <c:set var = "single" scope = "session" value = "0"/>
                              <c:forEach var="packagesDetails" items="${packagesList}" varStatus="totalPackages" >
                            <c:if test="${SKUidsList == packagesDetails.childSkuId}">
                            <c:set var = "single" scope = "session" value = "${single+1}"/>
                             <c:if test="${single == 1}">
                             <input type="hidden" id="ParentID${theCount.count}" value="${packagesDetails.parentSkuId }">
                         	<input type="hidden" id="ParentDescription${theCount.count}" value="${packagesDetails.parentSkuIdDescription }">
                             
                         	 <tr class="dynamicdiv" id="dynamicdiv${theCount.count}">
                         	    <td  class="sticky-col first-col"  style="background-color: #f9f9f9; !important;" ><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${theCount.count}" /></td>
                         	    <td class="sticky-col second-col slnos" style="background-color: #f9f9f9; !important;" id="itemno${theCount.count}">${theCount.count}</td>
                         	 	<td class="sticky-col third-col" style="background-color: #f9f9f9; !important;" id="skuID${theCount.count}">${packagesDetails.childSkuId}</td>
                             	<td class="sticky-col fourth-col" style="background-color: #f9f9f9; !important;" id="Desc${theCount.count}">${packagesDetails.childSkuIdDescription }</td>
                             	<td id="batchID${theCount.count}" contenteditable="true">${packagesDetails.ean }</td>
                         	 	<td id="EAN${theCount.count}" contenteditable="true">${packagesDetails.batchId }</td>
                             	 <td id="availQty${theCount.count}">${packagesDetails.childSkuAvailableQty }</td>
                             	<td id="inwardQty${theCount.count}"></td>
                             	<td id="procQty${theCount.count}"  contenteditable="true" class="Pack${theCount.count}" onBlur="">${packagesDetails.procQty }</td> 
                             	<input type="hidden"  id="noofpacksold${theCount.count}" value="${packagesDetails.noOfPacks }"/>
                             	<td id="noofpacks${theCount.count}" onBlur="changePack(this);setData()"  contenteditable="true" class="Pack${theCount.count}">${packagesDetails.noOfPacks }</td>
								<td id="salePrice${theCount.count}">${packagesDetails.salePrice }</td>
                                <td id="costPrice${theCount.count}">${packagesDetails.costPrice }</td>
                                <td id="saleValue${theCount.count}">${packagesDetails.saleValue }</td>
                                <td id="costValue${theCount.count}">${packagesDetails.costValue }</td>
                             <td>
                                  
                                     <a  class="clickable" data-toggle="collapse" id="row${totalPackages.count}" data-target=".row${totalPackages.count}"> <span style="font-size: 17px" onclick="expandPackage(${totalPackages.count})" id="categoryExpand${totalPackages.count}"><i class="fa fa1 fa-sort-desc"></i></span></a>
                                   
                                 </td>
                               
 								</tr>
                             </c:if>
                             
                             </c:if>
                             
                             </c:forEach>
                             
                              <tr  class="collapse rowone${parent}" id="packagingList${parent}1">
                              <th  style="padding:3px;"></th>
                               <th  style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></th>
                             	<th   style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="sku.id.label" /></div></th>
                             	<th  style="width:200px !important;padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="sku.description.label" /></div></th>
                             	<th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">UOM</div></th>
                             	<th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">Size/Weight</div></th>
                             	 <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">Cost Price</div></th>
                             	<th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">MRP</div></th>
                             	<th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">Avail Qty</div></th> 
                             	
                                 
                             </tr>
                             <input type="hidden" id="packagesList${theCount.count}" value="${packagesList}">
                             <c:forEach var="packData" items="${packagesList}" varStatus="totalpackData" >
        				  <c:if test="${SKUidsList == packData.childSkuId}">
        				   <tr  class="collapse rowone${parent} Sku${parent}" id="packagingdetails${parent}" class="packagingdetails">
        				 <td></td>
                           <td>${totalpackData.count}</td>
                            <td>${packData.parentSkuId }<input type="hidden" id="packagesListSkuId${theCount.count}${totalpackData.count}" value="${packData.parentSkuId}"></td>
                             <td>${packData.parentSkuIdDescription }</td>
                              <td>${packData.uom}</td>
                               <td></td>
                                <td>${packData.costPrice }</td>
                                 <td>${packData.salePrice }</td>
                                  <td>${packData.avlQty }<input type="hidden" id="packagesListavlQty${theCount.count}${totalpackData.count}" value="${packData.avlQty}">
                                  <input type="hidden" id="packagesListzeroflag${theCount.count}${totalpackData.count}" value="${packData.iszeroBilling}">
                                  </td>
        				 
        				 </tr> 
        				 </c:if>
        				 </c:forEach>
                           <c:set var = "parent" scope = "session" value = "${parent+1}"/>
                             </c:forEach>
                     
        				    
                             
                         </tbody>
                     </table></div>
                       
                       
                
                
            <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div>
                    
                    
                   <div class="row" style="text-align: left;margin-top: 20px;">
                    <div class="col-lg-6">
							<input type="button" id="edit"  class="btn bg-olive btn-inline submit" onclick="createPackageAndProcessing('update');" style="margin-left:3%;width: 16%;" value="Submit" />
							 <c:if test="${packages.status == 'draft' || packages.status == 'updraft'}">
							<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:3%;width: 16%;" onclick="createPackageAndProcessing('updraft');" value="<spring:message code="save.label" />" />
 							</c:if>
 							<input type="button" class="btn bg-olive btn-inline" style="margin-left:3%;margin-right: 1%;width: 16%;" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');" value="<spring:message code="cancel.label" />" />
						</div>
						<div class="col-lg-6">
						 <div class="col-lg1-3 col-lg-3" style="margin-top: -14px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="white-space: nowrap;">Total Items</label>
                            <input type="text" id="totalitems" disabled="disabled" class="form-control">
                       </div>
                       </div>
                        <div class="col-lg1-3 col-lg-3" style="margin-top: -14px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="white-space: nowrap;">Packed Stock</label>
                            <input type="text" id="packedstock" disabled="disabled" class="form-control">
                       </div>
                       </div>
                        <div class="col-lg1-3 col-lg-3" style="margin-top: -14px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="white-space: nowrap;">Cost Value</label>
                            <input type="text" id="costvaluetotal" disabled="disabled" class="form-control">
                       </div>
                       </div>
                        <div class="col-lg1-3 col-lg-3" style="margin-top: -14px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="white-space: nowrap;">Sale Value</label>
                            <input type="text" id="salevaluetotal" disabled="disabled" class="form-control">
                       </div>
                       </div>
                       
						
						
						</div>
						</div>
						
                       
                       
                       </div>
                       
                       
                     </div>  
              
              </div>    
              </div>

</section>
 



</body>
</html>