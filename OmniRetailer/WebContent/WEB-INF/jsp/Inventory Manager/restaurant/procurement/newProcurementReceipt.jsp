<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/newProcurementReceipt.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
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
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>

 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/FBprocurement.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript">

$(document).ready(function(){
		callCalender("date");
});
</script>

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
</style>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
		<h1><spring:message code="inventory.management.label" />
		<small><spring:message code="procurement.receipts.label" /></small>
	</h1>
    <ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
		<li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="restaurant_management.label" /></a></li>
		<li class="active"><a style="cursor: pointer;" onclick="showInventoryManagementFlows();"><spring:message code="inventory.management.label"/></a></li>
    </ol>
   </section> --%>
<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="procurement.new.receipt.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newProcurementReceipt" method="post" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   		<label><spring:message code="supplier.name.label" /></label>
                                           <!--  <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" required /> -->
                                        	<input type="text" class="form-control searchItems" name="supplier_name" id="searchSupplier" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                     	<div class="form-group col-lg-4">
                                            <label><spring:message code="supplier.code.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="supplier_id" id="supplier_Id" value=""  />
                                           <%--   <select class="form-control" name="supplier_id" id="supplier_id">
                                              <c:forEach var="supplier" items="${supplierList}">
												<option value="${supplier.firmName}">${supplier.supplierCode}</option>
											</c:forEach>
                                            </select> --%>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="procurement.location.label" /></label>
                                             <select class="form-control" name="location" id="warehouse_location">
                                               <c:forEach var="location" items="${workLocationsList}">
												<option value="${location}">${location}</option>
											</c:forEach>
                                            </select>
                                        </div>
									  </div>
                                      <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="delivered.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered_by" required  placeholder="<spring:message code="enter.delivered.by.label" />" />
                                            <span id="deliveredByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="inspected.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="inspected_by" id="inspected_by" required  placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment.note.label" /></label>
                                            <select class="form-control" name="shipment_note" id="shipment_note">
                                            <option value="SD123">SD123</option>
                                            <option value="SD345">SD345</option>
                                            <option value="SD678">SD678</option>
                                            </select>
                                         </div>
                                         
                                        </div>
                                         <div class="row">
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="po.reference.label" /></label>
                                            <select class="form-control" name="po_reference" id="po_reference">
                                            <option value="PO123">PO123</option>
                                            <option value="PO345">PO345</option>
                                            <option value="PO678">PO678</option> 
                                            </select>
                                      	</div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="procurement.status.label" /></label>
                                             <select class="form-control" name="status" id="status">
                                            <option value="Received">Received</option>
                                            <option value="Rejected">Rejected</option>
                                            <option value="Partially Rejected">Partially Rejected</option>
                                            <option value="Inspected">Inspected</option>
                                            <option value="Stored">Stored</option>
                                            </select>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="date.label" /></label>
                                            <!--  <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="date" id="date" required value="" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                            <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                       <!--  </div>  -->
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            
                                            <!-- <input type="text" readonly="readonly" class="form-control" name="date" id="date" /> -->
                                        </div>
                                         </div>
                                        
                                        <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
											<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                            <!-- <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" />
 												<datalist id="skuList"></datalist> -->
  										 </div>
                                         <div class="col-lg-3"></div>
                                        </div>
                                        
                                         <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="item.name.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="pack.label"/></th>
                                                <th><spring:message code="cost"/></th>
                                                <th><spring:message code="make.label"/></th>
                                                <th><spring:message code="supplied.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="rejected.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                           
                						 </tbody>
                                       </table>
                                    </div>
                                     <div class="row">
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" style="resize: none;" rows="2" placeholder="<spring:message code="enter.remarks.label" />" ></textarea>
 										 </div>
                                        </div>
                                        <div class="row">
                                         <div class="col-lg-4"></div>
                                          <div class="col-lg-4">
                                          <div class="form-group col-lg-6" >
                                             <label><spring:message code="totalquantity.label"/>: </label>
                                             <label id="totalQty"></label>
                                          </div>
                                           <div class="form-group col-lg-6">
                                               <label><spring:message code="cost.label"/>: </label>
                                               <label id="totalCost"></label>
                                           </div>
                                           </div>
                                           <div class="col-lg-4"></div>
                                       </div>
                                      
                                    </div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
						 	<input type="button" class="btn bg-olive btn-inline" onclick="validateProcurementReceipt('submit')" value="<spring:message code="submit.label" />" />
							<input type="button" class="btn bg-olive btn-inline" onclick="validateProcurementReceipt('save')" style="margin-left:5%;" value="<spring:message code="save.label" />" />
							<input type="button" class="btn bg-olive btn-inline" onclick="return viewProcurement('all','procurementReceipts');" style="margin-left:5%;" value="<spring:message code="cancel.label" />" />
						</div> 
				<br/>
                <div class="box-footer">
                                     
                </div>
               </form>
             </div>
           <%--   <input type="hidden" id="subCategories" value='${subCategories}'> --%> 
</div>
</div>
</section><!-- /.content -->
<script type="text/javascript">
		/* $(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		}); */
 </script>
</body>
</html>