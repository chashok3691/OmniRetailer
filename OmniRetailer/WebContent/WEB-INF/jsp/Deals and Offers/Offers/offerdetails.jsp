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
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dealsAndOffers/offers.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontselect.css">
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/jquery.fontselect.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
	 <script src="${pageContext.request.contextPath}/js/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
	
	<script type="text/javascript">
 $(document).ready(function(){
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
	 //$("#offerLocation").val($("#offerLocations").val().split(','));
	 
	  var slectedLocations = $("#offerLocations").val().replace('[','').replace(']','').replace(/, /g,',');
	 	$("#offerLocation").val(slectedLocations.split(','));
	 
	 /* create one slab while loading */
	 //addOfferSlab();
	 /* $("#dealImageTextFont").fontselect();
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
	 $("#dealTextFontHidden").siblings(".font-select").children("a").children("span").text(dealTextFont); */
	 
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
		} */
		
	 	checkForB2CLocation() ;
		
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
.span2 {
	width: 14.05%;
	*width: 14.05%;
	
	
}
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
                               <h3> ${offerBean.offerID} - <spring:message code="offer.details.label" /></h3>
                                </div> --%><!-- /.box-header -->
                                 
                                <!-- form start -->
                                <form method="POST">
                                    <div class="box-body" >
                                   
                                 
                                   
                                      <div class="row" style="text-align: right; margin-top: 10px;">
                                 	 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                 	 	 <c:if test="${offerBean.offerStatus == 'ACTIVE'}">
                                 	 	
                                 	 	
                                 	 	 <input type="button" id="submit" style="position: relative;" class="btnCls" onclick="promotionPrint('${offerBean.offerID}','descriptionPrint')" value="<spring:message code="print.label" />" />
                                 	 	</c:if>
                                 	   <c:if test="${sessionScope.role == 'super admin'}">
                                 	   		<input type="button" id="submit" style="position: relative;" class="btnCls" onclick="editoffer('${offerBean.offerID}')" value="<spring:message code="edit.label" />" />
                                 	   </c:if>
                                 	   <input type="hidden" id="expandValue" value=""></input>
									        	 	<input type="hidden" id="expandVisibilityValue" value=""></input>
									        	 	<input type="hidden" id="expandAuthValue" value=""></input>
                                 	  <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}">
	                            	    <c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">
                                 	 	 <input type="button" id="submit" style="position: relative;" class="btnCls" onclick="editoffer('${offerBean.offerID}')" value="<spring:message code="edit.label" />" />
                                 	 	</c:if>
                                 	 </c:forEach>
										 <input type="button" class="btnCls" style="margin-left:1%;margin-right: 2%;position: relative;" onclick="viewdealsandoffers('offers','','0')" value="<spring:message code="cancel.label" />" />
										<!-- <hr style="margin-top: 4px;width: 99%;" /> -->
									</div> 
									
									
									
									
									 <div class="row" >
							               <div class="col-lg-12" style="text-align: center;margin-top: 25px;" >
							               <div style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;margin-bottom: -42px;">
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
									                	  <select disabled="disabled" onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control" >
															<option value="Select Country" >Select Country</option>
														  </select>
														  	<input type="hidden" id="selectedCountry" value="${offerBean.customerFilter.country}"></input>
									        	 	</div>
									        	 	
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="age.label" /></label>
									                	  <select disabled="disabled" id="age" name ="age" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="1-12" ${offerBean.customerFilter.customerAge == "1-12" ? 'selected' : ''}>1 to 12</option>
															<option value="13-19" ${offerBean.customerFilter.customerAge == "13-19" ? 'selected' : ''}>13 to 19</option>
															<option value="20-30" ${offerBean.customerFilter.customerAge == "20-30" ? 'selected' : ''}>20 to 30</option>
															<option value="31-40" ${offerBean.customerFilter.customerAge == "31-40" ? 'selected' : ''}>31 to 40</option>
															<option value="41-50" ${offerBean.customerFilter.customerAge == "41-50" ? 'selected' : ''}>41 to 50</option>
															<option value="51-60" ${offerBean.customerFilter.customerAge == "51-60" ? 'selected' : ''}>51 to 60</option>
															<option value="61-100" ${offerBean.customerFilter.customerAge == "61-100" ? 'selected' : ''}>61 and above</option>
														  </select>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="gender.label" /></label>
									                	  <select disabled="disabled"  id="gender" name ="gender" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Male" ${offerBean.customerFilter.gender == "Male" ? 'selected' : ''}>Male</option>
															<option value="Female" ${offerBean.customerFilter.gender == "Female" ? 'selected' : ''}>Female</option>
															<option value="Other" ${offerBean.customerFilter.gender == "Other" ? 'selected' : ''}>Other</option>
														  </select>
									        	 	</div>
									        	 	
									        	 	<%-- <div class="form-group col-lg-6">
									        	 		<label><spring:message code="customer.type.label" /></label>
									                	  <select disabled="disabled" id="customerType" name ="customerType" class="form-control" >
									                	  	<option value="-- Select --" >-- Select --</option>
									                	  	<option value="PREMIUM" ${offerBean.customerFilter.customerType == "PREMIUM" ? 'selected' : ''}>PREMIUM</option>
									                	  	<option value="PLUS" ${offerBean.customerFilter.customerType == "PLUS" ? 'selected' : ''}>PLUS</option>
									                	  	<option value="BASIC" ${offerBean.customerFilter.customerType == "BASIC" ? 'selected' : ''}>BASIC</option>
									                	  	<option value="GENERIC" ${offerBean.customerFilter.customerType == "GENERIC" ? 'selected' : ''}>GENERIC</option>
															<option value="EMPLOYEE" ${offerBean.customerFilter.customerType == "EMPLOYEE" ? 'selected' : ''}>EMPLOYEE</option>
															<!-- <option >Select Country</option> -->
														  </select>
									        	 	</div> --%>
									        	 </div>
									             <div class="col-lg-12">
									        	 	<div class="form-group col-lg-4" style="padding-left:0px">
									        	 		 <label><spring:message code="region.label" /></label>
															 <select disabled="disabled" id ="states" class="form-control" >
															 	<option value="Select State" >Select State</option>
															</select>
															<input type="hidden" id="selectedState" value="${offerBean.customerFilter.region}"></input>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="marital.status.label" /></label>
									                	  <select id="otherDetails" disabled="disabled" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Married" ${offerBean.customerFilter.maritialStatus == "Married" ? 'selected' : ''}>Married</option>
															<option value="Unmarried" ${offerBean.customerFilter.maritialStatus == "Unmarried" ? 'selected' : ''}>Unmarried</option>
														  </select>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		  <label><spring:message code="children.label" /></label>
									                	  <select disabled="disabled" id="children" class="form-control" >
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
									        	 		 <input readonly="readonly" type="text" id="city" class="form-control" value="${offerBean.customerFilter.city}" />
															<!--  <select id ="city" class="form-control" >
																<option >Select State</option>
															</select> -->
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="occupation.label" /></label>
									        	 		 <select disabled="disabled" id="occupation" class="form-control">
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
									                	  <select disabled="disabled" id="customerType" name ="customerType" class="form-control" >
									                	  	<option value="-- Select --" >-- Select --</option>
									                	   <option value="SILVER" ${offerBean.customerFilter.customerType == "SILVER" ? 'selected' : ''}>SILVER</option>
									                	 	<option value="GOLD" ${offerBean.customerFilter.customerType == "GOLD" ? 'selected' : ''}>GOLD</option>
									                	  	<option value="PLATINUM" ${offerBean.customerFilter.customerType == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
									                	  	<option value="PREMIUM" ${offerBean.customerFilter.customerType == "PREMIUM" ? 'selected' : ''}>PREMIUM</option>
									                	  	<option value="PLUS" ${offerBean.customerFilter.customerType == "PLUS" ? 'selected' : ''}>PLUS</option>
									                	  	<option value="BASIC" ${offerBean.customerFilter.customerType == "BASIC" ? 'selected' : ''}>BASIC</option>
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
									        	 	
									        	 	
									        	 	
									        	 	
									        	 	
									        	 </div>
									        	 
									        	  <div class="col-lg-12">
									        	 	<div class="form-group col-lg-4" style="padding-left:0px">
									        	 		 <label><spring:message code="sales.zone.label" /></label>
									        	 		 <select disabled="disabled" id="salesZone" class="form-control">
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
									        	 		 <select disabled="disabled" id="incomeGroup" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Lower Income"  ${offerBean.customerFilter.incomeGroup == "Lower Income" ? 'selected' : ''}>Lower Income</option>
															<option value="Middle Income" ${offerBean.customerFilter.incomeGroup == "Middle Income" ? 'selected' : ''}>Middle Income</option>
															<option value="High Net worth Individual" ${offerBean.customerFilter.incomeGroup == "High Net worth Individual" ? 'selected' : ''}>High Net worth Individual</option>
															<option value="Ultra-Rich" ${offerBean.customerFilter.incomeGroup == "Ultra-Rich" ? 'selected' : ''}>Ultra-Rich</option>
									        	 		 </select>
									        	 	</div>
									        	 </div>
									        	 
									        	 <%--  <div class="row">
									        	 	<div class="form-group col-lg-6">
									        	 		  <label><spring:message code="children.label" /></label>
									                	  <select disabled="disabled" id="children" class="form-control" >
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
									        	 		 <select disabled="disabled" id="occupation" class="form-control">
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
									        	 <%--  <div class="row">
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="income.group.label" /></label>
									        	 		 <select disabled="disabled" id="incomeGroup" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Lower Income"  ${offerBean.customerFilter.incomeGroup == "Lower Income" ? 'selected' : ''}>Lower Income</option>
															<option value="Middle Income" ${offerBean.customerFilter.incomeGroup == "Middle Income" ? 'selected' : ''}>Middle Income</option>
															<option value="High Net worth Individual" ${offerBean.customerFilter.incomeGroup == "High Net worth Individual" ? 'selected' : ''}>High Net worth Individual</option>
															<option value="Ultra-Rich" ${offerBean.customerFilter.incomeGroup == "Ultra-Rich" ? 'selected' : ''}>Ultra-Rich</option>
									        	 		 </select>
									        	 	</div>
									        	</div>  --%>
									           </div>
											   <div class="col-lg-6" >
											   <div class="row">
										           <div class="col-lg-12">
										           	<div class="form-group col-lg-4">
									        	 		<label id="fromDateLabel"><spring:message code="deal_start_date.label" /></label>
									                	<input class="form-control calendar_icon" disabled readonly="readonly" value="${offerBean.customerFilter.start_date}" style="" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
									        	 	<div class="form-group col-lg-2"></div>
									        	 	<div class="form-group col-lg-6">
									        	 		 <label><spring:message code="customer.turnover.label" /></label>
									        	 		 <div class="row">
							        						<div class="col-lg-6" style="padding-right: 5px;">
									                            <input type="text" class="form-control" id="startPrice" disabled  value="${offerBean.customerFilter.startPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
							        						</div>
							        						<div class="col-lg-6" style="padding-left: 5px;">
									                            <input type="text" class="form-control" id="endPrice" disabled  value="${offerBean.customerFilter.endPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
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
									                	<input class="form-control calendar_icon" disabled readonly="readonly"  value="${offerBean.customerFilter.end_date}" style="" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
									        	 	
									        	 	<div class="form-group col-lg-2"></div>
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="purchase.channel.label" /></label>
									                	  <select id="purchaseChannel" disabled class="form-control" >
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
									        <%-- 	 <div class="row">
									        	 	<div class="form-group col-lg-6">
									        	 		 <label><spring:message code="customer.turnover.label" /></label>
									        	 		 <div class="row">
							        						<div class="col-lg-6" style="padding-right: 5px;">
									                            <input type="text" readonly="readonly" class="form-control" id="startPrice"  value="${offerBean.customerFilter.startPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
							        						</div>
							        						<div class="col-lg-6" style="padding-left: 5px;">
									                            <input type="text" readonly="readonly" class="form-control" id="endPrice"  value="${offerBean.customerFilter.endPrice}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
							        						</div>
							        					</div>
									        	 	</div>
									        	 	<div class="form-group col-lg-6">
									        	 		 <label><spring:message code="product.label" /></label>
									        	 		 <input type="text" readonly="readonly" class="form-control searchItems"  value="${offerBean.customerFilter.product}" placeholder="<spring:message code="search.product.label" />" />
															<!-- <div class="services">
												    			<div class="items">
												     				<ul class="matchedStringUl product" style=""></ul>
												   				</div>
															</div> -->
															<input type="hidden" id="product" value="${offerBean.customerFilter.product}" >
															 <!-- <select id ="product" class="form-control" >
																<option value="-- Select --" >-- Select --</option>
															</select> -->
									        	 	</div>
									        	 </div>  
 --%>									        	  <div class="row">
									        	  <div class="col-lg-12">
									        	 <div class="form-group col-lg-4">
										        	 <label><spring:message code="customer.rating.label" /></label>
								                	  <select disabled id="customerRating" class="form-control" >
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
									        	 		 <select disabled id="referrals" class="form-control">
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
									        	       	         	<%--   <div class="row">
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
                      </div> 
									 --%>      
									 
									 
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
									 
									  <%--  	 <div class="row" style="font-size: 15px;">
									        	 	<div class="form-group col-lg-6" style="margin-top: 5px;">
									        	 		<br>
									        	 		<c:if test="${offerBean.customerFilter.applyRoolsEngine == true}">
									             			<input type="checkbox" disabled="disabled"  checked="checked" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
									        	 		</c:if>
									        	 		<c:if test="${offerBean.customerFilter.applyRoolsEngine != true}">
									        	 			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
									        	 		</c:if>
									        	 	</div>
							             		</div>    --%>              
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
                                            <input type="text" class="form-control" name="offerName" id="offerName" placeholder="<spring:message code="offer_name_enter.label" />" readonly="readonly" value="${offerBean.offerName }" />
                                            <span id="offerNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <br>
                                            <label><spring:message code="deal_start_date.label" /> <span class="requiredField">*</span></label>
                                             <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="offerStartDate" id="offerStartDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask readonly="readonly" value="${offerBean.offerStartDate}"/>
                                        </div><!-- /.input group -->
                                          <span id="offerStartDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group span22">
									    <label><spring:message code="offer_category.label" />  <span class="requiredField">*</span></label>
                                          <select class="form-control" name="offerCategory" id="offercategory" disabled="disabled">
                                           <!--  <option value="turnoverdeal">Turn Over(Bill Amount) Deal</option> -->
                                           <option value="itemspecificdeal" ${offerBean.offerCategory == "item_specific" ? 'selected' : ''}>Item Specific Offer</option>
                                            <option value="turnover" ${offerBean.offerCategory == "turn_over" ? 'selected' : ''}>Total Bill(Turn Over) Offer</option>
                                          	 <option value="group_turn_over" ${offerBean.offerCategory == "group_turn_over" ? 'selected' : ''}>Group (Turn Over) Offer</option>
                                          </select>
                                            <br>
                                             <label><spring:message code="deal_end_date.label" /> <span class="requiredField">*</span></label>
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="dealenddate" id="offerEndDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask readonly="readonly" value="${offerBean.offerEndDate}"/>
                                            <!-- <input type="text" name="offerEndDate" id="offerEndDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                        </div><!-- /.input group -->
                                          <span id="amountError" style="text-align:right;color:red;font-weight:bold;"></span>
									  </div>
									  
									  <div class="form-group span22">
                                              <label><spring:message code="offer_prioroty.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="priority" id="offercategory" disabled="disabled">
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
                                                <input type="text" class="form-control timepicker" readonly="readonly" value="${offerBean.offerStartTime}" name="startTime" id="startTime"/>
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
                                               <input type="text" name="endTime"  readonly="readonly" value="${offerBean.offerEndTime}" class="form-control timepicker" id="endTime"/>
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
											rows="1" style="resize: none;" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Item Price">${offerBean.maxPrice}</textarea>
										 <span id="lanaguageError" style="text-align: right; color: red; font-weight: bold;"></span>
										<br>
										<label>Min Price</label> 
										<textarea class="form-control" name="minPrice" id="minPrice"
											rows="1" style="resize: none;" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Item Price">${offerBean.minPrice}</textarea>
										 <span id="lanaguageError" style="text-align: right; color: red; font-weight: bold;"></span>
									</div>
                                        
                                        <div class="form-group span22">
                                        <div class="col-lg-6" style="padding-left:0px;">
                                        <label>Total Bills</label>
                                        <textarea class="form-control" name="noOfClaims" id="noOfClaims"
											rows="1" style="resize: none;" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Total Bills">${offerBean.customerFilter.noOfClaims }</textarea>
                                         
                                        </div>
                                        <div class="col-lg-6" style="padding:0px;">
                                        <label>Bills/Day</label>
										<textarea class="form-control" readonly="readonly" name="billsPerDay" id="billsPerDay"
											rows="1" style="resize: none;" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="Bills/Day">${offerBean.numberBillsPerDay}</textarea>
                                        </div>
                                        	
										 <br>
                                          <div class="col-lg-12" style="padding:0px;margin-top: 20px;">
											 <label><spring:message code="offer_description.label" /></label>
                                            <textarea style="resize:none;" readonly="readonly" class="form-control" name="offerDescription" id="offerDesc" rows="1" placeholder="<spring:message code="offer_desc_enter.label" />">${offerBean.offerDescription }</textarea>
                                        </div>
                                        </div>
                                    <!--  </div> -->
									  <div class="form-group span22">
                                   	  	   <label><spring:message code="location.label" /></label>
		                                        <select class="form-control" style="height: 96px;" name="location" id="offerLocation" multiple="multiple" disabled="disabled">
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
									<div class="col-md-8" style="   margin-top: 6px;    margin-left: 30px;">
                                      	<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      		<c:if test="${offerBean.day1 == true }">
                                      			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
                                      		</c:if>
                                      		<c:if test="${offerBean.day1 == false }">
                                      			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
                                      		</c:if>
                                      	</div>
                                      	<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                   			<c:if test="${offerBean.day2 == true }">
                                    			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />
                                    		</c:if>
                                    		<c:if test="${offerBean.day2 == false }">
                                    			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />
                                    		</c:if>
                                      	</div>
                                   		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                   			<c:if test="${offerBean.day3 == true }">
                                      			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
                                      		</c:if>
                                      		<c:if test="${offerBean.day3 == false }">
                                      			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
                                      		</c:if>  
                                   		</div>
                                   		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                   			<c:if test="${offerBean.day4 == true }">
                                      			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
                                      		</c:if>
                                      		<c:if test="${offerBean.day4 == false }">
                                      			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
                                      		</c:if> 
                                   		</div>
										
                                      		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      			<c:if test="${offerBean.day5 == true }">
	                                      			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp;&nbsp; <spring:message code="thursday.label" />
	                                      		</c:if>
	                                      		<c:if test="${offerBean.day5 == false }">
	                                      			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp;&nbsp; <spring:message code="thursday.label" />
	                                      		</c:if>  
                                      		</div>
                                      		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      			<c:if test="${offerBean.day6 == true }">
	                                      			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
	                                      		</c:if>
	                                      		<c:if test="${offerBean.day6 == false }">
	                                      			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
	                                      		</c:if>  
                                      		</div>
                                      		<div class="form-group col-lg-1 span2" style="padding: 0px;">
                                      			<c:if test="${offerBean.day7 == true }">
	                                      			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
	                                      		</c:if>
	                                      		<c:if test="${offerBean.day7 == false }">
	                                      			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
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
												<c:if test="${offerBean.allowExchanges == true }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" checked
													style="vertical-align: -2px" id="applyExchanges" disabled/>&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
												</c:if>
												
												<c:if test="${offerBean.allowExchanges == false }">
												<input type="checkbox"
													onclick="setBatchStatus(this);"
													style="vertical-align: -2px" id="applyExchanges" disabled/>&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.exchanges.label" />
												</c:if>
												
											</div>
										
										
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${offerBean.allowReturns == true }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" checked
													style="vertical-align: -2px" id="applyReturns" disabled/>&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
												</c:if>
												<c:if test="${offerBean.allowReturns == false }">
												<input type="checkbox"
													onclick="setBatchStatus(this);" 
													style="vertical-align: -2px" id="applyReturns" disabled/>&nbsp;&nbsp;&nbsp;
												<spring:message code="allow.returns.label" />
												</c:if>
											</div>
											
													
										<div class="form-group col-lg-4" style="margin-top: -20px;">
												<br> 
												<c:if test="${offerBean.salePriceBased == true }">
												<input type="checkbox"
													 checked
													style="vertical-align: -2px" id="applysaleprice" disabled/>&nbsp;&nbsp;&nbsp;
												Sale price based
												</c:if>
												<c:if test="${offerBean.salePriceBased == false }">
												<input type="checkbox"
													
													style="vertical-align: -2px" id="applysaleprice"  disabled/>&nbsp;&nbsp;&nbsp;
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
                            <div style="border: 1px solid rgb(181,230,29); margin: -15px -5px; padding:5px;">
						  
						    <div style=" opacity: 1.5; pointer-events: none;">
						   <div class="row">
							   <div class="form-group col-lg-12" >
									   		<c:choose>
							    <c:when test="${offerBean.productSpecificFlag==true}">
									   		
									   			<input type="radio" checked="checked" onchange="toggleBased('basedOnProduct')" name="configureBasedItems" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                               </c:when> 
                                      		<%-- <c:if test="${empty offerBean.sellGroupId && offerBean.applyForAllItems == false}"> --%>
                                      		<c:otherwise>
                                      		<input type="radio" name="configureBasedItems"  onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                      		</c:otherwise>
                                 </c:choose>
                            </div> 
                            
                            
                            
                            <div class="row">
										<div class="form-group col-lg-12">
											<div class="form-group col-lg-3"
												style="border-left: 1px solid lightgray;margin-left: 18px;; padding-right: 58px; margin-right: -18px;">

												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message
																code="product.category.label" /></label> <select
															class="form-control basedOnProduct saleGroups"
															style="background: white;"
															onchange="searchSubCategoriesBasedOnCategory('saleCategory','sale_sub_category')"
															name="category" id="saleCategory">
															<option value="-- Select --">-- Select --</option>
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
															id="sale_section">
															<option value="${offerBean.productSection}">${offerBean.productSection}</option>

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
															style="background: white;" name="brand" id="sale_brand">
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
												
												
												
													
											<%-- <div class="form-group col-lg-12" style="margin-left: 1px;margin-top: -20px;">
												<br> 
												
												<c:choose>
												<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == true}">
												
												<input type="radio"
													onchange="toggleComboLowestProduct('applyForAllItemsProduct')" checked
													style="vertical-align: -2px" id="applyForAllItemsProduct" />
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
												<input type="checkbox"
													onchange="toggleComboLowestProduct('applyForAllItemsProduct')"
													style="vertical-align: -2px" id="applyForAllItemsProduct" />
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												
												</c:choose>
												
											</div> --%>
										
												
