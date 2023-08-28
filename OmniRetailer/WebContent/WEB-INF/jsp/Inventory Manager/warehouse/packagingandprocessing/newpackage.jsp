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
        </style>
        
        
 <script type="text/javascript">
 $(document).ready(function(){
	    // Define regular expression
	  
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
			New-Package
		</h3>
		</div>
             
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
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
	                         <select class="form-control" id="warehouseZone" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
	                        
	                        </c:otherwise>
                         </c:choose>
                         </div>
                       </div>
                       
                        <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.name.label" /></label>
                        <input type="text"  class="form-control searchItems" placeholder="Enter Supplier Name " name="supplier_name" id="searchSupplier" style="height:30PX;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;" />
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
                            <input type="text" id="packedBy" class="form-control">
                       </div>
                       </div>
                         <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Storage Area</label>
                            <select id="storageArea" class="form-control">
                            <option value="Shelf" >Shelf</option>
									<option value="Racks" >Racks</option>
									<option value="Bins" >Bins</option>
									<option value="Fridge" >Fridge</option>
									<option value="Empty area" >Empty area</option>
									<option value="Bin Array" >Bin Array</option>
                            
                            </select>
                       </div>
                       </div>
                       
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Packed By</label>
                            <input type="text" id="packedbyadd"  class="form-control">
                       </div>
                       </div>
                       
                       
                       
                       </div>
                         <div class="row" style="margin-left: 0px;
    margin-bottom: 35px;">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="warehouseLocation" >
                           		
	                            <c:forEach var="location" items="${locationsList}">
	                          <%--   <c:choose>
								 <c:when test="${flowUnder == 'outlet'}"> --%>
								 <c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
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
                            <input type="text"  id="packagelinearea" class="form-control">
                       </div>
                       </div>
                         <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Storage Level</label>
                            
                             <select id="storageLevel" class="form-control">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            
                            </select>
                       </div>
                       </div>
                       
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Verified By</label>
                            <input type="text" id="verifiedby"  class="form-control">
                       </div>
                       </div>
                       
                       
                       
                       </div>
                       
                       <div class="row">
                       
                       
                       
                       <div class="col-lg-10" >
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
             <a  class="button" style="margin-top:0px;margin-bottom:0px;padding: 2px 5px 26px 4px;margin-left: -30%;" onclick="deleteSelected();">Delete</a>
                       </div>
                        <div class="col-lg-6">
             <a onclick="clearAll();" class="button" style="margin-top:0px;margin-bottom:0px;padding: 2px 5px 26px 4px;margin-left: -15%;">Clear All</a>
                       </div>
                       
                       
                       </div>
                       
                       
                       </div>
                       
                       
                       
                       <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;min-height: 325px;max-height:425px">
                   
                     <table id="packagingList" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="sku.id.label" /></th>
                             	<th><spring:message code="sku.description.label" /></th>
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
                         
                         
                         
                         </tbody>
                     </table>
                    </div>
                    
                    
                    <div class="row" style="text-align: left;margin-top: 20px;">
                    <div class="col-lg-6">
							<input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="createPackageAndProcessing('submit');" style="margin-left:3%;width: 16%;" value="<spring:message code="submit.label" />" />
							<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:3%;width: 16%;" onclick="createPackageAndProcessing('draft');" value="<spring:message code="save.label" />" />
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