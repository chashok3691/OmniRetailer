<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/billing.jsp
 * file type		        : JSP
 * description				: display total billings
 * */ -->

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
		<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/billings.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">

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
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.pagination1{
       padding: 4px 14px;
    background: #337ab7;
   /*  width: 67px; */
    color: #fff;
    /* margin-right: 30px; */
    text-align: center;
    font-size: 16px;
    border-radius: 0px;
}
.pagination1:hover{
cursor:pointer;
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
}
/* @media (min-width: 1200px){
	.summaryBtn{
		margin-top: -10px;
	}
} */

@media (min-width: 1200px){
.summaryBtn {
    margin-top: -10px;
}
.summaryImg {
    width: 50%;
    float: right;
    /* margin-right: 0%; */
    padding-bottom: 5px;
}

}

a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
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

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 9;
  /* background-color: white; */
}

.first-col {
 /*  width: 100px;
  min-width: 100px;
  max-width: 100px; */
  left: 0px;    
}

.second-col {
    left: 30px;
}
.third-col {
    min-width: 100px;
    max-width: 100px; 
    left: 80px;
}
.fourth-col {
    min-width: 200px;
    max-width: 200px;
    left: 195px;
}

</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	  $("#searchBills").val($("#bill").val());
		$("#searchBills").focus();  
		 $('#mySearch').click(function(){
		        var search = $('#searchBills').val();
		        return searchBills(search,'','0','${flowLocation}');
		    })
		    $('#searchBills').keypress(function(e){
		        if(e.which == 13){//Enter key pressed
		            $('#mySearch').click();//Trigger search button click event
		        }
		    });
	//$("#billDate").trigger("click");
			debugger;
			 var total = [];
			   var totalAmt=0.0;
			   $('.totalAmount').each( function(){
					 total.push( $(this).text() );  
			   	     });
				
				for (var i = 0; i <total.length; i++) {
					totalAmt+= total[i] << 0;
				}
				if(totalAmt< 0)
					totalAmt= totalAmt * (-1);
					
				$('#totalAmt').text(parseFloat(totalAmt+0.00).toFixed(2));
	
	
	
});


</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
 
  <div class="box box-primary">
                   <div class="box-header" align="center">
						<c:if test="${status == 'Pending'}">
							<h3 class="box-title">
								<spring:message code="pending.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'Cancelled'}">
							<h3 class="box-title">
								<spring:message code="cancelled.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'Exchanged'}">
							<h3 class="box-title">
								<spring:message code="exchange.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'Returned'}">
							<h3 class="box-title">
								<spring:message code="returned.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
							<c:if test="${status == 'Completed'}">
							<h3 class="box-title">
								<spring:message code="completed.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'HD'}">
							<h3 class="box-title">
								<spring:message code="home.delivery.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'all'}">
							<h3 class="box-title">
								<spring:message code="all.bills.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'open'}">
							<h3 class="box-title">
								<spring:message code="credit.label" /> <spring:message code="bills.label" />
							</h3>
						</c:if>
						<c:if test="${status == 'Draft'}">
	                     <h3 class="box-title">
		                      <spring:message code="all.void.bills.label" /> 
	                     </h3>
