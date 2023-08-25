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
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dealsAndOffers/offers.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontselect.css">
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/jquery.fontselect.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
	 <script src="${pageContext.request.contextPath}/js/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
	
	<script type="text/javascript">
 $(document).ready(function(){
	 $(this).scrollTop(0);
// 	 toggleBased('basedOnProduct');
	 //toggleItemSpecific('offercategory');
// 	 toggleRepeat('offerReward','edit');
// 	 toggleComboLowest('id');

	 //toggleRewardCriteria('offerRewardCriteria');
	 /* var offerStartDate = $("#offerStartDate").val();
	 var date = offerStartDate.split(' ');
	 date = date[0].split('-');
	 var formatedDate = date[0]+"/"+date[1]+"/"+date[2];
	 $('#offerStartDate').val(formatedDate);
	 var offerEndDate = $("#offerEndDate").val();
	 date = offerEndDate.split(' ');
	 date = date[0].split('-');
	 formatedDate = date[0]+"/"+date[1]+"/"+date[2];
	 $('#offerEndDate').val(formatedDate); */
	 callCalenderYYYYMMDD('offerStartDate');
	 callCalenderYYYYMMDD('offerEndDate');
	 /* var closedOn = $("#closedOn").val();
	date = closedOn.split(' ');
	date = date[0].split('-');
	formatedDate = date[0]+"/"+date[1]+"/"+date[2];
	$('#closedOn').val(formatedDate); */
	//var priceBased=$("#priceBasedConfigurationGroup").prop("checked");
	//var applylitems=$("#applyForAllItemsGroup").prop("checked");
	//toggleRewardCriteria('offerRewardCriteria');
	//toggleRewardCriteria('offerRewardCriteriaGroup');
/* 	var rewardValue=$("#offerRewardCriteria").val();
	if (rewardValue == "false") {
		//$("#minQtyProduct").attr("disabled", "disabled");
		$(".startPrice").attr("disabled","disabled");;
		$(".endPrice").attr("disabled","disabled");
		$(".minQtyProduct").removeAttr("disabled");
		$(".minAmtProduct").removeAttr("disabled");
	} else {
		$(".startPricePro").removeAttr("disabled");
		$(".endPricePro").removeAttr("disabled","disabled");
		$(".minQtyProduct").attr("disabled","disabled");
		$(".minAmtProduct").attr("disabled","disabled");
} */
	
/* 	if(priceBased==true && applylitems==true)
	{
	$(".minQty").attr("disabled","disabled");
	$(".minAmt").attr("disabled","disabled");
	$(".itemSearch").attr("disabled","disabled");
	$(".rewardQuantity").attr("disabled");
	$(".startPrice").removeAttr("disabled");
	$(".endPrice").removeAttr("disabled","disabled");
	$(".groupSearch").removeAttr("disabled");
	}
else if(priceBased==false && applylitems==true)
	{
	$(".minQty").attr("disabled","disabled");
	$(".minAmt").attr("disabled","disabled");
	$(".groupSearch").attr("disabled","disabled");
	$(".startPrice").removeAttr("disabled");
	$(".endPrice").removeAttr("disabled","disabled");
	$(".itemSearch").attr("disabled","disabled");
	}
else if(priceBased==true && applylitems==false)
	{
	$(".minQty").attr("disabled","disabled");
	$(".minAmt").attr("disabled","disabled");
	$(".itemSearch").attr("disabled","disabled");
	$(".rewardQuantity").attr("disabled","disabled");
	$(".startPrice").removeAttr("disabled");
	$(".endPrice").removeAttr("disabled","disabled");
	$(".groupSearch").removeAttr("disabled");
	}
else if(priceBased==false && applylitems==false)
	{
	$(".minQty").removeAttr("disabled");
	$(".minAmt").removeAttr("disabled");
	$(".itemSearch").removeAttr("disabled");
	$(".startPrice").attr("disabled","disabled");;
	$(".endPrice").attr("disabled","disabled");
	$(".groupSearch").removeAttr("disabled");
	}
	 */
	 callCalenderYYYYMMDD('closedOn');
	 var slectedLocations = $("#offerLocations").val().replace('[','').replace(']','').replace(/, /g,',');
	 	$("#offerLocation").val(slectedLocations.split(','));

	// $("#offerLocation").val($("#offerLocations").val().split(','));	 
	 prepareEditOfferData();
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
	 var expandValue = $("#expandValue").val();
	 var expandVisibilityValue = $("#expandVisibilityValue").val();
	 var expandAuthValue = $("#expandAuthValue").val();
	 if(expandValue == "dealConfiguration"){
	 activateHeader('dealConfiguration','')
	 $(".dealConfiguration").css("display","block");
	 }
	 else if(expandVisibilityValue == "offervisibility"){
		 $(".offervisibility").css("display","block");
		 activateHeader('offervisibility','')
    }
	 else  if(expandAuthValue == "authorise"){
		 $(".authorise").css("display","block");
		 activateHeader('authorise','');
     }
	  else
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
	 
	 /* var subCategories = $("#subCategories").val();
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
		$('#saleCategory').change(function () {
			 var category = $("#saleCategory").val();
			 subcategoryArray = parsedJson[category];
			 	var op = '';
				for(var i=0;i<subcategoryArray.length;i++){
					op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
				}
				$("#sale_sub_category").html(op);
		    }); */
		 var offerCat=$("#offercategory").val();   
		    if(offerCat=="category_turnover")
		    	{
		    		
		    	}
		    
		 setEditDealSlabDivContent();
		 setEditProductDealSlabDivContent();
		 checkForB2CLocation();
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
	white-space: nowrap;
}

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

.span222 {
	width: 9.5% !important;
}
.span22{
width: 16.0% !important;
}

 /* responsive ONLY */

 @media (max-width: 600px){ /* spans reduce to 100px then go full width */

    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
    .span222, .span22 {
	width: 100% !important;
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
<%--                                 <div class="box-header" style="text-align: center">
                                <br/>
                               <h3> ${offerBean.offerID} - <spring:message code="offer.details.label" /></h3>
                                </div> --%><!-- /.box-header -->
                                 
                                <!-- form start -->
                                <form method="POST">
                                    <div class="box-body">
                                     <div class="row" style="text-align: right; margin-top: 10px;">
                                 	 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                 	 	<div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                 	 	</div>
                                     <div class="row" style="text-align: right; margin-top: 10px;">
                                 	 	
                                 	 	 <c:if test="${offerBean.offerStatus == 'ACTIVE'}">
                                 	 	
                                 	 	
                                 	 	 <input type="button" id="submit" style="position: relative;" class="btnCls" onclick="promotionPrint('${offerBean.offerID}','descriptionPrint')" value="<spring:message code="print.label" />" />
                                 	 	
                                 	 	 </c:if>
                                 	 		
                                 	 	<input type="hidden" id="expandValue" value="${expandValue}"></input>
												
												<input type="hidden" id="expandVisibilityValue" value="${expandVisibilityValue}"></input>
									        	 	<input type="hidden" id="expandAuthValue" value="${expandAuthValue}"></input>
                                 	 	<input type="button" id="submit" style="position: relative;" class="btnCls" onclick="updateOffer('${offerBean.offerID}')" value="<spring:message code="submit.label" />" />
										<input type="button" class="btnCls" style="margin-left:1%;margin-right: 2%;position: relative;" onclick="viewdealsandoffers('offers','','0')" value="<spring:message code="cancel.label" />" />
						  				<!-- <hr style="margin-top: 4px;width: 99%;" /> -->
									</div>   
									
													 <div class="row" >
							               <div class="col-lg-12" style="text-align: center;margin-top: 25px;" >
							               <div style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;margin-bottom: -42px;" >
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
									           <div class="col-lg-12">
									        	 	<div class="form-group col-lg-4" style="padding-left:0px">
									        	 		<label><spring:message code="country.label" /></label>
									                	  <select onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control" >
															<option value="Select Country" >Select Country</option>
														  </select>
														  	<input type="hidden" id="selectedCountry" value="${offerBean.customerFilter.country}"></input>
									        	 	</div>
									        	 	<%-- <div class="form-group col-lg-6">
									        	 		<label><spring:message code="customer.type.label" /></label>
									                	  <select id="customerType" name ="customerType" class="form-control" >
									                	  	<option value="-- Select --" >-- Select --</option>
									                	  	<option value="PREMIUM" ${offerBean.customerFilter.customerType == "PREMIUM" ? 'selected' : ''}>PREMIUM</option>
									                	  	<option value="PLUS" ${offerBean.customerFilter.customerType == "PLUS" ? 'selected' : ''}>PLUS</option>
									                	  	<option value="BASIC" ${offerBean.customerFilter.customerType == "BASIC" ? 'selected' : ''}>BASIC</option>
									                	  	<option value="GENERIC" ${offerBean.customerFilter.customerType == "GENERIC" ? 'selected' : ''}>GENERIC</option>
															<option value="EMPLOYEE" ${offerBean.customerFilter.customerType == "EMPLOYEE" ? 'selected' : ''}>EMPLOYEE</option>
															<!-- <option >Select Country</option> -->
														  </select>
									        	 	</div> --%>
									        	 	
									        	 <div class="form-group col-lg-4">
									        	 		<label><spring:message code="age.label" /></label>
									                	  <select id="age" name ="age" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="1-12" ${offerBean.customerFilter.age == "1-12" ? 'selected' : ''}>1 to 12</option>
															<option value="13-19" ${offerBean.customerFilter.age == "13-19" ? 'selected' : ''}>13 to 19</option>
															<option value="20-30" ${offerBean.customerFilter.age == "20-30" ? 'selected' : ''}>20 to 30</option>
															<option value="31-40" ${offerBean.customerFilter.age == "31-40" ? 'selected' : ''}>31 to 40</option>
															<option value="41-50" ${offerBean.customerFilter.age == "41-50" ? 'selected' : ''}>41 to 50</option>
															<option value="51-60" ${offerBean.customerFilter.age == "51-60" ? 'selected' : ''}>51 to 60</option>
															<option value="61-100" ${offerBean.customerFilter.age == "61-100" ? 'selected' : ''}>61 and above</option>
														  </select>
									        	 	</div>	
									        	 	
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="gender.label" /></label>
									                	  <select id="gender" name ="gender" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Male" ${offerBean.customerFilter.gender == "Male" ? 'selected' : ''}>Male</option>
															<option value="Female" ${offerBean.customerFilter.gender == "Female" ? 'selected' : ''}>Female</option>
															<option value="Other" ${offerBean.customerFilter.gender == "Other" ? 'selected' : ''}>Other</option>
														  </select>
									        	 	</div>
									        	 	
									        	 </div>	
									        	
									             <div class="col-lg-12">
									        	 	<div class="form-group col-lg-4" style="padding-left:0px">
									        	 		 <label><spring:message code="region.label" /></label>
															 <select id ="states" class="form-control" >
															 	<option value="Select State" >Select State</option>
															</select>
															<input type="hidden" id="selectedState" value="${offerBean.customerFilter.region}"></input>
									        	 	</div>
									        	 	
									        	 	
									        	 		<div class="form-group col-lg-4">
									        	 		<label><spring:message code="marital.status.label" /></label>
									                	  <select id="otherDetails" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Married" ${offerBean.customerFilter.maritialStatus == "Married" ? 'selected' : ''}>Married</option>
															<option value="Unmarried" ${offerBean.customerFilter.maritialStatus == "Unmarried" ? 'selected' : ''}>Unmarried</option>
														  </select>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		  <label><spring:message code="children.label" /></label>
									                	  <select id="children" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="0" ${offerBean.customerFilter.children == "0" ? 'selected' : ''}>0</option>
															<option value="1" ${offerBean.customerFilter.children == "1" ? 'selected' : ''}>1</option>
															<option value="2" ${offerBean.customerFilter.children == "2" ? 'selected' : ''}>2</option>
															<option value="3" ${offerBean.customerFilter.children == "3" ? 'selected' : ''}>3</option>
															<option value="4" ${offerBean.customerFilter.children == "4" ? 'selected' : ''}>4</option>
															<option value="5 or Above" ${offerBean.customerFilter.children == "5 or Above" ? 'selected' : ''}>5 or Above</option>
														  </select>
									        	 	</div>
									        	 	
									        	 </div>
									        	 <div class="col-lg-12">
									        	 	<div class="form-group col-lg-4" style="padding-left:0px">
									        	 		 <label><spring:message code="city.label" /></label>
									        	 		 <input type="text" id="city" class="form-control" value="${offerBean.customerFilter.city}" />
															<!--  <select id ="city" class="form-control" >
																<option >Select State</option>
															</select> -->
									        	 	<span id="cityError" style="text-align:right;color:red;font-weight:bold;"></span>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="occupation.label" /></label>
									        	 		 <select id="occupation" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Business" ${offerBean.customerFilter.occupation == "Business" ? 'selected' : ''}>Business</option>
															<option value="Accountant" ${offerBean.customerFilter.occupation == "Accountant" ? 'selected' : ''}>Accountant</option>
															<option value="Software Professional" ${offerBean.customerFilter.occupation == "Software Professional" ? 'selected' : ''}>Software Professional</option>
															<option value="Engineer" ${offerBean.customerFilter.occupation == "Engineer" ? 'selected' : ''}>Engineer</option>
															<option value="Professor" ${offerBean.customerFilter.occupation == "Professor" ? 'selected' : ''}>Professor</option>
															<option value="Bureaucrat" ${offerBean.customerFilter.occupation == "Bureaucrat" ? 'selected' : ''}>Bureaucrat</option>
															<option value="Financial Professional" ${offerBean.customerFilter.occupation == "Financial Professional" ? 'selected' : ''}>Financial Professional</option>
															<option value="Doctor" ${offerBean.customerFilter.occupation == "Doctor" ? 'selected' : ''}>Doctor</option>
															<option value="Others" ${offerBean.customerFilter.occupation == "Others" ? 'selected' : ''}>Others</option>
									        	 		 </select>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="customer.type.label" /></label>
									                	  <select id="customerType" name ="customerType" class="form-control" >
									                	  	<option value="-- Select --" >-- Select --</option>
									                	  	<option value="SILVER" ${offerBean.customerFilter.customerType == "SILVER" ? 'selected' : ''}>SILVER</option>
									                	 	<option value="GOLD" ${offerBean.customerFilter.customerType == "GOLD" ? 'selected' : ''}>GOLD</option>
									                	  	<option value="PLATINUM" ${offerBean.customerFilter.customerType == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
									                	  	<option value="PREMIUM" ${offerBean.customerFilter.customerType == "PREMIUM" ? 'selected' : ''}>PREMIUM</option>
									                	  	<option value="PLUS" ${offerBean.customerFilter.customerType == "PLUS" ? 'selected' : ''}>PLUS</option>
									                	  	<option value="BASIC" ${offerBean.customerFilter.customerType == "BASIC" ? 'selected' : ''}>BASIC</option>
									                	  	<option value="NORMAL" ${offerBean.customerFilter.customerType == "NORMAL" ? 'selected' : ''}>NORMAL</option>
									                	  	<option value="GENERIC" ${offerBean.customerFilter.customerType == "GENERIC" ? 'selected' : ''}>GENERIC</option>
															<option value="EMPLOYEE PREMIUM" ${offerBean.customerFilter.customerType == "EMPLOYEE PREMIUM" ? 'selected' : ''}>EMPLOYEE PREMIUM</option>
															<option value="EMPLOYEE GENERIC" ${offerBean.customerFilter.customerType == "EMPLOYEE GENERIC" ? 'selected' : ''}>EMPLOYEE GENERIC</option>
															 <option value="MEMBERSHIP SILVER" ${offerBean.customerFilter.customerType == "MEMBERSHIP SILVER" ? 'selected' : ''}>MEMBERSHIP SILVER</option>
							                                 <option value="MEMBERSHIP PLATINUM" ${offerBean.customerFilter.customerType == "MEMBERSHIP PLATINUM" ? 'selected' : ''}>MEMBERSHIP PLATINUM</option>
							                                 <option value="MEMBERSHIP GOLD" ${offerBean.customerFilter.customerType == "MEMBERSHIP GOLD" ? 'selected' : ''}>MEMBERSHIP GOLD</option>
															
															  <c:forEach var="groupid" items="${groupids}">
													       	<option value="${groupid}" ${offerBean.customerFilter.customerType == groupid ? 'selected' : ''}>${groupid}</option>
												         	</c:forEach>
												         	
															<!-- <option >Select Country</option> -->
														  </select>
									        	 	</div>
									        	 	<%-- <div class="form-group col-lg-6">
									        	 		<label><spring:message code="gender.label" /></label>
									                	  <select id="gender" name ="gender" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Male" ${offerBean.customerFilter.gender == "Male" ? 'selected' : ''}>Male</option>
															<option value="Female" ${offerBean.customerFilter.gender == "Female" ? 'selected' : ''}>Female</option>
															<option value="Other" ${offerBean.customerFilter.gender == "Other" ? 'selected' : ''}>Other</option>
														  </select>
									        	 	</div> --%>
									        	 </div>
									        	 
									        	  <div class="col-lg-12">
									        	 	<div class="form-group col-lg-4" style="padding-left:0px">
									        	 		 <label><spring:message code="sales.zone.label" /></label>
									        	 		 <select type="text" id="salesZone" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	 <c:forEach var="zone" items="${zones}">
																<option value="${zone}" ${offerBean.customerFilter.salesZone == zone ? 'selected' : ''}>${zone}</option>
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
									        	 		 	<option value="Lower Income"  ${offerBean.customerFilter.incomeGroup == "Lower Income" ? 'selected' : ''}>Lower Income</option>
															<option value="Middle Income" ${offerBean.customerFilter.incomeGroup == "Middle Income" ? 'selected' : ''}>Middle Income</option>
															<option value="High Net worth Individual" ${offerBean.customerFilter.incomeGroup == "High Net worth Individual" ? 'selected' : ''}>High Net worth Individual</option>
															<option value="Ultra-Rich" ${offerBean.customerFilter.incomeGroup == "Ultra-Rich" ? 'selected' : ''}>Ultra-Rich</option>
									        	 		 </select>
									        	 	</div>
									        	 	
									        	 </div>
									        	<%--  
									        	  <div class="row">
									        	 	<div class="form-group col-lg-6">
									        	 		  <label><spring:message code="children.label" /></label>
									                	  <select id="children" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="0" ${offerBean.customerFilter.children == "0" ? 'selected' : ''}>0</option>
															<option value="1" ${offerBean.customerFilter.children == "1" ? 'selected' : ''}>1</option>
															<option value="2" ${offerBean.customerFilter.children == "2" ? 'selected' : ''}>2</option>
															<option value="3" ${offerBean.customerFilter.children == "3" ? 'selected' : ''}>3</option>
															<option value="4" ${offerBean.customerFilter.children == "4" ? 'selected' : ''}>4</option>
															<option value="5 or Above" ${offerBean.customerFilter.children == "5 or Above" ? 'selected' : ''}>5 or Above</option>
														  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="occupation.label" /></label>
									        	 		 <select id="occupation" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Business" ${offerBean.customerFilter.occupation == "Business" ? 'selected' : ''}>Business</option>
															<option value="Accountant" ${offerBean.customerFilter.occupation == "Accountant" ? 'selected' : ''}>Accountant</option>
															<option value="Software Professional" ${offerBean.customerFilter.occupation == "Software Professional" ? 'selected' : ''}>Software Professional</option>
															<option value="Engineer" ${offerBean.customerFilter.occupation == "Engineer" ? 'selected' : ''}>Engineer</option>
															<option value="Professor" ${offerBean.customerFilter.occupation == "Professor" ? 'selected' : ''}>Professor</option>
															<option value="Bureaucrat" ${offerBean.customerFilter.occupation == "Bureaucrat" ? 'selected' : ''}>Bureaucrat</option>
															<option value="Financial Professional" ${offerBean.customerFilter.occupation == "Financial Professional" ? 'selected' : ''}>Financial Professional</option>
															<option value="Doctor" ${offerBean.customerFilter.occupation == "Doctor" ? 'selected' : ''}>Doctor</option>
															<option value="Others" ${offerBean.customerFilter.occupation == "Others" ? 'selected' : ''}>Others</option>
									        	 		 </select>
									        	 	</div>
									        	 </div> --%>
									        	  <%-- <div class="row">
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="income.group.label" /></label>
									        	 		 <select id="incomeGroup" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Lower Income"  ${offerBean.customerFilter.incomeGroup == "Lower Income" ? 'selected' : ''}>Lower Income</option>
															<option value="Middle Income" ${offerBean.customerFilter.incomeGroup == "Middle Income" ? 'selected' : ''}>Middle Income</option>
															<option value="High Net worth Individual" ${offerBean.customerFilter.incomeGroup == "High Net worth Individual" ? 'selected' : ''}>High Net worth Individual</option>
															<option value="Ultra-Rich" ${offerBean.customerFilter.incomeGroup == "Ultra-Rich" ? 'selected' : ''}>Ultra-Rich</option>
									        	 		 </select>
									        	 	</div>
									        	</div>  --%>
									        	 
									           </div>
									           
									           <input type="hidden" id="createdDate" value="${offerBean.createdOnStr}">
									           
											   <div class="col-lg-6" >
											   <div class="row">
										           <div class="col-lg-12">
										           	<div class="form-group col-lg-4">
									        	 		<label id="fromDateLabel"><spring:message code="deal_start_date.label" /></label>
									                	<input class="form-control calendar_icon" readonly="readonly" value="${offerBean.customerFilter.start_date}" style="background-color: white;" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
									        	 	<div class="form-group col-lg-2"></div>
									        	 	<div class="form-group col-lg-6">
									        	 		 <label><spring:message code="customer.turnover.label" /></label>
									        	 		 <div class="row">
							        						<div class="col-lg-6" style="padding-right: 5px;">
									                            <input type="text" class="form-control" id="startPrice"  value="${offerBean.customerFilter.startPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
							        						</div>
							        						<div class="col-lg-6" style="padding-left: 5px;">
									                            <input type="text" class="form-control" id="endPrice"  value="${offerBean.customerFilter.endPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
							        						</div>
							        					</div>
									        	 	</div>
									        	 	</div>
									        	 	<%-- <div class="form-group col-lg-6">
									        	 		<label><spring:message code="purchase.channel.label" /></label>
									                	  <select id="purchaseChannel" class="form-control" >
									                	  	 <option value="-- Select --" >-- Select --</option>
									                	  	 <option value="Direct Shopping" ${offerBean.customerFilter.purchaseChannel == "Direct Shopping" ? 'selected' : ''}>Direct Shopping</option>
									                	  	 <option value="Telephone" ${offerBean.customerFilter.purchaseChannel == "Telephone" ? 'selected' : ''}>Telephone</option>
									                	  	 <option value="Online" ${offerBean.customerFilter.purchaseChannel == "Online" ? 'selected' : ''}>Online</option>
									                	  	  <option value="Mobile" ${offerBean.customerFilter.purchaseChannel == "Mobile" ? 'selected' : ''}>Mobile</option>
									                	  	 <option value="Sales Personnel" ${offerBean.customerFilter.purchaseChannel == "Sales Personnel" ? 'selected' : ''}>Sales Personnel</option>
														  </select>
									        	 	</div> --%>
									        	 </div>
									             <div class="row">
									              <div class="col-lg-12">
									             	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="offer_end_date.label" /></label>
									                	<input class="form-control calendar_icon" readonly="readonly" value="${offerBean.customerFilter.end_date}" style="background-color: white;" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
									        	       <span id="endDateErr" style="text-align:right;color:red;font-weight:bold;"></span>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-2"></div>
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="purchase.channel.label" /></label>
									                	  <select id="purchaseChannel" class="form-control" >
									                	  	 <option value="-- Select --" >-- Select --</option>
									                	  	 <option value="Direct Shopping" ${offerBean.customerFilter.purchaseChannel == "Direct Shopping" ? 'selected' : ''}>Direct Shopping</option>
									                	  	 <option value="Telephone" ${offerBean.customerFilter.purchaseChannel == "Telephone" ? 'selected' : ''}>Telephone</option>
									                	  	 <option value="Online" ${offerBean.customerFilter.purchaseChannel == "Online" ? 'selected' : ''}>Online</option>
									                	  	  <option value="Mobile" ${offerBean.customerFilter.purchaseChannel == "Mobile" ? 'selected' : ''}>Mobile</option>
									                	  	 <option value="Sales Personnel" ${offerBean.customerFilter.purchaseChannel == "Sales Personnel" ? 'selected' : ''}>Sales Personnel</option>
														  </select>
									        	 	</div> 
									        	 	
									        	 	<%-- <div class="form-group col-lg-6">
									        	 		<label><spring:message code="product.category.label" /></label>
									                	  <select id="productCategory" onchange="emptyProduct();" name ="productCategory" class="form-control" >
									                	  	<option value="" >-- Select --</option>
									                	  	 <c:forEach var="category" items="${categories}">
									                	  	 	<option value="${category.categoryName}" ${category.categoryName == offerBean.customerFilter.productCategory ? 'selected' : ''}>${category.categoryDescription}</option>
																<option value="${category}" ${offerBean.customerFilter.productCategory == category ? 'selected' : ''}>${category}</option>
															 </c:forEach>
														  </select>
									        	 	</div> --%>
									        	 </div>
									        	 </div>
									        	 
									        	 	<%--  <div class="row">
									        	 <div class="form-group col-lg-12">
									        	 	<div class="form-group col-lg-6">
									        	 		 <label><spring:message code="customer.turnover.label" /></label>
									        	 		 <div class="row">
							        						<div class="col-lg-6" style="padding-right: 5px;">
									                            <input type="text" class="form-control" id="startPrice"  value="${offerBean.customerFilter.startPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
							        						</div>
							        						<div class="col-lg-6" style="padding-left: 5px;">
									                            <input type="text" class="form-control" id="endPrice"  value="${offerBean.customerFilter.endPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
							        						</div>
							        					</div>
									        	 	</div>
									        	<div class="form-group col-lg-6">
									        	 		 <label><spring:message code="product.label" /></label>
									        	 		 <input type="text"  class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="searchProduct" value="${offerBean.customerFilter.product}" placeholder="<spring:message code="search.product.label" />" />
															<div class="services">
												    			<div class="items">
												     				<ul class="matchedStringUl searchProduct" style=""></ul>
												   				</div>
															</div>
															<input type="hidden" id="product" value="${offerBean.customerFilter.product}" >
															 <!-- <select id ="product" class="form-control" >
																<option value="-- Select --" >-- Select --</option>
															</select> -->
									        	 	</div>
 									        	 </div> 
									        	 </div>--%>
									        	 <div class="row">
									        	  <div class="col-lg-12">
									        	 <div class="form-group col-lg-4">
										        	 <label><spring:message code="customer.rating.label" /></label>
								                	  <select id="customerRating" class="form-control" >
														<option value="-- Select --" >-- Select --</option>
														<option value="1" ${offerBean.customerFilter.rating == "1" ? 'selected' : ''}>1</option>
														<option value="2" ${offerBean.customerFilter.rating == "2" ? 'selected' : ''}>2</option>
														<option value="3" ${offerBean.customerFilter.rating == "3" ? 'selected' : ''}>3</option>
														<option value="4" ${offerBean.customerFilter.rating == "4" ? 'selected' : ''}>4</option>
														<option value="5" ${offerBean.customerFilter.rating == "5" ? 'selected' : ''}>5</option>
													  </select>
									        	 </div>
									        	 <div class="form-group col-lg-2"></div>
									        	 <div class="form-group col-lg-3">
									        	 		 <label><spring:message code="referrals.label" /></label>
									        	 		 <select id="referrals" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="1" ${offerBean.customerFilter.referrals == "1" ? 'selected' : ''}>1</option>
															<option value="2" ${offerBean.customerFilter.referrals == "2" ? 'selected' : ''}>2</option>
															<option value="3" ${offerBean.customerFilter.referrals == "3" ? 'selected' : ''}>3</option>
															<option value="4" ${offerBean.customerFilter.referrals == "4" ? 'selected' : ''}>4</option>
															<option value="5" ${offerBean.customerFilter.referrals == "5" ? 'selected' : ''}>5</option>
															<option value="6" ${offerBean.customerFilter.referrals == "6" ? 'selected' : ''}>6</option>
															<option value="7" ${offerBean.customerFilter.referrals == "7" ? 'selected' : ''}>7</option>
															<option value="8" ${offerBean.customerFilter.referrals == "8" ? 'selected' : ''}>8</option>
															<option value="9" ${offerBean.customerFilter.referrals == "9" ? 'selected' : ''}>9</option>
															<option value="10" ${offerBean.customerFilter.referrals == "10" ? 'selected' : ''}>10</option>
									        	 		 </select>
									        	 	</div>
									        	 </div>  
									        	 </div>
									        	 
									        	 
									        	 
									        	 <%-- 
									        	         	  <div class="row">
                       <div class="col-lg-6" style="">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId')" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == offerBean.customerFilter.department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                       <div class="col-lg-6" style="">
                            <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value="${offerBean.customerFilter.department}">${offerBean.customerFilter.subDepartment}</option>
	                          
	                        </select>
                      </div>
                      </div>  --%>
                      
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
											<div class="col-lg-4" style="  margin-top: 22px">
											 <input id="skuMasterFile" class="form-control" style="background-color: white;  border: 0px;"  disabled="disabled" style="padding-left:12px">
											</div>
                      
									        	 <%-- <div class="row" style="font-size: 15px;">
									        	 	<div class="form-group col-lg-6" style="margin-top: 5px;">
									        	 		<br>
									        	 		<c:if test="${offerBean.customerFilter.applyRoolsEngine == true}">
									             			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
									        	 		</c:if>
									        	 		<c:if test="${offerBean.customerFilter.applyRoolsEngine != true}">
									        	 			<input type="checkbox" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
									        	 		</c:if>
									        	 	</div>
							             		</div>    --%>              
										       </div>
									         </div>
							           </div>
							           </div>
							           
                                  <div class="row" >
						               <div class="col-lg-12" style="text-align: center;margin-top: 25px;" >
						               <div style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;margin-bottom: -42px;" >
						               <span style="background-color: white;">&nbsp;<spring:message code="offers.configuration.label" />&nbsp;</span>
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
								<div class="row-fluid-5">
									<!--  <div class="span8"> -->
									 	<!-- <div class="row"> -->
									    <div class="form-group span22">
                                            <label><spring:message code="offer_name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="offerName" id="offerName" placeholder="<spring:message code="offer_name_enter.label" />"  value="${offerBean.offerName}" />
                                            <span id="offerNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <br>
                                            <label><spring:message code="deal_start_date.label" /> <span class="requiredField">*</span></label>
                                             <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" name="offerStartDate" readonly="readonly" style="background: white;" id="offerStartDate" size="20" type="text" onfocus="callCalenderYYYYMMDD('offerStartDate')" value="${offerBean.offerStartDate}" onclick="callCalenderYYYYMMDD('offerStartDate')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                          <span id="offerStartDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group span22">
									    <label><spring:message code="offer_category.label" />  <span class="requiredField">*</span></label>
                                          <select class="form-control" name="offerCategory" onchange="toggleItemSpecific('offercategory');" id="offercategory">
                                           <!--  <option value="turnoverdeal">Turn Over(Bill Amount) Deal</option> -->
                                           <option value="item_specific" ${offerBean.offerCategory == "item_specific" ? 'selected' : ''}>Item Specific Offer</option>
                                            <option value="turn_over" ${offerBean.offerCategory == "turn_over" ? 'selected' : ''}>Total Bill(Turn Over) Offer</option>
                                            <option value="group_turn_over" ${offerBean.offerCategory == "group_turn_over" ? 'selected' : ''}>Group (Turn Over) Offer</option>
                                          <option value="category_turnover" ${offerBean.offerCategory == "category_turnover" ? 'selected' : ''}>Category Turnover</option>
                                          </select>
                                            <br>
                                             <label><spring:message code="deal_end_date.label" /> <span class="requiredField">*</span></label>
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" name="dealenddate" id="offerEndDate" readonly="readonly" style="background: white;" size="20" type="text" onfocus="callCalenderYYYYMMDD('offerEndDate')" value="${offerBean.offerEndDate}" onclick="callCalenderYYYYMMDD('offerEndDate')" placeholder="YYYY/MM/DD"/>
                                            <!-- <input type="text" name="offerEndDate" id="offerEndDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                        </div><!-- /.input group -->
                                          <span id="offerEndDateError" style="text-align:right;color:red;font-weight:bold;"></span>
									  </div>
									  
									  <div class="form-group span22">
                                              <label><spring:message code="offer_prioroty.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="offerPriority" id="offerPriority">
	                                          	<option value="exclusive" ${offerBean.priority == "exclusive" ? 'selected' : ''}>Exclusive</option>
	                                            <option value="normal" ${offerBean.priority == "normal" ? 'selected' : ''}>Normal</option>
                                            </select>
                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
                                          <br>
                                          <div class="col-lg-12" style="padding: 0px;">
										<div class="col-lg-6" style="padding: 0px;padding-right: 5px;">
                                          <div class="bootstrap-timepicker">
                                            <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" value="${offerBean.offerStartTime}" name="startTime" id="startTime"/>
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
                                               <input type="text" name="endTime"  value="${offerBean.offerEndTime}" class="form-control timepicker" id="endTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                          <span id="endTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        
                                        
                                        
                                        </div>
                                        <div class="form-group span222">
										<label>Max Price</label> 
										<textarea class="form-control" name="maxPrice" id="maxPrice"
											rows="1" style="resize: none;"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Item Price">${offerBean.maxPrice}</textarea>
										<br>
										<label>Min Price</label> 
										<textarea class="form-control" name="minPrice" id="minPrice"
											rows="1" style="resize: none;"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Item Price">${offerBean.minPrice}</textarea>
									</div>
                                        
                                        <div class="form-group span22">
                                        <div class="col-lg-6" style="padding-left:0px;">
                                        <label id="noOfClaimsLabel">Total Bills</label>
                                        <textarea class="form-control" name="noOfClaims" id="noOfClaims"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Total Bills">${offerBean.customerFilter.noOfClaims }</textarea>
                                         
                                        </div>
                                        <div class="col-lg-6" style="padding:0px;">
                                        <label>Bills/Day</label>
										<textarea class="form-control" name="billsPerDay" id="billsPerDay"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Bills/Day">${offerBean.numberBillsPerDay}</textarea>
                                        </div>
                                        	
										 <br>
                                          <div class="col-lg-12" style="padding:0px;margin-top: 20px;">
											 <label><spring:message code="offer_description.label" /></label>
                                            <textarea style="resize:none;" class="form-control" name="offerDescription" id="offerDesc" rows="1" placeholder="<spring:message code="offer_desc_enter.label" />">${offerBean.offerDescription }</textarea>
                                             <span id="offerDescError"
											style="text-align: right; color: red; font-weight: bold;"></span>
                                        </div>
                                        </div>
                                    <!--  </div> -->
									  <div class="form-group span22">
                                   	  	   <label><spring:message code="location.label" /></label>
		                                    <select class="form-control" name="location" id="offerLocation" onchange="return checkForB2CLocation();" style="height: 91px;" multiple="multiple">
		                                     <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 	</select>
										  <input type="hidden" id="offerLocations" value="${offerLocations}">
                                   	  </div>
                                   	  </div>           
						          
						          
						          
						          <div class="row" style=" padding-left: 15px;padding-right:10px">
								<div class="form-group col-lg-12"
												style=" border: 1px solid #ccc;height:35px">
											<div class="col-lg-2" style="white-space: nowrap;padding: 7px;background: #c1c1c1; margin-left: -14px;"><label style="font-weight:bold">Offer Days</label></div>	
									<div class="col-md-8" style="   margin-top: 6px;    margin-left: 45px;">
						           <div class="row">
                                      	<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      		<c:if test="${offerBean.day1 == true }">
                                      			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
                                      		</c:if>
                                      		<c:if test="${offerBean.day1 == false }">
                                      			<input type="checkbox" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
                                      		</c:if>
                                      	</div>
                                      	<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                   			<c:if test="${offerBean.day2 == true }">
                                    			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />
                                    		</c:if>
                                    		<c:if test="${offerBean.day2 == false }">
                                    			<input type="checkbox" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />
                                    		</c:if>
                                      	</div>
                                   		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                   			<c:if test="${offerBean.day3 == true }">
                                      			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
                                      		</c:if>
                                      		<c:if test="${offerBean.day3 == false }">
                                      			<input type="checkbox" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
                                      		</c:if>  
                                   		</div>
                                   		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                   			<c:if test="${offerBean.day4 == true }">
                                      			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
                                      		</c:if>
                                      		<c:if test="${offerBean.day4 == false }">
                                      			<input type="checkbox" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
                                      		</c:if> 
                                   		</div>
										
										 
                                      		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      			<c:if test="${offerBean.day5 == true }">
	                                      			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp; <spring:message code="thursday.label" />
	                                      		</c:if>
	                                      		<c:if test="${offerBean.day5 == false }">
	                                      			<input type="checkbox" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp;&nbsp; <spring:message code="thursday.label" />
	                                      		</c:if>  
                                      		</div>
                                      		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      			<c:if test="${offerBean.day6 == true }">
	                                      			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
	                                      		</c:if>
	                                      		<c:if test="${offerBean.day6 == false }">
	                                      			<input type="checkbox" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
	                                      		</c:if>  
                                      		</div>
                                      		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      			<c:if test="${offerBean.day7 == true }">
	                                      			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
	                                      		</c:if>
	                                      		<c:if test="${offerBean.day7 == false }">
	                                      			<input type="checkbox" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
	                                      		</c:if>  
                                      		</div>
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
												<c:if test="${offerBean.allowExchanges == true }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" checked
													style="vertical-align: -2px" id="applyExchanges" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
												</c:if>
												
												<c:if test="${offerBean.allowExchanges == false }">
												<input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyExchanges" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
												</c:if>
												
											</div>
										
										
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${offerBean.allowReturns == true }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" checked
													style="vertical-align: -2px" id="applyReturns" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
												</c:if>
												<c:if test="${offerBean.allowReturns == false }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" 
													style="vertical-align: -2px" id="applyReturns" />&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
												</c:if>
											</div>
											
													
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${offerBean.salePriceBased == true }">
												<input type="checkbox"
													 checked
													style="vertical-align: -2px" id="applysaleprice" />&nbsp;&nbsp;&nbsp;
												Sale price based
												</c:if>
												<c:if test="${offerBean.salePriceBased == false }">
												<input type="checkbox"
													
													style="vertical-align: -2px" id="applysaleprice" />&nbsp;&nbsp;&nbsp;
												Sale price based
												</c:if>
											</div>
											
											
											
											
											
									</div>
								</div>
								</div>
								
								
								<br>
						     <div class="row">
						   		<div class="form-group col-lg-12" >
                                      	 	<div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;cursor: pointer;margin-bottom: 0px;"  ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="offer.products.label" /> </span></div>
				                    <div class="form-group col-lg-10" style="background-color: rgb(195,195,195);margin-bottom: 4px;">
				                    	<span>( Please select the appropriate SKUs to configure the offer. Sale SKU means that specific product that is under offer category.)
				                    	</span>
				                    </div>
                                   </div>
                                 <!-- <div class="col-lg-12">
                                 	<hr style="margin-top: -15px;border-top: 1px solid rgb(181,230,29);">
                                 </div> -->
                              </div>    
                            <div style="border: 1px solid rgb(181,230,29); margin: -15px -5px; padding:5px;" id="itemSpecificDeals" >
						   <div class="row">
							   <div class="form-group col-lg-12" >
							    <c:choose>
							    <c:when test="${offerBean.productSpecificFlag==true}">
									   		
									 <input type="radio" checked="checked" onchange="toggleBased('basedOnProduct')" name="configureBasedItems" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                               </c:when> 
                                      		<%-- <c:if test="${empty offerBean.sellGroupId && offerBean.applyForAllItems == false}"> --%>
                                      		<c:otherwise>
                                    <input type="radio" name="configureBasedItems"  onchange="toggleBased('basedOnProduct')"  style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                      		</c:otherwise>
                                 </c:choose>
                                         	 <hr style="margin-top: 1px;margin-bottom: 0px;margin-left: 5px;">
                                         </div>
                            </div> 
                            
                            
                            
                            
                            
                            
                            <div class="row">
										<div class="form-group col-lg-12">
											<div class="form-group col-lg-3"
												style="margin-left: 4px;margin-top: -25px; padding-right: 58px; margin-right: -18px;border-left: 1px solid lightgray;margin-bottom: 0px;height: 410px;">

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
																<option value="${category.categoryName}"${category.categoryName == offerBean.productCategory ? 'selected' : ''}>${category.categoryName}</option>
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
															 <c:forEach var="subCategoryDetailsList" items="${saleSubCategoryList}">
								                             	<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == offerBean.productSubCategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
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
														<select class="form-control basedOnProduct saleGroups"
															style="background: white;" name="department" 
															id="sale_department" onchange="appendingbardTotable('sale_department')">
															<option value="">-- Select --</option>
															<c:forEach var="departmentList" items="${departmentList}">
																<option value="${departmentList.primaryDepartment}"
																	${departmentList.primaryDepartment == offerBean.productDepartment ? 'selected' : ''}
																	id="${departmentList.primaryDepartment}">${departmentList.primaryDepartment}</option>
															</c:forEach>
														</select>
													</div>

													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<label><spring:message code="section.label" /></label> <select
															class="form-control basedOnProduct saleGroups"
															style="background: white;" name="section"
															id="sale_section" >
															<!-- <option value="">-- Select --</option> -->
                                                         <%--  <c:forEach var="sectionDetailsList" items=""> --%>
																<option value="${offerBean.productSection}">${offerBean.productSection}</option>
															<%-- </c:forEach> --%>
														</select>
													</div>
												</div>
												<br>
												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message code="brand.label" /></label> <select
															class="form-control basedOnProduct saleGroups"
															style="background: white;" name="brand" id="sale_brand" onchange="appendingbardTotable()">
															<option value="">-- Select --</option>
															<c:forEach var="brandsList" items="${brandsList}">
																<option value="${brandsList}" ${brandsList == offerBean.brand ? 'selected' : ''}  >${brandsList}</option>
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

                                             <div class="form-group col-lg-12" style="margin-top: 50px;margin-left: -35px;">
							   					<input type="radio" style="vertical-align: -2px;pointer-events: none;" name="configureBasedItems"/>
												<spring:message code="applyforAllitems.label" />
                                         	 <hr style="margin-top: 1px; border:none;">
                                         </div>


                                                 </div>






                                       <div class="form-group col-lg-9"
												style="margin-top: 0px; border-left: 1px solid #ccc;padding-right: 0px;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;">
														<c:choose>
														<c:when test="${offerBean.productSpecificFlag == true && offerBean.offerProducts[0].exclusionItem==false}">
													<input type="radio" 
														onchange="toggleItemComplexBased('itemDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px" checked id="itemDisountBased">&nbsp;
													<spring:message code="itemwise.discounts.label" />
													</c:when>
														<c:otherwise>
														
														<input type="radio" 
														onchange="toggleItemComplexBased('itemDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px"  id="itemDisountBased">&nbsp;
													<spring:message code="itemwise.discounts.label" />
														
														</c:otherwise>
														</c:choose>
														<!-- <span id="ErrorNoRecords" class="Error offersellskusError"
													style="text-align: center; color: red; font-weight: bold;margin-left: 20px;"></span> -->
                                                  
                                                  <div class="errorMsgLogdiv">
													<span id="ErrorNoRecords" class="Error offersellskusError"
													style="text-align: center; color: red; font-weight: bold;margin-left: 20px;"></span>
													<a onclick="downloadLogs();" style="color:blue;display: none;text-decoration: underline;cursor: pointer;" id="loglink">&nbsp;Click Here for Log!</a>
													<input type="hidden" id="urlfordoc" value=""/>
													</div>
													
                                                  </div>


                                        <div class="col-lg-12" style="margin-left: 20px;">
													<div class="col-lg-5" style="margin-left: -15px; margin-right: -3px;">
													<input type="text"
														class="form-control searchItems basedOnProduct saleGroups searchBar"
														id="offersellskus"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; border-radius: 7px !important" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellskus"
																style=""></ul>
														</div>
														</div>
													</div>
													
													<div class="col-lg-3" style="padding-left:0px;padding-right: 3px;">
														<input type="file" class="btn bg-olive btn-inline"
															accept=".xlsx" id="fileUploadCSV"
															onchange="addNameToTextBox('fileUploadCSV')"
															style="padding: 3px 0px; width: 100%; margin-top: 0px;margin-left:-5px;" />
													</div>
												<div class="col-lg-1" style="padding: 0px;">
						    					<input type="button"  class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelDataForOffers(this)" style="padding: 4px 13px; margin-left:-3px;" />
												</div>
												<div class="col-lg-1"></div>
												
												<div class="col-lg-1" style="padding: 0px;">
						    					<input type="button"  class="btn bg-olive btn-inline" value="Delete All" id="btnDeleteall"  onclick="deleteSkuProduct();" style="padding: 4px 7px; margin-left: 11px;" />
												</div>
													
												 <div class=" col-lg-1" style="margin-left: 18px;padding-right: 1px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 15px;     float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
													</div> 
													<div
														style=" margin-bottom: 5px; margin-top: 10px">
														<table id="offerSaleSkusProduct"
															class="table table-bordered table-hover"
															style="margin-top: 5px; margin-bottom: 5px;
															     overflow: auto; display:inline-table;">
   
    
															
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr>
																	<th><spring:message code="sno.label" /></th>
																	<th><spring:message code="skuid.label" /></th>
																	<th><spring:message code="description.label" /></th>
																	<th><spring:message code="ean.label" /></th> 
																	<th><spring:message code="size.label" /></th>
																	<th>MRP</th>
																	<th>Sale Qty</th>
																	<th><spring:message code="discount.type.label" /></th>
																	<th>Offer Qty</th>
																	<th><spring:message code="item.amount.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															<tbody style="text-align: center;"id="offerSkusProduct">
						<c:if test="${offerBean.productSpecificFlag == true}">
						<c:forEach var="offerProducts" items="${offerBean.offerProducts}" varStatus="theCount">
                            <c:if test="${offerProducts.exclusionItem == false}">  
                           <tr id="dynamicdiv${theCount.count}">
                        
                       		<td class="slno" id="itemno" style="width: 10%">${theCount.count}</td>
                       		<input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       		<!-- <input type='hidden' id='pluCode"+len+"' value='offerProducts.pluCode+"'/> -->
				 	        <input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       	  <input type='hidden' class="buyPluCode" id="pluCode${theCount.count}" value="${offerProducts.plucode}"/>
                       	  <input type='hidden' id="category${theCount.count}" value="${offerProducts.category}"/>
				 		  <input type='hidden' id="subCategory${theCount.count}" value="${offerProducts.subCategory}"/>
				 		  <input type='hidden' id="department${theCount.count}" value="${offerProducts.department}"/>
						  <input type='hidden' id="brandCode${theCount.count}" value="${offerProducts.model}"/>
                       		 <td  id="itemCode${theCount.count}" style="width: 10%">${offerProducts.skuId }</td>
                             <td  id="itemDesc${theCount.count}" style="width: 15%">${offerProducts.itemDesc }</td>
                             <td id="ean${theCount.count}" style="width: 15%">${offerProducts.ean} </td>
                              <td id="size${theCount.count}" style="width: 12%">${offerProducts.size}</td>
                               <td id="mrp${theCount.count}" style="width: 12%"></td>
                             <td><input id="minQty${theCount.count}" style='width: 95%;' type='text' class='minQty' value="${offerProducts.minPurchaseQty}" ></td>
                              
                             <td  ><select style='height: 27px;width:128px' onchange='changeRewardQty(this);' name="dealStatus${theCount.count}" id="dealStatus${theCount.count}">
							<option value="fixed_rate"${'fixed_rate' == offerProducts.discountType ? 'selected' : ''}>Fixed Rate</option>
							<option value="flat_rate"${'flat_rate' == offerProducts.discountType ? 'selected' : ''}>Cash Flat</option>
							<option value="percentage"${'percentage' == offerProducts.discountType ? 'selected' : ''}>Cash Discount</option>
							<option value='qty_specific_cash_discount'${'qty_specific_cash_discount' == offerProducts.discountType ? 'selected' : ''}>Qty Specific Cash Discount</option>
							<option value="loyaltypoints"${'loyaltypoints' == offerProducts.discountType ? 'selected' : ''}>Loyalty Points</option>
							<option value="giftvouchers"${'giftvouchers' == offerProducts.discountType ? 'selected' : ''}>Gift Vouchers</option>
							<option value="quantity"${'quantity' == offerProducts.discountType ? 'selected' : ''}>Quantity</option>
							</select></td>
							<td><input id="rewardQtyProduct${theCount.count}" style='width: 95%;' type='text' class='rewardQtyProduct' value="${offerProducts.rewardQty}" ></td>
                              <td><input id="amount${theCount.count}" style='width: 90%;' type='text' class='amount' value="${offerProducts.rewardValue }" ></td>
                             <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:50%;cursor:pointer;' onclick='deleteItem(this);' /></td>
                            
                       	   </tr>
                       	   </c:if>
                         </c:forEach>
							</c:if>								</tbody>
														</table>
													</div>
												</div>
												
												
												
												
												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 4px;">
													
													<c:choose>
													<c:when test="${offerBean.productSpecificFlag == true && offerBean.offerProducts[0].exclusionItem==true}">
													<input type="radio"  
														onchange="toggleItemComplexBased('complexDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px;margin-top: 43px;" checked id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													
													</c:when>
													<c:otherwise>
													<%-- <input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px;margin-top: 43px;"  id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" /> --%>
													<c:choose>
													<c:when test="${offerBean.productSpecificFlag == true && empty offerBean.offerProducts}">
													<input type="radio"  
														onchange="toggleItemComplexBased('complexDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px;margin-top: 43px;" checked id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													
													</c:when>
													<c:otherwise>
													<input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px;margin-top: 43px;"  id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:otherwise>
													</c:choose>
													
													
													</c:otherwise>
													</c:choose>
													<%-- <c:if test="${offerBean.productSpecificFlag == true}">
													<input type="radio"  
														onchange="toggleItemComplexBased('complexDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px;margin-top: 43px;" checked id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:if>
													<c:if test="${offerBean.productSpecificFlag == false && empty offerBean.offerProducts}">
													<input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')" name="basedOnproductCheck"
														style="vertical-align: -2px;margin-top: 43px;"  id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:if> --%>
													
												</div>

												<div class="row">
													<div class="col-lg-12" style="margin-left: 20px">
													<div class="form-group col-lg-2"  style="width:20%;margin-bottom: 5px;">
															<label><spring:message
																	code="offer_reward_type.label" /> <span
																class="requiredField">*</span></label> <select
																class="form-control" name="offerReward" id="offerRewardProduct"
																onchange="toggleRepeat('offerReward')">
																 <option value="fixed_rate"  ${offerBean.rewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                                                 <option value="flat_rate"  ${offerBean.rewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                                                 <option value="percentage"  ${offerBean.rewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                                                 <option value="loyaltypoints"  ${offerBean.rewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                                                 <option value="discountcoupon"  ${offerBean.rewardType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
                                                                 <option value="giftvouchers"  ${offerBean.rewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                                                 <option value="gift_coupon"  ${offerBean.rewardType == "gift_coupon" ? 'selected' : ''}>Gift Coupons</option>
															</select><span id="dealNameErr"
																style="text-align: right; color: red; font-weight: bold;"></span>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														</div>
														
														
														<div class="form-group col-lg-2"  style="width:20%;padding-left:0px;margin-bottom: 5px;">
															<label><spring:message
																	code="rewardCriteria.label" /></label> <select
																class="form-control" name="offerReward" id="offerRewardCriteria"
																onclick="toggleRewardCriteria('offerRewardCriteria')">
																<c:if test="${offerBean.offerCategory == 'item_specific' }">
																<option value="false"${'false' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>Quantity Based</option>
																</c:if>
																<c:if test="${offerBean.offerCategory == 'turn_over'}">
																<option value="true"${'true' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>Cart TurnOver</option>
																</c:if>
																<c:if test="${offerBean.offerCategory == 'group_turn_over'}">
																<option value="false"${'false' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>Quantity Based</option>
																</c:if>
																<c:if test="${offerBean.offerCategory == 'category_turnover'}">
																<option value="category_turnover" ${ offerBean.itemSpecificTurnover == false  ? 'selected' : ''}>Category TurnOver</option>
																<option value="item_price_range" ${ offerBean.itemSpecificTurnover == true  ? 'selected' : ''}>Item Price Range</option>
																</c:if>
															</select>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														</div>
														
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px;padding-left: 1px;   width: 25%;white-space:nowrap;margin-bottom: 5px;">
															<br> 
															<c:if test="${offerBean.allowMultipleDiscounts == true }">
															<input type="checkbox" checked="checked"
																style="vertical-align: -2px" id="allownMulDiscProduct" /><spring:message code="allow.multiple.discount.label" />
																</c:if>
															
														<c:if test="${offerBean.allowMultipleDiscounts == false }">
															<input type="checkbox" 
																style="vertical-align: -2px" id="allownMulDiscProduct" /><spring:message code="allow.multiple.discount.label" />
																</c:if>
														</div>
														
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; margin-left: -45px; padding-right: 0px;white-space:nowrap;margin-bottom: 5px;">
															<br>
															<c:if test="${offerBean.repeat == true }"> 
															<input type="checkbox" checked="checked"
																style="vertical-align: -2px" id="isRepeatProduct" />
															<spring:message code="is.repeat.label" />
															</c:if>
															<c:if test="${offerBean.repeat == false }"> 
															<input type="checkbox" 
																style="vertical-align: -2px" id="isRepeatProduct" />
															<spring:message code="is.repeat.label" />
															</c:if>
														</div>
													<%-- 	<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-right: 0px;margin-left: -34px;white-space:nowrap">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('isComboProduct')" disabled="disabled"
																style="vertical-align: -2px" id="isComboProduct" />
															<spring:message code="is.combo.label" />
														</div> --%>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-left: 1px; padding-right: 0px;white-space:nowrap;margin-bottom: 5px;">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('lowestPriceItemProduct')" disabled="disabled"
																style="vertical-align: -2px" id="lowestPriceItemProduct" />
															<spring:message code="lowest.price.item.label" />
														</div>
										
										<%-- 		<div class="form-group col-lg-2" style="margin-top: 5px; width: 16%;white-space:nowrap;margin-left:-6px">
												<br> 
												
												<c:choose>
												<c:when test="${offerBean.priceBasedConfigurationFlag == true && offerBean.productSpecificFlag == true}">
												
												<input type="checkbox" 
													onchange="toggleComboLowestProduct('priceBasedConfigurationProduct')"
													style="vertical-align: -2px" checked id="priceBasedConfigurationProduct" />
													<spring:message code="pricebased.label" />
												</c:when>
												
												<c:otherwise>
												<input type="checkbox" 
													onchange="toggleComboLowestProduct('priceBasedConfigurationProduct')"
													style="vertical-align: -2px" id="priceBasedConfigurationProduct" />
													<spring:message code="pricebased.label" />
												
												</c:otherwise>
												
												</c:choose>
												
						
											</div>
 --%>													</div>
													
													<div class="row" style="font-size: 15px;margin-left: 34px">
											
											
										</div>
													
												</div>

												<div id="row">
													<div class="table-responsive"
														style="overflow: auto;white-space: nowrap;margin-left: 30px;">
														<table id="slabLis"
															class="table table-bordered table-hover"
															style="width: 100%;">
															<thead style="background-color: #3c8dbc; color: #ffffff">
																<tr id="slabTr">
																	<th style="width: 10%"><spring:message
																			code="categoryDepartmentBrand.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="minQty.label" /></th>
																	<th style="width: 15%"><spring:message
																			code="minAmt.label" /></th>
																	
																	<th style="width: 12%"><spring:message
																			code="offer_reward_value.label" /></th>
																	
																	<th style="width: 12%">Start Value</th>
								   								   <th style="width: 12%">End Value</th>		
																	<th style="width: 7%"><spring:message
															code="action.label" /></th>		

																</tr>
															</thead>
															<tbody style="text-align: center;">
														
					                                    	<%-- <tr id="productrange0" style="display: none;">
                                                                 <td style="display: none;"><span id="0rangenameProduct">range2</span></td>
																	<td style="width: 10%"><input type="text" style="width: 100px;"
																		class="form-control itemSearch"
																		oninput="getItemIds(this);" 
																		onkeydown="keyDownMethod(event.keyCode,this);"
																		id="0itemId" style="width: 100px;    margin-left: -8px; "
																		placeholder="<spring:message code="enter.item.id.label" />" />
																		<div class="services">
																			<div class="items">
																				<ul class="matchedStringUl 0itemId"
																					style="width: 138px;"></ul>
																			</div>
																		</div> <input type="hidden" id="selected0itemIdProduct"> <input
																		type="hidden" id="pluCode0itemIdProduct"></td>
																		
																		<td></td>
																	<td style="width: 12%"><input
																		class="form-control minQty" type="text"
																		id="0minquantityProduct"
																	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control"
																		type="text" id="0minamountProduct" 
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<!-- <td><select class="form-control"
																		name="offerReward" id="0productrangeRewardType">
																			<option value="ALL">ALL</option>
																			<option value="fixed_rate">Fixed Rate</option>
																			<option value="flat_rate">Cash Flat</option>
																			<option value="percentage">Cash Discount</option>
																			<option value="loyaltypoints">Loyalty Points</option>
																			<option value="giftvouchers">Gift Vouchers</option>
																	</select></td> -->
																	<td style="width: 12%"><input class="form-control"
																		type="text" id="0rewardvalueProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<!-- <td style="width: 12%"><input
																		class="form-control rewardQuantity" type="text"
																		id="0rewardQuantityProduct" value="0"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td> -->

                                                                      
                                                                      <td style="width: 12%"><input
																		class="form-control startPricePro" type="text"
																		id="0startPriceProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control endPricePro" 
																		type="text" id="0endPriceProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                                                     <td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																onclick="addEditProductOfferSlab()"> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;"
																onclick="deleteProductSlab($(this).closest('tr').attr('id'))">
														</div></td>

																</tr>  --%>
																
						<c:choose>
						
						<c:when test="${offerBean.productSpecificFlag == true && offerBean.offerProducts[0].exclusionItem==true}" >
						 <c:if test="${offerBean.offerCategory!='category_turnover'}">
						<c:forEach var="dealranges" items="${offerBean.offerRangesList}" varStatus="textid">
                       	 <tr id='productrange${textid.count}'>
                       	 	<td style="display: none;"><label id="${textid.count}rangenameProduct">${dealranges.range}</label></td>
                       	 	<td>${offerBean.productCategory}/${offerBean.productDepartment}/${offerBean.brand} </td>
                       			<%-- <td style="width: 10%">
                       			<input type="text" style="width: 100px;    margin-left: -8px;"  value="${dealranges.itemId}" class="form-control itemSearch" oninput="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}itemId" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}itemId" style="width: 138px;"></ul>
						   				</div>
									</div>
									
									<input type="hidden" id="selected${textid.count}itemId" value="${dealranges.itemId }" >
									<input type="hidden" id="pluCode${textid.count}itemIdProduct" value="${dealranges.pluCode }" >
                       			</td> --%>
                     
                       			
                       			<%-- <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'promotion'}">
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseQuantityString }" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamountString }" id="editrange${textid.count}minamount" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                       			</c:if>
                       			<c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'promotion'}">
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseQuantityString }" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamountString }" id="editrange${textid.count}minamount" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                       			</c:if> --%>
                       		
                             		 <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseQuantityString}" id="${textid.count}minquantityProduct" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                         
		                             <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseamountString}" id="${textid.count}minamountProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	
<%--                           <td> 
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<select class="form-control" disabled="disabled" name="offerReward" id="${textid.count}productrangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <select class="form-control" name="offerReward" id="${textid.count}productrangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'condition'}">
                             		<select class="form-control" disabled="disabled" name="offerReward" id="${textid.count}productrangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:when>
                             	<c:otherwise>
                             		<select class="form-control" name="offerReward" id="${textid.count}productrangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:otherwise>
                             </c:choose>
                                                         </td>  --%>
                        
                                <td><input type="text"  value = "${dealranges.rewardValueString}" id="${textid.count}rewardvalueProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                        
                            <%--  <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true }">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		<td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose> --%>
                             
                             <td style="width: 15%;"><input type="text" value="${dealranges.startPrice}"  id="${textid.count}startPriceProduct"  class="form-control" ></td>
                          
                             <td style="width: 15%;"><input type="text"  value="${dealranges.endPrice}"  id="${textid.count}endPriceProduct" class="form-control" ></td>
                            
                             <td style="width: 8%;"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditProductOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="deleteProductSlab($(this).closest('tr').attr('id'))"></div></td>
                       	 </tr>
                       </c:forEach>
                       </c:if>
                       
                       <c:if test="${offerBean.offerCategory=='category_turnover'}">
                       <c:forEach var="dealranges" items="${offerBean.offerRangesList}" varStatus="textid">
                       	 <tr id='productrange${textid.count}'>
                       	 	<td style="display: none;"><label id="${textid.count}rangenameProduct">${dealranges.range}</label></td>
                       	 	<td>${offerBean.productCategory}/${offerBean.productDepartment}/${offerBean.brand} </td>
                            <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseQuantityString}" disabled="disabled" id="${textid.count}minquantityProduct" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>                
		                    <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseamountString}" disabled="disabled" id="${textid.count}minamountProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>

                             <td><input type="text"  value = "${dealranges.rewardValueString}" id="${textid.count}rewardvalueProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 15%"><input type="text" value="${dealranges.startPrice}"  id="${textid.count}startPriceProduct" class="form-control" ></td>
                          
                             <td style="width: 15%"><input type="text"  value="${dealranges.endPrice}"  id="${textid.count}endPriceProduct" class="form-control" ></td>
                            
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditProductOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="deleteProductSlab($(this).closest('tr').attr('id'))"></div></td>
                       	 </tr>
                       </c:forEach>
						</c:if>
						</c:when>
						
						<c:otherwise>
						 	<c:choose>
						
						<c:when test="${offerBean.productSpecificFlag == true && empty offerBean.offerProducts}" >
						 <c:if test="${offerBean.offerCategory!='category_turnover'}">
						<c:forEach var="dealranges" items="${offerBean.offerRangesList}" varStatus="textid">
                       	 <tr id='productrange${textid.count}'>
                       	 	<td style="display: none;"><label id="${textid.count}rangenameProduct">${dealranges.range}</label></td>
                       	 	<td>${offerBean.productCategory}/${offerBean.productDepartment}/${offerBean.brand} </td>
                       			
                             		 <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseQuantityString}" id="${textid.count}minquantityProduct" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                         
		                             <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseamountString}" id="${textid.count}minamountProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	

                        
                                <td><input type="text"  value = "${dealranges.rewardValueString}" id="${textid.count}rewardvalueProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                        
                             <td style="width: 15%"><input type="text" value="${dealranges.startPrice}"  id="${textid.count}startPriceProduct"  class="form-control" ></td>
                          
                             <td style="width: 15%"><input type="text"  value="${dealranges.endPrice}"  id="${textid.count}endPriceProduct" class="form-control" ></td>
                            
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditProductOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="deleteProductSlab($(this).closest('tr').attr('id'))"></div></td>
                       	 </tr>
                       </c:forEach>
                       </c:if>
                       
                       <c:if test="${offerBean.offerCategory=='category_turnover'}">
                       <c:forEach var="dealranges" items="${offerBean.offerRangesList}" varStatus="textid">
                       	 <tr id='productrange${textid.count}'>
                       	 	<td style="display: none;"><label id="${textid.count}rangenameProduct">${dealranges.range}</label></td>
                       	 	<td>${offerBean.productCategory}/${offerBean.productDepartment}/${offerBean.brand} </td>
                            <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseQuantityString}" disabled="disabled" id="${textid.count}minquantityProduct" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>                
		                    <td style="width: 15%"><input type="text"  value = "${dealranges.minimumPurchaseamountString}" disabled="disabled" id="${textid.count}minamountProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>

                             <td><input type="text"  value = "${dealranges.rewardValueString}" id="${textid.count}rewardvalueProduct" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 15%"><input type="text" value="${dealranges.startPrice}"  id="${textid.count}startPriceProduct" class="form-control" ></td>
                          
                             <td style="width: 15%"><input type="text"  value="${dealranges.endPrice}"  id="${textid.count}endPriceProduct" class="form-control" ></td>
                            
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditProductOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="deleteProductSlab($(this).closest('tr').attr('id'))"></div></td>
                       	 </tr>
                       </c:forEach>
						</c:if>
						</c:when>
						
						<c:otherwise>
						 	<tr id="productrange0" style="">
                                                                 <td style="display: none;"><span id="0rangenameProduct">range2</span></td>
																	<%-- <td style="width: 10%"><input type="text" style="width: 100px;"
																		class="form-control itemSearch"
																		oninput="getItemIds(this);" 
																		onkeydown="keyDownMethod(event.keyCode,this);"
																		id="0itemId" style="width: 100px;    margin-left: -8px; "
																		placeholder="<spring:message code="enter.item.id.label" />" />
																		<div class="services">
																			<div class="items">
																				<ul class="matchedStringUl 1itemId"
																					style="width: 138px;"></ul>
																			</div>
																		</div> <input type="hidden" id="selected0itemId"> <input
																		type="hidden" id="pluCode0itemIdProduct"></td> --%>
																		<td></td>
																	<td style="width: 12%"><input
																		class="form-control minQty" type="text"
																		id="0minquantityProduct"
																	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control"
																		type="text" id="0minamountProduct" 
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<!-- <td><select class="form-control"
																		name="offerReward" id="0rangeRewardType">
																			<option value="ALL">ALL</option>
																			<option value="fixed_rate">Fixed Rate</option>
																			<option value="flat_rate">Cash Flat</option>
																			<option value="percentage">Cash Discount</option>
																			<option value="loyaltypoints">Loyalty Points</option>
																			<option value="giftvouchers">Gift Vouchers</option>
																	</select></td> -->
																	<td style="width: 12%"><input class="form-control"
																		type="text" id="0rewardvalueProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<!-- <td style="width: 12%"><input
																		class="form-control rewardQuantity" type="text"
																		id="0rewardQuantityProduct" value="0"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
 -->
                                                                      
                                                                      <td style="width: 12%"><input
																		class="form-control startPricePro" type="text"
																		id="0startPriceProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	<td style="width: 12%"><input class="form-control endPricePro" 
																		type="text" id="0endPriceProduct"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                                                     <td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																onclick="addEditProductOfferSlab()"> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;"
																onclick="deleteProductSlab($(this).closest('tr').attr('id'))">
														</div></td>

																</tr>
						</c:otherwise>
						
						</c:choose>		
						</c:otherwise>
						
						</c:choose>										
															
												
																
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
													
													
									<%-- 		<div class="col-lg-1" style="margin-left: 18px;padding-right: 1px;">
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
															<c:if test="${offerBean.productSpecificFlag == true}">
				<c:forEach var="offerProducts" items="${offerBean.offerProducts}" varStatus="theCount">
                        <c:if test="${offerProducts.exclusionItem == true}">  
                           <tr id="dynamicdiv${theCount.count}">
                        
                       		<td class="slno" id="itemno" style="width: 10%">${theCount.count}</td>
                       		<input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       		<!-- <input type='hidden' id='pluCode"+len+"' value='offerProducts.pluCode+"'/> -->
				 	        <input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       	  <input type='hidden' class="buyPluCode" id="pluCode${theCount.count}" value="${offerProducts.plucode}"/>
                       	  <input type='hidden' id="category${theCount.count}" value="${offerProducts.category}"/>
				 		  <input type='hidden' id="subCategory${theCount.count}" value="${offerProducts.subCategory}"/>
				 		  <input type='hidden' id="department${theCount.count}" value="${offerProducts.department}"/>
						  <input type='hidden' id="brandCode${theCount.count}" value="${offerProducts.model}"/>
                       		 <td  id="itemCode${theCount.count}" style="width: 10%">${offerProducts.skuId }</td>
                             <td  id="itemDesc${theCount.count}" style="width: 15%">${offerProducts.itemDesc }</td>
                             <td id="ean${theCount.count}" style="width: 15%">${offerProducts.ean} </td>
                             <td id="measureRange${theCount.count}" style="width: 15%">null </td>
                              <td id="size${theCount.count}" style="width: 12%">${offerProducts.size}</td>
                              <td id="color${theCount.count}" style="width: 12%">null</td>
                             
							 <td><input readonly id="amount${theCount.count}" style='width: 90%;' type='text' class='amount' value="${offerProducts.rewardValue }" ></td>
                             <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:50%;cursor:pointer;' onclick='deleteItem(this);' /></td>
                            
                       	   </tr>
                       	   </c:if>
                         </c:forEach>
							</c:if>	
															
															</tbody>
														</table>
													
												</div>
												
												
												
												
												
												
											</div>
										</div>
									</div>
									
						<div class="row">
							   <div class="form-group col-lg-12" style="margin-top: -30px;">
							   <%--< input type="radio" style="vertical-align: -2px;pointer-events: none;" name="configureBasedItems"/>
												<spring:message code="applyforAllitems.label" /> --%>
							   <%-- <c:choose>
								<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == true}">
								<input type="radio" onchange="toggleComboLowestProduct('applyForAllItemsProduct')" checked
													style="vertical-align: -2px" id="applyForAllItemsProduct" name="configureBasedItems"/>
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
									<input type="radio" onchange="toggleComboLowestProduct('applyForAllItemsProduct')"
													style="vertical-align: -2px" id="applyForAllItemsProduct" name="configureBasedItems"/>
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												
												</c:choose> --%>
                                         	 <hr style="margin-top: 1px; border:none;">
                                         </div>
                            </div> 			

                            
                            
                         <%--    
                            
                            <div class="row">
									<div class="form-group col-lg-3" style="margin-top: -25px;">
					        	 		 <label><spring:message code="sale_product_category.label" /></label>
                                            <select class="form-control basedOnProduct saleGroups" style="background: white;" name="category" id="saleCategory">
                                            <option value="-- Select --" >-- Select --</option>
                                           		 <c:forEach var="category" items="${categories}">
                                           		 <option value="${category.categoryName}" ${category.categoryName == offerBean.productCategory ? 'selected' : ''}>${category.categoryDescription}</option>
												<option value="${category}" ${category == offerBean.productCategory ? 'selected' : ''}>${category}</option>
											</c:forEach>
                                            </select>
                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
									</div>	
									 <div class="form-group col-lg-3" style="margin-top: -25px;">
                                           <label><spring:message code="sale_product_sub_category.label" /></label>
                                           <select class="form-control basedOnProduct saleGroups" style="background: white;" name="sub_category" id="sale_sub_category">
                                           		<option value="-- Select --" >-- Select --</option>
                                           		<c:forEach var="subCategory" items="${saleSubCategoryList}">
	                                              <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == offerBean.productSubCategory ? 'selected' : ''}>${subCategory.subcategoryDescription}</option>
												</c:forEach>
                                           </select>
                                        </div>	
                                        
                                	<div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="product_id.label" />  <span class="requiredField">*</span></label>
									      <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="editproductList" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl editproductList" style=""></ul>
								   				</div>
											</div>
                                            <span id="dealSaleProducts" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <div style="overflow-x : auto;margin-bottom: 15px;">
                                            <table id="editsaleProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="product_id.label"/></th>
                                               <th><spring:message code="action.label"/></th>
                                               
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                </tbody>
                                                <c:forEach var="sellProducts" items="${sellProducts}" varStatus="count">
                                        	 <tr class='${count.count}offerSellProduct'>
                                        	 		<td>${sellProducts}</td>
                                              <td><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeOfferEditSellingProduct('${count.count}offerSellProduct','${sellProducts}')"></td>
                                        	 </tr>
                                        	 </c:forEach>
                                          </table>
                                          </div>
									  </div>
                                    
                                     <div class="form-group col-lg-3" style="margin-top: -25px;">
							     <label><spring:message code="buy_sku_id.label" /></label>
							        <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="editbuySkuList" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl editOfferBuySkuList" style="width: 230px;"></ul>
						   				</div>
									</div>
									<div style="overflow-x : auto;margin-bottom: 15px;">
                                         <table id="editsaleSkuids" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                          <tr>
                                          	<th><spring:message code="skuid.label"/></th>
                                          	<th><spring:message code="plucode.label"/></th>
                                              <th><spring:message code="action.label"/></th>
                                              </tr>
                                              </thead>
                                              <tbody style="text-align: center;">
                                              	 <tr style="text-align: center;">
                                                 <c:forEach var="sellSkus" items="${sellskus}" varStatus="theCount">
                                        	 		<td>${sellSkus}</td>
                                        	 		<c:if test="${theCount.count % 2 == 0 }">
			                                        	 </tr>
			                                        	 <tr>
                                        	 		</c:if>
                                               	</c:forEach>
                                               	<c:set var="sellSkuCount" value="1" /> 
	                                        	<c:set var="sku" />
                                                <c:forEach var="sellSkus" items="${sellskus}" varStatus="theCount">
                                                	<c:if test="${theCount.count % 2 != 0 }">
                                                		 <tr class='${sellSkuCount}offerSellSkus'>
                                        	 			<th  style="font-weight: normal;">${sellSkus}</th>
                                        	 			<c:set var="sku" value="${sellSkus}" />
                                        	 		</c:if>
                                        	 		<c:if test="${theCount.count % 2 == 0 }">
                                        	 			<th  style="font-weight: normal;">${sellSkus}<input type="hidden" class="buyPluCode" value="${sellSkus}"></th>
			                                               <th style="text-align: center;"><img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="removeOfferEditSellingSkus('${sellSkuCount}offerSellSkus','${sku}')"></th>
			                                        	 </tr>
                                        	 			 <c:set var="sellSkuCount" value="${sellSkuCount + 1}" />
                                        	 		</c:if>
                                        	 </c:forEach>
                                              </tbody>
                                        </table>
                                        </div>
							  </div>
							  </div> --%>
							  <div class="row">
			   						<div class="form-group col-lg-12" >
			   						<c:choose>
									   		<c:when test="${offerBean.productSpecificFlag == false}">
									   			<input type="radio" checked="checked" name="configureBasedItems" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                      		</c:when>
                                      		<c:otherwise>
                                      			<input type="radio" onchange="toggleBased('basedOnGroup')" name="configureBasedItems" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                      	</c:otherwise>
                                      		 </c:choose>
                                         	 <hr style="margin-top: 1px;margin-bottom: 0px;margin-left: 5px;">
                                         	
                                         </div>
                                </div>       
						    <div class="row">
						    <div class="form-group col-lg-12">
									  	<div class="form-group col-lg-3" style="margin-top: -25px;border-left: 1px solid lightgrey;margin-left: 4px;width: 23%;margin-bottom: 0px;height: 315px;padding-left: 5px;">
									  	<div class="form-group col-lg-12" style="margin-top: 25px;">
									     <label><spring:message code="sale_group_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroup" placeholder="<spring:message code="enter.group.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroup" style="width: 230px;"></ul>
								   				</div>
											</div>
									      <div style="overflow-x : auto;margin-top: -8px;margin-bottom: 11px;">
                                           <table id="saleGroupProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th style="width:100px;"><spring:message code="sale_group_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                                <tbody style="text-align: center;">
                                                	<c:if test="${not empty offerBean.sellGroupId}">
		                                                <tr id="dynamicdivsaleGroup" style='margin-top:5px;'>
		                                        	 		<td id="saleGroupId" >${offerBean.sellGroupId}</td>
		                                        	 		<td id="DelsaleGroup" ><img id="ImgsaleGroup" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20px;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/>
		                                        	 	</tr>
                                        		 	</c:if>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  
									  
									<div class="form-group col-lg-12" style="">
									     <label><spring:message code="buy_sku_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroupSkuSearch" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroupSkuOffer" style="width: 230px;"></ul>
								   				</div>
											</div>
											<div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupSkuOffer" class="table table-bordered table-hover" style="margin-top: 3px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            <%-- 	<th><spring:message code="plucode.label"/></th> --%>
                                                <th><spring:message code="action.label"/></th>
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                <c:set var="saleGroupSkuCount" value="1" /> 
                                                
                                                
                                                <c:forTokens items="${offerBean.sellSkuids}" delims="," var="sellSkus" varStatus="theCount">
                                                 <%-- <c:forEach var="sellSkus" items="${offerBean.sellSkuids}" varStatus="theCount"> --%>
                                                	<%--  <c:if test="${theCount.count % 2 != 0 }"> --%>
                                                 	 	 <tr id="dynamicdivsaleGroupSku${saleGroupSkuCount}" >
                                        	 			<td id="skusaleGroupSku${saleGroupSkuCount}">${sellSkus}</td>
                                        	 			<td id="DelsaleGroupSku${saleGroupSkuCount}" style="text-align: center;"><img id="ImgsaleGroupSku${saleGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
                                        	 		<%-- </c:if> --%>
                                        	 		<%-- <c:if test="${theCount.count % 2 == 0 }">
                                        	 			<td id="pluCodesaleGroupSku${saleGroupSkuCount}">${sellSkus}</td>
                                        	 			<input type="hidden" class="saleGroupSkuPluCode" value="${sellSkus}">
                                        	 			<td id="DelsaleGroupSku${saleGroupSkuCount}" style="text-align: center;"><img id="ImgsaleGroupSku${saleGroupSkuCount}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="cursor:pointer;" onclick="deleteItem(this);" ></td>
			                                        	 </tr>
			                                        	 <c:set var="saleGroupSkuCount" value="${saleGroupSkuCount + 1}" />
                                        	 		</c:if> --%>
                                               	<%-- </c:forEach> --%>
                                               	</c:forTokens>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  
									  
								<div class="form-group col-lg-12" style="margin-top: 50px;margin-left: -25px;">
			   							<input type="radio" style="vertical-align: -2px;pointer-events: none;" name="configureBasedItems" />
											<spring:message code="applyforAllitems.label" />
                                         	 <hr style="margin-top: 1px;border:none;">
                                         	
                                   </div>
											
										
									  
								</div> 
								
								
								
								
								<div class="form-group col-lg-9"
												style="margin-top: 0px; border-left: 1px solid #ccc;padding-right: 0px;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;">
													<c:choose>
													<c:when test="${offerBean.productSpecificFlag == false && not empty offerBean.offerProducts}">
													<input type="radio"  checked
														onchange="toggleItemComplexBased('itemDisountBasedGroup')" name="basedOngroupCheck" 	style="vertical-align: -2px" id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.discounts.label" />
													</c:when>
													<c:otherwise>
													<input type="radio" 
													 onchange="toggleItemComplexBased('itemDisountBasedGroup')" name="basedOngroupCheck"
														style="vertical-align: -2px" id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.discounts.label" />
													</c:otherwise>
													</c:choose>
										<span id="" class="Error offersellskusgroupError" style="text-align: center; color: red; font-weight: bold;margin-left: 20px;"></span>
																
													</div>
													
													
													
													<div class="form-group col-lg-12" style="margin-left: 15px;">
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
																	<th><spring:message code="discount.type.label" /></th>
																	<th><spring:message code="minQty.label" /></th>
																	<th><spring:message code="item.amount.label" /></th>
                                                                    <th><spring:message code="action.label"/></th>
																</tr>
															</thead>
															<tbody style="text-align: center;">
															
															<c:if test="${offerBean.productSpecificFlag == false}">
															
															<c:forEach var="offerProducts" items="${offerBean.offerProducts}" varStatus="theCount">
                           <tr id="dynamicdiv">
                           <%-- <td style="width: 15%">
                       			 	<input type="text" readonly="readonly" value="${dealranges.groupId }" class="form-control searchItems groupSearch" id="1groupId" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 1groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected1groupId" value="${dealranges.groupId }" >
                       			</td>
                       			<td style="width: 15%">
                       			<input type="text" readonly="readonly" value="${dealranges.itemId }" class="form-control searchItems itemSearch" id="1itemId" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 1itemId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected1itemId" value="${dealranges.itemId }" >
									<input type="hidden" id="pluCode1itemId" value="${dealranges.pluCode }" >
                       			</td> --%>
                       		<td class="slno" id="itemno" style="width: 10%">${theCount.count}</td>
                       		    <input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       			<input type='hidden' id="pluCode${theCount.count}" value="${offerProducts.plucode}"/>
                       		   <input type='hidden' id="category${theCount.count}" value="${offerProducts.category}"/>
				 		       <input type='hidden' id="subCategory${theCount.count}" value="${offerProducts.subCategory}"/>
				 		       <input type='hidden' id="department${theCount.count}" value="${offerProducts.department}"/>
						       <input type='hidden' id="brandCode${theCount.count}" value="${offerProducts.model}"/>
						       <input type='hidden' id="modal${theCount.count}" value="${offerProducts.skuId}"/>
                       		 <td id="itemCode${theCount.count}" style="width: 10%">${offerProducts.skuId}</td>
                             <td id="itemDesc${theCount.count}" style="width: 15%">${offerProducts.itemDesc}</td>
                             <td id="ean${theCount.count}" style="width: 15%">${offerProducts.ean} </td>
                              <td id="size${theCount.count}" style="width: 12%">${offerProducts.size}</td>
                              <td><select style='height: 27px;' name="dealStatus${theCount.count}" id="dealStatus${theCount.count}">
							<option value=''>--Select--</option>
							<option value="flat_rate"${'flat_rate'==offerProducts.discountType ? 'selected' : ''}>Cash Flat</option>
							<option value="percentage"${'percentage'==offerProducts.discountType ? 'selected' : ''}>Cash Discount</option>
							<option value="loyaltypoints"${'loyaltypoints'==offerProducts.discountType ? 'selected' : ''}>Loyalty Points</option>
							 <option value="discountcoupon"  ${offerProducts.discountType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
							<option value="giftvouchers">${'giftvouchers'==offerProducts.discountType ? 'selected' : ''}Gift Vouchers</option>
							</select></td>
							 <td><input id="minQty${theCount.count}" style='width: 85%;' type='text' class='minQty' value="${offerProducts.minPurchaseQty}" ></td>
                             <td ><input id="amount${theCount.count}" style='width: 85%;' type='text' class='amount' value="${offerProducts.rewardValue }" ></td>
                          <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem1(this);' /></td>
                            
                       	   </tr>
                         </c:forEach>
							</c:if>								
															</tbody>
														</table>
													</div>
												</div>
												
												
												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 4px;">
													<c:choose>
													<c:when test="${offerBean.productSpecificFlag == false && empty offerBean.offerProducts}">
													<input type="radio" 
														onchange="toggleItemComplexBased('complexbasedOnGroup')" checked 	 name="basedOngroupCheck" style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:when>
													<c:otherwise>
													<input type="radio" 
														onchange="toggleItemComplexBased('complexbasedOnGroup')"  name="basedOngroupCheck"
														style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:otherwise>
													</c:choose>
												</div>
								
								
								 
								<br>
								 <div class="row" style="margin-left: 20px;margin-top: -16px;">
								 	<div class="form-group col-lg-2"  style="margin-bottom:5px;">
                                        	<label><spring:message code="offer_reward_type.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="priority" id="offerReward" onchange="toggleRepeat('offerReward')">
                                           <option value="fixed_rate"  ${offerBean.rewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                           <option value="flat_rate"  ${offerBean.rewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                            <option value="percentage"  ${offerBean.rewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                            <option value="loyaltypoints"  ${offerBean.rewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                            <option value="discountcoupon"  ${offerBean.rewardType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
                                            <option value="giftvouchers"  ${offerBean.rewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                            <option value="gift_coupon"  ${offerBean.rewardType == "gift_coupon" ? 'selected' : ''}>Gift Coupons</option>
                                            </select><span id="dealNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                       		<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
                                    </div>
                                    
                                    
                                    
                                    <div class="form-group col-lg-2" style="white-space: nowrap;padding-left: 0px;margin-bottom:5px;">
														
															<label><spring:message
																	code="rewardCriteria.label" /></label> <select
																class="form-control" name="offerReward" id="offerRewardCriteriaGroup"
																onclick="toggleComboLowest('offerRewardCriteriaGroup')">
																
																<c:if test="${offerBean.offerCategory != 'group_turn_over' }">
																<option value="false"${'false' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>Quantity Based</option>
																<%-- <option value="true"${'true' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>TurnOver Based</option> --%>
																</c:if>
																
																<c:if test="${offerBean.offerCategory == 'group_turn_over' }">
																<option value="group_turn_over"  ${ offerBean.itemSpecificTurnover == false  ? 'selected' : ''}>Group Turnover</option>
																<option value="item_price_range" ${ offerBean.itemSpecificTurnover == true  ? 'selected' : ''}>Item Price Range</option>
																</c:if>
																
																</select>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														
														</div>
                                    
                                    
                                <div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px;padding-left: 1px;white-space:nowrap;margin-bottom:5px;">
                                		<br>
                               			<c:if test="${offerBean.allowMultipleDiscounts == true }">
		                        			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
		                       			</c:if>
		                       			<c:if test="${offerBean.allowMultipleDiscounts == false }">
		                        			<input type="checkbox" style="vertical-align: -2px" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
		                       			</c:if>
                                	</div>
                                	<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; margin-left: 5px; padding-right: 0px;white-space:nowrap;margin-bottom:5px;">
                                		<br>
                                		<c:if test="${offerBean.repeat == true }">
                              				<input type="checkbox" checked="checked" style="vertical-align: -2px" id="isRepeat"/>&nbsp;<spring:message code="is.repeat.label" />
                              			</c:if>
                              			<c:if test="${offerBean.repeat == false }">
                              				<input type="checkbox" style="vertical-align: -2px" id="isRepeat"/>&nbsp;<spring:message code="is.repeat.label" />
                              			</c:if>
                               		</div>
                               	<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-right: 0px;margin-left: -25px;white-space:nowrap;margin-bottom:5px;">
                                		<br>
                                		<c:if test="${offerBean.combo == true }">
                              				<input type="checkbox" onchange="toggleComboLowest('isCombo')" checked="checked" style="vertical-align: -2px" id="isCombo"/>&nbsp;<spring:message code="is.combo.label" />
                              			</c:if>
                              			<c:if test="${offerBean.combo == false }">
                              				<input type="checkbox" onchange="toggleComboLowest('isCombo')" style="vertical-align: -2px" id="isCombo"/>&nbsp;<spring:message code="is.combo.label" />
                              			</c:if>
                               		</div>
                               		<div class="form-group col-lg-2"	style="text-align: center; margin-top: 4px; padding-left: 1px; padding-right: 0px;white-space:nowrap;margin-bottom:5px;">
                                		<br>
                                		<c:if test="${offerBean.lowestPriceItem == true }">
                              				<input type="checkbox" onchange="toggleComboLowest('lowestPriceItem')" onchange="changeLowestPrice()"checked="checked" style="vertical-align: -2px" id="lowestPriceItem"/>&nbsp;<spring:message code="lowest.price.item.label" />
                              			</c:if>
                              			<c:if test="${offerBean.lowestPriceItem == false }">
                              				<input type="checkbox" onchange="toggleComboLowest('lowestPriceItem')" onchange="changeLowestPrice()" style="vertical-align: -2px" id="lowestPriceItem"/>&nbsp;<spring:message code="lowest.price.item.label" />
                              			</c:if>
                               		</div>
                               		
                               		
                               		<%-- <div class="form-group col-lg-2" style="margin-top: 5px; width: 16%;white-space:nowrap;margin-left:-6px">
												<br>
												
												
												<c:choose>
												<c:when test="${offerBean.priceBasedConfigurationFlag == true && offerBean.productSpecificFlag == false}">
												<input type="checkbox" checked
													onchange="toggleComboLowest('priceBasedConfigurationGroup')" 
													style="vertical-align: -2px" id="priceBasedConfigurationGroup" />
												<spring:message code="pricebased.label" />
												
												</c:when>
												
												<c:otherwise>
												
												 <input type="checkbox"
													onchange="toggleComboLowest('priceBasedConfigurationGroup')" 
													style="vertical-align: -2px" id="priceBasedConfigurationGroup" />
												<spring:message code="pricebased.label" />
												
												</c:otherwise>
												
												</c:choose>
												
												
											</div> --%>
                               		
                               	</div> 
                               	
                               	<%-- <div class="row" style="font-size: 15px;margin-left: 20px;">
											<div class="form-group col-lg-4" style="margin-left: 1px;margin-top: -20px;">
												<br> 
												<c:choose>
												<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == false}">
												
												<input type="checkbox"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" checked />
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
												<input type="checkbox"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup"  />
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												</c:choose>
											</div>
											
										</div> --%>
                            <input type="hidden" id="typeForGroup" value="">    	
                               	
                     <div id="row" style="overflow: auto;white-space: nowrap;margin-left: 30px;">
   					 <div>
                      	<%--  <label style="font-weight:bold;"><spring:message code="offer_slabs.label" /> </label> --%>
                       	 <hr style="margin-top: 1px;">
                      </div>
                              
                  	<div class="table-responsive" style="margin-top:-22px;">
                     <table id="editOfferSlabsTable" class="table table-bordered table-hover" style="width:100%;">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr id="slabTr">
                         	<th style="width: 10%"><spring:message code="groupid.label"/></th>
                         	 <th style="width: 10%"><spring:message code="item_id.label"/></th>
                             <th style="width: 15%"><spring:message code="minQty.label"/></th>
                             <th style="width: 15%"><spring:message code="minAmt.label"/></th>
                             <th style="width: 12%"><spring:message code="offer_reward_type.label"/></th>
                            <th style="width: 12%"><spring:message code="offer_reward_value.label"/></th>
                            <th style="width: 12%"><spring:message code="reward.quantity.label"/></th>
                             <th style="width: 12%"><spring:message code="range.mode.label"/></th>
                            <th style="width: 15%"><spring:message code="description.label"/></th>
                           <th style="width: 12%">Start Value</th>
							  <th style="width: 12%">End Value</th>
                            <th style="width: 7%"><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
                     <%--   	<tr id='editrange0' style="display: none;">
                       	 	<td style="display: none;"><label id="editrange0rangename">editrange0rangename</label></td>
                       	 	<td style="width: 10%">
                       			 	<input type="text" style="width: 100px;"  class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="0groupId" placeholder="<spring:message code="enter.group.label" />"  />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 0groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected0groupId">
                       			</td>
                       			<td style="width: 10%">
                       			<input type="text"  class="form-control itemSearch" style="width: 100px;" oninput="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="0itemIdgroup" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 0itemIdgroup" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected0itemIdgroup">
									<input type="hidden" id="pluCode0itemIdgroup">
                       			</td>
                             <td style="width: 15%"><input type="text" id="editrange0minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 15%"><input type="text" id="editrange0minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td> 
									<select class="form-control" name="offerReward" id="editrange0rangeRewardType" >
										<option value="ALL">ALL</option>
                                       <option value="fixed_rate">Fixed Rate</option>
                                       <option value="flat_rate">Cash Flat</option>
                                       <option value="percentage">Cash Discount</option>
                                       <option value="loyaltypoints">Loyalty Points</option>
                                       <option value="discountcoupon">Discount Coupon</option>
                                       <option value="giftvouchers">Gift Vouchers</option>
                                    </select>
                             </td>
                             <td style="width: 12%"><input type="text" id="editrange0rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 12%"><input type="text" id="editrange0rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                              <td> 
                             	    <select class="form-control" name="rangeMode" id="editrange0rangeMode" onchange="changeRangeMode(this);" >
                                       <option value="both">Both</option>
  									   <option value="condition">Condition</option>
                                       <option value="promotion">Promotion</option>
                                    </select>
                             </td>
                             <td style="width: 15%"><input type="text" id="editrange0description" class="form-control" ></td>
                              <td style="width: 12%"><input	class="form-control startPrice" disabled="disabled" type="text"  id="editrange0startPrice"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                            <td style="width: 12%"><input class="form-control endPrice"	type="text" disabled="disabled" id="editrange0endPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeEditOfferSlab('editrange0')"></div></td>
                       	
                       	 </tr> --%>
                       	 
                       	 
                       	 <c:choose>
                       	 <c:when test="${offerBean.productSpecificFlag == false}" >
                       	 
                       	   <c:forEach var="dealranges" items="${offerBean.offerRangesList}" varStatus="textid">
                       	 <tr id='editrange${textid.count}'>
                       	 	<td style="display: none;"><label id="editrange${textid.count}rangename">${dealranges.range}</label></td>
                       	 	<td style="width: 10%">
                       			 	<input type="text"  style="width: 100px;    margin-left: -8px;" value="${dealranges.groupId}" class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}groupId" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected${textid.count}groupId" value="${dealranges.groupId}" >
                       			</td>
                       			<td style="width: 10%">
                       			<input type="text" style="width: 100px;    margin-left: -8px;" value="${dealranges.itemId}" class="form-control itemSearch" onblur="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}itemIdgroup" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}itemIdgroup" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected${textid.count}itemIdgroup" value="${dealranges.itemId }" >
									<input type="hidden" id="pluCode${textid.count}itemIdgroup" value="${dealranges.pluCode }" >
                       			</td>
                       		<!-- mani -->
                       		<c:choose>
                             	<c:when test="${offerBean.offerCategory == 'item_specific' && offerBean.lowestPriceItem == true && dealranges.rangeMode == 'promotion'}">
                             		 <td style="width: 15%"><input type="text" class="form-control minQty" readonly="readonly" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.offerCategory == 'item_specific' && offerBean.lowestPriceItem == true && dealranges.rangeMode != 'promotion'}">
                             		  <td style="width: 15%"><input class="form-control minQty" type="text" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.offerCategory == 'item_specific' && offerBean.combo == true && dealranges.rangeMode == 'promotion'}">
                             		<td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		 <td style="width: 15%"><input type="text" class="form-control minQty" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'promotion'}">
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'promotion'}">
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'promotion'}">
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount minAmt" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                             <td> 
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<select class="form-control" disabled="disabled" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="discountcoupon"  ${dealranges.rangeRewardType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                        <option value="gift_coupon"  ${dealranges.rangeRewardType == "gift_coupon" ? 'selected' : ''}>Gift Coupons</option>
                                    </select>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <select class="form-control" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="discountcoupon"  ${dealranges.rangeRewardType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                        <option value="gift_coupon"  ${dealranges.rangeRewardType == "gift_coupon" ? 'selected' : ''}>Gift Coupons</option>
                                    </select>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'condition'}">
                             		<select class="form-control" disabled="disabled" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="discountcoupon"  ${dealranges.rangeRewardType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                        <option value="gift_coupon"  ${dealranges.rangeRewardType == "gift_coupon" ? 'selected' : ''}>Gift Coupons</option>
                                    </select>
                             	</c:when>
                             	<c:otherwise>
                             		<select class="form-control" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                       <option value="discountcoupon"  ${dealranges.rangeRewardType == "discountcoupon" ? 'selected' : ''}>Discount Coupon</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                        <option value="gift_coupon"  ${dealranges.rangeRewardType == "gift_coupon" ? 'selected' : ''}>Gift Coupons</option>
                                    </select>
                             	</c:otherwise>
                             </c:choose>
                             
                             </td>
                           
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <td style="width: 12%"><input type="text" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		<td style="width: 12%"><input type="text" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true }">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		<td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                              
                             <td> 
                             	    <select class="form-control" name="rangeMode" id="editrange${textid.count}rangeMode" onchange="changeRangeMode(this);" >
                                       <option value="both"  ${dealranges.rangeMode == "both" ? 'selected' : ''}>Both</option>
  									   <option value="condition" ${dealranges.rangeMode == "condition" ? 'selected' : ''}>Condition</option>
                                       <option value="promotion" ${dealranges.rangeMode == "promotion" ? 'selected' : ''}>Promotion</option>
                                    </select>
                             </td>
                             
                             <td style="width: 15%"><input type="text" value = "${dealranges.description }" id="editrange${textid.count}description" class="form-control" ></td>
                            
                             <td style="width: 12%"><input	class="form-control startPrice"  type="text" value="${dealranges.startPrice}"  id="editrange${textid.count}startPrice"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
							    <td style="width: 12%"><input class="form-control endPrice"   value="${dealranges.endPrice}"	 type="text" id="editrange${textid.count}endPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeEditOfferSlab('editrange${textid.count}')"></div></td>
                       	 </tr>
                       </c:forEach>
                       	 
                       	 
                       	 </c:when>
                       	 
                       	 <c:otherwise>
                       	 	<tr id='editrange0' style="">
                       	 	<td style="display: none;"><label id="editrange0rangename">editrange0rangename</label></td>
                       	 	<td style="width: 10%">
                       			 	<input type="text" style="width: 100px;"  class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="0groupId" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 0groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected0groupId">
                       			</td>
                       			<td style="width: 10%">
                       			<input type="text"  class="form-control itemSearch" style="width: 100px;" onblur="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="0itemIdgroup" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 0itemIdgroup" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected0itemIdgroup">
									<input type="hidden" id="pluCode0itemIdgroup">
                       			</td>
                             <td style="width: 15%"><input type="text" id="editrange0minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 15%"><input type="text" id="editrange0minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td> 
									<select class="form-control" name="offerReward" id="editrange0rangeRewardType" >
										<option value="ALL">ALL</option>
                                       <option value="fixed_rate">Fixed Rate</option>
                                       <option value="flat_rate">Cash Flat</option>
                                       <option value="percentage">Cash Discount</option>
                                       <option value="loyaltypoints">Loyalty Points</option>
                                        <option value="discountcoupon">Discount Coupon</option>
                                       <option value="giftvouchers">Gift Vouchers</option>
                                       <option value="gift_coupon">Gift Coupons</option>
                                    </select>
                             </td>
                             <td style="width: 12%"><input type="text" id="editrange0rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             <td style="width: 12%"><input type="text" id="editrange0rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                              <td> 
                             	    <select class="form-control" name="rangeMode" id="editrange0rangeMode" onchange="changeRangeMode(this);" >
                                       <option value="both">Both</option>
  									   <option value="condition">Condition</option>
                                       <option value="promotion">Promotion</option>
                                    </select>
                             </td>
                             <td style="width: 15%"><input type="text" id="editrange0description" class="form-control" ></td>
                              <td style="width: 12%"><input	class="form-control startPrice" disabled="disabled" type="text"  id="editrange0startPrice" value="0"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                            <td style="width: 12%"><input class="form-control endPrice"	type="text" disabled="disabled" id="editrange0endPrice" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeEditOfferSlab('editrange0')"></div></td>
                       	
                       	 </tr>
                       	 
                       	 
                       	 </c:otherwise>
                       	 
                       	 </c:choose>
                       	 
                       	 
                      <%--   <c:forEach var="dealranges" items="${offerBean.offerRangesList}" varStatus="textid">
                       	 <tr id='editrange${textid.count}'>
                       	 	<td style="display: none;"><label id="editrange${textid.count}rangename">${dealranges.range}</label></td>
                       	 	<td style="width: 10%">
                       			 	<input type="text" style="width: 100px;    margin-left: -8px;" value="${dealranges.groupId}" class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}groupId" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}groupId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected${textid.count}groupId" value="${dealranges.groupId }" >
                       			</td>
                       			<td style="width: 10%">
                       			<input type="text" style="width: 100px;    margin-left: -8px;" value="${dealranges.itemId}" class="form-control itemSearch" oninput="getItemIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="${textid.count}itemId" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl ${textid.count}itemId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected${textid.count}itemId" value="${dealranges.itemId }" >
									<input type="hidden" id="pluCode${textid.count}itemId" value="${dealranges.pluCode }" >
                       			</td>
                       			<c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'promotion'}">
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseQuantityString }" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamountString }" id="editrange${textid.count}minamount" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                       			</c:if>
                       			<c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'promotion'}">
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseQuantityString }" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamountString }" id="editrange${textid.count}minamount" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                       			</c:if>
                       		<c:choose>
                             	<c:when test="${offerBean.offerCategory == 'item_specific' && offerBean.lowestPriceItem == true && dealranges.rangeMode == 'promotion'}">
                             		 <td style="width: 15%"><input type="text" class="form-control minQty" readonly="readonly" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.offerCategory == 'item_specific' && offerBean.lowestPriceItem == true && dealranges.rangeMode != 'promotion'}">
                             		  <td style="width: 15%"><input class="form-control minQty" type="text" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.offerCategory == 'item_specific' && offerBean.combo == true && dealranges.rangeMode == 'promotion'}">
                             		<td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		 <td style="width: 15%"><input type="text" class="form-control minQty" value = "${dealranges.minimumPurchaseQuantityString}" id="editrange${textid.count}minquantity" class="form-control minQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'promotion'}">
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'promotion'}">
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'promotion'}">
		                             <td style="width: 15%"><input type="text" readonly="readonly" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount minAmt" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
		                             <td style="width: 15%"><input type="text" value = "${dealranges.minimumPurchaseamountString}" id="editrange${textid.count}minamount" class="form-control minAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                             <td> 
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<select class="form-control" disabled="disabled" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <select class="form-control" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'condition'}">
                             		<select class="form-control" disabled="disabled" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:when>
                             	<c:otherwise>
                             		<select class="form-control" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                             	</c:otherwise>
                             </c:choose>
                             <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                                   <select class="form-control" disabled="disabled" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                              </c:if>
                              <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                                   <select class="form-control" name="offerReward" id="editrange${textid.count}rangeRewardType" >
                                   		<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
                                	    <option value="fixed_rate"  ${dealranges.rangeRewardType == "fixed_rate" ? 'selected' : ''}>Fixed Rate</option>
                                        <option value="flat_rate"  ${dealranges.rangeRewardType == "flat_rate" ? 'selected' : ''}>Cash Flat</option>
                                        <option value="percentage"  ${dealranges.rangeRewardType == "percentage" ? 'selected' : ''}>Cash Discount</option>
                                        <option value="loyaltypoints"  ${dealranges.rangeRewardType == "loyaltypoints" ? 'selected' : ''}>Loyalty Points</option>
                                        <option value="giftvouchers"  ${dealranges.rangeRewardType == "giftvouchers" ? 'selected' : ''}>Gift Vouchers</option>
                                    </select>
                              </c:if>
                             </td>
                             <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
	                             <td style="width: 12%"><input type="text" readonly="readonly" value = "${dealranges.rewardValueString }" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             </c:if>
                             <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             	<td style="width: 12%"><input type="text" value = "${dealranges.rewardValueString }" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             </c:if>
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <td style="width: 12%"><input type="text" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		<td style="width: 12%"><input type="text" value = "${dealranges.rewardValueString}" id="editrange${textid.count}rewardvalue" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                             <c:choose>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
                             		 <td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:when test="${offerBean.combo == true }">
                             		<td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:when>
                             	<c:otherwise>
                             		<td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
                             	</c:otherwise>
                             </c:choose>
                              <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode == 'condition'}">
	                             <td style="width: 12%"><input type="text" readonly="readonly" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
	                          </c:if>
	                           <c:if test="${offerBean.lowestPriceItem == true && dealranges.rangeMode != 'condition'}">
	                             <td style="width: 12%"><input type="text" value= "${dealranges.rewardQty }" id="editrange${textid.count}rewardQuantity" class="form-control rewardQuantity" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" ></td>
	                          </c:if>
                             <td> 
                             	    <select class="form-control" name="rangeMode" id="editrange${textid.count}rangeMode" onchange="changeRangeMode(this);" >
                                       <option value="both"  ${dealranges.rangeMode == "both" ? 'selected' : ''}>Both</option>
  									   <option value="condition" ${dealranges.rangeMode == "condition" ? 'selected' : ''}>Condition</option>
                                       <option value="promotion" ${dealranges.rangeMode == "promotion" ? 'selected' : ''}>Promotion</option>
                                    </select>
                             </td>
                             
                             <td style="width: 15%"><input type="text" value = "${dealranges.description }" id="editrange${textid.count}description" class="form-control" ></td>
                              <c:choose>
                              <c:when test="${offerBean.priceBasedConfigurationFlag == true || offerBean.applyForAllItems == true}">
                             <td style="width: 12%"><input	class="form-control startPrice" disabled="disabled" type="text" value="${dealranges.startPrice}"  id="editrange${textid.count}startPrice"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
							</c:when>
							<c:otherwise>
							 <td style="width: 12%"><input	class="form-control startPrice" disabled="disabled" type="text" value="${dealranges.startPrice}"  id="editrange${textid.count}startPrice"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
							</c:otherwise>
							</c:choose>
							  <c:choose>
							  <c:when test="${offerBean.priceBasedConfigurationFlag == true || offerBean.applyForAllItems == true }">
							    <td style="width: 12%"><input class="form-control endPrice" value="" disabled="disabled" value="${dealranges.endPrice}"	 type="text" id="editrange${textid.count}endPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                              </c:when>
                              <c:otherwise>
                              <td style="width: 12%"><input class="form-control endPrice" disabled="disabled"	type="text" id="editrange${textid.count}endPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                              </c:otherwise>
                           </c:choose>
                             <td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="  width: 33px;cursor: pointer;" onclick="addEditOfferSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="  width: 24px;cursor: pointer;" onclick="removeEditOfferSlab('editrange${textid.count}')"></div></td>
                       	 </tr>
                       </c:forEach> --%>
                       
			 	</tbody>
                    </table>
                 </div>
                 </div> 
                 </div>
                 </div>
								</div>
								
					<div class="row">
			   						<div class="form-group col-lg-12" style="margin-top: -2%;">
			   						
			   							<%-- <input type="radio" style="vertical-align: -2px;pointer-events: none;" name="configureBasedItems" />
												<spring:message code="applyforAllitems.label" /> --%>
			   						
			   						<%-- <c:choose>
												<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == false}">
												<input type="radio" onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" checked  name="configureBasedItems"/>
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
												<input type="radio" onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" name="configureBasedItems" />
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												</c:choose> --%>
                                         	 <hr style="margin-top: 1px;border:none;">
                                         	
                                         </div>
                                </div>  
								
								
								
								</div>
								<br>
                 <div class="row" style="">
               				<%-- 	<div class="form-group col-lg-3" style="">
                                       <label id="offerBannerLabel"><spring:message code="offer_banner.label" /></label><br>
                                	  	<c:if test="${offerBean.bannerImg == true }">
		                        			<input type="checkbox" checked="checked" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
		                       			<c:if test="${offerBean.bannerImg == false }">
		                        			<input type="checkbox" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
		                       			<input type="hidden" id="offerBannerRefId" />
                                         <input type="hidden" id="offerBanner_name" />
                                        <c:if test="${offerBean.offerImage == ''|| empty offerBean.offerImage}">
											<br>
                                         	<div class="icon-remove blue delete" title="Offer Banner" id="offerBanner_image">
												<label class="myFile" id="offerBanner_label">
												<img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner" onchange="loadImageFileAsURL('offerBanner',this);" />
												</label>
											</div>
											</c:if>
											<c:if test="${not empty offerBean.offerImage}">
											<div class="icon-remove blue delete" title="Offer Banner" id="offerBanner_image">
												<label class="myFile" id="offerBanner_label" style="display: none">
												<img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner" onchange="loadImageFileAsURL('offerBanner',this);" />
												</label>
												
												<img class="thumbnail" id="offerBanner_thumbnail" src="${offerBean.offerImage}" style="width:80px;height:80px;"/>
												<img class="delImage" id="offerBanner_delImage" src="${pageContext.request.contextPath}/images/deny.png" onclick="deletePic('offerBanner');">
											</div>
											</c:if>
                                          <input type = "hidden" id="offerbannerByte" value="${banner}">
                                          <span id="offerBannerErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                  </div> --%>
                                 <div class="col-lg-12"> 
                                  <div class="row">      
                                   <div class="form-group col-lg-2"> 
                                         <label><spring:message code="deal_status.label" /></label>
                                         <c:if test="${offerBean.offerStatus == 'ACTIVE'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" id="offerStatus" name="offerStatus" value=true checked>
                                                    <spring:message code="deal_enable.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="offerStatus" name="offerStatus" value=false>
                                                   <spring:message code="deal_disable.label"/>
                                                </label>
                                            </div>
                                           </c:if>
                                           <c:if test="${offerBean.offerStatus == 'INACTIVE'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" id="offerStatus" name="offerStatus" value=true >
                                                    <spring:message code="deal_enable.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="offerStatus" name="offerStatus" checked value=false >
                                                   <spring:message code="deal_disable.label"/>
                                                </label>
                                            </div>
                                           </c:if>
                                        </div>
                                        
                                                                          
                                    <div class="form-group col-lg-2">
                                      <label><spring:message code="deal_loyalty_points_status.label" /></label>
                                      
                                      <c:if test="${offerBean.claimLoyaltypoints == 'true'}">
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
                                           
                                      <c:if test="${offerBean.claimLoyaltypoints == 'false'}">
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
                                     
                                      <div class="form-group col-lg-2"> 
                                         <label><spring:message code="deal_giftvouchet_status.label" /></label>
                                          <c:if test="${offerBean.claimgiftvouchers == 'true'}">
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
                                            <c:if test="${offerBean.claimgiftvouchers == 'false'}">
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
                                   
                                   <div class="form-group col-lg-2"> 
                                         <label><spring:message code="deal_claims_coupons.label" /></label>
                                          <c:if test="${offerBean.claimCoupons == 'true'}">
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
                                          <c:if test="${offerBean.claimCoupons == 'false'}">
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
                                            
                                            
                                        	<div class="form-group col-lg-2">
												<label><spring:message
														code="gift.coupon.code.label" /></label>
												

													<input class="form-control disabled" type="text" id="CouponCodeforOffer" 
											placeholder="<spring:message code="gift.coupon.code.label" />" value="${offerBean.offerRangesList[0].couponProgramId}" />
												
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
                                       </div>
                           			 <div class="row" style="margin-top: 10px;">
                                    	 <%-- <div class="form-group col-lg-12">
			                              	 <label><span style="font-weight: bold;font-size: 16px;color:#666;"><spring:message code="deal.visibility.label" /></span>( These options make the Deals are visible with B2C sites  so that online customer can exercise purchasing options. Please note that this is applicable only when our customer | use our CLOUD platform for their Online Business.) </label>
			                              	 <hr style="margin-top: 1px;margin-bottom: -5px;">
			                             </div> --%>
			                             
			                            <div class="form-group b2cVisibility col-lg-12" style="text-align: center; margin-top: 25px;">
                                         	 <div class=""
											style="font-weight: bold;font-size: 19px; color: #666;margin-bottom: -42px;">
											<span
												style="background-color: white;"><spring:message
													code="offer.online.visibility.label" /></span>
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
									   <%-- <div class="form-group col-lg-12" >
                                         	 <label style="font-weight:bold;"><spring:message code="display.tag.line.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div> --%>
                                     </div>
                                     </div>
                                     <div class="offervisibility subBlock">
                                     
                                     
                                     
                                     <div class="col-lg-3">
								
								 <div class="row">
		                              
                                        <div class="address-details col-lg-6 col-xs-8">
                                       <label id="offerBannerLabel"><spring:message
												code="offer_banner.label" /></label><br>
												
												  	<c:if test="${offerBean.bannerImg == true }">
												 <input  checked=" "	type="checkbox" style="vertical-align: -2px" id="banner" />
										<spring:message code="use.as.banner.label" />
										</c:if>
										<c:if test="${offerBean.bannerImg == false }">
		                        			<input type="checkbox" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
                                        </div></div>
                                        
                                        	<input type="hidden" id="offerBannerRefId" />
                                         <input type="hidden" id="offerBanner_name" />
                                        <c:if test="${offerBean.offerImage == ''|| empty offerBean.offerImage}">
											<br>
                                         	<div class="icon-remove blue delete" title="Offer Banner" id="offerBanner_image">
												<label class="myFile" id="offerBanner_label">
												<img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner" onchange="loadImageFileAsURL('offerBanner',this);" />
												</label>
											</div>
											</c:if>
											
											
											<c:if test="${not empty offerBean.offerImage}">
											<div class="icon-remove blue delete" title="Offer Banner" id="offerBanner_image">
												<label class="myFile" id="offerBanner_label" style="display: none">
												<img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner" onchange="loadImageFileAsURL('offerBanner',this);" />
												</label>
												
												<img class="thumbnail" id="offerBanner_thumbnail" src="${offerBean.offerImage}" style="width:140px;height:190px;"/>
												<img class="delImage" id="offerBanner_delImage" src="${pageContext.request.contextPath}/images/deny.png" onclick="deletePic('offerBanner');">
											</div>
											</c:if>
											<input type = "hidden" id="offerbannerByte" value="${banner}">
                                          <span id="offerBannerErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 
                                  		<%--   <input type = "hidden" id="offerbannerByte" value="${banner}">
                                          <span id="offerBannerErr" style="text-align:right;color:red;font-weight:bold;"></span> --%>
                                  		<%--  <div class="icon-remove blue delete" title="Offer Banner"
											id="offerBanner_image">
											<label class="myFile" id="offerBanner_label"> <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
												<input type="file" id="offerBanner" name="offerBanner"
												onchange="loadImageFileAsURL('offerBanner',this);" /> <!-- <input type = "hidden" id="offerbannerByte"> -->
											</label> <span id="offerBannerErr"
												style="text-align: right; color: red; font-weight: bold;"></span>
											<input type="hidden" id="offerBannerRefId" /> <input
												type="hidden" id="offerBanner_name" />
										</div> --%>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 </div>
                                     
                         <div class="col-lg-3"></div>
                         <div class="col-lg-9" style="margin-left: -26px;">            
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    
                                    	<label><spring:message code="display.tag.line.label" /></label>
                                    	<textarea class="form-control" name="dealImageText" id="dealImageText" rows="1" style="resize: none;" placeholder="<spring:message code="display.tag.line.label" />" >${offerBean.offerImageText}</textarea>
                                    </div>
                                   
                                    	<div class="form-group col-lg-3" style="">
                                    	<div class="col-lg-11">
											<div class="form-group col-lg-3" style="margin-left: -27px;">
