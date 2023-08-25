<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/newoutlet.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp.
 * */ -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontselect.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dealsAndOffers/deals.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/jquery.fontselect.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
	 <script src="${pageContext.request.contextPath}/js/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
	<script type="text/javascript">
 $(document).ready(function(){
	 //toggleItemSpecific('editdealcategory');
	 //toggleBased('basedOnProduct');
	 setEditDealSlabDivContent();
	 toggleComboLowest('id');
	/* var dealStartDate = $("#dealStartDate").val();
	var date = dealStartDate.split(' ');
	date = date[0].split('-');
	var formatedDate = date[0]+"/"+date[1]+"/"+date[2];
	$('#dealStartDate').val(formatedDate);
	var dealEndDate = $("#dealEndDate").val();
	date = dealEndDate.split(' ');
	date = date[0].split('-');
	formatedDate = date[0]+"/"+date[1]+"/"+date[2];
	$('#dealEndDate').val(formatedDate);
	var closedOn = $("#closedOn").val();
	if(closedOn != "" && closedOn != null){
		date = closedOn.split(' ');
		date = date[0].split('-');
		formatedDate = date[0]+"/"+date[1]+"/"+date[2];
		$('#closedOn').val(formatedDate);
	} */
	 callCalenderYYYYMMDD('dealStartDate');
	 callCalenderYYYYMMDD('dealEndDate');
	 callCalenderYYYYMMDD('closedOn');
	 $("#editdealLocation").val($("#deallocations").val().split(','));
	 /* prepare form data */
	 prepareEditFormData();
	 callCalender('fromDate');
	 callCalender('endDate');
	 var fromDate = $("#fromDate").val();
	 if(fromDate != "" && fromDate != null){
		 date = fromDate.split(' ');
		 $('#fromDate').val(date[0]);
	 } 
	 var endDate = $("#endDate").val();
	 if(endDate != "" && endDate != null){
		 date = endDate.split(' ');
		 $('#endDate').val(date[0]);
	 }
	 $(".subBlock").hide();
	 $(".customer").css("display","block");
	 var selectedCountry = $("#selectedCountry").val();
  	 var selectedState = $("#selectedState").val();
	 var id = getCountryIndex(selectedCountry);
	 print_country("country");
	 if(selectedCountry != "" && selectedCountry != null){
	 	$("#country").val(selectedCountry);
	 }
	 if(selectedState != "" && selectedState != null){
		 print_state('states',id);
		 $("#states").val(selectedState);
	 }
	 $("#dealImageTextFont").fontselect();
	 $("#saleTextFont").fontselect();
	 $("#dealTextFont").fontselect();
	 var dealImageTextFont = $("#dealImageTextFontHidden").val();
	 if(dealImageTextFont != "")
	 $("#dealImageTextFontHidden").siblings(".font-select").children("a").children("span").text(dealImageTextFont);
	 var saleTextFont = $("#saleTextFontHidden").val();
	 if(saleTextFont != "")
	 $("#saleTextFontHidden").siblings(".font-select").children("a").children("span").text(saleTextFont);
	 var dealTextFont = $("#dealTextFontHidden").val();
	 if(dealTextFont != "")
	 $("#dealTextFontHidden").siblings(".font-select").children("a").children("span").text(dealTextFont);
	 
	 
	 $("input.basedOnGroup").removeAttr("readonly", "readonly");
	/*  var subCategories = $("#subCategories").val();
	 var parsedJson = jQuery.parseJSON(subCategories);  
	 var saleCategory = $("#saleCategory").val();
		var subcategoryArray = new Array();
		subcategoryArray = parsedJson[saleCategory];
		var selectedSaleProductSubCategory = $("#selectedSaleProductSubCategory").val();
		if(subcategoryArray != undefined){
			var op = '';
			for(var i=0;i<subcategoryArray.length;i++){
				if(selectedSaleProductSubCategory == subcategoryArray[i])
					op += '<option value="'+subcategoryArray[i]+'" selected>'+subcategoryArray[i]+'</option>';
				else
					op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
			}
			$("#sale_sub_category").html(op);
		}
		var dealCategory = $("#dealCategory").val();
		subcategoryArray = parsedJson[dealCategory];
		var selectedDealProductSubCategory = $("#selectedDealProductSubCategory").val();
		if(subcategoryArray != undefined){
			var op = '';
			for(var i=0;i<subcategoryArray.length;i++){
				if(selectedDealProductSubCategory == subcategoryArray[i])
					op += '<option value="'+subcategoryArray[i]+'" selected>'+subcategoryArray[i]+'</option>';
				else
					op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
			}
			$("#deal_sub_category").html(op);
		}
		$('#saleCategory').change(function () {
			 var category = $("#saleCategory").val();
			 subcategoryArray = parsedJson[category];
			 	var op = '';
				for(var i=0;i<subcategoryArray.length;i++){
					op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
				}
				$("#sale_sub_category").html(op);
		    });
			 $('#dealCategory').change(function () {
				 var category = $("#dealCategory").val();
				 subcategoryArray = parsedJson[category];
				 	var op = '';
					for(var i=0;i<subcategoryArray.length;i++){
						op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
					}
					$("#deal_sub_category").html(op);
			    }); */
 
}); 
 
 function getFont(ele){
	 var font = $(ele).attr("data-value").replace(/\+/g,' ');
	 $(".font-select").removeClass("font-select-active");
	 $(".fs-drop").css("display","none");
	 $(ele).parents(".font-select").children("a").children("span").text(font);
	 var selectId = $(ele).parents(".font-select").siblings("select").attr("id");
	 $("#"+selectId+"Hidden").val(font);
	// $(ele).parents(".font-select").siblings("select").val(font);
	 $(".font-select").trigger("click");
 }
 
</script>
<style type="text/css">
	.disableItemSpecific{
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
	 #cbgroup{
	   height:90px;overflow:auto;border:1px solid #e5e6e6;
	 }
	 .checkbox{
	   margin-left:8%;
	 }
	  img.thumbnail {
   	 	background: none repeat scroll 0 0 #FFFFFF;
    	margin-bottom: 0px !important;
    	border:none !important;
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
    	position:absolute;
    	 top:0;
        right:0;
    	height: 16px;
    	width: 16px;
    	cursor: pointer;
     	/* background:rgba(0, 0, 0, 0) url("${pageContext.request.contextPath}/images/deny.png") no-repeat scroll 0 0; */
    }
.myFile {
  /* position: relative;
  overflow: hidden;
  float: left;
  clear: left; */
}
 .matchedStringUl {  
 z-index: 9 !important;
 } 
