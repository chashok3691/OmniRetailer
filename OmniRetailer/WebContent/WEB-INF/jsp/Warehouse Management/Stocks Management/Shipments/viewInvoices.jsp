<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vijay
 * file name		        : Warehouse Management/Stocks Management/shipments/viewInvoices.jsp
 * file type		        : JSP
 * description				: The invoice details is displayed using this jsp
 * Written Date				: 05-12-2017
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
        
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/invoices/wareHouseShipmentInvoice.js"></script>
<style type="text/css">
a.button {
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
    width: 100%;
}
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}


</style>       
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	
	$("#searchInvoice").val($("#sku").val());
	//if($("#searchSKU").val().trim()!="")
		$("#searchInvoice").focus();

	
		$('#searchInvoice').on('input',function(e){
			if($(this).val().trim()==""){
				viewShipmentInvoice('wShipmentInvoice','0','warehouse');
			}
		});

	
	 $('#mySearch').click(function(){
	        var search = $('#searchInvoice').val();
	        viewShipmentInvoice('wShipmentInvoice','0','',search);
	    })
	    $('#searchInvoice').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });
	 
		var zone = $("#outletZone").val();
		if( zone != null && zone !="")
		{
			searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse');
		}
/* 	
	$("#outletShipments").val($("#shipment").val());
	$("#outletShipments").focus();
	$('#searchInvoice').on('input',function(e){
		if($(this).val().trim()==""){
			searchShipmentInvoice('wShipmentInvoice','0','');
		} 
	}); */
	
/* /* window.onload = function(){ document.getElementById("loading").style.display = "none" }
var err = $("#err").val();
if(err != "")
  alert(err);
$("#outletShipments").val($("#shipment").val());
	$("#outletShipments").focus();
	$('#outletShipments').on('input',function(e){
		if($(this).val().trim()==""){
			/* viewOutletShipments('','','0');
		} 
	});
	
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);

	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]); */
});
</script>
</head>
<body>


<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary" >
                                <div>
                                <h3 class="box-title" style="text-align:center;"><spring:message code="warehouse.invoices.label" /></h3>
                             
                                </div>
                                
                                <%@ include file="/WEB-INF/jsp/standardFilters.jsp" %> 
                                <div class="box-body table-responsive">
                                <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<%-- <img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;" onclick="getOrderSummary();" > --%>
                </div>
          </div>
          <div class="row">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewShipmentInvoice('wShipmentInvoice','0','warehouse');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
	        <div class="col-lg-10 col-xs-10" style="margin-top: 10px;margin-left:-19px">
       	 		 <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="searchInvoice" placeholder="<spring:message code="search.sku.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						
							<input type="hidden" id="sku" value="${searchName}"></div>
       	 	</div>
	        
				
					 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
								    <c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true}">  
			                	 <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;margin-left:19px">
 	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewInvoiceShipmentsDetails('new','wareHouse');" value="<spring:message code="addnew.label" />" />
 	         </div> 
	    			</c:if>
						</c:forEach>
			
		</div>
		                    <input type="hidden" id="type" name="type" value="${type}">
								   <input type="hidden" id="flowUnder" name="flowUnder" value="${flowUnder}">
				                 <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="productstocks" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="warehouse.invoices.orderref.label" /></th>
                                            	 <th><spring:message code="po.ref.label" /></th>
                                                <th><spring:message code="shipment.ref.label" /></th>
                                                <th><spring:message code="invoice.date.label" /></th>
                                                <th><spring:message code="from.label" /></th>
                                                <th><spring:message code="bill.to.label" /></th>
                                                <th><spring:message code="total.invoice.label" /></th>
                                                <th>Status</th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="shipper" items="${shipmentBeanList}" varStatus="loop">
                                           <tr>
                                            	<td>${loop.count+index-1}</td>
                                            	<td>${shipper.invoiceId}</td>
                                            	<td>${shipper.orderId}</td>
                                            	<td>${shipper.goodsReceiptNoteRef}</td>
                                            	<%-- <fmt:formatDate var="createDate" value="${shipper.createdOn}" pattern="dd-MM-YYYY"/> --%>
                                            	<td>${shipper.createdOnStr}</td>
                                                <td>${shipper.warehouseLocation}</td>
                                                <td>${shipper.shipmentReceivedBy}</td>
                                                
                                                <td>${shipper.totalItemCost}</td>
                                                <td>${shipper.invoiceStatus}</td>
                                                <td>
	                            						<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return invoicedetailsviewedit('${shipper.invoiceId}','view');"><spring:message code="view.label"/></a>&nbsp &nbsp	
	                            						<c:if test="${shipper.invoiceStatus=='Submitted'}">
                                              			<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return invoicedetailsviewedit('${shipper.invoiceId}','edit');"><spring:message code="edit.label"/></a> &nbsp	&nbsp	
                                              			</c:if>
                                              			<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="printInvoiceDetails('${shipper.invoiceId}','')"><spring:message code="print.label"/></a>										
                                              
                                             
                                                </td>
                							</tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                       
                                    </table>
                                    
                                    
                                    
                                      <div class="row" style="margin-right:0%;">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentInvoice('wShipmentInvoice','${totalValue}');">
              	</div>									
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShipmentInvoice('wShipmentInvoice','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShipmentInvoice('wShipmentInvoice','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentInvoice('wShipmentInvoice','${totalValue}')">
              	</div> 
              	</c:if>
              	
              
              	<div class="col-lg-6" style="text-align: right;"> 
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
              		  <input type="button" onclick="viewShipmentInvoice('wShipmentInvoice',document.getElementById('pagination').value,'warehouse')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>
                                    
                                    
                            </div><!-- /.box-body -->
                            </div><!-- /.box -->
  <input type="hidden" id="err" value="${err}" />
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(function() {
                $('#example1').dataTable({
                	 "bPaginate": false,
                     "bLengthChange": false,
                     "bFilter": false,
                     "bSort": false,
                     "bInfo": false,
                     "bAutoWidth": false
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="shipment.label" />"/>
</body>
</html>