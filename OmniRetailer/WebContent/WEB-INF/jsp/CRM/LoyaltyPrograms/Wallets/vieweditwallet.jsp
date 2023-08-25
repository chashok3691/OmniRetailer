 <!-- * Project Name 	    : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : CRM/LoyaltyPrograms/Wallets/EDITWALLET.jsp
 * file type		        : JSP
 * description				: To display the Wallets details by using this jsp. -->

 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                  <script type="text/javascript" src="${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
         
         
         	 <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/wallets.js"></script>  --%>
<style type="text/css">


.col-lg1-2{
    width: 25% !important;
}

.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%; */
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

 #button {
                border-radius: 50%;
                border: 1px solid black;
                padding-top: 3px;
                padding-bottom: 3px;
            }
            #info {
                margin-left: 5%;
            }
            #help_container {
                border: 0.5px solid black;
                background-color: #efefef;
                width: 20%;
            }
            #close {
                float: right;
                margin-top: 1%;
                background-color: #efefef;
                border: 0px solid #efefef;
            }
            #help_text {
                margin: 5%;
                font-family: Arial;
                font-size: 15px;
            }
            
            
 input[type="text"][title]:hover:after {
    font-style: italic;
    color:red;
}
      
      .name{
  width: 100% !important;
  text-align: left;
}      
</style> 
 <script type="text/javascript"> 
 $(document).ready(function(){
	debugger;
	/* callCalender("createdDate");
	callCalender("date"); */
	
	callCalender("startdate");
	callCalender("expirydate");
	debugger;
	print_country("country");
 $("#country").val("India");
 
 var slectedLocations = $("#LocationString").val().replace('[','').replace(']','').replace(/, /g,',');
	$("#location").val(slectedLocations.split(','));
	
	
	
	
	$("#searchWallets").val($("#searchname").val());
	$("#searchWallets").focus();  
	
	
	
	
$('#searchChildWallet').on('input',function(e){
	if($(this).val().trim()==""){
		//viewWallets('wallet','Wallet','0','menu');
		var id = $('#promoCode').val();
		editWalletForPagination(id,'0')
	}
});

 $('#mySearch').click(function(){
        var search = $('#searchWallets').val();
       // return viewWallets('wallet','Wallet','0','menu');
        return  viewEditWallet('','edit','0','')  
 });
 
    $('#searchWallets').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });
	
	

}); 
 
 	
 
