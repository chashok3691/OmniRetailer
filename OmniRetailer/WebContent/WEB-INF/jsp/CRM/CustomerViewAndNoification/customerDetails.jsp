<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">


<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
<style type="text/css">
/* th {
	background-color:  #F0F0F0 !important;
	color: #666 !important;
}

.odd{
    background-color: #fff;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover{
	background-color: #F0F0F0 !important;
	color: #666 !important;
	/* border: 1px solid #f4f4f4 !important; */
/*	border-color : #CCC;
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
} */
</style>
<style type="text/css">
  /* .dataTables_wrapper{
	overflow-x : auto;
}  */
/* .buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
} */
/* a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 7px 5px 7px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
} */
</style> 
<script type="text/javascript">
$(document).ready(function(){
$("#searchCustomers").val($("#customersSearch").val());
$("#searchCustomers").focus();
$('#searchCustomers').on('input',function(e){
	if($(this).val().trim()==""){
		getCustomers('0');
	}
});

$('#mySearch').click(function(){
    var search = $('#searchCustomers').val();
    return getCustomers('0');
})
$('#searchCustomers').keypress(function(e){
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
});


});
</script> 
</head>
<body>

<div class="box-body table-responsive">
	<div class="row">
	<div class="col-lg-12 col-xs-12" style="padding-right:0px;padding-left:8px;">
	<br>
      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;margin-left: -8px;">
               <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="getCustomers();">
              		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
              		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
              		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
             		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
              	</select>
          </div>
          
            <div class="col-lg-8 col-xs-8" style="padding-left:0px;padding-right:0px;margin-top:10px">
                      
                      <div class="wrapper">	 
                     	<input type="text"  class="form-control " value="" id="searchCustomers" placeholder="<spring:message code="search.customers.label" />"   />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
					<input type="hidden" id="customersSearch" value="${searchName}">
                    </div>
          
     <%--    <div class="col-lg-8 col-xs-9" style="margin-top: 10px;">
      	 	<input type="text"  class="form-control searchItems searchBar" value="" id="searchCustomers" placeholder="<spring:message code="search.customers.label" />"   />
			<div class="services">
    			<div class="items">
     				<ul class="matchedStringUl searchCustomers" style=""></ul>
   				</div>
			</div>
			<input type="hidden" id="customersSearch" value="${searchName}">
      	</div> --%>
      	
      	
      	<div class="col-lg-1" style="padding-left: 0px;margin-left: 8px;">
					<div class="buttons" style="margin-top: 10px;padding-top: 0px;">
				       <a onclick="displayNotificationPopup();" class="btn bg-olive btn-inline addBtn"><spring:message code="send.notification.label" />&nbsp;&nbsp;</a>
					</div>
				</div>
      	
      	 	<c:if test="${sessionScope.role == 'super admin'}"> 
              <div class="col-lg-1" style="padding-left: 0px;">
				<div class="buttons" style="margin-top: 10px;padding-top: 0px;">
				        <a onclick="return newCustomer();" class="btn bg-olive btn-inline addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
				</div>
			  </div>
            </c:if>
         <c:forEach var="accessControl" items="${sessionScope.crm}">
            <c:if test="${accessControl.appDocument == 'CustomerView' && accessControl.write == true}">
				<div class="col-lg-1" style="padding-left: 0px;">
					<div class="buttons" style="margin-top: 10px;padding-top: 0px;">
				        <a onclick="return newCustomer();" class="btn bg-olive btn-inline addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
					</div>
				</div>
			 </c:if>
		</c:forEach>
		<div class="col-lg-1" style="padding-left: 0px;">
					<div class="buttons" style="margin-top: 10px;padding-top: 0px;">
				        <a class="btn bg-olive btn-inline addBtn" data-toggle="modal" data-target="#myModalIos" style=""><spring:message code="save.label" /></a>
					</div>
				</div>
       </div>
       </div>
       <div class="row" style="padding-left: 15px;padding-right: 15px;">
       <table id="example1" class="table table-bordered table-striped">
           <thead style="background-color: #3c8dbc; color: #ffffff">
               <tr>
                   <th><div ><spring:message code="s.no.label" /></div></th>
                   <th><spring:message code="name.label" /></th>
                   <th><div ><spring:message code="contact.number.label" /></div></th>
                   <th><spring:message code="customer.mail.id.label" /></th>
                   <th><spring:message code="export.select.location.label" /></th>
                   <th><spring:message code="customerType.label" /></th>
                     <th><spring:message code="priceRangeMaster.createdDateStr.label" /></th>
                     <th>Reg Date</th>
                   <%-- <th><spring:message code="region.label" /></th>
                   <th><div style="width: 125px;"><spring:message code="customer.type.label" /></div></th> --%>
                   <%-- <th><div ><spring:message code="billing_total_price.label" /></div></th>
                   <th><div ><spring:message code="lastBillAmt.label" /></div></th> --%>
                  <%--  <th><spring:message code="customer.comments.label" /></th> --%>
                   <th><div ><spring:message code="action.label" /></div></th>
               </tr>
           </thead>
           <tbody style="text-align: center;">
            <c:forEach var="customerDetails" items="${customerDetailsList}" varStatus="theCount">
             <tr>
                 <td>${customerDetails.slNo}</td>
                 <td style="text-align:left !important;">${customerDetails.name}</td>
                 <td>${customerDetails.primaryContactNumber}</td>
                 <td>${customerDetails.email}</td>
                 <%-- <td>${customerDetails.locality}</td>
                 <td>${customerDetails.category}</td> --%>
                 <td>${customerDetails.location}  </td>
                 <%-- <fmt:formatNumber var="totalPurchasesAmount" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerDetails.totalPurchasesAmount}" />
                 ${totalPurchasesAmount} --%>
                 
               
                 <td>
                 <%-- ${customerDetails.recentPurchaseAmount} --%>
                 ${customerDetails.category}
                 </td>
                 <td>${customerDetails.date_and_time}</td>
                 <td>${customerDetails.registered_on}</td>
               <%--   <td>${customerDetails.cust_feedback}</td> --%>
               <td>
	              <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerDetails('${customerDetails.phone}','view')">View</a>&nbsp;&nbsp;&nbsp;
	              <c:if test="${sessionScope.role == 'super admin'}"> 
	              	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerDetails('${customerDetails.phone}','edit')">Edit</a>
	              </c:if>
	             <c:forEach var="accessControl" items="${sessionScope.crm}">
					<c:if test="${accessControl.appDocument == 'CustomerView' && accessControl.write == true && accessControl.read == true}">
	              		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerDetails('${customerDetails.phone}','edit')">Edit</a>
	              	</c:if>
	             </c:forEach>
	          </td>
			</tr>
            </c:forEach>
          
           </tbody>
       </table>
       </div>
       		 <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px"><spring:message code="savePopUp.label" />
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="getCustomers('save')"  value="Ok">
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
		<input type="hidden" value="${filepath}" id="customerurl"/>
       <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="getCustomers('${totalValue}')">
              	</div>									
              	</c:if>
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getCustomers('${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getCustomers('${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="getCustomers('${totalValue}')">
              	</div> 
              	</c:if>
              </div>  
   </div><!-- /.table-responsive -->
   <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
  <!-- page script -->
 <script type="text/javascript">
     $(function() {
         $("#example1").dataTable({
        	 "bPaginate": false,
             "bLengthChange": false,
             "bFilter": false,
             "bSort": false,
             "bInfo": false,
             "bAutoWidth": true
         });
     });
 </script>
</body>
</html>