</div>

											
                            
                            
                          <%--   <div class="row">
									<div class="form-group col-lg-3" style="margin-top: -25px;">
					        	 		 <label><spring:message code="sale_product_category.label" /></label>
                                            <select class="form-control basedOnProduct" disabled="disabled" style="background: white;" name="category" id="saleCategory">
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
                                           <select class="form-control basedOnProduct" disabled="disabled" style="background: white;" name="sub_category" id="sale_sub_category">
                                           		<option value="-- Select --" >-- Select --</option>
                                           		<c:forEach var="subCategory" items="${saleSubCategoryList}">
	                                              <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == offerBean.productSubCategory ? 'selected' : ''}>${subCategory.subcategoryDescription}</option>
												</c:forEach>
                                           </select>
                                        </div>	 --%>
                                        
                                        
                                        
                                        <div class="form-group col-lg-9"
												style="margin-top: -22px; border-left: 1px solid #ccc;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;">
													<c:choose>
														<c:when test="${offerBean.productSpecificFlag == true &&  offerBean.offerProducts[0].exclusionItem==false}">
													      <input type="radio" onchange="toggleItemComplexBased('itemDisountBased')"
														     style="vertical-align: -2px" checked id="itemDisountBased">&nbsp;
													          <spring:message code="itemwise.discounts.label" />
													    </c:when>
													    <c:otherwise>
														<input type="radio" onchange="toggleItemComplexBased('itemDisountBased')"
														style="vertical-align: -2px"  id="itemDisountBased">&nbsp;
													         <spring:message code="itemwise.discounts.label" />
														</c:otherwise>
														</c:choose>
													</div>
                                        
                                        
                                        
                                        <div class="form-group col-lg-12" style="margin-left: 20px;">
													<input type="text"
														class="form-control searchItems basedOnProduct saleGroups searchBar"
														id="offersellskus"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; border-radius: 7px !important" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellskus"
																style="width: 230px;"></ul>
														</div>
													</div>
													<div
														style="overflow-x: auto; margin-bottom: 15px; margin-top: -5px">
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
																	 <th width="15%;"><spring:message code="minQty.label" /></th>
																	<th width="20%;"><spring:message code="discount.type.label" /></th>
																	<th><spring:message code="reward.quantity.label" /></th>
																	<th><spring:message code="item.amount.label" /></th>
                                                                   
																</tr>
															</thead>
															<tbody style="text-align: center;">
															
															<c:if test="${offerBean.productSpecificFlag == true}">
															  <c:forEach var="offerProducts" items="${offerBean.offerProducts}" varStatus="theCount">
															   <c:if test="${offerProducts.exclusionItem == false}">
                                                                   <tr id="dynamicdiv">
                       		                                     <td class="slno" id="itemno" style="width: 10%">${theCount.count}</td>
                       		                                       <input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       		                                       <td  id="itemCode${theCount.count}" style="width: 10%">${offerProducts.skuId }</td>
                                                                   <td  id="itemDesc${theCount.count}" style="width: 15%">${offerProducts.itemDesc }</td>
                                                                  <td id="ean${theCount.count}" style="width: 15%">${offerProducts.ean} </td>
                                                                  <td id="size${theCount.count}" style="width: 12%">${offerProducts.size}</td>
                                                                    <td><input id="minQty${theCount.count}" style='width: 40%;' type='text' class='minQty' value="${offerProducts.minPurchaseQty}" ></td>
                                                                   <td id="size${theCount.count}">${offerProducts.discountType}</td>
                                                                    <td><input id="rewardQtyProduct${theCount.count}" style='width: 85%;' type='text' class='rewardQtyProduct' value="${offerProducts.rewardQty}" ></td>
                                                                  <td id="amount${theCount.count}">${offerProducts.rewardValue }</td>
                                                                 
                       	                                           </tr>
                       	                                           </c:if>
                                                             </c:forEach>
							                                </c:if>		
														</tbody>
														</table>
													</div>
												</div>
        

												<div class="form-group" style="margin-top: 1px; margin-bottom: 4px;">
												<c:choose>
													<c:when test="${offerBean.productSpecificFlag == true && offerBean.offerProducts[0].exclusionItem==true}">
													<input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')" checked 	 name="basedOnproductCheck"													style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:when>
													<c:otherwise>
													<c:choose>
													<c:when test="${offerBean.productSpecificFlag == true && empty offerBean.offerProducts}">
													<input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')" checked 	 name="basedOnproductCheck"													style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:when>
													<c:otherwise>
													<input type="radio" onchange="toggleItemComplexBased('complexDisountBased')"  name="basedOnproductCheck"
														style="vertical-align: -2px" id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:otherwise>
													</c:choose>
													</c:otherwise>
													</c:choose>
													<%-- <c:if test="${offerBean.productSpecificFlag == true}">
													<input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')"
														style="vertical-align: -2px" checked id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:if>
													<c:if test="${offerBean.productSpecificFlag == false}">
													<input type="radio" 
														onchange="toggleItemComplexBased('complexDisountBased')"
														style="vertical-align: -2px"  id="complexDisountBased">&nbsp;
													<spring:message code="complex.discounts.label" />
													</c:if> --%>
												</div>

												<div class="row">
													<div class="col-lg-12" style="margin-left: 20px">
														<div class="form-group col-lg-2"  style="width:20%">
															<label><spring:message
																	code="offer_reward_type.label" /> <span
																class="requiredField">*</span></label> <select
																class="form-control" name="offerReward" id="offerReward"
																onchange="toggleRepeat('offerReward')">
																<option value="ALL"  ${dealranges.rangeRewardType == "ALL" ? 'selected' : ''}>ALL</option>
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
														
														
														<div class="form-group col-lg-2"  style="width:20%">
															<label><spring:message
																	code="rewardCriteria.label" /></label> <select
																class="form-control" name="offerReward" id="offerRewardCriteria"
																onchange="toggleRepeat('offerReward')">
																<option value="false"${'false' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>Quantity Based</option>
																<option value="true"${'true' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>TurnOver Based</option>
															</select>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														</div>
														
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px;padding-left: 1px;   width: 25%;white-space:nowrap">
															<br> <c:if test="${offerBean.allowMultipleDiscounts == true }">
															<input type="checkbox" checked="checked"
																style="vertical-align: -2px" id="allownMulDiscProduct" /><spring:message code="allow.multiple.discount.label" />
																</c:if>
															
														<c:if test="${offerBean.allowMultipleDiscounts == false }">
															<input type="checkbox" 
																style="vertical-align: -2px" id="allownMulDiscProduct" /><spring:message code="allow.multiple.discount.label" />
																</c:if>
														</div>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; margin-left: -45px; padding-right: 0px;white-space:nowrap">
															<br> <c:if test="${offerBean.repeat == true }"> 
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
														<%-- <div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-right: 0px;margin-left: -34px;white-space:nowrap">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('isCombo')"
																style="vertical-align: -2px" id="isCombo" />
															<spring:message code="is.combo.label" />
														</div> --%>
														<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px; padding-left: 1px; padding-right: 0px;white-space:nowrap">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('lowestPriceItem')"
																style="vertical-align: -2px" id="lowestPriceItem" />
															<spring:message code="lowest.price.item.label" />
														</div>
												
													
												
										</div>
													
												</div>
                              
												<div id="row">
													<div class="table-responsive"
														style="overflow: auto;white-space: nowrap;margin-left: 30px;margin-top:2px">
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
																</tr>
															</thead>
															<tbody style="text-align: center;">
																<c:if test="${offerBean.productSpecificFlag == true && offerBean.offerProducts[0].exclusionItem==true}">
																 <c:forEach var="dealranges" items="${offerBean.offerRangesList}">
                                                                    <tr>
                       		                                         	<td>${offerBean.productCategory}/${offerBean.productDepartment}/${offerBean.brand} </td>
                                                                      <td style="width: 15%">${dealranges.minimumPurchaseQuantityString }</td>
                                                                      <td style="width: 15%">${dealranges.minimumPurchaseamountString }</td>
                                                                      <td style="width: 12%">${dealranges.rewardValueString }</td>
                                                                       <td style="width: 15%">${dealranges.startPrice}</td>
                                                                       <td style="width: 15%">${dealranges.endPrice}</td>
                       	                                              </tr>
                                                                    </c:forEach>
                                                                   </c:if> 
                                                                   
                                                                   <c:if test="${offerBean.productSpecificFlag == true && empty offerBean.offerProducts}">
																 <c:forEach var="dealranges" items="${offerBean.offerRangesList}">
                                                                    <tr>
                       		                                         	<td>${offerBean.productCategory}/${offerBean.productDepartment}/${offerBean.brand} </td>
                                                                      <td style="width: 15%">${dealranges.minimumPurchaseQuantityString }</td>
                                                                      <td style="width: 15%">${dealranges.minimumPurchaseamountString }</td>
                                                                      <td style="width: 12%">${dealranges.rewardValueString }</td>
                                                                       <td style="width: 15%">${dealranges.startPrice}</td>
                                                                       <td style="width: 15%">${dealranges.endPrice}</td>
                       	                                              </tr>
                                                                    </c:forEach>
                                                                   </c:if> 
															</tbody>
														</table>
													</div>
												</div>
												
												<div class="col-lg-12" style="margin-left: 20px;">
											<label>Exclude Category Items</label>
														<div class="col-lg-11" style="    margin-left: -18px;">
													<input type="text"
														class="form-control searchItems basedOnProduct searchBar itemWiseDiscount"
														id="offersellskusExclude"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd; " />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl offersellskusExclude"
																style="width: 230px;"></ul>
														</div>
													</div>
													</div>
													
											<div class="col-lg-1" style="margin-left: 18px;padding-right: 1px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 18px;     float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
													</div>
													
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
									
							<div class="form-group col-lg-12" style="margin-top: -35px;">
									   		<c:choose>
												<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == true}">
												
												<input type="radio"
													style="vertical-align: -2px" />
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
												<input type="radio"
													
													style="vertical-align: -2px" />
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												
									</c:choose>
                            </div> 
									
									
									
                                 </div>       
                                        
                               <%--          
                                	<div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="product_id.label" />  <span class="requiredField">*</span></label>
									       <input type="text" name="minPayAmount" list="productList" class="form-control"  name="searchCriteria" id="searchCriteria" size="250" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" readonly="readonly"/>
                                          <datalist id="productList" style="position:absolute;">
                                          </datalist>
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
		                                        	 <tr>
		                                        	 		<td>${sellProducts}</td>
		                                                <th><spring:message code="action.label"/></th>
		                                        	 </tr>
		                                        	</c:forEach>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
                                    
                                     <div class="form-group col-lg-3" style="margin-top: -25px;">
							     <label><spring:message code="buy_sku_id.label" /></label>
							        <input type="text" readonly="readonly" class="form-control searchItems basedOnProduct" id="offersellskus" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl offersellskus" style="width: 230px;"></ul>
						   				</div>
									</div>
									<div style="overflow-x : auto;margin-bottom: 15px;">
                                         <table id="offerSaleSkus" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
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
                                              </tbody>
                                        </table>
                                        </div>
							  </div>
							  </div> --%>
							  </div>
							  
							  
							  <div style=" opacity: 1.5; pointer-events: none;">
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
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                </div>       
						    <div class="row">
						    <div class="form-group col-lg-12" style="">
										<div class="form-group col-lg-3" style="width: 24%;margin-left: 5px;height: 300px;margin-top: -25px;border-left: 1px solid lightgray;">
											<div class="form-group col-lg-12" style="">
									     <label><spring:message code="sale_group_id.label" /></label>
									        <input type="text" class="form-control searchItems basedOnGroup" readonly="readonly" id="saleGroup" placeholder="<spring:message code="enter.group.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroup" style="width: 190px;"></ul>
								   				</div>
											</div>
									      <div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th style="width:100px;"><spring:message code="sale_group_id.label"/></th>
                                                <%-- <th><spring:message code="action.label"/></th> --%>
                                            </tr>
                                          </thead>
                                                <tbody style="text-align: center;">
                                                	<c:if test="${not empty offerBean.sellGroupId}">
		                                                <tr>
		                                        	 		<td>${offerBean.sellGroupId}</td>
		                                        	 	</tr>
                                        		 	</c:if>
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									<div class="form-group col-lg-12" style="">
									     <label><spring:message code="buy_sku_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup" readonly="readonly" id="saleGroupSkuSearch" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroupSku" style="width: 190px;"></ul>
								   				</div>
											</div>
											<div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupSku" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<%-- <th><spring:message code="plucode.label"/></th> --%>
                                                <%-- <th><spring:message code="action.label"/></th> --%>
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                 <tr style="text-align: center;">
                                               
                                               <c:forTokens items="${offerBean.sellSkuids}" delims="," var="sellSkus">
                                               <%--   <c:forEach var="sellSkus" items="${offerBean.sellSkuids}" varStatus="theCount"> --%>
                                        	 		<td>${sellSkus}</td>
                                        	 		<c:if test="${theCount.count % 2 == 0 }">
			                                        	 </tr>
			                                        	 <tr>
                                        	 		</c:if>
                                               	<%-- </c:forEach> --%>
                                              </c:forTokens>
                                               
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  
									  
									  
									  
											<%-- <div class="form-group col-lg-12" style="margin-left: 9px;margin-top: -20px;">
												<br> 
												<c:choose>
												<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == false}">
												
												<input type="radio"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" checked />
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
												<input type="radio"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup"  />
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												</c:choose>
											</div> --%>
											
										</div>
									  
									  
								
								
								
								<br>
								
								
								
								<div class="form-group col-lg-9"
												style="margin-top: -22px; border-left: 1px solid #ccc;">

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
																style="width: 230px;"></ul>
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
                                                                   
																</tr>
															</thead>
														<tbody style="text-align: center;">
															<c:if test="${offerBean.productSpecificFlag == false}">
                                                               <c:forEach var="offerProducts" items="${offerBean.offerProducts}" varStatus="theCount">
                                                                  <tr>
                       		                                     <td class="slno" id="itemno" style="width: 10%">${theCount.count}</td>
                       	                                        	<input type="hidden" id="itemno${theCount.count}" value="${offerProducts.sno}" />
                       		                                       <td style="width: 10%">${offerProducts.skuId }</td>
                                                                   <td style="width: 15%">${offerProducts.itemDesc }</td>
                                                                  <td id="ean${theCount.count}" style="width: 15%">${offerProducts.ean} </td>
                                                                 <td id="size${theCount.count}" style="width: 12%">${offerProducts.size}</td>
                                                                  <td id="size${theCount.count}">${offerProducts.discountType}</td>
                                                                  <td><input id="minQty${theCount.count}" style='width: 85%;' type='text' class='minQty' value="${offerProducts.minPurchaseQty}" ></td>
                                                                    <td id="amount${theCount.count}">${offerProducts.rewardValue }</td>
                                                                   
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
														onchange="toggleItemComplexBased('complexbasedOnGroup')" checked 	 name="basedOngroupCheck"													style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
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
								
								
								 <div class="row">
								 <div class="col-lg-12" style="margin-left: 15px">
								 	<div class="form-group col-lg-2"  style="">
                                        	<label><spring:message code="offer_reward_type.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="priority" id="offerReward" onchange="allowOffer()" disabled="disabled">
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
                                    
                                    
                                    <div class="form-group col-lg-2" style="white-space: nowrap;">
														
															<label><spring:message
																	code="rewardCriteria.label" /></label> <select
																class="form-control" name="offerReward" id="offerRewardCriteriaGroup"
																onclick="toggleRewardCriteria('offerRewardCriteriaGroup')">
																<option value="false"${'false' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>Quantity Based</option>
																<option value="true"${'true' == offerBean.priceBasedConfigurationFlag ? 'selected' : ''}>TurnOver Based</option>
															</select>
															<%--  <img style="width:225px;height:118px;margin-top:-20px;margin-left: 11px;" id="viewOfferbannerImage" src="${pageContext.request.contextPath}/images/no-image.gif"/> --%>
														
														</div>
                                    
                                	<div class="form-group col-lg-2"
															style="text-align: center; margin-top: 4px;padding-left: 1px;white-space:nowrap">
                                		<br>
                               			<c:if test="${offerBean.allowMultipleDiscounts == true }">
		                        			<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
		                       			</c:if>
		                       			<c:if test="${offerBean.allowMultipleDiscounts == false }">
		                        			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />
		                       			</c:if>
                                	</div>
                                	<div class="form-group col-lg-2" style="text-align: center; margin-top: 5px; margin-left:5px; padding-right: 0px;white-space:nowrap">
                                		<br>
                                		<c:if test="${offerBean.repeat == true }">
                              				<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="isRepeat"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.repeat.label" />
                              			</c:if>
                              			<c:if test="${offerBean.repeat == false }">
                              				<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="isRepeat"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.repeat.label" />
                              			</c:if>
                               		</div>
                               	<div class="form-group col-lg-2" style="text-align: center; margin-top: 4px; padding-right: 0px;margin-left: -25px;white-space:nowrap">
                                		<br>
                                		<c:if test="${offerBean.combo == true }">
                              				<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="isCombo"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.combo.label" />
                              			</c:if>
                              			<c:if test="${offerBean.combo == false }">
                              				<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="isCombo"/>&nbsp;&nbsp;&nbsp; <spring:message code="is.combo.label" />
                              			</c:if>
                               		</div>
                               		<div class="form-group col-lg-2" 	style="text-align: center; margin-top: 4px; padding-left: 1px; padding-right: 0px;white-space:nowrap">
                                		<br>
                                		<c:if test="${offerBean.lowestPriceItem == true }">
                              				<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px" id="lowestPriceItem"/>&nbsp;&nbsp;&nbsp; <spring:message code="lowest.price.item.label" />
                              			</c:if>
                              			<c:if test="${offerBean.lowestPriceItem == false }">
                              				<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="lowestPriceItem"/>&nbsp;&nbsp;&nbsp; <spring:message code="lowest.price.item.label" />
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
                               	
                               	 	<div class="row" style="font-size: 15px;margin-left: 20px;">
											<%-- <div class="form-group col-lg-4" style="margin-left: 9px;margin-top: -20px;">
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
											</div> --%>
											
										</div> 
                               	
                      <div id="row" style="overflow: auto;white-space: nowrap;margin-left: 45px;">
   					 <div>
                     <%--    <label style="font-weight:bold;"><spring:message code="offer_slabs.label" /> </label> --%>
                       <hr style="margin-top: 1px;">  
                      </div> 
                              
                  	<div class="table-responsive" style="margin-top:-22px;overflow: auto;white-space: nowrap;">
                     <table id="slabsList" class="table table-bordered table-hover"  style="margin-top: 1px;width: 100%;">
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
                        <c:if test="${offerBean.productSpecificFlag == false}" >
                         <c:forEach var="dealranges" items="${offerBean.offerRangesList}">
                           <tr>
                       		 <td style="width: 10%">${dealranges.groupId }</td>
                       		 <td style="width: 10%">${dealranges.itemId }</td>
                             <td style="width: 15%">${dealranges.minimumPurchaseQuantityString }</td>
                             <td style="width: 15%">${dealranges.minimumPurchaseamountString }</td>
                              <td style="width: 12%">${dealranges.rangeRewardType }</td>
                             <td style="width: 12%">${dealranges.rewardValueString }</td>
                             <td style="width: 12%">${dealranges.rewardQty }</td>
                             <td style="width: 12%">${dealranges.rangeMode }</td>
                             <td style="width: 15%">${dealranges.description }</td>
                       	   </tr>
                         </c:forEach>
                         </c:if>
			 	</tbody>
                    </table>
                 </div>
                 </div> 
                 </div>
                 </div>
              </div>
              </div>
               <div class="row">
			   						<div class="form-group col-lg-12" style="margin-top: -3%;">
									   <c:choose>
												<c:when test="${offerBean.applyForAllItems == true && offerBean.productSpecificFlag == false}">
												
												<input type="radio"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" />
												<spring:message code="applyforAllitems.label" />
												</c:when>
												<c:otherwise>
												<input type="radio"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px"  />
												<spring:message code="applyforAllitems.label" />
												
												</c:otherwise>
												</c:choose>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                </div>   
              
              
              </div> 
              </div>  
                 <br>
                 <div class="row" style="">
               					<%-- <div class="form-group col-lg-3" style="">
                                       <label id="offerBannerLabel"><spring:message code="offer_banner.label" /></label><br>
                                	  	<c:if test="${offerBean.bannerImg == true }">
		                        			<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
		                       			<c:if test="${offerBean.bannerImg == false }">
		                        			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
                                        <div class="icon-remove blue delete" title="Offer Banner" id="offerBanner_image">
										<c:if test="${not empty offerImage}">
											<img class="thumbnail" id="offerBanner_thumbnail" src="${offerBean.offerImage}" style="width:80px;height:80px;"/>
										</c:if>
										</div>
                                  </div> --%>
                                 <div class="col-lg-12"> 
                                  <div class="row">      
                                   <div class="form-group col-lg-2"> 
                                         <label><spring:message code="deal_status.label" /></label>
                                         <c:if test="${offerBean.offerStatus == 'ACTIVE'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" id="offerStatus" name="offerStatus" disabled="disabled" value=true checked>
                                                    <spring:message code="deal_enable.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="offerStatus" name="offerStatus" disabled="disabled" value=false>
                                                   <spring:message code="deal_disable.label"/>
                                                </label>
                                            </div>
                                           </c:if>
                                           <c:if test="${offerBean.offerStatus == 'INACTIVE'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" id="offerStatus" disabled="disabled" name="offerStatus" value=true >
                                                    <spring:message code="deal_enable.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" id="offerStatus" disabled="disabled" name="offerStatus" checked value=false >
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
                                                    <input type="radio" name="loyaltyPoints" disabled="disabled" value=true checked >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" disabled="disabled" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                           
                                      <c:if test="${offerBean.claimLoyaltypoints == 'false'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" disabled="disabled" value=true  >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=false disabled="disabled" checked>
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
                                                    <input type="radio" name="giftvouchers" value=true disabled="disabled" checked >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="giftvouchers" disabled="disabled" value=false >
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                            <c:if test="${offerBean.claimgiftvouchers == 'false'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="giftvouchers" disabled="disabled" value=true  >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="giftvouchers" disabled="disabled" value=false checked >
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
                                                    <input type="radio" name="coupons" disabled="disabled" value=true checked >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                           
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="coupons"disabled="disabled"  value=false >
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </c:if>
                                          <c:if test="${offerBean.claimCoupons == 'false'}">
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="coupons" disabled="disabled" value=true  >
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                           
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="coupons" disabled="disabled" value=false checked >
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
                                       
                                        <div class="form-group col-lg-3" style="">
                                       <div class="row">
                                        <div class="address-details col-lg-6 col-xs-8">
                                       <label id="offerBannerLabel"><spring:message code="offer_banner.label" /></label><br>
                                	  	<c:if test="${offerBean.bannerImg == true }">
		                        			<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
		                       			<c:if test="${offerBean.bannerImg == false }">
		                        			<input type="checkbox" disabled="disabled" style="vertical-align: -2px" id="banner"/><spring:message code="use.as.banner.label" />
		                       			</c:if>
                                        <div class="icon-remove blue delete" title="Offer Banner" id="offerBanner_image">
										<c:if test="${not empty offerBean.offerImage}">
											<img class="thumbnail" id="offerBanner_thumbnail" src="${offerBean.offerImage}" style="width:80px;height:80px;"/>
										</c:if>
										</div>
                                  </div>
                                  </div>
                                 </div>      
                                       
                                        <div class="form-group col-lg-9" style="">
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.tag.line.label" /></label>
                                    	<textarea class="form-control" readonly="readonly" name="dealImageText" id="dealImageText" rows="1" style="resize: none;" placeholder="<spring:message code="display.tag.line.label" />" >${offerBean.offerImageText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    	
<%--                                     		<label><spring:message code="deal.image.text.font.label" /></label> --%>
                                                 <div class="col-lg-12"><br></div>
                                    		<input type="text" class="form-control" id="dealImageTextFontHidden" readonly="readonly"  value="${offerBean.offerImageTextFont}">
                                    		<!-- <select class="form-control" id="dealImageTextFont">
                                    		</select> -->
              
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" readonly="readonly" type="text" id="dealImageTextSize" value="${offerBean.offerImageSize}" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" readonly="readonly" id="dealImageTextColor" value="${offerBean.offerImageColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${offerBean.offerImageBold == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageBold != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageItalic == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageItalic != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageStrike == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerImageStrike != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
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
                                      
                                        <div class="form-group col-lg-3" style=""></div>
                                          <div class="form-group col-lg-9" style="">
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.sale.text.label" /></label>
                                    	<textarea class="form-control" readonly="readonly" name="saleText" id="saleText" rows="1" style="resize: none;" placeholder="<spring:message code="display.sale.text.label" />" >${offerBean.salePriceText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    	
<%--                                     		<label><spring:message code="deal.image.text.font.label" /></label> --%>
                                             <div class="col-lg-12"><br></div>
                                    		<input type="text" class="form-control" readonly="readonly" id="saleTextFontHidden" re value="${offerBean.salePriceFont}">
                                    		<!-- <select class="form-control" id="saleTextFont">
                                    		</select> -->
                                    	
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" readonly="readonly" type="text" id="saleTextSize" value="${offerBean.salePriceSize}" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="saleTextColor" readonly="readonly" value="${offerBean.salePriceColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${offerBean.salePriceBold == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceBold != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceItalic == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceItalic != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceStrike == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${offerBean.salePriceStrike != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
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
                                        <div class="form-group col-lg-3" style=""></div>
                                          <div class="form-group col-lg-9" style="">
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="display.deal.text.label" /></label>
                                    	<textarea class="form-control" readonly="readonly" name="dealText" id="dealText" rows="1" style="resize: none;" placeholder="<spring:message code="display.deal.text.label" />" >${offerBean.offerPriceText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    	
<%--                                     		<label><spring:message code="deal.image.text.font.label" /></label> --%>
                                             <div class="col-lg-12"><br></div>
                                    		<input type="text" class="form-control" readonly="readonly" id="dealTextFontHidden" value="${offerBean.offerPriceFont}">
                                    		<!-- <select class="form-control" id="dealTextFont">
                                    		</select> -->
                                    	
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" readonly="readonly" type="text" value="${offerBean.offerPriceSize}" id="dealTextSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="dealTextColor" readonly="readonly" value="${offerBean.offerPriceColor}" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${offerBean.offerPriceBold == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceBold != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceItalic == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceItalic != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceStrike == 0}">
	                                    		<input type="checkbox" disabled="disabled" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${offerBean.offerPriceStrike != 0}">
	                                    		<input type="checkbox" disabled="disabled" checked="checked" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
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
                                          
                                        
                                   
                                         
                            <!--added by manasa  -->
                           <!--  <input type="hidden" id="searchOffers" value=""> -->
				<input type="hidden" id="outletLocation" value="${offerObj.storeLocation}">
		 <input type="hidden" id="from" value="${offerObj.offerStartDate}">
        <input type="hidden" id="to" value="${offerObj.offerEndDate}">
         <input type="hidden" id="searchOffers" value="${offerObj.searchCriteria}">
        <input type="hidden" value="${offerObj.maxRecords}" id="maxRecords">
          <input type="hidden" id="offerStatusValue" value="${offerStatusValue}">
             <input type="hidden" id="zone" value="${zone}">
              <input type="hidden" id="offerType" value="${offerType}">
<!--          <input type="hidden" id="offerStatusValue" value="">  -->
				<!--added by manasa  -->
                             </div>                
                                              
						<div class="row" style="text-align: right;">
						 <c:if test="${offerBean.offerStatus == 'ACTIVE'}">
						 
                                 	 	
                           <input type="button" id="submit" style="position: relative;" class="btnCls" onclick="promotionPrint('${offerBean.offerID}','descriptionPrint')" value="<spring:message code="print.label" />" />
                         </c:if>        	 	
					  <c:if test="${sessionScope.role == 'super admin'}">
					  	 <input type="button" id="submit" style="" class="btnCls" onclick="editoffer('${offerBean.offerID}')" value="<spring:message code="edit.label" />" />
					  </c:if>	
					 <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}">
	                   <c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">
						 <input type="button" id="submit" style="" class="btnCls" onclick="editoffer('${offerBean.offerID}')" value="<spring:message code="edit.label" />" />
					  </c:if>
					 </c:forEach>
						<input type="button" class="btnCls" style="margin-left:1%;margin-right: 2%;" onclick="viewdealsandoffers('offers','','0')" value="<spring:message code="cancel.label" />" />
						</div>
						<%-- <span class="requiredField">${err}</span> --%>
				</div><!-- /.box-body -->
									
							
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                  <input type="hidden" id="taxList" value='' />
                                    
                                <input type="hidden" name="taxes" id="taxes" />
                               <%--  <input type="hidden" id="subCategories" value='${subCategories}' />
                                <input type="hidden" id="selectedSaleProductSubCategory" value='${offerBean.productSubCategory}' /> --%>
                                </form>
                            
</div>
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
        
 <script>
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