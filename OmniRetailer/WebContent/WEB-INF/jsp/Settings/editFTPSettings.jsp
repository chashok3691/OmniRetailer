<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manojj
 * file name		        : Inventory Manager/settings/editFTPSettings.jsp
 * file type		        : JSP
 * description				: The editFTPSettings form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/cusomerSettings/whatsAppSettings.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/cusomerSettings/ftpSettings.js"></script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">

<style type="text/css">

.form-group {
	margin-bottom: 1px;
}

.fileUpload {
	position: relative;
	overflow: hidden;
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
	filter: alpha(opacity = 0);
}

.btn-primar {
	font-weight: bold;
	color: black;
	background: #777;
	border-color: black;
}

.browsebutton {
	border-radius: 0px;
	padding: 2px;
	height: 28px;
	/* -webkit-box-shadow: none; */
	box-shadow: none;
	/* background: #777; */
	color: #fff;
	font-size: 8px;
	border: 1px solid transparent;
}

.form-group {
	padding-bottom: 3px;
}

.fa-2x {
	margin-top: 2px;
	font-size: 1.7em;
}

a.button {
	position: relative;
	text-decoration: none;
	color: white;
	display: inline-block;
	padding: 2px 24px 24px 16px;
	background: #3c8dbc;
	/* border-radius: 5px; */
	/* box-shadow: 1px 0px 2px #000; */
	cursor: pointer;
	margin-top: 20px;
	height: 23px;
	text-align: center;
	margin-bottom: 1px;
	width: 78%;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 2px;
}
.glyphicon {
   
    }
    table.formatHTML5 tr.selected {
    background-color: #e92929 !important;
    color:#fff;
    vertical-align: middle;
    padding: 1.5em;
}
    

}

@media (min-width: 1200px)
.col-lg-5 {
    width: 40.666667%;
}
b, strong {
    font-weight: 500;
}
label{
white-space: nowrap;
}

