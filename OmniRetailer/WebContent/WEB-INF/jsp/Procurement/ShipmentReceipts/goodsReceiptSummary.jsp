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
.modal-body {
    padding: 12px;
    padding-top: 0px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
});


</script>
<body>
<c:choose>
<c:when test="${not empty stockRequestsList.responseMessage}">
<p>${stockRequestsList.responseMessage}</p>
</c:when>
<c:otherwise>

<c:set var="qty" value="0" scope="page" />
<c:set var="items" value="0" scope="page" />
<c:set var="qtyissued" value="0" scope="page" />
   <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">

<div class="row" style="    background: #fff;padding: 3px 0px;">
<div class="col-lg-2 nopadding" style="text-align: center;">S No</div>
<div class="col-lg-6 nopadding">Description</div>
<div class="col-lg-2 nopadding" style="text-align:center;">PO</div>
<div class="col-lg-2 nopadding" style="text-align:center;">GRN</div>
</div>
<div class="row">
<div class="col-lg-2 nopadding" style="text-align: center;">1</div>
<div class="col-lg-6 nopadding">Total Business Documents</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalPORef}</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalGrns}</div>
</div>
<div class="row">
<div class="col-lg-2 nopadding" style="text-align: center;">2</div>
<div class="col-lg-6 nopadding">No Of Items</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalOrderedItems}</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalItemsSupplied}</div>
</div>
<div class="row">
<div class="col-lg-2 nopadding" style="text-align: center;">3</div>
<div class="col-lg-6 nopadding">Cost Of the items</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totPOItemCost}</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.itemPrice}</div>
</div>
<div class="row">
<div class="col-lg-2 nopadding" style="text-align: center;">4</div>
<div class="col-lg-6 nopadding">Received Items Qty</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalOrderedItemsQty}</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalSuppliedQty}</div>
</div>
<div class="row">
<div class="col-lg-2 nopadding" style="text-align: center;">5</div>
<div class="col-lg-6 nopadding">Net Cost of the Received items</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totPOItemCost}</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totNetCost-summaryList.totTax}</div>
</div>
<div class="row">
<div class="col-lg-2 nopadding" style="text-align: center;">6</div>
<div class="col-lg-6 nopadding">Tax</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totalPORef}</div>
<div class="col-lg-2 nopadding" style="text-align:center;">${summaryList.totTax}</div>
</div>
<div class="row" style="    background: #fff;padding: 3px 0px;">
<div class="col-lg-2 nopadding"></div>
<div class="col-lg-6 nopadding">
Net Cost of the GRN
</div>
<div class="col-lg-4 nopadding" style="    text-align: right;
    right: 30px;">
${summaryList.totNetCost}
</div>
</div>

</c:forEach>
<%-- <div class="col-lg-12 col-sm-12 col-xs-12" style="    font-size: 16px;font-weight: 600;">
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarygrn.indentiems.label" /></div>
<div class="col-lg-4 col-sm-4">:
   <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qty" value="${qty+summaryList.totalOrderedItems}" scope="page" />
</c:forEach>
${qty}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarygrn.indentqty.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="items" value="${items+summaryList.totalOrderedItemsQty}" scope="page" />
</c:forEach>
${items}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarygrn.issueditems.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qtyitems" value="${qtyitems+summaryList.totalItemsSupplied}" scope="page" />
</c:forEach>
${qtyitems}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarygrn.issuedqty.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qtyissued" value="${qtyissued+summaryList.totalSuppliedQty}" scope="page" />
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

</div>

 --%>
<!-- order summary -->
</div>
</c:otherwise>
</c:choose>
</body>
</html>