</c:if>
					</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                
         <!--  <div class="row"> -->
          
          <div class="col-lg-11" style="padding: 10px 20px;width: 88%;background: #f1f1f1">
           <div class="row">
              <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                      <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
                      
                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding: 0px;">
                           <label><spring:message code="billing_counter_id.label"/></label>
                         
                           <select class="form-control" id="counterId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
                           		
	                            <c:if test = "${flowLocation !='warehouse'}">
	                            <c:forEach var="countersList" items="${countersList}">
									<option value="${countersList}" ${countersList == counterId ? 'selected' : ''} id="${countersList}" >${countersList}</option>
						 		</c:forEach>
						 		</c:if>
						 		
						 		
                           		 <c:if test = "${flowLocation=='warehouse'}">
	                            <c:forEach var="countersList" items="${counterDetails.warehouseCountersList}">
									<option value="${countersList.counterName}" ${countersList.counterName == counterId ? 'selected' : ''} id="${countersList.counterName}" >${countersList.counterName}</option>
						 		</c:forEach>
	                       </c:if>
	                        </select>
                      </div>
                      </div>
               
                 <div class="col-lg1-2 col-lg-2">
	            
               <div class="col-lg-12" style="padding: 0px;">
                 <label>Sales Channel</label>
	             		<select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
                    			<option value=""><spring:message code="ALL.label"/></option>
								<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
								<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
								<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
								<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
                 		</select>
          
                      </div>
                      </div>        
                      
                      
         
         
                    
                      
                      <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startDate}" style="background-color: white;    padding-left: 5px !important;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	            <input type="hidden" id="sd" value="${startdate}">
	            <input type="hidden" id="flowLocations" value="${flowLocation}">



         

                     </div>
          
                      <div class="row">
                       <div class="col-lg1-2 col-lg-3">
	            
               <div class="col-lg-12" style="">
                 <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="outletLocation" onchange="countersByLocation('outletLocation','counterId');">
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
							<%-- <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					<%-- <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.description}-${location.locationId}</option> --%>
	 					</c:forEach>
                 </select>
	           
	        </div>
	        </div>
	        
	        <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
	        
	        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
                      
                 <c:if test = "${tester=='tester'}">

                      <div class="col-lg1-2 col-lg-2">
	            
               <div class="col-lg-12" style="padding: 0px;">
                 <label><spring:message code="billType.label"/></label>
	             <select class="form-control form-group" id="billType" style=" padding-left: 5px !important;" onchange="">
                     	
                     	<c:if test = "${status=='' or status=='TA' or status=='HD' }">
                     	<option value=""><spring:message code="ALL.label"/></option>
                     	<option value="TA" ${status == "TA" ? 'selected' : ''}>Take Away</option>
                     	<option value="HD" ${status == "HD" ? 'selected' : ''}>Door Delivery</option>
                    </c:if>
                    <c:if test = "${status=='Completed' or status=='Delivered' or status=='completedBills' or status=='TA-Completed'}">
                    <option value="Completed"><spring:message code="ALL.label"/></option>
                     	<option value="TA-Completed"   ${status == "TA-Completed" ? 'selected' : ''} >Take Away</option>
                     	<option value="Delivered"     ${status == "Delivered" ? 'selected' : ''}>Door Delivery</option>
                    </c:if>
                 </select>
	           

          
                      </div>
                      </div>
         			</c:if>
         			
         			<c:if test="${tester!='tester'}">
         			 <div class="col-lg1-2 col-lg-2">
         			 </div>
         			
         			</c:if>
                      
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${endDate}" style="background-color: white;     padding-left: 5px !important;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                      
                      
                     
                      
              </div>  
          
          </div>
          
          <div class="col-lg-1" style="padding-bottom: 4px;background: #D8D8D8;    width: 12%;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchBills('','','0','${flowLocation}');" class="button" ><spring:message code="searchbutton.label" /></a>
                  </div>
                   
                  
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label" /></a>
                  </div>
        <%--          <c:if test = "${tester=='tester'}">
                 <div class="row" style="height: 63px;">
                   
                  </div>
                  </c:if>--%>
                  </div>
                  
            </div>
	       
	      <div class="row">
                <div class="col-lg-12"></div>
                <%-- <div class="col-lg-1 summaryBtn" style="margin-top: 5px">
                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;" onclick="getBillSummary();" >
                </div> --%>
          </div>
          <br>
          
          
				                    <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewBills('','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-10 col-xs-10 ">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="" id="searchBills" placeholder="<spring:message code="search.bills.label" />" />
											<button id="mySearch" class="searchbutton"></button>
										<input type="hidden" id="bill" value="${searchName}">
				                    </div></div>
				                    <div class="col-lg-1" style="">
                                      <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="searchBills('','save','0','${flowLocation}');" value="SAVE"/>
                                      <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                                   </div>
                                  
				                  </div>
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="sl.no.label" /></th>
                                            	<th><spring:message code="location.label" /></th>
                                            	<th><spring:message code="counter.delete.label" /></th>
                                            	<th>Cashier Id </th>
                                            	<th>Yearly Bill ID</th>
                                            	<th><spring:message code="serialbillid.label" /></th>
                                            	<th id="billId" class="columnSort"  style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="billing_id.label" /></th>
                                            	<th><div><spring:message code="Paymentmode.label" /></div></th>
                                            	<th><div><spring:message code="sales.channel" /></div></th>
                                            	<th><div><spring:message code="billed.type.label" /></div></th>
                                            	<th>No.Of Items</th>
                                            	  
                                            	<th id="businessDate" class="columnSort"  style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;"><spring:message code="billing_date.label" /></th>
                                            	
                                                
                                                <th id="totalPrice" class="columnSort"  style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="billing_total_price.label" /></th>
                                                
                                                <%-- <th id="dueAmount" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="billing_due_amount.label" /></th> --%>
                                                <th id="status" class="columnSort"  style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="billing_status.label" /></th>
                                                <th>Sync Status</th>
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                           <c:forEach var="billingDetails" items="${billDetails}">
                                        	 <tr>
                                        	 	<td>${billingDetails.slNo}</td>
                                        	 	<td>${billingDetails.store_location}</td>
                                        	 	<td>${billingDetails.counterId}</td>
                                        	 	<td>${billingDetails.cashierId}</td> 
                                        	 	<td>${billingDetails.serailBillIdYearly}</td>
                                        	 	<td>${billingDetails.serialBillId}</td>
                                        	 	<td>${billingDetails.billId}</td>
                                        	 	<td>${billingDetails.transactionMode}</td>
                                        	 	<td>${billingDetails.billingChannel}</td>

                                        	 	<c:choose>
                                        	 	<c:when test="${billingDetails.offlineBill == '0' || billingDetails.offlineBill == 'false'}">
                                        	 	<td><spring:message code="online.label"/></td>
                                        	 	</c:when>
                                        	 	<c:otherwise>
                                        	 	<td><spring:message code="offline.label"/></td>
                                        	 	</c:otherwise>
                                        	 	</c:choose>
                                        	 	<td>${billingDetails.noOfItems}</td>
                                                <td>${billingDetails.businessDate}</td>
                                            	
                                               <fmt:formatNumber var="totalPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${billingDetails.totalPrice}" />
                                                <td class="totalAmount">${totalPrice}</td>
                                                <%-- <td>${billingDetails.dueAmount}</td> --%>
                                                 <td >${billingDetails.status}</td>
                                                  <c:set var = "theString" value = "${billingDetails.status}"/>
                                                
                                                  <c:if test="${billingDetails.billSyncStatus == 'true'}">
                                                  <td >1</td>
                                                  </c:if>
                                                   <c:if test="${billingDetails.billSyncStatus == 'false'}">
                                                  <td >0</td>
                                                  </c:if>
                                                
											<td>
										<!-- 	billingDetails.status == 'TA-Returned' -->
											<a style="color: #2e7ea7 !important; cursor: pointer;"
												onclick="viewBillDetails('${billingDetails.billId}','${flowLocation}','','view','${billingDetails.store_location}');">
												<spring:message	code="view.label" /></a>&nbsp;&nbsp;&nbsp;
													<%-- <c:if test="${billingDetails.status == 'TA-Completed' || billingDetails.status =='TA-Pending' || billingDetails.status == 'TA-RE-Items'}"> --%>
												<c:if 	test="${!fn:containsIgnoreCase(theString,'TA-Cancelled')}">
													<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
														<c:if
															test="${accessControl.appDocument == 'BillingAndPayments' && accessControl.write == true}">
															<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="viewBillDetails('${billingDetails.billId}','${flowLocation}','','edit','${billingDetails.store_location}');"><spring:message
																	code="edit.label" /></a>
														</c:if>
													</c:forEach>
												</c:if>
												<%-- </c:if>  --%>
												</td>
										</tr>
										<c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                                           
                                   <%--       <c:set var="totalamountValue" value="0"  />
                                            <c:forEach var="billingDetails" items="${billDetails}">
                                             <fmt:formatNumber var="totalamountValue" pattern="####.##" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalamountValue+(billingDetails.totalPrice)}" />
                                            </c:forEach>
                                                                                         <fmt:formatNumber var="totalamountValue" pattern="####.##" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalamountValue+(billingDetails.totalPrice)}" />
                                            
                                            
                                             --%>
                                         
                                          <c:if test="${dataExists == 'true'}">
                                         <tr>
                                         
                                         <c:set var="totalamountValue" value="0"  />
                                        <c:set var="grandtotalamountValue" value="${grandTotalValue}"  />
                                         
                                            <c:forEach var="billingDetails" items="${billDetails}">
                                            <c:set var="totalamountValue" value="${totalamountValue+((billingDetails.totalPrice))}" scope="page" />
                                             </c:forEach>
                                            
                                            <fmt:formatNumber var="totalamountValue" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalamountValue}" />
                                            <fmt:formatNumber var="grandtotalamountValue" type="number" minFractionDigits="2" maxFractionDigits="2" value="${grandTotalValue}" />  
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                              <td></td>

 											<td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white">Grand Total</font></div></td>
                                            <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${grandtotalamountValue}</div></td>
                                            
                                            <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white">Page Total</font></div></td>
                                            <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalamountValue}</div></td>
                                         	<td></td>
                                         	<td></td>
                                         
                                         </tr>
                                         
                                           
                                         </c:if>
                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                           
                                           
                                        </tbody>
                                    </table>
                                    </div>
             <div class="row" style="padding-right: 15px;">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBills('','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBills('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBills('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBills('','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	<div class="col-lg-7" style=""></div>
              	
              	 	<div class="col-lg-1" style="padding-right: 0px;">
              		<select class="form-control" id="pagination"  onfocus='this.size=10;' onblur='this.size=1;' 
        onchange='this.size=1; this.blur();'>
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-1" style="padding-right: 0px;">
              		  <input type="button" onclick="viewBills('',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		
              		
              		
              		
              		<%--  <div class="col-lg-4" style=" text-align: right;    padding-right: 14px; " >
             <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 39px;padding-right: 0px;height: 29px;margin-left: 306px;border-radius: 5px;background: #ccc;">
                 <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px"><b>Total Amount    :</b></div>
					<div class="col-lg-6 col-sm-6"  style="text-align: left;font-weight: bolder;font-size: 16px;">${totalamountValue}</div>
           	</div> --%>
              	
              		
              	
             <%--  	<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="/* text-align: right; */padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
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
              		  <input type="button" onclick="viewBills('',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div> --%>
              </div>    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
             <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
             <i class="billsPopUpUpArrow" aria-hidden="true"></i>
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" style="text-align: center;"><div id="locationLable"></div><div id="dateLable"></div></h3>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
  
</div>
</div>
</section>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable(
             		{
             			  "bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
        <c:choose>
        <c:when test="${status=='all'}">
         <input type="hidden" id="billStatus" value="">
        </c:when>
        <c:otherwise>
         <input type="hidden" id="billStatus" value="${status}">
        </c:otherwise>
        </c:choose>
       <c:if test = "${tester=='tester'}">
       <input type="hidden" id="tester" value="tester">
       </c:if>
       
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>