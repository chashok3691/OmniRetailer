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

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dealsAndOffers/deals.js"></script>
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
	 /* create one slab while loading */
	 	var dateTime = getCurrentDate();
	    var date = dateTime.split(' ');
	    date = date[0].split('/');
	    var formatedDate = date[2]+"/"+date[0]+"/"+date[1];
	    $('#dealStartDate').val(formatedDate);	 
	   // toggleItemSpecificsalePrice('dealcategory');
		/* var subCategories = $("#subCategories").val();
		var parsedJson = jQuery.parseJSON(subCategories);      */
		/* var category = $("#saleCategory").val();
		var subcategoryArray = new Array();
		subcategoryArray = parsedJson[category];
		if(subcategoryArray != undefined){
			var op = '';
			for(var i=0;i<subcategoryArray.length;i++){
				op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
			}
			$("#sale_sub_category").html(op);
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
			 
	 callCalender('fromDate');
	 callCalender('endDate');
	 $(".subBlock").hide();
	 $(".customer").css("display","block");
	 print_country("country");
	 callCalenderYYYYMMDD('dealStartDate');
	 callCalenderYYYYMMDD('dealEndDate');
	 callCalenderYYYYMMDD('closedOn');
	 /* callCalender('dealStartDate');
	 callCalender('dealEndDate');
	 callCalender('closedOn'); */
	// addSlab();
	 $("#dealImageTextFont").fontselect();
	 $("#saleTextFont").fontselect();
	 $("#dealTextFont").fontselect();
	 //toggleItemSpecific('dealcategory');
	 setDealSlabDivContent();
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
	 .requiredField{
	 	color: red;
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
    }
 .myFile {
 /*  position: relative;
  overflow: hidden;
  float: left;
  clear: left; */
}
.matchedStringUl {  
 z-index: 9 !important;
 } 
 .myFile input[type="file"] {
	  /* display: block;
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
                                <!-- form start -->
                                <form method="POST">
                                    <div class="box-body">
                                      <div class="row" style="text-align: right; margin-top: 10px;">
                                 	 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${error}</div>
                                 	 	<div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                 	 	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="createDeal()" value="<spring:message code="submit.label" />" />
                                   		<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
									
                                   <%-- <c:if test="${sessionScope.role == 'super admin'}">
                                   		<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
                                   </c:if>	  --%>	
									<%-- <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}">
	                            	<c:if test="${accessControl.appDocument == 'DealsConfiguration' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
									</c:if>
								   </c:forEach> --%>
                                 	 	<!-- <hr style="margin-top: 4px;width: 99%;" /> -->
									</div>  
                                       <input type="hidden" id="createddate"  value="">
                                      
                                      <div class="row" >
							               <div class="col-lg-12" style="text-align: center;margin-top: 25px;" >
							               <div style="font-weight: bold;font-size: 19px;color:#666;margin-bottom: -42px;">
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
									        	 	<div class="form-group col-lg-4" style="">
									        	 		<label><spring:message code="country.label" /></label>
									                	  <select onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control" >
															<option value="Select Country" >Select Country</option>
														  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="age.label" /></label>
									                	  <select id="age" name ="age" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="1-12" >1 to 12</option>
															<option value="13-19" >13 to 19</option>
															<option value="20-30" >20 to 30</option>
															<option value="31-40" >31 to 40</option>
															<option value="41-50" >41 to 50</option>
															<option value="51-60" >51 to 60</option>
															<option value="61-100" >61 and above</option>
														  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="gender.label" /></label>
									                	  <select id="gender" name ="gender" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Male" >Male</option>
															<option value="Female" >Female</option>
															<option value="Other" >Other</option>
														  </select>
									        	 	
									        	 	</div>
									        	 	
									        	 </div>
									             <div class="row">
									        	 	<div class="form-group col-lg-4" style="">
									        	 		 <label><spring:message code="region.label" /></label>
															 <select id ="states" class="form-control" >
															 	<option value="Select State" >Select State</option>
															</select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="marital.status.label" /></label>
									                	  <select id="otherDetails" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="Married" >Married</option>
															<option value="Unmarried" >Unmarried</option>
														  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 	<label><spring:message code="children.label" /></label>
									                	  <select id="children" class="form-control" >
															<option value="-- Select --" >-- Select --</option>
															<option value="0" >0</option>
															<option value="1" >1</option>
															<option value="2" >2</option>
															<option value="3" >3</option>
															<option value="4" >4</option>
															<option value="5 or Above" >5 or Above</option>
														  </select>
									        	 	</div>
									        	 </div>
									        	 <div class="row">
									        	 	<div class="form-group col-lg-4" style="">
									        	 		 <label><spring:message code="city.label" /></label>
									        	 		 <input type="text" id="city" class="form-control">
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="occupation.label" /></label>
									        	 		 <select id="occupation" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Business" >Business</option>
															<option value="Accountant" >Accountant</option>
															<option value="Software Professional" >Software Professional</option>
															<option value="Engineer" >Engineer</option>
															<option value="Professor" >Professor</option>
															<option value="Bureaucrat" >Bureaucrat</option>
															<option value="Financial Professional" >Financial Professional</option>
															<option value="Doctor" >Doctor</option>
															<option value="Others" >Others</option>
									        	 		 </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="customer.type.label" /></label>
									                	  <select id="customerType" name ="customerType" class="form-control" >
									                	  	<option value="-- Select --" >-- Select --</option>
									                	  	<option value="PREMIUM" >PREMIUM</option>
									                	  	<option value="PLUS" >PLUS</option>
									                	  	<option value="BASIC" >BASIC</option>
									                	  	<option value="GENERIC" >GENERIC</option>
									                	  	<option value="EMPLOYEE">EMPLOYEE</option>
															<!-- <option >Select Country</option> -->
														  </select>
									        	 		
									        	 	</div>
									        	 </div>
									        	 
									        	  <div class="row">
									        	 	<div class="form-group col-lg-4" style="">
									        	 		 <label><spring:message code="sales.zone.label" /></label>
									        	 		 <select id="salesZone" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									                	  	 <c:forEach var="zone" items="${zones}">
																<option value="${zone}">${zone}</option>
															 </c:forEach>
									        	 		 </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="income.group.label" /></label>
									        	 		 <select id="incomeGroup" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="Lower Income" >Lower Income</option>
															<option value="Middle Income" >Middle Income</option>
															<option value="High Net worth Individual" >High Net worth Individual</option>
															<option value="Ultra-Rich" >Ultra-Rich</option>
									        	 		 </select>
									        	 	</div>
									        	 </div>
									        	  
									        	
									           </div>
									           
											   <div class="col-lg-6" >
										           <div class="row">
										           	<div class="form-group col-lg-4">
									        	 		<label id="fromDateLabel"><spring:message code="deal_start_date.label" /></label>
									                	<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
									        	 		<div class="form-group col-lg-2">
									        	 		</div>
									        	 	<div class="form-group col-lg-6">
									        	 		<label><spring:message code="customer.turnover.label" /></label>
									        	 		 <div class="row">
							        						<div class="col-lg-6" style="padding-right: 5px;">
									                            <input type="text" class="form-control" id="startPrice" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
							        						</div>
							        						<div class="col-lg-6" style="padding-left: 5px;">
									                            <input type="text" class="form-control" id="endPrice" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
							        						</div>
							        					</div>
									        	 	</div>
									        	 </div>
									             <div class="row">
									             	<div class="form-group col-lg-4">
									        	 		<label><spring:message code="offer_end_date.label" /></label>
									                	<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
									        	 	</div>
									        	 	<div class="form-group col-lg-2">
									        	 	</div>
									        	 	<div class="form-group col-lg-6">
									        	 	<label><spring:message code="purchase.channel.label" /></label>
									                	  <select id="purchaseChannel" class="form-control" >
									                	  	 <option value="-- Select --" >-- Select --</option>
									                	  	 <option value="Direct Shopping" >Direct Shopping</option>
									                	  	 <option value="Telephone" >Telephone</option>
									                	  	 <option value="Online" >Online</option>
									                	  	  <option value="Mobile" >Mobile</option>
									                	  	 <option value="Sales Personnel" >Sales Personnel</option>
														  </select>
													</div>											
									        	 </div>
									        	 <div class="row">
									        	 	<div class="form-group col-lg-4">
									        	 		 <label><spring:message code="customer.rating.label" /></label>
								                	  <select id="customerRating" class="form-control" >
														<option value="-- Select --" >-- Select --</option>
														<option value="1" >1</option>
														<option value="2" >2</option>
														<option value="3" >3</option>
														<option value="4" >4</option>
														<option value="5" >5</option>
													  </select>
									        	 	</div>
									        	 	<div class="form-group col-lg-2">
									        	 	</div>
									        	 	<div class="form-group col-lg-6">
									        	 	 <label><spring:message code="referrals.label" /></label>
									        	 		 <select type="text" id="referrals" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									        	 		 	<option value="1" >1</option>
															<option value="2" >2</option>
															<option value="3" >3</option>
															<option value="4" >4</option>
															<option value="5" >5</option>
															<option value="6" >6</option>
															<option value="7" >7</option>
															<option value="8" >8</option>
															<option value="9" >9</option>
															<option value="10" >10</option>
									        	 		 </select>
									        	 	</div>
									        	 </div>  
									        	 <div class="row" style="display: none;">
									        	 <div class="form-group col-lg-4">
										        	 <label><spring:message code="product.category.label" /></label>
									                	  <select id="productCategory" onchange="emptyProduct();" name ="productCategory" class="form-control" >
									                	  	<option value="" >-- Select --</option>
									                	  	 <c:forEach var="category" items="${categories}">
									                	  	 	<option value="${category.categoryName}">${category.categoryDescription}</option>
																<%-- <option value="${category}">${category}</option> --%>
															 </c:forEach>
														  </select>
									        	 </div>
									        	 <div class="form-group col-lg-2">
									        	 	</div>
									        	 <div class="form-group col-lg-6">
									        	 		<label><spring:message code="product.label" /></label>
									        	 		 <input type="text"  class="form-control searchItems" id="searchProduct" placeholder="<spring:message code="search.product.label" />" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
															<div class="services">
												    			<div class="items">
												     				<ul class="matchedStringUl searchProduct" style=""></ul>
												   				</div>
															</div>
															<input type="hidden" id="product">
									        	 	</div>
									        	 </div>
						<div class="row" style="display: none;">
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
							<div class="row" style="font-size: 15px;">
								<div class="form-group col-lg-6" style="margin-top: 5px;">
									 <br>
								    <input type="checkbox" style="vertical-align: -2px" id="applyRoolsEngine"/>&nbsp;&nbsp;&nbsp; <spring:message code="apply.rules.engine" />
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
                                            <input type="text" class="form-control" name="dealName" id="dealName" placeholder="<spring:message code="enter_deal_name.label" />" />
                                            <span id="dealNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <br>
                                            <label><spring:message code="deal_start_date.label" /> <span class="requiredField">*</span></label>
                                             <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" name="dealStartDate" readonly="readonly" style="background: white;" id="dealStartDate" size="20" type="text" onfocus="callCalenderYYYYMMDD('dealStartDate')" onclick="callCalenderYYYYMMDD('dealStartDate')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                        
                                        <span id="dealStartDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group span2">
									     <label><spring:message code="deal_category.label" />  <span class="requiredField">*</span></label>
                                           <select class="form-control" name="dealCategory" onchange="toggleItemSpecific('dealcategory');" id="dealcategory">
                                            <option value="item_specific">Item Specific Deal</option>
                                            <option value="turn_over">Total Bill(Turn Over) Deal</option>
                                            <option value="group_turn_over">Group (Turn Over) Deal</option>
                                            </select>
                                            <br>
                                             <label><spring:message code="deal_end_date.label" /> <span class="requiredField">*</span></label>
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" name="dealenddate" id="dealEndDate" readonly="readonly" style="background: white;" size="20" type="text" onfocus="callCalenderYYYYMMDD('dealEndDate')" onclick="callCalenderYYYYMMDD('dealEndDate')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                          <span id="dealEndDateError" style="text-align:right;color:red;font-weight:bold;"></span>
									  </div>
									  
									  <div class="form-group span2">
                                            <label><spring:message code="deal_priority.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="priority" id="dealPriority">
                                            <option value="exclusive">Exclusive</option>
                                            <option value="normal">Normal</option>
                                            </select>
                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
                                          <br>
                                          <div class="col-lg-12" style="padding: 0px;">
										<div class="col-lg-6" style="padding: 0px;padding-right: 5px;">
										 <div class="bootstrap-timepicker">
                                            <label><spring:message code="starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" value="00:00:00" name="startTime" id="startTime"/>
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
                                                <input type="text" name="endTime" value="23:59:59" class="form-control timepicker" id="endTime"/>
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
											placeholder="<spring:message code="no.of.purchases" />"></textarea>
                                          
                                          <br>
										 <label><spring:message code="deal_description_text.label" /></label>
                                         <textarea class="form-control" name="dealDesc" id="dealDesc" rows="1" style="resize: none;" placeholder="<spring:message code="deal_description_placeholder.label" />" ></textarea>
										
										
										
                                        </div>
                                    <!--  </div> -->
									  <div class="form-group span2">
                                   	  	   <label><spring:message code="location.label" /></label>
	                                           <select class="form-control" name="location" id="dealLocation" style="height: 95px;" multiple="multiple">
	                                             <c:forEach var="location" items="${locationsList}"> 
													 <option value="${location}">${location}</option>
												 </c:forEach>
											 </select>
                                   	  </div>
                                   	  </div>
                                   	  
                               <div class="row" style=" padding-left: 15px;padding-right:10px">
								<div class="form-group col-lg-12" style=" border: 1px solid #ccc;height:35px;width: 99.6%;">
                                 <div class="col-lg-2" style="white-space: nowrap;padding: 7px;background: #c1c1c1; margin-left: -14px;">
                                 <label style="font-weight:bold">Deal Days</label>
                                 </div>	
								<div class="col-md-9" style="margin-top: 6px;margin-left: 25px;">
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
								<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day1"/>&nbsp;&nbsp;&nbsp; <spring:message code="sunday.label" />
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day2"/>&nbsp;&nbsp;&nbsp; <spring:message code="monday.label" />  				
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day3"/>&nbsp;&nbsp;&nbsp; <spring:message code="tuesday.label" />
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day4"/>&nbsp;&nbsp;&nbsp; <spring:message code="wednesday.label" />
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day5"/>&nbsp;&nbsp;&nbsp; <spring:message code="thursday.label" />
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day6"/>&nbsp;&nbsp;&nbsp; <spring:message code="friday.label" />
								</div>
								
								<div class="form-group col-lg-1 span2" style="padding: 0px;width: 14.05%;">
									<input type="checkbox" checked="checked" style="vertical-align: -2px" id="day7"/>&nbsp;&nbsp;&nbsp; <spring:message code="saturday.label" />
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
                                      
                                      <!--Start Modification-->
                 <div style="border: 1px solid rgb(181, 230, 29); margin: -15px -5px; padding: 5px;">
								<div style=""
									id="itemSpecificDeals">
									<div class="row">
										<div class="form-group col-lg-12">
											<input type="radio" checked="checked"
												onchange="toggleBased('basedOnProduct')"
												style="vertical-align: -2px" id="basedOnProduct" name="configureBased" />&nbsp;
											<spring:message code="configure.based.on.product.label" />
											<hr style="margin-top: 1px;">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12" style="padding-right:0px;margin-bottom: 0px;">
											<div class="form-group col-lg-3"
												style="margin-top: -40px;padding-right: 52px;margin-right: -40px; border-left: 1px solid lightgray;padding-top: 20px;margin-left: 5px;margin-bottom: 0px;height: 420px;">
											<hr style="margin: 0px;color: gray;width: 1px;height: 352px;border-left: 1px solid lightgray;position: absolute;left: 10px;top: 35px;">
								
											<div class="row">
											<div class="form-group col-lg-12" style="padding-left: 5px;margin-bottom: 5px;">
											<input type="radio" checked="checked" onchange="toggleCategoryApplyAll()"
												style="vertical-align: -2px" id="basedOnCategory" name="categoryBased" />&nbsp;
												Select Category
											</div>
											</div>
											
												<div class="form-group col-lg-12"
													style="background: #f4f4f4; border: 1px solid #ccc; padding-left: 10px; padding-right: 10px;">
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px;">
														<label><spring:message
																code="product.category.label" /></label> <select
															class="form-control basedOnProductR saleGroups"
															style="background: white;"
															onchange="searchSubCategoriesBasedOnCategory('saleCategory','sale_sub_category')"
															name="category" id="saleCategory">
															<option value="">-- Select --</option>
															<c:forEach var="category" items="${categories}">
																<option value="${category.categoryName}">${category.categoryName}</option>
															
															</c:forEach>
														</select> <span id="lanaguageError" style="text-align: right; color: red; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-12"
														style="padding-left: 0px; padding-right: 0px; margin-top: -12px; margin-bottom: 8px">
														<label><spring:message code="subcategory.label" /></label>
														<select class="form-control basedOnProductR saleGroups"
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
														<select class="form-control basedOnProductR saleGroups" 
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
															<option value="">-- Select --</option>
															<c:forEach var="brandName" items="${brandsList}">
																<option value="${brandName}">${brandName}</option>
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
												<br> <input type="radio" style="vertical-align: -2px" id="applyForAllItemsProduct" name="categoryBased" onclick="toggleCategoryApplyAll()" />
												<spring:message code="applyforAllitems.label" />
												<!--onchange="toggleComboLowestProduct('applyForAllItemsProduct')"  -->
											</div>

											</div>

											<div class="form-group col-lg-9" style="margin-top: -22px; width: 77%;padding-right: 0px;">

												<div class="form-group " style="margin-top: 2px; margin-bottom: 10px;">
													<input type="radio"  checked
														onchange="toggleItemComplexBased('itemDisountBased')" 
														style="vertical-align: -2px;margin-left: -20px;" id="itemDisountBased" class="itemWiseDiscount" name="basedOnproductCheck">&nbsp;
													<spring:message code="itemwise.deal.label" />
										 			<select style="width: 15%;display: inline-block;margin-left: 5px;margin-right: 5px;"
																class="form-control complexDiscounts" name="offerReward" id="itemSpecificTypeBox"
																onclick="">
																<option value="Quantity Based">Quantity Based</option>
																<option value="Turn Over">Turn Over</option>
															</select>
															
															
															 <input type="checkbox" checked="checked" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatItem" />
															<spring:message code="is.repeat.label" />
															
															<input type="checkbox"  class ="complexDiscounts"
																onchange="toggleComboLowest('lowestPriceItemProduct')"
																style="vertical-align: -2px;margin-left: 5px;" id="lowestPriceItemItem" />
															<spring:message code="lowest.price.item.label" />
														
										
													
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
						    					<input type="button"  class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelDataForDeals('new')" style="width: -webkit-fill-available; padding: 4px 14px;" />
												</div>
												</div>
												<!-- div for Deals Import -->
												
												<div class="col-lg-6" style="padding: 0px;">
												<div class="col-lg-12" style="margin-left: -16px;padding-right: 0px;width: 102%;">
													<input type="text"
														class="form-control searchItems basedOnProduct  searchBar"
														id="searchItems"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;width: 102%;border-radius: 10px !important;" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl dealProduct" style=""></ul>
														</div>
													</div>
												</div>
													
												<%-- <div class="col-lg-1" style="margin-left: 18px;padding-right: 1px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 18px;     float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
													</div> --%>
													
													<!-- <div
														style="overflow-x: auto; margin-bottom: 15px; margin-top: -5px"> -->
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
															<ul class="matchedStringUl dealProductsList"
																style=""></ul>
														</div>
													</div>
												</div>
													
												<div class="col-lg-1" style="padding-right: 2px;">
													<a onclick="getProductsByCriteria('','filter','0')" style="padding: 4px 7px;float: right;" class="btn bg-olive btn-inline"><spring:message code="addAll.label" /></a>
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
															</tbody>
														</table>
												</div>

												</div>
        

												<div class="form-group"
													style="margin-top: 2px; margin-bottom: 4px;margin-left: -20px;">
													<input type="radio" class ="complexDiscounts"
														onchange="toggleItemComplexBased('complexDisountBased')"  name="basedOnproductCheck"
														style="vertical-align: -2px; margin-top: 33px;" id="complexDisountBased">&nbsp;
													<spring:message code="complex.deals.label" />
														<select style="width: 15%;display: inline-block;margin-left: 5px;margin-right: 5px;"
																class="form-control complexDiscounts" name="offerReward" id="offerRewardCriteria"
																onclick="" >
																<option value="Quantity Based">Quantity Based</option>
																<option value="Turn Over">Turn Over</option>
																
															</select>
															
														<input type="checkbox" checked="checked" class ="complexDiscounts"
																style="vertical-align: -2px" id="isRepeatProduct" />
															<spring:message code="is.repeat.label" />
														<input type="checkbox"  class ="complexDiscounts"
															onchange="toggleComboLowest('lowestPriceItemProduct')"
															style="vertical-align: -2px;margin-left: 5px;" id="lowestPriceItemProduct" />
														<spring:message code="lowest.price.item.label" />
														
														<input type="checkbox" checked="checked" style="vertical-align: -2px;margin-left: 5px;" id="allownMulDisc"/><spring:message code="allow.multiple.discount.label" />

														<input type="checkbox" onchange="toggleComboLowest('isCombo')" style="vertical-align: -2px;margin-left: 5px;" id="isCombo"/><spring:message code="is.combo.label" />
														
													
													
												</div>
												
												
												<div class="col-lg-6" style="padding:0px">
												
												<div class="row" style="margin-top: 10px;">
												<div class="col-lg-11" style="margin-left: 15px;padding: 0px;">
												
													<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItem"
														placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
													<div class="services">
														<div class="items">
															<ul class="matchedStringUl dealProductItem"
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
															<tbody style="text-align: center;display:none;" id="RangesHide1">
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
														</table>
													</div>
												</div>
												
												</div>
												
												<div class="col-lg-6" style="padding-right: 0px;">
												
												<div class="row" style="margin-top: 10px;">
												<div class="col-lg-11" style="margin-left: 15px;padding: 0px;">
												
													<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
														id="dealProductItemSku"
														placeholder="<spring:message code="deal_enter_deal_sku_Id.label" />"
														style="border: 1px solid #ddd;border-radius: 10px !important;" />
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
																	
																	<th style="width: 7%"><spring:message
																			code="action.label" /></th>		

																</tr>
															</thead>
															<tbody style="text-align: center;display:none;" id="RangesHide2">
																<tr id="productrange2">
                                                                 <td style="display: none;"><span id="1rangename">productrange1</span></td>
																	<td id="productoffer2">1</td>
																		<td id="categorySubDept2"> <input type="hidden" name="dealSelectedCategoryId" id="dealSelectedCategoryId" value=""/> <input type="hidden" id="dealSelectedBrandId" value=""> <input type="hidden" id="dealSelectedDeptId" value=""> </td>
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
											<input type="radio" onchange="toggleBased('basedOnGroup')"
												style="vertical-align: -2px" id="basedOnGroup" name="configureBased"/>&nbsp;&nbsp;&nbsp;
											<spring:message code="configure.based.on.group.label" />
											<hr style="margin-top: 1px;">
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-lg-12" style="padding-right: 5px;">
										<div class="form-group col-lg-3" style="margin-top: -25px;padding-right: 35px;margin-right: -35px;padding-left: 0px;">
											

											<div class="form-group col-lg-12" style="">
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
											<label><spring:message code="deal_group_id.label" /></label>
											<input type="text"
												class="form-control searchItems basedOnGroup saleGroups searchBar"
												readonly="readonly" id="dealGroup"
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
													</tbody>
												</table>
											</div>
											</div>
											
											
											<div class="form-group col-lg-12" style="padding-left: 0px;margin-top: -20px;">
												<br> <input type="radio" disabled="disabled"
													onchange="toggleComboLowest('applyForAllItemsGroup')"
													style="vertical-align: -2px" id="applyForAllItemsGroup" />
												<spring:message code="applyforAllitems.label" />
											</div>
										

										</div>
									
										<div class="form-group col-lg-9"
												style="margin-top: -22px;width: 77%;padding-right: 0px;">

												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 10px;margin-left: -20px;">
													<input type="radio" 
														onchange="toggleItemComplexBased('itemDisountBasedGroup')" 
														style="vertical-align: -2px" name="basedOngroupCheck"  id="itemDisountBasedGroup">&nbsp;
													<spring:message code="itemwise.deal.label" />
													</div>
													
											<hr style="margin: 0px;color: gray;width: 1px;height: 115px;border-left: 1px solid lightgray;position: absolute;left: 0;top: 18px;">
										
													
										<div class="form-group col-lg-12" style="padding:0px;padding-left:0px;">
										
										
										<div class="col-lg-6" style="padding: 0px;">
										
										<div class="col-lg-12" style="padding-right: 0px;width: 102%;margin-left: -16px;">
										<input type="text"
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
															</tbody>
														</table>
													</div>
										
										</div>
										
										
										<div class="col-lg-6" style="padding:0px;padding-left:10px;">
											<div class="col-lg-11" style="padding-right: 0px;width: 87%;margin-left: -16px;margin-right: 6px;">
												<input type="text"
														class="form-control searchItems basedOnGroup saleGroups  searchBar"
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
													<a onclick="" style="padding: 4px 7px;float: right;" class="btn bg-olive btn-inline">Add All</a>
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
															</tbody>
														</table>
													</div>
										</div>
												</div>
												
												
												<div class="form-group "
													style="margin-top: 2px; margin-bottom: 4px;margin-left: -20px;">
													<input type="radio"  name="basedOngroupCheck" 
														onchange="toggleItemComplexBased('complexbasedOnGroup')" style="vertical-align: -2px" id="complexbasedOnGroup">&nbsp;
													<spring:message code="complex.deals.label" />
												</div>
													

												

									<div class="col-lg-6" style="padding:0px">
									
									<div class="row" style="margin-top: 10px;">
									<div class="col-lg-11" style="margin-left: 15px;padding: 0px;">
									
										<input type="text" class="form-control searchDealItems basedOnProduct searchBar"
											id="dealProductItemGroup"
											placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"
											style="border: 1px solid #ddd;border-radius: 10px !important;" />
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
										</table>
									</div>
									</div>
									
									</div>
									
									<div class="col-lg-6" style="padding:0px">
									
									<div class="row">
													<div class="col-lg-12" style="margin-top: -10px;">
														<div class="form-group col-lg-4" style="width: 38%;padding-top: 20px; margin-bottom: 0px;padding-left: 0px;margin-left: 10px;z-index: 1;">
														
															<select
																class="form-control" name="offerReward" id="offerRewardCriteriaGroup"
																onclick="toggleComboLowest('offerRewardCriteriaGroup')">
																<option value="Quantity Based">Quantity Based</option>
																<option value="Turn Over">Turn Over </option>
																<!-- <option value="Turn Over Ranges">Turn Over Ranges </option> -->
															</select>
															
														</div>

														<div class="form-group col-lg-4"
															style="text-align: center; margin-top: 22px; margin-left: -45px; padding-right: 0px;margin-bottom: 8px;white-space:nowrap">
															<input type="checkbox" checked="checked"
																style="vertical-align: -2px" id="isRepeat" />
															<spring:message code="is.repeat.label" />
														</div>
														
														<div class="form-group col-lg-4"
															style="text-align: center; margin-top: 4px; padding-left: 0px; padding-right: 0px;margin-bottom: 8px;white-space:nowrap">
															<br> <input type="checkbox"
																onchange="toggleComboLowest('lowestPriceItem')"
																style="vertical-align: -2px" id="lowestPriceItem" />
															<spring:message code="lowest.price.item.label" />
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
									</div>
								</div>
								</div>
                                      
                                      
                                      
                                      <!--end modification  -->
                                      
                                      
                                      
                                      
    <%--                                   <div class="row">
									   <div class="form-group col-lg-12" >
                                         	 <input type="checkbox" checked="checked" onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                       <div class="itemSpecificDeals">
                                        <div class="row">
											<div class="form-group col-lg-3" style="margin-top: -25px;">
							        	 		 <label><spring:message code="sale_product_category.label" /></label>
		                                            <select class="form-control basedOnProduct saleGroups" onchange="searchSubCategoriesBasedOnCategory('saleCategory','sale_sub_category')" style="background: white;" name="saleCategory" id="saleCategory">
		                                            	<option value="-- Select --" >-- Select --</option>
		                                           		 <c:forEach var="category" items="${categories}">
		                                           		 	<option value="${category.categoryName}">${category.categoryDescription}</option>
															<option value="${category}">${category}</option>
														</c:forEach>
		                                            </select>
		                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
											</div>	
											 <div class="form-group col-lg-3" style="margin-top: -25px;">
	                                            <label><spring:message code="sale_product_sub_category.label" /></label>
	                                            <select class="form-control basedOnProduct saleGroups" style="background: white;" name="sub_category" id="sale_sub_category">
	                                            </select>
	                                         </div>	
	                                         
                                      	  <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="product_id.label" /></label>
									   
									    <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="searchItems" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl dealProduct" style="width: 230px;"></ul>
								   				</div>
											</div>
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
                                                </tbody>
                                                
                                          </table>
                                          </div>
									  </div>
                                      
                                       <div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="buy_sku_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="buySkuList" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl buySkuList" style="width: 230px;"></ul>
								   				</div>
											</div>
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
                                                </tbody>
                                          </table>
										</div>
									  </div>
									  </div>
									  </div>
									  <div class="row">
											<div class="form-group col-lg-3" style="margin-top: -25px;">
							        	 		 <label><spring:message code="deal_product_category.label" /></label>
		                                            <select class="form-control basedOnProduct" onchange="searchSubCategoriesBasedOnCategory('dealCategory','deal_sub_category')" style="background: white;" name="category" id="dealCategory">
		                                            	<option value="-- Select --" >-- Select --</option>
		                                           		 <c:forEach var="category" items="${categories}">
		                                           		 	<option value="${category.categoryName}">${category.categoryDescription}</option>
															<option value="${category}">${category}</option>
														</c:forEach>
		                                            </select>
		                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
											</div>	
											 <div class="form-group col-lg-3" style="margin-top: -25px;">
	                                            <label><spring:message code="deal_product_sub_category.label" /></label>
	                                            <select class="form-control basedOnProduct" style="background: white;" name="sub_category" id="deal_sub_category">
	                                            </select>
	                                         </div>	
	                                         
                                      	  <div class="form-group col-lg-3" style="margin-top: -25px;">
									      <label><spring:message code="offer_product_id.label" /></label>
									     <input type="text"  class="form-control searchItems basedOnProduct" id="dealProductsDataList" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl dealProductsList" style="width: 230px;"></ul>
								   				</div>
											</div>
										<div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="dealProductsList" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                        	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="deal_product_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
                                      
                                       <div class="form-group col-lg-3" style="margin-top: -25px;">
									    <label><spring:message code="offer_sku_id.label" /></label>
									      <input type="text"  class="form-control searchItems basedOnProduct" id="dealSkudatalist" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl dealSkudatalist" style="width: 230px;"></ul>
								   				</div>
											</div>
											<div style="overflow-x : auto;margin-bottom: 15px;">
                                          <table id="dealSkuTable" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<th><spring:message code="plucode.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                                </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  </div>
									  <div class="row">
									   <div class="form-group col-lg-12" >
                                         	<input type="checkbox" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
									  <div class="row">
									   <div class="itemSpecificDeals">
									  	<div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="sale_group_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroup" placeholder="<spring:message code="enter.group.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroup" style="width: 230px;"></ul>
								   				</div>
											</div>
									      <div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th style="width:100px;"><spring:message code="sale_group_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                                <tbody style="text-align: center;">
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
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  
                                  </div> --%>
                                
                                 <div class="row" style="margin-top: 20px;display:none;">
                                	<div class="form-group col-lg-3"  style="text-align: center;">
                               			<input type="checkbox" checked="checked" style="vertical-align: -2px" /><spring:message code="allow.multiple.discount.label" />
                                	</div>
                                	<div class="form-group col-lg-3"  style="text-align: center;">
                                		<input type="checkbox" checked="checked" style="vertical-align: -2px" id=""/>&nbsp;&nbsp;&nbsp; <spring:message code="is.repeat.label" />
                               		</div>
                               		<div class="form-group col-lg-3"  style="text-align: center;">
                                		<input type="checkbox" onchange="toggleComboLowest('isCombo')" style="vertical-align: -2px" />&nbsp;&nbsp;&nbsp; <spring:message code="is.combo.label" />
                               		</div>
                               		<div class="form-group col-lg-3"  style="text-align: center;">
                                		<input type="checkbox" onchange="" style="vertical-align: -2px" id=""/>&nbsp;&nbsp;&nbsp; <spring:message code="lowest.price.item.label" />
                               		</div>
                               	</div> 
                                 
           					 <div >
                              	 <label style="font-weight: bold;font-size: 16px;color:#666;display:none;"><spring:message code="deal_slabs.label" /></label>
                              	<%--  <input type="button" style="padding: 0px;float: right;" class="btn bg-olive btn-inline" onclick="addSlab()" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="deal_add_slabs.label" />&nbsp;&nbsp;&nbsp;&nbsp;" /> --%>
                              	   <%-- <label style="font-weight:bold;float: right;cursor: pointer;" onclick="addSlab()"><spring:message code="deal_add_slabs.label" /> </label> --%>
                               	 <hr style="margin-top: 1px;">
                              </div>
                              
                  	<div class="table-responsive" style="margin-top:-22px; display:none;">
                     <table id="slabsList" class="table table-bordered table-hover" style="width:100%;">
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
                       		<tr id="range1"><td style="width: 10%;display:none;"><span>1</span></td>
                       			<td style="width: 15%">
                       			 	<input type="text"  class="form-control groupSearch" oninput="getGroupIds(this);" onkeydown="keyDownMethod(event.keyCode,this);" id="" placeholder="<spring:message code="enter.group.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl " style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected1groupId">
                       			</td>
                       			<td style="width: 15%">
                       			<input type="text"  class="form-control itemSearch" onblur="" onkeydown="keyDownMethod(event.keyCode,this);" id="1itemId" placeholder="<spring:message code="enter.item.id.label" />" />
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl 1itemId" style="width: 138px;"></ul>
						   				</div>
									</div>
									<input type="hidden" id="selected1itemId">
									<input type="hidden" id="pluCode1itemId">
                       			</td>
								<td style="width: 15%"><input class="form-control minPurQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" type="text" name="category_name" id ="1minquantity" /></td>
								<td style="width: 15%"><input class="form-control minPurAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" type="text" name="category_name" id ="1minamount" /></td>
								<td style="width: 15%"><input class="form-control dealQty" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" type="text" name="category_name" id ="1dealquantity" /></td>
								<td> 
									<select class="form-control" name="rangeMode" disabled="disabled" id="1rangeMode" onchange="changeRangeMode(this,'new');" >
                                       <option value="both">Both</option>
  									   <option value="condition">Condition</option>
                                       <option value="promotion">Promotion</option>
                                    </select>
                                </td>
								<td style="width: 15%"><input class="form-control dealDesc" type="text" name="category_name" id ='1description' /></td>
								<td style="width: 8%"><div style="width: 60px;"><img src="${pageContext.request.contextPath}/images/addslab.png" style="width: 33px;cursor: pointer;" onclick="addSlab()" > <img src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;" onclick="deleteSlab('range1')"></div></td>
							</tr>
			 	</tbody>
                    </table>
                   
                 </div>
                              <!--  for slabs table end -->       
                                   
                                 
                                       <!-- row 4 start --> 
                                <div class="row">
                                	
                               		<div class="col-md-3" >
                                	  	<label id="dealBannerLabel"><spring:message code="deal_banner.label" /></label><br>
                                	  	<input type="checkbox" style="vertical-align: -2px" id="banner"/>&nbsp;&nbsp;<spring:message code="use.as.banner.label" />
                                	  	<br><br>
                                         <div class="icon-remove blue delete" title="Deal Banner" id="dealBanner_image" style="text-align: center;">
											<label class="myFile" id="dealBanner_label">
											<%-- <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" /> --%>
											<input type="file" id="dealBanner" name="dealBanner" onchange="loadImageFileAsURL('dealBanner',this);" />
											</label>
											</div>
											 <span id="dealBannerErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                         <input type="hidden" id="dealBannerRefId" />
                                         <input type="hidden" id="dealBanner_name" />
                                	  </div>
                                	 <div class="col-md-9">
                                	 <div class="row">
                                	 	<div class="form-group col-md-3" style="padding: 0px;"> 
                                         <label><spring:message code="deal_status.label" /></label>
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
                                            
                                        </div>
                                    <div class="form-group col-md-3" style="padding: 0px;">
                                      <label><spring:message code="deal_loyalty_points_status.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=true checked>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="loyaltyPoints" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </div>
                                      <div class="form-group col-md-3" style="padding: 0px;"> 
                                         <label><spring:message code="deal_giftvouchet_status.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="giftvouchers" value=true checked>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="giftvouchers" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                       </div>
                                   <div class="form-group col-md-3" style="padding: 0px;"> 
                                         <label><spring:message code="deal_claims_coupons.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="coupons" value=true checked>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="coupons" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
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
                                    	<textarea class="form-control" name="dealImageText" id="dealImageText" rows="1" style="resize: none;" placeholder="<spring:message code="display.tag.line.label" />" ></textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label>
                                    		<input type="hidden" id="dealImageTextFontHidden">
                                    		<select class="form-control" id="dealImageTextFont">
                                    		</select>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" id="dealImageTextSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="dealImageTextColor" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="dealImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="dealImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="dealImageStrike" /> <i class="fa  fa-strikethrough"></i>
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
                                    	<textarea class="form-control" name="saleText" id="saleText" rows="1" style="resize: none;" placeholder="<spring:message code="display.sale.text.label" />" ></textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label>
                                    		<select class="form-control" id="saleTextFont">
                                    		</select>
                                    		<input type="hidden" id="saleTextFontHidden">
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" id="saleTextSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="saleTextColor" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="saleTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="saleTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="saleTextStrike" /> <i class="fa  fa-strikethrough"></i>
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
                                    	<textarea class="form-control" name="dealText" id="dealText" rows="1" style="resize: none;" placeholder="<spring:message code="display.deal.text.label" />" ></textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label>
                                    		<select class="form-control" id="dealTextFont">
                                    		</select>
                                    		<input type="hidden" id="dealTextFontHidden">
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" id="dealTextSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" id="dealTextColor" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="dealTextBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="dealTextItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	<input type="checkbox" style="vertical-align: -2px;" id="dealTextStrike" /> <i class="fa  fa-strikethrough"></i>
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
                                            <input class="form-control" name="closedOn" id="closedOn" readonly="readonly" style="background: white;" size="20" type="text" onfocus="callCalenderYYYYMMDD('closedOn')" onclick="callCalenderYYYYMMDD('closedOn')" placeholder="YYYY/MM/DD"/>
                                        </div><!-- /.input group -->
                                         </div>
                                       
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="closed.reason.label" /></label>
                                            <input type="text" class="form-control" name="closedReason" id="closedReason" value="" required placeholder="<spring:message code="enter.authorised.by.label" />" />
                                        	<span id="closedReasonError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                        </div>  
                                        </div>
                                    
                       
				<div class="row"  style="text-align: right;">
					<input type="button" id="submit" style="margin-right: 2%;" class="btn bg-olive btn-inline" onclick="createDeal()" value="<spring:message code="submit.label" />"/>
					<%--  <c:if test="${sessionScope.role == 'super admin'}">
					 	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
					 </c:if> --%>
					<%-- <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}">
	                    <c:if test="${accessControl.appDocument == 'DealsConfiguration' && accessControl.write == true && accessControl.read == true}">	
						<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach> --%>
					<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;" onclick="viewdealsandoffers('deals','','0')" value="<spring:message code="cancel.label" />" />
					
					</div>
					</div><!-- /.box-body -->
				
									<br/>
                                    <div class="box-footer">
                                    </div>
                                  <input type="hidden" id="taxList" value='' />
                                    
                                </form>
                                <input type="hidden" name="taxes" id="taxes" />
                                 <input type="hidden" id="subCategories" value='${subCategories}'> 
                            </div>

</div>
</div>
</section><!-- /.content -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
   $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
      
   });
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