<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<!-- <style type="text/css">
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
</style> -->
</head>
<body>
 <div class="col-lg-1 col-xs-2" style="margin-top:-20px;margin-left:0px">
				                      <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;margin-left:0px" onchange="searchAvgStock('0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
<div class="box-body table-responsive">




<!--added by manasa  -->
   
				                      <br>
				                      <!--/..added by manasa  -->
        <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
               <tr>
                  <%--  <th><spring:message code="s.no.label" /></th> --%>
                   <th><spring:message code="date.label" /></th>
	                   <th><spring:message code="skuid.label" /></th>
	                   <th><spring:message code="product.description.label" /></th>
                   <th><spring:message code="opening.stock.label" /></th>
                     <th>Sale Qty</th>
                       <th>Return Qty</th>
                         <th>Exchange Qty</th>
                           <th>Loss Qty</th>
                            <th>GRN Qty</th>
                   <th><spring:message code="closing.stock.label" /></th>
                   <th>Diff Stock</th>
               </tr>
           </thead>
           <tbody style="text-align: center;">
            <c:forEach var="avgInv" items="${averageInventoryValuesList}" varStatus="theCount">
        
            <c:if test="${!theCount.last}">
             <tr>
                 <td>${avgInv.date}</td>
	                 <td>${avgInv.skuId}</td>
	                 <td>${avgInv.itemDesc}</td>
                 <td>${avgInv.openStock}</td>
                 <td>${avgInv.quantity}</td>
                 <td>${avgInv.returnQty}</td>
                 <td>${avgInv.exchangeQty}</td>
                    <td>${avgInv.lossStock}</td>
                 <td>${avgInv.grnStock}</td>
                 <td>${avgInv.closedStock}</td>
                    <td>${avgInv.diffStock}</td>
             
			</tr>
			</c:if>
            </c:forEach>
          
           </tbody>
       </table></div>
   </div><!-- /.table-responsive -->
   <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchAvgStock('${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchAvgStock('${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchAvgStock('${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchAvgStock('${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	
              	
              	   	
<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="searchAvgStock(document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div> 
              	<!--/..modified by manasa  -->
              	
              	
             
   <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
  <!-- page script -->
 <script type="text/javascript">
     $(function() {
         $("#example1").dataTable({
        	 "bInfo": false
         });
         $('#example2').dataTable({
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