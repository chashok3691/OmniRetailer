<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cust Purchase Details</title>
<link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
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
	/*border-color : #CCC;
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
} */
</style>
<script type="text/javascript">
$(document).ready(function(){
$("#searchCustomersForPurchases").val($("#customersSearch").val());
$("#searchCustomersForPurchases").focus();
$('#searchCustomersForPurchases').on('input',function(e){
	if($(this).val().trim()==""){
		getCustomerPurchases('0');
	}
});
});
</script>
</head>
<body>
<div class="box-body table-responsive">
			<div class="row">
			<div class="col-lg-12">
                  <div class="col-lg-1 col-xs-2" style="padding-left: 0px; padding-right: 0px;">
                   	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="getCustomerPurchases('0');">
                   		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
                   		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
                   		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
                  		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
                   	</select>
                   </div>
                  <div class="col-lg-10 col-xs-10">
                   	 <input type="text"  class="form-control searchItems searchBar" style="" value="" id="searchCustomersForPurchases" placeholder="<spring:message code="search.customers.label" />" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchCustomersForPurchases" style=""></ul>
		   				</div>
					</div>
				<input type="hidden" id="customersSearch" value="${searchName}">
                 </div>
                 
                 <div class="col-lg-1 col-xs-2" style="padding-left: 0px; padding-right: 0px;">
					<div class="buttons" style="padding-top: 0px;">
				        <a class="btn bg-olive btn-inline addBtn" data-toggle="modal" data-target="#myModalIos" style=""><spring:message code="save.label" /></a>
					</div>
				</div>
                 </div>
               </div>
		
		<div class="row">
		<div class="col-lg-12" style="overflow-x: auto;width:100%;display: inherit;white-space: nowrap;">
        <table id="example1" class="table table-bordered table-striped" >
           <thead style="background-color: #3c8dbc; color: #ffffff">
               <tr>
                  <th><div ><spring:message code="s.no.label" /></div></th>
                   <th><spring:message code="name.label" /></th>
                   <th><div ><spring:message code="contact.number.label" /></div></th>
                   <th><spring:message code="customer.mail.id.label" /></th>
                  <%--  <th><spring:message code="region.label" /></th>
                   <th><div style="width: 125px;"><spring:message code="customer.type.label" /></div></th> --%>
                   <th><div ><spring:message code="total.purchases.label" /></div></th>
                   <th><div ><spring:message code="recent.purchase.label" /></div></th>
                   <th>Store Location</th>
                   <th><div >Referral Id</div></th>
                   <th>First Visit Date</th>
                  <%--  <th><spring:message code="customer.comments.label" /></th> --%>
                   <th><div ><spring:message code="action.label" /></div></th>
               </tr>
           </thead>
           <tbody style="text-align: center;">
            <c:forEach var="customerDetails" items="${customerDetailsList}" varStatus="theCount">
             <tr>
                <td>${customerDetails.slNo}</td>
                 <td>${customerDetails.name}</td>
                 <td>${customerDetails.primaryContactNumber}</td>
                 <td>${customerDetails.email}</td>
                 <%-- <td>${customerDetails.locality}</td>
                 <td>${customerDetails.category}</td> --%>
                   <td>
                 <fmt:formatNumber var="totalPurchasesAmount" type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerDetails.totalPurchasesAmount}" />
                 ${totalPurchasesAmount}</td>
                  <td><fmt:formatNumber var="recentPurchaseAmount" type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerDetails.recentPurchaseAmount}" />
                 ${recentPurchaseAmount}</td>
                <td>${customerDetails.storeLocation}</td>
                 <td>${customerDetails.b2breferralId}</td> 
                <td>${customerDetails.firstVisitDate}</td>
               <%--   <td>${customerDetails.cust_feedback}</td> --%>
               <td>
	              <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return getCustomerPurchaseDetails('${customerDetails.phone}','0')"><spring:message code="purchases.label" /></a>&nbsp;&nbsp;&nbsp;
	            </td>
			</tr>
            </c:forEach>
          
           </tbody>
       </table>
       </div>
       </div>
       
  <div id="triggerEvent"></div>     
 <div class="modal fade" id="myModal" role="dialog" >
  <div class="modal-dialog" style="width:83%! important;margin-top: 6%;margin-left: 16%;  ">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <center><h4 class="modal-title"><spring:message code="purchases.label" /></h4></center>
        </div>
        <div class="modal-body" >
        <div id="purchaseDetails">
        
        </div>
        </div>
        <div class="modal-footer" style="margin-top: -39px;">
         <center><button type="button"  class="btn btn-default" data-dismiss="modal">Close</button></center>
        </div>
      </div>
  	 </div>
  </div>
  
  
  
  <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="margin-left: 45%;margin-top: 0%; border-radius: 0;">
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
 <input type="button" class="iosclosebutton1"  onclick="getCustomerPurchases('save')"  value="Ok">
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="getCustomerPurchases('${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getCustomerPurchases('${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getCustomerPurchases('${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="getCustomerPurchases('${totalValue}')">
              	</div> 
              	</c:if>
              </div>    
       
   </div><!-- /.table-responsive -->
   <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
  <!-- page script -->
 <script type="text/javascript">
     $(function() {
        /*  $("#example1").dataTable({
        	 "bInfo": false
         }); */
         /* $('#example2').dataTable({
             "bPaginate": true,
             "bLengthChange": false,
             "bFilter": false,
             "bSort": true,
             "bInfo": true,
             "bAutoWidth": false
         }); */
         $("#example1").dataTable({
			  "bPaginate": false,
              "bLengthChange": false,
              "bFilter": false,
              "bSort": false,
              "bInfo": false,
              "bAutoWidth": false
		});
     });
 </script>
</body>
</html>