legend {
   /* width:100%; */
   text-align: center;
    width: unset;
}
legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}
textarea{
resize: none;
width: 226px;
border: 1px solid #d2d6de;
}
fieldset{
border: 1px solid #d2d6de;
}
.col-lg-4 fieldset{
height:201px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	//callCalender('ysbillIdResetDate');
	
	$("#hidePasswordf").change(function(e){
		if(!$(this).prop("checked")){
			$("#fPassword").attr("type","text");
		}
		else{
			$("#fPassword").attr("type","password");
		}
	});
		
	$("#hidePasswordbackUpf").change(function(e){
			if(!$(this).prop("checked")){
				$("#backUpfPassword").attr("type","text");
			}
			else{
				$("#backUpfPassword").attr("type","password");
			}
		});
		
});
</script>
</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">

			<div class="col-xs-12">

				<div class="box box-primary " style="">
				 <div class="box-header" align="center">
               <h3  class="box-title" style="border:1px solid #ccc;padding:7px;font-weight: 600;"><spring:message code="ftp.settings.label" /></h3>
           </div>
					
						<div class="box-body">
							<div class="row" style="text-align: right; margin-top: 0px;margin-bottom: 15px;">

								<div id="Error" class="Error"
									style="text-align: center; color: red; margin-top: 20px; font-size: 2; font-weight: bold;">${err}</div>
								<div id="Success" class="Error"
									style="text-align: center; color: blue; font-size: 2; margin-top: 20px; font-weight: bold;">${success}</div>
							
							</div>
							<br><br>

							<div class="row">
								<div class="row" style="padding-left: 15px; margin-top:-54px;">
								<div class="col-lg-5">
								<fieldset style="border: 1px solid #d2d6de;">
								<legend  class="scheduler-border"style="text-align:center;"><b> Configure SFTP/FTP Settings </b></legend>
									<div class="form-group col-lg-6">
									<br>
										<div class="row">
											<div class="col-lg-12">
												<label>User Name <span style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control" id="fUsername"
													value="${sftpSettings.userID}"
													placeholder="Enter Username " /> 
													<span id="fUsernameError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
										
										<div class="row">
										<div class="col-lg-12">
											<label> Password <span style="color: red; font-size: 2">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="vertical-align: -2px" type="checkbox" id="hidePasswordf" checked="checked"></label> 
											<input type="password" class="form-control" id="fPassword" value="${sftpSettings.userPassword}" />
											<span id="fPasswordError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
										</div>
										</div>
										
									</div>
									<br>
									<!-- <div class="form-group col-lg-1"></div> -->
									<div class="form-group col-lg-6">
											
														<div class="row">
														<div class="col-lg-10 nopadding">
															<label>Host <span style="color: red; font-size: 2">*</span></label> <input type="text"
																class="form-control" id="fHost" value="${sftpSettings.hostName}" />
																<span id="fHostError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
														</div>
														</div>
														
														<div class="row">
														<div class="col-lg-10 nopadding">
															<label>Port No </label> <input type="text"
																class="form-control" id="fPortNo" value="${sftpSettings.portNO}" /> 
																<span id="fPortNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														</div>
														
														
											</div>
											
											</fieldset>
											</div>
											<!-- <div class="col-lg-1"></div> -->
									<div class="form-group col-lg-7" style="right:1%;">
											
									<fieldset style="border: 1px solid #d2d6de;">
									<legend  class="scheduler-border"style="text-align:center;"><b> Configure Backup SFTP/FTP Settings </b></legend>
									<div class="form-group col-lg-5">
									<br>
										<div class="row">
											<div class="col-lg-12">
												<label>User Name <span style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control" id="backUpfUsername"
													value="${backUpsftpSettings.userID}"
													placeholder="Enter Username " /> 
													<span id="backUpfUsernameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
										
										<div class="row">
										<div class="col-lg-12">
											<label> Password <span style="color: red; font-size: 2">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="vertical-align: -2px" type="checkbox" id="hidePasswordbackUpf" checked="checked"></label> 
											<input type="password" class="form-control" id="backUpfPassword" value="${backUpsftpSettings.userPassword}" /> 
											<span id="backUpfPasswordError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
										</div>
										
									</div>
									<br>
									<div class="form-group col-lg-3">
										
											<div class="col-lg-12" style="padding: 0px;">
												<div class="col-lg-12">
														<div class="row">

														<div class="col-lg-12 nopadding">
															<label>Host <span style="color: red; font-size: 2">*</span></label> 
															<input type="text" class="form-control" id="backUpfHost" value="${backUpsftpSettings.hostName}" /> 
															<span id="backUpfHostError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>

														<div class="col-lg-12 nopadding">
															<label>Port No <span style="color: red; font-size: 2">*</span></label> 
															<input type="text" class="form-control" id="backUpfPortNo" value="${backUpsftpSettings.portNO}" /> 
															<span id="backUpfPortNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														</div>
													
												</div>
												
											</div>
									</div>
									
									<div class="col-lg-4">
											<div class="col-lg-12 nopadding">
												<label>Destination Path <span style="color: red; font-size: 2">*</span></label> <input type="text" class="form-control" id="backUpfDestinationPath" value="${backUpsftpSettings.remotePath}" />
												<span id="backUpfDestinationPathError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
											</div>
									</div>
																
									</fieldset>
											
											</div>
										</div>
										
									<div class="col-lg-1"></div>

									</div>
									
									<br><br>
									
		<div class="row">						
		<!-- <div class="form-group col-lg-12">

		<div class="form-group col-lg-3 col-md-3" >
        	 	<label>Public IP Address <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control" id="publicIPAddress" value=""  placeholder="Enter IP Address" />
                <span id="publicIPAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
   		</div>
   		<div class="form-group col-lg-3 col-md-3" >
        	 	<label>Yearly Serial Bill ID Format <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control" id="yearlySerialBillIdFormat" value=""  placeholder="Enter yearly serial Bill ID format" />
                <span id="yearlySerialBillIdFormatError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
   		</div>
   		<div class="form-group col-lg-3 col-md-3" >
        	 	<label>Yearly Server Serial Year <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control" id="yearlyServerSerialYear" value=""  placeholder="Enter server serial year" />
                <span id="yearlyServerSerialYearError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
   		</div>
   		<div class="form-group col-lg-3 col-md-3" >
        	 	<label>Yearly Serial Bill ID Reset Date <span style="color:red; font-size:2">*</span></label>
                <input class="form-control calendar_icon"  style="background-color: white;" name="ysbillIdResetDate" readonly="readonly" value=""  id="ysbillIdResetDate" size="20" type="text" onfocus="callCalender('ysbillIdResetDate')" onclick="callCalender('ysbillIdResetDate')" placeholder="Enter yearly serial Bill ID reset date"/>
                <span id="ysbillIdResetDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
   		</div>
   		
		</div> -->

		</div>
								
								<br><br>
							
							
							<div class="row" style="text-align: right; margin-top: 0px;">
								<div class="row">
									<div class="col-lg-12">
										<div class="row" style="text-align: center; margin-top: 15px">
											<c:forEach var="accessControl"
												items="${sessionScope.settings}">
												<c:if
													test="${accessControl.appDocument == 'WhatsAppSettings' && accessControl.write == true}">
													
												  <c:if test="${status == 'new'}">
											    		<input type="button" id="submit" style="margin-right: 25%;" class="btnCls" onclick="validateFTPSettingsForm('new');" value="<spring:message code="submit.label" />">
											      </c:if>
											      <c:if test="${status == 'edit'}">
											      		<input type="button" id="submit" style="margin-right: 25%;" class="btnCls" onclick="validateFTPSettingsForm('edit');" value="<spring:message code="submit.label" />">
											      </c:if>
      
													
												</c:if>
											</c:forEach>
											<input type="button" class="btnCls" style=""
												onclick="showCustomerSettingsFlow();"
												value="<spring:message code="cancel.label" />">
										</div>
									</div>
								</div>
							</div> 
							<br><br>
						</div>
						
						
						
						
						<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">WhatsApp Settings</h4>
        </div>
        <div class="modal-body">
          <p>Enter any valid mobile number to verify WhatsApp settings. Thank You</p>
          
          <input type = "text" id = "mobileNo"  class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="business.enquiry.phone.no.label" />"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn .btn-info" onclick="validateWhatsAppUrl();"> OK </button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
  
      <div id="myModalSave" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer WhatsApp Settings</h4>
      </div>
      <div class="modal-body">
        <p>Requested to make changes in Customer WhatsApp Settings, do you want to continue and apply?</p>
      </div>
      <div class="modal-footer">
      <div class = "col-lg-6" >
      </div>
         <c:if test="${status == 'new'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validateWhatsAppSettingsForm('new')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      <c:if test="${status == 'edit'}">
      <div class = "col-lg-6">
        <button type="button" class="btnCls"  onclick="validateWhatsAppSettingsForm('edit')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      </div>
    </div>

  </div>
</div>

</div>

  			
						 <script type="text/javascript">
						 	var count = 1;
						 </script>
				<c:forEach var="parameters" items="${parametersList}" varStatus="theCount">
             	<input type="hidden" id="parameterName${theCount.count}" value="${parameters.parameterName}"/>
             	<input type="hidden" id="parameterValue${theCount.count}" value="${parameters.parameterValue}"/>
              	
              
              <script type="text/javascript">
             	 addItemIdOnLoad(count);
              	count++;
              </script>
              
            </c:forEach>
						

						<div class="box-footer"></div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>