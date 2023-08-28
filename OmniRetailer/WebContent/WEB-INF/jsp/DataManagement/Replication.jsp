<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : jsp/replication.jsp
 * file type		        : JSP
 * description				: The Replication form is displayed using this jsp
 * 
  */ -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Export Data | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- DATA TABLES -->
<%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/replication.js"></script>


<style type="text/css">
.form-group {
	margin-bottom: 5px;
}

.columnpadding {
	padding-left: 0px;
	padding-right: 5px;
}

.marginpaddingpopup {
	padding-left: 5px;
	padding-right: 5px;
	padding-bottom: 5px;
}

@media ( max-width : 1100px) {
	.columnpadding {
		padding-left: 15px;
		padding-right: 15px;
	}
	.menuallignment {
		margin-left: 5px !important;
		width: 50% !important;
	}
	.rowallignment {
		padding-left: 15px;
		padding-right: 15cm;
		height: auto !important;
	}
	.columnallignment {
		padding-left: 15px;
		padding-right: 15px;
		height: auto !important;
	}
	.exportdate {
		width: auto !important;
	}
	.enddate {
		width: auto !important;
	}
	.menuwidth {
		width: auto !important;
	}
}

.browsebutton {
	border-radius: 0px;
	height: 28px;
	padding: 0px 3px;
	font-size: 13px;
	width: 2cm;
}

.fileUpload {
	position: absolute;
	overflow: hidden;
	/*  margin: 10px; */
}

.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.btn-primar {
	font-weight: bold;
	color: black;
	background-color: rgb(195, 195, 195);
	border-color: black;
}

.rowallignment {
	padding-left: 2.8cm;
	padding-right: 0cm;
	height: 1cm;
}

.popupclass {
	position: relative;
	z-index: 999999999999999;
	background: #eee;
	border: 1px solid #d2d6de;
	float: right;
	width: 6.2cm;
	padding-top: 0.2cm;
	margin-right: 0.15cm;
}

.inputboxsize {
	height: 20px !important;
}

.menuallignment {
	/*  width: 55%; */
	margin-left: -5%;
}

.displaynone {
	display: none;
}

.exportdate {
	width: 38%;
}

.enddate {
	width: 28%;
}

.columnallignment {
	padding-left: 7px;
	padding-right: 0px;
	height: 1cm;
}

.menuwidth {
	width: 37.1%;
}

.exporthistory {
	height: 0.8cm;
	float: right;
	border-radius: 0px;
	width: 100%;
	/* padding-bottom: 11px; */
	margin-bottom: 5px;
	padding: 3px 5px;
}

@media ( min-width :1240px) and (max-width:1440px) {
	.daily {
		width: 20%;
	}
	.fortnight {
		width: 30%;
	}
}

.btn-primar {
	font-weight: bold;
	color: black;
	background-color: rgb(195, 195, 195);
	border-color: black;
}

.reset-button {
	margin-right: 0%;
	margin-top: 5px;
	width: 100%;
	padding: 3px;
	position: relative;
	float: right;
}

