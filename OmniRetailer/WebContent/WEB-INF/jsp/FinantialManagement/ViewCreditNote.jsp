<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        : inventorymanager/FinantialManagement/SubLedger.jsp
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
hr
{
color:black;
border-top:1px solid black;
}

</style>  
<script type="text/javascript">
 $(document).ready(function(){
	 callCalender('po_date');
	  callCalender('invoice_date');
	  callCalender('return_date');
	  
	  $("#Tax_invoice_number").keydown(function(){
		   $("#Tax_invoice_numberError").html("");
		   $("#Error").html("");
	 });
	  
	  $("#debit_note_sales_number").keydown(function(){
		   $("#sales_numberError").html("");
		   $("#Error").html("");
	 });
	  $("#debit_note_po_no").keydown(function(){
		   $("#po_noError").html("");
		   $("#Error").html("");
	 });
	  $("#debit_note_gst_reg_no").keydown(function(){
		   $("#reg_noError").html("");
		   $("#Error").html("");
	 });
 });
</script>
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
       <div class="box-header" style="text-align: center;padding-bottom: 0px;">
            <h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 10px;padding-right: 10px;">
				<label style="font-weight:bold;">View Credit Note</label>
			</h3>
	  </div><!-- /.box-header -->
	    <div class="box-body table-responsive" style="height:800px;" >
	<div class="row" style="padding:0px;">
	<div class="col-lg-12" style="padding:0px;">
	
	<div class="col-lg-4" style="padding:0px;">
	<div class="col-lg-12" >
	
     <div style="padding-left:0px;padding-right: 0px;width: 50%;">
                          <label><spring:message code="location.label"/></label>
		             <select class="form-control form-group" id="outletLocation" disabled="disabled" >
		             	
		                <c:forEach var="location" items="${locationsList}">
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
						</c:forEach>
		            </select> 
                      </div>
	<label style="margin-bottom:0px;width: 50%;"><spring:message code="debite.note.po.date.label"/><span style="color:red; font-size:2">*</span></label>
    <input class="form-control  calendar_icon" disabled="disabled" value="${creditNoteDetails[0].salesOrderDateStr}" style="background-color: white;width: 50%" id="po_date"  autocomplete="off" size="20" type="text"  onfocus="callCalender('po_date')" onclick="callCalender('po_date')" placeholder="DD/MM/YYYY" />
	
	<label style="margin-bottom:0px;width: 50%;">SALES DATE <span style="color:red; font-size:2">*</span></label>
   	<input class="form-control  calendar_icon"  disabled="disabled" value="${creditNoteDetails[0].billDateStr}" style="background-color: white;width: 50%" id="invoice_date"  autocomplete="off" size="20" type="text"  onfocus="callCalender('invoice_date')" onclick="callCalender('invoice_date')" placeholder="DD/MM/YYYY" />
	
	<label style="margin-bottom:0px;width: 50%;"><spring:message code="debite.note.return.date.label"/><span style="color:red; font-size:2">*</span></label>
    <input class="form-control  calendar_icon" disabled="disabled" value="${creditNoteDetails[0].returnDateStr}" style="background-color: white;width: 50%" id="return_date"  autocomplete="off" size="20" type="text"  onfocus="callCalender('return_date')" onclick="callCalender('return_date')" placeholder="DD/MM/YYYY" />

	</div>
	</div>
	<div class="col-lg-4">
	
	</div>
	<div class="col-lg-4" style="padding:0px;">
	<div class="col-lg-12">

	<label style="margin-bottom:15px;"><spring:message code="debite.note.Tax.invoice.number.label"/><span style="color:red;  font-size:2">*</span></label>
    <input type="text"   class="form-control" id="Tax_invoice_number" disabled="disabled" value="${creditNoteDetails[0].taxInvoiceNo}" style="display:inline-block;float:right;width:53%;" value=""><br>
    <span id="Tax_invoice_numberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
    
	<label style="margin-bottom:15px;">SALES NO<span style="color:red; font-size:2">*</span></label>
    <input type="text"   class="form-control" id="debit_note_sales_number" disabled="disabled" value="${creditNoteDetails[0].billNo}" style="display:inline-block;float:right;width:53%;" value=""><br>
    <span id="sales_numberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>	
    
    <label style="margin-bottom:15px;"><spring:message code="debite.note.PO.No.label"/><span style="color:red; font-size:2">*</span></label>
    <input type="text"   class="form-control" id="debit_note_po_no" disabled="disabled" value="${creditNoteDetails[0].salesOrderNo}"  style="display:inline-block;float:right;width:53%;" value=""><br>
    <span id="po_noError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>	 
    
    <label style="margin-bottom:15px;"><spring:message code="debite.note.gst.reg.no.label"/><span style="color:red; font-size:2">*</span></label>
    <input type="text"   class="form-control" id="debit_note_gst_reg_no" disabled="disabled" value="${creditNoteDetails[0].gstRegistrationNo}" style="display:inline-block;float:right;width:53%;" value=""><br>  
    <span id="reg_noError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>	
    
    <label style="margin-bottom:15px;">Comments</label>
    <input type="text"   class="form-control" id="comments" disabled="disabled" value="${creditNoteDetails[0].transactionDescription}"  style="display:inline-block;float:right;width:53%;height: 65px" value=""><br>
	</div>
	</div>
	</div>
	</div>
	      <div class="row">
                <div class="col-lg-10"></div>
                <div class="col-lg-1 summaryBtn">
                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;display:none;" onclick="" >
                </div>
          </div>
	        		
	        
  <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
	        
	        
	      <div class="row">
	   
         
       
	      
	      <div class="col-lg-12" style="padding-top:2px;width:99%;padding-right:5px;margin-bottom: 5px;margin-right: 5px">
                                         <input type="hidden" id="desc"/>
                                         <%-- 	<label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl debitNoteItems" style=""></ul>
								   				</div>
											</div>
			
                                        </div>
                                    <!--     <input type="hidden" id="outletLocation" value=""> -->
		<div class="col-lg-2" style="padding-left:0px;padding-right:6px; display: none">
	        <input type="button" style="float: right;" class="btn bg-olive btn-inline addBtn"   onclick="" value="<spring:message code="debit.note.search.label" />" />
	     </div>
	     </div>                                     

		
		
	 <div id="orderitemsForLocations">         
	  <div style="overflow:auto">    
         <table id="productsList" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>  
                 	 <th class="col-lg-1"><spring:message code="debit.note.sno.label" /></th>
                 	 <th class="col-lg-2"><spring:message code="debite.note.sku.id.label" /></th>
                 	 <th class="col-lg-3"><spring:message code="debite.note.Description.label" /></th>
                 	 <th class="col-lg-1"><spring:message code="debite.note.Qty.label" /></th>
                     <th class="col-lg-2">Price</th>
                     <th class="col-lg-2">Tax</th>
                     <th class="col-lg-1"><spring:message code="debite.note.Cost.label" /></th>
                     <th class="col-lg-2"><spring:message code="debite.note.Reason.label" /></th>
                 </tr>
          </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="creditNoteitems" items="${creditNoteDetails[0].creditNoteItems}" varStatus="TheCount">
             	 <tr>
             	<td>${TheCount.count}</td>
             	 <td>${creditNoteitems.skuId}</td>	
             	 <td>${creditNoteitems.description}</td>	
             	 <td>${creditNoteitems.quantity}</td>	
             	 <td>${creditNoteitems.salePrice}</td>	
             	 <td>${creditNoteitems.taxRate}</td>	
             	 <td>${creditNoteitems.cost}</td>	
             	 <td>${creditNoteitems.reasonForReturn}</td>	
                 </tr>
                </c:forEach>
            </tbody>
         </table>
         </div>
         </div>

<div style="border:0.5px solid black;margin-top:15px;margin-bottom:5px;"></div>
 <div class="col-sm-4 col-lg-4 col-xs-4" >
<label style="font-weight:bold;width: 50%;font-size: 18px">Grand Total</label><input style="font-weight:bold;width: 50%;    text-align: center;" disabled="disabled" value="${creditNoteDetails[0].creditNoteValue}" id="grandTotal"/>
</div>
<div style="border:0.5px solid black;margin-top:35px;margin-bottom:15px;"></div>
<label style="font-weight:bold;width: 50%;"><spring:message code="debite.note.authorised.sign.label"/></label><label style="font-weight:bold;width: 50%;    text-align: center;" id="grandTotal"></label>

<div class="row" style="text-align: center; margin-bottom: 10px">
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="creditNoteSummary('clear','creditNote','0');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin"  onclick="creditNoteSummary('clear','creditNote','0');" value="<spring:message code="cancel.label" />" />
							</c:if>
						</c:forEach>
						</div>

</div>


	
      </div><!-- /.box-body -->
         </div><!-- /.box -->
         
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
        
        
</body>
</html>