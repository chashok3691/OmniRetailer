 <!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        : FinancialManagement/PurchasesAndPayments_1.jsp
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
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.js"></script>	
	<script src="${pageContext.request.contextPath}/js/d3.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/FinantialManagement/orginizationMaster.js"></script>
        
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
    
  }
  }
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

table.dataTable {
    clear: both;
    margin-top: 3px !important;
    margin-bottom: 6px !important;
    max-width: none !important;
}

.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
	width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 9px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	    width: 50%;
    float: right;
    margin-right: 5%;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}

</style>  
<script type="text/javascript">
 $(document).ready(function(){
	 callCalender('start_date');
	  callCalender('end_date');
	 
	  $("#searchSupplier").keydown(function(){
		   $("#SupplierError").html("");
		   $("#Error").html("");
	 });
	  $("#Invoice_ref").keydown(function(){
		   $("#inviocerefError").html("");
		   $("#Error").html("");
	 });
	 /*  $("#start_date").keydown(function(){
		   $("#startDateError").html("");
		   $("#Error").html("");
	 });
	  $("#end_date").keydown(function(){
		   $("#endDateError").html("");
		   $("#Error").html("");
	 }); */
	  $("#Invoice_Amount").keydown(function(){
		   $("#invioceAmtError").html("");
		   $("#Error").html("");
	 });
	  
 });
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row" >
  <div class="col-lg-12" >
  <div class="box box-primary" style="">
  
