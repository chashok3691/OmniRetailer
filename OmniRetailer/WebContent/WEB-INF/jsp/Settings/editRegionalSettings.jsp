<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/settings/editRegionalSettings.jsp
 * file type		        : JSP
 * description				: The editEmailSettings form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/cusomerSettings/regionalSettings.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/bootstrap-formhelpers-currencies.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-formhelpers-currencies.en_US.js"></script> --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	 <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
<style type="text/css">

	 
</style>

<script type="text/javascript">
$(document).ready(function(){

	callCalender('date');
	
		
	/* $("#hidePassword").change(function(e){
		if(!$(this).prop("checked")){
			$("#password").attr("type","text");
		}
		else{
			$("#password").attr("type","password");
		}
	});
	 */
	
	
	$("#mailId").blur(function(){
		  var email = $("#mailId").val();
		  if(email==""){
			 return false;
		  }
		  if(!emailValidation(email)){
		   	$("#mailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
		  else{
			$("#mailIdError").html("");
		    return true;
		  }
		});
	
});

</script>   
<style type="text/css">
.box-body{
padding-left: 100px;
padding-right: 100px;
}
</style>     
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">

  
  <div class="col-xs-12">

				<div class="box box-primary " style="padding: ">
  <%--   <div class="box-header" style="text-align: left; height:25px;">
   
    <h3  style="text-align: center;"><spring:message code="regional.settings.label" /></h3>
    </div> --%><!-- /.box-header -->
     <div class="box-header" align="center">
               <h3  class="box-title" style="border:1px solid #ccc;padding:7px;font-weight: 600;"><spring:message code="regional.settings.label" /></h3>
           </div>
    <!-- form start -->
    <form>
    
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        
        <div id="Error" class="Error" style="text-align: center;margin-top: 20px;color: red;font-size: 2;font-weight: bold;">${err}</div>
        <div id="Success" class="Error" style="text-align: center;color: blue;margin-top: 20px;font-size: 2;font-weight: bold;">${success}</div>
        	 </div>
		<br><br>
		<!-- <div class="form-group col-lg-3"></div> -->
		<div class="row">
		<div class="col-lg-12">
		<!-- <div class="col-lg-1"></div> -->
		<div class="col-lg-6">
        <div class="row">
        <div class="col-lg-12">
        <div class="form-group col-lg-6">
        	 <div class="row">
        	 <div class="col-lg-12">
        	 <label><spring:message code="language.format.label" /></label><!-- <span style="color:red; font-size:2">*</span> -->
        	  <select class="form-control" name="language" id="language">
        	  <option value="English"  ${'English' == regionalSettings.language ? 'selected' : ''}>English</option>
        	   <option value="Finish"  ${'Finish' == regionalSettings.language ? 'selected' : ''}>Finish</option>
        	    <option value="Swedish"  ${'Swedish' == regionalSettings.language ? 'selected' : ''}>Swedish</option>
        	    <option value="Arabic"  ${'Arabic' == regionalSettings.language ? 'selected' : ''}>Arabic</option>
        	  </select>
        	 </div>
        	 </div>
        	 </div>
        	 <div class="form-group col-lg-6">
        	 <div class="row">
        	<div class="col-lg-12">
                	<label> <span style="color:red; font-size:2"></span>Current Date</label>
                <input class="form-control calendar_icon" readonly="readonly" value="${regionalSettings.date}" style="background-color: white;" id="date" size="20" type="text"  placeholder="Date" />
					<!-- <input type="text" class="form-control" name="dealStartDate" id="dealStartDate" value="" placeholder=""/>
					<span id="dealStartDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
				</div> 
        	 </div>
        	 </div>
        	 </div>
        	<%--  <div class="form-group col-lg-3">
        	 <div class="row">
        	 <div class="col-lg-11">
                 <label><spring:message code="date.format.label" /></label><span style="color:red; font-size:2">*</span>
                  <input type="hidden" id="aaa" value="${regionalSettings.dateFormat}">
           <select class="form-control" name="dateFormat" id="dateFormat">
			<option value="DD/MM/YYYY" ${'DD/MM/YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>DD/MM/YYYY</option>
			<option value="MM/DD/YYYY" ${'MM/DD/YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MM/DD/YYYY</option>
			<option value="YYYY/DD/MM" ${'YYYY/DD/MM' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY/DD/MM</option>
			<option value="YYYY/MM/DD" ${'YYYY/MM/DD' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY/MM/DD</option>
			<option value="DD-MM-YYYY" ${'DD-MM-YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>DD-MM-YYYY</option>
			<option value="MM-DD-YYYY" ${'MM-DD-YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MM-DD-YYYY</option>
			<option value="YYYY-DD-MM" ${'YYYY-DD-MM' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY-DD-MM</option>
			<option value="YYYY-MM-DD" ${'YYYY-MM-DD' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY-MM-DD</option>
			<option value="DD.MM.YYYY" ${'DD.MM.YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>DD.MM.YYYY</option>
			<option value="MM.DD.YYYY" ${'MM.DD.YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MM.DD.YYYY</option>
			<option value="YYYY.DD.MM" ${'YYYY.DD.MM' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY.DD.MM</option>
			<option value="YYYY.MM.DD" ${'YYYY.MM.DD' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY.MM.DD</option>
			<option value="MMM DD YYYY" ${'MMM DD YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MMM DD YYYY</option>
			</select> 
            <span id="dateFormatError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
            </div>        
</div> --%>
 <%-- <div class="form-group col-lg-3">
        	 <div class="row">
        	 	 
        	 <div class="col-lg-11">
                 <label><spring:message code="currency.label" /></label><span style="color:red; font-size:2">*</span>
                   <!-- <select class="form-control bfh-currencies" data-currency="EUR"></select> -->
                   <input type="hidden" id="bbb" value="${regionalSettings.currency}">
           <select class="form-control" name="currency" id="currency">
           <option value="America (United States) Dollars - USD" ${'America (United States) Dollars - USD' == regionalSettings.currency ? 'selected' : '' }>America (United States) Dollars  USD</option>
<option value="Afghanistan Afghanis - AFN" ${'Afghanistan Afghanis - AFN' == regionalSettings.currency ? 'selected' : '' }>Afghanistan Afghanis  AFN</option>
<option value="Albania Leke - ALL" ${'Albania Leke - ALL' == regionalSettings.currency ? 'selected' : ''}>Albania Leke  ALL</option>
<option value="Algeria Dinars - DZD" ${'Algeria Dinars - DZD' == regionalSettings.currency ? 'selected' : ''}>Algeria Dinars  DZD</option>
<option value="Argentina Pesos - ARS" ${'Argentina Pesos - ARS' == regionalSettings.currency ? 'selected' : ''}>Argentina Pesos  ARS</option>
<option value="Australia Dollars - AUD" ${'Australia Dollars - AUD' == regionalSettings.currency ? 'selected' : ''}>Australia Dollars  AUD</option>
<option value="Austria Schillings - ATS" ${'Austria Schillings - ATS' == regionalSettings.currency ? 'selected' : ''}>Austria Schillings  ATS</OPTION>
<option value="Bahamas Dollars - BSD" ${'Bahamas Dollars - BSD' == regionalSettings.currency ? 'selected' : ''}>Bahamas Dollars  BSD</option>
<option value="Bahrain Dinars - BHD" ${'Bahrain Dinars - BHD' == regionalSettings.currency ? 'selected' : ''}>Bahrain Dinars  BHD</option>
<option value="Bangladesh Taka - BDT" ${'Bangladesh Taka - BDT' == regionalSettings.currency ? 'selected' : ''}>Bangladesh Taka  BDT</option> 
<option value="Barbados Dollars - BBD" ${'Barbados Dollars - BBD' == regionalSettings.currency ? 'selected' : ''}>Barbados Dollars  BBD</option>
<option value="Belgium Francs - BEF" ${'Belgium Francs - BEF' == regionalSettings.currency ? 'selected' : ''}>Belgium Francs  BEF</OPTION>
<option value="Bermuda Dollars - BMD" ${'Bermuda Dollars - BMD' == regionalSettings.currency ? 'selected' : ''}>Bermuda Dollars  BMD</option>
<option value="Brazil Reais - BRL" ${'Brazil Reais - BRL' == regionalSettings.currency ? 'selected' : ''}>Brazil Reais  BRL</option>
<option value="Bulgaria Leva - BGN" ${'Bulgaria Leva - BGN' == regionalSettings.currency ? 'selected' : ''}>Bulgaria Leva  BGN</option>
<option value="Canada Dollars - CAD" ${'Canada Dollars - CAD' == regionalSettings.currency ? 'selected' : ''}>Canada Dollars  CAD</option>
<option value="CFA BCEAO Francs - XOF" ${'CFA BCEAO Francs - XOF' == regionalSettings.currency ? 'selected' : ''}>CFA BCEAO Francs  XOF</option>
<option value="CFA BEAC Francs - XAF" ${'CFA BEAC Francs - XAF' == regionalSettings.currency ? 'selected' : ''}>CFA BEAC Francs  XAF</option>
<option value="Chile Pesos - CLP" ${'Chile Pesos - CLP' == regionalSettings.currency ? 'selected' : ''}>Chile Pesos  CLP</option>
<option value="China Yuan Renminbi - CNY" ${'China Yuan Renminbi - CNY' == regionalSettings.currency ? 'selected' : ''}>China Yuan Renminbi  CNY</option>
<option value="RMB (China Yuan Renminbi) - CNY" ${'RMB (China Yuan Renminbi) - CNY' == regionalSettings.currency ? 'selected' : ''}>RMB (China Yuan Renminbi)  CNY</option>
<option value="Colombia Pesos - COP" ${'Colombia Pesos - COP' == regionalSettings.currency ? 'selected' : ''}>Colombia Pesos  COP</option>
<option value="CFP Francs - XPF" ${'CFP Francs - XPF' == regionalSettings.currency ? 'selected' : ''}>CFP Francs  XPF</option>
<option value="Costa Rica Colones - CRC" ${'Costa Rica Colones - CRC' == regionalSettings.currency ? 'selected' : ''}>Costa Rica Colones  CRC</option>
<option value="Croatia Kuna - HRK" ${'Croatia Kuna - HRK' == regionalSettings.currency ? 'selected' : ''}>Croatia Kuna  HRK</option>
<option value="Cyprus Pounds - CYP" ${'Cyprus Pounds - CYP' == regionalSettings.currency ? 'selected' : ''}>Cyprus Pounds  CYP</option>
<option value="Czech Republic Koruny - CZK" ${'Czech Republic Koruny - CZK' == regionalSettings.currency ? 'selected' : ''}>Czech Republic Koruny  CZK</option>
<option value="Denmark Kroner - DKK" ${'Denmark Kroner - DKK' == regionalSettings.currency ? 'selected' : ''}>Denmark Kroner  DKK</option>
<option value="Deutsche (Germany) Marks - DEM" ${'Deutsche (Germany) Marks - DEM' == regionalSettings.currency ? 'selected' : ''}>Deutsche (Germany) Marks  DEM</OPTION>
<option value="Dominican Republic Pesos - DOP" ${'Dominican Republic Pesos - DOP' == regionalSettings.currency ? 'selected' : ''}>Dominican Republic Pesos  DOP</option>
<option value="Dutch (Netherlands) Guilders - NLG" ${'Dutch (Netherlands) Guilders - NLG' == regionalSettings.currency ? 'selected' : ''}>Dutch (Netherlands) Guilders  NLG</OPTION>
<option value="Eastern Caribbean Dollars - XCD" ${'Eastern Caribbean Dollars - XCD' == regionalSettings.currency ? 'selected' : ''}>Eastern Caribbean Dollars  XCD</option>
<option value="Egypt Pounds - EGP" ${'Egypt Pounds - EGP' == regionalSettings.currency ? 'selected' : ''}>Egypt Pounds  EGP</option>
<option value="Estonia Krooni - EEK" ${'Estonia Krooni - EEK' == regionalSettings.currency ? 'selected' : ''}>Estonia Krooni  EEK</option>
<option value="Euro - EUR" ${'Euro - EUR' == regionalSettings.currency ? 'selected' : ''}>Euro  EUR</option>
<option value="Fiji Dollars - FJD" ${'Fiji Dollars - FJD' == regionalSettings.currency ? 'selected' : ''}>Fiji Dollars  FJD</option>
<option value="Finland Markkaa - FIM" ${'Finland Markkaa - FIM' == regionalSettings.currency ? 'selected' : ''}>Finland Markkaa  FIM</OPTION>
<option value="France Francs - FRF*" ${'France Francs - FRF*' == regionalSettings.currency ? 'selected' : ''}>France Francs  FRF*</OPTION>
<option value="Germany Deutsche Marks - DEM" ${'Germany Deutsche Marks - DEM' == regionalSettings.currency ? 'selected' : ''}>Germany Deutsche Marks  DEM</OPTION>
<option value="Gold Ounces - XAU" ${'Gold Ounces - XAU' == regionalSettings.currency ? 'selected' : ''}>Gold Ounces  XAU</option>
<option value="Greece Drachmae - GRD" ${'Greece Drachmae - GRD' == regionalSettings.currency ? 'selected' : ''}>Greece Drachmae  GRD</OPTION>
<option value="Guatemalan Quetzal - GTQ" ${'Guatemalan Quetzal - GTQ' == regionalSettings.currency ? 'selected' : ''}>Guatemalan Quetzal  GTQ</OPTION>
<option value="Holland (Netherlands) Guilders - NLG" ${'Holland (Netherlands) Guilders - NLG' == regionalSettings.currency ? 'selected' : ''}>Holland (Netherlands) Guilders  NLG</OPTION>
<option value="Hong Kong Dollars - HKD" ${'Hong Kong Dollars - HKD' == regionalSettings.currency ? 'selected' : ''}>Hong Kong Dollars  HKD</option>
<option value="Hungary Forint - HUF" ${'Hungary Forint - HUF' == regionalSettings.currency ? 'selected' : ''}>Hungary Forint  HUF</option>
<option value="Iceland Kronur - ISK" ${'Iceland Kronur - ISK' == regionalSettings.currency ? 'selected' : ''}>Iceland Kronur  ISK</option>
<option value="IMF Special Drawing Right - XDR" ${'IMF Special Drawing Right - XDR' == regionalSettings.currency ? 'selected' : ''}>IMF Special Drawing Right  XDR</option>
<option value="India Rupees - INR" ${'India Rupees - INR' == regionalSettings.currency ? 'selected' : ''}>India Rupees  INR</option>
<option value="Indonesia Rupiahs - IDR" ${'Indonesia Rupiahs - IDR' == regionalSettings.currency ? 'selected' : ''}>Indonesia Rupiahs  IDR</option>
<option value="Iran Rials - IRR" ${'Iran Rials - IRR' == regionalSettings.currency ? 'selected' : ''}>Iran Rials  IRR</option>
<option value="Iraq Dinars - IQD" ${'Iraq Dinars - IQD' == regionalSettings.currency ? 'selected' : ''}>Iraq Dinars  IQD</option>
<option value="Ireland Pounds - IEP*" ${'Ireland Pounds - IEP*' == regionalSettings.currency ? 'selected' : ''}>Ireland Pounds  IEP*</OPTION>
<option value="Israel New Shekels - ILS" ${'Israel New Shekels - ILS' == regionalSettings.currency ? 'selected' : ''}>Israel New Shekels  ILS</option>
<option value="Italy Lire - ITL*" ${'Italy Lire - ITL*' == regionalSettings.currency ? 'selected' : ''}>Italy Lire  ITL*</OPTION>
<option value="Jamaica Dollars - JMD" ${'Jamaica Dollars - JMD' == regionalSettings.currency ? 'selected' : ''}>Jamaica Dollars  JMD</option>
<option value="Japan Yen - JPY" ${'Japan Yen - JPY' == regionalSettings.currency ? 'selected' : ''}>Japan Yen  JPY</option>
<option value="Jordan Dinars - JOD" ${'Jordan Dinars - JOD' == regionalSettings.currency ? 'selected' : ''}>Jordan Dinars  JOD</option>
<option value="Kenya Shillings - KES" ${'Kenya Shillings - KES' == regionalSettings.currency ? 'selected' : ''}>Kenya Shillings  KES</option>
<option value="Korea (South) Won - KRW" ${'Korea (South) Won - KRW' == regionalSettings.currency ? 'selected' : ''}>Korea (South) Won  KRW</option>
<option value="Kuwait Dinars - KWD" ${'Kuwait Dinars - KWD' == regionalSettings.currency ? 'selected' : ''}>Kuwait Dinars  KWD</option>
<option value="Lebanon Pounds - LBP" ${'Lebanon Pounds - LBP' == regionalSettings.currency ? 'selected' : ''}>Lebanon Pounds  LBP</option>
<option value="Luxembourg Francs - LUF" ${'Luxembourg Francs - LUF' == regionalSettings.currency ? 'selected' : ''}>Luxembourg Francs  LUF</OPTION>
<option value="Malaysia Ringgits - MYR" ${'Malaysia Ringgits - MYR' == regionalSettings.currency ? 'selected' : ''}>Malaysia Ringgits  MYR</option>
<option value="Malta Liri - MTL" ${'Malta Liri - MTL' == regionalSettings.currency ? 'selected' : ''}>Malta Liri  MTL</option>
<option value="Mauritius Rupees - MUR" ${'Mauritius Rupees - MUR' == regionalSettings.currency ? 'selected' : ''}>Mauritius Rupees  MUR</option>
<option value="Mexico Pesos - MXN" ${'Mexico Pesos - MXN' == regionalSettings.currency ? 'selected' : ''}>Mexico Pesos  MXN</option>
<option value="Morocco Dirhams - MAD" ${'Morocco Dirhams - MAD' == regionalSettings.currency ? 'selected' : ''}>Morocco Dirhams  MAD</option>
<option value="Netherlands Guilders - NLG" ${'Netherlands Guilders - NLG' == regionalSettings.currency ? 'selected' : ''}>Netherlands Guilders  NLG</OPTION>
<option value="New Zealand Dollars - NZD" ${'New Zealand Dollars - NZD' == regionalSettings.currency ? 'selected' : ''}>New Zealand Dollars  NZD</option>
<option value="Norway Kroner - NOK" ${'Norway Kroner - NOK' == regionalSettings.currency ? 'selected' : ''}>Norway Kroner  NOK</option>
<option value="Oman Rials - OMR" ${'Oman Rials - OMR' == regionalSettings.currency ? 'selected' : ''}>Oman Rials  OMR</option>
<option value="Pakistan Rupees - PKR" ${'Pakistan Rupees - PKR' == regionalSettings.currency ? 'selected' : ''}>Pakistan Rupees  PKR</option>
<option value="Palladium Ounces - XPD" ${'Palladium Ounces - XPD' == regionalSettings.currency ? 'selected' : ''}>Palladium Ounces  XPD</option>
<option value="Peru Nuevos Soles - PEN" ${'Peru Nuevos Soles - PEN' == regionalSettings.currency ? 'selected' : ''}>Peru Nuevos Soles  PEN</option>
<option value="Philippines Pesos - PHP" ${'Philippines Pesos - PHP' == regionalSettings.currency ? 'selected' : ''}>Philippines Pesos  PHP</option>
<option value="Platinum Ounces - XPT" ${'Platinum Ounces - XPT' == regionalSettings.currency ? 'selected' : ''}>Platinum Ounces  XPT</option>
<option value="Poland Zlotych - PLN" ${'Poland Zlotych - PLN' == regionalSettings.currency ? 'selected' : ''}>Poland Zlotych  PLN</option>
<option value="Portugal Escudos - PTE" ${'Portugal Escudos - PTE' == regionalSettings.currency ? 'selected' : ''}>Portugal Escudos  PTE</OPTION>
<option value="Qatar Riyals - QAR" ${'Qatar Riyals - QAR' == regionalSettings.currency ? 'selected' : ''}>Qatar Riyals  QAR</option>
<option value="Romania New Lei - RON" ${'Romania New Lei - RON' == regionalSettings.currency ? 'selected' : ''}>Romania New Lei  RON</option>
<option value="Romania Lei - ROL" ${'Romania Lei - ROL' == regionalSettings.currency ? 'selected' : ''}>Romania Lei  ROL</option>
<option value="Russia Rubles - RUB" ${'Russia Rubles - RUB' == regionalSettings.currency ? 'selected' : ''}>Russia Rubles  RUB</option>
<option value="Saudi Arabia Riyals - SAR" ${'Saudi Arabia Riyals - SAR' == regionalSettings.currency ? 'selected' : ''}>Saudi Arabia Riyals  SAR</option>
<option value="Silver Ounces - XAG" ${'Silver Ounces - XAG' == regionalSettings.currency ? 'selected' : ''}>Silver Ounces  XAG</option>
<option value="Singapore Dollars - SGD" ${'Singapore Dollars - SGD' == regionalSettings.currency ? 'selected' : ''}>Singapore Dollars  SGD</option>
<option value="Slovakia Koruny - SKK" ${'Slovakia Koruny - SKK' == regionalSettings.currency ? 'selected' : ''}>Slovakia Koruny  SKK</option>
<option value="Slovenia Tolars - SIT" ${'Slovenia Tolars - SIT' == regionalSettings.currency ? 'selected' : ''}>Slovenia Tolars  SIT</option>
<option value="South Africa Rand - ZAR" ${'South Africa Rand - ZAR' == regionalSettings.currency ? 'selected' : ''}>South Africa Rand  ZAR</option>
<option value="South Korea Won - KRW" ${'South Korea Won - KRW' == regionalSettings.currency ? 'selected' : ''}>South Korea Won  KRW</option>
<option value="Spain Pesetas - ESP" ${'Spain Pesetas - ESP' == regionalSettings.currency ? 'selected' : ''}>Spain Pesetas  ESP</OPTION>
<option value="Special Drawing Rights (IMF) - XDR" ${'Special Drawing Rights (IMF) - XDR' == regionalSettings.currency ? 'selected' : ''}>Special Drawing Rights (IMF)  XDR</option>
<option value="Sri Lanka Rupees - LKR" ${'Sri Lanka Rupees - LKR' == regionalSettings.currency ? 'selected' : ''}>Sri Lanka Rupees  LKR</option>
<option value="Sudan Dinars - SDD" ${'Sudan Dinars - SDD' == regionalSettings.currency ? 'selected' : ''}>Sudan Dinars  SDD</option>
<option value="Sweden Kronor - SEK" ${'Sweden Kronor - SEK' == regionalSettings.currency ? 'selected' : ''}>Sweden Kronor  SEK</option>
<option value="Switzerland Francs - CHF" ${'Switzerland Francs - CHF' == regionalSettings.currency ? 'selected' : ''}>Switzerland Francs  CHF</option>
<option value="Taiwan New Dollars - TWD" ${'Taiwan New Dollars - TWD' == regionalSettings.currency ? 'selected' : ''}>Taiwan New Dollars  TWD</option>
<option value="Thailand Baht - THB" ${'Thailand Baht - THB' == regionalSettings.currency ? 'selected' : ''}>Thailand Baht  THB</option>
<option value="Trinidad and Tobago Dollars - TTD" ${'Trinidad and Tobago Dollars - TTD' == regionalSettings.currency ? 'selected' : ''}>Trinidad and Tobago Dollars  TTD</option>
<option value="Tunisia Dinars - TND" ${'Tunisia Dinars - TND' == regionalSettings.currency ? 'selected' : ''}>Tunisia Dinars  TND</option>
<option value="Turkey New Lira - TRY" ${'Turkey New Lira - TRY' == regionalSettings.currency ? 'selected' : ''}>Turkey New Lira  TRY</option>
<option value="United Arab Emirates Dirhams - AED" ${'United Arab Emirates Dirhams - AED' == regionalSettings.currency ? 'selected' : ''}>United Arab Emirates Dirhams  AED</option>
<option value="United Kingdom Pounds - GBP" ${'United Kingdom Pounds - GBP' == regionalSettings.currency ? 'selected' : ''}>United Kingdom Pounds  GBP</option>
<option value="United States Dollars - USD" ${'United States Dollars - USD' == regionalSettings.currency ? 'selected' : ''}>United States Dollars  USD</option>
<option value="Venezuela Bolivares - VEB" ${'Venezuela Bolivares - VEB' == regionalSettings.currency ? 'selected' : ''}>Venezuela Bolivares  VEB</option>
<option value="Vietnam Dong - VND" ${'Vietnam Dong - VND' == regionalSettings.currency ? 'selected' : ''}>Vietnam Dong  VND</option>
<option value="Zambia Kwacha - ZMK" ${'Zambia Kwacha - ZMK' == regionalSettings.currency ? 'selected' : ''}>Zambia Kwacha  ZMK</option> 
		
          	</select>  
           <!--  <span id="currencyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                </div>
            </div>
</div> --%>
</div>

<div class="row">
<!-- <div class="form-group col-lg-3" style="margin-left: 10px"></div> -->
<div class="col-lg-12">
<div class="form-group col-lg-6" >
        	 <div class="row">
        	 	 
        	 <div class="col-lg-12">
                 <label><spring:message code="time.zone.label" /></label><!-- <span style="color:red; font-size:2">*</span> -->
                <select class="form-control" name="timeZone" id="timeZone">
                
               <%--   <option value="1" ${'1' == regionalSettings.timeZone ? 'selected' : ''}>1</option>
                  <option value="2" ${'2' == regionalSettings.timeZone ? 'selected' : ''}>2</option>
 --%>                </select>
              <input type="hidden" id="timeZoneVal" value="${regionalSettings.timeZone}">
                 </div>
                 </div>
                 </div>
                 <div class="form-group col-lg-6">
        	 <div class="row">
        	 	 
        	 <div class="col-lg-12">
                 <label>Current Time</label><!-- <span style="color:red; font-size:2">*</span> -->
                 <div class="bootstrap-timepicker">
			    
			    <div class="input-group">
			    <c:if test="${status == 'edit'}">
			    <input type="text" class=" form-control timepicker"  name="time" id="time" value="${regionalSettings.time}">
			    </c:if>
			    <c:if test="${status == 'new'}">
			     <input type="text" class=" form-control timepicker" value="00:00:00" name="time" id="time" value="${regionalSettings.time}">
			      </c:if> 
			 <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
			  </div>
			  </div>
                 </div>
                 </div>
                 </div>
                 </div>
                
                     <%--  <div class="form-group col-lg-6">
        	     <div class="row">
        	 	 
        	     <div class="col-lg-12">
                 <label><spring:message code="country.label" /></label><!-- <span style="color:red; font-size:2">*</span>
 -->                 
                  <select class="form-control" name="countryCode" id="countryCode"  >
                  	 <option  value="IN"  ${'IN'==regionalSettings.countryCode ? 'selected' : ''}>IN</option>
                                  	<option value="US"  ${'US'==regionalSettings.countryCode ? 'selected' : ''}>US</option>
                                  	<option value="GB"  ${'GB'==regionalSettings.countryCode ? 'selected' : ''}>GB</option>
                                  	<option value="AU"  ${'AU'==regionalSettings.countryCode ? 'selected' : ''}>AU</option>
                   </select>
                
                   </div>
                     </div>
                     </div> --%>
                     </div>
                     <div class="row">
                     <div class="col-lg-12">
                     <div class="form-group col-lg-6">
        	     <div class="row">
        	 	 
        	     <div class="col-lg-12">
                 <label><spring:message code="country.label" /></label><!-- <span style="color:red; font-size:2">*</span>
 -->                 
                  <select class="form-control" name="countryCode" id="countryCode"  >
                  	 <option  value="IN"  ${'IN'==regionalSettings.countryCode ? 'selected' : ''}>IN</option>
                                  	<option value="US"  ${'US'==regionalSettings.countryCode ? 'selected' : ''}>US</option>
                                  	<option value="GB"  ${'GB'==regionalSettings.countryCode ? 'selected' : ''}>GB</option>
                                  	<option value="AU"  ${'AU'==regionalSettings.countryCode ? 'selected' : ''}>AU</option>
                   </select>
                
                   </div>
                   
                     </div>
                     </div>
                     </div>
                     </div>
                     <br><br>
                     <div class="row">
                     <div class="col-lg-12">
                     <div class="form-group col-lg-6">
        	 <div class="row">
        	 <div class="col-lg-12">
                 <label><spring:message code="date.format.label" /></label><span style="color:red; font-size:2">*</span>
                  <input type="hidden" id="aaa" value="${regionalSettings.dateFormat}">
           <select class="form-control" name="dateFormat" id="dateFormat">
			<option value="DD/MM/YYYY" ${'DD/MM/YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>DD/MM/YYYY</option>
			<option value="MM/DD/YYYY" ${'MM/DD/YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MM/DD/YYYY</option>
			<option value="YYYY/DD/MM" ${'YYYY/DD/MM' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY/DD/MM</option>
			<option value="YYYY/MM/DD" ${'YYYY/MM/DD' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY/MM/DD</option>
			<option value="DD-MM-YYYY" ${'DD-MM-YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>DD-MM-YYYY</option>
			<option value="MM-DD-YYYY" ${'MM-DD-YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MM-DD-YYYY</option>
			<option value="YYYY-DD-MM" ${'YYYY-DD-MM' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY-DD-MM</option>
			<option value="YYYY-MM-DD" ${'YYYY-MM-DD' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY-MM-DD</option>
			<option value="DD.MM.YYYY" ${'DD.MM.YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>DD.MM.YYYY</option>
			<option value="MM.DD.YYYY" ${'MM.DD.YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MM.DD.YYYY</option>
			<option value="YYYY.DD.MM" ${'YYYY.DD.MM' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY.DD.MM</option>
			<option value="YYYY.MM.DD" ${'YYYY.MM.DD' == regionalSettings.dateFormat ? 'selected' : ''}>YYYY.MM.DD</option>
			<option value="MMM DD YYYY" ${'MMM DD YYYY' == regionalSettings.dateFormat ? 'selected' : ''}>MMM DD YYYY</option>
			</select> 
            <span id="dateFormatError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
            
            </div>        
</div> 
  <div class="form-group col-lg-6">
        	 <div class="row">
        	 	 
        	 <div class="col-lg-12">
                 <label><spring:message code="currency.label" /></label><span style="color:red; font-size:2">*</span>
                   <!-- <select class="form-control bfh-currencies" data-currency="EUR"></select> -->
                   <input type="hidden" id="bbb" value="${regionalSettings.currency}">
           <select class="form-control" name="currency" id="currency">
           <option value="America (United States) Dollars - USD" ${'America (United States) Dollars - USD' == regionalSettings.currency ? 'selected' : '' }>America (United States) Dollars  USD</option>
<option value="Afghanistan Afghanis - AFN" ${'Afghanistan Afghanis - AFN' == regionalSettings.currency ? 'selected' : '' }>Afghanistan Afghanis  AFN</option>
<option value="Albania Leke - ALL" ${'Albania Leke - ALL' == regionalSettings.currency ? 'selected' : ''}>Albania Leke  ALL</option>
<option value="Algeria Dinars - DZD" ${'Algeria Dinars - DZD' == regionalSettings.currency ? 'selected' : ''}>Algeria Dinars  DZD</option>
<option value="Argentina Pesos - ARS" ${'Argentina Pesos - ARS' == regionalSettings.currency ? 'selected' : ''}>Argentina Pesos  ARS</option>
<option value="Australia Dollars - AUD" ${'Australia Dollars - AUD' == regionalSettings.currency ? 'selected' : ''}>Australia Dollars  AUD</option>
<option value="Austria Schillings - ATS" ${'Austria Schillings - ATS' == regionalSettings.currency ? 'selected' : ''}>Austria Schillings  ATS</OPTION>
<option value="Bahamas Dollars - BSD" ${'Bahamas Dollars - BSD' == regionalSettings.currency ? 'selected' : ''}>Bahamas Dollars  BSD</option>
<option value="Bahrain Dinars - BHD" ${'Bahrain Dinars - BHD' == regionalSettings.currency ? 'selected' : ''}>Bahrain Dinars  BHD</option>
<option value="Bangladesh Taka - BDT" ${'Bangladesh Taka - BDT' == regionalSettings.currency ? 'selected' : ''}>Bangladesh Taka  BDT</option> 
<option value="Barbados Dollars - BBD" ${'Barbados Dollars - BBD' == regionalSettings.currency ? 'selected' : ''}>Barbados Dollars  BBD</option>
<option value="Belgium Francs - BEF" ${'Belgium Francs - BEF' == regionalSettings.currency ? 'selected' : ''}>Belgium Francs  BEF</OPTION>
<option value="Bermuda Dollars - BMD" ${'Bermuda Dollars - BMD' == regionalSettings.currency ? 'selected' : ''}>Bermuda Dollars  BMD</option>
<option value="Brazil Reais - BRL" ${'Brazil Reais - BRL' == regionalSettings.currency ? 'selected' : ''}>Brazil Reais  BRL</option>
<option value="Bulgaria Leva - BGN" ${'Bulgaria Leva - BGN' == regionalSettings.currency ? 'selected' : ''}>Bulgaria Leva  BGN</option>
<option value="Canada Dollars - CAD" ${'Canada Dollars - CAD' == regionalSettings.currency ? 'selected' : ''}>Canada Dollars  CAD</option>
<option value="CFA BCEAO Francs - XOF" ${'CFA BCEAO Francs - XOF' == regionalSettings.currency ? 'selected' : ''}>CFA BCEAO Francs  XOF</option>
<option value="CFA BEAC Francs - XAF" ${'CFA BEAC Francs - XAF' == regionalSettings.currency ? 'selected' : ''}>CFA BEAC Francs  XAF</option>
<option value="Chile Pesos - CLP" ${'Chile Pesos - CLP' == regionalSettings.currency ? 'selected' : ''}>Chile Pesos  CLP</option>
<option value="China Yuan Renminbi - CNY" ${'China Yuan Renminbi - CNY' == regionalSettings.currency ? 'selected' : ''}>China Yuan Renminbi  CNY</option>
<option value="RMB (China Yuan Renminbi) - CNY" ${'RMB (China Yuan Renminbi) - CNY' == regionalSettings.currency ? 'selected' : ''}>RMB (China Yuan Renminbi)  CNY</option>
<option value="Colombia Pesos - COP" ${'Colombia Pesos - COP' == regionalSettings.currency ? 'selected' : ''}>Colombia Pesos  COP</option>
<option value="CFP Francs - XPF" ${'CFP Francs - XPF' == regionalSettings.currency ? 'selected' : ''}>CFP Francs  XPF</option>
<option value="Costa Rica Colones - CRC" ${'Costa Rica Colones - CRC' == regionalSettings.currency ? 'selected' : ''}>Costa Rica Colones  CRC</option>
<option value="Croatia Kuna - HRK" ${'Croatia Kuna - HRK' == regionalSettings.currency ? 'selected' : ''}>Croatia Kuna  HRK</option>
<option value="Cyprus Pounds - CYP" ${'Cyprus Pounds - CYP' == regionalSettings.currency ? 'selected' : ''}>Cyprus Pounds  CYP</option>
<option value="Czech Republic Koruny - CZK" ${'Czech Republic Koruny - CZK' == regionalSettings.currency ? 'selected' : ''}>Czech Republic Koruny  CZK</option>
<option value="Denmark Kroner - DKK" ${'Denmark Kroner - DKK' == regionalSettings.currency ? 'selected' : ''}>Denmark Kroner  DKK</option>
<option value="Deutsche (Germany) Marks - DEM" ${'Deutsche (Germany) Marks - DEM' == regionalSettings.currency ? 'selected' : ''}>Deutsche (Germany) Marks  DEM</OPTION>
<option value="Dominican Republic Pesos - DOP" ${'Dominican Republic Pesos - DOP' == regionalSettings.currency ? 'selected' : ''}>Dominican Republic Pesos  DOP</option>
<option value="Dutch (Netherlands) Guilders - NLG" ${'Dutch (Netherlands) Guilders - NLG' == regionalSettings.currency ? 'selected' : ''}>Dutch (Netherlands) Guilders  NLG</OPTION>
<option value="Eastern Caribbean Dollars - XCD" ${'Eastern Caribbean Dollars - XCD' == regionalSettings.currency ? 'selected' : ''}>Eastern Caribbean Dollars  XCD</option>
<option value="Egypt Pounds - EGP" ${'Egypt Pounds - EGP' == regionalSettings.currency ? 'selected' : ''}>Egypt Pounds  EGP</option>
<option value="Estonia Krooni - EEK" ${'Estonia Krooni - EEK' == regionalSettings.currency ? 'selected' : ''}>Estonia Krooni  EEK</option>
<option value="Euro - EUR" ${'Euro - EUR' == regionalSettings.currency ? 'selected' : ''}>Euro  EUR</option>
<option value="Fiji Dollars - FJD" ${'Fiji Dollars - FJD' == regionalSettings.currency ? 'selected' : ''}>Fiji Dollars  FJD</option>
<option value="Finland Markkaa - FIM" ${'Finland Markkaa - FIM' == regionalSettings.currency ? 'selected' : ''}>Finland Markkaa  FIM</OPTION>
<option value="France Francs - FRF*" ${'France Francs - FRF*' == regionalSettings.currency ? 'selected' : ''}>France Francs  FRF*</OPTION>
<option value="Germany Deutsche Marks - DEM" ${'Germany Deutsche Marks - DEM' == regionalSettings.currency ? 'selected' : ''}>Germany Deutsche Marks  DEM</OPTION>
<option value="Gold Ounces - XAU" ${'Gold Ounces - XAU' == regionalSettings.currency ? 'selected' : ''}>Gold Ounces  XAU</option>
<option value="Greece Drachmae - GRD" ${'Greece Drachmae - GRD' == regionalSettings.currency ? 'selected' : ''}>Greece Drachmae  GRD</OPTION>
<option value="Guatemalan Quetzal - GTQ" ${'Guatemalan Quetzal - GTQ' == regionalSettings.currency ? 'selected' : ''}>Guatemalan Quetzal  GTQ</OPTION>
<option value="Holland (Netherlands) Guilders - NLG" ${'Holland (Netherlands) Guilders - NLG' == regionalSettings.currency ? 'selected' : ''}>Holland (Netherlands) Guilders  NLG</OPTION>
<option value="Hong Kong Dollars - HKD" ${'Hong Kong Dollars - HKD' == regionalSettings.currency ? 'selected' : ''}>Hong Kong Dollars  HKD</option>
<option value="Hungary Forint - HUF" ${'Hungary Forint - HUF' == regionalSettings.currency ? 'selected' : ''}>Hungary Forint  HUF</option>
<option value="Iceland Kronur - ISK" ${'Iceland Kronur - ISK' == regionalSettings.currency ? 'selected' : ''}>Iceland Kronur  ISK</option>
<option value="IMF Special Drawing Right - XDR" ${'IMF Special Drawing Right - XDR' == regionalSettings.currency ? 'selected' : ''}>IMF Special Drawing Right  XDR</option>
<option value="India Rupees - INR" ${'India Rupees - INR' == regionalSettings.currency ? 'selected' : ''}>India Rupees  INR</option>
<option value="Indonesia Rupiahs - IDR" ${'Indonesia Rupiahs - IDR' == regionalSettings.currency ? 'selected' : ''}>Indonesia Rupiahs  IDR</option>
<option value="Iran Rials - IRR" ${'Iran Rials - IRR' == regionalSettings.currency ? 'selected' : ''}>Iran Rials  IRR</option>
<option value="Iraq Dinars - IQD" ${'Iraq Dinars - IQD' == regionalSettings.currency ? 'selected' : ''}>Iraq Dinars  IQD</option>
<option value="Ireland Pounds - IEP*" ${'Ireland Pounds - IEP*' == regionalSettings.currency ? 'selected' : ''}>Ireland Pounds  IEP*</OPTION>
<option value="Israel New Shekels - ILS" ${'Israel New Shekels - ILS' == regionalSettings.currency ? 'selected' : ''}>Israel New Shekels  ILS</option>
<option value="Italy Lire - ITL*" ${'Italy Lire - ITL*' == regionalSettings.currency ? 'selected' : ''}>Italy Lire  ITL*</OPTION>
<option value="Jamaica Dollars - JMD" ${'Jamaica Dollars - JMD' == regionalSettings.currency ? 'selected' : ''}>Jamaica Dollars  JMD</option>
<option value="Japan Yen - JPY" ${'Japan Yen - JPY' == regionalSettings.currency ? 'selected' : ''}>Japan Yen  JPY</option>
<option value="Jordan Dinars - JOD" ${'Jordan Dinars - JOD' == regionalSettings.currency ? 'selected' : ''}>Jordan Dinars  JOD</option>
<option value="Kenya Shillings - KES" ${'Kenya Shillings - KES' == regionalSettings.currency ? 'selected' : ''}>Kenya Shillings  KES</option>
<option value="Korea (South) Won - KRW" ${'Korea (South) Won - KRW' == regionalSettings.currency ? 'selected' : ''}>Korea (South) Won  KRW</option>
<option value="Kuwait Dinars - KWD" ${'Kuwait Dinars - KWD' == regionalSettings.currency ? 'selected' : ''}>Kuwait Dinars  KWD</option>
<option value="Lebanon Pounds - LBP" ${'Lebanon Pounds - LBP' == regionalSettings.currency ? 'selected' : ''}>Lebanon Pounds  LBP</option>
<option value="Luxembourg Francs - LUF" ${'Luxembourg Francs - LUF' == regionalSettings.currency ? 'selected' : ''}>Luxembourg Francs  LUF</OPTION>
<option value="Malaysia Ringgits - MYR" ${'Malaysia Ringgits - MYR' == regionalSettings.currency ? 'selected' : ''}>Malaysia Ringgits  MYR</option>
<option value="Malta Liri - MTL" ${'Malta Liri - MTL' == regionalSettings.currency ? 'selected' : ''}>Malta Liri  MTL</option>
<option value="Mauritius Rupees - MUR" ${'Mauritius Rupees - MUR' == regionalSettings.currency ? 'selected' : ''}>Mauritius Rupees  MUR</option>
<option value="Mexico Pesos - MXN" ${'Mexico Pesos - MXN' == regionalSettings.currency ? 'selected' : ''}>Mexico Pesos  MXN</option>
<option value="Morocco Dirhams - MAD" ${'Morocco Dirhams - MAD' == regionalSettings.currency ? 'selected' : ''}>Morocco Dirhams  MAD</option>
<option value="Netherlands Guilders - NLG" ${'Netherlands Guilders - NLG' == regionalSettings.currency ? 'selected' : ''}>Netherlands Guilders  NLG</OPTION>
<option value="New Zealand Dollars - NZD" ${'New Zealand Dollars - NZD' == regionalSettings.currency ? 'selected' : ''}>New Zealand Dollars  NZD</option>
<option value="Norway Kroner - NOK" ${'Norway Kroner - NOK' == regionalSettings.currency ? 'selected' : ''}>Norway Kroner  NOK</option>
<option value="Oman Rials - OMR" ${'Oman Rials - OMR' == regionalSettings.currency ? 'selected' : ''}>Oman Rials  OMR</option>
<option value="Pakistan Rupees - PKR" ${'Pakistan Rupees - PKR' == regionalSettings.currency ? 'selected' : ''}>Pakistan Rupees  PKR</option>
<option value="Palladium Ounces - XPD" ${'Palladium Ounces - XPD' == regionalSettings.currency ? 'selected' : ''}>Palladium Ounces  XPD</option>
<option value="Peru Nuevos Soles - PEN" ${'Peru Nuevos Soles - PEN' == regionalSettings.currency ? 'selected' : ''}>Peru Nuevos Soles  PEN</option>
<option value="Philippines Pesos - PHP" ${'Philippines Pesos - PHP' == regionalSettings.currency ? 'selected' : ''}>Philippines Pesos  PHP</option>
<option value="Platinum Ounces - XPT" ${'Platinum Ounces - XPT' == regionalSettings.currency ? 'selected' : ''}>Platinum Ounces  XPT</option>
<option value="Poland Zlotych - PLN" ${'Poland Zlotych - PLN' == regionalSettings.currency ? 'selected' : ''}>Poland Zlotych  PLN</option>
<option value="Portugal Escudos - PTE" ${'Portugal Escudos - PTE' == regionalSettings.currency ? 'selected' : ''}>Portugal Escudos  PTE</OPTION>
<option value="Qatar Riyals - QAR" ${'Qatar Riyals - QAR' == regionalSettings.currency ? 'selected' : ''}>Qatar Riyals  QAR</option>
<option value="Romania New Lei - RON" ${'Romania New Lei - RON' == regionalSettings.currency ? 'selected' : ''}>Romania New Lei  RON</option>
<option value="Romania Lei - ROL" ${'Romania Lei - ROL' == regionalSettings.currency ? 'selected' : ''}>Romania Lei  ROL</option>
<option value="Russia Rubles - RUB" ${'Russia Rubles - RUB' == regionalSettings.currency ? 'selected' : ''}>Russia Rubles  RUB</option>
<option value="Saudi Arabia Riyals - SAR" ${'Saudi Arabia Riyals - SAR' == regionalSettings.currency ? 'selected' : ''}>Saudi Arabia Riyals  SAR</option>
<option value="Silver Ounces - XAG" ${'Silver Ounces - XAG' == regionalSettings.currency ? 'selected' : ''}>Silver Ounces  XAG</option>
<option value="Singapore Dollars - SGD" ${'Singapore Dollars - SGD' == regionalSettings.currency ? 'selected' : ''}>Singapore Dollars  SGD</option>
<option value="Slovakia Koruny - SKK" ${'Slovakia Koruny - SKK' == regionalSettings.currency ? 'selected' : ''}>Slovakia Koruny  SKK</option>
<option value="Slovenia Tolars - SIT" ${'Slovenia Tolars - SIT' == regionalSettings.currency ? 'selected' : ''}>Slovenia Tolars  SIT</option>
<option value="South Africa Rand - ZAR" ${'South Africa Rand - ZAR' == regionalSettings.currency ? 'selected' : ''}>South Africa Rand  ZAR</option>
<option value="South Korea Won - KRW" ${'South Korea Won - KRW' == regionalSettings.currency ? 'selected' : ''}>South Korea Won  KRW</option>
<option value="Spain Pesetas - ESP" ${'Spain Pesetas - ESP' == regionalSettings.currency ? 'selected' : ''}>Spain Pesetas  ESP</OPTION>
<option value="Special Drawing Rights (IMF) - XDR" ${'Special Drawing Rights (IMF) - XDR' == regionalSettings.currency ? 'selected' : ''}>Special Drawing Rights (IMF)  XDR</option>
<option value="Sri Lanka Rupees - LKR" ${'Sri Lanka Rupees - LKR' == regionalSettings.currency ? 'selected' : ''}>Sri Lanka Rupees  LKR</option>
<option value="Sudan Dinars - SDD" ${'Sudan Dinars - SDD' == regionalSettings.currency ? 'selected' : ''}>Sudan Dinars  SDD</option>
<option value="Sweden Kronor - SEK" ${'Sweden Kronor - SEK' == regionalSettings.currency ? 'selected' : ''}>Sweden Kronor  SEK</option>
<option value="Switzerland Francs - CHF" ${'Switzerland Francs - CHF' == regionalSettings.currency ? 'selected' : ''}>Switzerland Francs  CHF</option>
<option value="Taiwan New Dollars - TWD" ${'Taiwan New Dollars - TWD' == regionalSettings.currency ? 'selected' : ''}>Taiwan New Dollars  TWD</option>
<option value="Thailand Baht - THB" ${'Thailand Baht - THB' == regionalSettings.currency ? 'selected' : ''}>Thailand Baht  THB</option>
<option value="Trinidad and Tobago Dollars - TTD" ${'Trinidad and Tobago Dollars - TTD' == regionalSettings.currency ? 'selected' : ''}>Trinidad and Tobago Dollars  TTD</option>
<option value="Tunisia Dinars - TND" ${'Tunisia Dinars - TND' == regionalSettings.currency ? 'selected' : ''}>Tunisia Dinars  TND</option>
<option value="Turkey New Lira - TRY" ${'Turkey New Lira - TRY' == regionalSettings.currency ? 'selected' : ''}>Turkey New Lira  TRY</option>
<option value="United Arab Emirates Dirhams - AED" ${'United Arab Emirates Dirhams - AED' == regionalSettings.currency ? 'selected' : ''}>United Arab Emirates Dirhams  AED</option>
<option value="United Kingdom Pounds - GBP" ${'United Kingdom Pounds - GBP' == regionalSettings.currency ? 'selected' : ''}>United Kingdom Pounds  GBP</option>
<option value="United States Dollars - USD" ${'United States Dollars - USD' == regionalSettings.currency ? 'selected' : ''}>United States Dollars  USD</option>
<option value="Venezuela Bolivares - VEB" ${'Venezuela Bolivares - VEB' == regionalSettings.currency ? 'selected' : ''}>Venezuela Bolivares  VEB</option>
<option value="Vietnam Dong - VND" ${'Vietnam Dong - VND' == regionalSettings.currency ? 'selected' : ''}>Vietnam Dong  VND</option>
<option value="Zambia Kwacha - ZMK" ${'Zambia Kwacha - ZMK' == regionalSettings.currency ? 'selected' : ''}>Zambia Kwacha  ZMK</option> 
		
          	</select>  
           <!--  <span id="currencyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                </div>
            </div>
</div> 
</div>
</div>
                     <div class="row">
                     <div class="col-lg-12">
 <div class="form-group col-lg-6">
        	 <div class="row">
        	 	 
        	 <div class="col-lg-12">
                 <label><spring:message code="number.format.label" /></label><span style="color:red; font-size:2">*</span>
                  <input type="hidden" id="ccc" value="${regionalSettings.numberFormat}">
           <select class="form-control" name="numberFormat" id="numberFormat">
			<option value="NN,NN,NN,NNN" ${'NN,NN,NN,NNN' == regionalSettings.numberFormat ? 'selected' : ''}>NN,NN,NN,NNN</option>
			<option value="NNN,NNN,NNN" ${'NNN,NNN,NNN' == regionalSettings.numberFormat ? 'selected' : ''}>NNN,NNN,NNN</option>
			<option value="NNN NNN NNN" ${'NNN NNN NNN' == regionalSettings.numberFormat ? 'selected' : ''}>NNN NNN NNN</option>
			<option value="NNN.NNN.NNN" ${'NNN.NNN.NNN' == regionalSettings.numberFormat ? 'selected' : ''}>NNN.NNN.NNN</option>
			</select> 
            <span id="numberFormatError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                </div>
            </div>
</div>
 <div class="form-group col-lg-6">
        	 <div class="row">
        	 	 
        	 <div class="col-lg-12">
                 <label><spring:message code="time.format.label" /></label><span style="color:red; font-size:2">*</span>
                  <input type="hidden" id="ddd" value="${regionalSettings.dateFormat}">
           <select class="form-control" name="timeFormat" id="timeFormat">
			<option value="HH:mm:SS" ${'HH:mm:SS' == regionalSettings.timeFormat ? 'selected' : ''}>HH:mm:SS</option>
			<option value="HH:mm:SS AM/PM" ${'HH:mm:SS AM/PM' == regionalSettings.timeFormat ? 'selected' : ''}>HH:mm:SS AM/PM</option>
			<option value="HH:mm" ${'HH:mm' == regionalSettings.timeFormat ? 'selected' : ''}>HH:mm</option>
			<option value="HH:mm AM/PM" ${'HH:mm AM/PM' == regionalSettings.timeFormat ? 'selected' : ''}>HH:mm AM/PM</option>
			</select> 
            <span id="timeFormatError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                </div>
            </div>
</div>
</div>
</div>
                     </div>
                     <div class="col-lg-1"></div>
                     <div class="col-lg-5" style="padding-top:1%; margin-top:-5%;" id="two">
<div class="row helpBox" style="margin-top:9px; width:115%;">
<h4 style="text-align: right; margin-right: 15px;"><a href="#" style="color:blue;"><ul>Help</ul></a></h4>
<div class="form-group col-lg-12" style="border: 1px solid #ccc;border-radius: 15px;  height:331px;">
<p style="font-weight:600;">
Depends on the country and Region,the Implementation is done,one has to 
do the regional settings.
<br>
You can do the following settings.
<br>
&nbsp;&nbsp;&nbsp;&nbsp;1) Language
<br>
&nbsp;&nbsp;&nbsp;&nbsp;2) Date(Current Date)
<br>
&nbsp;&nbsp;&nbsp;&nbsp;3) Time(Now)
<br>
&nbsp;&nbsp;&nbsp;&nbsp;4) Time Zone
<br>
&nbsp;&nbsp;&nbsp;&nbsp;5) Country
<br>
&nbsp;&nbsp;&nbsp;&nbsp;6) Date Format
<br>
&nbsp;&nbsp;&nbsp;&nbsp;7) Number Format
<br>
&nbsp;&nbsp;&nbsp;&nbsp;8) Currency
<br>
&nbsp;&nbsp;&nbsp;&nbsp;9) Time Format
</p>
<br><br><br><br><br><br>
</div>
</div>
</div>
</div>
</div>
       	<div class="row" style="text-align: right; margin-top: 0px;">
        <br>
         <br>
  <div class="row">  
  <div class="col-lg-12" >
<div class="row" style="text-align: center;margin-top:30px">
<c:forEach var="accessControl" items="${sessionScope.settings}">
      <c:if test="${accessControl.appDocument == 'RegionalSettings' && accessControl.write == true}">
		
		 <input type="button" id="submit" style="margin-right: 25%;" class="btnCls" data-toggle="modal" data-target="#myModal"   value="<spring:message code="submit.label" />">
		
	</c:if>
</c:forEach>
		 <input type="button" class="btnCls" style=""  onclick="showCustomerSettingsFlow();" value="<spring:message code="cancel.label" />">
</div>
	</div>
	</div>
    </div>
   	</div>
                      
                      
  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer Regional Settings</h4>
      </div>
      <div class="modal-body">
        <p>Requested to make changes in Customer Regional Settings, do you want to continue and apply?</p>
      </div>
      <div class="modal-footer">
      <div class = "col-lg-6" >
<!--               <button type="button" class="btnCls"  onclick=""  data-dismiss="modal">Cancel</button> -->
      </div>
         <c:if test="${status == 'new'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validateRegionalSettingsForm('new')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      <c:if test="${status == 'edit'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validateRegionalSettingsForm('edit')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      </div>
    </div>

  </div>
</div>
                           
                      
                      
                      
                      <br>
                     </form>
	</div>

</div>
</div>
</section><!-- /.content -->
 <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timeZones/timezones.full.js"></script>
<%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timeZones/moment.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timeZones/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timeZones/moment-timezone.js"></script> --%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
     
     
  });
  $('#timeZone').timezones(); 
 /*  onchange="print_country('country');" */
	 
  if($("#timeZoneVal").val()!=''||undefined){
	  $("#timeZone").val($("#timeZoneVal").val());
  }
 
 
        </script>
</body>
</html>