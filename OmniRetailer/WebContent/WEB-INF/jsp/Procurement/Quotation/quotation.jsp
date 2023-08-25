<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/procurement/Quotation.jsp
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
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/quotation.js"></script>
        
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
	padding: 5px 29px 5px 7px;
	background: #3c8dbc;
	border-radius: 3px;
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
  
$("#quotationSearch").val($("#quote").val());
$("#quotationSearch").focus();
$('#quotationSearch').on('input',function(e){
	if($(this).val().trim()==""){
		viewqutation('all','Qutation','0','menu');
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
                         <div class="box-header" >
							<h3 class="box-title">
								<spring:message code="qutation.label" />
							</h3>
					</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
									<input type="hidden" id="sd" value="${startDate}">
								    <input type="hidden" id="ed" value="${endDate}">
				                    <div class="row">
								        <div class="col-lg-3" >
								           <label><spring:message code="location.label"/></label>
							               <div class="col-lg-12" style="padding-left: 0px;">
							                 <div class="col-lg-10 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
								                 <select class="form-control form-group" id="outletLocation" onchange="searchQuotation('','','0');">
<%-- 								                       <option value=""><spring:message code="ALL.label"/></option> --%>
									                   <c:forEach var="location" items="${locationsList}">
															<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
														</c:forEach>
							                   </select>
							                 </div>
								        	</div>
								        </div>
								         <div class="col-lg-5"></div>
								        <div class="col-lg-3" style="    padding-right: 0px;">
								        <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								        <label><spring:message code="offer_start_date.label"/></label>
							              <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
							                	 	<input type="hidden" id="sd" value="${startDate}">
								                    <input type="hidden" id="ed" value="${endDate}">
							                	 	<input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
							                	 </div>
								              </div>
								            </div>
								            <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								             <label><spring:message code="offer_end_date.label"/></label>
								               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
								                 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
								                 	<input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
							                	  </div>
									           </div>
									          </div></div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="padding: 4px 8px;    width: 100%;margin-top: 18px;" class="btn bg-olive btn-inline" onclick="searchQuotation('','','0')" value="<spring:message code="search" />" />
								           </div>
									      </div>
		   			 <div class="row">
				      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchQuotation('','','0')">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
				        <div class="col-lg-10 col-xs-11" style="margin-top: 10px;">
			       	 		 <input type="text"  class="form-control searchItems" value="${searchName}" id="quotationSearch" placeholder="<spring:message code="search.quotation" />" style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl Quotation" style=""></ul>
				   				</div>
							</div>
							   <input type="hidden" id="quoteRef" value="${quoteObj.quoteRef}">
							<input type="hidden" id="quote" value="${searchName}">
			       	 	</div>
		
						        	<c:if test="${sessionScope.role == 'super admin'}">
						        			<a onclick="return newQuotation();"  class="button"><font style="text-align:center" size="3px"><spring:message code="addnew.label" /></font></a>
					              
					                </c:if>
					              <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
					              
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseQuotation' &&accessControl.write == true}"> 
	                            			 <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="padding: 4px 8px;    width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="return newQuotation()" value="<spring:message code="addnew.label" />" />
								           </div>
											<!-- <a onclick="return newQuotation();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
									 -->
									</c:if>
							      </c:forEach>
						     
				       </div>
                                    <table id="receipts" class="table table-bordered table-striped" style="margin-top:0%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            
                                   
                                            
                                      
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="supplier.quotation.ref" /></th>
                                            	<%-- <th><spring:message code="from.name.label" /></th> --%>
                                                <th><spring:message code="supplierName.label" /></th>
                                               <%--  <th><spring:message code="receiptlocation.label" /></th> --%>
                                                
                                                
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="rfqList" items="${quotesList}" varStatus="theCount">
                                        	 <tr>
                                        	 
                                             
                                        	 	<td>${rfqList.sno}</td>
                                                <td>${rfqList.quoteRef}</td>
                                               <%--  <td>${rfqList.fromName}</td> --%>
                                                <td>${rfqList.supplierName}</td>
                                                
                                                   <td>${rfqList.status}</td>
                                            	
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSupplierQuotationDetails('${rfqList.quoteRef}','0','view');"><spring:message code="view.label"/></a>
                                                <c:if test="${sessionScope.role == 'super admin'}">
									        			&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSupplierQuotationDetails('${rfqList.quoteRef}','0','edit');"><spring:message code="edit.label"/></a>
								                </c:if>
								              <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
								                <c:if test="${accessControl.appSubDocument == 'WarehouseQuotation' && accessControl.write == true}">      
														&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSupplierQuotationDetails('${rfqList.quoteRef}','0','edit');"><spring:message code="edit.label"/></a>
												</c:if>
										      </c:forEach>
                                                </td>
                                                
                                                 
                                             </tr>
                                           </c:forEach>
                                        </tbody>
                                       
                                    </table>
                                    
                                           
                    
                                    
                                    
                         
                                    
                                    
     	<div class="row" style="margin-right:0%;">
    
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchQuotation('','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchQuotation('','','${index - (maxRecords+1)}';"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchQuotation('','','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchQuotation('','','${totalValue}')">
              	</div> 
              	</c:if>
              </div>     
              <%-- <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAllStockReceipts('outletGoodsTransfer','${operation}','${totalValue}')">
              	</div>									<!--viewOutletShipments('Ready','pendingOutletShipment','0')  -->
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAllStockReceipts('outletGoodsTransfer','${operation}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAllStockReceipts('outletGoodsTransfer','${operation}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAllStockReceipts('outletGoodsTransfer','${operation}','${totalValue}')">
              	</div> 
              	</c:if>
              </div> --%>                           
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