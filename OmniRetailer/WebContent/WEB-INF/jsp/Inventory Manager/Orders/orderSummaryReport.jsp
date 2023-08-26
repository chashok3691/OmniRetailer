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
 .p0_labels-inner {
display:none;
}
.p0_labels-outer{
display:none;
}
.p0_lineGroups {
display:none;
} 
 .p1_labels-inner {
display:none;
}
.p1_labels-outer{
display:none;
}
.p1_lineGroups {
display:none;
} 
 .p2_labels-inner {
display:none;
}
.p2_labels-outer{
display:none;
}
.p2_lineGroups {
display:none;
} 
 .p3_labels-inner {
display:none;
}
.p3_labels-outer{
display:none;
}
.p3_lineGroups {
display:none;
} 
 .p4_labels-inner {
display:none;
}
.p4_labels-outer{
display:none;
}
.p4_lineGroups {
display:none;
} 
 .p5_labels-inner {
display:none;
}
.p5_labels-outer{
display:none;
}
.p5_lineGroups {
display:none;
} 
 .p6_labels-inner {
display:none;
}
.p6_labels-outer{
display:none;
}
.p6_lineGroups {
display:none;
} 
 .p7_labels-inner {
display:none;
}
.p7_labels-outer{
display:none;
}
.p7_lineGroups {
display:none;
} 
 .p8_labels-inner {
display:none;
}
.p8_labels-outer{
display:none;
}
.p8_lineGroups {
display:none;
} 
 .p9_labels-inner {
display:none;
}
.p9_labels-outer{
display:none;
}
.p9_lineGroups {
display:none;
} 
 .p10_labels-inner {
display:none;
}
.p10_labels-outer{
display:none;
}
.p10_lineGroups {
display:none;
} 
 .p11_labels-inner {
display:none;
}
.p11_labels-outer{
display:none;
}
.p11_lineGroups {
display:none;
} 
 .p12_labels-inner {
display:none;
}
.p12_labels-outer{
display:none;
}
.p12_lineGroups {
display:none;
} 
 .p13_labels-inner {
display:none;
}
.p13_labels-outer{
display:none;
}
.p13_lineGroups {
display:none;
} 
 .p14_labels-inner {
display:none;
}
.p14_labels-outer{
display:none;
}
.p14_lineGroups {
display:none;
} 
 .p15_labels-inner {
display:none;
}
.p15_labels-outer{
display:none;
}
.p15_lineGroups {
display:none;
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
<%-- <div class="row">
	<div class="col-lg-12" style="text-align: center;">
		<label>${billSummaryReport.store_location}  (${billSummaryReport.startDate} - ${billSummaryReport.endDate})</label>
	</div>
</div> --%>
<div class="row">
<input type="hidden" value="${orderSummarysize}" id="ordersummary"/>
<c:choose>
<c:when test="${not empty orderSummarysize}">
<div class="col-lg-5 col-sm-5 col-xs-12" style="">
 <div id="OrdersPieChart" d3pie="0.1.6" style="margin-left: 0px;margin-top: -50px;margin-bottom: 0px;"></div>
</div>
<c:set var="orders" value="0" scope="page" />
<c:set var="items" value="0" scope="page" />
<c:set var="amount" value="0" scope="page" />
<c:set var="tax" value="0" scope="page" />
<input type="hidden" value=" ${orderSummarysize}" id="ordersummary"/>
<%-- <input type="hidden" value=" ${orderSummaryResponse.cancelOrders}" id="cancelledOrder"/>
<input type="hidden" value="${orderSummaryResponse.pendingOrders}" id="pendingOrder"/>
<input type="hidden" value="${orderSummaryResponse.pendingCartOrders}" id="draftOrder"/>
<input type="hidden" value="${orderSummaryResponse.fulFilledOrders}" id="fullfilledOrder"/> --%>
<!-- order summary start -->
<div class="col-lg-7 col-sm-7 col-xs-12" style="">
<div class="row">
<div class="col-lg-3 col-sm-3 col-xs-3 columnpadding" style=""></div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: center;">
<span style="    border-bottom: 1px solid grey;"><spring:message code="ordersummary.nooforders" /></span>
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: center;">
<span style="    border-bottom: 1px solid grey;"><spring:message code="ordersummary.noofitems" /></span>
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style=" text-align: right;">
<span style="    border-bottom: 1px solid grey;"><spring:message code="ordersummary.totalcost" /></span>
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: right;">
<span style="    border-bottom: 1px solid grey;"><spring:message code="ordersummary.tax" /></span>
</div>
<div class="col-lg-1 col-sm-1 col-xs-1 columnpadding" style=""></div>
</div>
<c:forEach var="summaryList" items="${orderSummaryResponse.summaryList}" varStatus="thecount">
<div class="row">
<div class="col-lg-3 col-sm-3 col-xs-3 columnpadding" id="" style="">
<input type="hidden" value="${summaryList.statusName}" id="workflowId${thecount.index}"/>

<div id="talkbubble" style="      
    background: ${segments[thecount.index]};
     display: inline-block;"></div><div style="display: inline-block;padding-left:5px;position: absolute;">${summaryList.statusName}</div>
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" id="workflowIdOrders${thecount.index}" style="    text-align: center;">
<input type="hidden" value="${summaryList.orders}" id="workflowOrders${thecount.index}"/>
<c:set var="orders" value="${orders+summaryList.orders}" scope="page" />
${summaryList.orders}
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: center;">
<c:set var="items" value="${items+summaryList.orderedItems}" scope="page" />
 ${summaryList.orderedItems}
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="text-align: right;">
<c:set var="amount" value="${amount+summaryList.ordersAmt}" scope="page" />
<fmt:formatNumber var="ordersAmt" type="number" minFractionDigits="2" maxFractionDigits="2" value="${summaryList.ordersAmt}" />
 ${ordersAmt}
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: right;">
<fmt:formatNumber var="formattedBillableTime" type="number" minFractionDigits="2" maxFractionDigits="2" value="${summaryList.orderTax}" />
<c:set var="tax" value="${tax+summaryList.orderTax}" scope="page" />
  ${formattedBillableTime}
</div>
<div class="col-lg-1 col-sm-1 col-xs-1 columnpadding" style=""></div>
</div>

</c:forEach>


<div class="row ">
<div class="netamount columnpadding">
<div class="col-lg-3 col-sm-3 col-xs-3 columnpadding" style="">
Net Turn Over
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: center;">
${orders}
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: center;">
${items}
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style=" text-align: right;">
<fmt:formatNumber var="totalamount" type="number" minFractionDigits="2" maxFractionDigits="2" value="${amount}" />
${totalamount}
</div>
<div class="col-lg-2 col-sm-2 col-xs-2 columnpadding" style="    text-align: right;">
<fmt:formatNumber var="totaltax" type="number" minFractionDigits="2" maxFractionDigits="2" value="${tax}" />
${totaltax}
</div>
</div>


</div>

</div>
</c:when>
<c:otherwise>

<h3 style="text-align: center;">No Orders Found</h3>
</c:otherwise>
</c:choose>

<!-- order summary -->
</div>
</body>
</html>