<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : inventorymanager/log/viewApplicationLog.jsp
 * file type		        : JSP
 * description				: The viewApplicationLog form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/systemLog/applicationLog.js"></script>
        
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
    
  }

}

.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 7%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

.form-control {
    height: 30px;
}
table.dataTable {
    width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
}

/* 
.table-bordered>.fixed-column {
    position: fixed;
    display: inline-block;
    width: auto;
    border-right: 1px solid #ddd;
}
@media(min-width:768px) {
    .table-bordered>.fixed-column {
        display: none;
    }
}
 */
</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
var err = $("#err").val();
if(err != "")
  //alert(err);
$("#searchLog").val($("#logSearch").val());
	$("#searchLog").focus();
	

	
	
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);

	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]);
	
});
</script>
</head>
<body>


 <!-- Content Header (Page header) -->
	<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
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
 
					
     <div class="box-header">
			<h3 class="box-title" style="margin-left: 45%;" >
				<spring:message code="export.log.label" />
			</h3>
			
			
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      <div class="row">
	       <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
             	<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
	      <%-- <div class="col-lg-1" >
						                <div class="row">
						                  <div class="col-lg-6" style="text-align:right;top:5px;">
						                    <label><spring:message code="max.records.label"/></label>
						                  </div>
						                  <div class="col-lg-6">
						                    <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="">
					                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
					                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
					                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
					                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
					                      	</select>
						                  <!-- </div>
						               </div> -->
						               </div> --%>
	        <%-- <div class="col-lg-4">
	          <div class="row">
	           <div class="col-lg-2" style="text-align:center;top:5px;    margin-left: 8%;">
	             <label><spring:message code="location.label"/></label>
	           </div>
	           <div class="col-lg-10" style="margin-left: -8%;">
	             <select class="form-control" id="outletLocation" onchange="">
	             <option value="">-- Select --</option>
	                <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
	           </div>
	        </div>
	        </div> --%>
	        <div class="row">
	        <div class="col-lg-3" >
	         <%-- <div class="col-lg-2" style="text-align:center;top:5px;    margin-left: 8%;">
	             <label><spring:message code="location.label"/></label>
	           </div> --%>
	           <div class="col-lg-8 col-sm-8 col-xs-8">
	            <label><spring:message code="location.label"/></label>
	             <select class="form-control" id="outletLocation" >
	             <option value="">ALL</option>
	                <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
	           </div>
	        </div>
	        <div class="col-lg-5" ></div>
	        <div class="col-lg-3" >
						                <div class="row">
						                   <input type="hidden" id="sd" value="${startDate}">
				                      <input type="hidden" id="ed" value="${endDate}">
						                <%--   <div class="col-lg-4" style="text-align:right;top:5px;margin-left:14%;">
						                    <label><spring:message code="offer_start_date.label"/></label>
						                  </div> --%>
						                  <div class="col-lg-6 col-sm-6 col-xs-12" style="padding-right: 7px;" >
						                   <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control calendar_icon" readonly="readonly" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="From Date" />
						                  </div>
						                   <div class="col-lg-6 col-sm-6 col-xs-12" style="padding-left: 7px;">
						                  <label><spring:message code="offer_end_date.label"/></label>
						                    <input class="form-control calendar_icon" readonly="readonly" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
						                  </div>
						               </div>
						               </div>
						             
	                                     <div class="form-group col-lg-1" style="padding-left: 0px; ">
	                                         <input type="button" style="width:85%;padding: 4px 8px;margin-top:18px;" class="btn bg-olive btn-inline" onclick="viewExportLog('exportLog','0')" value="<spring:message code="search" />" />
	                                     </div>
	        		</div>
	        		<div class="col-lg-1" style="margin-top: 1.5%;">
						                <%-- <div class="row">
						                  <div class="col-lg-6" style="text-align:right;top:5px;">
						                    <label><spring:message code="max.records.label"/></label>
						                  </div>
						                  <div class="col-lg-6"> --%>
						                    <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewExportLog('exportLog','0');">
					                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
					                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
					                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
					                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
					                      	</select>
						                  <!-- </div>
						               </div> -->
						               </div>
       					<div class="col-lg-10" style="margin-top: 1.5%;">
		        	 		 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchLog" placeholder="<spring:message code="search.log.label" />"style="" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl exportLog" style=""></ul>
					   				</div>
								</div>
								<input type="hidden" id="logSearch" value="${searchName}">
		        	 	</div>
		        	 	
		        	 	<div class="col-lg-1" style="margin-top: 1.5%;">
		        	 	
		        	 	 <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="font-size: 16px;" value="<spring:message code="save.label" />" />
		        	 	</div>
		        	 	
		        	 	
	        <%-- <c:if test="${type == 'management' }">
	        <div class="col-lg-9">
       	 		 <input type="text"  class="form-control searchItems"  value="" id="searchStores" placeholder="<spring:message code="search.orders.label" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchOrders" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="ordersSearch" value="${searchName}">
       	 	</div>
	        <div class="col-lg-3">
	        	<c:if test="${sessionScope.role == 'super admin'}">
	      	<div class="row">
				<div class="buttons" style="margin-bottom: 0px;margin-top:4%;"> 
					<a onclick="return viewNewOrder();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp; 
					<a onclick="return viewOrders('draft','','0','management');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a>&nbsp;&nbsp;&nbsp;
					<a onclick="return viewOrders('all','','0','management');" class="button"><font size="2px"><spring:message code="all.orders.label" /></font></a>
				</div>
			</div> 
	      </c:if>
           <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                <c:if test="${accessControl.appDocument == 'CustomerOrders' && accessControl.write == true}"> 
                    <div class="row">
						<div class="buttons" style="margin-bottom: 0px;margin-top:4%;"> 
							<a onclick="return viewNewOrder();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp; 
							<a onclick="return viewOrders('draft','','0','management');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a>&nbsp;&nbsp;&nbsp;
							<a onclick="return viewOrders('all','','0','management');" class="button"><font size="2px"><spring:message code="all.orders.label" /></font></a>
						</div>
				</div> 
			</c:if>
		 </c:forEach>
	        </div>
	        </c:if> --%>
	      </div>
	      <div>
	       <input type="hidden" id="applicationdownloadurl" value="${downloadurl}">
         <table id="productstocks" class="condensed table table-bordered table-striped fixed-column" style="margin-top:0%;text-align:center;">
          <thead style="background-color: #3c8dbc; color: #ffffff;">
                 <tr>
                 	 <th><div  style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                 	 <th><div  style="width:120px;"><spring:message code="userName.label" /></div></th>
                     <th><spring:message code="role.label" /></th>
                     <th><div style="width:230px;text-align:center;"><spring:message code="login.id.label" /></div></th>
                 	 <th><div style="width:196px;"><spring:message code="app.name.label" /></div></th>
                     <th><div style="width:160px;"><spring:message code="location.label" /></div></th>
                     <th><div style="width:83px;"><spring:message code="txn.name.label" /></div></th>
                     <th><div style="width:55px;"><spring:message code="txn.date.label" /></div></th>
                     <th><div style="width:58px;"><spring:message code="txn.time.label" /></div></th>
                 	 <th><div style="width:200px;"><spring:message code="txn.status.label" /></div></th>
                     <th><spring:message code="model.label" /></th>
                     <th><div style="width:62px;"><spring:message code="counter_deviceId.label" /></div></th>
                     <th><div style="width:65px;"><spring:message code="ip.address.label" /></div></th>
                     <th><div style="width:150px;"><spring:message code="request.channel.label" /></div></th>
                     <th><spring:message code="comments.label" /></th>
                 </tr>
             </thead>
             <tbody style="text-align: center;">
                <c:forEach var="log" items="${logList}">
             	 <tr>
             	 	 <td>${log.slNo}</td>
             	 	 <td>${log.userName}</td>
             	 	 <td>${log.role}</td>
             	 	 <td>${log.loginId}</td>
             	 	 <td>${log.appName}</td>
             	 	 <td>${log.location}</td>
             	 	 <td>${log.txnName}</td>
             	 	 <td>${log.txnDate}</td>
             	 	 <td>${log.txnTime}</td>
             	 	 <td>${log.txnStatus}</td>
             	 	 <td>${log.module}</td>
             	 	 <td>${log.deviceId}</td>
             	 	 <td>${log.ipAddress}</td>
             	 	 <td>${log.requestChannel}</td>
             	 	 <td>${log.comments}</td>
                 	 
                   <%-- <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('','orders');"><spring:message code="view.label"/></a></td> --%>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>
          	<%-- <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrders('${status}','','${totalValue}','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrders('${status}','','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrders('${status}','','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrders('${status}','','${totalValue}','')">
              	</div> 
              	</c:if>
              </div>  --%>   
              
              
                       <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="margin-left: 45%;margin-top: 0%; border-radius: 0;">
        <div class="modal-header">
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px"><spring:message code="savePopUp.label" />
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" id="appLog" onclick="validateApplicationLog('exportLog','0','save');"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div>
</div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
        </div>
      </div>
		</div>
		</div>
              
              
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewExportLog('exportLog','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewExportLog('exportLog','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewExportLog('exportLog','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewExportLog('exportLog','${totalValue}')">
              	</div> 
              	</c:if>
              </div> 
             </div><!-- /.box-body -->
         </div><!-- /.box -->
</div>
</div>
</section>
		 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
                 });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
</body>
</html>