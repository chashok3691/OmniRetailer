<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Inventory Manager/Deals and Offers/dealsFlow.jsp.jsp
 * file type		        : JSP
 * description				: display deals and offers flows information
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
                   <br>
                   <div class="row">
                   	<div class="col-lg-2" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPendingCartsReports('0','','pendingCartReport');" title="<spring:message code="pending.cart.report" />">
                   			<img src="${pageContext.request.contextPath}/images/NewUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="pending.cart.report" />
                   		</div>
                   	</div>
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrderToBillReports('0','clear','orderToBillReport');" title="<spring:message code="order.to.bill.report" />">
                   			<img src="${pageContext.request.contextPath}/images/EditUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="order.to.bill.report" />
                   		</div>
                   	</div>
                   	<%-- <div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewUserDetails('suspend','0');" title="<spring:message code="disabled.users.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="disabled.users.label" />
                   		</div>
                   	</div> --%>
                   	</div>     
                        
                    
                          
</body>
</html>