<div class="box-header" style="text-align: center;padding-bottom: 10px; ">				
<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">Purchases & Payments</h3>
</div><!-- /.box-header -->

	    <div class="box-body table-responsive" style="height:650px;" >
	       <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                   <div id="Success" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
	      <div class="row" style="padding-left:15px;padding-right:15px;">
	       <div class="col-lg-12" style="background: #eee; padding-top: 14px; padding-bottom: 0px;">
                  <div class="col-lg-9" style="background: #eee; padding-top: 14px; padding-bottom: 0px;">
                  <div class="row" style="padding-bottom: 0px;">
                 
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                  <input type="hidden" id="transactionId" value="${paymentsList[0].transactionId}"/>
                  <input type="hidden" id="transactionDescription" value="${paymentsList[0].transactionDescription}"/>
                  <input type="hidden" id="organizationId" value="${paymentsList[0].organizationId}"/>
                  
                  <div class="col-lg-2">
                  
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')" >
                           	<%-- <option value="" selected><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                 
                  </div>  
                      
                      <div class="col-lg-2"style="padding-left: 0px; padding-right: 0px;">
                   <label><spring:message code="Supplier.label" /></label>
					 <input type="text" value="${paymentsList[0].supplierName}"  class="form-control searchItems vendorid" placeholder="<spring:message code="search.supplier.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${purchaseOrderBeanObj.supplier_name}" />
				 <span id="SupplierError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				<div class="services">
				 <div class="items">
				  <ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   </div>
					</div>
					</div> 
                      
                       
                     
                 <div class="col-lg-2">
                
                 <input type="hidden" id="type" value="${type}">
				  <input type="hidden" id="sd" value="${startDate}">
				  <input type="hidden" id="ed" value="${endDate}">
				  <label><spring:message code="supply.date.label"/></label>
				  <input class="form-control  calendar_icon" style="background-color: white;" id="start_date" size="20" type="text"  onfocus="callCalender('start_date')" onclick="callCalender('start_date')" placeholder="DD/MM/YYYY"  value="${paymentsList[0].transactionDateStr}"/>
                 <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                 </div>        
                          
	          <div class="col-lg-2" style="display: none">
                   <label><spring:message code="invoice.status.label"/></label>
	                    <select class="form-control form-group" id="Invoice_Status" onchange="" >
                      	<option value="">${paymentsList[0].status}</option>
                      	</select>
	         
	          </div>	   
	                    
	                    <div class="col-lg-2">
	              
		                <label><spring:message code="invoce.amount.label"/></label>
	                    <input type="text" class="form-control form-group" id="Invoice_Amount" value="${paymentsList[0].invoiceAmount}"  >                     	                      			           
		         		<span id="invioceAmtError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		          </div>   	         	         
          </div>
                    
             <div class="row">
                       <div class="col-lg-2">
                     
                           <label><spring:message code="location.label"/></label>
                           <input type="text" class="form-control form-group" readonly="readonly" id="outletLocation" value="${selectedLocation}"  > 
                      </div>
                      <div class="col-lg-2" style="padding-left: 0px; padding-right: 0px;">
                        <label><spring:message code="invoice.ref.label"/></label>
	                    <select class="form-control form-group" id="Invoice_ref"  >
                      	<option value="${paymentsList[0].transactionref}">${paymentsList[0].transactionref}</option>
                      	</select>
                      </div>
                      
                    <div class="col-lg-2">
                     <label><spring:message code="Due.date.label"/></label>
				      <input class="form-control  calendar_icon" style="background-color: white;" id="end_date" size="20" type="text" onfocus="callCalender('end_date')" onclick="callCalender('end_date')" placeholder="DD/MM/YYYY"  value="${paymentsList[0].dueDateStr}"/>		               
                    <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     </div>
                  <div class="col-lg-2" >
	              
		                <label style=""><spring:message code="paymentmode.label"/></label>
	                    <select class="form-control form-group" id="paymentmode" style=""> 
	                    <option value="Cash" ${'Cash' == paymentsList[0].paymentMode ? 'selected' : ''}><spring:message code="cash.label"/></option>
	                    <option  value="Cheque" ${'Cheque' == paymentsList[0].paymentMode ? 'selected' : ''}><spring:message code="cheque.label"/></option>
	                    </select>                    	                      			           
		          </div>   		                        
                  </div> </div>
                    <div class="col-lg-2" style="padding-left:0px;">
                  <label style="margin-left: -150%; padding-top: 10px;"><spring:message code="paymentcomments.label"/></label>
                 <textarea  class="form-control form-group" value="${paymentsList[0].paymentComments}" id="paymentcomments" style="width: 316px;height: 102px;margin-left: -150%;"/></textarea>
                  </div>
                  
                           
                  </div>
                  
                    <div class="col-lg-2" style="padding-right:15px;border-right: 1px solid #ccc;height: 159px;margin-left: -17%;
                                   padding-left:5px;padding-bottom: 22px;padding-top:0px;background: #ccc;">
                  <div style="">
                              
                        
                        <label style="text-align: center;padding-bottom: 10px; font-size:13pt;width:100%;"><spring:message code="payment.details.label"/></label>
                        <label style="margin-bottom:40px;"><spring:message code="paid.amount.label"/></label>
                        <input type="text"   class="form-control" id="paid_amount"  style="display:inline-block;float:right;width:65%;" value="${paymentsList[0].paidAmount}">        
                        <label style="padding-right: 6px;"><spring:message code="pay.ref.label"/></label>
                        <input type="text" class="form-control" id="pay_ref"  style="display:inline-block;float:right;width:65%;" value="${paymentsList[0].paymentReference}">        
                  </div>                     
                  </div>
                     <div class="row">
                      <div class="col-lg-12">
                           <div class="col-lg-10" style="margin-left:0px;margin-right:5px;background-color:#EEEEEE;margin-top: 10px;margin-bottom: 0px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 10px;font-size:14pt;padding-bottom:0px;padding-left: 20px;color:solid black;width:82.8%;height: 45px;" >
                         <c:forEach var="previousWorkFlowList" items="${previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">
      									<img alt="" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									</span>
                                         </c:forEach>
                                          </div>
                                                
           
                       
                    <div class="col-lg-2" style="float:right;margin-left: 0px;margin-right: auto;background-color:#EEEEEE;margin-top: 10px;margin-bottom:0px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 8px;font-size:14pt;padding-bottom: 0px;padding-left: 20px;color:solid black;">
                  <select style="margin-bottom:8px;"class="form-control form-group" id="nextActivities">
                               <c:forEach var="nextActivitiesList" items="${nextActivitiesList}">
									<option value="${nextActivitiesList}" >${nextActivitiesList}</option>
						 		</c:forEach>
                              </select>
          </div>
       </div>
        </div>
        </div>
        

  
         <table id="productsList" class="table table-bordered table-striped" style="margin-top:0px;width:100%;height:300px;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff;">
                
                <tr>
                  
                     <th ><spring:message code="sno.label" /></th>
                     <th>Product ID</th>
                 	 <th><spring:message code="product.desc.label" /></th>
                 	 <th><spring:message code="po.quantity.label" /></th>                 	 
                     <th><spring:message code="supply.quantity.label"/></th>
                     <th><spring:message code="supply.price.label" /></th>
                     <th><spring:message code="Cost.label" /></th>
                     <th><spring:message code="discount.label" /></th>
                     <th><spring:message code="Net.cost.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                 <c:forEach var="childList" items="${paymentsList[0].purchasePaymentChilds}" varStatus="TheCount">
             	
                 <tr>            
             	 <td class="slno" id="sno${TheCount.count}">${TheCount.count}</td>
             	  <input type="hidden" id="transactionId${TheCount.count}" value="${childList.transactionId}"/> 
                 <td class="skuId" id="skuId${TheCount.count}">${childList.skuId}</td> 
                 <td class="description" id="description${TheCount.count}">${childList.productDescription}</td> 
                 <td class="poQty" id="poQty${TheCount.count}">${childList.purchaseOrderQuantity}</td> 
                 <td class="supplyQty" id="supplyQty${TheCount.count}">${childList.supplyQuantity}</td> 
                 <td class="supplyPrice" id="supplyPrice${TheCount.count}">${childList.supplyPrice}</td> 
                 <td class="cost" id="cost${TheCount.count}">${childList.cost}</td> 
                 <td class="discount" id="discount${TheCount.count}">${childList.discount}</td> 
                 <td class="netCost" id="netCost${TheCount.count}">${childList.net_cost}</td> 
                 
                 </tr>   
                 
                 
                </c:forEach> 
               
             </tbody>
         </table> 	
          <div class="col-sm-12 col-lg-12 col-xs-12">
          
           <div class="col-sm-8 col-lg-8 col-xs-8">
           <div class="col-sm-12 col-lg-12 col-xs-12">
            
  
          	<div class="col-lg-3" style="float:left;padding-right:0px;margin-top:10px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="createPurchasesAndPayments('','')" value="Submit" >
            </div>
            	<div class="col-lg-3" style="float:left;padding-right:0px;margin-top:10px; display: none" >
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="getPurchasesAndPayments('back','','','false')" value="Save" >
            </div>
            	<div class="col-lg-3" style="float:left;padding-right:0px;margin-top:10px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="getPurchasesAndPayments('back','','','false')" value="Cancel" >
            </div>
	        
           </div>
           </div>
           <div class="col-sm-4 col-lg-4 col-xs-4" >
            <label style="font-weight:bold;width: 50%"><spring:message code="Total.cost.label"/></label><label style="font-weight:bold;width: 50%;text-align: center" id="Totalcost">${totalNetCost}</label><br>
            <label style="font-weight:bold;width: 50%"><spring:message code="discounts.label"/></label><label style="font-weight:bold;width: 50%;text-align: center">${totalDiscount}</label><br>
            <label style="font-weight:bold;width: 50%"><spring:message code="Shipment.charges.label"/></label><label style="font-weight:bold;width: 50%;text-align: center">0</label><br>
           </div>           
         </div>
 	</div>
	</div>		
   <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                 </div>
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
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        
  </body>
</html>
