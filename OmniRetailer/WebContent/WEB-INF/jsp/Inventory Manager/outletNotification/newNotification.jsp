<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/outletNotification/newNotification.jsp
 * file type		        : JSP
 * description				: The new Notification is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		 <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/outletNotification.js"></script>
	<style type="text/css">
	.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: white;
    display: inline-block;
    padding: 5px 10px 5px 10px;
    background: rgb(60, 141, 188);
	border-radius: 5px;
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
	/* font-weight: bold; */
	color: black;
    background-color: rgb(195,195,195);
    border-color: gray;
}
#receiverType option { color: black; }
#notificationType option { color: black; }
.empty { color: #c3c3c3; }
	</style>
	<script type="text/javascript">
$(document).ready(function(){
});

$("#notificationType").change(function () {
    if($(this).val() == "Notification Type") $(this).addClass("empty");
    else $(this).removeClass("empty");
});
$("#notificationType").change();
/* $("#receiverType").change(function () {
    if($(this).val() == "Receiver Type") $(this).addClass("empty");
    else $(this).removeClass("empty");
});
$("#receiverType").change(); */
	</script>
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

	
	
	
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
             <h3><spring:message code="new.notification.label" /></h3>
        </div>
		 <form id="newDepartment">
            <div class="box-body">
            	<div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;margin-top: -5px;">${error}</div>
	              <div id="Success" style="text-align:center;color:blue;font-weight:bold;margin-top: -5px;">${success}</div>
	            </div>
	            <div class="row">
	            	<div class=" col-md-3">
	            		<label><b><spring:message code="location.label" /></b></label>
                          <select class="form-control" multiple="multiple" name="workLocation" onchange="getUsersList(this);" id="workLocation" style="height: 170px;">
                           	<c:forEach var="location" items="${outletLocationList}">
								<option value="${location}">${location}</option>
							</c:forEach>
                          </select>
				   </div>
				   <div class=" col-md-3">
				    <label><b> <input type="checkbox" id="users" onchange="toggleUsersList(this)" style="vertical-align: -2px;">  <spring:message code="users.label" /></b><span style="padding-left: 30px;"></span><b><input type="checkbox" id="roles" onchange="toggleRolesList(this)" style="vertical-align: -2px;">  <spring:message code="roles.label" /></b></label>
				   	 <div class="row">
	            		<div class=" col-md-12">
                          <select class="form-control" disabled="disabled" multiple="multiple" id="usersList">
                           	<c:forEach var="user" items="${usersList}">
								<option value="${user}">${user}</option>
							</c:forEach>
                          </select>
                        </div>
				   	 </div>
				   	 <br>
				   	 <div class="row">
	            		<div class=" col-md-12">
                          <select class="form-control" disabled="disabled" multiple="multiple" id="rolesList">
                           	<c:forEach var="role" items="${roleList}">
								<option value="${role.roleName}">${role.roleName}</option>
							</c:forEach>
                          </select>
                        </div>
				   	 </div>
				   </div>
				   <div class=" col-md-6"></div>
				</div>
				<div class="row">
					<br>
	            	<div class=" col-md-3">
                          <select class="form-control" id="notificationType">
								<option value="Notification Type">Notification Type</option>
								<option value="Generic">Generic</option>
								<option value="Security">Security</option>
								<option value="Deals & Offers">Deals & Offers</option>
								<option value="Customer Complaints">Customer Complaints</option>
								<option value="Customer Orders">Customer Orders</option>
								<option value="Stock Management">Stock Management</option>
                          </select>
                          <span id="notificationTypeError" style="text-align:center;color:red;font-weight:bold;"></span>
				   </div>
				 <!--   <div class=" col-md-6">
                          <select class="form-control" id="receiverType">
								<option value="Receiver Type">Receiver Type</option>
								<option value="User">User</option>
								<option value="Role">Role</option>
								<option value="Group">Group</option>
                          </select>
				   </div> -->
				   </div>
			
				<%-- <div class="row">
					<br>
	            	<div class=" col-md-1">
	            		<label><spring:message code="attachments.label" /></label>
				   </div>
				   <div class="form-group col-lg-4">
  						<input id="attachmentsFile" class="form-control" placeholder="Choose File" disabled="disabled" />
  					</div>
				   <div class=" col-md-1" style="padding-left: 6px;">
	                   <div class="fileUpload btn btn-primar" style="padding: 1px 12px;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="attachmentsBtn" type="file" class="upload" onchange="addNameToTextBox('attachments');"  />
						</div>
				   </div>
				</div> --%>
			<div class="row">
				<br>
				<div class="form-group col-md-6">
					<textarea rows="1" class="form-control"  onblur="criteria(this)" id="notificationSubject" style="resize:none;" placeholder="<spring:message code="enter.sub.label" />"></textarea>
					<span id="notificationSubjectError" style="text-align:center;color:red;font-weight:bold;"></span>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-11">
					<textarea rows="2" class="form-control"  onblur="criteria(this)" id="notificationMessage" style="resize:none;" placeholder="<spring:message code="notification.msg.label" />"></textarea>
					<span id="notificationMessageError" style="text-align:center;color:red;font-weight:bold;"></span>
				</div>
			</div>
		<div class="row">
		<br>
       	  <div class="col-lg-12" style="text-align: center;">
           	<div class="buttons">
       		 <a onclick="validateOutletNotification('new');" class="btnCls"><font >&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		 
       		  <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                 <c:if test="${accessControl.appDocument == 'OutletNotifications' && accessControl.read == true}"> 
       		 		<a onclick="viewOutletNotifications('outletNotifications','0');" class="btnCls buttonMargin"><font>&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
       		 	</c:if>
       		 </c:forEach>
         	</div>
        </div>
      </div>		
      </div>
   </form>
	</div>
  </div>
 </div>
</section>
</body>
</html>