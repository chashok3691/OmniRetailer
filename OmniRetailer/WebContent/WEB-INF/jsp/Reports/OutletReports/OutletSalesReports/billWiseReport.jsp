<!-- 
      Written by  :Swathi
      File name   :Inventory Manager/stockAging/stockAging
      Description :This page is used to display the stock aging details
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
 </head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.fa1{
 
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
  
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
}
a.button{
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
.col-lg1-2{
    width: 20% !important;
}
.form-control {
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	callCalender('from');
	callCalender('to');
	
	$('#mySearch').click(function(){
        var searchName = $('#searchBills').val();
        return viewBillWiseReport('billWiseReport','0','outlet');
    })
    $('#searchBills').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });
	
	// added to fetch locations based on zone 
	var zone = $("#outletZone").val();
	
	 var location = $("#outletLocation").val();
	 if( zone != null && zone !="" && location!= null && location == "")
	{
		searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
	}
});
</script>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
       <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Order/Bill Wise Report
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div><!-- /.box-header --> 
             <div class="box-body table-responsive">
              <div class="col-lg-11" style="background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory"  onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
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
                      
                     <div class="col-lg1-2 col-lg-2">
                   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div> 
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group"  value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" onchange="searchCategorybasedonlocation('outletLocation','outletCategory','outletBrandId');">
                             <option value=""><spring:message code="ALL.label"/></option> 
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
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
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="section.label"/></label>
                           <select class="form-control" id="section" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            
	                        </select>
                      </div>
                      </div>

                      <div class="col-lg1-2 col-lg-2">
               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
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
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group"  value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style=" background: #ccc;    width: 12%;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewBillWiseReport('billWiseReport','0','outlet');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br>
                    <div class="row">
                  
                    
                 <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewBillWiseReport('billWiseReport','0','outlet');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                   <!--  <div class="col-lg-9" style="margin-top: 0px; padding-left: 0px;padding-right:7px;width: 79%;">
                      <div class="wrapper">	 
                         <input type="text" class="form-control" value="" id="searchAccount">												
					  </div>
						
                    </div> -->
                     <div class="col-lg-9 col-xs-9 " style="padding-left: 0px; width:79%;">
				     <div class="wrapper">
				     <input type="text"  class="form-control" style="" value="${searchName}" id="searchBills" placeholder="Search  Bills" />
					 <button id="mySearch" class="searchbutton"></button>
					</div>
					</div>
   	
		       
           <div class="col-lg-2" style="float:right;padding-right:15px;margin-top:0px;padding-left:0px;width: 12%;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="viewBillWiseReport('billWiseReport','0','outlet','','true');" value="Save">
            <input type="hidden" id="billwiseReporturl" value="${saveReport}">                         
           </div>
           
           </div>   
                    
                  
      <div id="example1_wrapper" class="table table-bordered table-striped" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
               
                     <table id="productstocks" class="table table-bordered table-striped">
            
                     
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                       
                             <tr>
                        <th><spring:message code="sl.no.label" /></th>
                        <th>Event ID</th>
                        <th>Event Name</th>
                       	<th>Bill Date</th>
                        <th>Event Start Date</th>
                        <th>Event End Date</th>
                        <th>Stroe Location (DPID)</th>
                        <th>Zone/Region</th>
                        <th>Invoice Number</th>
                        <th>Sold Qty</th>
                        <th>Payment Reference</th> 
                        <th>Cash Total</th>
                        <th>Card Total</th>
                        <th>UPI Total</th>
                        <th>Credit Note Issue</th>
                        <th>Exchange Amount</th>
                        <th>Sodexo Total</th>
                        <th>Ticket Total</th>
                        <th>Loyalty Claim</th>
                        <th>Credit Note Radeem</th>
                        <th>Gift Vouchers</th>
                        <th>Coupons</th>
                        <th>Others Amount</th>
                        <th>Credits Amount</th>
                        <th>Day Turnover</th>
                        <th>Net Sales</th>
                        <th>CGST</th>
                        <th>SGST</th>
                        <th>Total Tax</th>
                        <th>Discount</th>
                        <th>Gross Amount</th>
                       <!--  <th>Net Amount</th> -->
                        <th>Total Sales</th>
                        
                        </tr>
                        </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="billsReportList" items="${billsReportList}" varStatus="thecount">
                         	 <tr>
                                 <td>${thecount.count+index-1}</td>
                                <td>${billsReportList.eventId}</td>
                                <td>${billsReportList.eventName}</td>
                                <td>${billsReportList.date}</td>
                                <td>${billsReportList.eventStartDate}</td>
                                <td>${billsReportList.eventEndDate}</td>
                                <td>${billsReportList.storeLocation}</td>
                                <td>${billsReportList.zoneId}</td>
                                <td>${billsReportList.billId}</td>
                             	<td>${billsReportList.soldQty}</td>
                             	<td>${billsReportList.paymentRefNumber}</td> 
                                <td>${billsReportList.cashTotal}</td>
                                <td>${billsReportList.cardTotal}</td>
                                <td>${billsReportList.upiTotal}</td>
                                <td>${billsReportList.returnedAmt}</td>
                                <td>${billsReportList.exchangedAmt}</td>
                                <td>${billsReportList.sodexTotal}</td>
                                <td>${billsReportList.ticketTotal}</td>
                                <td>${billsReportList.loyaltyTotal}</td>
                                <td>${billsReportList.creditTotal}</td>
                                <td>${billsReportList.vouchersTotal}</td>
                                <td>${billsReportList.couponsTotal}</td>
                                <td>${billsReportList.othersAmt}</td>
                                <td>${billsReportList.creditsAmt}</td>
                                <td>${billsReportList.dayTurnOverAmt}</td>
                                <td>${billsReportList.netSales}</td>
                                <td>${billsReportList.cgst}</td>
                                <td>${billsReportList.sgst}</td>
                                <td>${billsReportList.taxAmt}</td>
                                <td>${billsReportList.discount}</td>
                                <td>${billsReportList.grossAmount}</td>
                             	<%-- <td>${billsReportList.netSales}</td> --%>
                             	<td>${billsReportList.totalSales}</td>
                             	
                             </tr>
                            </c:forEach>
             
                         </tbody>
                         
                     </table>
                     </div>
                     
                     <br>
                      
                           <div class="panel-group" id="accordion">
             <div class="col-lg-12" style="padding-right: 0px;">
               <div class="col-lg-3" >
              </div>
              
              
            <div class="col-lg-3" >
              </div>
                <div class="col-lg-9" >
              </div>
               <div class="col-lg-3" style="padding-right: 0px;" >
               <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;">
               
					
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
					 <div class="col-lg-7 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="totalsold.label" /></div>
					<div class="col-lg-5 col-sm-4">: ${totalSoldQty} </div>
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-7 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="totalsold.value.label" /></div>
					<div class="col-lg-5 col-sm-4">: ${totalSoldValue} </div>
				</div>
              </div>
            
            <div class="col-lg-6" style="">
                  
           </div>
              </div></div> 
                     
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBillWiseReport('billWiseReport','${totalValue}','outlet');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBillWiseReport('billWiseReport','${index - 11}','outlet');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" > 
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}"> 
              		<div class="form-group col-lg-2">  
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBillWiseReport('billWiseReport','${index - 11}','outlet');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewBillWiseReport('billWiseReport','${totalValue}','outlet');">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
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
              		  <input type="button" onclick="viewBillWiseReport('billWiseReport',document.getElementById('pagination').value,'outlet');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>     
              
              <input type="hidden" id="printBillReportURL" value="${printUrl}">
              
              
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>
