<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : RaviTeja.N
 * file name		        : jsp/bachOperations.jsp
 * file type		        : JSP
 * description				: display Batch Operations information
 * */ -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Batch Operations | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
		
        <!-- DATA TABLES -->
        <script type="text/javascript">
        </script>
</head>
<body>
<!-- Main content -->
  <section class="content">
  
   <div class="row">
  
         <div class="col-xs-12">
        
           <div class="box box-primary">
   
           <br>
    
                 <div class="box-body">
                 
                        <div class="row" style="margin-left: 5%;margin-right: 5%">
                        
                        
                           
                           <div class="row">
                               <!--   <div class="col-sm-1 col-lg-1"></div>  -->
                                 
                                 <div class="col-sm-5 col-lg-5" style=" padding-left: 0px;padding-right: 0px;">
                              
                                      <input type="text" class="form-control" id="batchName"  placeholder='<spring:message code="batchOperations.batch_name.placeholder"></spring:message> 'style=" width: 100%" >
                                
                                 </div>
                                 
                             </div>    
                                 
                             
                             
                              <div class="row">
                              
                                   <!-- <div class="col-sm-1 col-lg-1"></div>  --> 
                                  
                                 <div class="col-lg-12 col-sm-12 col-lg-12" style="padding-left: 0px;padding-right: 0px;margin-top: 10px;">
                             
                                    <textarea class="form-control" id="batchDescription"  placeholder='<spring:message code="batchOperations.batch_description.placeholder"></spring:message>'></textarea>
                                   
                                 </div>
                              
                               </div>
                             
                             
                             
                            <div class="row" >
                            
                             <div class="col-lg-6 col-sm-12">
                             
                               <div class="row">
                               
                              <!--     <div class="col-sm-1 col-lg-1"></div>  -->
                                 
                                   <div class="col-lg-10 col-sm-10" style="margin-top:30px;padding-left: 0px;padding-right: 0px;border-bottom: 1px solid #d2d6de;margin-bottom: 10px;">
                              
                                     <label style="font-size: 16px;"><spring:message code="batchOperations.batch_operations.label"/></label>
                                    
                                   </div>
                                 
                                 
                                </div> 
                               
                                  
                                
                                <div class="row">
                                
                                   <!--  <div class="col-sm-1 col-lg-1"></div> -->
                                   
                                    <div class="col-lg-8 col-sm-8 col-xs-10" style="margin-right: 10px;padding-right: 0px;padding-left: 0px;">
                             
                                        <select class="form-control" id="" title="">
                                     
                                           <option selected="selected"><spring:message code="batchOperations.batch_operations.main_operation.placeholder"/></option>
                                            <option>XXX</option>
                                            <option>YYY</option>
                                            <option>ZZZ</option>
                                   
                                        </select>
                              
                                   </div>
                                                     
                                 <div class="col-lg-2 col-sm-1"> </div>    
                                      <a href="#">
                                   <h2 style=" /* margin-bottom: 0px; */"><i class="fa fa-plus-circle" aria-hidden="true"></i></h2>
                                      </a>
                                 </div>
                                 
                                 <div class="row">
                                
                                   <!--  <div class="col-sm-1 col-lg-1"></div> -->
                                   
                                    <div class="col-lg-8 col-sm-8 col-xs-10" style="margin-right: 10px;margin-top: -20px;padding-left: 0px;padding-right:0px">
                             
                                        <select class="form-control" id="" title="">
                                     
                                           <option selected="selected"><spring:message code="batchOperations.batch_operations.sub_operation.placeholder"/></option>
                                            <option>xxx</option>
                                            <option>yyy</option>
                                            <option>zzz</option>
                                   
                                        </select>
                              
                                   </div>
                             
                             
                                 </div>
                                 
                                 <div class="row">
                                 
                                      <div class="col-lg-8 col-sm-8"  style="margin-right: 10px;padding-right: 0px;padding-left: 0px; margin-top: 10px;">
                                         
                                          <textarea id="" rows="8" cols="" style="width: 100%"></textarea>
                                      
                                      </div>
                              
                                      
                                 </div>
                                 
                              </div>   
                              
                            <div class="col-lg-6 col-sm-12">
                            
                                 <div class="row">
                               
                                  <!--     <div class="col-sm-1 col-lg-1"></div>  -->
                                 
                                   <div class="col-lg-10 col-sm-10" style="margin-top:30px;padding-left: 0px;padding-right: 0px;border-bottom: 1px solid #d2d6de;margin-bottom: 10px;">
                              
                                     <label style="font-size: 16px;"><spring:message code="batchOperations.batch_timings.label"/></label>
                                    
                                   </div>
                                 
                                 
                                </div> 
                                
                                
                                
                                
                                <div class="row">
                                
                                     <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;">
                                
                                         <input class="form-control calendar_icon startDateBatchOperations" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder='<spring:message code="batchOperations.batch_timings.start_date.label"></spring:message>'>
					                     
			                     
			                          </div>
			                     	
			                     	 <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;">
                                
                                         <input class="form-control calendar_icon satrtTimeBatchOperations" readonly="readonly" value="" style="background-color: white;" id="start_time" size="20" type="text" onfocus="callCalender('start_time')" onclick="callCalender('start_time')" placeholder="<spring:message code="batchOperations.batch_timings.start_time.label"></spring:message>">
					                     
			                     
			                          </div>
			                     	
                                
                                </div>
                                
                                
                                  <div class="row">
                               
                                  <!--     <div class="col-sm-1 col-lg-1"></div>  -->
                                 
                                   <div class="col-lg-10 col-sm-8" style="margin-top:5px;padding-left: 0px;padding-right: 0px;">
                              
                                                                  
                               
                                       <label style="font-size: 16px;"><spring:message code="batchOperations.batch_timings.batch_periodic.label"/></label>&nbsp;
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                     
                                      </div>
                                      
                                      
                                      
                        
                                 
                                  </div>   
                                  
                                  
                                  <div class="row">
                                
                                   <!--  <div class="col-sm-1 col-lg-1"></div> -->
                                   
                                    <div class="col-lg-5 col-sm-4" style="margin-right: 10px;padding-left: 0px; margin-top: 5px;">
                             
                                        <select class="form-control" id="" title="">
                                     
                                           <option selected="selected"><spring:message code="batchOperations.batch_timings.select_period.label"/></option>
                                            <option>xxx</option>
                                            <option>yyy</option>
                                            <option>zzz</option>
                                   
                                        </select>
                              
                                   </div>
                                  
                               
                                  <!--     <div class="col-sm-1 col-lg-1"></div>  -->
                                 
                                   <div class="col-lg-5 col-sm-5" style="margin-top:5px;padding-left: 0px;padding-right: 0px;margin-bottom: 10px;">
                              
                                     <label style="font-size: 13px;"><spring:message code="batchOperations.batch_timings.select_period.description.label"/></label>
                                    
                                   </div>
                                 
                                 
                                </div> 
                             
                             
                                 
                                 
                                 
                                <div class="row">
                                 
                                  <div class="form-group col-lg-5 col-sm-4 columnpadding" style="padding-left: 0px;margin-top: 10px; margin-right: 8px ">
                                
                                         <input class="form-control calendar_icon excutionTimeBatchOperations" readonly="readonly" value="" style="background-color: white;" id="excutionTime" size="20" type="text" onfocus="callCalender('excutionTime')" onclick="callCalender('excutionTime')" placeholder="<spring:message code="batchOperations.batch_timings.execution_time.label"/>">
					                     
			                     
			                          </div>
			                          
			                           <div class="col-lg-5 col-sm-5" style="margin-top:10px;padding-left: 0px;padding-right: 0px;margin-bottom: 10px;">
                              
                                     <label style="font-size: 13px;"><spring:message code="batchOperations.batch_timings.execution_time.description.label"/></label>
                                    
                                   </div>
                                 
                                 
                                </div>
                                
                                
                                
                                 <div class="row">
                                
                                
                                   <div class="col-lg-8 col-sm-7" style="margin-top:0px;padding-left: 0px;padding-right: 0px;">
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Mon.label"/></label>  
                                     
                                          &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Tue.label"/></label>  
                                        
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Wed.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Thu.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Fri.label"/></label> 
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sat.label"/></label> 
                                        
                                        
                                         &nbsp;
                      
                                       
                                        <input type="checkbox" style="vertical-align: -2px">
                                        
                                        <label style="font-size: 12px;"><spring:message code="batchOperations.batch_timings.week_days.Sun.label"/></label> 
                                     
                                      </div>
                                      
                                      
                                       <div class="col-lg-4 col-sm-4" style="margin-top:px;padding-left: 0px;padding-right: 0px;">
                                       
                                         <label style="font-size: 13px"><spring:message code="batchOperations.batch_timings.week_days.description.label"/></label>
                                       
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
      
    </div> 
    
     
    
  </section>
 
</body>
</html>