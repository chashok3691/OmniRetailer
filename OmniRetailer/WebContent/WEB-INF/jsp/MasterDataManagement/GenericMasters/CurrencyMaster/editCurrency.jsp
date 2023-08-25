<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/editCurrency.jsp
 * file type		        : JSP
 * description				: The currency form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/currencyMaster.js"></script>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
</style>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="currency.master.label" /></small>
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

				<div class="box box-primary" style="padding: ">
                     <div class="box-header" style="text-align: center">
                     <br/>
                        <h3><spring:message code="edit.currency.label" /></h3>
                         </div><!-- /.box-header -->
                         <!-- form start -->
                          <form method="post">
                           <div class="box-body">
                            <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                            <div class="form-group">
                                 <label><spring:message code="base.currency.label" /> <span style="color:red; font-size:2">*</span></label>
                                 <input type="text" readonly="readonly" class="form-control" id="baseCurrency" name="baseCurrency" placeholder="" value="${currencyDetails.baseCurrency}" />
                                  <span id="baseCurrencyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              </div>
                           	 <div class="form-group">
                                <label><spring:message code="country.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                	<select id="countryName" name ="countryName" disabled="disabled" class="form-control" onChange="list(this.value)" >
									</select>
                                  <input type="hidden" class="form-control" id="selectedCountry" readonly="readonly" value="${currencyDetails.countryName}" />
                                  <span id="countryNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              </div>
                             <div class="form-group">
                                <label><spring:message code="currency.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                  <input type="text" readonly="readonly" class="form-control" id="currencyCode" placeholder="<spring:message code="enter.currency.code" />" value="${currencyDetails.currencyCode}" />
                                  <span id="currencyCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              </div>
                              <div class="form-group">
                                <label><spring:message code="conversion.ratio.label" /> <span style="color:red; font-size:2">*</span></label>
                                  <input type="text" class="form-control" id="conversionRatio" placeholder="<spring:message code="enter.conversion.ratio.label" />" value="${currencyDetails.conversionRatio}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                  <span id="conversionRatioError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                              </div>
                          </div><!-- /.box-body -->
                         <br>			
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="validateCurrencyForm('edit');" value="<spring:message code="submit.label" />" />
						 <input type="button" class="btnCls buttonMargin"  onclick="return viewCurrencyMaster('currencyMaster','0');" value="<spring:message code="cancel.label" />" />
						</div>
					<br/>
										<input type="hidden" value="${maxRecords}" id="maxRecords"/>
										<input type="hidden" value="${searchName}" id="searchCurrency"/>
					
                    <div class="box-footer">
                                    
                    </div>
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/currency_plugin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//$("#currencyCode").focus();
	var count=con.length;
	var op = '<option value="-1" >Select Country</option>';
	for(var i=0;i<count;i++)
		op = op +"<option value="+i+">"+con[i]+"</option>";
	$("#countryName").html(op);
	//print_country("countryName");
	var selectedCountry = $("#selectedCountry").val();
	if(selectedCountry == null || selectedCountry == ""){
		selectedCountry = "India";
	}
	$("#countryName option").each(function() {
	  if($(this).text() == selectedCountry) {
	    $(this).attr('selected', 'selected');            
	  }                        
	});
	var index = $("#countryName").val();
	$("#currencyCode").val(cod[index] +" - "+ cur[index]);
});
$("#countryName").keydown(function(){
	$("#countryNameError").html("");
	$(".Error").html("");
});
$("#currencyCode").keydown(function(){
	$("#currencyCodeError").html("");
    $(".Error").html("");
});
$("#conversionRatio").keydown(function(){
	$("#conversionRatioError").html("");
    $(".Error").html("");
});
</script>
</body>
</html>