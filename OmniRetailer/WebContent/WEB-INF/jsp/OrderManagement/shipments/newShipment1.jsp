<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : inventorymanager/retailoutlets/procurement/viewWarehouseShipment.jsp
 * file type		        : JSP
 * description				: The viewRequestForQuotation form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/shipment.js"></script> 
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	<style type="text/css">
  .odd{display:none!important;}
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
                                <h3><spring:message code="shipment.new.receipt.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
                                     <input type="hidden" id="outletLocation" name="outletLocation" value= "">
                                     <input type="hidden" id="status" name="status" value= "">
                                     <input type="hidden" id="type" value="${type}">
                 <div class="row">
                 <div class="form-group col-lg-5" style="margin-bottom:6px;">
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="shipment.from.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
                    <select class="form-control" name="shipmentFrom"  id="shipmentFrom" onchange="">
                    	<c:forEach var="location" items="${locationsList}">
							<option value="${location.businessActivity}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
						</c:forEach>
					</select>
				</div>        
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="shipped.By.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="shippedBy" id="shippedBy" value="" placeholder=""/>
					<span id="shippedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="carrier.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
                  <select class="form-control" name="carrier"  id="carrier" onchange="">
                   <%-- <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == shipmentBean.warehouse_location ? 'selected' : ''}>${location}</option>
					</c:forEach> --%>
				</select>
				</div> 
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="inspectedBy.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="inspectedBy" id="inspectedBy" value="" placeholder=""/>
					<span id="inspectedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="rfidTagNo.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="rfidTagNo" id="rfidTagNo" value="" placeholder=""/>
					<span id="rfidTagNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				     <div class="form-group col-lg-5 col-xs-5 col-sm-5" style="text-align:right;margin-left: -8.5%;">                   
					<label><spring:message code="shipment.note.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="shipmentNote" id="shipmentNote" value="" placeholder=""/>
					<span id="shipmentNoteError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				<div class="form-group col-lg-5 col-xs-5 col-sm-5" style="text-align:right;margin-left: -8.5%;">                   
					<label><spring:message code="gatePassRef.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="gatePassRef" id="gatePassRef" value="" placeholder=""/>
					<span id="gatePassRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                  
                </div>     
                <div class="form-group col-lg-1"></div> 
                <div class="form-group col-lg-5">
                <div class="form-group col-lg-4 col-xs-4 col-sm-4"  style="text-align:right;">
                                   <label><spring:message code="date.label" /> </label>
                                   </div>
                                        <div class="form-group col-lg-7">
                                            <input type="text" class="form-control"  value="${quoteObj.createdDateStr}"/>
                                        </div>
                 <div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="transport.mode.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
                 <select class="form-control" name="transportMode"  id="transportMode" onchange="">
					 <option value="Rail">Rail</option>
                     <option value="Flight">Flight</option>
                     <option value="Express">Express</option>
                     <option value="Ordinary">Ordinary</option>
				</select>
				</div>         
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="vehicle.number.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="vehicleNumber" id="vehicleNumber" value="" placeholder=""/>
					<span id="vehicleNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="driver.name.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="driverName" id="driverName" value="" placeholder=""/>
					<span id="driverNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>   
				<div class="form-group col-lg-4 col-xs-4 col-sm-4" style="text-align:right;">                   
					<label><spring:message code="contact.number.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="contactNumber" id="contactNumber" value="" placeholder=""/>
					<span id="contactNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				<div class="form-group col-lg-5 col-xs-5 col-sm-5" style="text-align:right;margin-left: -8.5%;">                   
					<label><spring:message code="shipmentAgency.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="shipmentAgency" id="shipmentAgency" value="" placeholder=""/>
					<span id="shipmentAgencyError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				<div class="form-group col-lg-5 col-xs-5 col-sm-5" style="text-align:right;margin-left: -8.5%;">                   
					<label><spring:message code="shipment.status.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-7 col-sm-7">
					<input type="text" class="form-control" name="shipmentStatus" id="shipmentStatus" value="" placeholder=""/>
					<span id="shipmentStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                            
                </div>                     
                </div>   
                <div class="row"> 
                <div class="form-group col-lg-2" style="text-align:right;    margin-left: -1.5%;margin-top: 3%;">                   
					<label><spring:message code="routing.instructions.label" /> <span style="color:red; font-size:2"></span></label>
					</div> 
 		 <div class="col-lg-10" style="    width: 73.8%;margin-left: -2%;    margin-top: 1%;">
            <textarea class="form-control" style="resize:none;" rows="3" id="description2" placeholder="<spring:message code="enter.description2" />"></textarea>
		</div>
		</div>
		<div class="row">
		<div class="form-group col-lg-2" style="text-align:right;    margin-left: -1.5%;margin-top: 3%;">                   
					<label><spring:message code="packagesDescription.label" /> <span style="color:red; font-size:2"></span></label>
					</div> 
 		 <div class="col-lg-10" style="    width: 73.8%;margin-left: -2%;    margin-top: 1%;">
            <textarea class="form-control" style="resize:none;" rows="3" id="description2" placeholder="<spring:message code="enter.description2" />"></textarea>
		</div>
		</div>
		<div class="row">
		<div class="form-group col-lg-2" style="text-align:right;    margin-left: -1.5%;margin-top: 3%;">                   
					<label><spring:message code="remarks.label" /> <span style="color:red; font-size:2"></span></label>
					</div> 
 		 <div class="col-lg-10" style="    width: 73.8%;margin-left: -2%;    margin-top: 1%;">
            <textarea class="form-control" style="resize:none;" rows="3" id="description2" placeholder="<spring:message code="enter.description2" />"></textarea>
		</div>
	</div>
              <br>                    
          <div class="row">
          <div class="form-group col-lg-6">
      <!--  <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2"></span></label>-->
      <input type="hidden" id="desc"/>
     <%--  <label><spring:message code="search.items.here.label" /><span style="color:red; font-size:2">*</span></label> --%>
      <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
		<div class="services">
 			<div class="items">
  				<ul class="matchedStringUl " style=""></ul>
			</div>
		</div>
          <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
   </div>
          <div class="form-group col-lg-3" style="    width: 26%;">
					<input type="text" class="form-control" name="contactNumber" id="contactNumber" value="" placeholder=""/>
					<span id="contactNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>
				<div class="form-group col-lg-2">
				<div class="buttons" style="    margin-left: -14%;">
					<a onclick="appendLocationsDiv()" class="button"><font size="2px"><spring:message code="sales.orders.label" /> +</font></a>
				</div>
             </div>
             </div>
             <div class="row">
                                     <div class="form-group col-lg-10" style="margin-top: -0.2%;">
                                      <div class="table-responsive" style="width:104.5%">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.code.label"/></th>
                                                <th><spring:message code="description1.label"/></th>
                                                <th><spring:message code="qty.label"/></th>
                                                <th><spring:message code="packs.label"/></th>
                                                <th><spring:message code="order_id.label"/></th>
                                                <th><spring:message code="shipment.order.label"/></th>
                                                <th><spring:message code="comments.label"/></th>
                                           </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                              <tbody style="text-align: center;">
                       <c:forEach var="itemList" items="${quoteObj.itemsList}" varStatus="theCount">
             		   <tr>
             		   	<td>${theCount.count}</td>
              			<td>${itemList.itemId}</td>
                  		<td>${itemList.itemDescription}</td>
                  		<td>${itemList.unitOfMeasurement}</td>
                  		<td>${itemList.priceStr}</td>
                  		<td>${itemList.quantityStr}</td>
                  		<td></td>
                  		<td></td>
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                                          </tbody>
                                       </table>
                                    </div>
                                    </div>
                                    </div>
             <br>
             <div class="row">
             <div class="form-group col-lg-5"></div>
             	<div class="form-group col-lg-6">
                 <div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="sub.total.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6">
					<input type="text" class="form-control" name="subTotal" id="subTotal" value="" placeholder=""/>
					<span id="subTotalError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="total.tax.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6">
					<input type="text" class="form-control" name="totalTax" id="totalTax" value="" placeholder=""/>
					<span id="totalTaxError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="shipment_charges.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6">
					<input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" value="" placeholder=""/>
					<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>
           </div>                          
				<div class="row">
	    	      		<div class="row" style="    width: 87%; margin-left: 0%;">
	                    <div class="form-group col-lg-12" style="height:15px;    margin-top: -4.5%;" >
	                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
	                    	<img style="float: right;cursor: pointer;margin-right:-16px; margin-top:0px;margin-bottom:-26px;" onclick="" id="priceListImg" alt="" />
	                     </div> 
	                    <hr style="margin-top: 33px;width: 100%;border-top: 1px solid rgb(192,192,192);" />
	                    <!-- <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" /> -->
	                    </div>
	                     
             </div>
             <div class="form-group col-lg-6"></div>
	                    <div class="form-group col-lg-6" style="    margin-left: -4.2%;">
	                    <label><spring:message code="total.order.value.label" /> <span style="color:red; text-align:right;font-size:2"></span></label>
	                </div>
	                <div class="row" style="    width: 87%; margin-left: 0%;">
	                    <div class="form-group col-lg-12" style="height:15px;    margin-top: -4.2%;" >
	                    <%-- <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="shipment.details.label" /></span></div> --%>
	                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
	                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="" id="priceListImg" alt="" <%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
	                     </div> 
	                    <hr style="margin-top: 40px;width: 100%;border-top: 1px solid rgb(192,192,192);" />
	                    <!-- <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" /> -->
	                    </div>
	                     
             </div>
	                </div>	<br>				                                    

						</div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
							<c:if test="${sessionScope.role == 'super admin'}">
								  	<input type="button" class="btn bg-olive btn-inline" onclick="viewOutletShipments('','','0');" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" />
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
							           <c:forEach var="accessControl" items="${sessionScope.outletShipment}">
							                <c:if test="${accessControl.appDocument == 'outletShipment' && accessControl.write == true && accessControl.read == true}">
							                	<input type="button" class="btn bg-olive btn-inline" onclick="viewOutletShipments('','','0');" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" /> 
							                </c:if>
							           </c:forEach>
							        </c:if>
						           <c:if test="${flowUnder == 'warehouse'}">
						           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
			                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
			                					<input type="button" class="btn bg-olive btn-inline" onclick="viewOutletShipments('','','0');" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" />
			                				</c:if>
			                			</c:forEach>
						           </c:if>
						           <c:if test="${flowUnder == 'management'}">
						           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}">
			                				<c:if test="${accessControl.appDocument == 'OrderManagementFulFillment' && accessControl.write == true && accessControl.read == true}">
			                					<input type="button" class="btn bg-olive btn-inline" onclick="viewOutletShipments('','','0');" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" />
			                				</c:if>
			                			</c:forEach>
						           </c:if>
							      </c:if>
						</div>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                                </form>
                            </div>

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
		    		 