<%--                                     		<label><spring:message code="deal.image.text.font.label" /></label> --%>
                                                     <div class="col-lg-12"><br></div>
                                    		<input type="hidden" id="dealImageTextFontHidden"  value="${offerBean.offerImageTextFont}">
                                    		<select class="form-control" id="dealImageTextFont">
                                    		</select>
                                    	</div>
                                    	</div>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" id="dealImageTextSize" value="${offerBean.offerImageSize}" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="dealImageTextColor" value="${offerBean.offerImageColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${offerBean.offerImageBold == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageBold != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageItalic == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageItalic != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageStrike == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageStrike != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
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
                                       <div class="col-lg-9" style="margin-left: -26px;">
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.sale.text.label" /></label>
                                    	<textarea class="form-control" name="saleText" id="saleText" rows="1" style="resize: none;" placeholder="<spring:message code="display.sale.text.label" />" >${offerBean.salePriceText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    	<div class="col-lg-11">
											<div class="form-group col-lg-3" style="margin-left: -27px;">
<%--                                     		<label><spring:message code="deal.image.text.font.label" /></label> --%>
                                    		<div class="col-lg-12"><br></div>
                                    		<input type="hidden" id="saleTextFontHidden" value="${offerBean.salePriceFont}">
                                    		<select class="form-control" id="saleTextFont">
                                    		</select>
                                    	</div>
                                    	</div>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" id="saleTextSize" value="${offerBean.salePriceSize}" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="saleTextColor" value="${offerBean.salePriceColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${offerBean.salePriceBold == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceBold != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceItalic == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceItalic != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceStrike == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceStrike != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
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
                                    	<textarea class="form-control" name="dealText" id="dealText" rows="1" style="resize: none;" placeholder="<spring:message code="display.deal.text.label" />" >${offerBean.offerPriceText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    	<div class="col-lg-11">
											<div class="form-group col-lg-3" style="margin-left: -27px;">
<%--                                     		<label><spring:message code="deal.image.text.font.label" /></label> --%>
                                    		<div class="col-lg-12"><br></div>
                                    		<input type="hidden" id="dealTextFontHidden" value="${offerBean.offerPriceFont}">
                                    		<select class="form-control" id="dealTextFont">
                                    		</select>
                                    	</div>
                                    	</div>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" value="${offerBean.offerPriceSize}" id="dealTextSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="dealTextColor" value="${offerBean.offerPriceColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${offerBean.offerPriceBold == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceBold != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceItalic == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceItalic != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceStrike == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceStrike != 0}">
	                                    		<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
                                    	</div>
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
                                            <input class="form-control" name="closedOn" id="closedOn" value="${offerBean.closedOnStr}" readonly="readonly" style="background: white;" size="20" type="text" onfocus="callCalenderYYYYMMDD('closedOn')" onclick="callCalenderYYYYMMDD('closedOn')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                         </div>
                                       
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="closed.reason.label" /></label>
                                            <input type="text" class="form-control" name="closedReason" id="closedReason" value="${offerBean.closedReason}" required placeholder="<spring:message code="enter.authorised.by.label" />" />
                                        	<span id="closedReasonError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                        </div>  
                                        </div> 
                                        
						<div class="row" style="text-align: right;">
						 <c:if test="${offerBean.offerStatus == 'ACTIVE'}">
                                 	 	
                                 	 	
                                 	 	 <input type="button" id="submit" style="position: relative;" class="btnCls" onclick="promotionPrint('${offerBean.offerID}','descriptionPrint')" value="<spring:message code="print.label" />" />
                                 	 	
                                 	 	 </c:if>
						 <input type="button" id="submit" class="btnCls" onclick="updateOffer('${offerBean.offerID}')" value="<spring:message code="submit.label" />" />
						<input type="button" class="btnCls" style="margin-left:1%;margin-right: 2%;" onclick="viewdealsandoffers('offers','','0')" value="<spring:message code="cancel.label" />" />
						</div>
						<%-- <span class="requiredField">${err}</span> --%>
				</div><!-- /.box-body -->
									<br/>
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
                            </div>
                            
             <input type="hidden" id="offerEditSellProducts" value="${offerBean.sellProducts}">
				<input type="hidden" id="editOfferSkus" value="${offerBean.sellSkuids}">
				<input type="hidden" id="subCategories" value='${subCategories}' />
				<input type="hidden" id="selectedSaleProductSubCategory" value='${offerBean.productSubCategory}' />
<input type="hidden" class="appluforallitems" value="${offerBean.applyForAllItems}">
<input type="hidden" class="priceBased" value="${offerBean.priceBasedConfigurationFlag}">

  <!--added by manasa  -->
                           <!--  <input type="hidden" id="searchOffers" value=""> -->
				<input type="hidden" id="outletLocation" value="${offerObj.offerLocation}">
		 <input type="hidden" id="from" value="${offerObj.startDateStr}">
        <input type="hidden" id="to" value="${offerObj.endDateStr}">
            <input type="hidden" id="searchOffers" value="${offerObj.searchCriteria}">
            <input type="hidden" id="offerStatusValue" value="${offerStatusValue}">
             <input type="hidden" id="zone" value="${zone}">
              <input type="hidden" id="offerType" value="${offerType}">
        <input type="hidden" value="${offerObj.maxRecords}" id="maxRecords"/> 
          <input type="hidden" id="offerStatusValue" value=""> 
				<!--added by manasa  -->

</div>
</div>
</section><!-- /.content -->
   <!-- InputMask -->
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#offerStartDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
                $("#offerEndDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
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
  //Timepicker
 $(".my-colorpicker2").colorpicker();
  /* $('#taxestable').dataTable({
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