.start-button {
	margin-left: 0%;
	margin-right: 22%;
	margin-top: 5px;
	width: 100%;
	padding: 3px;
	position: relative;
	float: right;
}
</style>
</head>
<body>
	

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header" style="text-align: center;">
						<h3 class="box-title" style="padding :6px;  border:1px solid  #808080;" >
						<label style="font-family: Calibri;">Replication</label>
							
						</h3>
					</div>

					<div class="box-body" >

						<div id="Error"
							style="text-align: center; color: red; font-weight: bold;"></div>

						<br>
						
						
						<div class="row" style="margin-bottom:50px"	>
			<div class="col-lg-12">
			<div class="col-lg-4">
			<div class=" col-lg-12" >
						<h3 class="box-title" style="padding :2px;  border:1px solid  #808080;background:#ccc" >
							<label style="font-family: Calibri;font-size: 20px;">Replication</label>
						</h3>
					</div>
					
					<div class=" col-lg-11" style="padding-left: 40px;">
					<label style="font-family: Calibri;color: gray;">Source Server(IP Address)<span style="color:red; font-size:2"></span></label>
	                <input class="form-control " value=""  name="sourceserver" id="sourceserver" size="20" type="text"  />
	                <span id="sourceserverError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
					</div>
					<div class=" col-lg-10" style="padding-left: 40px;" >
					<label style="font-family: Calibri;color: gray;">Customer ID<span style="color:red; font-size:2"></span></label>
	                <input class="form-control " value=""  name="customerid" id="customerid" size="20" type="text"  />
	                <span id="customeridError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
					</div>
					<div class=" col-lg-10" style="padding-left: 40px;">
					<label style="font-family: Calibri;color: gray;">User ID(Who has Permissions)<span style="color:red; font-size:2"></span></label>
	                <input class="form-control " value=""  name="userid" id="userid" size="20" type="text"   />
	                <span id="useridError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
					</div>
					<div class=" col-lg-10" style="padding-left: 40px;">
					<label style="font-family: Calibri;color: gray;">Password<span style="color:red; font-size:2"></span></label>
	                <input class="form-control " value=""  name="password" id="password" size="20" type="text"   />
	                <span id="passwordError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
					</div>
					<div class=" col-lg-9" style="padding-left: 40px;">
					<label style="font-family: Calibri;color: gray;">Status<span style="color:red; font-size:2"></span></label>
	                 <select class="form-control" name=status id="status" >
                                            <option value="">Enabled</option>
                                            <option value="">Disabled</option>
                                            
                                            </select>
	                <span id="statusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
					</div>
				
					
			
			
			</div>
					
			
			<div class="col-lg-4">
			
			<div class=" col-lg-12" >
						<h3 class="box-title" style="padding :2px;  border:1px solid  #808080;background:#ccc" >
							<label style="font-family: Calibri;font-size: 20px;">Replication Entities</label>
						</h3>
					</div>
					
					<div class=" col-lg-12" style="padding-left: 40px;" >
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="productmasterdata" name="productmasterdata">&nbsp;&nbsp;&nbsp; Product Master Data
						
					</div>
					<div class=" col-lg-12" style="padding-left: 40px;" >
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="promotions" name="promotions">&nbsp;&nbsp;&nbsp; Promotions
						
					</div>
					<div class=" col-lg-12" style="padding-left: 40px;">
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="billings" name="billings">&nbsp;&nbsp;&nbsp; Billings
						
					</div>
					<div class=" col-lg-12" style="padding-left: 40px;">
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="imstore" name="imstore">&nbsp;&nbsp;&nbsp; Inventory Management-Store
						
					</div>
					<div class=" col-lg-12"  style="padding-left: 40px;">
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="imwarehouse" name="imwarehouse">&nbsp;&nbsp;&nbsp;Inventory Management-Warehouse
						
					</div>
					<div class=" col-lg-12" style="padding-left: 40px;">
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="omnichannnel" name="omnichannnel">&nbsp;&nbsp;&nbsp; Omni Channel Management
						
					</div>
					<div class=" col-lg-12" style="padding-left: 40px;">
	                 <input type="checkbox" style="width: 25px;height: 17px;vertical-align: -3px;" id="customerRelation" name="customerRelation">&nbsp;&nbsp;&nbsp; Customer Relationship
						
					</div>
						
			</div>
			
			<div class="col-lg-4">
			
			<div class=" col-lg-12" >
						<h3 class="box-title" style="padding :2px;  border:1px solid  #808080;background:#ccc" >
							<label style="font-family: Calibri;font-size: 20px;">Replication Schedule</label>
						</h3>
					</div>
					<div class=" col-lg-12" >
					<div class=" row" >
					<div class=" col-lg-12" style="padding-left: 28px;padding-right: 50px;" >
					<label style="font-family: Calibri;color: gray;">Schedule</label>
					
					
	                 <select class="form-control" name=status id="status" >
                                            <option value="">Daily</option>
                                            <option value="">Weekly</option>
                                             <option value="">Bi Weekly</option>
                                            <option value="">Monthly</option>
                                            
                                            </select>
	                <span id="statusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
					</div>
					<br>
						<br>
							<br>
					<div class=" col-lg-12" style="padding-left:44px">
					  <div class="row">
                                 
                                  <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;margin-top: 10px; margin-right: 8px ">
                                
                                         <input class="form-control calendar_icon excutionTimeBatchOperations" readonly="readonly" value="" style="background-color: white;" id="excutionTime" size="20" type="text" onfocus="callCalender('excutionTime')" onclick="callCalender('excutionTime')" placeholder="<spring:message code="batchOperations.batch_timings.execution_time.label"/>">
					                     
			                     
			                          </div>
			                          
			                          
                                 
                                 
                                </div>
                                
                                
                                
                                 <div class="row">
                                
                                
                                   <div class="col-lg-12 col-sm-12" style="margin-top:0px;padding-left: 0px;padding-right: 0px;">
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Mon.label"/></label>  
                                     
                                          &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Tue.label"/></label>  
                                        
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Wed.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Thu.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Fri.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sat.label"/></label> 
                                        
                                        
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px" id="days" name="days">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sun.label"/></label> 
                                     
                                      </div>
                                      
                                      
                                      
                            
                            
                               </div>  
                               
                               <div class="row">
                                     <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;">
                                
                                         <input class="form-control calendar_icon sartTimeBatchOperations" readonly="readonly" value="" style="background-color: white;" id="sartTime" size="20" type="text" onfocus="callCalender('sartTime')" onclick="callCalender('sartTime')" placeholder="<spring:message code="batchOperations.batch_timings.start_time.label"></spring:message>">
					                     
			                     
			                          </div>
                              </div>
                              
                              
                              <div class="row">
                                     <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;">
                                
                                         <input class="form-control calendar_icon nthDayBatchOperations" readonly="readonly" value="" style="background-color: white;" id="nthDay" size="20" type="text" onfocus="callCalender('nthDay')" onclick="callCalender('nthDay')" placeholder="<spring:message code="batchOperations.batch_timings.nthDay.label"></spring:message>">
					                     
			                     
			                          </div>
                              </div>
	
</div>
</div>
					
						
					</div>
				</div>
			</div>
			<!-- /.box -->

		</div>
		
		
		
		
		<input type="button" class="btn bg-olive btn-inline" style="width: 100px;
    margin-right: 10%;
    margin-left: 33%;"  value="Submit" />
	                      
	                     
	                      
			 					<input type="button" class="btn bg-olive btn-inline" style="margin-left: 5%;
    width: 100px;"  value="<spring:message code="cancel.label" />" />
		
		
		
		</div>
		
		
		
		</div>
		
		</div>
		</div>
	
	</section>
	<!-- /.content -->
</body>
</html>