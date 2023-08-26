
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
                          <div class="row">
                          
                        
		                            	<div class="col-lg-2 form-group" style="text-align: right;">
                          				<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showAccountingFlow();" title="<spring:message code="Accounting.configuration.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="Accounting.configuration.label" /></span>
	                          			</div>
                          			</div>
		                            	
                          
                          <c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FPurchasesPayments' && accessControl.write == true && accessControl.read == true}">
		                            	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getPurchasesAndPayments('back','purchasesPayments','','false')" title="<spring:message code="Accounting.PurchasesandPayments.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Accounting.PurchasesandPayments.label" /></span>
			                          		</div>
			                          </div>
			                        </c:if>
                  				</c:forEach> 
                          
                          			<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FSalesandPayments' && accessControl.write == true && accessControl.read == true}">
		                             <div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getSalesAndPayments('back','salesandpayments','','false')" title="<spring:message code="Accounting.SalesandPayments.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Accounting.SalesandPayments.label" /></span>
			                          		</div>
			                          </div>
		                            </c:if>
                  				</c:forEach> 
                  				
			                      <c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FPettyCash' && accessControl.write == true && accessControl.read == true}">
		                            	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getPettyCash('back','pettyCash','','false')" title="<spring:message code="Accounting.PettyCash.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Accounting.PettyCash.label" /></span>
			                          		</div>
			                          	</div>
		                            </c:if>
                  				</c:forEach>
			                     
			                        	
			                          	<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FAdvanceandPayments' && accessControl.write == true && accessControl.read == true}">
		                            	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="Accounting.AdvanceandPayments.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Accounting.AdvanceandPayments.label" /></span>
			                          		</div>
			                          </div>
		                            </c:if>
                  				</c:forEach> 
			                          	
			                      
                         </div>
                           <div class="row">
                          	
		                            	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showReportsFlow();" title="<spring:message code="Reports.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Reports.label" /></span>
			                          		</div>
			                          	</div>
		                            
			                        	
			                        	
			                        	
			                        	
			                        	<div class="col-lg-10"></div>
			                        	
			                         </div>
		               
                          
</body>
</html>