<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : admin/genericData/newAssetMaster.jsp
 * file type		        : JSP
 * description				: The newAssetMaster form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/assetMaster.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	
<style type="text/css">
	.col-xs-12 {
	 padding: 2%; 
	 }
</style>

<script type="text/javascript">
$(document).ready(function(){
	//callCalender('aquiredDate');
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$("#aquiredDate").val(formatedDate);
	
});
</script>        
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

				<div class="box box-primary " style="padding:0px ">
    <div class="box-header" style="text-align: left">
   
    <h3 align="center"><spring:message code="view.asset.label" /></h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <form>
    
        <div class="box-body">
        <div class="" style="text-align: right; margin-top: 0px;">
        
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
		 <!-- <input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;" onclick="viewAssetMaster('assetMaster','0')" value="Cancel"> -->
    	 
        	 
        	 </div>

        	 <div class="row" style="padding: 0% 1%;">
        	 <div class="col-lg-1"></div>
        	 <div class="form-group col-lg-4">
        	 <div class="row">
        	 	 
        	 <div class="col-lg-12">
        	 <label><spring:message code="asset.name.label" /> <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control form-group" id="assert_name" readonly="readonly" value="${assetMaster.assetName}" placeholder="<spring:message code="enter.asset.name" />" />
                <span id="assetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
            </div>
            <div class="row">
            <div class="col-lg-12">
            <label><spring:message code="asset.category.label" /></label><span style="color:red; font-size:2">*</span>
           <input type="hidden" id="sds" value="${assetMaster.assetCategory}">
           <select class="form-control form-group" name="category" disabled="disabled" id="category">
           		<option value="Office Furniture" ${'Office Furniture' == assetMaster.assetCategory ? 'selected' : ''}>Office Furniture</option>
           	<option value="Machine & Equipments" ${'Machine & Equipments' == assetMaster.assetCategory ? 'selected' : ''}>Machine & Equipments</option>
           	<option value="Computer Peripherals" ${'Computer Peripherals' == assetMaster.assetCategory ? 'selected' : ''}>Computer Peripherals</option>
          	<option value="Land & Buildings" ${'Land & Buildings' == assetMaster.assetCategory ? 'selected' : ''}>Land & Buildings</option>
          	<option value="Vehicles" ${'Vehicles' == assetMaster.assetCategory ? 'selected' : ''}>Vehicles</option>
          	<option value="Plant & Machinery" ${'Plant & Machinery' == assetMaster.assetCategory ? 'selected' : ''}>Plant & Machinery</option>
          	<option value="Cash Accounts" ${'Cash Accounts' == assetMaster.assetCategory ? 'selected' : ''}>Cash Accounts</option>
          	<option value="Technology" ${'Technology' == assetMaster.assetCategory ? 'selected' : ''}>Technology</option>
          	<option value="Bank Deposits" ${'Bank Deposits' == assetMaster.assetCategory ? 'selected' : ''}>Bank Deposits</option>
          	<option value="Receivables" ${'Receivables' == assetMaster.assetCategory ? 'selected' : ''}>Receivables</option>
          	<option value="Investments" ${'Investments' == assetMaster.assetCategory ? 'selected' : ''}>Investments</option>
          	<option value="Merchandise Inventory" ${'Merchandise Inventory' == assetMaster.assetCategory ? 'selected' : ''}>Merchandise Inventory</option>
          	<option value="Hardware Assets" ${'Hardware Assets' == assetMaster.assetCategory ? 'selected' : ''}>Hardware Assets</option>
          	<option value="Consumables" ${'Consumables' == assetMaster.assetCategory ? 'selected' : ''}>Consumables</option>
          	<option value="License Assets" ${'License Assets' == assetMaster.assetCategory ? 'selected' : ''}>License Assets</option>
          	<option value="Fixed Assets" ${'Fixed Assets' == assetMaster.assetCategory ? 'selected' : ''}>Fixed Assets</option>
          	<option value="Current Assets" ${'Current Assets' == assetMaster.assetCategory ? 'selected' : ''}>Current Assets</option>
           </select> 
            <span id="assetCategoryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
    </div>   
            </div>
             <div class="row">
              <div class="col-lg-12">
             <label><spring:message code="serial.number.label" /> <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control form-group" id="serialNo" readonly="readonly" value="${assetMaster.serialNum}" placeholder="<spring:message code="enter.serial.number" />" />
                <span id="serialNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        </div>
                           </div>
             <div class="row">
                 <div class="col-lg-12">
                <label><spring:message code="manufacturer.label" /></label><span style="color:red; font-size:2">*</span>
                <input type="text" class="form-control form-group" id="manufacturer" readonly="readonly" value="${assetMaster.manufacturer}" placeholder="<spring:message code="enter.manufacturer" />" />
            <span id="manufacturerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
           </div>
           <div class="row">
                 <div class="col-lg-6">
             
             <label><spring:message code="aquiredDate.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <!-- <div class="input-group">
                                            <div class="input-group-addon" onclick="callCalender('dob')">
                                                <i class="fa fa-calendar"></i>
                                            </div> -->
                                            <!-- <input type="text" name="dateOfBirth" id="dob" required class="form-control form-group" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                            <input class="form-control form-group calendar_icon"  style="background-color: " name="aquiredDate" id="aquiredDate" readonly="readonly" value="${assetMaster.dateStr}" size="20" type="text"  placeholder="DD/MM/YYYY"/>
                                        <!-- </div> -->
                                          <span id="aquiredDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
             
             
             <%-- 
                                        	<div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <!-- <input type="text" name="startDate" id="startDate" required class="form-control form-group" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                             <label><spring:message code="aquiredDate.label" /></label><span style="color:red; font-size:2">*</span>
                                            <input class="form-control form-group"  style="background-color: white;" name="aquiredDate" id="aquiredDate" size="20" type="text" onfocus="callCalender('aquiredDate')" onclick="callCalender('aquiredDate')" placeholder="DD/MM/YYYY"/>
                                        </div><!-- /.input group -->
                                        <span id="aquiredDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         
             --%>
            </div>
           </div>
          <div class="row">
                 <div class="col-lg-6">
                <label><spring:message code="Cost.label" /></label>
              <input type="text" class="form-control form-group" id="cost" readonly="readonly" value="${assetMaster.cost}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.cost" />" />
            </div>
           </div>
           <div class="row">
                 <div class="col-lg-6">
                <label><spring:message code="asset.status.label" /></label>
                <input type="text" class="form-control form-group" id="assetStatus" readonly="readonly" value="${assetMaster.assetStatus}" placeholder="<spring:message code="enter.asset.status" />" />
            </div>
           </div>
           <div class="row">
                 <div class="col-lg-6">
                <label><spring:message code="quantity.label" /></label>
                <input type="text" class="form-control form-group" id="quantity" readonly="readonly" value="${assetMaster.quantity}" placeholder="<spring:message code="enter.quantity.label" />" />
            </div>
           </div>
          
                          </div>
                            <div class="form-group col-lg-2"></div>
