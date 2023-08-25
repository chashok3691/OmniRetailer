<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file type		        : JSP
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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	 <script src="${pageContext.request.contextPath}/js/b2c/events.js"></script>
 <style type="text/css">
.form-group {
    margin-bottom: 5px;
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
    font-weight: normal; 
	color: white;
    background-color: rgb(128,128,128);
    /* border-color: black; */
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#eventTitle").on('input',function(e){
		   $("#eventTitleError").html("");
		   $(".Error").html("");
	});
	$("#description").on('input',function(e){
		   $("#descriptionError").html("");
		   $(".Error").html("");
	});
	
});
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                  <div class="box-header" style="text-align: center">
	                  <br/>
                      	 	<h3><spring:message code="view.event.flow.label" /> - ${businessEventObj.eventId}</h3>
                  </div><!-- /.box-header -->
                                <!-- form start -->
                    <form id="newGiftVouchers" method="post" >
                      <div class="box-body">
                             <input type="hidden" id="type">
                             <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                   	<div class="row">
										<div class="form-group col-lg-6 col-md-6">
											<input type="hidden" id="eventId" value="${businessEventObj.eventId}">
											<div class="col-lg-1 col-md-1"></div>
											<div class="col-lg-3 col-md-4" style="padding-left: 0px; text-align: right">
	                                            <label><spring:message code="event.title.label" /> <span style="color:red; font-size:2">*</span></label>
											</div>
											<div class="col-lg-8 col-md-7" style="padding-left: 0px;">
	                                            <input type="text" class="form-control" readonly="readonly" id="eventTitle" value="${businessEventObj.eventTitle}" name="eventTitle" placeholder="<spring:message code="enter.event.title.label" />" />
	                                            <span style="color:red; font-size:2" id="eventTitleError"></span>
											</div>
                                     	</div>
                                     	<div class="form-group col-lg-6 col-md-6">
											 <div class="col-lg-3 col-md-4" style="padding-left: 0px; text-align: right">
	                                            <label><spring:message code="event.approved.label" /></label>
	                                        </div>
	                                        <div class="col-lg-8 col-md-7" style="padding-left: 0px;">
	                                            <input type="text" class="form-control" readonly="readonly" id="approvedBy" value="${businessEventObj.approvedBy}" name="eventApprovedBy" placeholder="<spring:message code="enter.event.Approved.label" />" />
	                                            <span style="color:red; font-size:2" id="approvedByError"></span>
											</div>
                                       <div class="col-lg-1 col-md-1"></div>
                                    	</div>
                                    </div>
                                    <div class="row">
										<div class="form-group col-lg-6 col-md-6">
										<div class="col-lg-1 col-md-1"></div>
											<div class="col-lg-3 col-md-4" style="padding-left: 0px; text-align: right">
	                                            <label><spring:message code="start.date.label" /></label>
	                                        </div>
	                                         <div class="col-lg-8 col-md-7" style="padding-left: 0px;">
	                                            <input class="form-control calendar_icon" readonly="readonly" value="${businessEventObj.eventStartDateStr}" name="startDate" id="startDate" size="20" type="text" placeholder="DD/MM/YYYY"/>
	                                            <span style="color:red; font-size:2" id="startDateError"></span>
	                                     	</div>
                                     	</div>
                                     	<div class="form-group col-lg-6 col-md-6">
											<div class="col-lg-3 col-md-4" style="padding-left: 0px; text-align: right">
	                                            <label><spring:message code="end.date.label" /></label>
	                                        </div>
	                                        <div class="col-lg-8 col-md-7" style="padding-left: 0px;">
	                                            <input class="form-control calendar_icon" readonly="readonly" value="${businessEventObj.eventEndDateStr}" name="endDate" id="endDate" size="20" type="text" placeholder="DD/MM/YYYY"/>
	                                            <span style="color:red; font-size:2" id="endDateError"></span>
	                                        </div>
	                                        <div class="col-lg-1 col-md-1"></div>
                                     	</div>
                                    </div>
                                   <!-- Browse Image-->	
                                 <div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="col-lg-2"></div>
										<label style="height: 30px;"><spring:message code="event.image.label" /></label>
                                    	<div class="row">
                                    	<div class="col-lg-2 col-md-1"></div>
                                    		<div class="col-lg-2 col-md-2" style="text-align: right;padding-right: 0px;">(1)</div>
                                    		<div class="form-group col-lg-5 col-md-6">
                                    			<div id="eventImage1image" style="width:65px;height:50px;">
													<c:if test="${not empty businessEventObj.eventImage1}">
														<img style="width:65px;height:40px;" id="eventImage1_thumbnail" src="${businessEventObj.eventImage1}">
													</c:if>
												</div>
						  					</div>
						  					<div class="col-lg-2" style="padding-left: 2px;"></div>
											<div class="col-lg-2"></div>
										</div>
										
										<div class="row">
                                    		<div class="col-lg-2 col-md-1"></div>
                                    		<div class="col-lg-2 col-md-2" style="text-align: right;padding-right: 0px;">(2)</div>
                                    		<div class="form-group col-lg-5 col-md-6">
                                    			<div id="eventImage2image" class="" style="width:65px;height:50px;">
													<c:if test="${not empty businessEventObj.eventImage2}">
														<img style="width:65px;height:40px;" id="eventImage2_thumbnail" src="${businessEventObj.eventImage2}">
													</c:if>
												</div>
						  					</div>
						  					<div class="col-lg-2" style="padding-left: 2px;"></div>
											<div class="col-lg-2"></div>
										</div>
										
										<div class="row">
                                    		<div class="col-lg-2 col-md-1"></div>
                                    		<div class="col-lg-2 col-md-2" style="text-align: right;padding-right: 0px;">(3)</div>
                                    		<div class="form-group col-lg-5 col-md-6">
                                    			<div id="eventImage3image" class="" style="width:65px;height:50px;">
													<c:if test="${not empty businessEventObj.eventImage3}">
														<img style="width:65px;height:40px;" id="eventImage3_thumbnail" src="${businessEventObj.eventImage3}">
													</c:if>
												</div>
						  					</div>
						  					<div class="col-lg-2" style="padding-left: 2px;"></div>
										</div>
								</div>
                                          
                                 <div class="col-lg-6 col-md-6">
                                     	 <div class="form-group col-lg-3 col-md-4" style="padding-left: 0px; text-align: right">
                                            <label><spring:message code="event.status.label" /></label>
                                         </div>
                                        <div class="form-group col-lg-8 col-md-7" style="padding-left: 0px;">
                                            <select id="status" disabled="disabled" class="form-control" >
												<option value="Active" ${businessEventObj.status == 'Active' ? 'selected' : ''}>Active</option>
												<option value="Disabled" ${businessEventObj.status == 'Disabled' ? 'selected' : ''}>Disabled</option>
											  </select>
                                            <span style="color:red; font-size:2" id="statusError"></span>
                                    	</div>
                                    	<div class="col-lg-1 col-md-1"></div>
                                    	<div class="form-group col-lg-3 col-md-4" style="padding-left: 0px; text-align:right">
                                            <label><spring:message code="event.target.url" /></label>
                                         </div>
                                        <div class="form-group col-lg-8 col-md-7" style="padding-left: 0px;">
                                            <input type="text" readonly="readonly" class="form-control" id="targetUrl" value="${businessEventObj.targetUrl}" name="targetUrl" placeholder="<spring:message code="enter.event.target.url" />" />
                                            <span style="color:red; font-size:2" id="targetUrlError"></span>
                                    	</div>
                                    	<div class="col-lg-1 col-md-1"></div>
                                    	<div class="form-group col-lg-3 col-md-4" style="padding-left: 0px; text-align:right">
                                            <label><spring:message code="event.status.label" /></label>
                                         </div>
                                        <div class="form-group col-lg-8 col-md-7" style="padding-left: 0px;">
                                            <select id="eventType" disabled="disabled" class="form-control" >
												<option value="Seminar" ${businessEventObj.type == 'Seminar' ? 'selected' : ''}>Seminar</option>
												<option value="Business Promotion" ${businessEventObj.type == 'Business Promotion' ? 'selected' : ''}>Business Promotion</option>
												<option value="Articles" ${businessEventObj.type == 'Articles' ? 'selected' : ''}>Articles</option>
											  </select>
                                    	</div>
                                  </div>
                           </div>
                           <br>
                           <div class="row">
	                       		<div class="col-lg-1 col-md-1"></div>
	                       		<div class="form-group col-lg-10 col-md-10">
	                                <label><spring:message code="event.Description.lable" /></label>
	                                <textarea  rows="2" readonly="readonly" class="form-control" style="resize:none;" id="description" name="eventDescription" placeholder="<spring:message code="enter.event.description.label" />" >${businessEventObj.description}</textarea>
	                                <span style="color:red; font-size:2" id="eventdescriptionError"></span>
								</div>
								<div class="col-lg-1 col-md-1"></div>
						  </div>
						<br>
									
									
									<!--added by manasa  -->
			<%-- 	<input type="hidden" id="outletLocation" value="${eventObj.eventStartDateStr}"> --%>
		 <input type="hidden" id="from" value="${eventObj.eventStartDateStr}">
        <input type="hidden" id="to" value="${eventObj.eventEndDateStr}">
         <input type="hidden" id="searchEventsId" value="${eventObj.searchCriteria}"> 
				<!--added by manasa  -->
										
						<div class="row" style="text-align: center;">
							<c:if test="${type == 'new'}">
	                       		<input type="button" class="btn bg-olive btn-inline" style="width: 65px;" onclick="validateEventForm('new')" value="<spring:message code="save.label" />" />
	                       </c:if>
	                       <c:if test="${type == 'edit'}">
	                      	 	<input type="button" class="btn bg-olive btn-inline" style="width: 65px;" onclick="validateEventForm('edit')" value="<spring:message code="save.label" />" />
	                       </c:if>
						 	<c:if test="${sessionScope.role == 'super admin'}"> 
			 					<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewEvents('','0');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
						 	 
						 	
							<%-- <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                     			<c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == true}"> --%>
									<input type="button" class="btn bg-olive btn-inline btnCls" style="margin-left:5%;" onclick="viewEvents('','0');" value="<spring:message code="cancel.label" />" />
								<%-- </c:if>
							</c:forEach> --%>
	  					</div>
						<br>
					   <div class="box-footer"></div>    
				</div>
			</form>
         </div>    
	</div>     
</div>           
</section><!-- /.content -->						
</body>						
</html>						
						

