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
<%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
</head>
<style>
.columnpadding{
padding-left: 0px;
padding-right: 0px;
}
.netamount{
border-bottom: 1px solid grey;
    border-top: 1px solid grey;
    padding-bottom: 25px;
    padding-top: 5px;
    /* margin-left: 23px; */
    /* margin-right: 35px; */
    
}

#talkbubble {
   width: 30px;
    height: 20px;
   position: relative;
   -moz-border-radius:    10px;
   -webkit-border-radius: 10px;
   border-radius:         10px;
}
#dateLable{
    display: inline-block;
    float: right;
    /* right: 99px; */
    margin-right: 47px;
}
#locationLable{
    display: inline-block;
}
/* #talkbubble:before {
   content:"";
   position: absolute;
   right: 100%;
   top: 26px;
   width: 0;
   height: 0;
   border-top: 13px solid transparent;
   border-right: 26px solid red;
   border-bottom: 13px solid transparent;
} */
@media only screen and (max-width:479px)
{
.columnpadding{
padding-left: 15px;
padding-right: 15px;
}
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
});


</script>
<body>
<c:set var="qty" value="0" scope="page" />
<c:set var="items" value="0" scope="page" />
<c:set var="qtyissued" value="0" scope="page" />
<c:set var="qtyitems" value="0" scope="page" />
<div class="row">

<div class="col-lg-12 col-sm-12 col-xs-12" style="    font-size: 16px;font-weight: 600;">
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summary.indentiems.label" /></div>
<div class="col-lg-4 col-sm-4">:
   <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qty" value="${qty+summaryList.totalRequestedItems}" scope="page" />
</c:forEach>
${qty}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summary.indentqty.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="items" value="${items+summaryList.totalRequestedQty}" scope="page" />
</c:forEach>
${items}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summary.issueditems.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qtyitems" value="${qtyitems+summaryList.totalIssuedItems}" scope="page" />
</c:forEach>
${qtyitems}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summary.issuedqty.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qtyissued" value="${qtyissued+summaryList.totalIssedQty}" scope="page" />
</c:forEach>
${qtyissued}
</div>
</div>
<div class="col-lg-12" style="border-bottom: 3px solid #ccc"></div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summary.qtyvariance.label" /></div>
<div class="col-lg-4 col-sm-4">
:  
${items-qtyissued}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summary.qtyvarianceper.label" /></div>
<div class="col-lg-4 col-sm-4">
  <fmt:formatNumber var="formattedBillableTime" type="number" minFractionDigits="2" maxFractionDigits="2" value="${(items-qtyissued)/(items)*100}" />
:
${formattedBillableTime}
</div>
</div>
<div class="col-lg-12" style="border-bottom: 3px solid #ccc"></div>
<%--      <table id="example1" class="table table-bordered table-striped" style="margin-left: 0px; width: 100%;">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	 <th><div style=""><spring:message code="summary.sno" /></div></th>
                             	 <th><spring:message code="summary.status" /></th>
                                 <th><spring:message code="summary.totalIssedQty" /></th>
                                 <th><spring:message code="summary.itemPrice" /></th>
                                 <th><spring:message code="summary.totalStockIssues" /></th>
                                 <th><spring:message code="summary.totalIssuedItems" /></th>
                                 <th><spring:message code="summary.totalRequestedQty" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                         <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
                             <tr>
                            	 <td>${thecount.index+1}</td>
                            	 <td>${summaryList.status}</td>
                                 <td>${summaryList.totalIssedQty}</td>
                                 <td> ${summaryList.itemPrice}</td>
                                 <td> ${summaryList.totalStockIssues}</td>
                                   <td> ${summaryList.totalIssuedItems}</td>
                                     <td> ${summaryList.totalRequestedQty}</td>
 							</tr>
                             </c:forEach>
                         </tbody>
                     </table> --%>
				<%-- 	<div class="col-lg-12">
					<spring:message code="summary.totalquantity" />:
					<br>
					<spring:message code="summary.totalest.label" />:
					</div> --%>



</div>


<!-- order summary -->
</div>
</body>
</html>