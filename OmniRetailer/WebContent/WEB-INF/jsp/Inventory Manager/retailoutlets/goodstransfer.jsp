<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : onventorymanager/retailoutlets/goodstransfer.jsp
 * file type		        : JSP
 * description				: The edit profile and change password tabs are displayed using this jsp
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
					<h1><spring:message code="outlet.management.label" />
     					<small><spring:message code="goodstransfer.label" /></small>
   					</h1>
                    <ol class="breadcrumb">
                    <li><a style="font-size: 18px;" style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                <c:set var="goodsReceipt" value="false"/>
                                 <c:set var="goodsIssue" value="false"/>
                                 <c:if test="${sessionScope.role == 'super admin'}">
                                 	<li class="active"><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="viewAllStockReceipts('outletGoodsTransfer','all','0');"><spring:message code="goodsreceipts.label" /></a></li>
                                 	<li><a style="font-size: 18px;" href="#tab_2" onclick="viewAllStockIssues('outletGoodsTransfer','all','0');" data-toggle="tab"><spring:message code="goodsindent.label" /></a></li>
                                 </c:if>
                                <c:forEach var="accessControl" items="${sessionScope.inventoryManagement}">
		                            <c:if test="${accessControl.appDocument == 'OutletGoodsReceipt' && accessControl.write == true && accessControl.read == false}">
		                            	<c:set var="goodsReceipt" value="true"/> 
		                            	<li class="active"><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="return newStockReceiptView();"><spring:message code="goodsreceipts.label" /></a></li>
		                            </c:if>
	                            	<c:if test="${accessControl.appDocument == 'OutletGoodsReceipt' && goodsReceipt == false}"> 
	                            		<c:set var="goodsReceipt" value="true"/> 
	                                    <li class="active"><a style="font-size: 18px;" href="#tab_1" data-toggle="tab" onclick="viewAllStockReceipts('outletGoodsTransfer','all','0');"><spring:message code="goodsreceipts.label" /></a></li>
	                            	</c:if>
                            	</c:forEach>
                                <c:forEach var="accessControl" items="${sessionScope.inventoryManagement}">
		                            <c:if test="${accessControl.appDocument == 'OutletGoodsIssue' && accessControl.write == true && accessControl.read == false}">
		                            	<c:set var="goodsIssue" value="true"/> 
		                            	<c:if test="${goodsReceipt == false}">
		                            		<li class="active"><a style="font-size: 18px;" href="#tab_2" onclick="return newStockIssueView();" data-toggle="tab"><spring:message code="goodsindent.label" /></a></li>
		                            	</c:if>
		                            	<c:if test="${goodsReceipt == true}">
		                            		<li><a style="font-size: 18px;" href="#tab_2" onclick="return newStockIssueView();" data-toggle="tab"><spring:message code="goodsindent.label" /></a></li>
		                            	</c:if>
		                            </c:if>
	                            	<c:if test="${accessControl.appDocument == 'OutletGoodsIssue' && goodsIssue == false}"> 
	                                    <c:if test="${goodsReceipt == false}">
		                            		<li class="active"><a style="font-size: 18px;" href="#tab_2" onclick="viewAllStockIssues('outletGoodsTransfer','all','0');" data-toggle="tab"><spring:message code="goodsindent.label" /></a></li>
		                            	</c:if>
		                            	<c:if test="${goodsReceipt == true}">
		                            		<li><a style="font-size: 18px;" href="#tab_2" onclick="viewAllStockIssues('outletGoodsTransfer','all','0');" data-toggle="tab"><spring:message code="goodsindent.label" /></a></li>
		                            	</c:if>
	                            	</c:if>
                            	</c:forEach>
                                    <!-- <li class="pull-right"><a style="font-size: 18px;" style="cursor: pointer;" class="text-muted"><i class="fa fa-gear"></i></a></li> -->
                                </ul>
                                <div class="tab-content">
                                 <c:if test="${sessionScope.role == 'super admin'}">
                                 	<div class="tab-pane active" id="tab_1" >
	                                  	<div class="row">
	                        				<!-- left column -->
				                        	<div class="col-lg-12">
                                   			  <%@ include file="allstockreceipts.jsp" %>
                                   			 </div>
                                   		  </div>
                                   	</div>
                                   	<div class="tab-pane" id="tab_2">
	                                    <div class="row">
					                        <!-- left column -->
					                        <div class="col-lg-12">
	                                    	</div>
	                                    </div>
	                                   </div>
                                 </c:if>
                                 <c:set var="goodsReceipt" value="false"/>
                                  <c:set var="goodsIssue" value="false"/>
	                          		<c:forEach var="accessControl" items="${sessionScope.inventoryManagement}">
			                            <c:if test="${accessControl.appDocument == 'OutletGoodsReceipt' && accessControl.write == true && accessControl.read == false}">
	                                       <c:set var="goodsReceipt" value="true"/> 
	                                       <div class="tab-pane active" id="tab_1" >
			                                  <div class="row">
			                        				<!-- left column -->
						                        <div class="col-lg-12">
	                                       			<%@ include file="newstockreceipt.jsp" %>
	                                       		</div>
	                                       	  </div>
	                                       	</div>
	                                    </c:if>
	                                    <c:if test="${accessControl.appDocument == 'OutletGoodsReceipt' && goodsReceipt == false}"> 
		                            		<c:set var="goodsReceipt" value="true"/> 
	                                      		<div class="tab-pane active" id="tab_1" >
				                                  <div class="row">
				                        				<!-- left column -->
							                        <div class="col-lg-12">
	                                     			  <%@ include file="allstockreceipts.jsp" %>
	                                     			 </div>
	                                     		  </div>
	                                     		</div>
		                            	</c:if>
	                                 </c:forEach>
                     				<c:forEach var="accessControl" items="${sessionScope.inventoryManagement}">
		                            <c:if test="${accessControl.appDocument == 'OutletGoodsIssue' && accessControl.write == true && accessControl.read == false && goodsReceipt == false}">
										<div class="tab-pane active" id="tab_2">
		                                    <div class="row">
						                        <!-- left column -->
						                        <div class="col-lg-12">	
													<c:set var="goodsIssue" value="true"/> 
			                                    	<%@ include file="newstockissue.jsp" %>
			                                    </div>
			                                  </div>
			                              </div>
		                            </c:if>
	                            	<c:if test="${accessControl.appDocument == 'OutletGoodsIssue' && goodsIssue == false && goodsReceipt == false}"> 
	                                   <div class="tab-pane active" id="tab_2">
	                                    <div class="row">
					                        <!-- left column -->
					                        <div class="col-lg-12">
					                        <c:set var="goodsIssue" value="true"/> 
	                                    		<%@ include file="allissuedstocks.jsp" %>
	                                    	</div>
	                                    </div>
	                                   </div>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'OutletGoodsIssue' && goodsIssue == false}">
	                            	<div class="tab-pane" id="tab_2">
	                                    <div class="row">
					                        <!-- left column -->
					                        <div class="col-lg-12">
	                                    	</div>
	                                    </div>
	                                   </div>
	                            	</c:if>
                            	</c:forEach>
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>
                          
</body>
</html>