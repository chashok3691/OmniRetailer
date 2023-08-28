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
       <div class="box-header" style="text-align: center;padding-bottom: 0px;">
	<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 10px;padding-right: 10px;">
				<label style="font-weight:bold;"><spring:message code="debit.note.label"/></label>
			</h3>
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-10" style="background: #eee;  padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet' }">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','warehouse')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:otherwise>
	                        </c:choose>
                         </div>
                      </div>

                   <div class="col-lg-3">
                     <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          
 	                 </div>
	               </div>
	            
	               <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;display:none;" >
                           <label><spring:message code="order.value.start.label"/></label>
                             <%--  <fmt:formatNumber var="formattedBillableTime" type="number"  value="${orderDetails.orderStartValue}" /> --%>
                           <input type="text" class="form-control" name="orderStartValue" id="orderStartValue"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${orderStartValue}" placeholder="Enter Order Value Start" />
                       </div>
                   </div>
	            
	            
	            
	           <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" style="background-color: white;"  value="${startDate}" id="startDate" autocomplete="off" size="20" type="text" readOnly="readOnly" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
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
                     <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                         
                     </div>
                  </div>
                      
                      
                   <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;display:none;">
                           <label><spring:message code="order.value.end.label"/></label>
                          <input type="text" class="form-control"  name="orderEndValue" value="${orderEndValue}" id="orderEndValue" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" placeholder="Enter Order Value End"/>
                      </div>
                   </div>
                      
                      
                  <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;" value="${endDate}" id="endDate" autocomplete="off" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          
                    </div>
                  </div>
                  <div class="col-lg-2" style="padding-right:15px;border-right: 1px solid #ccc;padding-top: 7px;padding-bottom: 22px;padding: 10px 15px;background: #ccc;height: 141px;">
                 <div class="col-lg-9">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                       
                   <input type="button" style="margin-top:18px;width: 135%;" class="btn bg-olive btn-inline addBtn" onclick="accountingDebitNoteSummary('','debitNote','')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a  type="button" style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn" onclick="accountingDebitNoteSummary('clear','debitNote','')"><spring:message code="clearbutton.label"/></a>
              </div>
                  </div></div>
                
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
	   
         
        <div class="col-lg-10" style="padding-top:2px;width:82.5%;padding-right:5px;">
        
         <input type="text"  class="form-control"  value="" id="searchAccount" >
        
        </div>
	      
		<div class="col-lg-2" style="padding-left:0px;padding-right:6px;">
	        <input type="button" style="float: right;" class="btn bg-olive btn-inline addBtn"   onclick="accountingDebitNote('new','debitNote','');" value="<spring:message code="debit.note.new.label" />" />
	     </div>
	     </div>                                     

		
		
	 <div id="orderitemsForLocations">         
	  <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>  
                 	 <th class="col-lg-1"><spring:message code="debit.note.sno.label" /></th>
                 	 <th class="col-lg-3"><spring:message code="Debit.note.ref.label" /></th>
                 	 <th class="col-lg-2"><spring:message code="Debit.note.date.label" /></th>
                 	  <th class="col-lg-2"><spring:message code="location.label" /></th>
                 	 <th class="col-lg-4"><spring:message code="Debit.note.txn.description.label" /></th>
                     <th class="col-lg-2"><spring:message code="debit.note.value.label" /></th>
                        <th class="col-lg-2"><spring:message code="action.label" /></th>
                     
                 </tr>
          </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                 <c:forEach var="DebitNote" items="${debitNoteSummary}" varStatus="TheCount">
             	 <tr>
					<td>${TheCount.count+index-1}</td>
             	 	 <td>${DebitNote.debitNoteRef}</td>
                 	 <td>${DebitNote.invoiceDateStr}</td>
                 	 <td>${DebitNote.location}</td>
                     <td>${DebitNote.transactionDescription}</td>
                     <td>${DebitNote.debitNoteValue}</td>                    
                      <td><a style="color:#2e7ea7 !important;cursor: pointer;margin-right: 10px; " onclick="accountingDebitNote('view','debitNote','${DebitNote.debitNoteRef}')">View</a>  </td>                               	
                        	
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="accountingDebitNoteSummary('debitNote','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="accountingDebitNoteSummary('debitNote','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="accountingDebitNoteSummary('debitNote','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="accountingDebitNoteSummary('debitNote','','${totalValue}')">
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
              		  <input type="button" onclick="accountingDebitNoteSummary('debitNote','',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
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
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
</body>
</html>