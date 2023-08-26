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
<c:set var="totalQtyIndented" value="0"  />
<c:set var="qtyissued" value="0" scope="page" />
<c:set var="qtyitems" value="0" scope="page" />
<c:set var="totalpo" value="0" scope="page" />
<div class="row">

<div class="col-lg-12 col-sm-12 col-xs-12" style="    font-size: 16px;font-weight: 600;">
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.indentiems.label" /></div>
<div class="col-lg-4 col-sm-4">:
   <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qty" value="${qty+summaryList.totalIndentItems}" scope="page" />
</c:forEach>
${qty}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.indentqty.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="totalQtyIndented" value="${totalQtyIndented+summaryList.totalQtyIndented}" scope="page" />
</c:forEach>
${totalQtyIndented}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.issueditems.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qtyitems" value="${qtyitems+summaryList.poItemsQty}" scope="page" />
</c:forEach>
${qtyitems}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.issuedqty.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="qtyissued" value="${qtyissued+summaryList.totalPOItems}" scope="page" />
</c:forEach>
${qtyissued}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.poorders.label" /></div>
<div class="col-lg-4 col-sm-4">
:  <c:forEach var="summaryList" items="${stockRequestsList.summaryList}" varStatus="thecount">
<c:set var="totalpo" value="${totalpo+summaryList.totalPurchaseOrders}" scope="page" />
</c:forEach>
${totalpo}
</div>
</div>
<div class="col-lg-12" style="border-bottom: 3px solid #ccc"></div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.qtyvariance.label" /></div>
<div class="col-lg-4 col-sm-4">
:  
${totalQtyIndented-qtyitems}
</div>
</div>
<div class="row">
<div class="col-lg-8 col-sm-8"><spring:message code="summarypo.qtyvarianceper.label" /></div>
<div class="col-lg-4 col-sm-4">
  <fmt:formatNumber var="formattedBillableTime" type="number" minFractionDigits="2" maxFractionDigits="2" value="${(totalQtyIndented-qtyitems)/(totalQtyIndented)*100}" />
:
${formattedBillableTime}
</div>
</div>
<div class="col-lg-12" style="border-bottom: 3px solid #ccc"></div>




</div>


<!-- order summary -->
</div>
</body>
</html>