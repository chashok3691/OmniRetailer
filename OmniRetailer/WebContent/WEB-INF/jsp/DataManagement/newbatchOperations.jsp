<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manoj...
 * file name		        : jsp/bachOperations.jsp
 * file type		        : JSP
 * description				: display Batch Operations information
 * */ -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
   
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Batch Operations | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dataManagement/batchOperation.js"></script>
		
        <!-- DATA TABLES -->
<script type="text/javascript">
        $(document).ready(function(){
        	debugger;
        	
        	
        	callCalender("from");
        	
        	
        
        		
        });
</script>

<style type="text/css">
.btnCls{
	padding: 5px 20px !important;
	width: 60% !important;
}
#batchesList{
	height: 140px;
    content-visibility: auto;
    overflow-x: auto;
    }
    
#circleIcons{
    cursor: pointer;
    font-size: 25px;
    }
</style>
</head>
<body>
<!-- Main content -->
  <section class="content">
  
   <div class="row">
         <div class="col-xs-12">
           <div class="box box-primary">
           <div class="box-header">
 				<div class="form-group col-lg-12" style="text-align: center;">
 				<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">Batch Operations - New</h3>
 				</div>
 			
 			</div><!-- box-header -->
 			
                 <div class="box-body">
	              <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        	  <div id="Success" class="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
           			<br>
	           
                        <div class="row" style="margin-left: 5%;margin-right: 5%">
                          <%--  <div class="row batchName">
                                 <div class="col-sm-5 col-lg-5 nopadding" >
                                      <input type="text" class="form-control" id="batchName"  placeholder='<spring:message code="batchOperations.batch_name.placeholder"></spring:message>' style=" width: 100%" >
                         <span id="batchNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                 <div class="col-sm-5 col-lg-5"></div>
                                 <div class="col-lg-2 col-sm-2 nopadding">
                                        <select class="form-control" id="batchStatus">
                                           <option disabled selected>Select Status</option>
                                            <option value="Active">Active</option>
                                            <option value="InActive">InActive</option>
                                            
                                        </select>
                                   <span id="batchStatusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   </div>
                             </div>    
                                 
                              <div class="row batchDesc">
                                 <div class="col-lg-12 col-sm-12 col-lg-12" style="padding-left: 0px;padding-right: 0px;margin-top: 10px;">
                                    <textarea class="form-control" id="batchDescription"  placeholder='<spring:message code="batchOperations.batch_description.placeholder"></spring:message>'></textarea>
                                 </div>
                               </div> --%>
                               
                               <div class="row batchName">
                                 <div class="col-sm-5 col-lg-3 nopadding" >
                                      <input type="text" class="form-control" id="batchName"  placeholder='<spring:message code="batchOperations.batch_name.placeholder"></spring:message>' style=" width: 100%" >
                         <span id="batchNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                 <div class="col-sm-5 col-lg-7"></div>
                                 <div class="col-lg-2 col-sm-2 nopadding">
                                        <select class="form-control" id="batchStatus">
                                           <option disabled selected>Select Status</option>
                                            <option value="Active">Active</option>
                                            <option value="InActive">InActive</option>
                                            
                                        </select>
                                   <span id="batchStatusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   </div>
                             </div>    
                                 
                              <div class="row batchDesc">
                                 <div class="col-sm-5 col-lg-3 col-lg-12 nopadding" style="padding-left: 0px;padding-right: 0px;margin-top: 10px;">
                                    <textarea class="form-control" id="batchDescription"   style="resize: none;" placeholder='<spring:message code="batchOperations.batch_description.placeholder"></spring:message>'></textarea>
                                 </div>
                                 <div class="col-sm-5 col-lg-7"></div>
                                 <div class="col-lg-2 col-sm-2 nopadding" style="padding-left: 0px;padding-right: 0px;margin-top: 10px;">
                                       <select class="form-control" id="roleName" >
                                     <option value=""><spring:message code="ALL.label"/></option>
                                 	<c:forEach var="role" items="${roleList}">
										<option value="${role.roleName}"${role.roleName == roleName ? 'selected' : ''}>${role.roleName}</option>
									</c:forEach>
                                 </select>
                                 <span id="roleNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   
                                   </div>
                               </div>
                             
                            <div class="row">
                             <div class="col-lg-6 col-sm-12">
                               <div class="row">
                                   <div class="col-lg-10 col-sm-10" style="margin-top:30px;padding-left: 0px;padding-right: 0px;border-bottom: 1px solid #d2d6de;margin-bottom: 10px;">
                                     <label style="font-size: 16px;"><spring:message code="batchOperations.batch_operations.label"/></label>
                                   </div>
                                </div> 
                                
                                <div class="row batchMainOperation">
                                    <div class="col-lg-8 col-sm-8 col-xs-10 mainBatch" style="margin-right: 10px;padding-right: 0px;padding-left: 0px;color:none;">
                                        <select class="form-control" id="batchMainOption" name="batchMainOption" title="" onchange="selectOperations();" >
                                           <option selected disabled><spring:message code="batchOperations.batch_operations.main_operation.placeholder"/></option>
                                           <option value="Reports" ${batchOperationList.batch_operation == 'Reports' ? 'selected' : ''} > Report Generation </option>
                                           <option value="DatabaseBackup" ${batchOperationList.batch_operation == 'DatabaseBackup' ? 'selected' : ''}> Database Backup </option>
                                           <option value="Collaboration" ${batchOperationList.batch_operation == 'Collaboration' ? 'selected' : ''}> Collaboration </option>
                                           <option value="DataExport" ${batchOperationList.batch_operation == 'DataExport' ? 'selected' : ''}> Data Export </option>  
                                           <option value="DataImport" ${batchOperationList.batch_operation == 'DataImport' ? 'selected' : ''}> Data Import </option>
                                           <option value="IntegrationAPI" ${batchOperationList.batch_operation == 'IntegrationAPI' ? 'selected' : ''}> Integration API </option>
                                           <option value="UsageLog" ${batchOperationList.batch_operation == 'UsageLog' ? 'selected' : ''}>Usage Log</option> 
                                           <option value="ExceptionLog" ${batchOperationList.batch_operation == 'ExceptionLog' ? 'selected' : ''}>Exception Log</option>
                                           <option value="PosToSap" ${batchOperationList.batch_operation == 'PosToSap' ? 'selected' : ''}>PosToSap</option>
                                           <option value="PushBills" ${batchOperationList.batch_operation == 'PushBills' ? 'selected' : ''}>PushBills</option>
                                           <option value="SyncData" ${batchOperationList.batch_operation == 'SyncData' ? 'selected' : ''}>SyncData</option>
                                           <option value="Orders" ${batchOperationList.batch_operation == 'Orders' ? 'selected' : ''}>Orders</option>
                                           <option value="StockHistory" ${batchOperationList.batch_operation == 'StockHistory' ? 'selected' : ''}>Stock History</option>
                                            <option value="FTPReports" ${batchOperationList.batch_operation == 'FTPReports' ? 'selected' : ''}> FTP Reports</option>
                                           
                                        </select>
                                        <span id="mainOperationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        <br>
                                   </div>
                                 <div class="col-lg-2 col-sm-1">     
                                 </div>         
                                 </div>
                                 <div class="row batchSubOperation">
                                    <div class="col-lg-8 col-sm-8 col-xs-10" style="padding-left: 0px;padding-right:0px">
                                        <select class="form-control" id="batchSubOption" name="batchSubOption" title="">
                                           <option selected disabled id="optionBatch" style="display: block;"><spring:message code="batchOperations.batch_operations.sub_operation.placeholder"/></option>
                                            
                                            <option value="ItemWise" id="ItemWise" style="display: block;"> ItemWise Sales </option>
                                            <option value="Datewise" id="Datewise" style="display: block;"> DateWise Sales </option>
                                            <option value="CategoryWise" id="CategoryWise" style="display: block;"> CategoryWise Sales </option>
                                            <option value="DepartmentWise" id="DepartmentWise" style="display: block;"> Department Wise Sales </option> 
                                            <option value="SupplierWise" id="SupplierWise" style="display: block;"> Supplier Wise Sales </option> 
                                            <option value="SalesVSprocurement" id="SalesVSprocurement" style="display: block;"> Sales vs Procurement </option> 
                                            <option value="ItemWiseTax" id="ItemWiseTax" style="display: block;"> ItemWise Tax </option> 
                                            <option value="Profitability" id="Profitability" style="display: block;"> Profitability </option> 
                                            <option value="DSR" id="DSR" style="display: block;"> DSR </option> 
                                            <option value="Purchases" id="Purchases" style="display: block;"> Purchases </option>
                                            
                                            <option value="Incremental" id="Incremental" style="display: block;"> Incremental </option>
                                            <option value="Absolute" id="Absolute"  style="display: block;"> Absolute </option>
                                            
                                            <option value="SKUMasterData" id="SKUMasterData" style="display: block;"> SKU Master Data </option>
                                            <option value="SalesBilling" id="SalesBilling" style="display: block;"> Sales - Billing </option>
                                            <option value="PurchaseGRN" id="PurchaseGRN" style="display: block;"> Purchase - GRN </option> 
                                            <option value="POSSAPOffline" id="POSSAPOffline" style="display: block;"> POS - SAP Offline </option> 
                                            <option value="POSSAPOnline" id="POSSAPOnline" style="display: block;"> POS - SAP Online </option> 
                                            <option value="WarehouseStocktransfer" id="WarehouseStocktransfer" style="display: block;"> Warehouse - Stock Transfer </option> 
                                            <option value="OutletStockReceipt" id="OutletStockReceipt" style="display: block;"> Outlet - Stock Receipts </option>
                                            <option value="PosToSap-Idoc" id="PosToSap-Idoc" style="display: block;">PosToSap-Idoc</option>
                                            <option value="PosToSap-Csv" id="PosToSap-Csv" style="display: block;">PosToSap-Csv</option>
                                            
                                            <option value="PushCompletedBills" id="PushCompletedBills" style="display: block;">Push Completed Bills</option>
                                            <option value="PushReturnBills" id="PushReturnBills" style="display: block;">Push Return Bills</option>
                                            
                                            <option value="SyncSkuMaster" id="SyncSkuMaster" style="display: block;">SyncSkuMaster</option>
                                            <option value="SyncBillsData" id="SyncBillsData" style="display: block;">SyncBillsData</option>
                                            <option value="SyncCustomerData" id="SyncCustomerData" style="display: block;">SyncCustomerData</option>
                                            <option value="SyncCustomerLoyaltyPoints" id="SyncCustomerLoyaltyPoints" style="display: block;">SyncCustomerLoyaltyPoints</option>
                                            <option value="SubscriptionOrder" id="Order" style="display: block;">Subscription Order</option>
                                            <option value="PushOrders" id="pushOrders" style="display: block;">Push orders</option>
                                            <option value="DailyStock" id="dailyStock" style="display: block;">Daily Stock </option>
                                             <option value="DateWise-Mail" id="DateWiseMail" style="display: block;">DateWise-Mail </option>
                                            
                                        </select>
                                        <span id="subOperationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   </div>
                                   <div class="col-lg-2 col-sm-1" style="margin-top: -25px;margin-left: -10px;">     
                                   <a onclick="appendBatches('batchMainOption','batchSubOption')"><h2><i class="fa fa-plus-circle" id="circleIcons" aria-hidden="true"></i></h2></a>
                                 	</div>
                                 	</div>
                                 	
                                  <div class="row BatchOperation">
                                      <div class="col-lg-8 col-sm-8 col-xs-10"  style="margin-right: 10px;padding-right: 0px;padding-left: 0px; margin-top: 10px;">
                                         <section  class="form-control form-group"  id="batchesList" multiple="multiple" ></section>
                                      </div>
                                      <div class="col-lg-2 col-sm-1" style="margin-left: -20px; margin-top: 125px;">     
                                      <a onclick="clearBatches()"><i class="fa fa-minus-circle" id="circleIcons" aria-hidden="true"></i></a>
                                 </div>
                                 </div> 
                                 
                                 
                              </div>   
                              
                            <div class="col-lg-6 col-sm-12">
                                 <div class="row">
                                   <div class="col-lg-10 col-sm-10" style="margin-top:30px;padding-left: 0px;padding-right: 0px;border-bottom: 1px solid #d2d6de;margin-bottom: 10px;">
                                     <label style="font-size: 16px;"><spring:message code="batchOperations.batch_timings.label"/></label>
                                   </div>
                                </div> 
                                
                                <div class="row startTimeandDate">
                                     <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;">
                                         <input class="form-control calendar_icon startDateBatchOperations" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder='<spring:message code="batchOperations.batch_timings.start_date.label"></spring:message>'>
			                          </div>
			                     	
			                          <div class="form-group col-lg-5 col-sm-4 columnpadding bootstrap-timepicker" style="padding-left: 0px;">
                                            <input type="text" class=" form-control timepicker" value="start time" id="startTime" placeholder="<spring:message code="batchOperations.batch_timings.start_time.label"></spring:message>">
                                        </div>
                                </div>
                                
                                  <div class="row batchOperationPeriodic">
                                   <div class="col-lg-10 col-sm-8" style="margin-top:5px;padding-left: 0px;padding-right: 0px;">
                                       <label style="font-size: 16px;"><spring:message code="batchOperations.batch_timings.batch_periodic.label"/></label>&nbsp;
                                        <input type="checkbox" style="vertical-align: -2px" id="isPeriodic" name="isPeriodic" onchange="isPeriodicCheck();">
                                      </div>
                                  </div>   
                                  
                                  <div class="row PeriodicSelectBox">
                                    <div class="col-lg-5 col-sm-4" style="margin-right: 10px;padding-left: 0px; margin-top: 5px;">
                                        <select class="form-control" id="periodicType" title="" onchange="replacePeriodicTypes();" style="pointer-events:none;display: none;">
                                           <option disabled selected>Select Period</option>
                                            <option value="Daily">Daily</option>
                                            <option value="Weekly">Weekly</option>
                                            <option value="Monthly">Monthly</option>
                                            <option value="nDays">nDays</option>
                                             <option value="EveryTwoHours">EveryTwoHours</option>
                                              <option value="Hourly">Hourly</option>
                                              <option value="Every30min">Every30min</option>
                                               <option value="Every45min">Every45min</option>
                                                <option value="Every15min">Every15min</option>
                                            
                                              
                                        </select>
                                   </div>
                                 
                                </div> 
                             
                             
                                <div class="row">
                                  <div class="form-group col-lg-5 col-sm-4 columnpadding bootstrap-timepicker" id="setExecutionTime" style="padding-left: 0px;margin-top: 10px; margin-right: 8px;display: none;">
                                         <input class="form-control timepicker excutionTimeBatchOperations" style="background-color: white;" id="excutionTime" size="20" type="text" placeholder="<spring:message code="batchOperations.batch_timings.execution_time.label"/>">
			                          </div>
			                          
			                           <%-- <div class="col-lg-5 col-sm-5" style="margin-top:10px;padding-left: 0px;padding-right: 0px;margin-bottom: 10px;display: none;">
                                     <label style="font-size: 13px;"><spring:message code="batchOperations.batch_timings.execution_time.description.label"/></label><!-- words -->
                                   </div> --%>
                                 
                                </div>
                                
                                
                                <div class="row weeklyExecution" id="weeklyExecution" style="margin: 10px 0px 0px 0px;display: none;">
                                 <div class="row">
                                
                                   <div class="col-lg-8 col-sm-7" id="setWeeklyExecution" style="margin-top:0px;padding-left: 0px;padding-right: 0px;">
                                        <input type="checkbox" checked value="Monday" id="mondayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Mon.label"/></label>  
                                          &nbsp;
                                        <input type="checkbox" checked value="Tuesday" id="tuesdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Tue.label"/></label>  
                                         &nbsp;
                                        <input type="checkbox" checked value="Wednesday" id="wednesdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Wed.label"/></label> 
                                         &nbsp;
                                        <input type="checkbox" checked value="Thursday" id="thursdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Thu.label"/></label> 
                                         &nbsp;
                                        <input type="checkbox" checked value="Friday" id="fridayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Fri.label"/></label> 
                                         &nbsp;
                                        <input type="checkbox" checked value="Saturday" id="saturdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sat.label"/></label> 
                                         &nbsp;
                                        <input type="checkbox" checked value="Sunday" id="sundayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sun.label"/></label> 
                                     
                                      </div>
                                      
                                       <div class="col-lg-4 col-sm-4" style="margin-top:px;padding-left: 0px;padding-right: 0px;">
                                        <%--  <label style="font-size: 13px"><spring:message code="batchOperations.batch_timings.week_days.description.label"/></label><!-- words --> --%>
                                       </div>
                            
                               </div>  
                               
                               <div class="row">
                                     <div class="form-group col-lg-5 col-sm-4 columnpadding bootstrap-timepicker" style="margin-top:10px;padding-left: 0px;">
                                         <input class="form-control timepicker sartTimeBatchOperations" style="background-color: white;" id="weeklysartTime" size="20" type="text" placeholder="<spring:message code="batchOperations.batch_timings.start_time.label"></spring:message>">
			                          </div>
                              </div>
                              
                           </div>
                              <div class="row">
                              <div class="form-group col-lg-5 col-sm-4 columnpadding" id="dateforMonthly" style="margin-top: 10px;padding-left: 0px;display: none;">
                                         <!-- <input class="form-control calendar_icon startDateBatchOperations" value="" style="background-color: white;" id="fromDateforMonthly" size="20" type="text" onfocus="callCalender('fromDateforMonthly')" onclick="callCalender('fromDateforMonthly')" placeholder='Select Month'> -->
			                          </div>
			                        </div>  
			                         
                              <div class="row">
                                     <div class="form-group col-lg-5 col-sm-4 columnpadding" id="nthDayExecution" style="margin-top: 10px;padding-left: 0px;display: none;">
                                         <input class="form-control nthDayBatchOperations" style="background-color: white;" id="nthDay" type="number" placeholder="<spring:message code="batchOperations.batch_timings.nthDay.label"></spring:message>">
			                          </div>
                              </div>
                             
                             </div>
                             
            	</div>
            	 <div class="row" style="padding: 10px;">
            	 <div class="col-lg-6 col-xs-4"></div>
            	<div class="col-lg-3 col-xs-4">
            	<input type="button" id="submit" class="btnCls" onclick="validateBatch('new');" value="<spring:message code="submit.label" />" />
					       </div>
					       <div class="col-lg-3 col-xs-4">
					        <input type="button" class="btnCls" onclick="viewBatchOperationsFlow('BatchOperations','0');" value="<spring:message code="cancel.label" />" />
						</div>
				</div>
            	
            	<div class="row">
            	
            	</div>		
           </div>
          
				
        </div><!-- box-body -->
        
      </div><!-- box-primary -->
    </div> 
   </div><!-- FirstRow -->
    
</section><!-- /.content -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
     
  });
        </script>
 
</body>
</html>