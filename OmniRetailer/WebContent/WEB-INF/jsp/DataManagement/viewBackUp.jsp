<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : RaviTeja.N
 * file name		        : DataManagement/viewBackUp.jsp
 * file type		        : JSP
 * description				: The BackUp form is displayed using this jsp
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
  
  <style type="text/css">
   </style>
   
    <script type="text/javascript">
$(document).ready(function(){

	callCalender('date');
	/* callCalender('absdate');
	callCalender('incdate'); */

});
</script> 
   
</head>
 <body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                               
                                <!-- form start -->
                                <form id="backUp" method="post">
                                    <div class="box-body" style="padding: 5px 3% 3% ">
                                   
 	                              	<div class="row">
 	                              	 <div class="col-lg-12" style="text-align: center;">
 	                              	<label style="font-size: 20px;text-decoration: underline; "><spring:message code="omniRetailer.backUp.label"/></label>
 	                              	</div>
 	                              	<br>
 	                              	<br>
 	                              	<br>
 	                              	<div id="Success" style="text-align: center;font-size: 16px;color:blue;">${Success}</div>
 	                              	 <div id="Error" style="text-align: center;color: red;font-size: 15px;font-weight: bold;">${Error}</div>
 	                            
 	                              	 
 	                              	 <div class="col-lg-4">
 	                               	<label style="font-size: 20px;padding-bottom: 10px;"><spring:message code="dataBase.backUpType.label"/></label>
 	                              	  
 	                              	   <div class="col-lg-12">
 	                              	   <div class="row">
 	                              	    <div class="col-lg-4 nopadding">
 	                              	 <input type="radio" name="backUpType" onclick="selectBackUpType('');" value="Absolute"  id="absolute" style="vertical-align: -2px">
 	                              	   <label style="font-size: 16px;"><spring:message code="absolute.label"></spring:message></label> 
 	                            	</div>
 	                            	<!-- <div class="col-lg-4 nopadding">
 	                            	 <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;white-space: nowrap;" id="absdate" size="20" type="text" onfocus="callCalender('absdate')" onclick="callCalender('absdate')" placeholder="Date" />
	                              	 </div> -->
	                              	 <div class="col-lg-4">
	                              	  <input type="button" class="btnCls" id="absolutebtn"  style="padding-bottom: 2%;" onclick="createBackUP('backup');" name="btn" value="Start" >
	                              	 </div>
 	                              	 </div>
 	                              	 </div>
 	                              	 
 	                              	 	<div  class="row">
 	                              	
 	                              	  </div><div  class="row">
 	                              	
 	                              	  </div>
 	                              	 
 	                              	    <div class="col-lg-12" style="padding-top: 6%;">
 	                              	 <div class="row">
 	                              	  <div class="col-lg-4 nopadding">
 	                              	 <input type="radio" name="backUpType" value="Incremental" id="Incremental" onclick="selectBackUpType('');"  style="vertical-align: -2px"> 
 	                              	  <label style="font-size: 16px;"><spring:message code="incremental.label"></spring:message></label>
 	                              </div>
 	                              <!--  <div class="col-lg-4 nopadding">
 	                                <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" id="incdate" size="20" type="text" onfocus="callCalender('incdate')" onclick="callCalender('incdate')" placeholder=" Date" />
 	                               </div> -->
 	                               <div class="col-lg-4">
 	                               <input type="button"  name="userId" class="btnCls" id="incrementalbtn" style="padding-bottom:2%;" value="Start" onclick="createBackUP('backup');" style="">
 	                              	
 	                              	</div>
 	                              	</div>
 	                              	</div>
 	                              	</div>
 	                              
 	                            
 	                              	
 	                              	  <div class="col-lg-4">
 	                                	<label style="font-size: 20px;padding-bottom: 10px;">BackUp Location</label>
                                      <div class="col-lg-12 nopadding" >
                                      <div class="col-lg-4 nopadding">
 	                              	<label style="font-size: 16px;"> FTP Server :</label>
 	                              	</div>
 	                              	<div class="col-lg-5 nopadding">
 	                              	  <input type="text" name="ftp" class="form-control" style="vertical-align: -2px;">
 	                              --	 </div>
 	                              	  </div> 
 	                              	  
 	                              	  
 	                              	  
 	                              	  
 	                              	  <div class="col-lg-12 nopadding"style=" margin-top: -4%;">
                                      <div class="col-lg-4 nopadding">
 	                              	<label style="font-size: 16px;"> User ID</label> 
 	                              	</div>
 	                              	<div class="col-lg-5 nopadding">
 	                              	  <input type="text" name="ftp" class="form-control" style="vertical-align: -2px;">
 	                              	 </div>
 	                              	  </div>
 	                              	
 	                              	  <div class="col-lg-12 nopadding"   style=" margin-top: 2%";>
                                      <div class="col-lg-4 nopadding">
 	                              	<label style="font-size: 16px;"> Password</label> 
 	                              	</div>
 	                              	<div class="col-lg-5 nopadding">
 	                              	  <input type="text" name="ftp" class="form-control" style="vertical-align: -2px;">
 	                              	 </div>
 	                              	  </div>
 	                              	   </div>
 	                      
 	                           <div class="col-lg-3">
  	                            <div class="col-lg-12" style="margin-top: 15px">
 	                              	 	<label style="font-size: 20px;padding-bottom: 10px;"><spring:message code="lastBackUp.date"/></label>
 	                              	</div>
 	                              	
 	                              	   <div class="col-lg-1"> </div>
 	                              	  <div class="col-lg-11" style="padding-bottom: 10px;font-size: 16px;">
 	                              	    <spring:message code="backUpDate.label"/>&nbsp&nbsp &nbsp&nbsp${backupresponse.lastBackupDate}
 	                              	  </div>
 	                           </div>
							                	 <div class="">
 	                              	   
 	                              	   <div class=" col-lg-12" style="margin-top: 15px;margin-left: 0%;">
 	                              	   <div class="col-lg-8" ></div>
 	                              	   <div class="col-lg-4">
 	                              	   <div class="col-lg-12">
 	                              	   <div class="col-lg-5 " style="padding-right: 0px;">
 	                              	  <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="Select Date" />
 	                              	     </div>
                                          <div class="col-lg-4 nopadding" style="">
 	                              	   
 	                       
				                                  	<select class="form-control" style="width:98%; margin-left:5%;padding: 2px 0px;" id="type">
				                                  	
				                                  	<option value="Absolute">Absolute</option>
				                                  	<option value="Incremental">Incremental</option>
				                                  	</select>
 	                              	      </div>
 	                              	      
 	                              	      <div class="col-lg-3 nopadding">
 	                              	    <input type="button" name="go" onclick="viewBackUP('backup','0')" class="btnCls" value="GO" style="padding-top: 0%; margin-left: 11%;">
 	                              	    </div>
 	                             </div></div>
 	                              	   </div>
 	                              	  
 	                              	  <div class=" col-lg-12" style="margin-top:5px">
 	                              	   <div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 <th><spring:message code="billing.sno.label" /></th>
                 	<th style="border-left: 4px solid #fff;"><spring:message code="counter_date.label" /></th>
                     <th style="border-left: 4px solid #fff;"><spring:message code="backupType.label" /></th>
                      <!-- <th style="border-left: 4px solid #fff;">Start Time</th>
                      <th style="border-left: 4px solid #fff;">End Time </th> -->
                      <th style="border-left: 4px solid #fff;"><spring:message code="backupType.fileName.label" /></th>
                 <th style="border-left: 4px solid #fff;">Size(KB's)</th>
                 <th style="border-left: 4px solid #fff;">Download Status</th>
                 <th style="border-left: 4px solid #fff;">Response Message</th>
                <th style="border-left: 4px solid #fff;">Backup Status</th>
                </tr>
               </thead>
 			<tbody style="text-align: center;">
 			    <c:forEach var="backupresponse" items="${backupresponse.backupAndrecovery}" varStatus="thecount">
 			    <tr>
 			    <td>${thecount.index+1}</td>
 			    <td>${backupresponse.backupDateStr}</td>
 			    <td>${backupresponse.backUpType}</td>
 			   <!--  <td>   </td>
 			    <td>   </td> -->
 			    <td>${backupresponse.fileName}</td>
 			    <td>${backupresponse.size}</td>
 			     
 			    <td>    </td>
 			    <td>${backupresponse.status}</td>
 			    <td>${backupresponse.status}</td>
 			    </tr>
 			    </c:forEach>
 			</tbody>
           </table>
           </div>
           </div>
           <br>
           <br>
           <br>
         	<div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewBackUP('backup','${totalValue}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBackUP('backup','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBackUP('backup','${index - 11}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewBackUP('backup','${totalValue}'); ">
              	</div> 
              	</c:if>
              </div>
           
             <%-- <div class="col-lg-12" style="text-align: center;">
						 <input type="button"  class=" btnCls" onclick="createBackUP('backup');" value="<spring:message code="start.label" />" />
						 <input type="button" class=" btnCls" style="margin-left:25%;" onclick="viewBackUP('backup','0');" value="<spring:message code="cancel.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class=" btnCls" style="margin-left:5%" onclick="viewBackUP('backup','0');" value="<spring:message code="cancel.label" />" />
					 </c:if>
						</div> --%>
						
 	</div>
 	  </div>
 	  </div>
 	  </form>
 	  </div>
 	  </div>
 	  </div>
 	  </section>
 	 
 	  <script>
 	 $(function() { 
 	  	// $("#example1").dataTable();
 	      $('#productsList').dataTable({
 	          "bPaginate": false,
 	          "scrollX": true,
 	          "bLengthChange": false,
 	          "bFilter": false,
 	          "bSort": false,
 	          "bInfo": false,
 	          "bAutoWidth": true
 	      });
 	  }); 
 	  
 	  
 	  
 	  </script>
 	  
 	  
 	  
 	  </body>
 	    <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
  
</html>
 
   