<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 *modified by               : Manasa
 * file name		        : Inventory Manager/loyaltyPrograms/newGiftCoupons.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
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
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>
 
 
  <style type="text/css">
 .modal-backdrop
{
    opacity:0.0 !important;
}
.modal {

}
.modal-dialog {
margin-top: 10%;
}
.modal-content {
  background-color: #fefefe;
  text-align:left;
  width: 80%;
  margin-left: 60%;
  overflow-y: scroll;
  overflow-x: hidden;
  height: 450px; 
 
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	callCalender('createdOn');
	callCalender('expiryDate');
	print_country("country");
	 var date = getCurrentDate();
//	 $('#date').val(date);
// getLocationsBasedonZones();
	 $("#country").val("India");
// 		print_state('state',104);
// 		getLocations();
		multipleCheckValidation();
		/*  var states= $("#selectedState").val();
			states = states.split(',');
			var op = "";
			for(var i=0;i<states.length;i++){
				op= op+"<option>"+states[i]+"</option>";
			}
			$("#state").html(op);*/
			
// 			var selectedState = []; 
// 			var statesList=[];
// 			$("#state option").each(function()
// 					{
						
// 						statesList.push($(this).val())
					    
// 					});
			

	/* 		try{
			selectedState = $("#selectedStateList").val();
				if(selectedState != "" && selectedState != null)
					{
					debugger;
				selectedState = selectedState.replace(/[[\]]/g,'');
				selectedState = selectedState.split(','); 
				$("#state option").remove();

				for(var i=0;i< statesList.length;i++)
					{
						var selectedValue=false;
						for(var j=0;j< selectedState.length;j++)
							{
								if(statesList[i] === selectedState[j].trim())
									selectedValue=true;
								 						
							}
						if(selectedValue)
							{
							$("#state").append('<option selected value="'+statesList[i]+'">'+statesList[i]+'</option>');
							}
						else
							{
								$("#state").append('<option  value="'+statesList[i]+'">'+statesList[i]+'</option>');
							}

					}
					}
				}
				catch(e)
				{} */
			
				debugger
				var slectedLocations = $("#selectedLocation").val().replace('[','').replace(']','').replace(/, /g,',');
				$("#location").val(slectedLocations.split(','));
				
				
				/* var locations =$("#selectedAllLocation").val();
				locations = locations.replace(/[[\]]/g,'');
				locations = locations.split(',');
				
				
				var selecteddLocations = $("#selectedLocation").val();
				if(selecteddLocations != "" && selecteddLocations != null)
					{
				selecteddLocations = selecteddLocations.replace(/[[\]]/g,'');
				selecteddLocations = selecteddLocations.split(',');
				$("#location option").remove();
					}
			var	op="";
				for(var i=0;i<locations.length;i++){
					var selectedlocValue=false;
					for(var j=0;j<selecteddLocations.length;j++)
						{
						if(locations[i].trim() == selecteddLocations[j].trim())
							selectedlocValue=true;
						}
					if(selectedlocValue)
						$("#location").append('<option selected value="'+locations[i]+'">'+locations[i]+'</option>');
					else
						$("#location").append('<option  value="'+locations[i]+'">'+locations[i]+'</option>');
						//op= op+"<option>"+locations[i]+"</option>";
				}
				 */
				
			/* var locations =$("#selectedAllLocation").val();
			locations = locations.replace(/[[\]]/g,'');
			locations = locations.split(',');
			
			var selecteddLocations = $("#selectedLocation").val();
			
			
		var	op="";
			for(var i=0;i<locations.length;i++){
				var selectedValue=false;
				op= op+"<option>"+locations[i]+"</option>";
			}
			$("#location").html(op);  */
		
			
	
			
});
$("#promoName").keydown(function(){
	   $("#errPromoName").html("");
	   $("#Error").html("");
});

var promoCode = $("#promoCode").val();
$("#promoCode").keydown(function(){
	/* if(promoCode.length<5){
			$("#errpromoCode").html("Enter atleast 5 Characters/Numbers");
			return;
		}
	else{ */
	   $("#errpromoCode").html("");
	   $("#Error").html("");
// 	}
});

$("#createdOn").keydown(function(){
	   $("#errCreatedOn").html("");
	   $("#Error").html("");
});

// $("#state").change(function(){
// 	   $("#errStates").html("");
// 	   $("#Error").html("");
// });
$("#location").change(function(){
	   $("#errLocation").html("");
	   $("#Error").html("");
});

