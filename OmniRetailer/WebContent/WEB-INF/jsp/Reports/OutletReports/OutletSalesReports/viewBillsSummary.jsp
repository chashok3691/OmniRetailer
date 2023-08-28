<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/billing.jsp
 * file type		        : JSP
 * description				: display total billings
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
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
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
</style>  
<script type="text/javascript">

</script>
</head>
<body>
    <%@ include file="savePopUp.jsp"%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                 <div class="box-body table-responsive">
                 	<div class="row">
                 		
                 		<div class="col-lg-2">
                 			<input class="form-control calendar_icon" readonly="readonly" value="${date}" style="background-color: white;" name="date" id="date" size="20" type="text" />
                 		</div>
                 		<div class="col-lg-4"></div>
                 		<div class="col-lg-2"></div>
                 
                 		<div class="col-lg-4" style="text-align: right;">
                 		</div>
                 	</div>
                  <%--   <div class="row">
                      <div class="col-lg-1" style="padding-right: 0px;text-align: right;margin-top: 5px;">
                      	<label>Show</label> 
                      </div>
                       <div class="col-lg-1">
                      	<select class="form-control" id="billMaxRecords" style="padding: 3px 4px;" onchange="generateSalesReportCriteriaWise('date','0');">
                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
                      	</select>
                      </div>
                      <div class="col-lg-6">
                      </div>
                      <div class="col-lg-3"></div>
                    </div> --%>
                    <br>
                    <br>   
              <%--    <div class="row">
                    		        <div class="col-lg-10"></div>  
                    		            
                    		    <div class="col-lg-1" style="text-align: right;margin-top: 17px;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		<input type="button" class="btn bg-olive btn-inline" onclick="viewSalesReportsCriteriaWise('','${criteria}');" style="" value="<spring:message code="back.label" />" />
		
		 </div>
		
                 
                 </div> --%>
                 
                 <div class="row">
      <div class="form-group col-lg-12">
      
    
          <div class="col-lg-12" style="text-align: right;padding-right: 0px;">
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width: 90px;font-size: 16px;    margin-right: 15px;" value="<spring:message code="save.label" />" />
		       <input type="button" class="btn bg-olive btn-inline" onclick="viewSalesReportsCriteriaWise('','${criteria}','${flowLocation}');"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
    
       </div>
    </div>
    </div>
                     <div style="overflow: auto;">
                            <table id="productstocks" class="table table-bordered table-striped">
                             <thead style="background-color: #3c8dbc; color: #ffffff">
                                    <tr>
                                    <th><spring:message code="sl.no.label" /></th>
                                    	<th id="date"><spring:message code="billing_id.label" /></th>
                                    	<th id="SerialBillId">Serial Bill ID</th>
                                    	<th id="CashierId">Cashier ID</th>
                                    	<th id="billId"><spring:message code="billing_total_price.label" /></th>
                                        <th id="counterId"><spring:message code="cash.amount.label" /></th>
                                        <th id="totalPrice"><spring:message code="card.amount.label" /></th>
                                        <th id="dueAmount"><spring:message code="returned.amount.label" /></th>
                                         <th id="dueAmount"><spring:message code="exchange.amount.label" /></th>
                                        <th id="status"><spring:message code="sodexo.amount.label" /></th>
                                        <th id="status"><spring:message code="ticket.amount.label" /></th>
                                          <th id="status"><spring:message code="creditnote.label" /></th>
                                            <th id="status"><spring:message code="giftvouchers.label" /></th>
                                              <th id="status"><spring:message code="credits.amount.label" /></th>
                                        <th><spring:message code="action.label" /></th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center;">
                                   <c:forEach var="bill" items="${billsList}" varStatus="thecount">
                                	 <tr>
                                	 <td>${thecount.count}</td>
                                        <td>${bill.billId}</td>
                                        <td>${bill.serialBillId}</td>
                                        <td>${bill.cashierId}</td>
                                    	<td>${bill.amount}</td>
                                        <td>${bill.cashAmount}</td>
                                        <td>${bill.cardAmount}</td>
                                        <td>${bill.returnAmount}</td>
                                         <td>${bill.exchangeAmount}</td>
                                        <td>${bill.sodexoAmount}</td>
                                        <td>${bill.ticketAmount}</td>
                                         <td>${bill.creditNote}</td>
                                          <td>${bill.giftvouchers}</td>
                                           <td>${bill.credits}</td>
                                        <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewBillDetails('${bill.billId}','billSummary','${criteria}','view','${bill.storeLocation}')">View</a></td>
                                    </tr>
                                   </c:forEach>
                                </tbody>
                            </table></div>
                             <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                          <%--   <input type="hidden" id="location" value="${location}"/> --%> 
                   <%--   <div class="row">
                 		<div class="col-lg-4"></div>
                 		<div class="col-lg-4">
                 		</div>
                 		<div class="col-lg-4" style="text-align: right;">
                 			<input type="button" class="btn bg-olive btn-inline" onclick="viewSalesReportsCriteriaWise('','${criteria}');" style="" value="<spring:message code="back.label" />" />
                 		</div>
                 	</div> --%>
                 	
                 	    <div class="row">
      <div class="form-group col-lg-12">
      
    
          <div class="col-lg-12" style="text-align: right;padding-right: 0px;">
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width: 90px;font-size: 16px;    margin-right: 15px;" value="<spring:message code="save.label" />" />
		       <input type="button" class="btn bg-olive btn-inline" onclick="viewSalesReportsCriteriaWise('','${criteria}','${flowLocation}');"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
    
       </div>
    </div>
    </div>
                 	
                 	
                 	  <!--  added by manasa -->
                            
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}"> 
                             <input type="hidden" id="location" value="${location}"/>
                               <input type="hidden" id="outletZone" value="${zone}"/>
                                 <input type="hidden" id="startDate" value="${startDate }"/>
                                  <input type="hidden" id="endDate" value="${endDate}"/>
                                  <input type="hidden" id="maxRecords" value="${maxRecords}"/>
                                   <input type="hidden" id="counter" value="${counterid}"/>
                                   <input type="hidden" id="flowLocation" value="${flowLocation}"/>
                                   <!-- //.. added by manasa -->
                 	
             <%-- <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('date','${totalValue}')">
	              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
			              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('date','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('date','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('date','${totalValue}')">
	              	</div> 
              	</c:if>
              </div>     --%>
               <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="viewBillSummary('${date}','0','${criteria}','true');"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
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
        <input type="hidden" id="billStatus" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>