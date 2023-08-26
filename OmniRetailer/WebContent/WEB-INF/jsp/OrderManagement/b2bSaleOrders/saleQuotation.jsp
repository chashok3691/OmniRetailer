<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/procurement/requestForQuotation.jsp
 * file type		        : JSP
 * description				: The requestForQuotation form is displayed using this jsp
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
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/requestForQuotation.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2bSaleOrders.js"></script>
<style type="text/css">

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
	padding: 5px 7px 5px 7px;
	background: #3c8dbc;
	border-radius: 5px;
/* 	box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	var err = $("#err").val();
	if(err != "")
	 // alert(err);
	callCalender('from');
	callCalender('to'); 
  
$("#rfqSearch").val($("#quote").val());
$("#rfqSearch").focus();
$('#rfqSearch').on('input',function(e){
	if($(this).val().trim()==""){
		viewRequestForQuotation('rqstForQutation','0'); 
	}
});

var sDate=$("#sd").val();
var s=sDate.split(' ');
$("#from").val(s[0]);

var eDate=$("#ed").val();
var e=eDate.split(' ');
$("#to").val(e[0]); 

});



</script> 
</head>
<body>


 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary" style="width:97%;margin-left:1.5%;">
                         <div class="box-header" style="text-align: center" >
							<h3 class="box-title" style="">Sale Quotation</h3>
					</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
									<input type="hidden" id="sd" value="${startDate}">
								    <input type="hidden" id="ed" value="${endDate}">
								    
								    
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet' }">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location1','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location1','')">
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
                           <label>Quotation Start Value</label>
                             <%--  <fmt:formatNumber var="formattedBillableTime" type="number"  value="${orderDetails.orderStartValue}" /> --%>
                           <input type="text" class="form-control" name="orderStartValue"  id="StartValue"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${orderStartValue}" placeholder="Enter Order Value Start" />
                       </div>
                      </div>
                       
                         <div class="col-lg-3">
                          <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                            <label>Status</label>
                              <select class="form-control" id="Status" >
                                       <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="workflow" items="${workflowsList}">
									<option value="${workflow.statusName}" ${workflow.statusName == status ? 'selected' : ''}  >${workflow.statusName}</option>
						 		</c:forEach>
                               </select>
 	                 </div>
	            </div>
	                <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" style="background-color: white;" value="${startDate}" id="from" size="20" type="text" readOnly="readOnly" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" >
	             	<option value="">ALL</option>
	                <c:forEach var="location1" items="${locationsList}">
						<option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
					</c:forEach>
	            </select> 
                      </div>
                      </div>
                   
                       
                     
                        <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                           <label>Quotation End Value</label>
                          <input type="text" class="form-control"  name="orderEndValue" value="${orderEndValue}" id="EndValue" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" placeholder="Enter Order Value End"/>
                      </div>
                      </div>
               
		               <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                           
                      </div>
                      </div>
                          <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;" value="${endDate}"  id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          
                    </div>
                  </div>
                  <div class="col-lg-1" style="padding-right:15px;    background: #eee;    border-right: 1px solid #ccc;    width: 12%; padding-top: 7px;padding-bottom: 22px;">
                  <div class="col-lg-9" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                       <%--  <input type="button"  class="buttonsearch" onclick="searchOrders('','','0')" value="<spring:message code="search" />" /> --%>
                        <%-- <a onclick="searchOrders('','','0')" class="buttonsearch"><spring:message code="search"/></a> --%>
                   <input type="button" style="margin-top:22px" class="btn bg-olive btn-inline addBtn" onclick="showSaleQuotation('saleQuotation','0','')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a onclick="showSaleQuotation('saleQuotation','0','clear')" style="margin-top:31px"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	      
								    
		   			 <div class="row">
				      <div class=" col-lg-1 col-xs-2" style="margin-top: 10px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchRFQ('','','0')">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
				        <div class="col-lg-10 col-xs-10" style="margin-top: 10px;">
			       	 		 <input type="text"  class="form-control searchItems searchBar" value="" id="rfqSearch" placeholder="Search Sale Quotation" style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl requestQuotation" style=""></ul>
				   				</div>
							</div>
							<input type="hidden" id="quote" value="${searchName}">
			       	 	</div>
			              <div class="col-lg-1" style="padding-left: 0px;margin-top: 10px;height: 20px">
						        	
						        <a onclick="newSaleQuotation();" style="padding: 4px 8px;width: 100%" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>
							</div>
				       </div>
                                    <table id="receipts" class="table table-bordered table-striped" style="margin-top:0%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="quote.ref.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="created.date.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="customer.id.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="release.date.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="expiry.date.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="approved.by.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="quotation.value.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="status.label" /></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="saleQuotation" items="${saleQuotationList}" varStatus="theCount">
                                        	 <tr>
                                        	 	 <td>${theCount.count}</td>
                                                <td>${saleQuotation.quotationRef}</td>
                                                <td>${saleQuotation.createdDateStr}</td>
                                            	<td>${saleQuotation.customerId}</td>
                                                <td>${saleQuotation.tenderOpenDateStr}</td>
                                                <td>${saleQuotation.tenderOpenDateStr}</td>
                                                <td>${saleQuotation.customerName}</td>
                                                <td>${saleQuotation.quotationValue}</td>
                                                <td>${saleQuotation.status}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSaleQuotation('${saleQuotation.quotationRef}','view');"><spring:message code="view.label"/></a>
									        			&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSaleQuotation('${saleQuotation.quotationRef}','edit');"><spring:message code="edit.label"/></a>
								               
                                                </td>
                                                
                                                 
                                             </tr>
                                           </c:forEach>
                                        </tbody>
                                       
                                    </table>
     		<div class="row" >
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="accountingAssets('','data','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return accountingAssets('','data','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return accountingAssets('','data','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="accountingAssets('','data','','${totalValue}')">
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
              		  <input type="button" onclick="accountingAssets('','data','',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>         
                                       
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
                $("#receipts").dataTable({
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