$("#zones").change(function(){
	   $("#errStates").html("");
	   $("#Error").html("");
});



/* $("#nofClaims").change(function(){
	   $("#errnofClaims").html("");
	   $("#Error").html("");
}); */

$("#expiryDate").keydown(function(){
	   $("#errExpiryDate").html("");
	   $("#Error").html("");
});
$("#quantity").keyup(function(){
	   $("#errQuantity").html("");
	   $("#Error").html("");
});
$("#validityPeriod").keyup(function(){
	   $("#errValidityPeriod").html("");
	   $("#Error").html("");
});
$("#unitCashValue").keyup(function(){
	   $("#errUnitCashValue").html("");
	   $("#Error").html("");
});

$("#quantity").blur(function(){
	var unitVal = parseFloat($("#unitCashValue").val());
	var quantity = parseInt($("#quantity").val());
	if(!isNaN(unitVal)&& !isNaN(quantity)){
		$("#discountTotal").val(unitVal*quantity);
	}
});

$("#unitCashValue").blur(function(){
	var unitVal = parseFloat($("#unitCashValue").val());
	var quantity = parseInt($("#quantity").val());
	var noOfClaimsLimited = parseInt($("#noOfClaimsLimited").val());
	
	if(!isNaN(unitVal)&& !isNaN(quantity)){
		if(noOfClaimsLimited == "0"){
		$("#discountTotal").val(unitVal*quantity);	
		}else{
		$("#discountTotal").val(unitVal*quantity*noOfClaimsLimited);	
		}
		
	}
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="loyaltyprogram.label" />
     <small><spring:message code="giftCoupons.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showLoyaltyFlow();"><spring:message code="loyaltyprogram.label" /></a></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <h3><label style="padding :5px;  border:1px solid  #808080;"><spring:message code="new.gift.coupons.label" /></label></h3>
                                
                                
                                <a style="float:right;color:#2e7ea7 !important;cursor: pointer;width:20%;margin-top:-45px;" data-toggle="modal" data-target="#myModal1"><u>Help</u></a>						
					
					<div class="modal fade" id="myModal1" role="dialog">
										    <div class="modal-dialog">
										    
										      <!-- Modal content -->
										      <div class="modal-content">
										        <div class="modal-header">
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										          <h4 class="modal-title"></h4>
										        </div>
										        <div class="modal-body">
										          <p>TechnoLabs Retail Cloud platform provides Customer Loyalty program to the Retail Brands. Retailer can configure Coupons (both electronic and printed), issue, and monitor and take reports. Coupons can be used across sales channels i.e. Outlet POS, Online, Mobile Shopping, and Self Checkouts. Please note that TechnoLabs offers services for both Digital Commerce and Brick Mortar business.</p>
										          <br>
										          <p>It all starts with planning your campaign and configuration of Coupon programs. You can run multiple coupon programs at a time. In this section we are trying to make it simple for even first time user.</p>
										          <br>
										          <p>With TechnoLabs cloud platform, you can issue the below category/types of coupons with several constraints or scenarios.</p>
										          <br>
										          <ol style="list-style: none;">
										          <li><b>1. Assigned Coupons - </b>Coupon must be assigned or mapped to the customer. Then only the customer can redeem the coupon while ordering online or billing at the POS (Point of Sale). Assigned coupons can be claimed only once. In other words, the coupon is marked as 'Claimed' once the customer does the redemption. You can set the below parameters against of Assigned Coupons. 
										          <ol style="list-style: none;">
										          <li><b>a)	Start Date:</b>Date from which the Coupon Program is active. It means from the start date, coupons can be issued to the customers. Customers can do redemption.</li>
										          <li><b>b)	End Date:</b> Last day of the Coupon program.  After which the Coupons cannot be issued or claimed.</li>
										          <li><b>c)	Validity Period:</b>No of days a Coupon is valid from the date of Issue. No of days cannot exceed the difference between start date and end date. For example, if the validity period is 2 days, the customer has to redeem within 2 days from date of issue even though expiry date is far away.</li>
										          <li><b>d)	Min Bill Amount:</b>You need to enter the minimum amount the customer has to bill to claim the Coupon issued before. At POS level, the system rejects unless the bill values exceeds the min bill amount.</li>
										          <li><b>e)	Max Bill Amount:</b>Like previous one, this restriction sets the maximum bill amount while doing Bill at POS level. The same restriction is applied while ordering Online or using Mobile, provided the sales channels/locations are selected.</li>
										          <li><b>f)	Multiple Users:</b>By setting this option 'Yes', same coupon can be issued to multiple users. For examples, company issues a coupon to its employees. The same coupon can be claimed by all employees only one time. You can set the limit for no of users/claims by entering value against of the field 'Total Claims'. By selecting option 'No', a coupon can be issued to only one user. It can be claimed the same user. When a coupon is of type 'Single User', you can generate more than one coupon by entering the number against off the field 'No of Coupons'.</li>
										          <li><b>g)	No. of Coupons:</b>If the Coupon Program is of type 'multi-user', the default value is set as 1. On the other hand, if the program is of type Single User (Multi User option set as No), you need to  a number indicating the no of coupons. This field sets the maximum number of coupons you can generate, issue, and then customers can redeem.</li>
										          <li><b>h)	Total Claims:</b>If the Coupon Program is of type Multi-User, you can set the cap on no of claims allowed with the Coupon. The coupons can be assigned or unassigned which is determined the option 'Assigned'.</li>
										          <li><b>i)	Split Redeem and Redemptions/Coupon:</b>The total value of the coupon can be claimed by billing multiple times.. For instance, total 1000 USD coupon can be claimed only by billing 4 times with minimum bill amount. This feature ensures that Customer comes back more than once.</li>
										          <li><b>j)	Discount Type:</b>The coupon can be of type Flat/Fixed value or % of the Bill value.  You can set the coupon value by entering number in the 'Coupon Value' field.</li>
										          <li><b>k)	Coupon Value:</b>Depends on the previous parameter, Discount Type, one has to set the coupon value. You need to be careful when the Discount Type is of % Type. This value is sets discount percentage while doing Order or Bill. Customer does the Order when he/she is using TechnoLabs Online or Mobile commerce. The same coupon can be claimed at Outlets, provided locations are selected.</li>
										          <li><b>l)	Discount Total:</b>This gives final figure of the total coupon program. This is applicable to Flat Coupon type only. With % coupon type, we don't know what would be discount.</li>
										          <li><b>m)	Auto Generated:</b>With this option set, the system generates coupons.   You can also import the coupon Ids using excel sheet.  For a given program, the maximum number of coupons you can import is equal to the figure you entered against of the field No. of Coupons.</li>
										          <li><b>n)	OTP Required:</b>POS or Online commerce forces the customer to enter the OTP before Coupon redemption happens. If this option is not set, the customer can redeem the Coupon just by mentioning his/her phone number.</li>
										          </ol>
										          </li>
										          <li><b>2. Unassigned Coupons - </b> These are open coupons like you may publish in Facebook or other social media. All option mentioned above are applicable to Unassigned Coupons as well.  However, the following options are not applicable to Unassigned Coupons.
										         
										         <ul style="list-style:none;">
										          <li>a) OTP required is not applicable to Unassigned Coupons.</li>
										          <li>b) For Unassigned Coupons, any user who comes with the Coupon is eligible. However, he/she can claim once.</li>
										          </ul>
										          </li>
										          <li><b>3. Other Options - Zone/Locations </b> You have provision to define the Zone or Locations where the Coupons are valid. Each zone may have multiple locations. Please note that location B2C is special. This location is logical location that indicates Digital Commerce.</li>
										          <li><b>4. Coupons Import - </b> When the user doesn't select Auto Generate option, he/she has the option to import the coupons from the excel sheet. You need to prepare the excel sheet before importing. You may contact TechnoLabs for excel templates.</li>
										          </ol>
										        </div>										        
										      </div>
										      
										    </div>
										  </div> 
                                
                                
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newGiftCoupons" method="post" >
                                    <div class="box-body">
                                   	
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;display:none;">${success}</div>
                                    <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;display:none;">${err}</div>
                                    <div id="url" class="Error" style="text-align: center;display:none;">
                                       <div id="errr" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
                                       <span>To get the file Log details--</span><a id="htpUrl"  target="_blank" style="color: #0000EE">click here</a>
                                    </div>
                                  <%--  	<div class="row">
                                   		<div class="formgroup col-lg-3">
                                   		<div class="col-lg-8">
                                   		 <label style="font-family: Calibri;color: gray;"><spring:message code="promo.code.label" />  </label>
                                   		<input type="text" class="form-control" id="promoCode" name="promoCode">
                                   		</div>
                                   		</div>
                                   		<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="createdOn" id="createdOn" size="20" type="text" value="${giftCoupon.createdOn}" onfocus="callCalender('createdOn')" onclick="callCalender('createdOn')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		 <span style="color:red; font-size:2" id="createdOnError"></span>
                                        	</div>
                                        <div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="no.of.coupons.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantity" name="quantity" value="${giftCoupon.quantity}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                        <input type="text" class="form-control" id="quantity" name="quantity" value="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');">
                                            <span style="color:red; font-size:2" id="errQuantity"></span>
                                    	</div>
                                    	<div class="form-group col-lg-2" >
                                            <label style="font-family: Calibri;color: gray;" for="multiples" >Multiples<span style="color:red; font-size:2">*</span></label>
                                             <select class="form-control" name="multiples" id="multiples">
	                                            <option value="0">yes</option>
    	                                        <option value="1">no</option>
                                            </select>
										</div>
										<div class="form-group col-lg-2" >
										   <label style="font-family: Calibri;color: gray;">Discount value</label>
	 									   <input type="text" class="form-control" id="discount" name="unitCashValue" placeholder="XX.XX"/>
										
										</div>
                                   		<div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="voucher.type.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="card_type" id="card_type">
	                                            <option value="Voucher">Voucher</option>
    	                                        <option value="Coupon">Coupon</option>
                                            </select>
										</div>
										
									mine	<div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="unit.cash.value.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="unitCashValue" name="unitCashValue" value="${giftCoupon.unitCashValue}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errUnitCashValue"></span>
                                     	</div>
                                     	
                                    	<div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="total.cash.value.label" /></label>
                                            <input type="text" class="form-control" id="totalCashValue" readonly="readonly" name="totalCashValue" value="${giftCoupon.totalCashValue}"/>
                                            <span style="color:red; font-size:2" id="errTotalCashValue"></span>
                                    	</div>
                                    	</div> --%>
                                    	<div style="background: #efefef;padding: 4px 20px;">
                                    	<div class="row">
                                   		<div class="form-group col-lg-2">
                                   		<div class="col-lg-12" style="">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="promo.code.label" /><span style="color:red; font-size:2">*</span>  </label>
                                            <input type="text" class="form-control" id="promoCode"  name="couponProgramCode" value="${giftCoupon.couponProgramCode}" style="width: 80%;"/>
                                              <span class="clearErrors" style="color:red; font-size:2;white-space: nowrap;;font-weight: bold;" id="errpromoCode"></span>
                                     	</div>
                                     	</div>
                                   		<%-- <div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="voucher.type.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="card_type" id="card_type">
	                                            <option value="Voucher">Voucher</option>
    	                                        <option value="Coupon">Coupon</option>
                                            </select>
										</div> --%>
										<div class="form-group col-lg-2" style="padding-right:35px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="createdOnStr" id="createdOn" size="20" type="text" value="${giftCoupon.createdOnStr}" onfocus="callCalender('createdOn')" onclick="callCalender('createdOn')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		 <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="createdOnError"></span>
                                        	</div>
										<div class="form-group col-lg-2" >
                                            <label style="font-family: Calibri;color: gray;"  >Assigned</label>
                                             <select class="form-control" name="assignedStatusStr" id="assignedStatus" style="width: 45%;">
	                                            <option value="0">Yes</option>
    	                                        <option value="1">No</option>
                                            </select>
										</div>
										<div class="form-group col-lg-2" >
                                            <label style="font-family: Calibri;color: gray;">Multiple User Claims<span style="color:red; font-size:2">*</span></label>
                                             <select class="form-control" name="multiplesStr" onchange="multipleCheckValidation()" id="multiplesValue" style="width: 50%;">
	                                            <option value="0" ${giftCoupon.multiples==true?'selected':''}>Yes</option>
    	                                        <option value="1" ${giftCoupon.multiples==false?'selected':''}>No</option>
                                            </select>
										</div>
										<!-- <input type="hidden" id="multiplesValue" name="multiplesSStr" value=""> -->
                                     	<div class="form-group col-lg-2" style="">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="no.of.coupons.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" style="width: 50%;" id="quantity" name="quantity" value="${giftCoupon.quantity}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errQuantity"></span>
                                    	</div>
                                    	
                                    	
                                    	<div class="form-group col-lg-2" style="">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="no.of.claims.label" /></label>
                                            <input type="text" class="form-control" style="width: 60%;" id="nofClaims" name="noOfCliams"  value="${giftCoupon.noOfCliams}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                             <span style="color:red; font-size:2" id="errnofClaims"></span> 
                                    	</div>
                                    	
                                    
                                    <!--   <div class="form-group col-lg-2" >
										   <label style="font-family: Calibri;color: gray;">Discount value</label>
	 									   <input type="text" class="form-control" id="discount" name="unitCashValue" placeholder="XX.XX"/>
										
										</div> -->
                                    	</div>
                                    	
                                    <div class="row"  >
                                    		<div class="form-group col-lg-2">
                                    		<div class="col-lg-12 ">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="promo.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="promoName" name="promoName" value="${giftCoupon.promoName}"/>
                                             <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errPromoName"></span>
                                             </div>
                                     		</div> 
                                    	<div class="form-group col-lg-2" style="padding-right:35px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="expiry.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="expiryDateStr" id="expiryDate" size="20" type="text" value="${giftCoupon.expiryDateStr}" onfocus="callCalender('expiryDate')" onclick="callCalender('expiryDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                       		  <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="expiryDateError"></span>
                                         </div>
                                      <div class="form-group col-lg-2" style="">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" style="width: 65%;"  name="validityPeriod" id="validityPeriod" value="${giftCoupon.validityPeriod}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.no.of.days.label" />"/>
                                              <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errValidityPeriod"></span>
                                    	</div>
                                    	<div class="form-group col-lg-2" >
                                            <label style="font-family: Calibri;color: gray;"  ><spring:message code="split_claim.label" /></label>
                                          
                                             <select class="form-control" name="limitedUseCouponStr" id="limitedUseCoupon" onchange="limitCheckValidation()" style="width: 50%;">
	                                            <option value="0">Yes</option>
    	                                        <option value="1">No</option>
                                            </select>
                                           
										</div>
										<!-- <div class="form-group col-lg-1" >
										<br>
										</div> -->
                                    	<div class="form-group col-lg-2" style="white-space: nowrap;" >
                                            <label style="font-family: Calibri;color: gray;" ><spring:message code="split_claim_coupon.label" /></label>
                                              <input type="text" class="form-control" id="noOfClaimsLimited" style="width: 65%;" readonly name="noOfClaimsLimited"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
										<span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="SplitClamesError"></span>
										</div>
										
											<div class="form-group col-lg-2" style="">
                                             <label style="font-family: Calibri;color: gray;">Max Discount<span style="color:red; font-size:2">*</span></label></label>
                                            <input type="text" class="form-control" style="width: 60%;" id="max_discount_amount" name="max_discount_amount" value="${giftCoupon.max_discount_amount}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" class="clearErrors;font-weight: bold;" id="errMaxDiscValue"></span>
                                       
                                     	</div>
                                    	
										
                                    	
                                    </div>	
                                    	<div class="row">
                                    	<div class="from-group col-lg-2" >
                                    	  <div class="col-lg-12" >
                                    	   <label style="font-family: Calibri;color: gray;"><spring:message code="minBillAmt.label" /></label> 
                                    	 <input type="text" class="form-control" style="width: 80%;" id="minsaleamount" name="min_sale_amount" value="${giftCoupon.min_sale_amount}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	 <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="minBillError"></span>
                                    	 </div>
                                    	</div>
