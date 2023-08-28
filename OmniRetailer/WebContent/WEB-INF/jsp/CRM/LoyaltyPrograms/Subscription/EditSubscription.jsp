<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/countries.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/subscription.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {
				
				debugger
				callCalender('startDate');
				callCalender('endDate');
			});
	
	/* $("#subscriptionName").keydown(function() {
		$("#errsubscriptionName").html("");
		$("#Error").html("");
	});
 */
	var subscriptionCode = $("#subscriptionCode").val();
	$("#subscriptionCode").keydown(function() {
		
		$("#errsubscriptionCode").html("");
		$("#Error").html("");
	
	});

	$("#startDate").keydown(function() {
		$("#startDateError").html("");
		$("#Error").html("");
	});



	$("#endDate").keydown(function() {
		$("#errendDate").html("");
		$("#Error").html("");
	});

	
</script>
<style type="text/css">
.table-striped>tbody>tr:nth-of-type(odd) {
        background-color: #f9f9f9;
        text-align: center;
}
.aligntext{
text-align: center
}

</style>
</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header" style="text-align: center">
						<h3>
							<spring:message code="subscription.edit.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="subscription" method="GET">
						<div class="box-body">
							<div id="Error"
								style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
							<div id="Success" class="Error"
								style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
							<div class="row"
								style="background: #efefef; width: 100%; margin-left: 0px !important;">

								<div class="row">
									<div class="form-group col-lg-2">
										<div class="col-lg-12">
											<label><spring:message code="subscription.id.label" /><span
												style="color: red; font-size: 2">*</span> </label> <input
												type="text" class="form-control" id="subscriptionCode"
												name="subscriptionCode"
												value="${subscriptionObj.subscriptionId}" readonly="readonly"
												 /> <span
												style="color: red; font-size: 2; white-space: nowrap;"
												id="errpromoCode"></span>
										</div>
									</div>
									 
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="start.date.label" /> <span
											style="color: red; font-size: 2">*</span></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" style="background-color: white;"
												name="startDate" id="startDate"
												size="20" type="text" value="${subscriptionObj.startDateStr}"
												onfocus="callCalender('startDate')"
												onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
											</div>
										<!-- /.input group -->
										<span style="color: red; font-size: 2" id="startDateError"></span>
									</div>
									
									<div class="form-group col-lg-2" style="">
										<label> <spring:message code="subscription.type.label" /></label>
										<select class="form-control" name="subscriptionType"
											id="subscriptionType" readonly="readonly">
											 <option value="Daily" ${'Daily' == subscriptionObj.period ? 'selected' : ''} > Daily</option>
	                                        <option value="AlternateDay" ${'AlternateDay' == subscriptionObj.period? 'selected' : ''}>Alternate Day</option>
	                                         <option value="Weekly" ${'Weekly' == subscriptionObj.period ? 'selected' : ''}>Weekly</option>
                                         <option value="Monthly" ${'Monthly' == subscriptionObj.period ? 'selected' : ''}>Monthly</option>
										</select>
									</div>
									<div class="form-group col-lg-2" style="">
										<div class="col-lg-12">
											<label><spring:message code="reward.price.label" /></label>
											<input type="text" class="form-control" id="rewardPrice"
												name="rewardPrice"
												oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
												value="${subscriptionObj.rewardPrice}"  readonly="readonly"/> <span
												style="color: red; font-size: 2; white-space: nowrap;"
												id="rewardPriceError"></span>
										</div>
									</div>
									  <div class="form-group col-lg-2">
										<div class="col-lg-12 ">
											<label>No.Of Subscription<span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" id="noOfSubscriptions" name="noOfSubscriptions"
												value="${subscriptionObj.quantity}"  readonly="readonly"/> <span
												style="color: red; font-size: 2; font-weight: bold"
												id="errQuantity"></span>
										</div>
									</div> 
								</div>

								<div class="row">
									<div class="form-group col-lg-2">
										<div class="col-lg-12 ">
											<label><spring:message code="subscription.name.label" /> <span
												style="color: red; font-size: 2"></span></label> <input type="text"
												class="form-control" id="subscriptionName" name="subscriptionName"
												value="${subscriptionObj.subscriptionName}"  readonly="readonly"/> <span
												style="color: red; font-size: 2" id="errPromoName1"></span>
										</div>
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="end.date.label" /> <span
											style="color: red; font-size: 2">*</span></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" style="background-color: white;"
												name="endDate" id="endDate"
												size="20" type="text" value="${subscriptionObj.endDateStr}"
												onfocus="callCalender('endDate')"
												onclick="callCalender('endDate')"
												placeholder="DD/MM/YYYY" />
											<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
										</div>
										<!-- /.input group -->
										<span style="color: red; font-size: 2" id="endDateError"></span>
									</div>
									
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="status.label" />
								<select class="form-control" id=subscriptionStatus>
                  				<option value="" ${'' == subscriptionObj.status ? 'selected' : ''}><spring:message code="ALL.label"/></option>
                           		 <option value="Subscribed" ${'Subscribed' == subscriptionObj.status ? 'selected' : ''}>Subscribed</option>
                           		 <option value="Unsubscribed" ${'Unsubscribed' == subscriptionObj.status ? 'selected' : ''}>Unsubscribed</option>
						     	<option value="Paused" ${'Paused' == subscriptionObj.status ? 'selected' : ''}>Paused</option>
						 	
	                        	</select>
									</div>
									
									<div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>Reward Type</label>
                                            <input type="text" class="form-control" id="rewardType"  name="rewardType" value="${subscriptionObj.rewardType}" readonly="readonly"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="rewardTypeError"></span>
                                     	</div>
                                     	</div>
                                     	
                                     	<div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>Previous Ordered date</label>
                                            <input type="text" class="form-control" id="previousordereddate"  name="previousordereddate" value="${subscriptionObj.previousOrderDateStr}" readonly="readonly"/>
                                     	</div>
                                     	</div>
                                     	
                                            <input type="hidden" id="subsCreatedDate"  value="${subscriptionObj.createdDateStr}"/>
                                            <input type="hidden" id="subsUpdatedDate"  name="updatedDate" value="${subscriptionObj.updatedDateStr}"/>
                                            <input type="hidden" id="discount"  name="discount" value="${subscriptionObj.discount}"/>
                                            <input type="hidden" id="assignedStatus"  name="assignedStatus" value="${subscriptionObj.assignedStatus}"/>
                                            <input type="hidden" id="mobileNum"  name="mobileNum" value="${subscriptionObj.mobileNum}"/>
                                            
                                           <%--  <input type="hidden" id="isCreditBasedOrder"  name="isCreditBasedOrder" value="${subscriptionObj.isCreditBasedOrder}"/> --%>
                                            <input type="hidden" id="userName"  name="userName" value="${subscriptionObj.userName}"/>
                                            <input type="hidden" id="roleName"  name="roleName" value="${subscriptionObj.roleName}"/>
								</div>
							</div>

							<div class="row">
								
								<div class="col-lg-12"
									style="margin-left: 0px; margin-top: 1.8%;">
		               <%-- <div class="col-lg-12" style="margin-left:-15px; margin-right:20px;width:155%;">
							<input type="text"  class="form-control" value="${searchName}" id="searchRoute" placeholder="Search here..." />
                            <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	        	 	  </div> --%>
										<div class="table-responsive" role="grid"
											style="overflow-x: auto; width: 100%; position: relative; white-space: nowrap;">
											<table id="subpItmesList" class="table table-striped table-bordered">
												<thead style="background-color: #eeee !important; border-left: hidden; border-right: hidden;">
													<tr>
													<th><spring:message code="slno.label" /></th>
															<th>Sku ID</th>
															<th style="text-align: left;">Item Name</th>
															<th>PluCode </th>
															<th>Quantity</th>
															<th>MRP </th>
															<th>Sale Price </th>
															<th>UOM</th>
															<th>Measure Range </th>
															<th>Tax Code </th>
															<th><spring:message code="status.label" /></th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="subscriptionObjlist" items="${subscriptionObj.subscriptionProductsList}" varStatus="theCount">
                                            	<tr>
                                                <td id="subscriptionData${theCount.count}" class="aligntext">${theCount.count}</td>
                                                <td id="SkuID${theCount.count}" class="aligntext">${subscriptionObjlist.skuId}</td>
                                                <td id="itemName${theCount.count}"  style="text-align:center; ">${subscriptionObjlist.itemName}</td>
                                                <td id="pluCode${theCount.count}" class="aligntext">${subscriptionObjlist.pluCode}</td>
                                                <td id="quantity${theCount.count}" class="aligntext">${subscriptionObjlist.quantity}</td>
                                                <td id="mrp${theCount.count}" class="aligntext">${subscriptionObjlist.mrp}</td>
                                                <td id="salePrice${theCount.count}" class="aligntext">${subscriptionObjlist.salePrice}</td>
                                                <td id="uom${theCount.count}" class="aligntext">${subscriptionObjlist.uom}</td>
                                                <td id="measureRange${theCount.count}" class="aligntext">${subscriptionObjlist.measureRange}</td>
                                                <td id="taxCode${theCount.count}" class="aligntext">${subscriptionObjlist.taxCode}</td>
                                                
                                                <td class="col-sm-1" id="action${theCount.count}">
                                                <select id="subsItemStatus${theCount.count}">
												<option value="Subscribed" ${'Subscribed' == subscriptionObjlist.status ? 'selected' : ''} >Subscribed</option>
	                                        	<option value="Unsubscribed" ${'Unsubscribed' == subscriptionObjlist.status ? 'selected' : ''}>Unsubscribed</option>
	                                         	<option value="Paused" ${'Paused' == subscriptionObjlist.status ? 'selected' : ''}>Paused</option>
												</select>
												</td>
                                                 <input type="hidden" id="createdDate${theCount.count}" value="${subscriptionObjlist.createdDateStr}">
                                                 <input type="hidden" id="updatedDate${theCount.count}" value="${subscriptionObjlist.updatedDateStr}">
                							 	
                							<%-- <img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:30px;cursor:pointer;" onclick="deleteItem(this);" /> --%>
                							</tr>
                                            </c:forEach> 
												</tbody>
												</table>
										</div>
								</div>
							</div>
							
						</div>
						<div class="row" style="text-align: center;">
							<input type="button" class="btnCls" style="" onclick="createSubscription('edit')" value="Update" />
						<c:if test= "${sessionScope.role == 'super admin'}">
								<input type="button" class="btnCls buttonMargin" style="" onclick="viewSubscriptions('subscriptions','subscription','0','menu');"
									value="<spring:message code="cancel.label" />" />
							</c:if>
							<c:forEach var="accessControl"
								items="${sessionScope.CustomerLoyality}">
								<c:if
									test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" style=""
										onclick="viewSubscriptions('subscriptions','subscription','0','menu');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
							</c:forEach>
						</div>
						<br />
						<div class="box-footer"></div>
					</form>
				</div>

			</div>
		</div>
	</section>

</body>
</html>