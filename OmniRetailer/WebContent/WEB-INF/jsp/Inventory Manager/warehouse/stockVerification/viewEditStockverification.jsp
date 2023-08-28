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
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockVerification.js"></script>
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
.col-lg1-6{
    margin-top: 20px !important;
}
.ml-1 {
  margin-left: ($spacer-x * .25) !important;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	
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
 <spring:message code="viewstockverification.label" />- ${verificationcode}
		</h3>
		</div><!-- /.box-header -->
		<br>
		<br>
		
             <div class="box-body table-responsive">
             <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
             <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                  <input type="hidden" id="flowUnder" value="${flowUnder}">
                    <input type="hidden" id="verification_code" value="${verificationcode}">
                     <input type="hidden" id="master_verification_code" value="${masterverificationCode}">
                 <%--  <div class="row">
                      <div class="col-lg1-3 col-lg-3">
                    
                    
                     <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/><span class="requiredField">*</span></label>
                           <select class="form-control" id="outletLocation" onchange="return changeInfoBasedOnLocation(this.options[this.selectedIndex].value);">
                           		
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == productStockVerificationItemDetailsList.location  ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                    
                    
                    
                    
                    
                    
                      </div>
                      
                      
                      
                      <div class="col-lg1-3 col-lg-3">
                    
                      
                    
                       <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="storage.unit.label"/><span class="requiredField">*</span></label>
                           <select class="form-control" id="storageunit" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${storageList}">
									<option value="${location}" ${location == location? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      
                      </div>
                      
                      
                      </div>
                      
                       --%>
                      
                      
                      
                      
                      
                      
                      
                      
                      
                       <div class="row">
                     <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                  <div class="col-lg-2"></div>
                       
                       
                         <div class=" col-lg-3">
                         
             			 <div class="form-group col-lg-10" style="padding-left:0px;padding-right: 0px;">
                                            <label><spring:message code="date.label" /></label>
	                                        <input class="form-control calendar_icon" readonly="readonly" name="createdDate" id="createdDate" size="20" type="text" value="${ productStockVerificationItemDetailsList.verifiedOnStr}" />
                                        </div>
                     </div>
                      
                      
                      
                      
                      
	             <div class="col-lg1-3 col-lg-3">
                           <div class="col-lg-2"></div>
             			 <div class="col-lg-7" style="padding-left:0px;padding-right: 0px;">
                 		<label>Approved By<span class="requiredField">*</span></label>
                	 	<input class="form-control" name="approved_by" id="approvedBy" placeholder="Enter Name" type="text" value="${ productStockVerificationItemDetailsList.verified_by}" >
	              </div>
	            </div>
	           
	           
                      
               
                    
                       </div>
                      
                      
                        <div class="row">
                        
                        
                       
                        
                                
	             <div class="col-lg1-3 col-lg-3">
                     <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" onchange="">
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       
                                         
	                <div class="col-lg-1"></div>
	            
	             <div class=" col-lg-4">
                                
                                
                                
                                <div class=" col-lg-4" style="padding-left: 0px;">
                                            <div class=" bootstrap-timepicker">
                                             <label><spring:message code="start.time.label"/></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="startTime" id="startTime" placeholder="<spring:message code="search.items.here.label" />"/>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                         </div>
                             
                                
                                <div class=" col-lg-4" style="padding-left: 0px;">
                                            <div class=" bootstrap-timepicker">
                                           <label><spring:message code="end.time.label"/></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="endTime" id="endTime"/>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                      
                                         </div>
                              
                                </div></div>
	            
                      
                      
                      
                      
                      
                      
                      
                       <div class="row">
                                         <div class="form-group col-lg-12" style="text-align:center;margin-bottom: -1.5%;margin-top: 2%;">
                                         <input type="hidden" id="desc"/>
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                           <%--  <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" placeholder="<spring:message code="good.label"/>" />
 												<datalist id="skuList">
												
												</datalist> --%>
  										 </div>
                                         
                                        </div>
                                        <br>
                                      <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="skuid.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                 <th><spring:message code="openstock.label"/></th>
                                                <th><spring:message code="bookstock.label"/></th>
                                                 <th><spring:message code="actualstock.label"/></th>
                                                  <th><spring:message code="dump.label"/></th>
                                                     <th><spring:message code="diff.label"/></th>
                                                <th><spring:message code="book.qty.label"/></th>
                                                <th><spring:message code="pre.verified.qty"/></th>
                                                <th><spring:message code="physical.qty.label"/></th>
                                                <th><spring:message code="stock.loss.label"/></th>
                                                <th><spring:message code="loss.type"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                           <tbody style="text-align: center;">
                                     <c:forEach var="productStockVerificationItemDetails" items="${productStockVerificationItemDetailsList.itemsList}" varStatus="theCount">
                                      <tr id="dynamicdiv${theCount.count}">
                                         <td class="slno${theCount.count}">${theCount.count+index-1}</td>
                                    <td id="Name${theCount.count}" >${productStockVerificationItemDetails.sku_id}</td>
                                    <input type="hidden" id="skuId${theCount.count}" value="${productStockVerificationItemDetails.sku_id}" />
                                      	<td style="white-space:nowrap" id="Desc${theCount.count}">${productStockVerificationItemDetails.skuDescription}</td>
                                      	<td id="Price${theCount.count}">${productStockVerificationItemDetails.skuCostPrice}</td>
                                      
                                      	<td id="OpenStock${theCount.count}">${productStockVerificationItemDetails.openStock}</td>
                                      		<td id="Supplied${theCount.count}">${productStockVerificationItemDetails.skuCostPrice}</td>
                                      			<td id="ActualQty${theCount.count}">${productStockVerificationItemDetails.skuCostPrice}</td>
                                      				<td id="Dump${theCount.count}">${productStockVerificationItemDetails.dumpQty}</td>
                                      		<td id="Diff${theCount.count}">${productStockVerificationItemDetails.skuCostPrice}</td>
                                      	
                                      	
                                      	<td id="Supplied${theCount.count}">${productStockVerificationItemDetails.sku_book_stock}</td>
                                      	<td id="Received${theCount.count}">0</td>
                                      	<td id="Pack${theCount.count}">${productStockVerificationItemDetails.sku_physical_stock}</td>
                                      	<td id="Cost${theCount.count}">${productStockVerificationItemDetails.stock_loss}</td>
                                      	<td>
                                      	<select  style='width:100px;height:25px;text-align:center' id="lossType${theCount.count}"><option value="Damaged" ${productStockVerificationItemDetails.loss_type == 'Damaged' ? 'selected' : ''}>Damaged</option>
			                  		<option value="Expired" ${productStockVerificationItemDetails.loss_type  == 'Expired' ? 'selected' : ''}>Expired</option>
			                  		<option value="Manufacturing Defect" ${productStockVerificationItemDetails.loss_type  == 'Manufacturing Defect' ? 'selected' : ''}>Manufacturing Defect</option>
			                  		<option value="Other" ${productStockVerificationItemDetails.loss_type  == 'Other' ? 'selected' : ''}>Other</option>
			                  		</select> 
                                      	</td>
                                      	<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
                                      
                                      </tr>
                                    </c:forEach>
                                  </tbody>
                                       </table>
                                    </div>
                 
                     
                       <div class="row" style=" text-align:center">
                 
                    <div class="col-lg-10" style=" padding-right: 0px;text-align:center">
                    
                      <input type="button" class="btnCls "  onclick="viewWarehouseStockVerification('outletStockVerification','0','${flowUnder}','menu','${productStockVerificationItemDetailsList.masterVerificationCode}','');" class="run"value="<spring:message code="cancel.label" />" >
                 
                  
                    </div>
                  
                  
                  
                      </div>
                      
                      
                     
           </div><!-- box primary -->
           </div><!-- col-lg-12 -->   
           </div>
           </section>  
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
           
           
                <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true, 
      
   });      