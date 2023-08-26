<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        : FinancialManagement/Reconciliation.jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentNotes.js"></script>
        
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
	 
 });
 
 $("#searchAccount").keyup(function(event) {
	    if (event.keyCode === 13) {
	    	getSalesAndPayments('','','','false');
	    }
	});
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row" >
  <div class="col-lg-12" >
  <div class="box box-primary" style="">
       <div class="box-header" style="text-align: center;padding-bottom: 0px; ">				
		<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;"><spring:message code="Accounting.SalesandPayments.label"/></h3>

	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;margin-bottom: 35px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 0px; padding-bottom: 0px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="Organization.label"/></label>
                          <select class="form-control" id="organization" onchange="getOrganizationlocations()"><!--getOrganizationlocations()-->
                           <option value=""><spring:message code="ALL.label"/></option>
                           		 <c:forEach var="organization" items="${OrganizationList}">
							<option value="${organization.organizationId}" ${organization.organizationId == selectedOrganization ? 'selected' : ''} id="${organization.organizationId}" >${organization.organizationId}</option>
						</c:forEach>
	                        </select>
                         </div>
                      </div>  
                      
                      
                     <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">  
                      <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" onchange="countersByLocation('outletLocation','counterId');">
                     	<option value=""><spring:message code="ALL.label"/></option>
                        <c:forEach var="location" items="${locationsList}">
							<c:choose>
							<c:when test="${location.description == ''}">
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							</c:when>
							<c:otherwise>
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							</c:otherwise>
							</c:choose>
							
	 					</c:forEach>
                 </select>
                  </div>
                  </div>    
                     
                <%--  <div class="col-lg-3">
                 <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                  <label><spring:message code="Supplier.label" /></label>
                 <input type="text" class="form-control" id="Supplier"  name="supplier" value="" />
                 
                 <select class="form-control" id="Supplier">
                           		 <option value="" selected><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                 </div>
                 </div>    --%>
                 
                 
                 
                 <div class="col-lg-2">
                 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                   <label><spring:message code="customerId.label" /></label>
					 <select class="form-control form-group" id="customerId">
                     	<option value=""><spring:message code="ALL.label"/></option>
                        <c:forEach var="location" items="${locationsList}">
							<option value="${location.locationId}" ${location.locationId == customerID ? 'selected' : ''}>${location.locationId}</option>
							
	 					</c:forEach>
                 </select>
					</div>
					</div>
					
                      <div class="col-lg-2">
                 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                   <label>Bank Account</label>
					 <select class="form-control form-group" id="accountName">
                     	<option value=""><spring:message code="ALL.label"/></option>
                        <c:forEach var="accountName" items="${accountNameList}">
							<option value="${accountName}" >${accountName}</option>
							
	 					</c:forEach>
                 </select>
					</div>
					</div>
                          
	          <div class="col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <input type="hidden" id="type" value="${type}">
				  <input type="hidden" id="sd" value="${startDate}">
				  <input type="hidden" id="ed" value="${endDate}">
				  <label><spring:message code="offer_start_date.label"/></label>
				  <input class="form-control  calendar_icon" value="${startDate}" style="background-color: white;" id="start_date" autocomplete="off" size="20" type="text"  onfocus="callCalender('start_date')" onclick="callCalender('start_date')" placeholder="DD/MM/YYYY" />
	          </div>
	          </div>	   
	                      	         	         
          </div>
                    
             <div class="row">
                       <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value="" selected><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                     
                      </div>
                      </div>
                      
                      <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="product.category.label"/></label>
	                    <select class="form-control form-group" id="product_category" onchange="">
                      	<option value=""><spring:message code="ALL.label"/></option>
                      	</select>
                      	
                        </div>
                      </div>
                    <div class="col-lg-2">
                    <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="Payment.status.label"/></label>
	                    <select class="form-control form-group" id="payment_status" onchange="">
                      	<option value=""><spring:message code="ALL.label"/></option>
                      	 <c:forEach var="workflowsList" items="${workflowsList}">
									<option value="${workflowsList.statusName}" ${workflowsList.statusName == status ? 'selected' : ''} id="${workflowsList}" >${workflowsList.statusName}</option>
						 		</c:forEach>
                      	</select>
                     </div>
                     </div>
                     <div class="col-lg-2" >
                 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                   
					</div>
					</div>
                <div class="col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
				      <input class="form-control  calendar_icon" value="${endDate}" style="background-color: white;" id="end_date" autocomplete="off" size="20" type="text" onfocus="callCalender('end_date')" onclick="callCalender('end_date')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>   
		                        
               </div>
              
                  </div>
                  <div class="col-lg-1" style="padding-right:15px;border-right: 1px solid #ccc;padding-top: 7px;padding-bottom: 22px;width: 12%;padding: 10px 15px;background: #ccc;height: 140px;">
                  <div class="col-lg-9" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                      
                   <input type="button" style="margin-top:18px;width: 135%;" class="btn bg-olive btn-inline addBtn" onclick="getSalesAndPayments('','','','false')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a onclick="getSalesAndPayments('back','','','false')" style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                     <div class="row">
	           <div class="col-lg-12">
                  <div class="col-lg-8" style="margin-top: 11px; padding-left: 0px;padding-right:7px;">
                      <div class="wrapper">	 
                         <input type="text"  class="form-control"  value="" id="searchAccount"  />												
					  </div>
						
                    </div>
   	
		       <div class="col-lg-2" style="margin-top: 10px;padding-left:0px;padding-right:1px;">
	           <input type="button" style="float: right;" class="btn bg-olive btn-inline addBtn" onclick="newSalesAndPayments('${workflowsList[0].statusName}','');" value="<spring:message code="New.payment.label" />" />
	          </div>
           <div class="col-lg-1" style="float:right;padding-right:0px;margin-top:10px;padding-left:5px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="getSalesAndPayments('back','','','true')" value="Save" >
            <input type="hidden" id="stockdownloadurl" value="${downloadurl}">                         
           </div>
           <div class="col-lg-1" style="float:right;padding-right:0px;margin-top:10px;padding-left:5px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="syncOrganizationMaster('','STOCK ISSUE')" value="Sync" >
           </div>
           </div>
		        </div>
                </div>
                
         <input type="hidden" id="fileDownloadurl" value="${filePath}">
         
