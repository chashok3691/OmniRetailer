<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : RaviTeja.N
 * file name		        : B2C/PaymentGateWay/viewPaymentPage.jsp
 * file type		        : JSP
 * description				: The newFeaturedProductGroupMaster form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/paymentform.js"></script>
	
<style type="text/css">
</style>
<script>

$(document).ready(function(){


    $("input[type='checkbox']").on('change', function(){
       // $(this).closest('div').toggleClass('highlight');
      var id=$(this).val();
       if($('#'+id).prop('checked')==true)
    	   $('#'+id+1).val(id);
       else
    	   $('#'+id+1).val('');
    });

    
});

</script>

</head>
<body>

<!-- Main content -->

<section class="content">
 <div class="row">
   <div class="col-sm-12 col-xs-12  col-lg-12">
     <div class="box box-primary">
              <div class="box-header">
                  <h3 class="box-title"><b><spring:message code="paymentGateWay.heading" /></b></h3>
              </div><!-- /.box-header -->
 <div class="box-body table-responsive">
  
<input type="hidden" id="onlinesno" value="${onlinePaymentlist.sno}"/>
    <div class="well"><p><spring:message code="paymentGateWay.message"/> </p>
      
     <ol>
      <li><spring:message code="paymentGateWay.CreditCards"/></li>
      <li><spring:message code="paymentGateWay.DebitCards"/></li>
      <li><spring:message code="paymentGateWay.banks"/></li>
      <li><spring:message code="paymentGateWay.Wallets"/></li>
    </ol>

   </div>

<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
<div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>


<div class="row">
  
  <div class="col-sm-6 col-xs-6  col-lg-6" style="border-right: 1px solid #d2d6de;">

   <div class="row">
   <div class="col-lg-1"></div>
     <div class="col-sm-4 col-lg-4 col-xs-12" style=" padding-left:21px;" ><div><spring:message code="paymentGateWay.SelectPaymentGateWay.label"/></div></div>
   
     <div class="col-sm-5 col-lg-5" style="padding-left: 0px" >

     <!-- <div class="container">-->
        <form role="form">
         <div class="form-group">
          <select id="selectedPaymentGateway" class="form-control" >
   			   <option value="citrus"${onlinePaymentlist.organizationName=='citrus'  ? 'selected' : ''}>CITRUS</option>
            <option value="payu"${ onlinePaymentlist.organizationName=='payu'  ? 'selected' : ''}>PAYU</option>
            <option value="ccavenue"${ onlinePaymentlist.organizationName== 'ccavenue'  ? 'selected' : ''}>CCavenue</option>
            <option value="paypal"${ onlinePaymentlist.organizationName =='paypal' ? 'selected' : ''}>PayPal</option>
          </select>
      
         </div>
       </form>
      </div>    
   </div>


   <div class="row">
    <div class="col-lg-1"></div>
    <div class="col-sm-4 col-lg-4 col-xs-6" style=" padding-left: 21px;  padding-top: 20px;" ><spring:message code="paymentGateWay.CardSupported.label"/></div>
  
  <div class="col-lg- 5 col-sm-5 col-xs-12" style=" border-left: 1px solid  #d2d6de;">
  
  <form role="form">

     <div class="row">
     
       
        <div class="col-sm-4  col-lg-3 col-xs-5 "  align="left"><spring:message code="paymentGateWay.MasterCard.label"/></div>
        
         <div class="col-sm-1" >
         
         <c:choose>
         <c:when test="${onlinePaymentlist.masterCard=='true'}">
         <input id="checkboxmaster"    type="checkbox" checked style="  width: 43px;  height: 17px;">
         </c:when>
         <c:otherwise>
         <input id="checkboxmaster"    type="checkbox" style="  width: 43px;  height: 17px;">
         </c:otherwise>
         </c:choose>
         
          
        </div>

     </div>


 <div class="row">
       
        <div class="col-sm-4  col-lg-3 col-xs-5"   align="left"><spring:message code="paymentGateWay.VisaCard.label"/></div>
        
        <div class="col-sm-1">
       
          <c:choose>
         <c:when test="${onlinePaymentlist.visaCard=='true'}">
         <input id="checkboxvisa"  type="checkbox" checked value="" style="  width: 43px;  height: 17px;">
         </c:when>
         <c:otherwise>
          <input id="checkboxvisa"  type="checkbox"  value="" style="  width: 43px;  height: 17px;">
         </c:otherwise>
         </c:choose>
   
      </div>
  </div>
 
   <div class="row">
        
        <div class="col-sm-4  col-lg-3 col-xs-5"  align="left"><spring:message code="paymentGateWay.AmexCard.label"/></div>
          <div class="col-sm-1" >
  			
  			<c:choose>
  			<c:when test="${onlinePaymentlist.amexCard=='true'}">
  			 <input id="checkboxamex"  checked type="checkbox" checked value="" style="  width: 43px;  height: 17px;">
  			</c:when>
  			<c:otherwise>
  			 <input id="checkboxamex"   type="checkbox" value="" style="  width: 43px;  height: 17px;">
  			</c:otherwise>
  			</c:choose>
          
   
         </div>
     </div>
    </form>
  
  </div>
  
   </div>
  
   <div class="row">
   <div class="col-lg-1"></div>
     <div class="col-sm-4 col-lg-4 col-xs-8" style=" padding-left: 21px; padding-right: 0px"><spring:message code="paymentGateWay.StoreCard.label"/></div>
     
     <div class="col-sm-1" align="left" style=" margin-left: -30px;" >
     <c:choose>
  			<c:when test="${onlinePaymentlist.storeCardInfo=='true'}">
  			 <input id="checkboxinfo" type="checkbox" checked value="" style="  width: 43px;  height: 17px;">
  			</c:when>
  			<c:otherwise>
  			 <input id="checkboxinfo" type="checkbox" value="" style="  width: 43px;  height: 17px;">
  			</c:otherwise>
  			</c:choose>
     </div>

   </div>
   
  <br>
   
   <div class="row">
    <div class="col-sm-1 col-lg-1 "></div>
     <div class="col-sm-5 col-lg-5 " style=" padding-left: 21px; padding-right: 0px"><div style="font-weight: bold;"><spring:message code="paymentGateWay.Merchant_Credentials.label"/></div></div><br>
    <br>
     <div class="col-sm-1 col-lg-1 "></div>
