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
<%-- <section class="content-header">
   <h1><spring:message code="users.label" /></h1>
  <ol class="breadcrumb">
      <li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
      <li class="active"><a style="cursor: pointer;" onclick="showUsersFlow();"><spring:message code="users.label" /></a></li>
  </ol>
 </section> --%>
				<%-- <section class="content-header">
                    <h1>
                      <spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" />
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><a style="cursor: pointer;" onclick="showDealsFlow();"><spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" /></a></li>
                    </ol>
                </section> --%>
                
                          <%--   <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                             	 <li class=""><a href="#tab_1" data-toggle="tab"><spring:message code="warehouse_configuration.label"/></a></li>
                              	</ul>
                            </div> --%>
                   <br>
                   <div class="row">
                   	<div class="col-lg-2" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewUserDetails('all','0');" title="<spring:message code="all.users.label" />">
                   			<img src="${pageContext.request.contextPath}/images/NewUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="all.users.label" />
                   		</div>
                   	</div>
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewUserDetails('active','0');" title="<spring:message code="enabled.users.label" />">
                   			<img src="${pageContext.request.contextPath}/images/EditUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="enabled.users.label" />
                   		</div>
                   	</div>
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewUserDetails('suspend','0');" title="<spring:message code="disabled.users.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="disabled.users.label" />
                   		</div>
                   	</div>
                   	</div>     
                        
                    
                          
</body>
</html>