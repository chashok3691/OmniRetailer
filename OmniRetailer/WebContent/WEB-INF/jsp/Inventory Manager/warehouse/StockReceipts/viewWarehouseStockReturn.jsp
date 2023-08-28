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
                                <h3><spring:message code="warehouse.stockreturn.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                 <div class="row">
                 <div class="form-group col-lg-5" style="margin-bottom:6px;">
                 <%-- <div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="product.secondary.supplier.label" /> <span style="color:red; font-size:2"></span></label>
					</div> --%>
                          <%-- <div class="form-group col-lg-8">
									<label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
									<input type="text" class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" placeholder="<spring:message code="enter.supplierName.label" />" />
									<div class=services>
								    		<div class="items">
								     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
								   			</div>
										</div>
									<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" name="supplier_Id" id="supplier_Id" value=""  />
								</div>    --%>       
                <!-- <div class="form-group col-lg-8">
					<input type="text" class="form-control" name="soldTo" id="soldTo" value="" placeholder=""/>
					<span id="soldToError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>   -->     
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="location.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-left: -5%;">
	                                            <select class="form-control" name="location"  id="location" onchange="">
	                                             <%-- <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == shipmentBean.warehouse_location ? 'selected' : ''}>${location}</option>
												 </c:forEach> --%>
												 </select>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="returned.by.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-left: -5%;">
					<input type="text" class="form-control" name="returnedBy" id="returnedBy" value="" placeholder=""/>
					<span id="returnedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="transport.mode.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-left: -5%;">
												 <input type="text" class="form-control" name="transportMode" id="transportMode" value="" placeholder=""/>
					<span id="transportModeError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                 <%-- <select class="form-control" name="transportMode"  id="transportMode" onchange="">
	                                             <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == shipmentBean.warehouse_location ? 'selected' : ''}>${location}</option>
												 </c:forEach>
												 </select> --%>
				</div>   
				
				
				    
                </div>     
                <div class="form-group col-lg-1"></div> 
                <div class="form-group col-lg-5">
                <div class="form-group col-lg-4"  style="text-align:right;">
                                   <label><spring:message code="supplier.id.label" /> </label>
                                   </div>
                                        <div class="form-group col-lg-7" style="margin-left: -5%;">
                                            <input type="text" class="form-control" name="supplierId" id="supplierId" value="" placeholder=""/>
					<span id="supplierIdError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                       
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="supplier.desc.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-8" style="margin-left: -5%;">
					<input type="text" class="form-control" name="supplierDesc" id="supplierDesc" value="" placeholder=""/>
					<span id="supplierDescError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="shipment.ref.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-left: -5%;">
					<input type="text" class="form-control" name="shipmentRef" id="shipmentRef" value="" placeholder=""/>
					<span id="shipmentRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>   
                </div>                     
                </div>   
              <br>                    
          <%-- <div class="row">
          <div class="form-group col-lg-10" style="width: 86.7%;">
      <!--  <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2"></span></label>-->
      <input type="hidden" id="desc"/>
      <label><spring:message code="search.items.here.label" /><span style="color:red; font-size:2">*</span></label>
      <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
		<div class="services">
 			<div class="items">
  				<ul class="matchedStringUl " style=""></ul>
			</div>
		</div>
          <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
   </div>
             </div> --%>
             <div class="row">
                                     <div class="form-group col-lg-10" style="margin-top: -0.2%;">
                                      <div class="table-responsive" style="width:104.5%">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="description1.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="qty.label"/></th>
                                                <th><spring:message code="item_cost.label"/></th>
                                                <th><spring:message code="reason.label"/></th>
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
                                    
                <div class="form-group col-lg-6" style="margin-left: -5%;">
					<input type="text" class="form-control" name="subTotal" id="subTotal" value="" placeholder=""/>
					<span id="subTotalError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="Tax.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6" style="margin-left: -5%;">
					<input type="text" class="form-control" name="totalTax" id="totalTax" value="" placeholder=""/>
					<span id="totalTaxError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="shipment_charges.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6" style="margin-left: -5%;">
					<input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" value="" placeholder=""/>
					<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>
           </div>                          
					<br>	<br><br>
					<div class="table-responsive" style="width:100%">
                                        <table id="productsList" class="table table-bordered" style="margin-top: -2.07%;border:1px solid #857979;">
                                        <thead style="background-color: #D3D3D3; color: #454242;">
                                        <tr>
                                        <th><spring:message code="Reason.For.Return"/></th>
                                        <th><spring:message code="Action.Requested"/></th>
                                        </tr>
                                        </thead>
                                        <tbody style="text-align: left;">
                  	   <tr>
                  	   <td style="height:100px;width: 50%;">
                  	   <div>
                  	   <input type="checkbox" id="overStock">&nbsp;&nbsp;&nbsp;<spring:message code="Over.Stock.label"/>
                  	   </div>
                  	   <div>
                  	   <input type="checkbox" id="overShipment">&nbsp;&nbsp;&nbsp;<spring:message code="Over.Shipment.on.po.label"/>
                  	   </div>
                  	   <div>
                  	   <input type="checkbox" id="substution">&nbsp;&nbsp;&nbsp;<spring:message code="Substitution.on.po.label"/>
                  	   </div>
                  	   <div>
                  	   <input type="checkbox" id="defective">&nbsp;&nbsp;&nbsp;<spring:message code="Defective.explain.label"/>
                  	   </div>
                  	   </td>
                  	   <td style="height:100px;border:1px solid #857979;">
                  	   <div>
                  	   <input type="checkbox" id="repairAndReturn">&nbsp;&nbsp;&nbsp;<spring:message code="Repair.and.Return.noCharge.label"/>
                  	   </div>
                  	   <div>
                  	   <input type="checkbox" id="repairAndBill">&nbsp;&nbsp;&nbsp;<spring:message code="Repair.and.Bill.label"/>
                  	   </div>
                  	   <div>
                  	   <input type="checkbox" id="replace">&nbsp;&nbsp;&nbsp;<spring:message code="Replace.no.Charge"/>
                  	   </div>
                  	   <div>
                  	   <input type="checkbox" id="fullCredit">&nbsp;&nbsp;&nbsp;<spring:message code="Issue.Full.Credit"/>
                  	   </div>
                  	    <div>
                  	   <input type="checkbox" id="other">&nbsp;&nbsp;&nbsp;<spring:message code="Other.label"/><br>
                  	   <spring:message code="line.label"/>
                  	   </div>
                  	   </td>
                  	   </tr>
                                        </tbody>
                                        </table>
                                        <div>
                  	 <u>  <spring:message code="Returning.company.Contact.label"/></u><spring:message code="line.label"/>
                  	   </div>
                                    </div>			                                    
<br>
						</div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
							<input type="button" class="btn bg-olive btn-inline"
								onclick="viewWarehouseStockReturn('wStockReturn','0')"
								value="<spring:message code="cancel.label" />" />
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
		    		 