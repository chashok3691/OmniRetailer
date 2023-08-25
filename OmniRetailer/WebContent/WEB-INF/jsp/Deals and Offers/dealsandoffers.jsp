<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/Deals and Offers/dealsandoffers.jsp
 * file type		        : JSP
 * description				: display deals and offers
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
	<%-- <section class="content-header">
       <h1>
         <spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" />
       </h1>
       <ol class="breadcrumb">
       <li><a style="font-size: 18px;" href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
           <li class="active"><a style="font-size: 18px;" style="cursor: pointer;" onclick="showDealsFlow();"><spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" /></a></li>
       </ol>
   </section> --%>
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                <c:set var="dealsAndOffers" value="false"/>
                                  <c:if test="${sessionScope.role == 'super admin'}">
                                  	 <c:if test="${type == 'deals'}">
									 		<li class="active"><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="viewdealsandoffers('deals','dealsConfigurations','0','menu');"><spring:message code="deals.label"/></a></li>
		                                    <li><a style="font-size: 18px;" href="#tab_2" onclick="viewdealsandoffers('offers','dealsConfigurations','0','menu')" data-toggle="tab"><spring:message code="offers.label"  /></a></li>
		                               
										</c:if>
										<c:if test="${type == 'offers'}">
											<li><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="viewdealsandoffers('deals','dealsConfigurations','0','menu');"><spring:message code="deals.label"/></a></li>
		                                    <li class="active"><a style="font-size: 18px;" href="#tab_2" onclick="viewdealsandoffers('offers','dealsConfigurations','0','menu')" data-toggle="tab"><spring:message code="offers.label"  /></a></li>
		                               
										</c:if>
                                  </c:if>
                                <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}">
	                            	<c:if test="${accessControl.appDocument == 'DealsAndOffersConfiguration' && accessControl.write == true && accessControl.read == false}">
		                                <c:set var="dealsAndOffers" value="true"/>
		                                <c:if test="${type == 'deals'}">
									 		<li class="active"><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="createNewDeal();"><spring:message code="deals.label"/></a></li>
		                                    <li><a style="font-size: 18px;" href="#tab_2" onclick="createNewOffer()" data-toggle="tab"><spring:message code="offers.label"  /></a></li>
		                               
										</c:if>
										<c:if test="${type == 'offers'}">
											<li><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="createNewDeal();"><spring:message code="deals.label"/></a></li>
		                                    <li class="active"><a style="font-size: 18px;" href="#tab_2" onclick="createNewOffer()" data-toggle="tab"><spring:message code="offers.label"  /></a></li>
		                               
										</c:if>
                                	</c:if>
                                	 <c:if test="${accessControl.appDocument == 'DealsAndOffersConfiguration' && dealsAndOffers == false}">
		                                <c:if test="${type == 'deals'}">
									 		<li class="active"><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="viewdealsandoffers('deals','dealsConfigurations','0','menu');"><spring:message code="deals.label"/></a></li>
		                                    <li><a style="font-size: 18px;" href="#tab_2" onclick="viewdealsandoffers('offers','dealsConfigurations','0','menu')" data-toggle="tab"><spring:message code="offers.label"  /></a></li>
		                               
										</c:if>
										<c:if test="${type == 'offers'}">
											<li><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="viewdealsandoffers('deals','dealsConfigurations','0','menu');"><spring:message code="deals.label"/></a></li>
		                                    <li class="active"><a style="font-size: 18px;" href="#tab_2" onclick="viewdealsandoffers('offers','dealsConfigurations','0','menu')" data-toggle="tab"><spring:message code="offers.label"  /></a></li>
		                               
										</c:if>
                                	</c:if>
                                </c:forEach>
                                  </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                         <c:if test="${sessionScope.role == 'super admin'}">
                         	 <c:if test="${type == 'deals'}">
                           		  <%@ include file="Deals/deals.jsp" %>  
                             </c:if>
                             <c:if test="${type == 'offers'}">
                           		  <%@ include file="Offers/offers.jsp" %>  
                             </c:if>
                         </c:if>
                        		<c:set var="dealsAndOffers" value="false"/>
                                <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}">
	                            	<c:if test="${accessControl.appDocument == 'DealsAndOffersConfiguration' && accessControl.write == true && accessControl.read == false}">
		                    		    <c:set var="dealsAndOffers" value="true"/>
		                    		    <c:if test="${type == 'deals'}">
		                              		  <%@ include file="Deals/newdeal.jsp" %>  
		                                </c:if>
		                                <c:if test="${type == 'offers'}">
		                              		  <%@ include file="Offers/newoffer.jsp" %>  
		                                </c:if>
                                	</c:if>
									<c:if test="${accessControl.appDocument == 'DealsAndOffersConfiguration' && dealsAndOffers == false}">
										 <c:if test="${type == 'deals'}">
		                              		  <%@ include file="Deals/deals.jsp" %>  
		                                </c:if>
		                                <c:if test="${type == 'offers'}">
		                              		  <%@ include file="Offers/offers.jsp" %>  
		                                </c:if>
									</c:if>
                               </c:forEach>
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                        
                                        
                                       <%--   <%@ include file="rawmaterialstocks.jsp" %> --%>
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>
                          
</body>
</html>