.myFile input[type="file"] {
 /*  display: block;
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
 .row-fluid-5:before,
 .row-fluid-5:after {
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

 .row-fluid-5 .controls-row [class*="span"] + [class*="span"] {

   margin-left: 1.875%;
 }
 .row-fluid-5 [class*="span"]:first-child{
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

 /* responsive ONLY */

 @media (max-width: 600px){ /* spans reduce to 100px then go full width */

    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
    }
</style>

<style>
label {
font-weight: normal; }
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
                                <h3><label id="dealId">${dealBean.dealID }</label>  - <spring:message code="deal_details.label" /></h3>
                                </div> --%><!-- /.box-header -->
                                <!-- form start -->
                                <form method="POST">
                                    <div class="box-body">
                                    <div class="row" style="text-align: right; margin-top: 10px;">
                                    <input type="hidden" id="dealId" value="${dealBean.dealID }" />
                                 	 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${error}</div>
                                 	 	<div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                 	 	
                                 	 	<input type="button" id="submit" class="btn bg-olive btn-inline" style="position: relative;" onclick="updateDeal()" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
										<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 2%;position: relative;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
                                 	 	<!-- <hr style="margin-top: 4px;width: 99%;" /> -->
									</div>  
										 <div class="row" >
							               <div class="col-lg-12" style="text-align: center;margin-top: 25px" >
							               <div style="font-weight: bold;font-size: 19px;color:#666;margin-bottom: -42px;" >
							               <span style="background-color: white;">&nbsp;<spring:message code="customer.profiling" />&nbsp;</span>
							               </div>
							                 <div class="col-lg-2"></div>
							                <div class="form-group col-lg-10" style="margin-bottom: 4px;">
							               		<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px;" onclick="activateHeader('customer');" id="customerImg" alt="" src="${pageContext.request.contextPath}/images/rightHeaderIconGreen.png">
							                </div> 
							               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
							               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
							               </div>
							           </div>
							           <div class="customer subBlock">
							           		<div class="row">
									         <div class="col-lg-6" style="border-right-color: green;border-right-width: 1px;border-right-style: solid;">
									           <div class="row">
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="country.label" /></label>
									                	  <select onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control" >
															<option value="Select Country" >Select Country</option>
														  </select>
														  	<input type="hidden" id="selectedCountry" value="${dealBean.customerFilter.country}"></input>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 	<label><spring:message code="age.label" /></label>
									                	  <select id="age" name ="age" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="1-12" ${dealBean.customerFilter.age == "1-12" ? 'selected' : ''}>1 to 12</option>
															<option value="13-19" ${dealBean.customerFilter.age == "13-19" ? 'selected' : ''}>13 to 19</option>
															<option value="20-30" ${dealBean.customerFilter.age == "20-30" ? 'selected' : ''}>20 to 30</option>
															<option value="31-40" ${dealBean.customerFilter.age == "31-40" ? 'selected' : ''}>31 to 40</option>
															<option value="41-50" ${dealBean.customerFilter.age == "41-50" ? 'selected' : ''}>41 to 50</option>
															<option value="51-60" ${dealBean.customerFilter.age == "51-60" ? 'selected' : ''}>51 to 60</option>
															<option value="61-100" ${dealBean.customerFilter.age == "61-100" ? 'selected' : ''}>61 and above</option>
														  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="gender.label" /></label>
									                	  <select id="gender" name ="gender" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Male" ${dealBean.customerFilter.gender == "Male" ? 'selected' : ''}>Male</option>
															<option value="Female" ${dealBean.customerFilter.gender == "Female" ? 'selected' : ''}>Female</option>
															<option value="Other" ${dealBean.customerFilter.gender == "Other" ? 'selected' : ''}>Other</option>
														  </select>
				
									        	 	</div>
									        	 </div>
									             <div class="row">
									        	 	<div class="form-group col-lg-4">
									        	 		 <label><spring:message code="region.label" /></label>
															 <select id ="states" class="form-control" >
															 	<option value="Select State" >Select State</option>
															</select>
															<input type="hidden" id="selectedState" value="${dealBean.customerFilter.region}"></input>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="marital.status.label" /></label>
									                	  <select id="otherDetails" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Married" ${dealBean.customerFilter.maritialStatus == "Married" ? 'selected' : ''}>Married</option>
															<option value="Unmarried" ${dealBean.customerFilter.maritialStatus == "Unmarried" ? 'selected' : ''}>Unmarried</option>
														  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="children.label" /></label>
									                	  <select id="children" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="0" ${dealBean.customerFilter.children == "0" ? 'selected' : ''}>0</option>
															<option value="1" ${dealBean.customerFilter.children == "1" ? 'selected' : ''}>1</option>
															<option value="2" ${dealBean.customerFilter.children == "2" ? 'selected' : ''}>2</option>
															<option value="3" ${dealBean.customerFilter.children == "3" ? 'selected' : ''}>3</option>
															<option value="4" ${dealBean.customerFilter.children == "4" ? 'selected' : ''}>4</option>
															<option value="5 or Above" ${dealBean.customerFilter.children == "5 or Above" ? 'selected' : ''}>5 or Above</option>
														  </select>
									        	 	</div>
									        	 </div>
									        	 <div class="row">
									        	 	<div class="form-group col-lg-4">
									        	 		 <label><spring:message code="city.label" /></label>
									        	 		 <input type="text" id="city" class="form-control" value="${dealBean.customerFilter.city}" />
															<!--  <select id ="city" class="form-control" >
																<option >Select State</option>
															</select> -->
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 	<label><spring:message code="occupation.label" /></label>
									        	 		 <select id="occupation" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Business" ${dealBean.customerFilter.occupation == "Business" ? 'selected' : ''}>Business</option>
															<option value="Accountant" ${dealBean.customerFilter.occupation == "Accountant" ? 'selected' : ''}>Accountant</option>
															<option value="Software Professional" ${dealBean.customerFilter.occupation == "Software Professional" ? 'selected' : ''}>Software Professional</option>
															<option value="Engineer" ${dealBean.customerFilter.occupation == "Engineer" ? 'selected' : ''}>Engineer</option>
															<option value="Professor" ${dealBean.customerFilter.occupation == "Professor" ? 'selected' : ''}>Professor</option>
															<option value="Bureaucrat" ${dealBean.customerFilter.occupation == "Bureaucrat" ? 'selected' : ''}>Bureaucrat</option>
															<option value="Financial Professional" ${dealBean.customerFilter.occupation == "Financial Professional" ? 'selected' : ''}>Financial Professional</option>
															<option value="Doctor" ${dealBean.customerFilter.occupation == "Doctor" ? 'selected' : ''}>Doctor</option>
															<option value="Others" ${dealBean.customerFilter.occupation == "Others" ? 'selected' : ''}>Others</option>
									        	 		 </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 	<label><spring:message code="customer.type.label" /></label>
									                	  <select id="customerType" name ="customerType" class="form-control" >
									                	  	<option value="-- Select --" >-- Select --</option>
									                	  	<option value="PREMIUM" ${dealBean.customerFilter.customerType == "PREMIUM" ? 'selected' : ''}>PREMIUM</option>
									                	  	<option value="PLUS" ${dealBean.customerFilter.customerType == "PLUS" ? 'selected' : ''}>PLUS</option>
									                	  	<option value="BASIC" ${dealBean.customerFilter.customerType == "BASIC" ? 'selected' : ''}>BASIC</option>
									                	  	<option value="GENERIC" ${dealBean.customerFilter.customerType == "GENERIC" ? 'selected' : ''}>GENERIC</option>
															  	<option value="EMPLOYEE" ${dealBean.customerFilter.customerType == "EMPLOYEE" ? 'selected' : ''}>EMPLOYEE</option>
															<!-- <option >Select Country</option> -->
														  </select>
									        	 	</div>
									        	 </div>
									        	 
									        	  <div class="row">
									        	 	<div class="form-group col-lg-4">
									        	 		 <label><spring:message code="sales.zone.label" /></label>
									        	 		 <select id="salesZone" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	 <c:forEach var="zone" items="${zones}">
																<option value="${zone}" ${dealBean.customerFilter.salesZone == zone ? 'selected' : ''}>${zone}</option>
															 </c:forEach>
									        	 		 </select>
															<!--  <select id ="city" class="form-control" >
																<option >Select State</option>
															</select> -->
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		 <label><spring:message code="income.group.label" /></label>
									        	 		 <select id="incomeGroup" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Lower Income"  ${dealBean.customerFilter.incomeGroup == "Lower Income" ? 'selected' : ''}>Lower Income</option>
															<option value="Middle Income" ${dealBean.customerFilter.incomeGroup == "Middle Income" ? 'selected' : ''}>Middle Income</option>
															<option value="High Net worth Individual" ${dealBean.customerFilter.incomeGroup == "High Net worth Individual" ? 'selected' : ''}>High Net worth Individual</option>
															<option value="Ultra-Rich" ${dealBean.customerFilter.incomeGroup == "Ultra-Rich" ? 'selected' : ''}>Ultra-Rich</option>
									        	 		 </select>
									        	 	</div>
									        	 </div>

									        	 <div class="row">
									        	 	<div class="form-group col-lg-6">
									        	 		
									        	 	</div>
									        	</div> 
									           </div>
											   <div class="col-lg-6" >
										           <div class="row">
										           	<div class="form-group col-lg-4">
									        	 		<label id="fromDateLabel"><spring:message code="deal_start_date.label" /></label>
									                	<input class="form-control calendar_icon" readonly="readonly" value="${dealBean.customerFilter.start_date}" style="background-color: white;" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
								        	 		<div class="form-group col-lg-2">
								        	 		
								        	 		</div>
									        	 	<div class="form-group col-lg-6">
									        	 	<label><spring:message code="customer.turnover.label" /></label>
									        	 		 <div class="row">
							        						<div class="col-lg-6" style="padding-right: 5px;">
									                            <input type="text" class="form-control" id="startPrice"  value="${dealBean.customerFilter.startPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
							        						</div>
							        						<div class="col-lg-6" style="padding-left: 5px;">
									                            <input type="text" class="form-control" id="endPrice"  value="${dealBean.customerFilter.endPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
							        						</div>
							        					</div>
									        	 	</div>
									        	 </div>
									             <div class="row">
									             	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="offer_end_date.label" /></label>
									                	<input class="form-control calendar_icon" readonly="readonly" value="${dealBean.customerFilter.end_date}" style="background-color: white;" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
									        	 	<div class="form-group col-lg-2">
									        	 	</div>
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="purchase.channel.label" /></label>
									                	  <select id="purchaseChannel" class="form-control" >
									                	  	 <option value="-- Select --" >-- Select --</option>
									                	  	 <option value="Direct Shopping" ${dealBean.customerFilter.purchaseChannel == "Direct Shopping" ? 'selected' : ''}>Direct Shopping</option>
									                	  	 <option value="Telephone" ${dealBean.customerFilter.purchaseChannel == "Telephone" ? 'selected' : ''}>Telephone</option>
									                	  	 <option value="Online" ${dealBean.customerFilter.purchaseChannel == "Online" ? 'selected' : ''}>Online</option>
									                	  	  <option value="Mobile" ${dealBean.customerFilter.purchaseChannel == "Mobile" ? 'selected' : ''}>Mobile</option>
									                	  	 <option value="Sales Personnel" ${dealBean.customerFilter.purchaseChannel == "Sales Personnel" ? 'selected' : ''}>Sales Personnel</option>
														  </select>
									        	 	</div>
									        	 </div>
									        	 <div class="row">
									        	 	<div class="form-group col-lg-4">
									        	 		 <label><spring:message code="customer.rating.label" /></label>
								                	  <select id="customerRating" class="form-control" >
														<option value="-- Select --" >-- Select --</option>
														<option value="1" ${dealBean.customerFilter.rating == "1" ? 'selected' : ''}>1</option>
														<option value="2" ${dealBean.customerFilter.rating == "2" ? 'selected' : ''}>2</option>
														<option value="3" ${dealBean.customerFilter.rating == "3" ? 'selected' : ''}>3</option>
														<option value="4" ${dealBean.customerFilter.rating == "4" ? 'selected' : ''}>4</option>
														<option value="5" ${dealBean.customerFilter.rating == "5" ? 'selected' : ''}>5</option>
													  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-2">
									        	 		 
									        	 	</div>
									        	 	<div class="form-group col-lg-6">
									        	 	
									        	 	<label><spring:message code="referrals.label" /></label>
									        	 		 <select id="referrals" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="1" ${dealBean.customerFilter.referrals == "1" ? 'selected' : ''}>1</option>
															<option value="2" ${dealBean.customerFilter.referrals == "2" ? 'selected' : ''}>2</option>
															<option value="3" ${dealBean.customerFilter.referrals == "3" ? 'selected' : ''}>3</option>
															<option value="4" ${dealBean.customerFilter.referrals == "4" ? 'selected' : ''}>4</option>
															<option value="5" ${dealBean.customerFilter.referrals == "5" ? 'selected' : ''}>5</option>
															<option value="6" ${dealBean.customerFilter.referrals == "6" ? 'selected' : ''}>6</option>
															<option value="7" ${dealBean.customerFilter.referrals == "7" ? 'selected' : ''}>7</option>
															<option value="8" ${dealBean.customerFilter.referrals == "8" ? 'selected' : ''}>8</option>
															<option value="9" ${dealBean.customerFilter.referrals == "9" ? 'selected' : ''}>9</option>
															<option value="10" ${dealBean.customerFilter.referrals == "10" ? 'selected' : ''}>10</option>
									        	 		 </select>
									        	 		 
									        	 	</div>
									        	 </div>  
									        	   <div class="row" style="display: none;">
									        	 <div class="form-group col-lg-6">
										        	 <label><spring:message code="product.label" /></label>
									        	 		 <input type="text"  class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="searchProduct" value="${dealBean.customerFilter.product}" placeholder="<spring:message code="search.product.label" />" />
															<div class="services">
												    			<div class="items">
												     				<ul class="matchedStringUl searchProduct" style=""></ul>
												   				</div>
															</div>
															<input type="hidden" id="product" value="${dealBean.customerFilter.product}" >
															 <!-- <select id ="product" class="form-control" >
																<option value="-- Select --" >-- Select --</option>
															</select> -->
									        	 </div>
									        	 <div class="form-group col-lg-6">
									        	 		 <label><spring:message code="product.category.label" /></label>
									                	  <select id="productCategory" onchange="emptyProduct();" name ="productCategory" class="form-control" >
									                	  	<option value="" >-- Select --</option>
									                	  	 <c:forEach var="category" items="${categories}">
									                	  	 	<option value="${category.categoryName}" ${category.categoryName == dealBean.customerFilter.productCategory ? 'selected' : ''}>${category.categoryName}</option>
																<%-- <option value="${category}" ${dealBean.customerFilter.productCategory == category ? 'selected' : ''}>${category}</option> --%>
															 </c:forEach>
														  </select>
									        	 	</div>
									        	 </div>  
					<div class="row" style="display: none;">
                       <div class="col-lg-6" style="">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId')" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == dealBean.customerFilter.department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                       <div class="col-lg-6" style="">
                            <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value="${offerBean.customerFilter.department}">${dealBean.customerFilter.subDepartment}</option>
	                          
	                        </select>
                      </div>
                      </div>
									        	 <div class="row" style="font-size: 15px;">
									        	 	<div class="form-group col-lg-6" style="margin-top: 5px;">
									        	 		<br>
									        	 		<c:if test="${dealBean.customerFilter.applyRoolsEngine == true}">
									             			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
									        	 		</c:if>
									        	 		<c:if test="${dealBean.customerFilter.applyRoolsEngine != true}">
									        	 			<input type="checkbox" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
									        	 		</c:if>
									        	 	</div>
							             		</div>                 
										       </div>
									         </div>
							           </div>
                                
                                  <div class="row" >
						               <div class="col-lg-12" style="text-align: center;margin-top: 25px;" >
						               <div style="font-weight: bold;font-size: 19px;color:#666;margin-bottom: -42px;" >
						               <span style="background-color: white;">&nbsp;<spring:message code="deals.configuration.label" />&nbsp;</span>
						               </div>
						                 <div class="col-lg-2"></div>
						                <div class="form-group col-lg-10" style="margin-bottom: 4px;">
						               		<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px;" onclick="activateHeader('dealConfiguration');" id="dealConfigurationImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
						                </div> 
						               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
						               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
						               </div>
						           </div>
						           <div class="dealConfiguration subBlock">    
								<!-- row 1 start --> 
								<div class="row-fluid-5">
									<!--  <div class="span8"> -->
									 	<!-- <div class="row"> -->
									    <div class="form-group span2">
                                            <label><spring:message code="deal_name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="editdealName" id="editdealName" placeholder="<spring:message code="enter_deal_name.label"/>"  value="${dealBean.dealName}"/>
                                            <span id="dealNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <br>
                                            <label><spring:message code="deal_start_date.label" /> <span class="requiredField">*</span></label>
                                             <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                           <input class="form-control" name="dealstartdate" readonly="readonly" style="background: white;" id="dealStartDate" size="20" type="text" onfocus="callCalenderYYYYMMDD('dealStartDate')" value="${dealBean.dealStartDate }" onclick="callCalenderYYYYMMDD('dealStartDate')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                        
                                          <span id="dealStartDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group span2">
									     <label><spring:message code="deal_category.label" />  <span class="requiredField">*</span></label>
                                            <select class="form-control" name="editdealCategory" onchange="toggleItemSpecific('editdealcategory');" id="editdealcategory">
                                            <option value="item_specific" ${dealBean.dealCategory == "item_specific" ? 'selected' : ''}>Item Specific Deal</option>
                                            <option value="turn_over" ${dealBean.dealCategory == "turn_over" ? 'selected' : ''}>Total Bill(Turn Over) Deal</option>
                                            <option value="group_turn_over" ${dealBean.dealCategory == "group_turn_over" ? 'selected' : ''} >Group (Turn Over) Deal</option>
                                             </select>
                                            <br>
                                             <label><spring:message code="deal_end_date.label" /> <span class="requiredField">*</span></label>
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" name="dealenddate" id="dealEndDate" readonly="readonly" style="background: white;" size="20" type="text" onfocus="callCalenderYYYYMMDD('dealEndDate')" value="${dealBean.dealEndDate }" onclick="callCalenderYYYYMMDD('dealEndDate')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                          <span id="dealEndDateError" style="text-align:right;color:red;font-weight:bold;"></span>
									  </div>
									  
									  <div class="form-group span2">
                                            <label><spring:message code="deal_priority.label" /> <span class="requiredField">*</span></label>
                                             <select class="form-control" name="priority" id="editdealPriority">
                                            <option value="exclusive" ${dealBean.priority == "exclusive" ? 'selected' : ''}>Exclusive</option>
                                            <option value="normal" ${dealBean.priority == "normal" ? 'selected' : ''}>Normal</option>
                                            </select>
                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
                                          <br>
                                          
                                          <div class="col-lg-12" style="padding: 0px;">
										<div class="col-lg-6" style="padding: 0px;padding-right: 5px;">
										<div class="bootstrap-timepicker">
                                            <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="startTime" value="${dealBean.dealStartTime}" id="startTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="startTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        
										</div>
										<div class="col-lg-6" style="padding: 0px;">
										<div class="bootstrap-timepicker">
                                            <label><spring:message code="endtime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                 <input type="text" name="endTime" value="${dealBean.dealEndTime}" class="form-control timepicker" id="endTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                          <span id="endTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        
										</div>
										</div>
										
                                        </div>
                                        
                                        <div class="form-group span2">
                                        
                                        <label><spring:message code="no.of.purchases" /></label>
										<textarea class="form-control" name="noOfClaims" id="noOfClaims"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="no.of.purchases" />">${dealBean.customerFilter.noOfClaims }</textarea>
                                       <br>
										<label><spring:message code="deal_description_text.label" /></label>
	                                    <textarea style="resize:none;" class="form-control" name="dealDesc" id="dealDesc" rows="1" style="resize: none;" placeholder="<spring:message code="deal_description_placeholder.label" />" >${dealBean.dealDescription }</textarea>

                                        </div>
                                    <!-- </div> -->
									  <div class="form-group span2">
                                   	  	   <label><spring:message code="location.label" /></label>
		                                     <select class="form-control" name="location" id="editdealLocation" multiple="multiple">
		                                         <c:forEach var="location" items="${locationsList}"> 
													 <option value="${location}">${location}</option>
												 </c:forEach>
											 </select>
                                   	  </div>
                                   	  </div>
                                   	  
                                   	  <!--days  -->
                                   	  <div class="row" style=" padding-left: 15px;padding-right:10px">
								<div class="form-group col-lg-12" style=" border: 1px solid #ccc;height:35px;width: 99.6%;">
                                 <div class="col-lg-2" style="white-space: nowrap;padding: 7px;background: #c1c1c1; margin-left: -14px;">
                                 <label style="font-weight:bold">Deal Days</label>
                                 </div>	
								<div class="col-md-9" style="margin-top: 6px;margin-left: 25px;">
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
								<c:if test="${dealBean.day1 == true }">
                              		<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
                              	</c:if>
                              		<c:if test="${dealBean.day1 == false }">
                              			<input type="checkbox" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
                              	</c:if>
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<c:if test="${dealBean.day2 == true }">
                                    			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />
                                    		</c:if>
                                    		<c:if test="${dealBean.day2 == false }">
                                    			<input type="checkbox" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />
                                    		</c:if>
                                   </div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<c:if test="${dealBean.day3 == true }">
                                      	<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
                                      </c:if>
                                      <c:if test="${dealBean.day3 == false }">
                                      	<input type="checkbox" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
                                     </c:if>  
                                  </div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<c:if test="${dealBean.day4 == true }">
                                      		<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
                                      </c:if>
                                      <c:if test="${dealBean.day4 == false }">
                                      		<input type="checkbox" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
                                      </c:if> 
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<c:if test="${dealBean.day5 == true }">
	                                      	<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp;&nbsp; <spring:message code="thursday.label" />
	                                     </c:if>
	                                     <c:if test="${dealBean.day5 == false }">
	                                      	<input type="checkbox" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp;&nbsp; <spring:message code="thursday.label" />
	                                   </c:if>
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<c:if test="${dealBean.day6 == true }">
	                                      	<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
	                                  </c:if>
	                                  <c:if test="${dealBean.day6 == false }">
	                                      	<input type="checkbox" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
	                                  </c:if>
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<c:if test="${dealBean.day7 == true }">
	                                      <input type="checkbox" checked="checked" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
	                                  </c:if>
	                                <c:if test="${dealBean.day7 == false }">
	                                   <input type="checkbox" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
	                            </c:if> 
								
								</div>
								
								</div>
                                 
                                 
                                 </div>
                                 </div>
                                 
                                 <div class="row" style=" padding-left: 15px;padding-right:10px">
								<div class="form-group col-lg-12"
												style=" border: 1px solid #ccc;height:35px">
											<div class="col-lg-2" style="white-space: nowrap;padding: 7px;background: #c1c1c1; margin-left: -14px;"><label style="font-weight:bold">Offer/Deal Options</label></div>	
									<div class="col-md-8" style="    margin-top: 6px;margin-left:15px">
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${dealBean.allowExchanges == true }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" checked
													style="vertical-align: -2px" id="applyExchanges" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
												</c:if>
												
												<c:if test="${dealBean.allowExchanges == false }">
												<input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyExchanges" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
												</c:if>
											</div>
										
										
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${dealBean.allowReturns == true }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" checked
													style="vertical-align: -2px" id="applyReturns" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
												</c:if>
												<c:if test="${dealBean.allowReturns == false }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" 
													style="vertical-align: -2px" id="applyReturns" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
												</c:if>
											</div>
											
														<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${dealBean.salePriceBased == true }">
												<input type="checkbox"
													 checked
													style="vertical-align: -2px" id="applysaleprice" />&nbsp;&nbsp;&nbsp;
												Sale price based
												</c:if>
												<c:if test="${dealBean.salePriceBased == false }">
												<input type="checkbox"
													
													style="vertical-align: -2px" id="applysaleprice" />&nbsp;&nbsp;&nbsp;
												Sale price based
												</c:if>
											</div>
											
											
											
											
									</div>
								</div>
								</div>
                                   	  <!-- days -->
                                   	  
                                   	  <br>   	
									<!-- row 2 start -->   
								   <div class="row">
									   <div class="form-group col-lg-12" >
                                         	 	<div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"  ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="deal_products.label" /> </span></div>
							                    <div class="form-group col-lg-10" style="background-color: rgb(195,195,195);margin-bottom: 4px;">
							                    	<span>( Please select the appropriate SKUs to configure the deal. Sale SKU means that specific product that is under deal category. Deal SKU means the product that is given as | free item along with the sale SKU)
							                    	</span>
							                    </div>
                                         </div>
                                         <div class="col-lg-12">
                                         	<hr style="margin-top: -15px;border-top: 1px solid rgb(181,230,29);">
                                         </div>
                                      </div>
                                      
                                      
                                      
                                      <!--modification start-->
                 <div style="border: 1px solid rgb(181, 230, 29); margin: -15px -5px; padding: 5px;">
								<div style=""
									id="itemSpecificDeals">
									<div class="row">
										<div class="form-group col-lg-12">
											<c:if test="${not empty dealBean.dealGroupId}">
									   			<input type="radio" name="configureBased" onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                      		</c:if>
                                      		<c:if test="${empty dealBean.dealGroupId}">
                                      		<input type="radio" name="configureBased" checked="checked" onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                      		</c:if>
                                         	 <hr style="margin-top: 1px;">
										</div>
									</div>
							<div class="row">
							<div class="form-group col-lg-12" style="padding-right:0px;    margin-bottom: 0px;">
								<div class="form-group col-lg-3" style="margin-top: -40px;padding-right: 52px;margin-right: -40px;border-left: 1px solid lightgray;padding-top: 25px;margin-left: 5px;margin-bottom: 0px;height: 420px;">
								<hr style="margin: 0px;color: gray;width: 1px;height: 352px;border-left: 1px solid lightgray;position: absolute;left: 10px;top: 35px;">
								
											<div class="row">
											<div class="form-group col-lg-12" style="padding-left: 5px;margin-bottom: 5px;">
											<c:if test="${dealBean.saleProductCategory == '' }">
											<input type="radio" checked="checked" onchange="toggleCategoryApplyAll()"
												style="vertical-align: -2px" id="basedOnCategory" name="categoryBased" />&nbsp;
												Select Category
											</c:if>
											
											<c:if test="${dealBean.saleProductCategory != '' }">
											<input type="radio" checked="checked" onchange="toggleCategoryApplyAll()" checked="checked"
												style="vertical-align: -2px" id="basedOnCategory" name="categoryBased" />&nbsp;
												Select Category
											</c:if>
											
											</div>
											</div>
												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message code="product.category.label" /></label> 
																
													 <select class="form-control basedOnProductR saleGroups" onchange="searchSubCategoriesBasedOnCategory('saleCategory','sale_sub_category')" style="background: white;" name="category" id="saleCategory">
		                                            	<option value="" >-- Select --</option>
		                                           		 <c:forEach var="category" items="${categories}">
		                                           		 <option value="${category.categoryName}" ${category.categoryName == dealBean.saleProductCategory ? 'selected' : ''}>${category.categoryName}</option>
														<%-- <option value="${category}" ${category == dealBean.saleProductCategory ? 'selected' : ''}>${category}</option> --%>
														</c:forEach>
		                                            </select>
														<span id="lanaguageError"
															style="text-align: right; color: red; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<label><spring:message code="subcategory.label" /></label>
													 <select class="form-control basedOnProductR saleGroups" style="background: white;" name="sub_category" id="sale_sub_category">
	                                            		<option value="" >-- Select --</option>
	                                            	<c:forEach var="subCategory" items="${saleSubCategoryList}">
		                                              <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == dealBean.saleProductSubCategory ? 'selected' : ''}>${subCategory.subcategoryName}</option>
													</c:forEach>
	                                            </select>
													</div>
												</div>
												<br>

											<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message code="department.label" /></label>
														<select class="form-control basedOnProductR saleGroups" 
															style="background: white;" name="department"
															id="sale_department" onchange="appendingbardTotable('sale_department')">
															<option value="">-- Select --</option>
															<c:forEach var="departmentList" items="${departmentList}">
																<option value="${departmentList.primaryDepartment}"
																	${departmentList.primaryDepartment == dealBean.productDepartment ? 'selected' : ''}
																	id="${departmentList.primaryDepartment}">${departmentList.primaryDepartment}</option>
															 
															</c:forEach>
														</select>
													</div>

													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<label><spring:message code="section.label" /></label> <select
															class="form-control basedOnProductR saleGroups"
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
															class="form-control basedOnProductR saleGroups" onchange="appendingbardTotable(this.options[this.selectedIndex].value)"
															style="background: white;" name="brand" id="sale_brand">
															<option value="" ${'' == dealBean.brand ? 'selected' : ''}>-- Select --</option>
															<c:forEach var="brandName" items="${brandsList}">
																<option value="${brandName}" ${brandName == dealBean.brand ? 'selected' : ''}>${brandName}</option>
															</c:forEach>
														</select>
													</div>

													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<%-- <label><spring:message code="model.albel" /></label> <select
															class="form-control basedOnProduct saleGroups"
															style="background: white;" name="model" id="sale_model">
															<option value="-- Select --">-- Select --</option>
														</select> --%>
													</div>	
												</div>
												
                                          <div class="form-group col-lg-12" style="padding-left: 0px;margin-top: -20px;margin-left: -10px;">
												<br> 
												<c:if test="${dealBean.saleProductCategory == '' }">
												<input type="radio" readonly="readonly" onchange="toggleCategoryApplyAll()" checked="checked"
													style="vertical-align: -2px" id="applyForAllItemsProduct" name="categoryBased" />
													<spring:message code="applyforAllitems.label" />
												</c:if>
												<c:if test="${dealBean.saleProductCategory != '' }">
												<input type="radio" readonly="readonly" onchange="toggleCategoryApplyAll()"
													style="vertical-align: -2px" id="applyForAllItemsProduct" name="categoryBased"/>
													<spring:message code="applyforAllitems.label"  />
												</c:if>
												
												<!--onchange="toggleComboLowestProduct('applyForAllItemsProduct')"  -->
										 </div>

											</div>

											<div class="form-group col-lg-9"
												style="margin-top: -22px;width: 77%;padding-right: 0px;">
												<input type="hidden" value="${fn:length(dealBean.dealProductList)}">
												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;margin-left: -20px;">
													<c:if test="${fn:length(dealBean.dealProductList)>0}">
													<input type="radio"  checked="checked"
														onchange="toggleItemComplexBased('itemDisountBased')" 
														style="vertical-align: -2px" id="itemDisountBased" class="itemWiseDiscount" name="basedOnproductCheck">&nbsp;
													<spring:message code="itemwise.deal.label" />
													</c:if>
													<c:if test="${fn:length(dealBean.dealProductList)<=0}">
													<input type="radio"  
														onchange="toggleItemComplexBased('itemDisountBased')" 
														style="vertical-align: -2px" id="itemDisountBased" class="itemWiseDiscount" name="basedOnproductCheck">&nbsp;
													<spring:message code="itemwise.deal.label" />
													</c:if>	
													
													<select style="width: 15%;display: inline-block;margin-left: 5px;margin-right: 5px;"
																class="form-control complexDiscounts" name="offerReward" id="itemSpecificTypeBox"
																onclick="">
																<option value="Quantity Based" ${ dealBean.rewardType == 'Quantity Based'  ? 'selected' : ''}>Quantity Based</option>
																<option value="Turn Over" ${ dealBean.rewardType == 'Turn Over'  ? 'selected' : ''}>Turn Over</option>
															</select>
															
														<c:if test="${dealBean.repeat==true}">
														 <input type="checkbox" checked="checked" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatItem" />
															<spring:message code="is.repeat.label" />
														</c:if>	
														<c:if test="${dealBean.repeat==false}">
														 <input type="checkbox" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatItem" />
															<spring:message code="is.repeat.label" />
														</c:if>	
														<c:if test="${dealBean.lowestPriceItem==true}">
														<input type="checkbox"  class ="complexDiscounts" checked="checked"
																onchange="toggleComboLowest('lowestPriceItemProduct')"
																style="vertical-align: -2px;margin-left: 5px;" id="lowestPriceItemItem" />
															<spring:message code="lowest.price.item.label" />
														</c:if>	
														<c:if test="${dealBean.lowestPriceItem==false}">
														<input type="checkbox"  class ="complexDiscounts"
																onchange="toggleComboLowest('lowestPriceItemProduct')"
																style="vertical-align: -2px;margin-left: 5px;" id="lowestPriceItemItem" />
															<spring:message code="lowest.price.item.label" />
														</c:if>	
																			
												</div>
							<hr style="margin: 0px;color: gray;width: 1px;height: 115px;border-left: 1px solid lightgray;position: absolute;left: 0;top: 18px;">
										
										<div class="col-lg-12 errorMsgLogdiv" style="text-align: center;">	
										<span id="ErrorNoRecords" class="Error offersellskusError" style="text-align: center; color: red; font-weight: bold;"></span>
										<a onclick="downloadLogs();" style="color:blue;display: none;text-decoration: underline;cursor: pointer;" id="loglink">&nbsp;Click Here for Log!</a>
										<input type="hidden" id="urlfordoc" value=""/>
										</div>
										
										<div class="col-lg-12" style="padding: 0px;padding-left: 0px;">
												
												<!-- div for Deals Import -->
												<div class="col-lg-12 nopadding" style="margin-bottom: 2px;">
												<div class="col-lg-7" style="padding: 0px;"></div>
												<div class="col-lg-4" style="padding-left:0px;padding-right: 5px;">
														<input type="file" class="btn bg-olive btn-inline"
															accept=".xlsx" id="fileUploadCSV"
															onchange="addNameToTextBox('fileUploadCSV')"
															style="padding: 4px 0px; width: 100%; margin-top: 0px;" />
												</div>
												<div class="col-lg-1" style="padding: 0px;margin-left: -2px;">
						    					<input type="button"  class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelDataForDeals('edit')" style="width: -webkit-fill-available; padding: 4px 14px;" />
												</div>
												</div>
												<!-- div for Deals Import -->
												
												<div class="col-lg-6" style="padding: 0px;">
												<div class="col-lg-12" style="margin-left: -16px;padding-right: 0px;width: 102%;">
													<input type="text" 
														class="form-control searchItems basedOnProduct searchBar"
														id="searchItems"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;width: 102%;border-radius: 10px !important;" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl editDealProduct"
																style=""></ul>
														</div>
													</div>
												</div>
													
											
														<table id="saleProductsId"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="sale.skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="sale.minQty.label"/></th> 
																	<th>Turn Over</th>
																	<%-- <th><spring:message code="size.label" /></th> --%>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															 <tbody style="text-align: center;">
	                                                <c:forEach var="sellProducts" items="${dealBean.dealProductList}" varStatus="theCount">
		                                        	 <tr class='${sellProducts.saleSkuId}editsellProduct'>
		                                        	 <th style="font-weight: normal;">${theCount.count}</th>
		                                        	 	<th  style="font-weight: normal;">${sellProducts.saleSkuId}</th>
		                                        	 	<th  style="font-weight: normal;">${sellProducts.saleProductDescription}</th>
		                                        	 	<th  style="font-weight: normal;"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeQty" id="buyPluCodeQty${sellProducts.salePluCode}" value="${sellProducts.saleQuantity}" /></th>
		                                        	 	<th  style="font-weight: normal;"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeQty" id="buyPluCodeTurnOver${sellProducts.salePluCode}" value="${sellProducts.dealTurnOver}" /></th>
		                                        	 	<%-- <th  style="font-weight: normal;">${sellProducts.saleSize}</th> --%>
		                                                <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditSaleProductId('${sellProducts.saleSkuId}editsellProduct','${sellProducts.saleSkuId}')"></th>
		                                                <input type="hidden" class="buyPluCode" value="${sellProducts.salePluCode}" />
		                                                <input type="hidden" id="buyPluCode${sellProducts.salePluCode}" class="" value="${sellProducts.salePluCode}" />
		                                                <input type="hidden" id="buySkuCode${sellProducts.salePluCode}" class="" value="${sellProducts.saleSkuId}" />
		                                                <input type="hidden" class="" id="buyDiscription${sellProducts.salePluCode}"  value="${sellProducts.saleProductDescription}" />
		                                        	 </tr>
	                                        	 </c:forEach>
                                                </tbody>
														</table>
												
												</div>
												
												<div class="col-lg-6" style="padding: 0px;padding-left: 10px;">
												
												<div class="col-lg-11" style="padding: 0px;padding-right: 30px;">
													<input type="text" 
														class="form-control searchItems basedOnProduct searchBar"
														id="dealProductsDataList"
														placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl editDealProductsList"
																style=""></ul>
														</div>
													</div>
												</div>
													
												<div class="col-lg-1" style="padding-right: 2px;">
													<a onclick="" style="padding: 4px 7px;float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
												</div>
													
													
														<table id="dealProductsList"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>	
																	<th><spring:message code="deal.skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="deal.minQty.label"/></th> 
																	<th><spring:message code="ean.label" /></th>
																	<th><spring:message code="size.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															  <tbody style="text-align: center;">
			                                                	<c:forEach var="dealProducts" items="${dealBean.dealProductList}" varStatus="theCount">
					                                        	 <c:if test="${dealProducts.dealSkuId!=null && dealProducts.dealSkuId!=''}">
					                                        	 <tr class='${dealProducts.dealSkuId}editdealProduct'>
					                                        	 <%-- <th  style="font-weight: normal;">${theCount.count}</th> --%>
					                                        	 		<th  style="font-weight: normal;">${dealProducts.dealSkuId}</th>
		                                        	 					<th  style="font-weight: normal;">${dealProducts.dealProductDescription}</th>
						                                        	 	<th  style="font-weight: normal;"><input type="text" style="width: 40px;text-align: center;" class="dealPluCodeQty" id="dealPluCodeQty${dealProducts.dealPluCode}" value="${dealProducts.dealQuantity}" /></th>
						                                        	 	<th  style="font-weight: normal;">${dealProducts.dealEan}</th>
						                                        	 	<th  style="font-weight: normal;">${dealProducts.dealSize}</th>
					                                                 <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditDealProductId('${dealProducts.dealSkuId}editdealProduct','${dealProducts.dealSkuId}')"></th>
					                                        	 	<input type="hidden" class="dealPluCode" value="${dealProducts.dealPluCode}" />
					                                        	 	<input type="hidden"  id="dealPluCode${dealProducts.dealPluCode}" value="${dealProducts.dealPluCode}" />
					                                        	 	<input type="hidden"  id="dealSkuCode${dealProducts.dealPluCode}" value="${dealProducts.dealSkuId}" />
					                                        	 	<input type="hidden"  id="dealDiscription${dealProducts.dealPluCode}" value="${dealProducts.dealProductDescription}" />
					                                        	 </tr>
					                                        	 </c:if>
					                                        	 <c:if test="${dealProducts.dealSkuId==null || dealProducts.dealSkuId==''}">
					                                        	 <tr class='${dealProducts.dealSkuId}editdealProduct' style="display:none;">
					                                        	 <%-- <th  style="font-weight: normal;">${theCount.count}</th> --%>
					                                        	 		<th  style="font-weight: normal;">${dealProducts.dealSkuId}</th>
		                                        	 					<th  style="font-weight: normal;">${dealProducts.dealProductDescription}</th>
						                                        	 	<th  style="font-weight: normal;"><input type="text" style="width: 40px;text-align: center;" class="dealPluCodeQty" id="dealPluCodeQty${dealProducts.dealPluCode}" value="${dealProducts.dealQuantity}" /></th>
						                                        	 	<th  style="font-weight: normal;">${dealProducts.dealEan}</th>
						                                        	 	<th  style="font-weight: normal;">${dealProducts.dealSize}</th>
					                                                 <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditDealProductId('${dealProducts.dealSkuId}editdealProduct','${dealProducts.dealSkuId}')"></th>
					                                        	 	<input type="hidden" class="dealPluCode" value="${dealProducts.dealPluCode}" />
					                                        	 	<input type="hidden"  id="dealPluCode${dealProducts.dealPluCode}" value="${dealProducts.dealPluCode}" />
					                                        	 	<input type="hidden"  id="dealSkuCode${dealProducts.dealPluCode}" value="${dealProducts.dealSkuId}" />
					                                        	 	<input type="hidden"  id="dealDiscription${dealProducts.dealPluCode}" value="${dealProducts.dealProductDescription}" />
					                                        	 </tr>
					                                        	 </c:if>
					                                        	 
					                                        	</c:forEach>
			                                                </tbody>
														</table>
						
												</div>

												</div>
        

												<div class="form-group"
													style="margin-top: 2px; margin-bottom: 4px;margin-left: -20px;">
													
													<c:if test="${fn:length(dealBean.dealProductList)>0}">
													<input type="radio" class ="complexDiscounts"
														onchange="toggleItemComplexBased('complexDisountBased')"  name="basedOnproductCheck"
														style="vertical-align: -2px; margin-top: 33px;" id="complexDisountBased">&nbsp;
													<spring:message code="complex.deals.label" />
													</c:if>
													
													<c:if test="${fn:length(dealBean.dealProductList)<=0}">
													<input type="radio" class ="complexDiscounts" checked="checked"
														onchange="toggleItemComplexBased('complexDisountBased')"  name="basedOnproductCheck"
														style="vertical-align: -2px; margin-top: 33px;" id="complexDisountBased">&nbsp;
													<spring:message code="complex.deals.label" />
													</c:if>
													
														<select style="width: 15%;display: inline-block;margin-left: 5px;margin-right: 5px;"
																class="form-control complexDiscounts" name="offerReward" id="offerRewardCriteria"
																onclick="">
																<option value="Quantity Based" ${ dealBean.rewardType == 'Quantity Based'  ? 'selected' : ''}>Quantity Based</option>
																<option value="Turn Over" ${ dealBean.rewardType == 'Turn Over'  ? 'selected' : ''}>Turn Over</option>
														</select>
											<c:if test="${dealBean.repeat == true }">
												<input type="checkbox" checked="checked" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatProduct" />
															<spring:message code="is.repeat.label" />
											</c:if>
											<c:if test="${dealBean.repeat == false }">
												<input type="checkbox" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatProduct" />
															<spring:message code="is.repeat.label" />
											</c:if>
											
											<c:if test="${dealBean.lowestPriceItem == true }">
											<input type="checkbox"  class ="complexDiscounts" checked="checked"
																onchange="toggleComboLowest('lowestPriceItemProduct')"
																style="vertical-align: -2px;margin-left: 5px;" id="lowestPriceItemProduct" />
															<spring:message code="lowest.price.item.label" />
											</c:if>	
											<c:if test="${dealBean.lowestPriceItem == false }">
											<input type="checkbox"  class ="complexDiscounts"
																onchange="toggleComboLowest('lowestPriceItemProduct')"
																style="vertical-align: -2px;margin-left: 5px;" id="lowestPriceItemProduct" />
															<spring:message code="lowest.price.item.label" />
											</c:if>			

 															
													<c:if test="${dealBean.allowMultipleDiscounts == true }">
					                        			<input type="checkbox" checked="checked" style="vertical-align: -2px;margin-left: 5px;" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
					                       			</c:if>
					                       			<c:if test="${dealBean.allowMultipleDiscounts == false }">
					                        			<input type="checkbox" style="vertical-align: -2px;margin-left: 5px;" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
					                       			</c:if>
			
			
													<c:if test="${dealBean.combo == true }">
			                              				<input type="checkbox" checked="checked" style="vertical-align: -2px;margin-left: 5px;" onchange="toggleComboLowest('isCombo')" id="isCombo"/><spring:message code="is.combo.label" />
			                              			</c:if>
			                              			<c:if test="${dealBean.combo == false }">
			                              				<input type="checkbox" style="vertical-align: -2px;margin-left: 5px;" onchange="toggleComboLowest('isCombo')" id="isCombo"/> <spring:message code="is.combo.label" />
			                              			</c:if>
													
													
													
												</div>

												
												
												<div class="col-lg-6" style="padding:0px;">
												
												<div class="row" style="margin-top: 10px;">
												<div class="col-lg-11" style="margin-left: 15px;padding: 0px;">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItem" value=""
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
														
												<%-- <c:if test="${dealBean.rangeList[0].itemId=='ALL'}">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItem" value=""
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
												</c:if>
												<c:if test="${dealBean.rangeList[0].itemId!='ALL'}">
												<c:if test="${not empty dealBean.dealGroupId}">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItem" value=""
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
												</c:if>
												<c:if test="${empty dealBean.dealGroupId}">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItem" value="${dealBean.rangeList[0].itemId}"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
												</c:if>
												
												</c:if> --%>
													
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl dealProductItem" style=""></ul>
														</div>
													</div>
												
												
												</div>
												</div>
												
												<div id="row">
													<div class="table-responsive" 
														style="overflow: auto;white-space: nowrap;margin-left: 0px;">
														<table id=""
															class="table table-bordered table-hover"
															style="width: 100%;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr id="">
																<th><spring:message code="sno.label" /></th>
																	<th style="width: 10%"><spring:message
																			code="categoryDepartmentBrand.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="minQty.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="minAmt.label" /></th>
																	<th style="width: 7%"><spring:message
															code="action.label" /></th>		

																</tr>
															</thead>
															<c:if test="${empty dealBean.dealGroupId}">
															<c:if test="${fn:length(dealBean.dealProductList)>0}">
															<tbody style="text-align: center;display: none;" id="RangesHide1">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept1"> <input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value=""/> <input type="hidden" id="selectedBrandId" value=""> <input type="hidden" id="selectedDeptId" value=""> </td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="minQtyProductSale" 
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control minAmtProduct"
																		type="text" id="minAmtProductSale" 
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
															</c:if>
															<c:if test="${fn:length(dealBean.dealProductList)<=0}">
															<tbody style="text-align: center;" id="RangesHide1">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept1"><input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value="${dealBean.saleProductCategory}"/> <input type="hidden" id="selectedBrandId" value="${dealBean.brand}"> <input type="hidden" id="selectedDeptId" value="${dealBean.productDepartment}">
																		${dealBean.saleProductCategory}/${dealBean.productDepartment}/${dealBean.brand}</td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="minQtyProductSale" value="${dealBean.rangeList[0].saleQuantity_float}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control minAmtProduct"
																		type="text" id="minAmtProductSale" value="${dealBean.rangeList[0].minimumPurchaseamount_float}"
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
															</c:if>
															</c:if>
															<c:if test="${not empty dealBean.dealGroupId}">
															
															<tbody style="text-align: center;display: none;" id="RangesHide1">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept1"> <input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value=""/> <input type="hidden" id="selectedBrandId" value=""> <input type="hidden" id="selectedDeptId" value=""> </td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="minQtyProductSale" 
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control minAmtProduct"
																		type="text" id="minAmtProductSale" 
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
															
														</c:if>
															
														</table>
													</div>
												</div>
												
												</div>
												
												<div class="col-lg-6" style="padding-right: 0px;margin-top: 10px;">
												
												<div class="row" style="margin-top: 0px;">
												<div class="col-lg-11" style="margin-left: 15px;padding: 0px;">
												
												<c:if test="${dealBean.rangeList[0].itemId=='ALL'}">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItemSku"
														placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
												</c:if>
												<c:if test="${dealBean.rangeList[0].itemId!='ALL'}">
												<c:if test="${not empty dealBean.dealGroupId}">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItemSku"
														placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
												</c:if>
												<c:if test="${empty dealBean.dealGroupId}">
												<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItemSku" value="${dealBean.rangeList[0].itemId}"
														placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
												</c:if>
												
												</c:if>
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl dealProductItemSku"
																style=""></ul>
														</div>
													</div>
												
												
												</div>
												</div>
												
												
												<div id="row">
													<div class="table-responsive" 
														style="overflow: auto;white-space: nowrap;margin-left: 0px;">
														<table id=""
															class="table table-bordered table-hover"
															style="width: 100%;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr id="slabTr">
																<th><spring:message code="sno.label" /></th>
																	<th style="width: 10%"><spring:message
																			code="categoryDepartmentBrand.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="deal.minQty.label" /></th>
																	<%-- <th style="width: 15%"><spring:message
																			code="minAmt.label" /></th>	 --%>
																	<th style="width: 7%"><spring:message
																			code="action.label" /></th>		

																</tr>
															</thead>
															<c:if test="${empty dealBean.dealGroupId}">
															<c:if test="${fn:length(dealBean.dealProductList)>0}">
															<tbody style="text-align: center;display: none;" id="RangesHide2">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept2"> <input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value=""/> <input type="hidden" id="selectedBrandId" value=""> <input type="hidden" id="selectedDeptId" value=""> </td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="minQtyProductDeal"
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
															</c:if>
															
															<c:if test="${fn:length(dealBean.dealProductList)<=0}">
															<tbody style="text-align: center;" id="RangesHide2">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept2"> <input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value="${dealBean.saleProductCategory}"/> <input type="hidden" id="selectedBrandId" value=""> <input type="hidden" id="selectedDeptId" value=""> 
																		${dealBean.saleProductCategory}/${dealBean.productDepartment}/${dealBean.brand}</td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="minQtyProductDeal" value="${dealBean.rangeList[0].dealQuantity_float}"
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
															
															</c:if>
															</c:if>
															
															<c:if test="${not empty dealBean.dealGroupId}">
															
															<tbody style="text-align: center;display: none;" id="RangesHide2">
																<tr id="productrange1">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer1">1</td>
																		<td id="categorySubDept2"> <input type="hidden" name="selectedCategoryId" id="selectedCategoryId" value=""/> <input type="hidden" id="selectedBrandId" value=""> <input type="hidden" id="selectedDeptId" value=""> </td>
																	<td style="width: 12%"><input
																		class="form-control minQtyProduct" type="text"
																		id="minQtyProductDeal"
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
															
															</c:if>
															
														</table>
													</div>
												</div>
												
												</div>
												
												
												
											</div>
										</div>
									</div>


								</div>
								
								
								<div id= "configureBasedOnGroup">
									<div class="row">
										<div class="form-group col-lg-12">
										<c:if test="${empty dealBean.dealGroupId}">
									   			<input type="radio" name="configureBased" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                      		</c:if>
                                      		<c:if test="${not empty dealBean.dealGroupId}">
                                      			<input type="radio" name="configureBased" checked="checked" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                      		</c:if>
                                         	 <hr style="margin-top: 1px;">
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-lg-12" style="padding-right: 5px;">
										<div class="form-group col-lg-3" style="margin-top: -25px;padding-right: 35px;margin-right: -35px;padding-left: 0px;">
											

											<div class="form-group col-lg-12" style="">
											<label><spring:message code="sale_group_id.label" /></label>
											<input type="text" readonly="readonly"
												class="form-control searchItems basedOnGroup saleGroups searchBar"
												 id="saleGroup"
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
                                                	<c:if test="${not empty dealBean.dealGroupId}">
		                                                <tr id="dynamicdivsaleGroup" style='margin-top:5px;'>
		                                        	 		<td id="saleGroupId" >${dealBean.sellGroupId}</td>
		                                        	 		<td id="DelsaleGroup" ><img id="ImgsaleGroup" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20px;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/>
		                                        	 	</tr>
                                        		 	</c:if>
                                                </tbody>
												</table>
											</div>
											</div>
											
											
											<div class="form-group col-lg-12" style="">
											<label><spring:message code="deal_group_id.label" /></label>
											<input type="text" readonly="readonly"
												class="form-control searchItems basedOnGroup saleGroups searchBar"
												 id="dealGroup"
												placeholder="<spring:message code="enter.group.label" />"
												style="" />
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl dealGroup" style="width: 230px;"></ul>
												</div>
											</div>
											<div style="overflow-x: auto; margin-top: -8px;margin-bottom: 11px;">
												<table id="dealGroupProductsId"
													class="table table-bordered table-hover"
													style="margin-top: 10px; margin-bottom: 5px;">
													<thead style="background-color: #3c8dbc; color: #ffffff">
														<tr>
															<th style="width: 100px;"><spring:message
																	code="deal_group_id.label" /></th>
																	<th><spring:message code="action.label" /></th>
														</tr>
													</thead>
													 <tbody style="text-align: center;">
                                                	<c:if test="${not empty dealBean.dealGroupId}">
                                                		<tr id="dynamicdivdealGroup" style='margin-top:5px;'>
		                                        	 		<td id="dealGroupId" >${dealBean.dealGroupId}</td>
		                                        	 		<td id="DeldealGroup" ><img id="ImgdealGroup" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20px;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/>
		                                        	 	</tr>
		                                             </c:if>
                                                </tbody>
												</table>
											</div>
											</div>
											
											
											<div class="form-group col-lg-12" style="padding-left: 0px;margin-top: -20px;">
												<br> <input type="radio" 
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" />
												<spring:message code="applyforAllitems.label" />
											</div>
										

										</div>

										<div class="form-group col-lg-9"
												style="margin-top: -22px;width: 77%;padding-right: 0px;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;margin-left: -20px;">
													
													<c:if test="${not empty dealBean.dealGroupId}">
													<c:if test="${fn:length(dealBean.dealProductList)>0}">
													<input type="radio" checked="checked"
														onchange="toggleItemComplexBased('itemDisountBasedGroup')" 
														style="vertical-align: -2px" name="basedOngroupCheck"  id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.deal.label" />
													</c:if>
													<c:if test="${fn:length(dealBean.dealProductList)<=0}">
													<input type="radio" 
														onchange="toggleItemComplexBased('itemDisountBasedGroup')" 
														style="vertical-align: -2px" name="basedOngroupCheck"  id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.deal.label" />
													</c:if>
													</c:if>
													
													<c:if test="${empty dealBean.dealGroupId}">
													<input type="radio" 
														onchange="toggleItemComplexBased('itemDisountBasedGroup')" 
														style="vertical-align: -2px" name="basedOngroupCheck"  id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.deal.label" />
													</c:if>

												</div>
													
										<hr style="margin: 0px;color: gray;width: 1px;height: 115px;border-left: 1px solid lightgray;position: absolute;left: 0;top: 18px;">
												
													
										<div class="form-group col-lg-12" style="padding:0px;padding-left:0px;">

										<div class="col-lg-6" style="padding: 0px;">
										
										<div class="col-lg-12" style="padding-right: 0px;width: 102%;margin-left: -16px;">
										<input type="text" readonly="readonly"
														class="form-control searchItems basedOnGroup saleGroups searchBar"
														id="saleGroupSkuSearch"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; border-radius: 10px !important;width: 102%;" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl saleGroupSku"
																style=""></ul>
														</div>
													</div>
										</div>
											
													<div
														style=" margin-bottom: 15px; margin-top: -5px">
														<table id="saleGroupSku"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="sale.skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="sale.minQty.label"/></th> 
																	<th><spring:message code="ean.label" /></th>
																	<th><spring:message code="size.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															  <tbody style="text-align: center;">
                                                <c:set var="saleGroupSkuCount" value="1" /> 
                                                 <c:forEach var="sellSkus" items="${sellGroupSkus}" varStatus="theCount">
                                                 
                                                  <tr id="dynamicdivsaleGroupSku${saleGroupSkuCount}" >
                                                 	<c:if test="${theCount.count % 2 != 0 }">
	                                                 	
	                                                 	<c:if test="${theCount.count == 1 }">
	                                                 		<td>${theCount.count}</td>
	                                                 	</c:if>
	                                                 	<c:if test="${theCount.count >= 3 }">
	                                                 		<td>${theCount.count-1}</td>
	                                                 	</c:if>
	                                                 		 
	                                                 </c:if>
                                                 	 <c:if test="${theCount.count % 2 != 0 }">
                                                 	 	
                                        	 			<td id="skusaleGroupSku${saleGroupSkuCount}">${sellSkus}</td>
                                        	 			<input type="hidden" class="saleGroupSkuPluCode" value="${sellSkus}">
                                        	 				<td></td>
	                                        	 			<td></td>
	                                        	 			<td></td>
	                                        	 			<td></td>
                                        	 			<td id="DelsaleGroupSku${saleGroupSkuCount}" style="text-align: center;"><img id="ImgsaleGroupSku${saleGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
			                                        	
                                        	 		</c:if>
                                        	 		<%-- <c:if test="${theCount.count % 2 == 0 }">
                                        	 			<td id="pluCodesaleGroupSku${saleGroupSkuCount}">${sellSkus}</td>
                                        	 			<input type="hidden" class="saleGroupSkuPluCode" value="${sellSkus}">
                                        	 			<td id="DelsaleGroupSku${saleGroupSkuCount}" style="text-align: center;"><img id="ImgsaleGroupSku${saleGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
                                        	 		</c:if> --%>
                                        	 		<c:set var="saleGroupSkuCount" value="${saleGroupSkuCount + 1}" />
                                        	 		 </tr>
			                                       
                                               	</c:forEach>
                                                </tbody>
														</table>
													</div>
										
										</div>
										
										
										<div class="col-lg-6" style="padding:0px;padding-left:10px;">
											<div class="col-lg-11" style="padding-right: 0px;width: 87%;margin-left: -16px;margin-right: 6px;">
												<input type="text" readonly="readonly"
														class="form-control searchItems basedOnGroup searchBar"
														id="dealGroupSkuSearch"
														placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"
														style="border: 1px solid #ddd; border-radius: 7px !important" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl dealGroupSku"
																style=""></ul>
														</div>
													</div>
													</div>
													<div class="col-lg-1" style="padding-right: 0px;margin-left: 25px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 7px;float: right;" class="btn bg-olive btn-inline">Add All</a>
													</div>
													<div
														style="margin-bottom: 15px; margin-top: -5px">
														<table id="dealGroupSku"
															class="table table-bordered table-hover"
															style="margin-top: 10px; margin-bottom: 5px;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="deal.skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="deal.minQty.label"/></th> 
																	<th><spring:message code="ean.label" /></th>
																	<th><spring:message code="size.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															 <tbody style="text-align: center;">
                                                	<c:set var="dealGroupSkuCount" value="1" /> 
	                                                 <c:forEach var="dealSkus" items="${dealGroupSkus}" varStatus="theCount">
	                                                 <tr id="dynamicdivdealGroupSku${dealGroupSkuCount}" >		
	                                                 	<c:if test="${theCount.count % 2 != 0 }">
	                                                 	
	                                                 	<c:if test="${theCount.count == 1 }">
	                                                 		<td>${theCount.count}</td>
	                                                 	</c:if>
	                                                 	<c:if test="${theCount.count >= 3 }">
	                                                 		<td>${theCount.count-1}</td>
	                                                 	</c:if>
	                                                 		 
	                                                 	</c:if>
	                                                 	 <c:if test="${theCount.count % 2 != 0 }">
			                                                 
	                                        	 			<td id="skudealGroupSku${dealGroupSkuCount}">${dealSkus}</td>
	                                        	 			<input type="hidden" class="dealGroupSkuPluCode" value="${dealSkus}">
	                                        	 			<td></td>
	                                        	 			<td></td>
	                                        	 			<td></td>
	                                        	 			<td></td>
	                                        	 			<td id="DeldealGroupSku${dealGroupSkuCount}" style="text-align: center;"><img id="ImgdealGroupSku${dealGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
	                                        	 		</c:if>
	                                        	 		<%-- <c:if test="${theCount.count % 2 == 0 }">
	                                        	 			
	                                        	 			<td id="pluCodedealGroupSku${dealGroupSkuCount}">${dealSkus}</td>
	                                        	 			<input type="hidden" class="dealGroupSkuPluCode" value="${dealSkus}">
	                                        	 			<td id="DeldealGroupSku${dealGroupSkuCount}" style="text-align: center;"><img id="ImgdealGroupSku${dealGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
				                                        	 </tr>
				                                        	 <c:set var="dealGroupSkuCount" value="${dealGroupSkuCount + 1}" />
	                                        	 		</c:if> --%>
	                                        	 		</tr>
	                                        	 		 <c:set var="dealGroupSkuCount" value="${dealGroupSkuCount + 1}" />
	                                               	</c:forEach>
                                                
                                                
                                                	<%-- <tr style="text-align: center;">
                                                	<c:forEach var="dealSkus" items="${dealGroupSkus}" varStatus="theCount">
		                                        	 		<td>${dealSkus}</td>
		                                        	 		<c:if test="${theCount.count % 2 == 0 }">
		                                        	 		<td id="DeldealGroup"  style="text-align: center;"><img id="ImgdealGroup" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
			                                        	 </tr>
			                                        	 <tr>
                                        	 		</c:if>
                                        	 		</c:forEach> --%>
                                                </tbody>
														</table>
													</div>
										</div>
										
													
												</div>
												
												
												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 4px;margin-left: -20px;">
													
													<c:if test="${not empty dealBean.dealGroupId}">
													
													<c:if test="${fn:length(dealBean.dealProductList)>0}">
													<input type="radio"  name="basedOngroupCheck" 
														onchange="toggleItemComplexBased('complexbasedOnGroup')" 														style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.deals.label" />
													</c:if>
													<c:if test="${fn:length(dealBean.dealProductList)<=0}">
													<input type="radio"  name="basedOngroupCheck" checked="checked"
														onchange="toggleItemComplexBased('complexbasedOnGroup')" 														style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.deals.label" />
													</c:if>
													
													
													</c:if>
													<c:if test="${empty dealBean.dealGroupId}">
													<input type="radio"  name="basedOngroupCheck" 
														onchange="toggleItemComplexBased('complexbasedOnGroup')" 														style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.deals.label" />
													</c:if>
													
													
													
												</div>
													

												

									<div class="col-lg-6" style="padding:0px">
									
									<div class="row" style="margin-top: 10px;">
									<div class="col-lg-11" style="margin-left: 15px;padding: 0px;">
									<c:if test="${dealBean.rangeList[0].itemId=='ALL'}">
									<input type="text" class="form-control searchDealItems basedOnGroup searchBar"
											id="dealProductItemGroup" value=""
											placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
											style="border: 1px solid #ddd;border-radius: 10px !important;" />
									</c:if>
									<c:if test="${dealBean.rangeList[0].itemId!='ALL'}">
									<c:if test="${not empty dealBean.dealGroupId}">
									<input type="text" class="form-control searchDealItems basedOnGroup searchBar"
											id="dealProductItemGroup" value="${dealBean.rangeList[0].itemId}"
											placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
											style="border: 1px solid #ddd;border-radius: 10px !important;" />
									</c:if>
									<c:if test="${empty dealBean.dealGroupId}">
									<input type="text" class="form-control searchDealItems basedOnGroup searchBar"
											id="dealProductItemGroup" value=""
											placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
											style="border: 1px solid #ddd;border-radius: 10px !important;" />
									</c:if>
									
									</c:if>
										
										<div class="services">
										<div class="items">
										  <ul class="matchedStringUl dealProductItemGroup"
													style=""></ul>
										</div>
										</div>
									</div>
									</div>	
									
									<input type="hidden" id="typeForGroup" value="new">
									<div id="ro" style="overflow: auto;white-space: nowrap;margin-left: 0px;">
									<div class="table-responsive" style="margin-top: 0px;">
										<table id="" class="table table-bordered table-hover"
											style="width: 100%;">
											<thead style="background-color: #3c8dbc; color: #ffffff">
												<tr id="">
													<th style=""><spring:message
															code="sno.label" /></th>
													<th style="width: 10%"><spring:message
															code="groupid.label" /></th>
													
													<th style="width: 15%"><spring:message
															code="minQty.label" /></th>
													<th style="width: 15%"><spring:message
															code="minAmt.label" /></th>
													<th style="width: 10%"><spring:message
															code="max.amt.label" /></th>
													<th style="width: 7%"><spring:message
															code="action.label" /></th>
												</tr>
											</thead>
											
											<c:if test="${not empty dealBean.dealGroupId}">
													
											<c:if test="${fn:length(dealBean.dealProductList)>0}">
											
											<tbody style="text-align: center;">
												<tr id="range1">
													<td ><span id="1rangename">1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="1groupId" style="width:100px"
														placeholder="" />
														<div class="services">
															<div class="items">
															<ul class="matchedStringUl 1groupId"
																style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="groupSaleMinQty"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control minAmt"
														type="text" id="groupSaleMinAmt"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control maxAmt"
														type="text" id="groupSaleMaxAmt"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
											
													
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
											
													</c:if>
													
											<c:if test="${fn:length(dealBean.dealProductList)<=0}">
											
											<tbody style="text-align: center;">
												<tr id="range1">
													<td ><span id="1rangename">1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="1groupId" style="width:100px"
														placeholder="" value="${dealBean.rangeList[0].saleGroupId}"  />
														<div class="services">
															<div class="items">
															<ul class="matchedStringUl 1groupId"
																style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													
													<td style="width: 12%"><input value="${dealBean.rangeList[0].saleQuantity_float}"
														class="form-control minQty" type="text" id="groupSaleMinQty"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control minAmt" value="${dealBean.rangeList[0].minimumPurchaseamount_float}"
														type="text" id="groupSaleMinAmt"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control maxAmt" value="${dealBean.rangeList[0].maximumPurchaseamount_float}"
														type="text" id="groupSaleMaxAmt"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
											
													
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
													
											</c:if>
													
													
											</c:if>
										<c:if test="${empty dealBean.dealGroupId}">
										
										<tbody style="text-align: center;">
												<tr id="range1">
													<td ><span id="1rangename">1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="1groupId" style="width:100px"
														placeholder="" />
														<div class="services">
															<div class="items">
															<ul class="matchedStringUl 1groupId"
																style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="groupSaleMinQty"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control minAmt"
														type="text" id="groupSaleMinAmt"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
													<td style="width: 12%"><input class="form-control maxAmt"
														type="text" id="groupSaleMaxAmt"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
											
													
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
											
										</c:if>
											
											
										</table>
									</div>
									</div>
									
									</div>
									
									<div class="col-lg-6" style="padding:0px">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 10px;margin-left: 10px;">
											<div class="form-group col-lg-4" style="width: 38%;padding-top: 0px; margin-bottom: 0px;padding-left: 0px;z-index: 1;">
											
												 <select
													class="form-control" name="offerReward" id="offerRewardCriteriaGroup"
													onclick="toggleComboLowest('offerRewardCriteriaGroup')">
													<option value="Quantity Based" ${ dealBean.rewardType == 'Quantity Based'  ? 'selected' : ''}>Quantity Based</option>
																<option value="Turn Over" ${ dealBean.rewardType == 'Turn Over'  ? 'selected' : ''}>Turn Over</option>
													
												</select>
												
											</div>

											<div class="form-group col-lg-4"
												style="text-align: center; margin-top: 4px; margin-left: -45px; padding-right: 0px;margin-bottom: 8px;white-space:nowrap">
												<c:if test="${dealBean.repeat == true }">
												<input type="checkbox" checked="checked"
													style="vertical-align: -2px" id="isRepeat" />
												<spring:message code="is.repeat.label" />
												</c:if>
												<c:if test="${dealBean.repeat == false }">
												<input type="checkbox" 
													style="vertical-align: -2px" id="isRepeat" />
												<spring:message code="is.repeat.label" />
												</c:if>
												
											</div>
														
											<div class="form-group col-lg-4"
												style="text-align: center; margin-top: 4px; padding-left: 0px; padding-right: 0px;margin-bottom: 8px;white-space:nowrap">
												 
												 <c:if test="${dealBean.lowestPriceItem == true }">
												 <input type="checkbox" checked="checked"
													onchange="toggleComboLowest('lowestPriceItem')"
													style="vertical-align: -2px" id="lowestPriceItem" />
												<spring:message code="lowest.price.item.label" />
												 </c:if>
												 
												 <c:if test="${dealBean.lowestPriceItem == false }">
												 <input type="checkbox"
													onchange="toggleComboLowest('lowestPriceItem')"
													style="vertical-align: -2px" id="lowestPriceItem" />
												<spring:message code="lowest.price.item.label" />
												 </c:if>

											</div>

											</div>

										</div>
									 <input type="hidden" id="typeForGroup" value="new">
									<div id="ro" style="overflow: auto;white-space: nowrap;margin-left: 10px;">
									<div class="table-responsive" style="margin-top: 0px;">
										<table id="" class="table table-bordered table-hover"
											style="width: 100%;">
											<thead style="background-color: #3c8dbc; color: #ffffff">
												<tr id="">
													<th style=""><spring:message
															code="sno.label" /></th>
													<th style="width: 10%"><spring:message
															code="groupid.label" /></th>
													<th style="width: 15%"><spring:message
															code="deal.minQty.label" /></th>
													
													<th style="width: 7%"><spring:message
															code="action.label" /></th>
												</tr>
											</thead>
											
											<c:if test="${not empty dealBean.dealGroupId}">
													
											<c:if test="${fn:length(dealBean.dealProductList)>0}">
												
												<tbody style="text-align: center;">
												<tr id="range1">
													<td ><span id="1rangename">1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="2groupId" style="width:100px"
														placeholder="" />
														<div class="services">
															<div class="items">
																<ul class="matchedStringUl 2groupId"
																	style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="groupDealMinQty"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>

													<td style="width:7%"><div style="width: 60px;">
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
												
											</c:if>
											<c:if test="${fn:length(dealBean.dealProductList)<=0}">
													
													<tbody style="text-align: center;">
												<tr id="range1">
													<td ><span id="1rangename">1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="2groupId" style="width:100px"
														placeholder="" value="${dealBean.rangeList[0].groupId}"/>
														<div class="services">
															<div class="items">
																<ul class="matchedStringUl 2groupId"
																	style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="groupDealMinQty" value="${dealBean.rangeList[0].dealQuantity_float}"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>

													<td style="width:7%"><div style="width: 60px;">
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
													
											</c:if>
													
													
											</c:if>
											
											<c:if test="${empty dealBean.dealGroupId}">
													
													<tbody style="text-align: center;">
												<tr id="range1">
													<td ><span id="1rangename">1</span></td>
													<td style="width: 10%; padding-left: 0px;"><input type="text"
														class="form-control groupSearch"
														oninput="getGroupIds(this);"
														onkeydown="keyDownMethod(event.keyCode,this);"
														id="2groupId" style="width:100px"
														placeholder="" />
														<div class="services">
															<div class="items">
																<ul class="matchedStringUl 2groupId"
																	style="width: 138px;"></ul>
															</div>
														</div> <input type="hidden" id="selected1groupId"></td>
													
													<td style="width: 12%"><input
														class="form-control minQty" type="text" id="groupDealMinQty"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>

													<td style="width:7%"><div style="width: 60px;">
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
													
											</c:if>
											
											
											
										</table>
									</div>
									</div>
									
									</div>
                            
												
													</div>
										</div>
									</div>
								</div>
								</div>
                                       
                                      
                                      <!--modification end-->
                                      
                                      
                                      
                                      
                                    <!--  <div class="row">
									   <div class="form-group col-lg-12" >
									   		<c:if test="${not empty dealBean.dealGroupId}">
									   			<input type="checkbox" onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                      		</c:if>
                                      		<c:if test="${empty dealBean.dealGroupId}">
                                      			<input type="checkbox" checked="checked" onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                      		</c:if>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                      <div id="itemSpecificDeals">
                                        <div class="row">
											<div class="form-group col-lg-3" style="margin-top: -25px;">
							        	 		 <label><spring:message code="sale_product_category.label" /></label>
		                                            <select class="form-control basedOnProduct saleGroups" onchange="searchSubCategoriesBasedOnCategory('saleCategory','sale_sub_category')" style="background: white;" name="category" id="saleCategory">
		                                            	<option value="-- Select --" >-- Select --</option>
		                                           		 <c:forEach var="category" items="${categories}">
		                                           		 <option value="${category.categoryName}" ${category.categoryName == dealBean.saleProductCategory ? 'selected' : ''}>${category.categoryDescription}</option>
														<%-- <option value="${category}" ${category == dealBean.saleProductCategory ? 'selected' : ''}>${category}</option> --%>
													</c:forEach>
		                                            </select>
		                                            <input type="hidden" id="">
		                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
											</div>	
											 <div class="form-group col-lg-3" style="margin-top: -25px;">
	                                            <label><spring:message code="sale_product_sub_category.label" /></label>
	                                            <select class="form-control basedOnProduct saleGroups" style="background: white;" name="sub_category" id="sale_sub_category">
	                                            <option value="-- Select --" >-- Select --</option>
	                                            	<c:forEach var="subCategory" items="${saleSubCategoryList}">
		                                              <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == dealBean.saleProductSubCategory ? 'selected' : ''}>${subCategory.subcategoryDescription}</option>
													</c:forEach>
	                                            </select>
	                                            
	                                         </div>	
	                                         
                                      	  <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="product_id.label" /></label>
									     
									      <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="searchItems" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl editDealProduct" style="width: 230px;"></ul>
								   				</div>
											</div>
									     
									      <%--  <input type="text" name="minPayAmount" list="productList" class="form-control"  name="searchCriteria" id="searchCriteria" size="250" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
                                          <datalist id="productList" style="position:absolute;">
                                          </datalist> --%>
                                            <span id="dealSaleProducts" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <div style="overflow-x : auto;margin-bottom: 15px;">
                                            <table id="saleProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="product_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
	                                                <c:forEach var="sellProducts" items="${sellProducts}">
		                                        	 <tr class='${sellProducts}editsellProduct'>
		                                        	 		<th  style="font-weight: normal;">${sellProducts}</th>
		                                                 <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditSaleProductId('${sellProducts}editsellProduct','${sellProducts}')"></th>
		                                        	 </tr>
	                                        	 </c:forEach>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
                                      
                                       <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="buy_sku_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="buySkuList" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl editbuySkuList" style="width: 230px;"></ul>
								   				</div>
											</div>
									     
									      <%-- <input type="text" name="buySku" list="buySkuList" class="form-control" id="buySku" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
                                         <datalist id="buySkuList" style="position:absolute;"></datalist> --%>
                                         <div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleSkuids" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<th><spring:message code="plucode.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
	                                        	<c:set var="sellSkuCount" value="1" /> 
	                                        	<c:set var="sku" />
                                                <c:forEach var="sellSkus" items="${sellskus}" varStatus="theCount">
                                                	<c:if test="${theCount.count % 2 != 0 }">
                                                		 <tr class='${sellSkuCount}editskuProduct'>
                                        	 			<th  style="font-weight: normal;">${sellSkus}</th>
                                        	 			<c:set var="sku" value="${sellSkus}" />
                                        	 		</c:if>
                                        	 		<c:if test="${theCount.count % 2 == 0 }">
                                        	 			<th  style="font-weight: normal;">${sellSkus}
                                        	 				<input type="hidden" class="buyPluCode" value="${sellSkus}">
                                        	 			</th>
			                                               <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditSaleSkuId('${sellSkuCount}editskuProduct','${sku}')"></th>
			                                        	 </tr>
                                        	 			 <c:set var="sellSkuCount" value="${sellSkuCount + 1}" />
                                        	 		</c:if>
                                        	 </c:forEach>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  </div>
									  </div>
									  <div class="row">
											<div class="form-group col-lg-3" style="margin-top: -25px;">
							        	 		 <label><spring:message code="deal_product_category.label" /></label>
		                                            <select class="form-control basedOnProduct" style="background: white;"  onchange="searchSubCategoriesBasedOnCategory('dealCategory','deal_sub_category')" name="category" id="dealCategory">
		                                            	<option value="-- Select --" >-- Select --</option>
		                                           		 <c:forEach var="category" items="${categories}">
		                                           		 <option value="${category.categoryName}" ${category.categoryName == dealBean.dealProductCategory ? 'selected' : ''}>${category.categoryDescription}</option>
														<%-- <option value="${category}" ${category == dealBean.dealProductCategory ? 'selected' : ''}>${category}</option> --%>
													</c:forEach>
		                                            </select>
		                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
											</div>	
											 <div class="form-group col-lg-3" style="margin-top: -25px;">
	                                            <label><spring:message code="deal_product_sub_category.label" /></label>
	                                            <select class="form-control basedOnProduct" style="background: white;" name="sub_category" id="deal_sub_category">
	                                            <option value="-- Select --" >-- Select --</option>
	                                            <c:forEach var="subCategory" items="${dealSubCategoryList}">
		                                              <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == dealBean.dealProductSubCategory ? 'selected' : ''}>${subCategory.subcategoryDescription}</option>
													</c:forEach>
	                                            </select>
	                                         </div>	
	                                         
                                      	  <div class="form-group col-lg-3" style="margin-top: -25px;">
									      <label><spring:message code="offer_product_id.label" />  <span class="requiredField">*</span></label>
									       <input type="text"  class="form-control searchItems basedOnProduct" id="dealProductsDataList" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl editDealProductsList" style="width: 230px;"></ul>
								   				</div>
											</div>
									      
									     <%--  <input type="text" name="dealProductId" list="dealProductdatalist" class="form-control" id="dealProductId" placeholder="<spring:message code="deal_enter_deal_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
                                           <datalist id="dealProductdatalist" style="position:absolute;"></datalist> --%>
                                           <div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="dealProductsList" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                        	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="deal_product_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                	<c:forEach var="dealProducts" items="${dealproducts}">
		                                        	 <tr class='${dealProducts}editdealProduct'>
		                                        	 		<th  style="font-weight: normal;">${dealProducts}</th>
		                                                 <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditDealProductId('${dealProducts}editdealProduct','${dealProducts}')"></th>
		                                        	 </tr>
		                                        	</c:forEach>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
                                      
                                       <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="offer_sku_id.label" />  <span class="requiredField">*</span></label>
									      <input type="text"  class="form-control searchItems basedOnProduct" id="dealSkudatalist" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl editDealSkudatalist" style="width: 230px;"></ul>
								   				</div>
											</div>
											
											
									      <%-- <input type="text" name="dealSkuId" list="dealSkudatalist" class="form-control" id="dealSkuId" placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
                                          <datalist id="dealSkudatalist" style="position:absolute;"></datalist> --%>
                                         <div style="overflow-x : auto;margin-bottom: 15px;">
                                          <table id="dealSkuTable" class="table table-bordered table-hover" style="margin-top: 10px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<th><spring:message code="plucode.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
		                                        <c:set var="dealSkuCount" value="1" /> 
		                                        <c:set var="sku" />
                                                <c:forEach var="dealskus" items="${dealskus}" varStatus="theCount">
	                                                <c:if test="${theCount.count % 2 != 0 }">
			                                        	<tr class='${dealSkuCount}editdealsku'>
	                                        	 		<th  style="font-weight: normal;">${dealskus}</th>
	                                        	 		<c:set var="sku" value="${dealskus}" />
	                                        	 	</c:if>
                                        	 		<c:if test="${theCount.count % 2 == 0 }">
                                        	 				<th  style="font-weight: normal;">${dealskus}
                                        	 					<input type="hidden" class="dealPluCode" value="${dealskus}">
                                        	 				</th>
			                                               <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeeditDelaSkuId('${dealSkuCount}editdealsku','${sku}')"></th>
				                                        	 <c:set var="dealSkuCount" value="${dealSkuCount + 1}" />
			                                        	 </tr>
                                        	 		</c:if>
                                        	 </c:forEach>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  </div>
									  <div class="row">
									   <div class="form-group col-lg-12" >
									   		<c:if test="${empty dealBean.dealGroupId}">
									   			<input type="checkbox" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                      		</c:if>
                                      		<c:if test="${not empty dealBean.dealGroupId}">
                                      			<input type="checkbox" checked="checked" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                      		</c:if>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
									  <div class="row">
									  <div id="itemSpecificDeals">
									  	<div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="sale_group_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroup" placeholder="<spring:message code="enter.group.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroup" style="width: 230px;"></ul>
								   				</div>
											</div>
									      <div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th style="width:100px;"><spring:message code="sale_group_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                                <tbody style="text-align: center;">
                                                	<c:if test="${not empty dealBean.sellGroupId}">
		                                                <tr id="dynamicdivsaleGroup" style='margin-top:5px;'>
		                                        	 		<td id="saleGroupId" >${dealBean.sellGroupId}</td>
		                                        	 		<td id="DelsaleGroup" ><img id="ImgsaleGroup" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20px;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/>
		                                        	 	</tr>
                                        		 	</c:if>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="buy_sku_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroupSkuSearch" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroupSku" style="width: 230px;"></ul>
								   				</div>
											</div>
											<div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupSku" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<th><spring:message code="plucode.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                <c:set var="saleGroupSkuCount" value="1" /> 
                                                 <c:forEach var="sellSkus" items="${sellGroupSkus}" varStatus="theCount">
                                                 	 <c:if test="${theCount.count % 2 != 0 }">
                                                 	 	 <tr id="dynamicdivsaleGroupSku${saleGroupSkuCount}" >
                                        	 			<td id="skusaleGroupSku${saleGroupSkuCount}">${sellSkus}</td>
                                        	 		</c:if>
                                        	 		<c:if test="${theCount.count % 2 == 0 }">
                                        	 			<td id="pluCodesaleGroupSku${saleGroupSkuCount}">${sellSkus}</td>
                                        	 			<input type="hidden" class="saleGroupSkuPluCode" value="${sellSkus}">
                                        	 			<td id="DelsaleGroupSku${saleGroupSkuCount}" style="text-align: center;"><img id="ImgsaleGroupSku${saleGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
			                                        	 </tr>
			                                        	 <c:set var="saleGroupSkuCount" value="${saleGroupSkuCount + 1}" />
                                        	 		</c:if>
                                               	</c:forEach>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  </div>
                                         <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="deal_group_id.label" /></label>
									   
									    <input type="text"  class="form-control searchItems basedOnGroup" readonly="readonly" id="dealGroup" placeholder="<spring:message code="enter.group.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl dealGroup" style="width: 230px;"></ul>
								   				</div>
											</div>
                                            <span id="dealGroupProducts" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <div style="overflow-x : auto;margin-bottom: 15px;">
                                            <table id="dealGroupProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th style="width: 105px;"><spring:message code="deal_group_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                	<c:if test="${not empty dealBean.dealGroupId}">
                                                		<tr id="dynamicdivdealGroup" style='margin-top:5px;'>
		                                        	 		<td id="dealGroupId" >${dealBean.dealGroupId}</td>
		                                        	 		<td id="DeldealGroup" ><img id="ImgdealGroup" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20px;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/>
		                                        	 	</tr>
		                                             </c:if>
                                                </tbody>
                                                
                                          </table>
                                          </div>
									  </div>
                                        <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="offer_sku_id.label" /></label>
									      <input type="text"  class="form-control searchItems basedOnGroup" readonly="readonly" id="dealGroupSkuSearch" placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl dealGroupSku" style="width: 230px;"></ul>
								   				</div>
											</div>
											<div style="overflow-x : auto;margin-bottom: 15px;">
                                          <table id="dealGroupSku" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<th><spring:message code="plucode.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                	<c:set var="dealGroupSkuCount" value="1" /> 
	                                                 <c:forEach var="dealSkus" items="${dealGroupSkus}" varStatus="theCount">
	                                                 	 <c:if test="${theCount.count % 2 != 0 }">
			                                                 <tr id="dynamicdivdealGroupSku${dealGroupSkuCount}" >
	                                        	 			<td id="skudealGroupSku${dealGroupSkuCount}">${dealSkus}</td>
	                                        	 		</c:if>
	                                        	 		<c:if test="${theCount.count % 2 == 0 }">
	                                        	 			<td id="pluCodedealGroupSku${dealGroupSkuCount}">${dealSkus}</td>
	                                        	 			<input type="hidden" class="dealGroupSkuPluCode" value="${dealSkus}">
	                                        	 			<td id="DeldealGroupSku${dealGroupSkuCount}" style="text-align: center;"><img id="ImgdealGroupSku${dealGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
				                                        	 </tr>
				                                        	 <c:set var="dealGroupSkuCount" value="${dealGroupSkuCount + 1}" />
	                                        	 		</c:if>
	                                               	</c:forEach>
                                                
                                                
                                                	<%-- <tr style="text-align: center;">
                                                	<c:forEach var="dealSkus" items="${dealGroupSkus}" varStatus="theCount">
		                                        	 		<td>${dealSkus}</td>
		                                        	 		<c:if test="${theCount.count % 2 == 0 }">
		                                        	 		<td id="DeldealGroup"  style="text-align: center;"><img id="ImgdealGroup" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
			                                        	 </tr>
			                                        	 <tr>
                                        	 		</c:if>
                                        	 		</c:forEach> --%>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  
                                  </div>-->
                                  
                                  
                               
                                 <div class="row" style="margin-top:20px;display:none;">
                                	<div class="form-group col-lg-3"  style="text-align: center;">
                               			<c:if test="${dealBean.allowMultipleDiscounts == true }">
		                        			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
		                       			</c:if>
		                       			<c:if test="${dealBean.allowMultipleDiscounts == false }">
		                        			<input type="checkbox" style="vertical-align: -2px" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
		                       			</c:if>
                                	</div>
                                	<div class="form-group col-lg-3"  style="text-align: center;">
                                		<c:if test="${dealBean.repeat == true }">
                              				<input type="checkbox" checked="checked" style="vertical-align: -2px" id="isRepeat"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.repeat.label" />
                              			</c:if>
                              			<c:if test="${dealBean.repeat == false }">
                              				<input type="checkbox" style="vertical-align: -2px" id="isRepeat"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.repeat.label" />
                              			</c:if>
                               		</div>
                               		<div class="form-group col-lg-3"  style="text-align: center;">
                                		<c:if test="${dealBean.combo == true }">
                              				<input type="checkbox" checked="checked" style="vertical-align: -2px" onchange="toggleComboLowest('isCombo')" id="isCombo"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.combo.label" />
                              			</c:if>
                              			<c:if test="${dealBean.combo == false }">
                              				<input type="checkbox" style="vertical-align: -2px" onchange="toggleComboLowest('isCombo')" id="isCombo"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.combo.label" />
                              			</c:if>
                               		</div>
                               		<div class="form-group col-lg-3"  style="text-align: center;">
                                		<c:if test="${dealBean.lowestPriceItem == true }">
                              				<input type="checkbox" checked="checked" style="vertical-align: -2px" onchange="toggleComboLowest('lowestPriceItem')" id="lowestPriceItem"/>&nbsp;&nbsp;&nbsp; <spring:message code="lowest.price.item.label" />
                              			</c:if>
                              			<c:if test="${dealBean.lowestPriceItem == false }">
                              				<input type="checkbox" style="vertical-align: -2px" onchange="toggleComboLowest('lowestPriceItem')" id="lowestPriceItem"/>&nbsp;&nbsp;&nbsp; <spring:message code="lowest.price.item.label" />
                              			</c:if>
                               		</div>
                               	</div> 
                                 
           					 <div >
                              	 <label style="font-weight: bold;font-size: 16px;color:#666;display:none;"><spring:message code="deal_slabs.label" /></label>
                              	<%--  <input type="button" style="padding: 0px;float: right;" class="btn bg-olive btn-inline" onclick="addSlab()" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="deal_add_slabs.label" />&nbsp;&nbsp;&nbsp;&nbsp;" /> --%>
                              	   <%-- <label style="font-weight:bold;float: right;cursor: pointer;" onclick="addSlab()"><spring:message code="deal_add_slabs.label" /> </label> --%>
                               	 <hr style="margin-top: 1px;">
                              </div>
                              
                  	<div class="table-responsive" style="margin-top:-22px;display: none;">
                     <table class="table table-bordered table-hover" style="width:100%;" id="editRangesTable">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr id="slabTr">
                         	<th style="width: 7%;display: none;"><spring:message code="deal_slabname.label"/></th>
                         	<th style="width: 15%"><spring:message code="groupid.label"/></th>
                         	 <th style="width: 15%"><spring:message code="item_id.label"/></th>
                             <th style="width: 15%"><spring:message code="minimum_purchase_quantity.label"/></th>
                             <th style="width: 15%"><spring:message code="minimum_purchase_amount.label"/></th>
                             <th style="width: 15%"><spring:message code="free_quantity.label"/></th>
                             <th style="width: 15%"><spring:message code="range.mode.label"/></th>
                             <th style="width: 15%"><spring:message code="description.label"/></th>
                             <th style="width: 7%"><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 		<tr id='editrange0' style="display: none;">
                   	 	 <td style="width: 7%;display: none;"><label id="0rangeId"></label></td>
                   	 	 <td style="width: 15%">
                       			 	<input type="text"  class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="0groupId" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 0groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected0groupId">
                       			</td>
                       			<td style="width: 15%">
                       			<input type="text"  class="form-control itemSearch" onblur="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="0itemId" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 0itemId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected0itemId">
									<input type="hidden" id="pluCode0itemId">
                       			</td>
                         <td style="width: 15%"><input type="text" id="0minpurchaseqty" class="form-control minPurQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                         <td style="width: 15%"><input type="text" id="0minpurchaseamt" class="form-control minPurAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                         <td style="width: 15%"><input type="text" id="0dealqty" class="form-control dealQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                         <td> 
                       	    <select class="form-control" name="rangeMode" id="0rangeMode" onchange="changeRangeMode(this,'edit');" >
                                <option value="both">Both</option>
					   			<option value="condition">Condition</option>
                                <option value="promotion">Promotion</option>
                            </select>
                       </td>
                         <td style="width: 15%"><input type="text" id="0description" class="form-control dealDesc" ></td>
                         <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addeditSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeeditSlab('editrange0')"></div></td>
                   	 </tr>
			 	 <c:forEach var="dealranges" items="${dealBean.rangeList}" varStatus="textid">
                       	 <tr id='editrange${textid.count}'>
                       	 	 <td style="width: 7%;display: none;"><label id="${textid.count}rangeId">${dealranges.range }</label></td>
                       	 	 <td style="width: 15%">
                       			 	<input type="text" value="${dealranges.groupId}" class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}groupId" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected${textid.count}groupId" value="${dealranges.groupId }" >
                       			</td>
                       			<td style="width: 15%">
                       			<input type="text" value="${dealranges.itemId}" class="form-control itemSearch" onblur="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}itemId" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}itemId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected${textid.count}itemId" value="${dealranges.itemId }" >
									<input type="hidden" id="pluCode${textid.count}itemId" value="${dealranges.pluCode }" >
                       			</td>
                       		<c:if test="${dealranges.rangeMode == 'promotion'}">
                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseQuantity }" id="${textid.count}minpurchaseqty" class="form-control minPurQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamount }" id="${textid.count}minpurchaseamt" class="form-control minPurAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                            </c:if>
                            <c:if test="${dealranges.rangeMode != 'promotion'}">
                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseQuantity }" id="${textid.count}minpurchaseqty" class="form-control minPurQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamount }" id="${textid.count}minpurchaseamt" class="form-control minPurAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                            </c:if>
                             <c:if test="${dealranges.rangeMode == 'condition'}">
                             	<td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.dealQuantity }" id="${textid.count}dealqty" class="form-control dealQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             </c:if>
                             <c:if test="${dealranges.rangeMode != 'condition'}">
                             	<td style="width: 15%"><input type="text" value = "${dealranges.dealQuantity }" id="${textid.count}dealqty" class="form-control dealQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             </c:if>
                             <td> 
                          	    <select class="form-control" name="rangeMode" id="${textid.count}rangeMode" onchange="changeRangeMode(this,'edit');" >
                                    <option value="both"  ${dealranges.rangeMode == "both" ? 'selected' : ''}>Both</option>
								    <option value="condition" ${dealranges.rangeMode == "condition" ? 'selected' : ''}>Condition</option>
                                    <option value="promotion" ${dealranges.rangeMode == "promotion" ? 'selected' : ''}>Promotion</option>
                                 </select>
                             </td>
                             <td style="width: 15%"><input type="text" value = "${dealranges.description }" id="${textid.count}description" class="form-control dealDesc" ></td>
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addeditSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeeditSlab('editrange${textid.count}')"></div></td>
                       	 </tr>
                  </c:forEach>
                  </tbody>
                    </table>
                    
                    <%-- <div style="display: none;">
                    	<table class="table table-bordered table-hover" style="width:100%;" >
                    		<tbody style="text-align: center;">
                    			<tr id='editrange0'>
		                       	 	 <td style="width: 7%;display: none;"><label id="1rangeId"></label></td>
		                             <td style="width: 15%"><input type="text" id="1minpurchaseqty" class="form-control minPurQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" id="1minpurchaseamt" class="form-control minPurAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" id="1dealqty" class="form-control dealQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" id="1description" class="form-control dealDesc" ></td>
		                             <td style="width: 5%"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addeditSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeeditSlab('editrange0')"></td>
		                       	 </tr>
                    		</tbody>
                    	</table>
                    </div> --%>
                 </div>
                              <!--  for slabs table end -->       
                                   
                                 
                                       <!-- row 4 start --> 
                                <div class="row">
                                	
                               		<div class="col-md-3" >
                                	  	<label id="dealBannerLabel"><spring:message code="deal_banner.label" /></label>
                                	  	<br>
                                	  	<c:if test="${dealBean.bannerImg == true }">
		                        			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
		                       			<c:if test="${dealBean.bannerImg == false }">
		                        			<input type="checkbox" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
		                       		 <input type="hidden" id="dealBanner_name" />
                                	 <input type="hidden" id="dealBannerRefId" name="dealBanner" />
									<c:if test="${dealBean.deal_image == ''|| empty dealBean.deal_image}">
									<br>
                            		<div class="icon-remove blue delete" title="Deal Banner" id="dealBanner_image">
										<label class="myFile" id="dealBanner_label">
											<%-- <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 80px;" /> --%>
											<input type="file" id="dealBanner" name="dealBanner" onchange="loadImageFileAsURL('dealBanner',this);" />
										</label>
									</div>
									</c:if>
									<c:if test="${not empty dealBean.deal_image}">
										<div class="icon-remove blue delete" title="Deal Banner" id="dealBanner_image">
											<label class="myFile" id="dealBanner_label" style="display: none">
											<%-- <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 80px;" /> --%>
											<input type="file" id="dealBanner" name="dealBanner" onchange="loadImageFileAsURL('dealBanner',this);" />
											</label>
											<img class="thumbnail" id="dealBanner_thumbnail" src="${dealBean.deal_image}" style="width:80px;height:80px;"/>
											<%-- <img class="thumbnail" id="dealBanner_thumbnail" src="data:image/jpeg;base64,${dealbanner}" style="width:80px;height:80px;"/> --%>
											<img class="delImage" id="dealBanner_delImage" src="${pageContext.request.contextPath}/images/deny.png" onclick="deletePic('dealBanner');">
										</div>
									</c:if>
                                	  </div>
                                	 <div class="col-md-9">
                                	 <div class="row">
                                   <div class="form-group col-lg-3" style="padding: 0px;"> 
                                         <label><spring:message code="deal_status.label" /></label>
                                         <c:if test="${dealBean.dealStatus == 'ACTIVE'}">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="dealStatus" name="dealStatus" value=true checked>
                                                    <spring:message code="deal_enable.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="dealStatus" name="dealStatus" value=false>
                                                   <spring:message code="deal_disable.label"/>
                                                </label>
                                            </div>
                                           </c:if>
                                           <c:if test="${dealBean.dealStatus == 'INACTIVE'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" id="dealStatus" name="dealStatus" value=true >
                                                    <spring:message code="deal_enable.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="dealStatus" name="dealStatus" checked value=false >
                                                   <spring:message code="deal_disable.label"/>
                                                </label>
                                            </div>
                                           </c:if>
                                        </div>
                                        
                                                                          
                                    <div class="form-group col-md-3" style="padding: 0px;">
                                      <label><spring:message code="deal_loyalty_points_status.label" /></label>
                                      
                                      <c:if test="${dealBean.claimLoyaltypoints == 'true'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=true checked >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                           
                                      <c:if test="${dealBean.claimLoyaltypoints == 'false'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=true  >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=false checked>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                             
                                     </div>
                                     
                                      <div class="form-group col-md-3" style="padding: 0px;"> 
                                         <label><spring:message code="deal_giftvouchet_status.label" /></label>
                                          <c:if test="${dealBean.claimgiftvouchers == 'true'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="giftvouchers" value=true checked >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="giftvouchers" value=false >
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                            <c:if test="${dealBean.claimgiftvouchers == 'false'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="giftvouchers" value=true  >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="giftvouchers" value=false checked >
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                            </div>
                                   
                                   <div class="form-group col-md-3" style="padding: 0px;"> 
                                         <label><spring:message code="deal_claims_coupons.label" /></label>
                                          <c:if test="${dealBean.claimCoupons == 'true'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="coupons" value=true checked >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                           
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="coupons" value=false >
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                          <c:if test="${dealBean.claimCoupons == 'false'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="coupons" value=true  >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                           
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="coupons" value=false checked >
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                            </div>
                                   	</div>
                                	 </div>
                                	  
                                </div>
                                   
                                   
	                                   <div class="col-xs-12" id="data" style="display:none;">
                                          <table id="taxestable" class="table table-bordered table-hover">
                                            <thead style="background-color: #3c8dbc; color: #ffffff">
                                             <tr>
                                            	<th><spring:message code="taxname.label"/></th>
                                                <th><spring:message code="taxtype.label"/></th>
                                                <th style="width:40%;"><spring:message code="taxrate.label"/></th>
                                             </tr>
                                            </thead>
                                            <tbody style="text-align: center;">
                                        	 
                                            </tbody>
                                          </table>
                                       </div>
                                    <div class="row" style="margin-top: 10px;">
                                    	 <%-- <div class="form-group col-lg-12">
			                              	 <label><span style="font-weight: bold;font-size: 16px;color:#666;"><spring:message code="deal.visibility.label" /></span>( These options make the Deals are visible with B2C sites  so that online customer can exercise purchasing options. Please note that this is applicable only when our customer | use our CLOUD platform for their Online Business.) </label>
			                              	 <hr style="margin-top: 1px;margin-bottom: -5px;">
			                             </div> --%>
			                             
			                             <div class="form-group col-lg-12" >
                                         	 	<div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="deal.visibility.label" /></span></div>
							                    <div class="form-group col-lg-10" style="background-color: rgb(195,195,195);margin-bottom: 4px;">
							                    	<span>( These options make the Deals are visible with B2C sites  so that online customer can exercise purchasing options. Please note that this is applicable only when our customer | use our CLOUD platform for their Online Business.)</span>
							                    </div>
                                         </div>
                                         <div class="col-lg-12">
                                         	<hr style="margin-top: -15px;border-top: 1px solid rgb(181,230,29);">
                                         </div>
			                             
									   <%-- <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.tag.line.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div> --%>
                                      </div>
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.tag.line.label" /></label>
                                    	<textarea class="form-control"  name="dealImageText" id="dealImageText" rows="1" style="resize: none;" placeholder="<spring:message code="display.tag.line.label" />" >${dealBean.dealImageText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label>
                                    		<input type="hidden" id="dealImageTextFontHidden"  value="${dealBean.dealImageTextFont}">
                                    		<select class="form-control" id="dealImageTextFont">
                                    		</select>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control"  type="text" id="dealImageTextSize" value="${dealBean.dealImageSize}" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text"  id="dealImageTextColor" value="${dealBean.dealImageColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${dealBean.dealImageBold == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealImageBold != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealImageItalic == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealImageItalic != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealImageStrike == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealImageStrike != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
                                    	</div>
                                    </div>
                                   <%--  <div class="row">
									   <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.sale.text.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div> --%>
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.sale.text.label" /></label>
                                    	<textarea class="form-control"  name="saleText" id="saleText" rows="1" style="resize: none;" placeholder="<spring:message code="display.sale.text.label" />" >${dealBean.salePriceText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label>
                                    		<select class="form-control" id="saleTextFont">
                                    		</select>
                                    		<input type="hidden" id="saleTextFontHidden" value="${dealBean.salePriceFont}">
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control"  type="text" id="saleTextSize" value="${dealBean.salePriceSize}" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="saleTextColor"  value="${dealBean.salePriceColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${dealBean.salePriceBold == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.salePriceBold != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.salePriceItalic == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.salePriceItalic != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.salePriceStrike == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${dealBean.salePriceStrike != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
                                    	</div>
                                    </div>
                                   <%--  <div class="row">
									   <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.deal.text.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div> --%>
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.deal.text.label" /></label>
                                    	<textarea class="form-control"  name="dealText" id="dealText" rows="1" style="resize: none;" placeholder="<spring:message code="display.deal.text.label" />" >${dealBean.dealPriceText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label>
                                    		<select class="form-control" id="dealTextFont">
                                    		</select>
                                    		<input type="hidden" id="dealTextFontHidden" value="${dealBean.dealPriceFont}">
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control"  type="text" value="${dealBean.dealPriceSize}" id="dealTextSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="dealTextColor"  value="${dealBean.dealPriceColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${dealBean.dealPriceBold == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealPriceBold != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealPriceItalic == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealPriceItalic != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealPriceStrike == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${dealBean.dealPriceStrike != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
                                    	</div>
                                    </div>
                                     </div>   
                                    <div class="row" >
							               <div class="col-lg-12" style="text-align: center;margin-top: 25px;" >
							               <div style="font-weight: bold;font-size: 19px;color:#666;margin-bottom: -42px;">
							               <span style="background-color: white;">&nbsp;<spring:message code="authorisation.label" />&nbsp;</span>
							               </div>
							                 <div class="col-lg-2"></div>
							                <div class="form-group col-lg-10" style="margin-bottom: 4px;">
							               		<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px;" onclick="activateHeader('authorise');" id="authoriseImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
							                </div> 
							               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
							               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
							               </div>
							           </div>
							           <div class="authorise subBlock"> 
                                    
                                   <div class="row">
                                      <div class="form-group col-lg-3" style="text-align: center;">
                                      <br>
                                      		 <input type="button" id="" style="margin-right: 2%;padding: 3px 5px;" class="btn bg-olive btn-inline" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="authorise.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
                                           <%--  <label><spring:message code="authorised.by.label" /></label>
                                            <input type="text" class="form-control" name="autorisedBy" id="autorisedBy" value="" required placeholder="<spring:message code="enter.authorised.by.label" />" />
                                        	<span id="autorisedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
										</div>
                                        <div class="form-group col-lg-3" style="text-align: center;">
                                        <br>
                                        	<input type="button" id="" style="margin-right: 2%;padding: 3px 5px;" class="btn bg-olive btn-inline" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="close.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
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
                                            <input class="form-control" readonly="readonly" style="background: white;" value="${dealBean.closedOnStr}" name="closedOn" id="closedOn" size="20" type="text" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                         </div>
                                       
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="closed.reason.label" /></label>
                                            <input type="text"  class="form-control" name="closedReason" id="closedReason" value="${dealBean.closedReason}" required placeholder="<spring:message code="enter.authorised.by.label" />" />
                                        	<span id="closedReasonError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                        </div>  
                                        </div>             
						<div class="row"  style="text-align: right;">
						 	<input type="button" id="submit" class="btn bg-olive btn-inline" onclick="updateDeal()" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 2%;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
						</div>
						<%-- <span class="requiredField">${err}</span> --%>
				    </div><!-- /.box-body -->
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                  <input type="hidden" id="taxList" value='' />
                                    
                                </form>
                                <input type="hidden" name="taxes" id="taxes" />
                            </div>
				<input type="hidden" id="editSellProducts" value="${dealBean.sellProducts }">
				<input type="hidden" id="editSellSkus" value="${dealBean.sellSkuids }">
				<input type="hidden" id="editDealProducts" value="${dealBean.dealProducts }">
				<input type="hidden" id="editDealSkus" value="${dealBean.dealSkus }"> 
				<input type="hidden" id="editDealRanges" value="${dealBean.rangeList }.">
				<input type="hidden" id="deallocations" value="${dealBean.storeLocation }">
				<%-- <input type="hidden" id="subCategories" value='${subCategories}' /> 
				<input type="hidden" id="selectedSaleProductSubCategory" value='${dealBean.saleProductSubCategory}' />
				<input type="hidden" id="selectedDealProductSubCategory" value='${dealBean.dealProductSubCategory}' /> --%>
				
				
</div>
</div>
</section><!-- /.content -->
   <!-- InputMask -->
        <%-- <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#dealStartDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
                $("#dealEndDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
            });
            </script> --%>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#dealStartDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
                $("#dealEndDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
                $("#closedOn").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
            });
            </script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
      
   });
   $(".my-colorpicker2").colorpicker();
/*   $('#taxestable').dataTable({
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