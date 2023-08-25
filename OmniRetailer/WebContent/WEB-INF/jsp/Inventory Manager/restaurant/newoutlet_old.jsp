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
	<title>New restaurant outlet | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/restaurent_outlet.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
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

</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
					<h1><spring:message code="outlet.management.label" />
     					<small><p id="heading"><spring:message code="configurations.label" /></p></small>
   					</h1>
                   <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="new.store.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form method="POST">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      
									<div class="row">
									  <div class="form-group col-lg-4">
									     <input type="hidden" name="storeCode" value=""/>
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
                                           <select class="form-control" name="location" id="workLocation">
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select>
									  </div>
									   <div class="form-group col-lg-4">
                                          
                                        </div>
									</div>
									<div class="row">
									    <div class="form-group col-lg-4">
                                            <label><spring:message code="storename.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="storeName" id="storename" placeholder="<spring:message code="enter.storename.label" />" />
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
				                                  <input type="hidden" class="form-control" name="phone" id="phone"  value=""/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                            <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             
                                            
                                            <%-- <input name="phone" type="tel" class="form-control number" pattern="[0-9]{11}" required id="phone" placeholder="<spring:message code="enter.phone.label" />"  />
                                            <span id="phoneError" style="text-align:right;color:red;font-weight:bold;"></span> --%>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="fax.label" /></label>
                                            <input type="text" name="fax" class="form-control number" id="fax" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.fax.label" />" />
                                            <span id="faxError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                    </div>
                                         
                                    <div class="row">
                                       
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="language.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="language" id="language">
                                             <c:forEach var="language" items="${languagesList}">
												<option value="${language}">${language}</option>
											 </c:forEach>
                                           </select>
                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="currency.label" /> <span class="requiredField">*</span></label>
                                            <select class="form-control" name="currency" id="currency">
                                             <c:forEach var="currency" items="${currencyList}">
												<option value="${currency}">${currency}</option>
											 </c:forEach>
                                            </select>
                                        <span id="currencyError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="minepayamount.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" name="minPayAmount" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required id="amount" placeholder="<spring:message code="amount.label" />" />
                                            <span id="amountError" style="text-align:right;color:red;font-weight:bold;"></span>
										</div>
										
                                     </div>
                                       
                                   <div class="row" style="padding-left:5%;">
                                        <!-- time Picker -->
                                   <div class="form-group col-lg-4"> 
                                         <label><spring:message code="foodcoupons.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="foodCoupons" value=true checked>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="foodCoupons" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            
                                        </div>
                                        
                                                                          
                                    <div class="form-group col-lg-4">
                                      <label><spring:message code="remotebilling.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="remoteBilling" value=true checked>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="remoteBilling" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </div>
                                     
                                      <div class="form-group col-lg-4"> 
                                         <label><spring:message code="printing.label" /></label>
                                            <div class="radio">
                                           
                                                <label>
                                                    <input type="radio" name="printing" value=true checked>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="printing" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </div>
                                   
                                   </div>
                                  
                                  
                                

                                        <div class="row">
                                         
                                       
                                          <div class="form-group col-lg-4">
                                         <div class="bootstrap-timepicker">
                                            <label><spring:message code="billing.starttime.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="startTime" id="startTime"/>
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
                                                <input type="text" name="endTime" class="form-control timepicker" id="endTime"/>
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
												<div class="checkbox" style="margin-left:8%;"><input type="checkbox" onclick="getSelectedTaxes();" name="allTaxes" value="${tax}"/>${tax}</div>
											</c:forEach>
											</fieldset>
                                           <!-- </select> -->
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
                                            <tbody>
                                        	 
                                            </tbody>
                                          </table>
                                       </div>
                             
                             <!-- added by kalyan Start-->
                             
                           <div class="row">
                           <div class="form-group col-lg-4">
                                <label><spring:message code="no.of.levels.label"/><span class="requiredField">*</span></label>
		                        <input type="text" name="lodgingFloor" id="lodgingFloor" value="1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" class="form-control">
                                <span id="lodgingFloorError" style="text-align:right;color:red;font-weight:bold;"></span>
                           </div>
                            <div class="form-group col-lg-2">
                        		<label>&nbsp;</label>
	                            <input type="button" class="btn form-control" value="Add Levels" onclick="addLevels(this)" style="padding: 3px 0px;background: #DDD;">
                           </div>
                                    
                           </div>          
                                       
                          <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs" id="outletLevels">
	                                <li class="active" id="tab1"><a href="#tab_1" data-toggle="tab">Level 1</a></li>
	                                <%-- <li><a href="#tab_2" data-toggle="tab"><spring:message code="restaurentManagement.label"/></a></li> --%>
                                </ul>
                                
                                <div class="tab-content" id="levelTabContent" style="min-height: 200px;">
                                    
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                      				  <div class="col-lg-12">
                        				<input type="button" class="btn" value="Add Section" onclick="addSection('1')">
                        				<!-- <input type="button" class="btn" value="Delete Section" onclick="deleteSection('1')"> -->
                        				<div id="level1_sections" >
                        				</div>
                                	 </div>
                                    </div>
                                    </div>
                                    
                                   
                                  </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->   
                        </section>
                            <!-- added by kalyan End-->           
                                       
                                       
                                    </div><!-- /.box-body -->
									
						<div class="row" style="margin:0px 0px 0px 35%;">
						 <input type="button" id="submit" class="btn bg-olive btn-inline" onclick="validateRestaurantOutlet('new');" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="next.label" />&nbsp;&nbsp;&nbsp;&nbsp;" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="return viewRestaurantConfigurations('restaurantConfig');" value="<spring:message code="cancel.label" />" />
						</div>
						<%-- <span class="requiredField">${err}</span> --%>
				
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                  <input type="hidden" id="taxList" value='' />
                                    
                                </form>
                                <input type="hidden" name="taxes" id="taxes" />
                            </div>

</div>
</div>
</section><!-- /.content -->
 <!-- bootstrap time picker -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
        
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false
  });
  $('#taxestable').dataTable({
      "bPaginate": false,
      "bLengthChange": false,
      "bFilter": false,
      "bSort": false,
      "bInfo": false,
      "bAutoWidth": false
  });
  </script>
</body>
</html>