</script> 
</head>
<body>
 <div id="generatedWallets">
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                               
                            
                               
                                 <div class="box-header" align="center" >
                                
                               
                                    <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;">${walletList.walletProgramId}-Details</h3>
                                
          <c:if test="${operation == 'view'}">
                                
           <div style="pointer-events: none;">
           
           </c:if>
            <c:if test="${operation != 'view'}">
           <div>               
             </c:if>             
                             <br>
                             <br>   
                                    <div id="error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                    <div id="success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    <input type="hidden" id="operationwallet" value="${operation}">
                           <div id="url" class="Error" style="text-align: center;">
                                       <div id="errr" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${errorMsg }</div>
                                         <c:choose>
											<c:when test="${empty url }" >
												
                                           </c:when>
											<c:otherwise>
												 <span>To get the file Log details--</span><a id="htpUrl" href=${url } target="_blank" style="color: #0000EE">click here</a>
                                            </c:otherwise>
											</c:choose>
                                      
                                     </div>
                                        <form id="walletsForm">
                                       <div style="background: #efefef;padding: 4px 20px;">
                                        <div class="row">
                                   		<div class="form-group col-lg-2" style="padding-right: 35px;white-space: nowrap;margin-bottom: 0px !important;">
                                   		<div class="col-lg-10" style="">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="wallet.program.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="promoCode"  name="walletProgramId" value="${walletList.walletProgramId}" style="width: 100%;"/>
                                              <span class="clearErrors" style="color:red; font-size:2;white-space: nowrap;;font-weight: bold;" id="errpromoCode"></span>
                                     	</div>
                                     	</div>
                                   		
										<div class="form-group col-lg-2" style="padding-right:35px;margin-bottom: 0px !important;">
										
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="import.Start_Date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="createdDate" id="startdate" size="20" type="text" value="${walletList.startDateStr}" onfocus="callCalender('startdate')" onclick="callCalender('startdate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		 <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="createdOnError"></span>
                                        	</div>
										<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
										<div class="form-group col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;"  ><spring:message code="auto.assigned.label" /></label>
                                             <select class="form-control" name="" id="assignedStatus" style="width: 100%;">
	                                            <option value="true" ${walletList.autoAssigned == 'true' ? 'selected' : ''}>Yes</option>
    	                                        <option value="false" ${walletList.autoAssigned == 'false' ? 'selected' : ''}>No</option>
                                            </select>
                                            </div>
										</div>
										<div class="form-group col-lg-2" style="margin-bottom: 0px !important;" >
										<div class="form-group col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="wallet.type.label" /></label>
                                             <select class="form-control" name="walletType" onchange="multipleCheckValidation()" id="walletType" style="width: 100%;">
	                                            <option value="Bronze"${walletList.walletType == 'Bronze' ? 'selected' : ''} >Bronze</option>
    	                                        <option value="Silver"${walletList.walletType == 'Silver' ? 'selected' : ''}>Silver</option>
        	                                    <option value="Techno"${walletList.walletType == 'Techno' ? 'selected' : ''}>Techno</option>
        	                                    <option value="Platinum"${walletList.walletType == 'Platinum' ? 'selected' : ''}>Platinum</option>
        	                                    <option value="Gold"${walletList.walletType == 'Gold' ? 'selected' : ''}>Gold</option>
        	                                     <option value="General"${walletList.walletType == 'General' ? 'selected' : ''}>General</option>
                                            </select>
										</div>
										</div>
										<!-- <input type="hidden" id="multiplesValue" name="multiplesSStr" value=""> -->
                                     	<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
                                     	<div class="form-group col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="min.balance.label" /></label>
                                            
                                            <c:choose>
											<c:when test="${walletList.minCashDeposit >0}">
												<input type="text" class="form-control" style="width: 100%;" id="minbalance" name="minCashDeposit" value="${walletList.minCashDeposit}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           </c:when>
											<c:otherwise>
												<input type="text" class="form-control" style="width: 100%;" id="minbalance" name="minCashDeposit" value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </c:otherwise>
											</c:choose>
                                           
                                            <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errQuantity"></span>
                                    	</div>
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
                                    	<div class="form-group col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="membership.price.label" /></label>
                                            
                                            <c:choose>
											<c:when test="${walletList.activationFee >0}">
												<input type="text" class="form-control" style="width: 100%;" id="membershipprice" name="activationFee"  value="${walletList.activationFee}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           </c:when>
											<c:otherwise>
												<input type="text" class="form-control" style="width: 100%;" id="membershipprice" name="activationFee"  value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           </c:otherwise>
											</c:choose>
											
                                    	</div>
                                    	</div>
                                    
                                    <!--   <div class="form-group col-lg-2" >
										   <label style="font-family: Calibri;color: gray;">Discount value</label>
	 									   <input type="text" class="form-control" id="discount" name="unitCashValue" placeholder="XX.XX"/>
										
										</div> -->
                                    	</div>
                                    	
                                    	
                                    	<div class="row">
                                   		<div class="form-group col-lg-2" style="white-space: nowrap;margin-bottom: 0px !important;">
                                   		<div class="col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="wallet.program.name" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="walletprogramname"  name="walletProgramName" value="${walletList.walletProgramName}" style="width: 110%;"/>
                                              <span class="clearErrors" style="color:red; font-size:2;white-space: nowrap;;font-weight: bold;" id="errpromoName"></span>
                                     	</div>
                                     	</div>
                                   		<%-- <div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="voucher.type.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="card_type" id="card_type">
	                                            <option value="Voucher">Voucher</option>
    	                                        <option value="Coupon">Coupon</option>
                                            </select>
										</div> --%>
										<div class="form-group col-lg-2" style="padding-right:35px;margin-bottom: 0px !important;">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="expiry.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="updatedDate" id="expirydate" size="20" type="text" value="${walletList.endDateStr}" onfocus="callCalender('expirydate')" onclick="callCalender('expirydate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		 <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="updatedOnError"></span>
                                        	</div>
										<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
										<div class="form-group col-lg-10" >
                                            <label class="name" style="font-family: Calibri;color: gray;white-space: nowrap"  ><spring:message code="validity.period.label" /><span style="color:red; font-size:2">*</span></label>
                                             <input type="text" class="form-control" style="width: 100%;" id="validityperiod" name="validityPeriod" value="${walletList.validityPeriod}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            
                                                  <span class="clearErrors" style="color:red; font-size:2;white-space: nowrap;;font-weight: bold;" id="errvalidityPeriod"></span>
                                            </div>
                                            
										</div>
										<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
										<div class="form-group col-lg-10" >
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="occasion.status.label" /></label>
                                             <select class="form-control" name="" onchange="multipleCheckValidation()" id="status" style="width: 100%;">
	                                            <option value="Active" ${walletList.status==true?'selected':''}>Active</option>
    	                                        <option value="Suspended" ${walletList.status==false?'selected':''}>Suspended</option>
                                            </select>
										</div>
										</div>
										<!-- <input type="hidden" id="multiplesValue" name="multiplesSStr" value=""> -->
                                     	<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
                                     	<div class="form-group col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="max.deposite.label" /></label>
                                            <c:choose>
											<c:when test="${walletList.maxCashDepositNum >0}">
												<input type="text" class="form-control" style="width: 100%;" id="maxdeposite" name="maxCashDeposit" value="${walletList.maxCashDepositNum}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </c:when>
											<c:otherwise>
												<input type="text" class="form-control" style="width: 100%;" id="maxdeposite" name="maxCashDeposit" value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </c:otherwise>
										</c:choose>
                                            <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errQuantity"></span>
                                    	</div>
                                    	</div>
                                    	
                                    	
                                    	<div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
                                    		<div class="form-group col-lg-10" >
                                    	
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="renewal.price.label" /></label>
                                            <c:choose>
											<c:when test="${walletList.renewalFee >0}">
												<input type="text" class="form-control" style="width: 100%;" id="renewalprice" name="renewalFee"  value="${walletList.renewalFee}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           </c:when>
											<c:otherwise>
												<input type="text" class="form-control" style="width: 100%;" id="renewalprice" name="renewalFee"  value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </c:otherwise>
										</c:choose>
                                    	</div>
                                    	</div>
                                    	
                                    
                                    
                                    	</div>
                                    	
                                    	
                                    		<div class="row">
                                   		<div class="form-group col-lg-2">
                                   		<div class="col-lg-10" style="width: 85%;white-space: nowrap">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="min.bill.amt" /></label>
                                              <c:choose>
											<c:when test="${walletList.minBillAmount >0}">
												 <input type="text" class="form-control" id="minbill"  name="minBillAmount" value="${walletList.minBillAmount}" style="width: 100%;"/>
                                             
											</c:when>
											<c:otherwise>
												 <input type="text" class="form-control" id="minbill"  name="minBillAmount" value="0" style="width: 100%;"/>
                                             </c:otherwise>
										</c:choose>
                                             
                                             
                                             <span class="clearErrors" style="color:red; font-size:2;white-space: nowrap;;font-weight: bold;" id="errpromoCode"></span>
                                     	</div>
                                     	</div>
                                   	
										<div class="form-group col-lg-2" style="padding-right:0px;">
										<div class="col-lg-10" style="width: 85%;white-space: nowrap;padding-left:0px;">
										
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="max.bill.amt" /></label>
                                           <c:choose>
											<c:when test="${walletList.maxBillAmt >0}">
												 <input type="text" class="form-control" style="width: 100%;" id="maxbill" name="maxBillAmount" value="${walletList.maxBillAmt}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                          
											</c:when>
											<c:otherwise>
												 <input type="text" class="form-control" style="width: 100%;" id="maxbill" name="maxBillAmount" value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
											</c:otherwise>
										</c:choose>
                                           
                                             
                                       		 <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="maxbillError"></span>
                                        	</div>
                                        	</div>
                                        	
                                        	<div class="form-group col-lg-2" style="padding-right:0px;">
											<div class="col-lg-10" style="width: 85%;white-space: nowrap;">
											 <label class="name" style="font-family: Calibri;color: gray;">SignUp Cash</label>
											 <c:choose>
											<c:when test="${walletList.signupCash >0}">
												<input type="text" class="form-control" style="width: 100%;" id="signupCash" name="signupCash" value="${walletList.signupCash}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
											</c:when>
											<c:otherwise>
												<input type="text" class="form-control" style="width: 100%;" id="signupCash" name="signupCash" value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                              </c:otherwise>
										</c:choose>

                                            <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id=""></span>
                                        	</div>
                                        	</div>
										
										    <div class="form-group col-lg-2" style="padding-right:0px;">
											<div class="col-lg-10" style="width: 85%;white-space: nowrap;">
											 <label class="name" style="font-family: Calibri;color: gray;">No Of Wallets </label>
											 <c:choose>
											<c:when test="${walletList.maxBillAmt >0}">
												 <input type="text" class="form-control" readonly style="width: 100%;" id="noOfwallets" name="noOfwallets" value="${walletList.noOfWallets}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                          
											</c:when>
											<c:otherwise>
												 <input type="text" class="form-control" readonly style="width: 100%;" id="noOfwallets" name="noOfwallets" value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
											</c:otherwise>
										    </c:choose>
                                            <span class="noOfwalletsErrors" style="color:red;font-weight: bold;" id="noOfwalletsErrors"></span>
                                        	</div>
                                        	</div>
                                            <div class="form-group col-lg-2" style="margin-bottom: 0px !important;">
                                     	<div class="form-group col-lg-10" style="width:100%">
                                            <label class="name" style="font-family: Calibri;color: gray;">Max Topup Amt</label>
                                            <c:choose>
											<c:when test="${walletList.maxTopupAmt >0}">
												<input type="text" class="form-control" style="width: 100%;" id="maxTopupAmt" name="maxTopupAmt" value="${walletList.maxTopupAmt}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </c:when>
											<c:otherwise>
												<input type="text" class="form-control" style="width: 100%;" id="maxTopupAmt" name="maxTopupAmt" value="0" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </c:otherwise>
										</c:choose>
                                            <span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id=""></span>
                                    	</div>
                                    	</div>
                                      <%--  <div class="from-group col-lg-2" style="padding-left: 0px;">
                                       <c:if test="${operation == 'view'}">
                                    	 <c:choose>
											<c:when test="${walletList.autoGenerated =='true'}">
												<input type="checkbox" checked id="autoGenerated"
													class="autoGenerated" value="true">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="autoGenerated" class="autoGenerated"
													value="false">
											</c:otherwise>
										</c:choose>
                                    	 </c:if>
                                    	  <c:if test="${operation == 'edit'}">
                                    	  <c:choose>
											<c:when test="${walletList.autoGenerated =='true'}">
												<input type="checkbox" checked id="autoGenerated"
													class="autoGenerated" value="true">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="autoGenerated" class="autoGenerated"
													value="false">
											</c:otherwise>
										</c:choose>
                                    	  </c:if>
                                    	  <label style="font-family: Calibri;color: gray;"><spring:message code="crm.auto.generated" /></label>
                                       </div> --%>
                                    	
                                    	<div class="from-group col-lg-2" style="padding-left: 14px;margin-left: 0;padding-right: 9px;">
                                    	<div style=" padding-left: 0px;">
                                    	 <c:if test="${operation == 'view'}">
                                    	 <c:choose>
											<c:when test="${walletList.otpRequired =='true'}">
												<input type="checkbox" checked id="otpRequired"
													name="" value="true">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="otpRequired" name=""
													value="false">
											</c:otherwise>
										</c:choose>
                                    	 </c:if>
                                    	  <c:if test="${operation == 'edit'}">
                                    	  <c:choose>
											<c:when test="${walletList.otpRequired =='true'}">
												<input type="checkbox" checked id="otpRequired"
													name="" value="true">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="otpRequired" name=""
													value="false">
											</c:otherwise>
										</c:choose>
                                    	  
                                    	  </c:if>
                                    	  
                                    	  <c:if test="${operation != 'edit' && operation!='view'}">
                                    	  <input type="checkbox" id="otpRequired" name=""
													value="true">
                                    	  </c:if>
										

									<label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
								</div>
										
										<div style="padding-left: 11px;">
										
                                       <c:if test="${operation == 'view'}">
                                    	 <c:choose>
											<c:when test="${walletList.autoGenerated =='true'}">
												<input type="checkbox" checked id="autoGenerated"
													class="autoGenerated" value="true">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="autoGenerated" class="autoGenerated"
													value="false">
											</c:otherwise>
										</c:choose>
                                    	 </c:if>
                                    	  <c:if test="${operation == 'edit'}">
                                    	  <c:choose>
											<c:when test="${walletList.autoGenerated =='true'}">
												<input type="checkbox" checked id="autoGenerated"
													class="autoGenerated" value="true">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="autoGenerated" class="autoGenerated"
													value="false">
											</c:otherwise>
										</c:choose>
                                    	  </c:if>
                                    	  <label style="font-family: Calibri;color: gray;"><spring:message code="crm.auto.generated" /></label>
                                       </div>
										
										
										<%-- 
											<input type="checkbox" id="otpRequired" name="" value="true">
										<label  style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label> --%>
										
										
									
								</div> 
                                    	
                                    
                                    
                                    	</div>
                                    	</div>
                                    	</form>
                                <div class="col-lg-12">     	
                                 <div class="col-lg-2">     	
                                    
                                    	
                                  <label  style="margin-left: -93%;text-decoration: underline;">Locations</label>
                                  </div>  	
                                                                  <div class="col-lg-10">     
                                                                  </div>	
                                  
                                </div>  

                                 	<div class="row">
                                    	
									 <div class="form-group col-lg-2">
									 
									 
										
										 <div class="col-lg-12">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="loyalty.country.label" /></label>
                                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="Country" class="form-control" >
											</select>
											</div>
                                     	</div>
									</div>
								<div class="row">
                                      	<div class="form-group col-lg-3">
                                      		<div class="col-lg-12">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="zones.all" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocationsBasedonZones();" id ="zones" multiple="multiple" class="form-control" >
    										 <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${zones}">
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
                                    	<input type="hidden" value="${LocationString}" id="LocationString">
                                    	<div class="form-group col-lg-2">
                                            <label class="name" style="font-family: Calibri;color: gray;"><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control" >
    											<c:forEach var="locationDetails" items="${locationsbasedzone}">
												<option value="${locationDetails}" >${locationDetails}</option>
											</c:forEach>
    										</select>
    										<span style="color:red; font-size:2;font-weight: bold" id="errLocation"></span>
                                    	</div>
                                    	<div class="col-lg-7" style="left:0px;margin-top: 18px;">
                                    	
                                    	<div class="col-lg-4" style="padding:0px;pointer-events: all;">
										<input type="text"  class="form-control searchItems" value="${searchCriteria}" id="searchChildWallet"  placeholder="Search Wallets here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchWalletChildItemslist" style=""></ul>
						   						</div>
											</div>
									</div>
                                    	
                                    	
                                    	
                                    	<!-- <div class="col-lg-3" style="padding-right: 0px;margin-bottom: 5px;">
										<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="coupons" name="uploadedfilePath" onchange="" /> 
										<input type="hidden" id="coupons_refId" name="coupons" /> 
										<input type="hidden" id="coupons_name" />
										<input type="hidden" id="importStatus" />
										<input type="hidden" id="fileName" />
                                    	</div>
                                    	 -->
                                    	 <div class="col-lg-4" style="padding-right: 0px;margin-bottom: 5px;">
										<input type="file" id="importButton"class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="wallets" name="uploadedfilePath" onchange="addNameToTextBox('wallets');" /> 
										<b><span id="fileNameShow" Style="color:blue;display:block;text-align:left;"></span></b>
										<input type="hidden" id="coupons_refId" name="coupons" /> 
										<input type="hidden" id="coupons_name" />
										<input type="hidden" id="importStatus" />
										<input type="hidden" id="fileName" />
                                    	</div>
                                    	 
                                    	 
                                    	 <div class="col-lg-2" style="padding-right: 0px;">
                                    	<input type="button" class="btnCls" style="width: 100%;font-size: 15px;padding: 4px 4px;" onclick="importDataxls()" value="Import">
                                    	</div>
                                    	<div class="col-lg-2" style="padding-right: 0px; pointer-events: auto;">
                                    	<input type="button"
												class="addBtn btn bg-olive btn-inline addBtn"
												data-toggle="modal" data-target="#myModalIos"
												style="font-size: 14px;"
												value="<spring:message code="save.label" />" />
                                    	</div>
                                    	
                                    	
                                    	
                                    	
                                    	<div class="modal fade" id="myModalIos" role="dialog"
												tabindex="-1" style="pointer-events: auto;">
												<div class="modal-dialog iosmodeldialog">

													<!-- Modal content-->
													<div class="modal-content iospopup"
														style="width: 58% !important;height: 150px !important;">
														<div class="modal-header">

															<button type="button" class="close" onclick=""
																data-dismiss="modal">&times;</button>
														</div>
														<div class="modal-body">
															<div class="form-group col-lg-12"
																style="padding: 0px; font-size: 15px">
																Are you sure,you want to save the file

																<!-- <div class="col-lg-1"> -->
																<div id="generatedCoupons">
																	<input type="hidden" id="downloadurl"
																		value="${downloadurl}">
																</div>

																<!--  </div> -->
															</div>
															<div class="form-group col-lg-12"></div>
															<div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
															<div class="form-group col-lg-8 col-sm-8 col-xs-8"
																style="padding-left: 0px; padding-right: 0px;">
																<div class="col-lg-3 col-sm-4 col-xs-6"
																	style="margin-left: 29%;">
																	<input type="hidden" value="${giftCoupon.quantity}" />
																	<input type="hidden" value="${giftCoupon.noOfCoupons}" />
                                         <c:choose>
											<c:when test="${operation != 'view'}" >
												<input type="button" class="iosclosebutton1" style="width:75px"
																		onclick="ExportDataxls('${walletList.walletProgramId}','true','edit')"
																		value="Ok">
                                           </c:when>
											<c:otherwise>
												<input type="button" class="iosclosebutton1" style="width:75px"
																		onclick="ExportDataxls('${walletList.walletProgramId}','true','view')"
																		value="Ok">
                                            </c:otherwise>
											</c:choose>
																	


																</div>




																<!-- <div class="col-lg-1 col-sm-4 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div> -->
															</div>
															<br />
														</div>
														<br />
														<div class="modal-footer" style="padding: 0px;">
															<!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
														</div>
													</div>

												</div>
											</div>
											
											
											
                                    	<div id="tableforPagination">
                                    	<table class="table table-striped table-bordered">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-1" style="text-align: left"><spring:message code="wallet.id.label"/></th>
				                        	<th class="col-sm-2"><spring:message code="userName.label"/></th>
				                            <th class="col-sm-1"><spring:message code="mobile.num"/></th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                        	<th class="col-sm-1">Action</th>
				                         </tr>      	
				                             </thead>
				                             <tbody>
				                            <c:if test="${not empty walletList.wallets}"> 
											<c:forEach var="wallet" items="${walletList.wallets}" varStatus="theCount">
				                             <tr>
				                             <td>${theCount.count+index-1}</td>
				                             <td>${wallet.walletId}</td>
				                             <td>${wallet.customerName}</td>
				                             <td>${wallet.phoneNumber}</td>
				                             <td>${wallet.startdate}</td>
				                             <td>${wallet.enddate}</td>
				                             <c:if test="${wallet.status == 'true'}"> 
                                             <td>Active</td>
                                             </c:if>
                                             <c:if test="${wallet.status == 'false'}"> 
                                             <td>InActive</td>
                                             </c:if>
				                             <td> 	
				                             			                          
				                                <a style="color:#2e7ea7 !important;cursor: pointer;pointer-events:auto;" onclick="viewWalletsLedgers('${operation}','${walletList.walletProgramId}','${wallet.walletId}','${wallet.phoneNumber}','0')">View</a>
				                           <c:if test="${not empty  wallet.phoneNumber}">
                                            <a style="color:#2e7ea7" id="wallet" onclick="walletPopUp('${operation}','${walletList.walletProgramId}','${wallet.phoneNumber}','${wallet.customerName}','${wallet.status}','0','');">Edit</a>				               
                                                        </c:if>
				                                                    
                               </td>
                            
				                          
				                       
				                          
				                         <%--   <a style="color:#2e7ea7" id="wallet" onclick="walletPopUp('${operation}','${walletList.walletProgramId}','${wallet.phoneNumber}','0');">Edit</a></td>
 --%>				                           
				                             <!--  <a id="wallet" onclick="walletPopUp();">Edit</a></td> -->
				                           
				                              </tr> 
				                             </c:forEach>
				                            </c:if> 
				                             </tbody>
                                    	</table>
                                    
                                    	
                                    	
                                    	<div>
                                         <div id="triggerEvent"></div>
                                         </div>
                                    	
                <div class="row" style="pointer-events: auto;">
              	
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-4" style="text-align: left; pointer-events: auto;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="editWalletForPagination('${walletList.walletProgramId}','${totalValue}','${operation}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-4" style="text-align: left;pointer-events: auto;">
              		<input type="button" class='paginationButton' value="&#60;"     onclick=" return editWalletForPagination('${walletList.walletProgramId}','${index - (maxRecords+1)}','${operation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-4" style="text-align: left;pointer-events: auto;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-4" style="text-align: left;pointer-events: auto;">
              		
              		
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editWalletForPagination('${walletList.walletProgramId}','${index - (maxRecords+1)}','${operation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="editWalletForPagination('${walletList.walletProgramId}','${totalValue}','${operation}');">
              	</div> 
              	</c:if>
              	
              	<div class="form-group col-lg-2"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-4" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-4" style="padding-right: 0px; pointer-events: auto;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-4" style="padding-right: 0px;pointer-events: auto;">
              		  <input type="button" onclick="editWalletForPagination('${walletList.walletProgramId}',document.getElementById('pagination').value,'${operation}');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>
              	</div>
                                    	</div>
									  </div>
                           
       <div class="col-lg-12">
                                <div class="col-lg-3"></div>
                          
                           <c:if test="${operation != 'view'}">
                           
                             <c:if test="${operation == 'edit'}">
                                
          
                            <div class="col-lg-2">
                <input type="button" class="btn bg-olive btn-inline" style="width: 100px;
    margin-right: 10%;
  
    margin-top: 14px;"  onclick="validateWallet('edit');" value="Submit" />
	                   
	                    </div>
	                    </c:if>
	                       <c:if test="${operation != 'edit'}">
                                
          
                            <div class="col-lg-2">
                <input type="button" class="btn bg-olive btn-inline" style="width: 100px;
    margin-right: 10%;
  
    margin-top: 14px;"  onclick="validateWallet('new');" value="Submit" />
	                   
	                    </div>
	                    </c:if>
                           
                           </c:if>
                                <div class="col-lg-1"></div>
                        
                           <div class="col-lg-2">
               	<input type="button" class="btn bg-olive btn-inline" style="
    width: 100px;    margin-top: 11px;pointer-events:auto" onclick="viewWallets('Wallets','Wallet','0','menu');"  value="<spring:message code="cancel.label" />" />
                           </div>
                                                           <div class="col-lg-3"></div>
                           </div>
        </div>
        </div>  
 </div>
  </div>
  



  
<div id="customerWalletTransdiv">
<%@ include file="walletpopUP.jsp" %>
</div>
                     
 
  </section></div>
  </body>
  </html>          