<div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
  
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff">
                
                <tr>
                  
                     <th><spring:message code="Txn.sno"/></th>
                     <th><spring:message code="export.select.location.label"/></th>
                      <th><spring:message code="Txn.ID" /></th>
                 	 <th><spring:message code="Txn.Date" /></th>
                 	 <th><spring:message code="Txn.Description" /></th>                 	 
                     <th><spring:message code="customerId.label"/></th>
                     <th><spring:message code="Invoice.amount.label" /></th>
                     <th><spring:message code="Due.date.label" /></th>
                     <th><spring:message code="Status.label" /></th>
                     <th><spring:message code="Action.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                  <c:forEach var="paymentsList" items="${paymentsList}" varStatus="TheCount">
                   <tr>
                    <td>${TheCount.count+index-1}</td>
             	 	 <td>${paymentsList.location}</td>
             	 	 <td>${paymentsList.transactionId}</td>
             	 	 <td>${paymentsList.transactionDateStr}</td>
             	 	 <td>${paymentsList.transactionDescription}</td>
             	 	 <td>${paymentsList.customerId}</td>
             	 	 <td>${paymentsList.invoiceAmount}</td>
             	 	 <td>${paymentsList.dueDateStr}</td>
             	 	 <td>${paymentsList.status}</td>             	 
                      <td><a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewSalesAndPayments('','${paymentsList.transactionId}')">View</a>
                         <a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="editSalesAndPayments('','${paymentsList.transactionId}')">Open</a>        
                     <a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="getSalesPaymentsPDF('${paymentsList.transactionId}')">Print</a>     
                     </td>
                     </tr>
                </c:forEach> 
               
             </tbody>
         </table> 	 
      
  
          	
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
        
        
        <div class="col-lg-6" style="float:right;margin-left: 100px;margin-right: auto;background-color:#EEEEEE;margin-top: 0px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 5px;font-size:14pt;padding-bottom: 10px;padding-left: 20px;color:solid black;" ">
           <label style="width: 50%"><spring:message code="total.invoice.amount.label"/></label><label style="width: 50%;text-align: center;">${totalInvoice}</label>
           </div>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
        
        <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              
              <div class="row" style="padding-left: 15px;padding-right: 15px">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="getSalesAndPayments('data','','${totalValue}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="getSalesAndPayments('data','','${index - (maxRecords + 1)}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="getSalesAndPayments('data','','${index - (maxRecords + 1)}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="getSalesAndPayments('data','','${totalValue}','false')">
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
              		  <input type="button" onclick="getSalesAndPayments('data','',document.getElementById('pagination').value,'false');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
        
        
  </body>
</html>
