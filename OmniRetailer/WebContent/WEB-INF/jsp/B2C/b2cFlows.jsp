
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
                            <br/>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewHomePageBanners('homePageBanner','0','banner');" title="<spring:message code="home.page.banner.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/HomePageBanner.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="home.page.banner.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewHomePageBanners('miniBanner','0','miniBanner');" title="<spring:message code="mini.banner.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/MiniBanner.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="mini.banner.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAllHomePageDeals('homePageDeals','0');" title="<spring:message code="home.page.deals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/HomePageDeals.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="home.page.deals.label" /></span>
	                          		</div>
	                          	</div>	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewArrivals('newArrivals');" title="<spring:message code="new.arrivals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/NewArrivals.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="new.arrivals.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewFeaturedProducts('featuredProducts','0');" title="<spring:message code="featured.products.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/FeaturedProducts.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="featured.products.label" /></span>
	                          		</div>
                          		</div>
                          		
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAllHomePageGroups('homePageGroups','0');" title="HomePage groups">
			                         <img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          <span>HomePage groups</span>
			                          </div>
		                          		</div>
		                          <div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newAllHomePageDeals('AllHomePageDeals(');" title="HomePage offers">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>HomePage offers</span>
			                          		</div>
		                          		</div>
		                          		
		                          <div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShoppingList('shoppinglist');" title="Shopping List">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Shopping List</span>
			                          		</div>
		                          		</div>				
		                          		
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                           </div>
                           <div class="row">
                          	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewPaymentGateway('paymentGateway');" title="<spring:message code="payment.gateway.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PaymenetGateWay.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="payment.gateway.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEvents('events','0','menu');" title="<spring:message code="events.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Events.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="events.label" /></span>
	                          		</div>
	                          	</div>
	                        </div>
                          </c:if>
                          <c:set var="counts" value="0" />
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                             <c:set var="homePageBanner" value="false"/>
	                         <c:set var="miniBanner" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="homePageBanner" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBannerImage('homePageBanner','banner');" title="<spring:message code="home.page.banner.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/HomePageBanner.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="home.page.banner.label" /></span>
			                          		</div>
			                          	</div>
			                          	<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'HomePageBanner' && homePageBanner == false}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewHomePageBanners('homePageBanner','0','banner');" title="<spring:message code="home.page.banner.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/HomePageBanner.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="home.page.banner.label" /></span>
			                          		</div>
			                          	</div>
			                          	<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach>
                            <c:set var="miniBanner" value="false"/>
                          <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             <c:if test="${accessControl.appDocument == 'MiniBanner' && accessControl.write == true && accessControl.read == false}">
		                        <c:set var="miniBanner" value="true"/> 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBannerImage('miniBanner','miniBanner');" title="<spring:message code="mini.banner.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/MiniBanner.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="mini.banner.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                          <c:if test="${accessControl.appDocument == 'MiniBanner' && miniBanner == false}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewHomePageBanners('miniBanner','0','miniBanner');" title="<spring:message code="mini.banner.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/MiniBanner.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="mini.banner.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                      </c:forEach>
	                      
	                      
	                      <c:set var="homePageDeals" value="false"/>
	                      <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="homePageDeals" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newHomePageDeal('homePageDeals');" title="<spring:message code="home.page.deals.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/HomePageDeals.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="home.page.deals.label" /></span>
			                          		</div>
			                          	</div>
			                          	<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'HomePageDeals' && homePageDeals == false}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAllHomePageDeals('homePageDeals','0');" title="<spring:message code="home.page.deals.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/HomePageDeals.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="home.page.deals.label" /></span>
			                          		</div>
			                          	</div>
			                          	<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach>