<!-- 										<div class="from-group col-lg-1" ></div> -->
										<div class="from-group col-lg-2" >
										   <label style="font-family: Calibri;color: gray;"><spring:message code="maxBillAmt.label" /> <span style="color:red; font-size: 2" >*</span></label>
<!-- 										    <span style="color:red; font-size:2">*</span> -->
										 <input type="text" class="form-control" style="width: 80%;" id="max_sale_amount" name="max_sale_amount" value="${giftCoupon.max_sale_amount}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
										<span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="maxBillError"></span>
										</div>
								
										
								
								<div class="form-group col-lg-2" >
										   <label style="font-family: Calibri;color: gray;">Discount Total</label>
	 									   <input type="text" style="width: 65%;" class="form-control" id="discountTotal" readonly name="totalCashValue" value="${giftCoupon.totalCashValue}" placeholder="Enter Discount Total"/>
										</div>
								
										
										<div class="form-group col-lg-2" >
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="discounttype.label" /> <span style="color:red; font-size: 2" >*</span></label>
                                             <select class="form-control" name="discountType" id="discountType" style="width: 50%;">
	                                          <option value="Flat" ${giftCoupon.discountType=='Flat'?'selected':''}>Flat</option>
    	                                        <option value="percentage" ${giftCoupon.discountType=='percentage'?'selected':''}>Percentage</option>
                                            </select>
										</div>
										<div class="form-group col-lg-2" >
								 
                                             <label style="font-family: Calibri;color: gray;">Coupon value</label> <span style="color:red; font-size:2">*</span>
                                            <input type="text" class="form-control" style="width: 65%;" id="unitCashValue" name="unitCashValue" value="${giftCoupon.unitCashValue}" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" autocomplete="off"/>
                                            <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errUnitCashValue"></span>
                                          
                                            </div>
										<div class="form-group col-lg-2" >
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status" style="width: 60%;">
	                                            <option value="Active"${'Active' == giftCoupon.status ? 'selected' : ''}>Active</option>
    	                                        <option value="Suspend"${'Suspend' == giftCoupon.status ? 'selected' : ''}>Suspend</option>
                                            </select>
										</div> 
										
										
										<%-- <div class="from-group col-lg-2" style="top:20px;right: 15px;">
									
										<label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
										<div class="col-lg-1">
											<input type="checkbox" id="otpRequired" name="requiredOTP" value="0">
										
									</div>
								</div>  --%>
										
									</div>
									<div class="row">
									<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;">
									<div class="form-group col-lg-12" >
									
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="productGroup.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="productGroup" id="productGroup" style="width: 90%;">
	                                            <option value="" >ALL</option>
	                                        
	                                        <c:forEach var="groupsList" items="${groupsList}">
	                            			 <option value="${groupsList.groupId}" >${groupsList.groupId}</option>
	                                        
											</c:forEach>
	                                        
	                                        
	                                            </select>
										</div> 
										</div>
										
										<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
										<div class="form-group col-lg-12" >
									
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="customer.group.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="customerGroupval" id="customerGroupval" style="width: 90%;">
	                                            <option value="" >ALL</option>
	                                        
	                                        <c:forEach var="groupsid" items="${groupids}">
	                            			 <option value="${groupsid}" >${groupsid}</option>
	                                        
											</c:forEach>
	                                        </select>
										</div> 
										</div>
									
										<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
										<div class="form-group col-lg-12">
										   <label style="font-family: Calibri;color: gray;">Per User Claims</label>
	 									   <input type="text" style="width: 73%;" class="form-control" id="perUserClaims" name="perUserClaims" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${giftCoupon.perUserClaims}" placeholder="Enter user claims"/>
									       <span style="color:red; font-size:2;font-weight: bold;" id="errperUserClaims"></span>
										</div>
										</div>
										
										<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
										<div class="form-group col-lg-12">
										   <label style="font-family: Calibri;color: gray;">Split Period</label>
	 									   <input type="text" style="width: 73%;" class="form-control" id="splitPeriod" name="splitPeriod" value="${giftCoupon.splitPeriod}" placeholder="Enter split claims"/>
										   <span style="color:red; font-size:2;font-weight: bold;" id="errsplitPeriod"></span>
										</div>
										</div>
											
									<!-- <div class="from-group col-lg-2">
									<hr style="width:100%;margin-left:1%;margin-bottom:1px" />	
									</div> -->
								
								<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
										<div class="form-group col-lg-12">	
										   <label style="font-family: Calibri;color: gray;"><spring:message code="couponType.label" /> <span style="color:red; font-size: 2" >*</span></label>
                                             <select class="form-control" name="isDiscountCoupon" id="isDiscountCoupon" style="width: 100%;">
	                                        <option value="paid" ${giftCoupon.couponType=='paid'?'selected':''}>Paid Coupon</option>
    	                                        <option value="discount" ${giftCoupon.couponType=='discount'?'selected':''}>Discount Coupon</option>
                                            </select>
                                            </div>
										</div>
								
								 <div class="from-group col-lg-2" style="padding-left: 0px;">
									<div class="col-lg-12" style="padding-left:0px;">
									   <label style="font-family: Calibri;color: gray;"><spring:message code="crm.auto.generated" /></label>
										<div class="col-lg-1">
											<input type="checkbox" id="autoCoupons" name="genareteCoupons" value="0">
									
									</div>
										
									</div>
									<div class="col-lg-12" style="padding-left:0px;">
									   <label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
										<div class="col-lg-1">
											<input type="checkbox" id="otpRequired" name="requiredOTP" value="0">
										
									</div>
										
									</div>
										
								</div> 
									</div>
									</div>
								<div class="row">
									 <div class="form-group col-lg-2">
										 <%-- <div class="row" style="margin-left: 1%">
										 <label style="font-family: Calibri;color: gray;" style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
										 <div class="col-lg-12">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.country.label" /></label>
                                           <!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
                                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
												<!-- <option >Select Country</option> -->
											</select>
											</div>
                                     	</div>
									</div>
								<div class="row">
                                      	<div class="form-group col-lg-3">
                                      		<div class="col-lg-12">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="zones.all" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocationsBasedonZones();" id ="zones" multiple="multiple" class="form-control" >
    										 <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${giftCoupon.zones}">
    										    <c:if test="${zonestr == zoneList.zoneID}">
    										    	<c:set var="zs" value="true"/>
    										    </c:if>
    										    
    										    </c:forEach>
    										    <c:choose>
    										    <c:when test="${zs == 'true'}">
													<option selected value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:when>
						 					  <c:otherwise>
													<option  value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:otherwise>
						 					</c:choose>
							 					
						 					
						 					</c:forEach>	<!-- <option >Select State</option> -->
    										</select>
    										<span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errStates"></span>
    										</div>
                                    	</div>
                                    	<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control" >
    											<c:forEach var="locationDetails" items="${locationsbasedzone}">
												<option value="${locationDetails}">${locationDetails}</option>
											</c:forEach>
    										</select>
    										<span style="color:red; font-size:2;font-weight: bold" id="errLocation"></span>
                                    	</div>
                                    	<div class="col-lg-7" style="left:0px">
                                    	<div class="col-lg-4" style="padding:0px">
                                    	<label style="font-family: Calibri;color: gray;"><strong>Discount Coupons Generated</strong></label>
                                    	</div>
                                    	<div class="col-lg-6" style="padding-right: 0px;margin-bottom: 5px;">
                                    	
										<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="coupons" name="uploadedfilePath" onchange="addNameToTextBox('coupons');" /> 
										<b><span id="fileNameShow" Style="color:blue;display:block;"></span></b>
										<input type="hidden" id="coupons_refId" name="coupons" /> 
										<input type="hidden" id="coupons_name" />
                                    	</div>
                                    	<div class="col-lg-2" style="padding-right: 0px;">
                                    	<!-- <input type="button" class="btnCls" style="width: 100%;font-size: 15px;padding: 4px 4px;" onclick="importDataxls()" value="Import"> -->
                                    	<input type="button" class="btnCls" id="importCoupouns" onclick="importEnableEffect('importCoupouns')" style="width: 100%;font-size: 15px;padding: 4px 4px;"  value="Import">
                                    	<img style="width: 27px;margin-left: 35px;margin-top: -29px;display: none;" id="importCoupounscircleWait" src="${pageContext.request.contextPath}/images/circleWait.gif">
                                    	<img style="width: 27px;margin-left: 35px;margin-top: -26px;display: none;" id="importCoupounsTick" src="${pageContext.request.contextPath}/images/Tick.png">
                                    	</div>
                                    	<table class="table table-striped table-bordered">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-3" style="text-align: left"><spring:message code="gift.coupon.id.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                              </tr>      	
				                             </thead>
                                    	</table>
                                    	</div>
									  </div>
<%-- 									<input type="hidden" id="selectedStateList"   value="${statesList}">   --%>
									  
                                     <input type="hidden" id="selectedZone" name="selectdZones" value="${giftCoupon.zones}">
                                     <input type="hidden" id="selectedLocation" name="locations" value="${giftCoupon.zoneLocations}">
                                      <input type="hidden" id="selectedAllLocation" value="${locationList}">
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" style="" onclick="validateGiftCoupons('new','giftCoupons')" value="<spring:message code="submit.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btnCls buttonMargin" style="" onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                         <c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == true}">
						<input type="button" class="btnCls buttonMargin" style="" onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
					<br/>
                 <div class="box-footer">
                  
                 </div>
             </form>
         </div>
                            
</div>
</div>
</section><!-- /.content -->
  <!-- InputMask -->
       <%--  <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#createdOn").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                $("#expiryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script> --%>
</body>
</html>