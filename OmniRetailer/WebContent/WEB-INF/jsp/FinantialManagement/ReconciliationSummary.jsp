<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        :FinantialManagement/Reconciliation.jsp
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
	callCalender('startDate');
	callCalender('endDate');
	
});
</script> 
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
     <div class="box-header" style="text-align:center;">
	
<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">Reconciliation</h3>
				
			
</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	      
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                  
	                         <label><spring:message code="Organization.label"/></label>
                          <select class="form-control" id="organization" onchange="getOrganizationlocations()">
                           <option value=""><spring:message code="ALL.label"/></option>
                           		 <c:forEach var="organization" items="${OrganizationList}">
							<option value="${organization.organizationId}" ${organization.organizationId == selectedLocation ? 'selected' : ''} id="${organization.organizationId}" >${organization.organizationId}</option>
						</c:forEach>
	                        </select>
                         </div>
                      </div>
                      <div class="col-lg-3">
                      </div>
                      <div class="col-lg-3">
                      </div>
                   
	                <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" style="background-color: white;" value="${startDate}" autocomplete="off" id="startDate" size="20" type="text" readOnly="readOnly" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" >
	             	<option value="">ALL</option>
	                <c:forEach var="location" items="${locationsList}">
						<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
					</c:forEach>
	            </select> 
                      </div>
                      </div>
                   <div class="col-lg-3">
                      </div>
                      <div class="col-lg-3">
                      </div>
                <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;" value="${endDate}" autocomplete="off" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          
                    </div>
                  </div>
                 <div class="col-lg-1" style="padding-right:15px;border-right: 1px solid #ccc;padding-top: 7px;padding-bottom: 22px;width: 12%;padding: 10px 15px;background: #ccc;height: 140px;">
                
                  <div class="col-lg-9" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                       
                   <input type="button" style="margin-top:22px;margin-left:14px;" class="btn bg-olive btn-inline addBtn" onclick="accountingReconciliationSummary('','reconciliation','0')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a onclick="accountingReconciliationSummary('clear','reconciliation','0')" style="margin-top:31px;margin-left:14px;"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	
	      <div class="row" style="padding-left:14px;">          
				 <div class="col-lg-10" style="margin-top: 10px; padding-left: 1px;">
                      <div class="wrapper">	 
                     <input type="text"  class="form-control"  value="${searchName}" id="searchData" placeholder="<spring:message code="debit.note.search.label" />"/>
							<button id="mySearch" class="searchbutton"></button>
							
							</div>
						<input type="hidden" id="ordersSearch" value="${searchName}">
						
						
                    </div>
           <div class="col-lg-2" style="margin-top: 10px; padding-left: 3px;">
                 <input type="button"  class="btn bg-olive btn-inline addBtn" onclick="accountingReconciliation('','');" value="<spring:message code="start.Reconciliation.label" />" />
               </div>     
               </div>
  	
		
	 <div id="orderitemsForLocations" style="padding-left:0px;padding-right:0px;">         
	  <div style="overflow:auto">    
	  
	  
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
              	     <th class="col-lg-1"><spring:message code="sl.no.label" /></th>
              	      <th class="col-lg-1"><spring:message code="Reconciliation.Id.label" /></th>
                 	 <th class="col-lg-1"><spring:message code="Account.Id.label" /></th>
                 	 <th class="col-lg-2"><spring:message code="Account.Name.label" /></th>
                 	  <th class="col-lg-2"><spring:message code="Reconciliation.date.label" /></th>
                     <th class="col-lg-2"><spring:message code="diff.amount.label" /></th>
                      <th class="col-lg-2"><spring:message code="comments.label" /></th>
                     <th><spring:message code="action.label" /></th>
                 </tr>
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="reconcilition" items="${reconcilitionList}"  varStatus="TheCount">
             	 <tr>
             	<td>${TheCount.count+index-1}</td>
             	<td>${reconcilition.reconciliationId}</td>
             	<td>${reconcilition.accountId}</td>
             	<td>${reconcilition.accountName}</td>
             	<td>${reconcilition.reconciliationDateStr}</td>
             	<td>${reconcilition.differnceAmount}</td>
             	<td>${reconcilition.comments}</td>
                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewReconciliation('${reconcilition.reconciliationId}');">View</a>
                   </td>
                    
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>
         </div>
              <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              <div class="row" >
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="accountingReconciliationSummary('data','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="accountingReconciliationSummary('data','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="accountingReconciliationSummary('data','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="accountingReconciliationSummary('data','','${totalValue}')">
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
              		  <input type="button" onclick="accountingReconciliationSummary('data','',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div> 
   
          
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