<%--                              <c:set var="brandDeals" value="false"/>
                          <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             <c:if test="${accessControl.appDocument == 'BrandDeals' && accessControl.write == true && accessControl.read == false}">
		                        <c:set var="brandDeals" value="true"/> 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBrandDeals('brandDeals');" title="<spring:message code="brand.deals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/BrandDeals.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="brand.deals.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                          <c:if test="${accessControl.appDocument == 'BrandDeals' && brandDeals == false}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBrandDeals('brandDeals');" title="<spring:message code="brand.deals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/BrandDeals.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="brand.deals.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                      </c:forEach>
	                      
	                      
	                      
	                       <c:set var="dealCategories" value="false"/>
	                      <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'DealCategories' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="dealCategories" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewDealCategories('dealCategories');" title="<spring:message code="deals.categories.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/DealCategories.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="deals.categories.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'DealCategories' && dealCategories == false}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewDealCategories('dealCategories');" title="<spring:message code="deals.categories.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/DealCategories.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="deals.categories.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach> --%>
                            
                            <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                            
                            <c:set var="newArrivals" value="false"/>
                          <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             <c:if test="${accessControl.appDocument == 'NewArrivals' && accessControl.write == true && accessControl.read == false}">
		                        <c:set var="newArrivals" value="true"/> 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewArrivals('newArrivals');" title="<spring:message code="new.arrivals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/NewArrivals.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="new.arrivals.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                          <c:if test="${accessControl.appDocument == 'NewArrivals' && newArrivals == false}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewArrivals('newArrivals');" title="<spring:message code="new.arrivals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/NewArrivals.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="new.arrivals.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                      </c:forEach>
	                      
	                      
	                        <c:set var="featuredShops" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredShops == 'false' }">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;"  onclick="viewFeaturedShops('featuredShops','0')" title="<spring:message code="featured.shops.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span><spring:message code="featured.shops.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if> 
                            </c:forEach> 
	                      
	                      
	                      
                            
                            <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                         </c:if>
	                      
	                      <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
	                      
	                      <c:set var="featuredProducts" value="false"/>
	                      <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="featuredProducts" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newFeaturedProductGroupMaster('featuredProducts');" title="<spring:message code="featured.products.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/FeaturedProducts.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="featured.products.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredProducts == false}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewFeaturedProducts('featuredProducts','0');" title="<spring:message code="featured.products.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/FeaturedProducts.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="featured.products.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach>
                            
                            <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                            
                            <c:set var="paymentGateway" value="false"/>
                          <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             <c:if test="${accessControl.appDocument == 'PaymentGateway' && accessControl.write == true && accessControl.read == false}">
		                        <c:set var="paymentGateway" value="true"/> 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewPaymentGateway('paymentGateway');" title="<spring:message code="payment.gateway.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PaymenetGateWay.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="payment.gateway.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                          <c:if test="${accessControl.appDocument == 'PaymentGateway' && paymentGateway == false}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewPaymentGateway('paymentGateway');" title="<spring:message code="payment.gateway.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PaymenetGateWay.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="payment.gateway.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                      </c:forEach>
	                      <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                         <c:set var="paymentGateway" value="false"/>
                          <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             <c:if test="${accessControl.appDocument == 'Events' && accessControl.write == true && accessControl.read == false}">
		                        <c:set var="paymentGateway" value="true"/> 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEvents('events','0','menu');" title="<spring:message code="events.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Events.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="events.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                          <c:if test="${accessControl.appDocument == 'Events' && paymentGateway == false}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newEvent('events');" title="<spring:message code="events.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Events.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="events.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
	                          </c:if>
	                      </c:forEach>
	                      <%-- <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEvents('events','0','menu');" title="<spring:message code="events.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Events.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="events.label" /></span>
	                          		</div>
	                          	</div> --%>
	                          	
	                          	 <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                           <c:set var="homePageGroups" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'HomePageGroups' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="homePageGroups" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newHomePageGroups('HomePageGroups');" title="HomePage groups">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>HomePage groups</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'HomePageGroups' && homePageGroups == 'false' }"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAllHomePageGroups('homePageGroups','0');" title="HomePage groups">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>HomePage groups</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach>
                            
                            	 <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                         <%--  <c:set var="homePageDeals" value="false"/>
	                       <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="featuredProducts" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newAllHomePageDeals('AllHomePageDeals(');" title="HomePage offers">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>HomePage offers</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'HomePageDeals' && homePageDeals == 'false' }"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAllHomePageDeals('homePageDeals','0');" title="HomePage offers">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>HomePage offers</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach> --%>
                            
                             <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
	                         <c:set var="shoppinglist" value="false" />
	                       <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                             		<c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="featuredProducts" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newAllHomePageDeals('AllHomePageDeals(');" title="Shopping List">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Shopping List</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'ShoppingList' && shoppinglist == 'false' }"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShoppingList('shoppinglist');" title="Shopping List">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Shopping List</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />
                            		</c:if>
                            </c:forEach>
	                          	
                         </div>
		                </c:if>
                          
</body>
</html>