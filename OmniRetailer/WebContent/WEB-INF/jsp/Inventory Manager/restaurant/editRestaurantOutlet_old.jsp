<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/editstore.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link href="${pageContext.request.contextPath}/css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/restaurent_outlet.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
	 #cbgroup{
	   height:90px;overflow:auto;border:1px solid #e5e6e6;
	 }
	 .checkbox{
	   margin-left:8%;
	 }
</style>
<script>
$(document).ready(function(){
	var phoneNo = $("#phone").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	displayTablesForEdit();

	
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
                    <h1>
                        <spring:message code="configurations.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="configurations.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.store.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form method="POST">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                        <c:forEach var="outletDetails" items="${storeDetailsList}">
									<div class="row">
									  <div class="form-group col-lg-4">
									    <input type="hidden" name="storeCode" value="${outletDetails.storeCode}"/>
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
                                         <input type="text" class="form-control" name="location" id="workLocation" value="${outletDetails.location}" readonly/>
									  </div>
									   <div class="form-group col-lg-4">
                                          
                                        </div>
									</div>
									<div class="row">
									    <div class="form-group col-lg-4">
                                            <label><spring:message code="storename.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="storeName" id="storename" value="${outletDetails.storeName}" />
                                            <span id="storeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="phone.label" /> <span class="requiredField">*</span></label>
                                             <div class="row">
				                                  <div class="form-group col-lg-4">
				                                  	<select class="form-control" style="padding: 6px 8px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  		<option selected="selected">IN</option>
				                                  		<option>US</option>
				                                  		<option>GB</option>
				                                  		<option>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="form-group col-lg-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.phone.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="phone" id="phone"  value="${outletDetails.phone}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                            <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             
                                            
                                            <%-- <input name="phone" type="tel" class="form-control number" pattern="[0-9]{11}" required id="phone" value="${outletDetails.phone}"  />
                                            <span id="phoneError" style="text-align:right;color:red;font-weight:bold;"></span> --%>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="fax.label" /></label>
                                            <input type="text" name="fax" class="form-control number" id="fax" value="${outletDetails.fax}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span id="faxError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                    </div>
                                         
                                    <div class="row">
                                       
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="language.label" /> <span class="requiredField">*</span></label>
                                             <select class="form-control" name="language" id="language">
                                             <c:forEach var="language" items="${languagesList}">
												<option value="${language}" ${language == outletDetails.language ? 'selected' : ''} >${language}</option>
											</c:forEach>
                                           </select>
                                           <%--  <input type="text" name="language" class="form-control number" id="language" value="${outletDetails.language}"/> --%>
                                            <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="currency.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="currency" id="currency">
                                             <c:forEach var="currency" items="${currencyList}">
												<option value="${currency}" ${currency == outletDetails.currency ? 'selected' : ''} >${currency}</option>
											 </c:forEach>
											 </select>
                                             <%-- <c:forEach var="category" items="${categories}">
												<option value="${category}" ${category == product.category ? 'selected' : ''}>${category}</option>
											</c:forEach>
                                            <input type="text" name="currency" class="form-control number" id="currency" value="${outletDetails.currency}"/> --%>
                                            <span id="currencyError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="minepayamount.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" name="minPayAmount" class="form-control" required id="amount" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${outletDetails.minPayAmount}" />
                                            <span id="amountError" style="text-align:right;color:red;font-weight:bold;"></span>
										</div>
										
                                     </div>
                                       
                                   <div class="row" style="padding-left:5%;">
                                        <!-- time Picker -->
                                   <div class="form-group col-lg-4"> 
                                         <label><spring:message code="foodcoupons.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                   <input type="radio" name="foodCoupons" value="true" ${outletDetails.foodCoupons=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="foodCoupons" value="false" ${outletDetails.foodCoupons=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            
                                        </div>
                                        
                                                                          
                                    <div class="form-group col-lg-4">
                                      <label><spring:message code="remotebilling.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                   <input type="radio" name="remoteBilling" value="true" ${outletDetails.remoteBilling=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="remoteBilling" value="false" ${outletDetails.remoteBilling=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </div>
                                     
                                      <div class="form-group col-lg-4"> 
                                         <label><spring:message code="printing.label" /></label>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="printing" value="true" ${outletDetails.printing=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="printing" value="false" ${outletDetails.printing=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </div>
                                   
                                   </div>
                                  
                                  
                                        <div class="row">
                                         
                                       
                                          <div class="form-group col-lg-4">
                                         <div class="bootstrap-timepicker">
                                            <label><spring:message code="billing.starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="startTime" id="startTime" value="${outletDetails.startTime}"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="startTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                      </div>
                                             
                            <!-- time Picker -->
                                    
                                       <div class="form-group col-lg-4">
                                        <div class="bootstrap-timepicker">
                                            <label><spring:message code="billing.endtime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" name="endTime" class="form-control timepicker" id="endTime"  value="${outletDetails.endTime}"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                          <span id="endTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                    </div>
                                      
                                            <div class="form-group col-lg-4">
                                         
                                            <label><spring:message code="tax.label" /> <span class="requiredField">*</span></label>
                                             <fieldset id="cbgroup">
                                            <!-- <select class="form-control" id="tax" multiple onchange="addDynamicDiv();"> -->
                                             <c:forEach var="tax" items="${taxList}">
												<%-- <option value="${tax}">${tax}</option> --%>
												<div class="checkbox" style="margin-left:8%;"><input type="checkbox" onclick="getSelectedTaxes();" name="allTaxes" value="${tax}" id="${fn:replace(tax,' ','')}"/>${tax}</div>
											</c:forEach>
											</fieldset>
                                           <!-- </select> -->
                                        </div>
                                       
                                            </div>
                                          
                                       <%--  <div class="row" id="tax-headings" style="display:none;">
                                        <div class="form-group col-lg-3"> 
                                         <label><spring:message code="taxname.label"/></label>
                                         </div>
                                         <div class="form-group col-lg-3"> 
                                         <label><spring:message code="taxtype.label"/></label>
                                         </div>
                                         <div class="form-group col-lg-3"> 
                                         <label><spring:message code="taxrate.label"/></label>
                                         </div>
                                        </div>
                                        <div id="data" style="width:100%;/* margin-top:271px; */">
	                                         
	                                    </div> --%>
	                                    
	                                     <div class="col-xs-12" id="data" style="display:none;">
                                          <table id="taxestable" class="table table-bordered table-hover">
                                            <thead style="background-color: #3c8dbc; color: #ffffff">
                                             <tr>
                                            	<th><spring:message code="taxname.label"/></th>
                                                <th><spring:message code="taxtype.label"/></th>
                                                <th style="width:40%;"><spring:message code="taxrate.label"/></th>
                                             </tr>
                                            </thead>
                                            <tbody>
                                        	 
                                            </tbody>
                                          </table>
                                       </div>
                                        <input type="hidden" id="taxList" value='${taxDetailsList}' />
                                            
                                       	</c:forEach>
                                    </div><!-- /.box-body -->
									
						<div class="row" style="margin:0px 0px 0px 35%;">
						 <input type="button" id="submit" class="btn bg-olive btn-inline" onclick="validateRestaurantOutlet('edit');" value="<spring:message code="save.label" />" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="return viewRestaurantConfigurations('restaurantConfig');" value="<spring:message code="cancel.label" />" />
						</div>
						
				
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                 
                                </form>
                                     <input type="hidden" name="taxes" id="taxes" value=""/>
                               
                            </div>

</div>
</div>
</section><!-- /.content -->
<!-- bootstrap time picker -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false
  });

  </script>
</body>
</html>