
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
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewRolesMaster('role','0');" title="<spring:message code="roles.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="roles.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showUsersFlow();" title="<spring:message code="users.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="users.label" /></span>
	                          		</div>
                          		</div>
                           </div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                             <c:set var="rolesManagement" value="false"/>
	                         <c:set var="userManagement" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                             		<c:if test="${accessControl.appDocument == 'RolesManagement' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="rolesManagement" value="true"/>  	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newRole('role');" title="<spring:message code="roles.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="roles.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'RolesManagement' && rolesManagement == false}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewRolesMaster('role','0');" title="<spring:message code="roles.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Roles.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="roles.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                          <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                             <c:if test="${accessControl.appDocument == 'UserManagement' && accessControl.write == true && accessControl.read == false}">
		                        <c:set var="userManagement" value="true"/> 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewUser('newUser');" title="<spring:message code="users.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="users.label" /></span>
	                          		</div>
                          		</div>
	                          </c:if>
	                          <c:if test="${accessControl.appDocument == 'UserManagement' && userManagement == false}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showUsersFlow();" title="<spring:message code="users.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Users.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="users.label" /></span>
	                          		</div>
                          		</div>
	                          </c:if>
	                      </c:forEach>
                         </div>
		                </c:if>
                          
</body>
</html>