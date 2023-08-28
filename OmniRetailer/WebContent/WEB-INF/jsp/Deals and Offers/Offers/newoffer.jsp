
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/newoutlet.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dealsAndOffers/offers.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fontselect.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.fontselect.min.js"></script>
<link
	href="${pageContext.request.contextPath}/css/colorpicker/bootstrap-colorpicker.min.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/plugins/colorpicker/bootstrap-colorpicker.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		 $(this).scrollTop(0);
		// toggleItemSpecificSaleprice('offercategory');
		/* if($("#itemDisountBased").is(':checked'))
			$("#basedOnProduct").prop("checked", true); */
	//if($("#itemDisountBased").prop("checked")){
		if($("#itemDisountBased").prop("checked")){
			$("#basedOnProduct").prop("checked", true);
			$(".b2cVisibility").hide();
		/* 	var dateTime = getCurrentDate();
			  var date = dateTime.split(' ');
			  date = date[0].split('/');
			  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
			//  $('#date').val(formatedDate);
			  $('#createddate').val(formatedDate); */
		}
			
			
		/* var subCategories = $("#subCategories").val();
		var parsedJson = jQuery.parseJSON(subCategories);     
		var category = $("#saleCategory").val();
		var subcategoryArray = new Array();
		subcategoryArray = parsedJson[category];
		if(subcategoryArray != undefined){
			var op = '';
			for(var i=0;i<subcategoryArray.length;i++){
				op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
			}
			$("#sale_sub_category").html(op);
		}
		 $('#saleCategory').change(function () {
			 var category = $("#saleCategory").val();
			 subcategoryArray = parsedJson[category];
			 	var op = '';
				for(var i=0;i<subcategoryArray.length;i++){
					op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
				}
				$("#sale_sub_category").html(op);
		    }); */
		var dateTime = getCurrentDate();
		var date = dateTime.split(' ');
		date = date[0].split('/');
		var formatedDate = date[2] + "/" + date[0] + "/" + date[1];
		$('#offerStartDate').val(formatedDate);
		callCalender('fromDate');
		callCalender('endDate');
		$(".subBlock").hide();
		$(".customer").css("display", "block");
		print_country("country");
		callCalenderYYYYMMDD('offerStartDate');
		callCalenderYYYYMMDD('offerEndDate');
		callCalenderYYYYMMDD('closedOn');
		/* create one slab while loading */
		// addOfferSlab();
		$("#dealImageTextFont").fontselect();
		$("#saleTextFont").fontselect();
		$("#dealTextFont").fontselect();
		setDealSlabDivContent();
		setDealProductSlabDivContent();
		
		 /* $(".itemDiscount").click(function () { //when click on flip radio button

		        if (!$(this).find('input:radio').prop('checked')) {

		            $(this).find('input:radio').prop('checked', true);
		        } else {
		            $(this).find('input:radio').prop('checked', false);  
		        }
		    }); */
		
	});
	
	function getFont(ele) {
		var font = $(ele).attr("data-value").replace(/\+/g, ' ');
		$(".font-select").removeClass("font-select-active");
		$(".fs-drop").css("display", "none");
		$(ele).parents(".font-select").children("a").children("span")
				.text(font);
		var selectId = $(ele).parents(".font-select").siblings("select").attr(
				"id");
		$("#" + selectId + "Hidden").val(font);
		// $(ele).parents(".font-select").siblings("select").val(font);
		$(".font-select").trigger("click");
	}
</script>
<style type="text/css">
.modal-dialog {
       width: auto;
    position: absolute;
    margin-top: 5%;
    margin-left: 31%;
}
.browsebutton {
    border-radius: 0px;
    padding: 2px;
    height: 28px;
    /* -webkit-box-shadow: none; */
    box-shadow: none;
    background: #777;
    color: #fff;
    font-size: 8px;
    border: 1px solid transparent;
}

.fileUpload {
    position: relative;
    overflow: hidden;
    width: 99px;
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

 .span2 {
	width: 14.05%;
	*width: 14.05%;
}

.disableItemSpecific {
	pointer-events: none;
	/* for "disabled" effect */
	opacity: 0.5;
}

.table>thead>tr>th {
	padding: 3px;
}

.col-xs-12 {
	padding: 2% 25%;
}

#cbgroup {
	height: 90px;
	overflow: auto;
	border: 1px solid #e5e6e6;
}

.checkbox {
	margin-left: 8%;
}

img.thumbnail {
	background: none repeat scroll 0 0 #FFFFFF;
	margin-bottom: 0px !important;
	border: none !important;
}

.image:before {
	content: "";
	display: inline-block;
}

.image {
	-moz-box-sizing: border-box;
	float: left;
}

.delete {
	position: relative;
	vertical-align: middle;
	display: inline-block;
}

.delImage {
	/* content: ''; */
	position: absolute;
	top: 0;
	right: 0;
	height: 16px;
	width: 16px;
	cursor: pointer;
}

.myFile {
	/*  position: relative;
  overflow: hidden;
  float: left;
  clear: left; */
}

.myFile input[type="file"] {
	/*   display: block;
  position: absolute;
  top: 0;
  right: 0;
  opacity: 0;
  font-size: 100px;
  filter: alpha(opacity=0);
  cursor: pointer; */
	
}

.row-fluid-5 {
	width: 100%;
	*zoom: 1;
}

.row-fluid-5:before, .row-fluid-5:after {
	display: table;
	line-height: 0;
	content: "";
}

.row-fluid-5:after {
	clear: both;
}