<div class="form-group col-lg-4">
                             
               <div class="row">
                             <div class="col-lg-12">
                             
                <label><spring:message code="asset.ref.number.label" /></label>
                <input type="text" class="form-control form-group" id="assetRefNumber" readonly="readonly" value="${assetMaster.assetRefNum}" placeholder="<spring:message code="enter.ref.number" />" />
            </div>
            </div>
  <div class="row">
                             <div class="col-lg-12">
                             
                <label><spring:message code="cost.center.label" /></label>
                <input type="text" class="form-control form-group" id="costCenter" readonly="readonly" value="${assetMaster.costCenter}" placeholder="<spring:message code="enter.cost.center" />" />
            </div>
            </div>
 <div class="row">
  <div class="col-lg-12">
  <label><spring:message code="model.label" /></label>
  <input type="text" class="form-control form-group" id="model" value="${assetMaster.model}" readonly="readonly" placeholder="<spring:message code="enter.model.label" />" />
 </div>
  </div>
 <div class="row">
  <div class="col-lg-12">
  <label><spring:message code="status.label" /></label>
  <input type="text" class="form-control form-group" id="status" value="${assetMaster.status}" readonly="readonly" placeholder="<spring:message code="enter.status.label" />" />
 </div>
  </div>
        
 <div class="row">
  <div class="col-lg-12">
  <label><spring:message code="location.label" /></label>
  <input type="text" class="form-control form-group" id="location" value="${assetMaster.location}" readonly="readonly" placeholder="<spring:message code="enter.location.label" />" />
 </div>
  </div>              
 <div class="row">
	  <div class="col-lg-12">
	  <label><spring:message code="maintained.by.label" /></label>
	  <input type="text" class="form-control form-group" id="maintainedBy" readonly="readonly" value="${assetMaster.maintainedBy}" />
	 </div>
 </div>              
 
          </div>
          
                     </div>
  <div class="row" style="padding: 0% 1%;">
  <div class="col-lg-1"></div>
	  <div class="col-lg-10">
		  <label><spring:message code="asset.details.label" /></label>
		  <textarea class="form-control form-group" style="resize:none;" id="assetDetails" readonly="readonly" placeholder="<spring:message code="enter.details.label" />">${assetMaster.assetDetails}</textarea>
	 </div>
  </div>   
              <div class="row" style="text-align: center; margin-top: 10px;">
				<input type="button" class="btnCls" style="" onclick="viewAssetMaster('assetMaster','0');" value="<spring:message code="cancel.label" />">	 
        	 </div>
                     </div> 
                     
                      		<input type="hidden" id="maxRecords" value="${maxRecords}"/>
                     		<input type="hidden" id="maxRecords" value="${maxRecords}"/>
  						<input type="hidden" id="searchAsset" value="${searchName}"/>
                     
                     <div class="box-footer">
                                    
                    </div>
                     </form>
	</div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>