<div class="col-sm-10 col-lg-8 ">
     <div class="col-sm-6 col-lg-6 " style="padding-right: 0px"><div><spring:message code="paymentGateWay.Login_Id.label"/></div></div> 
     
     <div class="col-sm-5 col-lg-6 col-xs-10" style="padding-right: 0px;    padding-left: 0px;">
       <input id="merchantId" type="text" value="${onlinePaymentlist.onlineMerchantId}" style="width: 125%;padding:3px;">
     </div>

   </div><br><br>
<div class="col-sm-1 col-lg-1 "></div>
<div class="col-sm-10 col-lg-8 ">
     <div class="col-sm-6 col-lg-6 " style=""><div><spring:message code="paymentGateWay.Password.label"/></div></div> 
     
     <div class="col-sm-5 col-lg-6 col-xs-10" style="padding-right: 0px;    padding-left: 0px;">
     
       <input id="merchantKey" type="text" value="${onlinePaymentlist.onlineMerchantPwd}" style="width: 125%;padding:3px;">
     </div>

   </div></div>
   
    
  </div>

 
<div class="col-sm-6 col-xs-6" >

  <div class="row">
  <div class="col-lg-1"></div>
     <div class="col-sm-4 col-lg-4 col-xs-12"><spring:message code="paymentGateWay.WalletAggregator.label"/></div>
   
     <div class="col-sm-5 col-lg-5 col-xs-10" style="padding-left: 0px" >
 <%-- <c:set var="WalletAggregator" value="${fn:split(dateString, ',')}" />
 <input type="hidden" name="day" value="${WalletAggregator[0]}" />
