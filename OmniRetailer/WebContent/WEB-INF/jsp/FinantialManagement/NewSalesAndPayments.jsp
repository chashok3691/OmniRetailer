 <!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Surya.k
 * file name		        : FinancialManagement/NewSalesAndPayments.jsp
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
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
      
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
	/*   $("#start_date").keydown(function(){
		  debugger;
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
<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;"><spring:message code="Accounting.SalesandPayments.label"/></h3>
</div><!-- /.box-header -->

	    <div class="box-body table-responsive" style="height:650px;" >
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                 <div class="col-lg-10" style="background: #eee; padding-top: 14px; padding-bottom: 0px;">
                  <div class="row" style="padding-bottom: 0px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                   <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                   <div id="Success" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                  <div class="col-lg-3">
                  
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           <%-- 	<option value="" selected><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                 
                  </div>  
                      
                      
                     <div class="col-lg-3">
                   <label><spring:message code="customerId.label" /></label>
					 <select class="form-control form-group" id="customerId">
                     	<%-- <option value=""><spring:message code="ALL.label"/></option> --%>
                        <c:forEach var="location" items="${locationsList}">
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							
	 					</c:forEach>
                 </select>
					 
					</div>    
                     
                 <div class="col-lg-3">
                
                 <input type="hidden" id="type" value="${type}">
				  <input type="hidden" id="sd" value="${startDate}">
				  <input type="hidden" id="ed" value="${endDate}">
				  <label><spring:message code="issue.date.label"/></label>
				  <input class="form-control  calendar_icon" style="background-color: white;" id="start_date"  autocomplete="off" size="20" type="text"  onfocus="callCalender('start_date')" onclick="callCalender('start_date')" placeholder="DD/MM/YYYY" />
                 <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                 </div>        
                          
	         <div class="col-lg-3" >
	              
		                <label><spring:message code="invoce.amount.label"/></label>
	                    <input type="text" class="form-control form-group" id="Invoice_Amount" >                     	                      			           
		         <span id="invioceAmtError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		          </div>   	   
	                      	         	         
          </div>
                    
             <div class="row">
                       <div class="col-lg-3">
                     
                           <label><spring:message code="location.label"/></label>
	              <select class="form-control form-group" id="outletLocation" onchange="countersByLocation('outletLocation','counterId');">
                        <c:forEach var="organizationlocation" items="${OrganizationlocationsList}">
							
							<option value="${organizationlocation.locationId}" ${organizationlocation.locationId == selectedLocation ? 'selected' : ''}>${organizationlocation.locationId}</option>
							
	 					</c:forEach>
                 </select> 
                      
                      
                      </div>
                      
                      <div class="col-lg-3">
                       
                        <label><spring:message code="invoice.ref.label"/></label>
	                   
                      	<input type="text" class="form-control form-group" id="Invoice_ref" >   
                       <span id="inviocerefError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                      </div>
                    <div class="col-lg-3">
                    
                     <label><spring:message code="Due.date.label"/></label>
				      <input class="form-control  calendar_icon" style="background-color: white;" id="end_date" autocomplete="off" size="20" type="text" onfocus="callCalender('end_date')" onclick="callCalender('end_date')" placeholder="DD/MM/YYYY" />		               
                     <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     </div>
                    <div class="col-lg-3" >
	              
		                <label style=""><spring:message code="paymentmode.label"/></label>
	                    <select class="form-control form-group" id="paymentmode" style=""> 
	                    <option><spring:message code="cash.label"/></option>
	                    <option><spring:message code="cheque.label"/></option>
	                    </select>                    	                      			           
		         
		          </div>    		                        
                  </div>  
                  <div class="row">
                  <div class="col-lg-12">
                  <label style=""><spring:message code="paymentcomments.label"/></label>
                  
                  <textarea class="form-control form-group" id="paymentcomments" cols=""></textarea>
                  </div>
                  
                  </div>             
                  </div>
                  
                    <div class="col-lg-2" style="padding-right:15px;border-right: 1px solid #ccc;padding-left:5px;padding-bottom: 22px;padding-top:0px;background: #ccc;height: 223px;;">
                  <div style="">
                      	
                        
                        <label style="text-align: center;padding-bottom: 10px; font-size:13pt;width:100%;"><spring:message code="payment.details.label"/></label>
                        <label style="margin-bottom:40px;"><spring:message code="paid.amount.label"/></label>
                        <input type="text"   class="form-control" id="paid_amount"  style="display:inline-block;float:right;width:65%;" value="">	
                        <label style="padding-right: 6px;"><spring:message code="pay.ref.label"/></label>
                        <input type="text" class="form-control" id="pay_ref"  style="display:inline-block;float:right;width:65%;" value="">	
                  </div>                     
                  </div>
                      <div class="row" style="display: none">
	              <div class="col-lg-12">
                  <div class="col-lg-10" style="margin-left:0px;margin-right:5px;background-color:#EEEEEE;margin-top: 10px;margin-bottom: 0px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 43px;font-size:14pt;padding-bottom:0px;padding-left: 20px;color:solid black;width:82.8%;" >
                      <div class="wrapper">	
                      
                        
					  </div>
						
                    </div>
   	
		       
	            <div class="col-lg-2" style="float:right;margin-left: 0px;margin-right: auto;background-color:#EEEEEE;margin-top: 10px;margin-bottom:0px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 8px;font-size:14pt;padding-bottom: 0px;padding-left: 20px;color:solid black;">
                  <select style="margin-bottom:8px;"class="form-control form-group" id="Invoice_Status" onchange="">
                      	<option value=""></option>
                      	</select>
          
                </div>
	                    
	          
       </div>
		        </div>
		        
		        
		        <div class="form-group col-lg-12" style="text-align:center;margin-bottom: 0.5%;width: 100%; margin-top: 1.5%;padding: 0px">
                                         <input type="hidden" id="desc"/>
                                         <%-- 	<label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl salespayments" style=""></ul>
								   				</div>
											</div>
			
                                        </div>
                                        </div>
        <input type="hidden" id="outletLocation" value="Retail Outlet">

  
         <table id="productsList" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff;">
                
                <tr>
                  
                     <th ><spring:message code="sno.label" /></th>
                     <th><spring:message code="skuid.label"/></th>
                 	 <th><spring:message code="product.desc.label" /></th>
                     <th><spring:message code="quantity.label"/></th>
                     <th><spring:message code="price.label" /></th>
                     <th><spring:message code="Cost.label" /></th>
                     <th><spring:message code="discount.label" /></th>
                     <th><spring:message code="Net.cost.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                 <c:forEach var="Assets" items="" varStatus="TheCount">
             	
                
            
             	<%--  <td></td>
             	 	 <td>${Assets.createdDateStr}</td>
                 	 <td>${Assets.remarks}</td>
                 	 <td>${Assets.creditAmount}</td>
                 	 <td>${Assets.debitAmount}</td>
                 	 <td>${Assets.accountType}</td>
                 	 <td>${Assets.accountId}</td>
                     <td>${Assets.debitAmount}</td>
                     
                 <td></td>  --%>
                    
                 
                 
                </c:forEach> 
               
             </tbody>
         </table> 	
         <div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 30px">
           <div class="col-sm-8 col-lg-8 col-xs-8">
           <div class="col-sm-12 col-lg-12 col-xs-12">
            <div class="col-lg-3" style="float:left;padding-right:0px;margin-top:10px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="createSalesAndPayments('new','${status}')" value="Submit" >
            </div>
  
          	<div class="col-lg-3" style="float:left;padding-right:0px;margin-top:10px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="getSalesAndPayments('back','','','false')" value="Cancel" >
            </div>
	        <div class="col-lg-3" style="float:left;padding-right:12px;margin-top:10px;display: none">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="accountingReconciliation('','0')" value="Save" >
            <input type="hidden" id="stockdownloadurl" value="${downloadurl}">                         
           </div>
           </div>
           </div>
           <div class="col-sm-4 col-lg-4 col-xs-4" >
            <label style="font-weight:bold;width: 50%;"><spring:message code="Total.cost.label"/></label><label style="font-weight:bold;width: 50%;    text-align: center;" id="Totalcost"></label><br>
            <label style="font-weight:bold;width: 50%;"><spring:message code="discounts.label"/></label><label style="font-weight:bold;width: 50%;    text-align: center;">0</label><br>
            <label style="font-weight:bold;width: 50%;"><spring:message code="Shipment.charges.label"/></label><label style="font-weight:bold;width: 50%;    text-align: center;">0</label><br>
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
        <input type="hidden" id="location" value="${selectedLocation}"/>
        
  </body>
</html>
