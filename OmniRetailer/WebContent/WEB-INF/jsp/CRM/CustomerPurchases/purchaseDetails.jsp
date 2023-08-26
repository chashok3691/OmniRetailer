<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
th {
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
	border-color : #CCC;
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
}
</style>
</head>
<body>

<div class="box-body table-responsive">
 <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewPurchases('','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-11 col-xs-10">
				                      	 <input type="text"  class="form-control searchItems" style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="searchBills" placeholder="<spring:message code="search.bills.label" />" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div>
										<input type="hidden" id="bill" value="${searchName}">
				                    </div>
				                  </div>
				                  
       <table id="example1" class="table table-bordered table-striped">
           <thead style="background-color: #3c8dbc; color: #ffffff">
               <tr>
                   <th><spring:message code="s.no.label" /></th>
                   <th><spring:message code="name.label" /></th>
                   <th><spring:message code="contact.number.label" /></th>
                   <th><spring:message code="region.label" /></th>
                   <th><spring:message code="order_delivery_type.label" /></th>
                   <th><spring:message code="bill.date.label" /></th>
                   <th><spring:message code="total.price.label" /></th>
                   <th><spring:message code="billing_due_amount.label" /></th>
                   <th><spring:message code="discount.label" /></th>
                  <%--  <th><span style="margin-left:55px;"><spring:message code="action.label" /></span></th> --%>
               </tr>
           </thead>
           <tbody style="text-align: center;">
            <c:forEach var="purchaseDetails" items="${billsList}" varStatus="theCount">
             <tr>
                 <td>${theCount.count}</td>
                 <td>${purchaseDetails.customerName}</td>
                 <td>${purchaseDetails.phoneNumber}</td>
                 <td>${purchaseDetails.store_location}</td>
                 <td>${purchaseDetails.deliveryType}</td>
                 <td>${purchaseDetails.bill_date}</td>
                 <td>${purchaseDetails.totalPrice}</td>
                 <td>${purchaseDetails.dueAmount}</td>
                 <td>${purchaseDetails.totalDiscount}</td>
			</tr>
            </c:forEach>
          
           </tbody>
       </table>
       
        <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPurchases('','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPurchases('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPurchases('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPurchases('','${totalValue}')">
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
         $('#example2').dataTable({
             "bPaginate": true,
             "bLengthChange": false,
             "bFilter": false,
             "bSort": true,
             "bInfo": true,
             "bAutoWidth": false
         });
         $("#example1").dataTable(
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
</body>
</html>