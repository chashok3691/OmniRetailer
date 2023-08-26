<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/Orders/orders.jsp
 * file type		        : JSP
 * description				: display order information
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
     
    </head>
    <style>
    pre {
display: block;
    padding: 0px 30px;
    margin: 0 0 0px;
    font-size: 14px;
    line-height: 1.428571;
    color: #333;
    word-break: break-all;
    word-wrap: break-word;
    background-color: #f4f4f4;
    border: 0px solid #ccc;
    border-radius: 0px;
}
    
    </style>
    
    
<body>
				<%-- <section class="content-header">
					<h1><spring:message code="outlet.management.label" />
     				<small><p id="heading"><spring:message code="billing.payment.label" /></p></small>
    			</h1>
				<ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section>
				 --%>
                <section class="content" style="background: none !important;">
                	<div class="buttons" style="float: right;">
                	<a onclick="return printbusinessdocument('Bill','${billId}','eway')" target="href" class="button"><font size="2px" style="text-decoration: underline;cursor: pointer;">eWay Bill</font></a> &nbsp;&nbsp;
	   					<a onclick="return printbusinessdocument('Bill','${billId}')" target="_blank" class="button"><font size="2px" style="text-decoration: underline;cursor: pointer;">Bill (PDF)</font></a>
	   				</div>
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                
                                <li class="active"><a href="#tab_1" data-toggle="tab"><spring:message code="billing_items.label"/></a></li>
                               
                                <li><a href="#tab_2" data-toggle="tab" target="_self"><spring:message code="billing_transactions.label"/></a></li>
                           
                                <c:if test="${!empty billDetails.billReturnItems}">
                                    <li><a href="#tab_3" data-toggle="tab" ><spring:message code="returned.bills.label"/></a></li>
                                </c:if>
                                <c:if test="${!empty billDetails.billExchangedItems}">
                                    <li><a href="#tab_4" data-toggle="tab"><spring:message code="exchange.bills.label"/></a></li>
                                </c:if>
                               
                                    <li><a href="#tab_5" data-toggle="tab">Print View</a></li>
                              
                                </ul>
                                <input type="hidden" id="outletLocation">
                                <input type="hidden" id="from" value="">
                                <input type="hidden" id="to" value="">
                                
                                  <c:forEach var="outletDetails" items="${storeDetailsList}">
                                <input type="hidden" id="cancelAllowedDays" value="${outletDetails.cancelAllowDays}">
                                <input type="hidden" id="returnAllowedDays" value="${outletDetails.returnAllowDays}">
                                </c:forEach>
                                 <input type="hidden" id="outletCategory" value="">
                                <input type="hidden" id="outletSubcategory" value="">
                                  <input type="hidden" id="counterId" value="">
                                   <input type="hidden" id="outletBrandId" value="">
                                    <input type="hidden" id="outletLocation" value="">
                                    <input type="hidden" id="searchBills" value="">
                                     <input type="hidden" id="outletZone" value="">
                                    
                                      <input type="hidden" id="maxRecords" value="${maxRecords}"> 
                                
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        			<!-- left column -->
                        			<c:if test="${type =='view'}">
                      				  <div class="col-lg-12">
                        				<%@ include file="itemdetails.jsp" %>  
                                  	 	</div>
                                  	 	</c:if>
                                  	 	<c:if test="${type =='edit'}">
                      				  <div class="col-lg-12">
                        				<%@ include file="edititemdetails.jsp" %>  
                                  	 	</div>
                                  	 	</c:if>
                                  	 	
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                    <div class="tab-pane" id="tab_2" >
                                    <div class="row">
                        			<!-- left column -->
                      				  <div class="col-lg-12">
                        				 <%@ include file="transactiondetails.jsp" %>  
                                  	 	</div>
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                    <div class="tab-pane" id="tab_3" >
                                    <div class="row">
                        			<!-- left column -->
                      				  <div class="col-lg-12">
                        				<%@ include file="returnedDetails.jsp" %>  
                                  	 	</div>
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                    <div class="tab-pane" id="tab_4" >
                                    <div class="row">
                        			<!-- left column -->
                      				  <div class="col-lg-12">
                        				  <%@ include file="exchangedDetails.jsp" %>  
                                  	 	</div>
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                        <div class="tab-pane" id="tab_5" >
                                    <div class="row">
                        			<!-- left column -->
                        			<div class="col-lg-3"></div>
						<div class="col-lg-5" style="    max-height: 600px;overflow-y: scroll;">
							<c:set var="stream" value="${billDetails.printResponse}"></c:set>
							<c:set var="data" value="${stream.printFomatMapObj}"></c:set>
							<input type="hidden" value="${data}"/>
							   <c:forEach var="map" items="${data}" varStatus="thecount">
							     <c:set var="data1" value="${map.value}"></c:set>
							       <c:if test="${map.key =='logo'}">
							      <pre style="padding:0px;font-size: 13px;"><img id="logo" style="width: 73px;" alt="Logo" src="data:image/jpeg;base64,${sessionScope.logo}"/>
							  </pre> </c:if>
							     </c:forEach>
							  <c:forEach var="labels" items="${stream.sequenceOfObject}" varStatus="thecount">
							       <c:forEach var="map" items="${data}" varStatus="thecount">
							      <c:set var="data1" value="${map.value}"></c:set>
							   <c:if test="${map.key ==labels}">
							    <c:if test="${map.key !='logo'}">
							   <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							   </c:if></c:forEach>
							  </c:forEach>
							
							
							
							
							
							       <%--  <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							   <c:if test="${map.key =='header'}">
							   <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							       <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							   <c:if test="${map.key =='customerInfo'}">
							   <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							          <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='body'}">
							   <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							     </c:forEach>
							        <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='bodyOtherDetails'}">
							      <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							    
							        <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='itemDetails'}">
							       <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							        <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='billDetails'}">
							      <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							        <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='transactionDetails'}">
							   <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							      
							       <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='taxAggregationList'}">
							   <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if>
							      </c:forEach>
							        <c:forEach var="map" items="${data}" varStatus="thecount">
							           <c:set var="data1" value="${map.value}"></c:set>
							    <c:if test="${map.key =='footer'}">
							      <pre><c:out value="${data1.content}"></c:out></pre>
							   </c:if> --%>
							   
                                          
                                         
                                        <%--     <input type="hidden" value="${data1.content}"/>
                                            </c:forEach>
 --%>
						</div>
					</div>
                                    </div><!-- /.tab-pane -->	
                                    
                                    
                                  </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->   
                               <input type="hidden" id="flow" value="${flow}" />
                               <%--  <c:if test="${billcontent == 'billItems'}">
							 		<li class="active"><a href="#tab_1" data-toggle="tab" onclick="viewBillDetails('${billId}','billItems');"><spring:message code="billing_items.label"/></a></li>
                                    <li><a href="#tab_2" onclick="viewBillDetails('${billId}','billTransactions')" data-toggle="tab"><spring:message code="billing_transactions.label"  /></a></li>
                                    <c:if test="${!empty billDetails.returnItems}">
                                    	<li><a href="#tab_3" onclick="viewBillDetails('${billId}','Returned')" data-toggle="tab"><spring:message code="returned.bills.label"  /></a></li>
                                    </c:if>
                                    <c:if test="${!empty billDetails.exchangeItems}">
                                    	<li><a href="#tab_4" onclick="viewBillDetails('${billId}','Exchanged')" data-toggle="tab"><spring:message code="exchange.bills.label"  /></a></li>
                                    </c:if>
                        		</c:if>
								<c:if test="${billcontent == 'billTransactions'}">
									<li><a href="#tab_1" data-toggle="tab" onclick="viewBillDetails('${billId}','billItems')"><spring:message code="billing_items.label"/></a></li>
                                    <li class="active"><a href="#tab_2" onclick="viewBillDetails('${billId}','billTransactions')" data-toggle="tab"><spring:message code="billing_transactions.label"  /></a></li>
                                     <c:if test="${!empty billDetails.returnItems}">
                                    	<li><a href="#tab_3" onclick="viewBillDetails('${billId}','Returned')" data-toggle="tab"><spring:message code="returned.bills.label"  /></a></li>
                                    </c:if>
                                    <c:if test="${!empty billDetails.exchangeItems}">
                                    	<li><a href="#tab_4" onclick="viewBillDetails('${billId}','Exchanged')" data-toggle="tab"><spring:message code="exchange.bills.label"  /></a></li>
                                    </c:if>
                        		</c:if>
                               </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                        	 <c:if test="${billcontent == 'billItems'}">
                                        <%@ include file="itemdetails.jsp" %>  
                                   </c:if>
                                    <c:if test="${billcontent == 'billTransactions'}">
                                        <%@ include file="transactiondetails.jsp" %>  
                                   </c:if>
                                   <c:if test="${billcontent == 'Returned'}">
                                        <%@ include file="returnedDetails.jsp" %>  
                                   </c:if>
                                    <c:if test="${billcontent == 'Exchanged'}">
                                        <%@ include file="exchangedDetails.jsp" %>  
                                   </c:if>
                                       
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">

                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane --> 
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->  --%>
                        </section>
                          
</body>
</html>