<input type="hidden" name="month" value="${WalletAggregator[1]}" />
<input type="hidden" name="year" value="${WalletAggregator[2]}" /> --%>
     <!-- <div class="container">-->
        <form role="form">
         <div class="form-group">
         <!--<label for="sel1">Select list (select one):</label>-->
           
          <select class="form-control" id="selectedWalletAggregator">
            <option value="citrus"${onlinePaymentlist.onlineBankingAggregator=='citrus' ? 'selected' : ''}>CITRUS</option>
            <option value="payu"${ onlinePaymentlist.onlineBankingAggregator=='payu'  ? 'selected' : ''}>PAYU</option>
            <option value="ccavenue"${ onlinePaymentlist.onlineBankingAggregator== 'ccavenue'  ? 'selected' : ''}>CCavenue</option>
            <option value="paypal"${ onlinePaymentlist.onlineBankingAggregator =='paypal' ? 'selected' : ''}>PayPal</option>
          </select>
      
         </div>
       </form>
      </div>    
   </div>

 

   <div class="row">
   <div class="col-lg-1"></div>
     <div class="col-sm-4 col-lg-4 col-xs-12" style=" padding-top: 20px;"  ><spring:message code="paymentGateWay.WalletSupported.label"/></div>
      <div class="col-sm-5 col-lg-4" style=" border-left: 1px solid  #d2d6de;" >
   
   <form role="form">
     <c:set var="string1" value="${onlinePaymentlist.walletAggregator}"/>
		<c:set var="string2" value="${fn:split(string1, ',')}" />
		<input type="hidden" value="${string1}"/>
		<input type="hidden" value="${string2[0]}"/>
		<input type="hidden" value="${string2[1]}"/>
		<input type="hidden" value="${string2[2]}"/>
  
   
   <div class="row">
        
        <div class="col-sm-6 col-lg-6 col-xs-5"  align="left"><spring:message code="paymentGateWay.Wallet_PayTM.label"/></div>
        
        <div class="col-sm-1" >
   
     <c:choose>
     <c:when test="${string2[0]=='PayTM'}">
       <input id ="PayTM1" type="hidden" value="PayTM">
       <input id ="PayTM" type="checkbox" checked value="PayTM" style="  width: 43px;  height: 17px;" >
     </c:when>
     <c:otherwise>
      <input id ="PayTM1" type="hidden" value="">
       <input id ="PayTM" type="checkbox" value="PayTM" style="  width: 43px;  height: 17px;" >
     </c:otherwise>
     </c:choose>
       
   
      </div>


    </div>

  <div class="row">
      
        <div class="col-sm-6 col-lg-6 col-xs-5" align="left"><spring:message code="paymentGateWay.Wallet_OLA.label"/></div>
        <div class="col-sm-1" >
        
           <c:choose>
     <c:when test="${string2[1]=='OLA'}">
       <input id ="OLA1" type="hidden" value="OLA">
       <input id ="OLA" type="checkbox" checked value="OLA" style="  width: 43px;  height: 17px;" >
     </c:when>
     <c:otherwise>
        <input id ="OLA1" type="hidden" value="">
        <input id ="OLA" type="checkbox" value="OLA" style="  width: 43px;  height: 17px;" >
     </c:otherwise>
     </c:choose>
         
   
      </div>
  </div>

  <div class="row">
      
        <div class="col-sm-6 col-lg-6 col-xs-5"  align="left"><spring:message code="paymentGateWay.Wallet_MobiQwick.label"/></div>
        <div class="col-sm-1" >
         
        
            <c:choose>
     <c:when test="${string2[2]=='MobiQwick'}">
      <input id ="MobiQwick1" type="hidden" value="MobiQwick">
         <input id ="MobiQwick" type="checkbox" checked value="MobiQwick" style="  width: 43px;  height: 17px;" >
     </c:when>
     <c:otherwise>
          <input id ="MobiQwick1" type="hidden" value="">
       <input id ="MobiQwick" type="checkbox" value="MobiQwick" style="  width: 43px;  height: 17px;" >
     </c:otherwise>
     </c:choose>
         
      
        </div>
      </div>
      </form>
     </div>
     
   </div>
   
   
   
   <br><br><br>
       
       <div class="row">
        <div class="col-sm-1 col-lg-1 "></div>
     <div class="col-sm-5 col-lg-5 " style=" padding-left: 21px; padding-right: 0px"><div style="font-weight: bold;"><spring:message code="paymentGateWay.Merchant_Credentials.label"/></div></div><br>
    <br>
    <div class="col-sm-1 col-lg-1 "></div>
<div class="col-sm-10 col-lg-8 ">
     <div class="col-sm-6 col-lg-6 " style="padding-right: 0px;"><div><spring:message code="paymentGateWay.Login_Id.label"/></div></div> 
     
     <div class="col-sm-5 col-lg-6 col-xs-10" style="padding-right: 0px;    padding-left: 0px;">
       <input id="walletMerchantId" type="text" value="${onlinePaymentlist.walletMerchantId}" style="width: 125%;padding:3px;">
     </div>

   </div><br><br>
<div class="col-sm-1 col-lg-1 "></div>
<div class="col-sm-10 col-lg-8 ">
     <div class="col-sm-6 col-lg-6 " style=""><div><spring:message code="paymentGateWay.Password.label"/></div></div> 
     
     <div class="col-sm-5 col-lg-6 col-xs-10" style="padding-right: 0px;    padding-left: 0px;">
       <input id="walletMerchantPwd" type="text" value="${onlinePaymentlist.walletMerchantPwd}" style="width: 125%;padding:3px;">
     </div>

   </div></div>
      
    
 </div>
</div>

<br><br><br>
  <div class="row">

  
   <div class="col-sm-6" >
  
     <div class="row">
       <div class="col-sm-8" ></div>
       <div class="col-sm-4" style="width: 30%" >
        <div class="btn-group btn-group-justified">
        <a onclick="validatePaymentGatewayform('paymentGateway')" class="btn btn-primary"><b><spring:message code="paymentGateWay.submit.label"/></b></a>
        </div>
       </div>
      </div>
      </div>
  
  
 
  
  <div class="col-sm-6" >
  
   <div class="row">
       
       <div class="col-sm-4"  style="width: 30%">
        <div class="btn-group btn-group-justified">
        <a href="#" class="btn btn-primary"><b><spring:message code="paymentGateWay.cancel.label"/></b></a>
        </div>
       </div>
       <div class="col-sm-8" ></div>
      </div>
      </div>
  </div>
  <br>
  <br>
  </div>
  </div>
  </div>
 </div>
 </section>
  

</body>
</html>