.row-fluid-5 [class*="span"] {
	display: block;
	float: left;
	width: 100%;
	min-height: 30px;
	margin-left: 1.875%;
	*margin-left: 1.875%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.row-fluid-5 .controls-row [class*="span"]+[class*="span"] {
	margin-left: 1.875%;
}

.row-fluid-5 [class*="span"]:first-child {
	margin-left: 0;
}

.row-fluid-5 .span2 {
	width: 18.5%;
	*width: 18.5%;
}

.row-fluid-5 .span8 {
	width: 74%;
	*width: 74%;
}

.span222 {
	width: 9.5% !important;
}
.span22{
width: 16.0% !important;
}


/* responsive ONLY */
@media ( max-width : 600px) {
	/* spans reduce to 100px then go full width */
	.row-fluid-5 [class*="span"] {
		margin-left: 0;
		float: left;
		width: 100%;
		padding: 10px;
	}
	.span222, .span22 {
	width: 100% !important;
	}
	.complexDiscountTable {
		margin-left: 0px !important;
	}

	
}

.spanTextboxwidth
{
width:100px
}

</style>

<style>
label {
	font-weight: normal;
}
</style>
</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="box box-primary">
					<%--  <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="new_offer.label" /></h3>
                                </div> --%>
					<!-- /.box-header -->
					<!-- form start -->
					<form method="POST">
						<div class="box-body">
							<div class="row" style="text-align: right; margin-top: 10px;">
								<div id="Error" class="Error"
									style="text-align: center; color: red; font-weight: bold;">${error}</div>
									<div id="Success" class="Error"
									style="text-align: center; color: blue; font-weight: bold;">${success}</div>
								<input type="button" id="submit"
									style="position: relative; margin-right: 1%"
									class="btn bg-olive btn-inline" onclick="createOffer()"
									value="<spring:message code="submit.label" />" />
<%-- 								<c:if test="${sessionScope.role == 'super admin'}"> --%>
									<input type="button" class="btn bg-olive btn-inline"
										style="margin-right: 2%; position: relative;"
										onclick="viewdealsandoffers('offers','','0')"
										value="<spring:message code="cancel.label" />" />
								<%-- </c:if>
								<c:forEach var="accessControl"
									items="${sessionScope.dealsAndOffers}">
									<c:if
										test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btn bg-olive btn-inline"
											style="margin-right: 2%; position: relative;"
											onclick="viewdealsandoffers('offers','','0')"
											value="<spring:message code="cancel.label" />" />
									</c:if>
								</c:forEach> --%>
								<!-- <hr style="margin-top: 4px;width: 99%;" /> -->
							</div>
							<div class="row">
								<div class="col-lg-12"
									style="text-align: center; margin-top: 25px;">
									<div
										style="font-weight: bold; font-size: 19px; color: #666; margin-bottom: -42px;">
										<span style="background-color: white;">&nbsp;<spring:message
												code="customer.profiling" />&nbsp;
										</span>
									</div>
									<div class="col-lg-2"></div>
									<div class="form-group col-lg-10" style="margin-bottom: 4px;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -16px; margin-top: 0px; margin-bottom: -26px;"
											onclick="activateHeader('customer');" id="customerImg" alt=""
											src="${pageContext.request.contextPath}/images/rightHeaderIconGreen.png">
									</div>
									<hr
										style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
									<hr
										style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
								</div>
							</div>
							<div class="customer subBlock">

								<div class="row">
									<div class="col-lg-6"
										style="border-right-color: green; border-right-width: 1px; border-right-style: solid;">
										<div class="col-lg-12">
											<div class="form-group col-lg-4" style="padding-left: 0px;">
												<label><spring:message code="country.label" /></label> <select
													onchange="print_state('states',this.selectedIndex);"
													id="country" name="country" class="form-control">
													<option value="Select Country">Select Country</option>
												</select>
											</div>
											<%-- <div class="form-group col-lg-4">
												<label><spring:message code="customer.type.label" /></label>
												<select id="customerType" name="customerType"
													class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="PREMIUM">PREMIUM</option>
													<option value="PLUS">PLUS</option>
													<option value="BASIC">BASIC</option>
													<option value="GENERIC">GENERIC</option>
													<option value="EMPLOYEE">EMPLOYEE</option>
													<!-- <option >Select Country</option> -->
												</select>
											</div> --%>
											
											
											<div class="form-group col-lg-4">
												<label><spring:message code="age.label" /></label> <select
													id="age" name="age" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="1-12">1 to 12</option>
													<option value="13-19">13 to 19</option>
													<option value="20-30">20 to 30</option>
													<option value="31-40">31 to 40</option>
													<option value="41-50">41 to 50</option>
													<option value="51-60">51 to 60</option>
													<option value="61-100">61 and above</option>
												</select>
											</div>
											
											<div class="form-group col-lg-4">
												<label><spring:message code="gender.label" /></label> <select
													id="gender" name="gender" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Male">Male</option>
													<option value="Female">Female</option>
													<option value="Other">Other</option>
												</select>
											</div>
											
											
											
										</div>
										<div class="col-lg-12">
											<div class="form-group col-lg-4" style="padding-left: 0px;">
												<label><spring:message code="region.label" /></label> <select
													id="states" class="form-control">
													<option value="Select State">Select State</option>
												</select>
											</div>
											
											<div class="form-group col-lg-4">
												<label><spring:message code="marital.status.label" /></label>
												<select id="otherDetails" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Married">Married</option>
													<option value="Unmarried">Unmarried</option>
												</select>
											</div>
											
											
											<div class="form-group col-lg-4">
												<label><spring:message code="children.label" /></label> <select
													id="children" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5 or Above">5 or Above</option>
												</select>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group col-lg-4" style="padding-left: 0px;">
												<label><spring:message code="city.label" /></label> <input
													type="text" id="city" class="form-control">
												<!--  <select id ="city" class="form-control" >
																<option >Select State</option>
															</select> -->
											 <span id="cityError" style="text-align:right;color:red;font-weight:bold;"></span>
											</div>
										
										
										
										<div class="form-group col-lg-4">
												<label><spring:message code="occupation.label" /></label> <select
													id="occupation" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Business">Business</option>
													<option value="Accountant">Accountant</option>
													<option value="Software Professional">Software Professional</option>
													<option value="Engineer">Engineer</option>
													<option value="Professor">Professor</option>
													<option value="Bureaucrat">Bureaucrat</option>
													<option value="Financial Professional">Financial Professional</option>
													<option value="Doctor">Doctor</option>
													<option value="Others">Others</option>
												</select>
										</div>
										
										
										<div class="form-group col-lg-4">
												<label><spring:message code="customer.type.label" /></label>
												<select id="customerType" name="customerType"
													class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="BASIC">BASIC</option>
													<option value="NORMAL">NORMAL</option>
													<option value="GENERIC">GENERIC</option>
													<option value="SILVER">SILVER</option>
													<option value="GOLD">GOLD</option>
													<option value="PLATINUM">PLATINUM</option>
													<option value="PREMIUM">PREMIUM</option>
													<option value="PLUS">PLUS</option>
													<option value="EMPLOYEE PREMIUM">EMPLOYEE PREMIUM</option>
													<option value="EMPLOYEE GENERIC">EMPLOYEE GENERIC</option>
												    <option value="MEMBERSHIP SILVER">MEMBERSHIP SILVER</option>
							                        <option value="MEMBERSHIP PLATINUM">MEMBERSHIP PLATINUM</option>
							                       <option value="MEMBERSHIP GOLD">MEMBERSHIP GOLD</option>
							                       
							                       <c:forEach var="groupid" items="${groupids}">
														<option value="${groupid}">${groupid}</option>
													</c:forEach>
												
													
												</select>
											</div>
										
										
										</div>

										<div class="col-lg-12">
											<div class="form-group col-lg-4" style="padding-left: 0px;">
												<label><spring:message code="sales.zone.label" /></label> <select
													type="text" id="salesZone" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<c:forEach var="zone" items="${zones}">
														<option value="${zone}">${zone}</option>
													</c:forEach>
												</select>
												<!--  <select id ="city" class="form-control" >
																<option >Select State</option>
															</select> -->
											</div>
											
											<div class="form-group col-lg-5">
												<label><spring:message code="income.group.label" /></label>
												<select id="incomeGroup" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Lower Income">Lower Income</option>
													<option value="Middle Income">Middle Income</option>
													<option value="High Net worth Individual">High Net
														worth Individual</option>
													<option value="Ultra-Rich">Ultra-Rich</option>
												</select>
											</div>
											
											
											
										</div>

									<%-- 	<div class="row">
											<div class="form-group col-lg-6">
												<label><spring:message code="children.label" /></label> <select
													id="children" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5 or Above">5 or Above</option>
												</select>
											</div>
											<div class="form-group col-lg-6">
												<label><spring:message code="occupation.label" /></label> <select
													id="occupation" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Business">Business</option>
													<option value="Accountant">Accountant</option>
													<option value="Software Professional">Software
														Professional</option>
													<option value="Engineer">Engineer</option>
													<option value="Professor">Professor</option>
													<option value="Bureaucrat">Bureaucrat</option>
													<option value="Financial Professional">Financial
														Professional</option>
													<option value="Doctor">Doctor</option>
													<option value="Others">Others</option>
												</select>
											</div>
										</div> --%>
										<%-- <div class="row">
											<div class="form-group col-lg-6">
												<label><spring:message code="income.group.label" /></label>
												<select id="incomeGroup" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Lower Income">Lower Income</option>
													<option value="Middle Income">Middle Income</option>
													<option value="High Net worth Individual">High Net
														worth Individual</option>
													<option value="Ultra-Rich">Ultra-Rich</option>
												</select>
											</div>
										</div> --%>
									</div>
								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group col-lg-4">
												<label id="fromDateLabel"><spring:message
														code="deal_start_date.label" /></label> <input
													class="form-control calendar_icon" readonly="readonly"
													style="background-color: white;" id="fromDate"
													onfocus="callCalender('fromDate')"
													onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY" />
											</div>
											<div class="form-group col-lg-2"></div>
											<div class="form-group col-lg-6">
												<label><spring:message
														code="customer.turnover.label" /></label>
												<div class="row">
													<div class="col-lg-6" style="padding-right: 5px;">
														<input type="text" class="form-control" id="startPrice"
															required
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="start.price.label" />" />
													</div>
													<div class="col-lg-6" style="padding-left: 5px;">
														<input type="text" class="form-control" id="endPrice"
															required
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="end.price.label" />" />
													</div>
												</div>
											</div>
											<%-- <div class="form-group col-lg-6">
												<label><spring:message code="purchase.channel.label" /></label>
												<select id="purchaseChannel" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Direct Shopping">Direct Shopping</option>
													<option value="Telephone">Telephone</option>
													<option value="Online">Online</option>
													<option value="Mobile">Mobile</option>
													<option value="Sales Personnel">Sales Personnel</option>
												</select>
											</div> --%>
										</div>
										</div>
										<div class="row">
										<div class="col-lg-12">
											<div class="form-group col-lg-5">
												<label><spring:message code="offer_end_date.label" /></label>
												<input class="form-control calendar_icon"
													readonly="readonly" style="background-color: white;"
													id="endDate" onfocus="callCalender('endDate')"
													onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
											     <span id="endDateErr" style="text-align:right;color:red;font-weight:bold;"></span>
											</div>
											<div class="form-group col-lg-1"></div>
											<div class="form-group col-lg-6">
												<label><spring:message code="purchase.channel.label" /></label>
												<select id="purchaseChannel" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="Direct Shopping">Direct Shopping</option>
													<option value="Telephone">Telephone</option>
													<option value="Online">Online</option>
													<option value="Mobile">Mobile</option>
													<option value="Sales Personnel">Sales Personnel</option>
												</select>
											</div> 
											
											<%-- <div class="form-group col-lg-6">
												<label><spring:message code="product.category.label" /></label>
												<select id="productCategory" onchange="emptyProduct();"
													name="productCategory" class="form-control">
													<option value="">-- Select --</option>
													<c:forEach var="category" items="${categories}">
														<option value="${category.categoryName}">${category.categoryDescription}</option>
														
														 
														<option value="${category}">${category}</option>
													</c:forEach>
												</select>
											</div> --%>
										</div>
										</div>
									<%-- 	<div class="row">
											<div class="form-group col-lg-6">
												<label><spring:message
														code="customer.turnover.label" /></label>
												<div class="row">
													<div class="col-lg-6" style="padding-right: 5px;">
														<input type="text" class="form-control" id="startPrice"
															required
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="start.price.label" />" />
													</div>
													<div class="col-lg-6" style="padding-left: 5px;">
														<input type="text" class="form-control" id="endPrice"
															required
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="end.price.label" />" />
													</div>
												</div>
											</div>
											<div class="form-group col-lg-6">
												<label><spring:message code="product.label" /></label> <input
													type="text" class="form-control searchItems"
													id="searchProduct"
													placeholder="<spring:message code="search.product.label" />"
													style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
												<div class="services">
													<div class="items">
														<ul class="matchedStringUl searchProduct" style=""></ul>
													</div>
												</div>
												<input type="hidden" id="product">
												<!-- <select id ="product" class="form-control" >
																<option value="-- Select --" >-- Select --</option>
															</select> -->
											</div>
										</div> --%>
										<div class="row">
											<div class="col-lg-12">
											<div class="form-group col-lg-4">
												<label><spring:message code="customer.rating.label" /></label>
												<select id="customerRating" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
											</div>
												<div class="col-lg-2"></div>
											<div class="form-group col-lg-6">
												<label><spring:message code="referrals.label" /></label> <select
													type="text" id="referrals" class="form-control">
													<option value="-- Select --">-- Select --</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
												</select>
											</div>
										</div>
										</div>
										<%-- <div class="row">
											<div class="col-lg-6" style="">
												<label><spring:message code="department.label" /></label> <select
													class="form-control" id="outletDepartmentId"
													onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId')">
													<option value=""><spring:message code="ALL.label" /></option>
													<c:forEach var="departmentList" items="${departmentList}">
														<option value="${departmentList.primaryDepartment}"
															${departmentList.primaryDepartment == department ? 'selected' : ''}
															id="${departmentList.primaryDepartment}">${departmentList.primaryDepartment}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-lg-6" style="">
												<label><spring:message code="subdepartment.label" /></label>
												<select class="form-control" id="outletSubDepartmentId">
													<option value=""><spring:message code="ALL.label" /></option>
													<c:forEach var="departmentList" items="${departmentList}">
														<option value="${departmentList.primaryDepartment}"
															${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''}
															id="${departmentList.primaryDepartment}">${departmentList.primaryDepartment}</option>
													</c:forEach>
												</select>
											</div>
										</div> --%>
										<div class="col-lg-12" style="font-size: 15px;">
											
											<div class="form-group col-lg-4" style="padding-left:0px">
												<label><spring:message code="selectRules.label" /></label>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
												<span style="font-size: 15px;">Browse..</span> <input
																	id="selectRulesEngineBtn"  type="file"
																	accept=".xml" class="upload"
																	onchange="addNameToTextBox('selectRulesEngineBtn');">
			                                     
																	<input type="hidden" id="salesOrderB2cdata_refId">
											</div>
											
											</div>
											<div class="col-lg-4" style="  margin-top: 22px;">
											 <input id="skuMasterFile" class="form-control" style="background-color: white;
    border: 0px;"  disabled="disabled" style="padding-left:12px">
											</div>
											
											
											<%-- <div class="form-group col-lg-6" style="margin-top: 5px;">
												<br> <input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyRoolsEngine" />&nbsp;&nbsp;&nbsp;
												<spring:message code="apply.rules.engine" />
											</div> --%>
										</div>
									</div>
								</div>
							</div>
							
							    <input type="hidden" id="createddate"  value="">
							<div class="row">
								<div class="col-lg-12"
									style="text-align: center; margin-top: 25px;">
									<div
										style="font-weight: bold; font-size: 19px; color: #666; margin-bottom: -42px;">
										<span style="background-color: white;">&nbsp;<spring:message
												code="offers.configuration.label" />&nbsp;
										</span>
									</div>
									<div class="col-lg-2"></div>
									<div class="form-group col-lg-10" style="margin-bottom: 4px;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -16px; margin-top: 0px; margin-bottom: -26px;"
											onclick="activateHeader('dealConfiguration');"
											id="dealConfigurationImg" alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									</div>
									<hr
										style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
									<hr
										style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
								</div>
							</div>
							<div class="dealConfiguration subBlock">
								<div class="row-fluid-5">
									<!--  <div class="span8"> -->
									<!-- <div class="row"> -->
									<div class="form-group span22">
										<label><spring:message code="offer_name.label" /> <span
											class="requiredField">*</span></label> <input type="text"
											class="form-control" name="offerName" id="offerName"
											placeholder="<spring:message code="offer_name_enter.label" />" />
										<span id="offerNameErr"
											style="text-align: right; color: red; font-weight: bold;"></span>
										<br> <label><spring:message
												code="deal_start_date.label" /> <span class="requiredField">*</span></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" name="offerStartDate"
												readonly="readonly" style="background: white;"
												id="offerStartDate" size="20" type="text"
												onfocus="callCalenderYYYYMMDD('offerStartDate')"
												onclick="callCalenderYYYYMMDD('offerStartDate')"
												placeholder="YYYY/MM/DD" />
										</div>
										<!-- /.input group -->
										<span id="offerStartDateError"
											style="text-align: right; color: red; font-weight: bold;"></span>
									</div>

									<div class="form-group span22">
										<label><spring:message code="offer_category.label" />
											<span class="requiredField">*</span></label> <select
											class="form-control" name="offerCategory"
											onchange="toggleItemSpecific('offercategory');"
											id="offercategory">
											<option value="item_specific"${offerBean.offerCategory == "item_specific" ? 'selected' : ''}>Item Specific Offer</option>
											<option value="turn_over"${offerBean.offerCategory == "turn_over" ? 'selected' : ''}>Total Bill(Turn Over) Offer</option>
										    <option value="group_turn_over" ${offerBean.offerCategory == "group_turn_over" ? 'selected' : ''}>Group (Turn Over) Offer</option>
										    <option value="category_turnover" ${offerBean.offerCategory == "category_turnover" ? 'selected' : ''}>Category Turnover</option>
										</select><br><label><spring:message
												code="deal_end_date.label" /> <span class="requiredField">*</span></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" name="offerEndDate"
												id="offerEndDate" readonly="readonly"
												style="background: white;" size="20" type="text"
												onfocus="callCalenderYYYYMMDD('offerEndDate')"
												onclick="callCalenderYYYYMMDD('offerEndDate')"
												placeholder="YYYY/MM/DD" />
											<!-- <input type="text" name="offerEndDate" id="offerEndDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
										</div>
										<!-- /.input group -->
										<span id="offerEndDateError"
											style="text-align: right; color: red; font-weight: bold;"></span>
									</div>

									<div class="form-group span22">
										<label><spring:message code="offer_prioroty.label" />
											<span class="requiredField">*</span></label> <select
											class="form-control" name="offerPriority" id="offerPriority">
											<option value="normal">Normal</option>
											<option value="exclusive">Exclusive</option>
										</select> <span id="lanaguageError"
											style="text-align: right; color: red; font-weight: bold;"></span>
										<br>
										<div class="col-lg-12" style="padding: 0px;">
										<div class="col-lg-6" style="padding: 0px;padding-right: 5px;">
										<div class="bootstrap-timepicker">
											<label><spring:message code="starttime.label" /> <span
												class="requiredField">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control timepicker"
													value="00:00:00" name="startTime" id="startTime" />
												<div class="input-group-addon">
													<i class="fa fa-clock-o"></i>
												</div>
											</div>
											<!-- /.input group -->
										</div>
										<!-- /.form group -->
										<span id="startTimeError"
											style="text-align: right; color: red; font-weight: bold;"></span>
											</div>
											
											
											<div class="col-lg-6" style="padding: 0px;">
											
											<div class="bootstrap-timepicker">
											<label><spring:message code="endtime.label" /> <span
												class="requiredField">*</span></label>
											<div class="input-group">
												<input type="text" name="endTime" value="23:59:59"
													class="form-control timepicker" id="endTime" />
												<div class="input-group-addon">
													<i class="fa fa-clock-o"></i>
												</div>
											</div>
											<!-- /.input group -->
										</div>
										<!-- /.form group -->
										<span id="endTimeError"
											style="text-align: right; color: red; font-weight: bold;"></span>
											</div>
										</div>
									</div>
									<div class="form-group span222">
										<label>Max Price</label> 
										<textarea class="form-control" name="maxPrice" id="maxPrice"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Item Price"></textarea>
										<br>
										<label>Min Price</label> 
										<textarea class="form-control" name="minPrice" id="minPrice"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Item Price"></textarea>
									</div>
									
									
									<div class="form-group span22">
									
									<div class="col-lg-6" style="padding-left:0px;">
									<label>Total Bills</label>
										<textarea class="form-control" name="noOfClaims" id="noOfClaims"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Total Bills"></textarea>
										
									</div>
									<div class="col-lg-6" style="padding:0px;">
									<label>Bills/Day</label>
										<textarea class="form-control" name="billsPerDay" id="billsPerDay"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Bills/Day"></textarea>
										
									</div>
										
										<br>
										
									<div class="col-lg-12" style="padding:0px;margin-top: 20px;">
										<label><spring:message code="offer_description.label" /></label>
										<textarea class="form-control" name="offerDesc" id="offerDesc"
											rows="1" style="resize: none;"
											placeholder="<spring:message code="offer_desc_enter.label" />"></textarea>
									<span id="offerDescError"
											style="text-align: right; color: red; font-weight: bold;"></span>
									</div>	
										
									</div>
									<!--  </div> -->
									<div class="form-group span22">
                                   	  	   <label><spring:message code="location.label" /></label>
		                                       <select class="form-control" style="height:98px;" name="location" id="offerLocation" onchange="return checkForB2CLocation();" multiple="multiple">
		                                          <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											   </c:forEach>
									 		</select>
                                   	  </div>
                                   	  </div>   
								
								
								
								
								
								<div class="row" style=" padding-left: 15px;padding-right:10px">
								<div class="form-group col-lg-12"
												style=" border: 1px solid #ccc;height:35px">
											<div class="col-lg-2" style="white-space: nowrap;padding: 7px;background: #c1c1c1; margin-left: -14px;"><label style="font-weight:bold">Offer Days</label></div>	
									<div class="col-md-8" style="   margin-top: 6px;    margin-left: 47px;">
									<div class="row" style="  ">
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day1" />&nbsp;&nbsp;&nbsp;
											<spring:message code="sunday.label" />
										</div>
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day2" />&nbsp;&nbsp;
											<spring:message code="monday.label" />
										</div>
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day3" />&nbsp;&nbsp;
											<spring:message code="tuesday.label" />
										</div>
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day4" />&nbsp;&nbsp;
											<spring:message code="wednesday.label" />
										</div>
										
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day5" />&nbsp;&nbsp;
											<spring:message code="thursday.label" />
										</div>
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day6" />&nbsp;&nbsp;
											<spring:message code="friday.label" />
										
											</div>
											
											
										<div class="form-group col-lg-1 span2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px;white-apce:nowrap" id="day7" />&nbsp;&nbsp;
											<spring:message code="saturday.label" />
										</div> 
							
										</div>
										<%-- <div class="form-group col-lg-2" style="padding: 0px;">
											<input type="checkbox" checked="checked"
												style="vertical-align: -2px" id="day7" />&nbsp;&nbsp;&nbsp;
											<spring:message code="saturday.label" />
										</div> --%>
									</div>
								</div>
								</div>
								
								
								
								<div class="row" style=" padding-left: 15px;padding-right:10px">
								<div class="form-group col-lg-12"
												style=" border: 1px solid #ccc;height:35px">
											<div class="col-lg-2" style="white-space: nowrap;padding: 7px;background: #c1c1c1; margin-left: -14px;"><label style="font-weight:bold">Offer/Deal Options</label></div>	
									<div class="col-md-8" style="    margin-top: 6px;margin-left:15px">
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> <input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyExchanges" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
											</div>
										
										
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> <input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyReturns" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
											</div>
											<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> <input type="checkbox"
													style="vertical-align: -2px" id="applysaleprice" />&nbsp;&nbsp;&nbsp;
												Sale price based
											</div>
											
											
									</div>
								</div>
								</div>
								
								
								<%-- 
								<div class="row" style="font-size: 15px;">
											<div class="form-group col-lg-3" style="margin-top: -20px;">
												<br> <input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyRoolsEngine" />&nbsp;&nbsp;&nbsp;
												<spring:message code="pricebasedConfiguration.label" />
											</div>
											
											
											<div class="form-group col-lg-2" style="margin-left: -57px;margin-top: -20px;">
												<br> <input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyRoolsEngine" />&nbsp;&nbsp;&nbsp;
												<spring:message code="applyforAllitems.label" />
											</div>
											
										</div>
								 --%>
								<br>
								<div class="row">
									<div class="form-group col-lg-12">
										<div class="form-group col-lg-2"
											style="padding-left: 1px; padding-right: 1px; cursor: pointer; margin-bottom: 0px;">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="offer.products.label" /> </span>
										</div>
										<div class="form-group col-lg-10"
											style="background-color: rgb(195, 195, 195); margin-bottom: 4px;">
											<span>( Please select the appropriate SKUs to
												configure the offer. Sale SKU means that specific product
												that is under offer category.) </span>
										</div>
									</div>
									<!-- <div class="col-lg-12">
                                 	<hr style="margin-top: -15px;border-top: 1px solid rgb(181,230,29);">
                                 </div> -->
								</div>
<div
									style="border: 1px solid rgb(181, 230, 29); margin: -15px -5px; padding: 5px;">
								<div style=""
									id="itemSpecificDeals">
									<div class="row">
										<div class="form-group col-lg-12">
											<input type="radio" checked="checked"
												onchange="toggleBased('basedOnProduct')"
												style="vertical-align: -2px" id="basedOnProduct" name="configureBased" />&nbsp;
											<spring:message code="configure.based.on.product.label" />
											
											<hr style="margin-top: 1px;margin-bottom: 0px;margin-left: 5px;">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12" style="margin-bottom: 0px;">
											<div class="form-group col-lg-3"
												style="margin-left: 4px;margin-top: -25px; padding-right: 58px; margin-right: -18px;border-left: 1px solid lightgray;margin-bottom: 0px;">

												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;margin-top: 25px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message
																code="product.category.label" /></label> <select
															class="form-control basedOnProduct saleGroups"
															style="background: white;"
															onchange="searchSubCategoriesBasedOnCategory('saleCategory','sale_sub_category')"
															name="category" id="saleCategory">
															<option value="">-- Select --</option>
															<c:forEach var="category" items="${categories}">
																<option value="${category.categoryName}">${category.categoryName}</option>
																
																 
																<%-- <option value="${category}">${category}</option> --%>
															</c:forEach>
														</select> <span id="lanaguageError"
															style="text-align: right; color: red; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<label><spring:message code="subcategory.label" /></label>
														<select class="form-control basedOnProduct saleGroups"
															style="background: white;" name="sub_category"
															id="sale_sub_category"
															onchange="searchSectionsBasedOnSubCategory('saleCategory','sale_sub_category','sale_section')">
															<option value="">-- Select --</option>
														</select>
													</div>
												</div>
												<br>

												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message code="department.label" /></label>
														<select class="form-control basedOnProduct saleGroups" 
															style="background: white;" name="department"
															id="sale_department" onchange="appendingbardTotable('sale_department')">
															<option value="">-- Select --</option>
															<c:forEach var="departmentList" items="${departmentList}">
																<option value="${departmentList.primaryDepartment}"
																	${departmentList.primaryDepartment == department ? 'selected' : ''}
																	id="${departmentList.primaryDepartment}">${departmentList.primaryDepartment}</option>
															 
															</c:forEach>
														</select>
													</div>

													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<label><spring:message code="section.label" /></label> <select
															class="form-control basedOnProduct saleGroups"
															style="background: white;" name="section"
															id="sale_section">
															<option value="">-- Select --</option>

														</select>
													</div>
												</div>
												<br>
												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message code="brand.label" /></label> <select
															class="form-control basedOnProduct saleGroups" onchange="appendingbardTotable(this.options[this.selectedIndex].value)"
															style="background: white;" name="brand" id="sale_brand">
															<option value="">-- Select --</option>
															<c:forEach var="brandName" items="${brandsList}">
																<option value="${brandName}">${brandName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												
										<div class="form-group col-lg-12" style="margin-top: 45px;margin-bottom: -30px;">
											<input type="radio" style="vertical-align: -2px;pointer-events: none;margin-left: -35px;" id="applyForAllItemsProduct"  name="configureBased"/>
												<spring:message code="applyforAllitems.label" /> <!--onchange="toggleComboLowestProduct('applyForAllItemsProduct')"  -->
											<hr style="margin-top: 1px;border:none;">
										</div>
												
                                         <%--  <div class="form-group col-lg-12" style="padding-left: 0px;margin-top: -20px;">
												<br> <input type="checkbox"
													onchange="toggleComboLowestProduct('applyForAllItemsProduct')"
													style="vertical-align: -2px" id="applyForAllItemsProduct" />
												<spring:message code="applyforAllitems.label" />
											</div> --%>

											</div>

											<div class="form-group col-lg-9"
												style="margin-top: 0px; border-left: 1px solid #ccc;padding-right: 0px;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 5px;">
													<input type="radio"  checked
														onchange="toggleItemComplexBased('itemDisountBased')" 
														style="vertical-align: -2px" id="itemDisountBased" class="itemWiseDiscount" name="basedOnproductCheck">&nbsp;
													<spring:message code="itemwise.discounts.label" />

													<%--<input type="text"
														class="form-control searchItems basedOnProduct saleGroups"
														id="searchItems"
														placeholder="<spring:message code="deal_enter_product_name.label" />"
														style="height:30PX;border-radius: 7px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellproducts"
																style="width: 230px;"></ul>
														</div>
													</div>
													<span id="dealSaleProducts"
														style="text-align: right; color: red; font-weight: bold;"></span>
													 <div style="overflow-x: auto; margin-bottom: 15px;">
														<table id="offerSaleProductsIds"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="product_id.label" /></th>
																	<th><spring:message code="action.label" /></th>
																</tr>
															</thead>
															<tbody style="text-align: center;">
															</tbody>
														</table>
													</div> --%>
													<div class="errorMsgLogdiv">
													<span id="ErrorNoRecords" class="Error offersellskusError"
													style="text-align: center; color: red; font-weight: bold;margin-left: 20px;"></span>
													<a onclick="downloadLogs();" style="color:blue;display: none;text-decoration: underline;cursor: pointer;" id="loglink">&nbsp;Click Here for Log!</a>
													<input type="hidden" id="urlfordoc" value=""/>
													</div>
												</div>

												<div class="col-lg-12" style="margin-left: 20px;">
														<div class="col-lg-7" style="    margin-left: -18px;">
													<input type="text"
														class="form-control searchItems basedOnProduct saleGroups searchBar itemWiseDiscount"
														id="offersellskus"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; " />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellskus"
																style=""></ul>
														</div>
													</div>
													</div>
													<div class="col-lg-3" style="padding-left:0px;padding-right: 5px;">
														<input type="file" class="btn bg-olive btn-inline"
															accept=".xlsx" id="fileUploadCSV"
															onchange="addNameToTextBox('fileUploadCSV')"
															style="padding: 3px 0px; width: 100%; margin-top: 0px;" />
													</div>
												<div class="col-lg-1" style="padding: 0px;">
						    					<input type="button"  class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelDataForOffers(this)" style="padding: 4px 8px;" />
												</div>
													<div class="col-lg-1" style="margin-left: 18px;padding-right: 1px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 18px;     float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
													</div>
													
													<!-- <div
														style="overflow-x: auto; margin-bottom: 15px; margin-top: -5px"> -->
														<table id="offerSaleSkusProduct"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="ean.label" /></th> 
																	<th><spring:message code="size.label" /></th>
																	<th>MRP</th>
																	<th>Sale Qty</th>
																	  
																<%--<th><spring:message code="range.label" /></th> --%>
																	<th><spring:message code="discount.type.label" /></th>
																	<th>Offer Qty</th>
																	<th><spring:message code="item.amount.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															<tbody style="text-align: center;">
															</tbody>
														</table>
													
												</div>
        

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 4px;">
													<input type="radio" class ="complexDiscounts"
														onchange="toggleItemComplexBased('complexDisountBased')"  name="basedOnproductCheck"
														style="vertical-align: -2px; margin-top: 33px;" id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
												</div>

												<div class="row">
												
												<div class="col-lg-12" style="margin-left: 20px">
														<div class="form-group col-lg-2" style="width:20%;margin-bottom: 5px;"  >
														
															<label><spring:message
																	code="offer_reward_type.label" /> <span
																class="requiredField">*</span></label> <select
																class="form-control complexDiscounts" name="offerReward" id="offerRewardProduct"
																onchange="toggleRepeat('offerReward')">
																<option value="fixed_rate">Fixed Rate</option>
																<option value="flat_rate">Cash Flat</option>
																<option value="percentage">Cash Discount</option>
																<option value="loyaltypoints">Loyalty Points</option>
																<option value="discountcoupon">Discount Coupon</option>
																<option value="giftvouchers">Gift Vouchers</option>
																<option value="gift_coupon">Gift Coupons</option>
															</select><span id="dealNameErr"
																style="text-align: right; color: red; font-weight: bold;"></span>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														
														</div>
														<div class="form-group col-lg-2" style="width:20%;padding-left: 0px;margin-bottom: 5px;">
														
															<label><spring:message
																	code="rewardCriteria.label" /></label> <select
																class="form-control complexDiscounts" name="offerReward" id="offerRewardCriteria"
																onclick="toggleRewardCriteria('offerRewardCriteria')">
																<option value="false">Quantity Based</option>
																<!-- <option value="true">Cart TurnOver</option>
																<option value="category_turnover">Category TurnOver</option>
																<option value="item_turnover">Item Turnover</option>
																<option value="true">TurnOver Based</option>
																<option value="item_price_range">Item Price Range</option> -->
																
																
																
															</select>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														
														</div>
														
														<div class="form-group col-lg-3"
															style="text-align: center; margin-top: 4px;padding-left: 1px;white-space:nowrap;margin-bottom: 5px;">
															<div class=" spanTextboxwidth">
															<br> <input type="checkbox" checked="checked" class ="complexDiscounts"
																style="vertical-align: -2px" id="allownMulDiscProduct" />
															<spring:message code="allow.multiple.discount.label" />
														</div>
														</div>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; margin-left: -45px; padding-right: 0px;white-space:nowrap;margin-bottom: 5px;">
															<br>
															<div class=" spanTextboxwidth">
															 <input type="checkbox" checked="checked" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatProduct" />
															<spring:message code="is.repeat.label" />
														</div>
														</div>
														<%-- <div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-right: 0px;margin-left: -34px;white-space:nowrap">
															<br> <input type="checkbox" disabled="disabled"
																onchange="toggleComboLowest('isComboProduct')"
																style="vertical-align: -2px" id="isComboProduct" />
															<spring:message code="is.combo.label" />
														</div> --%>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-left: 1px; padding-right: 0px;white-space:nowrap;margin-bottom: 5px;">
															<br> <input type="checkbox" disabled="disabled" class ="complexDiscounts"
																onchange="toggleComboLowest('lowestPriceItemProduct')"
																style="vertical-align: -2px" id="lowestPriceItemProduct" />
															<spring:message code="lowest.price.item.label" />
														</div>
														
														<%-- <div class="form-group col-lg-2" style="margin-top: 5px; width: 16%;white-space:nowrap;margin-left:-6px">
												<br> <input type="checkbox"
													onchange="toggleComboLowestProduct('priceBasedConfigurationProduct')"
													style="vertical-align: -2px" id="priceBasedConfigurationProduct" />
												<spring:message code="pricebased.label" />
											</div>
											 --%>
												
													</div>
													
													<div class="row" style="font-size: 15px;margin-left: 37px">
											<%-- <div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> <input type="checkbox"
													onchange="toggleComboLowestProduct('priceBasedConfigurationProduct')"
													style="vertical-align: -2px" id="priceBasedConfigurationProduct" />
												<spring:message code="pricebased.label" />
											</div>
											
											 --%>
											<%-- <div class="form-group col-lg-4" style="margin-left:0px;margin-top: -20px;">
												<br> <input type="checkbox"
													onchange="toggleComboLowestProduct('applyForAllItemsProduct')"
													style="vertical-align: -2px" id="applyForAllItemsProduct" />
												<spring:message code="applyforAllitems.label" />
											</div> --%>
											
										</div>
										
									
												</div>
												<div id="row">
													<div class="table-responsive" 
														style="overflow: auto;white-space: nowrap;margin-left: 37px;">
														<table id="slabLis"
															class="table table-bordered table-hover"
															style="width: 100%;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr id="slabTr">
																<th><spring:message code="sno.label" /></th>
																	<th style="width: 10%"><spring:message
																			code="categoryDepartmentBrand.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="minQty.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="minAmt.label" /></th>
																	
																	<th style="width: 12%"><spring:message
																			code="offer_reward_value.label" /></th>
																	
																	<th style="width: 12%">Start Value</th><!--<spring:message code="start.price.label"/>-->
								   								   <th style="width: 12%">End Value</th><!--<spring:message code="end.price.label"/>-->		
																	<th style="width: 7%"><spring:message
															code="action.label" /></th>		

																</tr>
															</thead>
															<tbody style="text-align: center;">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept1"> <input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value=""/> <input type="hidden" id="selectedBrandId" value=""> <input type="hidden" id="selectedDeptId" value=""> </td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="1minquantityProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control minAmtProduct"
																		type="text" id="1minamountProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	
																	<td style="width: 12%"><input class="form-control"
																		type="text" id="1rewardvalueProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	
                                                                      <td style="width: 12%"><input
																		class="form-control startPricePro" type="text"
																		id="1startPriceProduct"  value="0"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control endPricePro" value="0"
																		type="text" id="1endPriceProduct" 
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                                                     <td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																onclick="addProductOfferSlab()"> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;" id="1imgProduct"
																	onclick="deleteProductSlab($(this).closest('tr').attr('id'))">
														</div></td>

																</tr>
															</tbody>
														</table>
													</div>
												</div>
												
											<div class="col-lg-12" style="margin-left: 20px;">
											<label>Exclude Category Items<span id="" class="Error offersellskusExcludeError"
													style="text-align: center; color: red; font-weight: bold;margin-left: 20px;"></span></label>
														
													<input type="text"
														class="form-control searchItems basedOnProduct searchBar itemWiseDiscount"
														id="offersellskusExclude"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; " />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellskusExclude"
																style=""></ul>
														</div>
													</div>
												
													
											<%-- <div class="col-lg-1" style="margin-left: 18px;padding-right: 1px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 18px;     float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
													</div> --%>
													
													<!-- <div
														style="overflow-x: auto; margin-bottom: 15px; margin-top: -5px"> -->
														<table id="offerSaleSkusProductExclude"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="ean.label" /></th> 
																	<th>Measure Range</th>
																	<th><spring:message code="size.label" /></th>
																	<th>Color</th>
																	<th><spring:message code="item.amount.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															<tbody style="text-align: center;">
															</tbody>
														</table>
													
												</div>
												
												
												
												
											</div>
										</div>
									</div>
									
									
									
									
								<div class="row">
										<%-- <div class="form-group col-lg-12" style="margin-top: -10px;">
											<input type="radio" style="vertical-align: -2px;pointer-events: none;" id="applyForAllItemsProduct"  name="configureBased"/>
												<spring:message code="applyforAllitems.label" /> <!--onchange="toggleComboLowestProduct('applyForAllItemsProduct')"  -->
											<hr style="margin-top: 1px;border:none;">
										</div> --%>
									</div>
									
									
									
								</div>
								
								
								<div id= "configureBasedOnGroup" style="margin-top: 20px;">
									<div class="row">
										<div class="form-group col-lg-12">
											<input type="radio" onchange="toggleBased('basedOnGroup')"
												style="vertical-align: -2px" id="basedOnGroup" name="configureBased"/>&nbsp;&nbsp;&nbsp;
											<spring:message code="configure.based.on.group.label" />
											<hr style="margin-top: 1px;margin-bottom: 0px;margin-left: 5px;">
										</div>
									</div>
									<div class="row">
									
										<div class="form-group col-lg-12" style="margin-bottom: 0px;">
										<div class="form-group col-lg-3" style="margin-top: -25px;border-left: 1px solid lightgrey;margin-left: 4px;width: 23%;margin-bottom: 0px;height: 340px;padding-left: 5px;">
											

											<div class="form-group col-lg-12" style="    margin-top: 30px;">
											<label><spring:message code="sale_group_id.label" /></label>
											<input type="text"
												class="form-control searchItems basedOnGroup saleGroups searchBar"
												readonly="readonly" id="saleGroup"
												placeholder="<spring:message code="enter.group.label" />"
												style="" />
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl saleGroup" style="width: 230px;"></ul>
												</div>
											</div>
											<div style="overflow-x: auto; margin-top: -8px;margin-bottom: 11px;">
												<table id="saleGroupProductsId"
													class="table table-bordered table-hover"
													style="margin-top: 10px; margin-bottom: 5px;">
													<thead style="background-color: #3c8dbc; color: #ffffff">
														<tr>
															<th style="width: 100px;"><spring:message
																	code="sale_group_id.label" /></th>
																	<th><spring:message code="action.label" /></th>
														</tr>
													</thead>
													<tbody style="text-align: center;">
													</tbody>
												</table>
											</div>
											</div>
											
											<div class="form-group col-lg-12" style="">
											<label><spring:message code="buy_sku_id.label" /></label> <input
												type="text"
												class="form-control searchItems basedOnGroup saleGroups searchBar"
												readonly="readonly" id="saleGroupSkuSearch"
												placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
												style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl saleGroupSkuOffer"
														style="width: 230px;"></ul>
												</div>
											</div>
											<div style="overflow-x: auto; margin-bottom: 15px;">
												<table id="saleGroupSkuOffer"
													class="table table-bordered table-hover"
													style="margin-top: 3px; margin-bottom: 5px;">
													<thead style="background-color: #3c8dbc; color: #ffffff">
														<tr>
															<th><spring:message code="skuid.label" /></th>
															<%--  <th><spring:message code="ean.label" /></th>  --%>
															<th><spring:message code="action.label" /></th>

														</tr>
													</thead>
													<tbody style="text-align: center;">
													</tbody>
												</table>
												
												
												
												
											</div>
											
											
											
										</div>
											<%-- <div class="form-group col-lg-12" style="padding-left: 0px;margin-top: -20px;">
												<br> <input type="checkbox"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" />
												<spring:message code="applyforAllitems.label" />
											</div> --%>
											
									<div class="form-group col-lg-12" style="margin-top: 60px;margin-bottom: 0px;margin-left: -25px;">
											<input type="radio"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px;pointer-events: none;" id="applyForAllItemsGroup" name="configureBased"/>
												<spring:message code="applyforAllitems.label" />
											<hr style="margin-top: 1px;border:none;">
										</div>
									
										
											
											
										</div>
										<%-- <div class="form-group col-lg-3" style="margin-top: -25px;">
											<label><spring:message code="buy_sku_id.label" /></label> <input
												type="text"
												class="form-control searchItems basedOnGroup saleGroups"
												readonly="readonly" id="saleGroupSkuSearch"
												placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
												style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl saleGroupSku"
														style="width: 230px;"></ul>
												</div>
											</div>
											<div style="overflow-x: auto; margin-bottom: 15px;">
												<table id="saleGroupSku"
													class="table table-bordered table-hover"
													style="margin-top: 10px; margin-bottom: 5px;">
													<thead style="background-color: #3c8dbc; color: #ffffff">
														<tr>
															<th><spring:message code="skuid.label" /></th>
															 <th><spring:message code="ean.label" /></th> 
															<th><spring:message code="action.label" /></th>

														</tr>
													</thead>
													<tbody style="text-align: center;">
													</tbody>
												</table>
											</div>
										</div> --%>
										
										
										<div class="form-group col-lg-9"
												style="margin-top: 10px; border-left: 1px solid #ccc;padding-right: 0px;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;">
													<input type="radio" 
														onchange="toggleItemComplexBased('itemDisountBasedGroup')" 
														style="vertical-align: -2px" name="basedOngroupCheck"  id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.discounts.label" />
													<span id="" class="Error offersellskusgroupError" style="text-align: center; color: red; font-weight: bold;margin-left: 20px;"></span>
													</div>
													
													
													
													<div class="form-group col-lg-12" style="margin-left: 20px;">
													<input type="text"
														class="form-control searchItems basedOnGroup saleGroups searchBar"
														id="offersellskusgroup"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; border-radius: 7px !important" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellskusgroup"
																style=""></ul>
														</div>
													</div>
													<div
														style="overflow-x: auto; margin-bottom: 15px; margin-top: -5px">
														<table id="offerSalegroupSkus"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="ean.label" /></th> 
																	<th><spring:message code="size.label" /></th>
																	 <th><spring:message code="minQty.label" /></th>
																	<%-- <th><spring:message code="range.label" /></th> --%>
																	<th><spring:message code="discount.type.label" /></th>
																	<th><spring:message code="item.amount.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															<tbody style="text-align: center;">
															</tbody>
														</table>
													</div>
												</div>
												
												
												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 4px;">
													<input type="radio"  name="basedOngroupCheck" 
														onchange="toggleItemComplexBased('complexbasedOnGroup')" style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.discounts.label" />
												</div>
													
												
												
												
												<div class="row">
													<div class="col-lg-12" style="margin-left: 20px">
														<div class="form-group col-lg-2" style="margin-bottom:5px;">
															<label><spring:message
																	code="offer_reward_type.label" /> <span
																class="requiredField">*</span></label> <select
																class="form-control" name="offerReward" id="offerReward"
																onchange="toggleRepeat('offerReward')">
																<option value="fixed_rate">Fixed Rate</option>
																<option value="flat_rate">Cash Flat</option>
																<option value="percentage">Cash Discount</option>
																<option value="loyaltypoints">Loyalty Points</option>
																<option value="discountcoupon">Discount Coupon</option>
																<option value="giftvouchers">Gift Vouchers</option>
																<option value="gift_coupon">Gift Coupons</option>
															</select><span id="dealNameErr"
																style="text-align: right; color: red; font-weight: bold;"></span>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														</div>
														
														
														<div class="form-group col-lg-2" style="white-space: nowrap;padding-left:0px;margin-bottom:5px;">
														
															<label><spring:message
																	code="rewardCriteria.label" /></label> <select
																class="form-control" name="offerReward" id="offerRewardCriteriaGroup"
																onclick="toggleComboLowest('offerRewardCriteriaGroup')">
																<option value="false">Quantity Based</option>
																<!-- <option value="true">TurnOver Based</option> -->
															</select>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														
														</div>
														
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px;padding-left: 1px;white-space:nowrap;margin-bottom:5px;">
															<br> <input type="checkbox" checked="checked"
																style="vertical-align: -2px" id="allownMulDisc" />
															<spring:message code="allow.multiple.discount.label" />
														</div>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 25px; margin-left:5px; padding-right: 0px;white-space:nowrap;margin-bottom:5px;">
															<input type="checkbox" checked="checked"
																style="vertical-align: -2px" id="isRepeat" />
															<spring:message code="is.repeat.label" />
														</div>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-right: 0px;margin-left: -25px;white-space:nowrap;margin-bottom:5px;">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('isCombo')"
																style="vertical-align: -2px" id="isCombo" />
															<spring:message code="is.combo.label" />
														</div>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-left: 0px; padding-right: 0px;white-space:nowrap;margin-bottom:5px;">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('lowestPriceItem')"
																style="vertical-align: -2px" id="lowestPriceItem" />
															<spring:message code="lowest.price.item.label" />
														</div>
														
														<%-- <div class="form-group col-lg-2" style="margin-top: 5px; width: 16%;white-space:nowrap;margin-left:-6px">
												<br> <input type="checkbox"
													onchange="toggleComboLowest('priceBasedConfigurationGroup')" 
													style="vertical-align: -2px" id="priceBasedConfigurationGroup" />
													<spring:message code="pricebased.label" />
											</div> --%>
													</div>
													
													<div class="row" style="font-size: 15px;margin-left:33px">
											<%-- <div class="form-group col-lg-2" style="margin-top: 3px;">
												<br> <input type="checkbox"
													onchange="toggleComboLowest('priceBasedConfigurationGroup')" 
													style="vertical-align: -2px" id="priceBasedConfigurationGroup" />
													<spring:message code="pricebased.label" />
											</div> --%>
											
											
											
											
										</div>
													
												</div>


                                         <input type="hidden" id="typeForGroup" value="new">

												<div id="ro" style="overflow: auto;white-space: nowrap;margin-left: 37px;">
													<div class="table-responsive" style="margin-top: 0px;">
										<table id="slabsList" class="table table-bordered table-hover"
											style="width: 100%;">
											<thead style="background-color: #3c8dbc; color: #ffffff">
												<tr id="slabTr">
													<th style="display: none;"><spring:message
															code="deal_slabname.label" /></th>
													<th style="width: 10%"><spring:message
															code="groupid.label" /></th>
													<th style="width: 10%"><spring:message
															code="item_id.label" /></th>
													<th style="width: 15%"><spring:message
															code="minQty.label" /></th>
													<th style="width: 15%"><spring:message
															code="minAmt.label" /></th>
													<th style="width: 12%"><spring:message
															code="offer_reward_type.label" /></th>
													<th style="width: 12%"><spring:message
															code="offer_reward_value.label" /></th>
													<th style="width: 12%"><spring:message
															code="reward.quantity.label" /></th>
													<th style="width: 12%"><spring:message
															code="range.mode.label" /></th>
													<th style="width: 15%"><spring:message
															code="description.label" /></th>
													<th style="width: 12%">Start Value</th><%-- <spring:message code="start.price.label" /> --%>
								   					<th style="width: 12%">End Value</th><!--<spring:message code="end.price.label" />  -->
													<th style="width: 7%"><spring:message
															code="action.label" /></th>
												</tr>
											</thead>
											<tbody style="text-align: center;">
												<tr id="range1">
													<td style="display: none;"><span id="1rangename">range1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="1groupId" style="width:100px"
														placeholder="<spring:message code="enter.group.label" />" />
														<div class="services">
															<div class="items">
																<ul class="matchedStringUl 1groupId"
																	style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													<td style="width: 10%"><input type="text"
																		class="form-control itemSearch"
																		onblur="" style="width:100px"
																		onkeydown="keyDownMethod(event.keyCode,this);"
																		id="1itemIdgroup"
																		placeholder="<spring:message code="enter.item.id.label" />" />
																		<div class="services">
																			<div class="items">
																				<ul class="matchedStringUl 1itemIdgroup"
																					style="width: 138px;"></ul>
																			</div>
																		</div> <input type="hidden" id="selected1itemIdgroup"> <input
																		type="hidden" id="pluCode1itemIdgroup"></td>
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="1minquantity"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control minAmt"
														type="text" id="1minamount"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td><select class="form-control" name="offerReward"
														id="1rangeRewardType">
															<option value="ALL">ALL</option>
															<option value="fixed_rate">Fixed Rate</option>
															<option value="flat_rate">Cash Flat</option>
															<option value="percentage">Cash Discount</option>
															<option value="loyaltypoints">Loyalty Points</option>
															<option value="giftvouchers">Gift Vouchers</option>
															<option value="gift_coupon">Gift Coupons</option>
													</select></td>
													<td style="width: 12%"><input class="form-control rewardvalue"
														type="text" id="1rewardvalue"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input
														class="form-control rewardQuantity" type="text"
														id="1rewardQuantity" value="0"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td><select class="form-control" disabled="disabled"
														name="rangeMode" id="1rangeMode"
														onchange="changeRangeMode(this);">
															<option value="both">Both</option>
															<option value="condition">Condition</option>
															<option value="promotion">Promotion</option>
													</select></td>
													<td style="width: 12%"><input class="form-control"
														type="text" id="1description" /></td>
														
														<td style="width: 12%"><input
																		class="form-control startPrice" type="text"
																		id="1startPrice"  name="startPriceProduct"
																	value="0"	oninput="this.value = this.value.replace(/[^0-9.]/g, '');  this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control endPrice"
																		type="text" id="1endPrice"  name="endPriceProduct"
																	value="0"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
														
													<td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																onclick="addOfferSlab()"> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;"
																onclick="deleteSlab($(this).closest('tr').attr('id'))">
														</div></td>
												</tr>
											</tbody>
										</table>
									</div>
												</div>
												
													</div>
										</div>
									</div>
									
									<div class="row">
										<%-- <div class="form-group col-lg-12" style="margin-top: -2%;">
											<input type="radio"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px;pointer-events: none;" id="applyForAllItemsGroup" name="configureBased"/>
												<spring:message code="applyforAllitems.label" />
											<hr style="margin-top: 1px;border:none;">
										</div> --%>
									</div>
									
									
									
								</div>
								</div>
								<br>
								
									
											
								
								<%-- <div class="row">
									<div class="form-group col-lg-3" style="">
										<label><spring:message code="offer_reward_type.label" />
											<span class="requiredField">*</span></label> <select
											class="form-control" name="offerReward" id="offerReward"
											onchange="toggleRepeat('offerReward')">
											<option value="fixed_rate">Fixed Rate</option>
											<option value="flat_rate">Cash Flat</option>
											<option value="percentage">Cash Discount</option>
											<option value="loyaltypoints">Loyalty Points</option>
											<option value="giftvouchers">Gift Vouchers</option>
										</select><span id="dealNameErr"
											style="text-align: right; color: red; font-weight: bold;"></span>
										 <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/>
									</div>
									<div class="form-group col-lg-3" style="text-align: center;">
										<br> <input type="checkbox" checked="checked"
											style="vertical-align: -2px" id="allownMulDisc" />
										<spring:message code="allow.multiple.discount.label" />
									</div>
									<div class="form-group col-lg-2" style="text-align: center;">
										<br> <input type="checkbox" checked="checked"
											style="vertical-align: -2px" id="isRepeat" />&nbsp;&nbsp;&nbsp;
										<spring:message code="is.repeat.label" />
									</div>
									<div class="form-group col-lg-2" style="text-align: center;">
										<br> <input type="checkbox"
											onchange="toggleComboLowest('isCombo')"
											style="vertical-align: -2px" id="isCombo" />&nbsp;&nbsp;&nbsp;
										<spring:message code="is.combo.label" />
									</div>
									<div class="form-group col-lg-2" style="text-align: center;">
										<br> <input type="checkbox"
											onchange="toggleComboLowest('lowestPriceItem')"
											style="vertical-align: -2px" id="lowestPriceItem" />&nbsp;&nbsp;&nbsp;
										<spring:message code="lowest.price.item.label" />
									</div>
								</div>
								<div id="row">
									<div>
										<label style="font-weight: bold;"><spring:message
												code="offer_slabs.label" /> </label>
										<hr style="margin-top: 1px;">
									</div>

									<div class="table-responsive" style="margin-top: -22px;">
										<table id="slabsList" class="table table-bordered table-hover"
											style="width: 100%;">
											<thead style="background-color: #3c8dbc; color: #ffffff">
												<tr id="slabTr">
													<th style="display: none;"><spring:message
															code="deal_slabname.label" /></th>
													<th style="width: 10%"><spring:message
															code="groupid.label" /></th>
													<th style="width: 10%"><spring:message
															code="item_id.label" /></th>
													<th style="width: 15%"><spring:message
															code="minimum_purchase_quantity.label" /></th>
													<th style="width: 15%"><spring:message
															code="minimum_purchase_amount.label" /></th>
													<th style="width: 12%"><spring:message
															code="offer_reward_type.label" /></th>
													<th style="width: 12%"><spring:message
															code="offer_reward_value.label" /></th>
													<th style="width: 12%"><spring:message
															code="reward.quantity.label" /></th>
													<th style="width: 12%"><spring:message
															code="range.mode.label" /></th>
													<th style="width: 15%"><spring:message
															code="description.label" /></th>
													<th style="width: 7%"><spring:message
															code="action.label" /></th>
												</tr>
											</thead>
											<tbody style="text-align: center;">
												<tr id="range1">
													<td style="display: none;"><span id="1rangename">range1</span></td>
													<td style="width: 10%"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="1groupId"
														placeholder="<spring:message code="enter.group.label" />" />
														<div class="services">
															<div class="items">
																<ul class="matchedStringUl 1groupId"
																	style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													<td style="width: 10%"><input type="text"
														class="form-control itemSearch"
														oninput="getItemIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="1itemId"
														placeholder="<spring:message code="enter.item.id.label" />" />
														<div class="services">
															<div class="items">
																<ul class="matchedStringUl 1itemId"
																	style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1itemId"> <input
														type="hidden" id="pluCode1itemId"></td>
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="1minquantity"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control"
														type="text" id="1minamount"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td><select class="form-control" name="offerReward"
														id="1rangeRewardType">
															<option value="ALL">ALL</option>
															<option value="fixed_rate">Fixed Rate</option>
															<option value="flat_rate">Cash Flat</option>
															<option value="percentage">Cash Discount</option>
															<option value="loyaltypoints">Loyalty Points</option>
															<option value="giftvouchers">Gift Vouchers</option>
													</select></td>
													<td style="width: 12%"><input class="form-control"
														type="text" id="1rewardvalue"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input
														class="form-control rewardQuantity" type="text"
														id="1rewardQuantity" value="0"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td><select class="form-control" disabled="disabled"
														name="rangeMode" id="1rangeMode"
														onchange="changeRangeMode(this);">
															<option value="both">Both</option>
															<option value="condition">Condition</option>
															<option value="promotion">Promotion</option>
													</select></td>
													<td style="width: 12%"><input class="form-control"
														type="text" id="1description" /></td>
													<td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																onclick="addOfferSlab()"> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;"
																onclick="deleteSlab('range1')">
														</div></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div> --%>
								
								<div class="row" style="">
								
								
								
								<%-- 
									<div class="form-group col-lg-3" style="">
										<label id="offerBannerLabel"><spring:message
												code="offer_banner.label" /></label><br> <input
											type="checkbox" style="vertical-align: -2px" id="banner" />
										<spring:message code="use.as.banner.label" />
										<br>
										<div class="icon-remove blue delete" title="Offer Banner"
											id="offerBanner_image">
											<label class="myFile" id="offerBanner_label"> <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner"
												onchange="loadImageFileAsURL('offerBanner',this);" /> <!-- <input type = "hidden" id="offerbannerByte"> -->
											</label> <span id="offerBannerErr"
												style="text-align: right; color: red; font-weight: bold;"></span>
											<input type="hidden" id="offerBannerRefId" /> <input
												type="hidden" id="offerBanner_name" />
										</div>
									</div> --%>
									<div class="col-lg-12">
										<div class="row">
											<div class="form-group col-lg-2">
												<label><spring:message code="offer_status.label" /></label>
												<div class="radio">

													<label> <input type="radio" id="offerStatus"
														name="offerStatus" value=true checked> <spring:message
															code="deal_enable.label" />
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" id="offerStatus"
														name="offerStatus" value=false> <spring:message
															code="deal_disable.label" />
													</label>
												</div>

											</div>
											<div class="form-group col-lg-2">
												<label><spring:message
														code="deal_loyalty_points_status.label" /></label>
												<div class="radio">

													<label> <input type="radio" name="loyaltyPoints"
														value=true checked> <spring:message
															code="yes.label" />
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="loyaltyPoints"
														value=false> <spring:message code="no.label" />
													</label>
												</div>
											</div>
											<div class="form-group col-lg-2">
												<label><spring:message
														code="deal_giftvouchet_status.label" /></label>
												<div class="radio">

													<label> <input type="radio" name="giftvouchers"
														value=true checked> <spring:message
															code="yes.label" />
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="giftvouchers"
														value=false> <spring:message code="no.label" />
													</label>
												</div>
											</div>
											<div class="form-group col-lg-2">
												<label><spring:message
														code="deal_claims_coupons.label" /></label>
												<div class="radio">

													<label> <input type="radio" name="coupons"
														value=true checked> <spring:message
															code="yes.label" />
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="coupons"
														value=false> <spring:message code="no.label" />
													</label>
												</div>
											</div>
											<div class="form-group col-lg-2">
												<label><spring:message
														code="gift.coupon.code.label" /></label>
												

													<input class="form-control disabled" type="text" id="CouponCodeforOffer" 
											placeholder="<spring:message code="gift.coupon.code.label" />" />
												
											</div>
											
											
										</div>
									</div>
								</div>
								<div class="col-xs-12" id="data" style="display: none;">
									<table id="taxestable" class="table table-bordered table-hover">
										<thead style="background-color: #3c8dbc; color: #ffffff">
											<tr>
												<th><spring:message code="taxname.label" /></th>
												<th><spring:message code="taxtype.label" /></th>
												<th style="width: 40%;"><spring:message
														code="taxrate.label" /></th>
											</tr>
										</thead>
										<tbody style="text-align: center;">

										</tbody>
									</table>
								</div>
								</div>	
								
								
								
								<div class="row b2cVisibility" style="margin-top: 10px;">
									<%-- <div class="form-group col-lg-12">
			                              	 <label><span style="font-weight: bold;font-size: 16px;color:#666;"><spring:message code="deal.visibility.label" /></span>( These options make the Deals are visible with B2C sites  so that online customer can exercise purchasing options. Please note that this is applicable only when our customer | use our CLOUD platform for their Online Business.) </label>
			                              	 <hr style="margin-top: 1px;margin-bottom: -5px;">
			                             </div> --%>
									<div class="form-group col-lg-12" style="text-align: center; margin-top: 25px;">
										<div class=""
											style="font-weight: bold;font-size: 19px; color: #666;margin-bottom: -42px;">
											<span
												style="background-color: white;"><spring:message code="offer.online.visibility.label" /></span>
										</div>
										
										<div class="col-lg-2"></div>
										<div class="form-group col-lg-10" style="margin-bottom: 4px;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -16px; margin-top: 0px; margin-bottom: -26px;"
											onclick="activateHeader('offervisibility');"
											id="offervisibilityImg" alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
										</div>
									<hr
										style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
									<hr
										style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
										
										<!-- <div class="form-group col-lg-10"
											style="background-color: rgb(195, 195, 195); margin-bottom: 4px;">
											<span>( These options make the Offers are visible with
												B2C sites so that online customer can exercise purchasing
												options. Please note that this is applicable only when our
												customer | use our CLOUD platform for their Online
												Business.)</span>
										</div> -->
									</div>
									

									<%-- <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.tag.line.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div> --%>
								</div>
									
									
								<div class="offervisibility b2cVisibility  subBlock">
								
								
								<div class="col-lg-3">
								
								 <div class="row">
		                              
                                        <div class="address-details col-lg-6 col-xs-8">
                                       <label id="offerBannerLabel"><spring:message
												code="offer_banner.label" /></label><br> <input
											type="checkbox" style="vertical-align: -2px" checked="checked" id="banner" />
										<spring:message code="use.as.banner.label" />
                                        </div></div>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="icon-remove blue delete" title="Offer Banner"
											id="offerBanner_image">
											<label class="myFile" id="offerBanner_label"> <%-- <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" /> --%>
												<input type="file" id="offerBanner" name="offerBanner"
												onchange="loadImageFileAsURL('offerBanner',this);" /> <!-- <input type = "hidden" id="offerbannerByte"> -->
											</label> <span id="offerBannerErr"
												style="text-align: right; color: red; font-weight: bold;"></span>
											<input type="hidden" id="offerBannerRefId" /> <input
												type="hidden" id="offerBanner_name" />
										</div>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 </div>
								
								<%-- <div class="row">
								<div class="form-group col-lg-3" style="">
										<label id="offerBannerLabel"><spring:message
												code="offer_banner.label" /></label><br> <input
											type="checkbox" style="vertical-align: -2px" id="banner" />
										<spring:message code="use.as.banner.label" />
										<br>
										<div class="icon-remove blue delete" title="Offer Banner"
											id="offerBanner_image">
											<label class="myFile" id="offerBanner_label"> <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner"
												onchange="loadImageFileAsURL('offerBanner',this);" /> <!-- <input type = "hidden" id="offerbannerByte"> -->
											</label> <span id="offerBannerErr"
												style="text-align: right; color: red; font-weight: bold;"></span>
											<input type="hidden" id="offerBannerRefId" /> <input
												type="hidden" id="offerBanner_name" />
										</div>
									</div>
								</div> --%>
								<div class="col-lg-9" style="margin-left: -26px;">
								<div class="row">
									<div class="form-group col-lg-3" style="">
										<label><spring:message code="display.tag.line.label" /></label>
										<textarea class="form-control" name="dealImageText"
											id="dealImageText" rows="1" style="resize: none;"
											placeholder="<spring:message code="display.tag.line.label" />"></textarea>
									</div>
									<div class="form-group col-lg-3">
										<%-- <label style="margin-left: 16px;"><spring:message
												code="deal.image.text.font.label" /></label> <input type="hidden"
											id="dealImageTextFontHidden"> --%>
											<div class="col-lg-9"><br></div>
											<div class="col-lg-9">
											<div class="form-group col-lg-2" style="margin-left: -27px;">
											 <select class="form-control" id="dealImageTextFont">
										</select>
									 </div>
									</div> 
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="deal.image.size.label" /></label>
										<input class="form-control" type="text" id="dealImageTextSize"
											placeholder="<spring:message code="deal.image.size.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="deal.image.color.label" /></label>
										<div class="input-group my-colorpicker2">
											<input type="text" id="dealImageTextColor"
												class="form-control" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->

									</div>
									<div class="form-group col-lg-2" style="text-align: center;">
										<br> <input type="checkbox" style="vertical-align: -2px;"
											id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
										<input type="checkbox" style="vertical-align: -2px;"
											id="dealImageItalic" /><i class="fa  fa-italic"></i>&nbsp;&nbsp;
										<input type="checkbox" style="vertical-align: -2px;"
											id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
									</div>
								</div>
								</div>
								<%--  <div class="row">
									   <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.sale.text.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div> --%>
                                      <div class="col-lg-3"></div>
                                     <div class="col-lg-9"    style="margin-left: -26px;">
								<div class="row">
									<div class="form-group col-lg-3" style="">
										<label><spring:message code="display.sale.text.label" /></label>
										<textarea class="form-control" name="saleText" id="saleText"
											rows="1" style="resize: none;"
											placeholder="<spring:message code="display.sale.text.label" />"></textarea>
									</div>
									<div class="form-group col-lg-3" style="">
<%-- 										<label style="margin-left: 10px;"><spring:message --%>
<%-- 												code="deal.image.text.font.label" /></label> --%>
												<div class="col-lg-9"><br></div>
												<div class="col-lg-11">
												
											<div class="form-group col-lg-2" style="margin-left: -27px;"> <select
											class="form-control" id="saleTextFont">
											
										</select> <input type="hidden" id="saleTextFontHidden">
										</div>
										</div>
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="deal.image.size.label" /></label>
										<input class="form-control" type="text" id="saleTextSize"
											placeholder="<spring:message code="deal.image.size.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="deal.image.color.label" /></label>
										<div class="input-group my-colorpicker2">
											<input type="text" id="saleTextColor" class="form-control" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group col-lg-2" style="text-align: center;">
										<br> <input type="checkbox" style="vertical-align: -2px;"
											id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
										<input type="checkbox" style="vertical-align: -2px;"
											id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
										<input type="checkbox" style="vertical-align: -2px;"
											id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
									</div>
								</div>
								</div>
								<%--  <div class="row">
									   <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.deal.text.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div> --%>
                                      
                          <div class="col-lg-3"></div>
                               <div class="col-lg-9" style="margin-left: -26px;">
								<div class="row">
									<div class="form-group col-lg-3" style="">
										<label><spring:message code="display.deal.text.label" /></label>
										<textarea class="form-control" name="dealText" id="dealText"
											rows="1" style="resize: none;"
											placeholder="<spring:message code="display.deal.text.label" />"></textarea>
									</div>
									<div class="form-group col-lg-3" style="">
<%-- 										<label style="margin-left: 10px;"><spring:message --%>
<%-- 												code="deal.image.text.font.label" /></label> --%>
												<div class="col-lg-9"><br></div>
												<div class="col-lg-11">
								<div class="form-group col-lg-3" style="margin-left: -27px;">
									<select class="form-control" id="dealTextFont">
										</select>
										</div>
										</div> <input type="hidden" id="dealTextFontHidden">
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="deal.image.size.label" /></label>
										<input class="form-control" type="text" id="dealTextSize"
											placeholder="<spring:message code="deal.image.size.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="deal.image.color.label" /></label>
										<div class="input-group my-colorpicker2">
											<input type="text" id="dealTextColor" class="form-control" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group col-lg-2" style="text-align: center;">
										<br> <input type="checkbox" style="vertical-align: -2px;"
											id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
										<input type="checkbox" style="vertical-align: -2px;"
											id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
										<input type="checkbox" style="vertical-align: -2px;"
											id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
									</div>
								</div>
								</div>
							</div>
					
							<div class="row">
								<div class="col-lg-12"
									style="text-align: center; margin-top: 25px;">
									<div
										style="font-weight: bold; font-size: 19px; color: #666; margin-bottom: -42px;">
										<span style="background-color: white;">&nbsp;<spring:message code="authorisation.label" />&nbsp;
										</span>
									</div>
									<div class="col-lg-2"></div>
									<div class="form-group col-lg-10" style="margin-bottom: 4px;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -16px; margin-top: 0px; margin-bottom: -26px;"
											onclick="activateHeader('authorise');" id="authoriseImg"
											alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									</div>
									<hr
										style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
									<hr
										style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
								</div>
							</div>
							<div class="authorise subBlock">

								<div class="row">
									<div class="form-group col-lg-3" style="text-align: center;">
										<br> <input type="button" id=""
											style="margin-right: 2%; padding: 3px 5px;"
											class="btn bg-olive btn-inline"
											value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="authorise.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
										<%--  <label><spring:message code="authorised.by.label" /></label>
                                            <input type="text" class="form-control" name="autorisedBy" id="autorisedBy" value="" required placeholder="<spring:message code="enter.authorised.by.label" />" />
                                        	<span id="autorisedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
									</div>
									<div class="form-group col-lg-3" style="text-align: center;">
										<br> <input type="button" id=""
											style="margin-right: 2%; padding: 3px 5px;"
											class="btn bg-olive btn-inline"
											value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="close.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
										<%--  <label><spring:message code="closed.by.label" /></label>
                                            <input type="text" class="form-control" name="closedBy" id="closedBy" value="" required placeholder="<spring:message code="enter.authorised.by.label" />" />
                                        	<span id="closedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
									</div>
									<div class="form-group col-lg-3">
										<label><spring:message code="closed.on.label" /></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" name="closedOn" id="closedOn"
												readonly="readonly" style="background: white;" size="20"
												type="text" onfocus="callCalenderYYYYMMDD('closedOn')"
												onclick="callCalenderYYYYMMDD('closedOn')"
												placeholder="YYYY/MM/DD" />
										</div>
										<!-- /.input group -->
									</div>

									<div class="form-group col-lg-3">
										<label><spring:message code="closed.reason.label" /></label>
										<input type="text" class="form-control" name="closedReason"
											id="closedReason" value="" required
											placeholder="<spring:message code="enter.authorised.by.label" />" />
										<span id="closedReasonError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							</div>


							<div class="row" style="text-align: right;">
								<input type="button" id="submit" style="margin-right: 2%;"
									class="btn bg-olive btn-inline" onclick="createOffer()"
									value="<spring:message code="submit.label" />" />
<%-- 								<c:if test="${sessionScope.role == 'super admin'}"> --%>
									<input type="button" class="btn bg-olive btn-inline"
										style="margin-right: 2%;"
										onclick="viewdealsandoffers('offers','','0')"
										value="<spring:message code="cancel.label" />" />
								<%-- </c:if>
								<c:forEach var="accessControl"
									items="${sessionScope.dealsAndOffers}">
									<c:if
										test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btn bg-olive btn-inline"
											style="margin-right: 2%;"
											onclick="viewdealsandoffers('offers','','0')"
											value="<spring:message code="cancel.label" />" />
									</c:if>
								</c:forEach> --%>
							</div>
							<%-- <span class="requiredField">${err}</span> --%>
						</div>
						<!-- /.box-body -->
						<br />
						<div class="box-footer">
							<!--    <button type="submit" class="btn btn-primary">Submit</button> -->
						</div>
						<input type="hidden" id="taxList" value='' />


 <div id="triggerEvent"></div>
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                          <th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                             <th><spring:message code="product.range.label"/></th>
                              <th><spring:message code="grade.label"/></th>
						<%-- <th><spring:message code="brand.label"/></th> --%>
                        <%-- <th><spring:message code="pattern.label"/></th> --%>
                             <th><spring:message code="color.label"/></th>
                             <th><spring:message code="size.label"/></th>
                                         
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
                          <div class="col-lg-8 col-sm-8 col-xs-12" style=""></div>
          <div class="form-group col-lg-4 col-sm-4 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="getItemPrice(this);"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->


<div id="triggerEventExclude"></div>
         <div class="modal fade popup-display" id="items-modal-exclude" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsListExclude" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                          <th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                             <th><spring:message code="product.range.label"/></th>
                              <th><spring:message code="grade.label"/></th>
<%--                                 <th><spring:message code="brand.label"/></th> --%>
                                <%-- <th><spring:message code="pattern.label"/></th> --%>
                             <th><spring:message code="color.label"/></th>
                                <th><spring:message code="size.label"/></th>
                                         
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
                          <div class="col-lg-8 col-sm-8 col-xs-12" style=""></div>
          <div class="form-group col-lg-4 col-sm-4 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="getItemPriceExclude(this);"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div>

					</form>
					<input type="hidden" name="taxes" id="taxes" />
					<%-- <input type="hidden" id="subCategories" value='${subCategories}'>  --%>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
	<!-- InputMask -->
	<%-- <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#offerStartDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
                $("#offerEndDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
            });
            </script> --%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script>
		$(".timepicker").timepicker({
			showInputs : false,
			showMeridian : false,
			showSeconds : true,

		});
		//Timepicker
		$(".my-colorpicker2").colorpicker();
		/*  $('#taxestable').dataTable({
		     "bPaginate": false,
		     "bLengthChange": false,
		     "bFilter": false,
		     "bSort": false,
		     "bInfo": false,
		     "bAutoWidth": false
		 }); */
	</script>
</body>
</html>