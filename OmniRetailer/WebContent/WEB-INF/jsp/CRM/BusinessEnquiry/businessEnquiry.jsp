<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/allstockreceipts.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
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
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/businessEnquiry.js"></script>
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

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
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 7px 5px 7px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	/* var err = $("#err").val();
	if(err != "") */
	 // alert(err);
	callCalender('from');
	callCalender('to');
  
$("#searchBusinessEnquiry").val($("#businessEnquirySearch").val());
$("#searchBusinessEnquiry").focus();
$('#searchBusinessEnquiry').on('input',function(e){
	if($(this).val().trim()==""){
		viewBusinessEnquiry('','0');
	}
});

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

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary" style="width:97%;margin-left:1.5%;">
    <div class="box-header" >
			<h3 class="box-title">
				<spring:message code="business.enquiry.label" />
			</h3>
	<input type="hidden" id="sd" value="${startDate}">
    <input type="hidden" id="ed" value="${endDate}">
	</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	<div class="row">
								        <div class="col-lg-3">
							               <div class="row">
							                <%--  <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
							                   <label><spring:message code="location.label"/></label>
							                 </div> --%>
							                 <div class="col-lg-11 col-xs-8 col-sm-10 col-md-10" >
							                  <label><spring:message code="location.label"/></label>
							                 <select class="form-control form-group" id="toLocation" onchange="searchBusinessEnquiry('','','0')">
	 				                           <option value=""><spring:message code="ALL.label"/></option>
	 				                             <c:forEach var="location" items="${workLocationsList}">
	 				                              <c:choose>
							                        <c:when test="${location.description == ''}">
							                          <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							                       </c:when>
							                        <c:otherwise>
							                          <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                        </c:otherwise>
							                      </c:choose>
<%-- 													<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option> --%>
												 </c:forEach>
	                                           </select>
							                 </div>
								        	</div>
								        </div>
								        <div class="col-lg-4"></div>
								        <div class="col-lg-2">
							              <div class="row">
							                	<%-- <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;">
							                 		<label><spring:message code="offer_start_date.label"/></label>
								                 </div> --%>
							                	 <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" >
							                	 <label><spring:message code="offer_start_date.label"/></label>
							                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
							                	 </div>
								              </div>
								            </div>
								            <div class="col-lg-2">
								               <div class="row">
								                <%--  <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;">
								                   <label><spring:message code="offer_end_date.label"/></label>
								                 </div> --%>
								                 <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" >
								                 <label><spring:message code="offer_end_date.label"/></label>
								                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
							                	  </div>
									           </div>
									          </div>
								           <div class="col-lg-1" style="padding-right: 17px;margin-top: 15px">
								                <input type="button" style="padding: 4px 8px;float:right;" class="btn bg-olive btn-inline" onclick="searchBusinessEnquiry('','','0')" value="<spring:message code="search" />" />
								           </div>
									      </div>
	      								<div class="row">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchBusinessEnquiry('','','0');">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	</select>
								           </div>
									        <div class="col-lg-10 col-xs-10" style="margin-top: 10px;">
								       	 		 <input type="text"  class="form-control searchItems" value="" id="searchBusinessEnquiry" placeholder="<spring:message code="search.business.enquiry.label" />" style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl searchBusinessEnquiry" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="businessEnquirySearch" value="${searchName}">
								       	 	</div>
									       <div class="col-lg-1" style="padding-left: 0px;    padding-right: 18px;">
											  <div class="buttons" style="margin-top: 10px;">
									        	<c:if test="${sessionScope.role == 'super admin'}">
									        		<a onclick="return newBusinessEnquiry();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
									      		</c:if>
										           <c:forEach var="accessControl" items="${sessionScope.crm}">
										                <c:if test="${accessControl.appDocument == 'BusinessEnquiry' && accessControl.write == true}"> 
														<a onclick="return newBusinessEnquiry();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
													</c:if>
												 </c:forEach>
										 	 </div>
								           </div>
								       </div>
                                    <table id="receipts" class="table table-bordered table-striped" style="margin-top:0%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="business.enquiry.id.label" /></th>
                                            	<th><spring:message code="business.enquiry.enquiry.date.label" /></th>
                                                <th><spring:message code="business.enquiry.first.name.label" /></th>
                                                <th><spring:message code="business.enquiry.last.name.label" /></th>
                                                <th><spring:message code="business.enquiry.phone.no.label" /></th>
                                                <th><spring:message code="business.enquiry.status.label" /></th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="businessEnquiry" items="${businessEnquiryList}" varStatus="theCount">
                                        	 <tr>
                                        	 	<td>${businessEnquiry.slNo}</td>
                                                <td>${businessEnquiry.enquiryId}</td>
                                            	<td>${businessEnquiry.enquiryDateStr}</td>
                                                <td>${businessEnquiry.fromFirstName}</td>
                                                <td>${businessEnquiry.fromLastName}</td>
                                                <td>${businessEnquiry.phoneNumber}</td>
                                                <td>${businessEnquiry.status}</td>
                                                <td>
                                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditBusinessEnquiry('${businessEnquiry.enquiryId}','view');"><spring:message code="view.label"/></a>
                                                 <c:if test="${sessionScope.role == 'super admin'}">
                                                 	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditBusinessEnquiry('${businessEnquiry.enquiryId}','edit');"><spring:message code="edit.label"/></a>
                                                 </c:if>
									           		<c:forEach var="accessControl" items="${sessionScope.crm}">
									                	<c:if test="${accessControl.appDocument == 'BusinessEnquiry' && accessControl.write == true}">
									                		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditBusinessEnquiry('${businessEnquiry.enquiryId}','edit');"><spring:message code="edit.label"/></a>
									                	</c:if>
									                </c:forEach>
                                                </td>
                                             </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
              <input type="hidden" id="flowUnder" value="${flowUnder}">  
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBusinessEnquiry('','${totalValue}')">
              	</div>									
              	</c:if>
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBusinessEnquiry('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBusinessEnquiry('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBusinessEnquiry('','${totalValue}')">
              	</div> 
              	</c:if>
              </div>                           
       </div><!-- /.box-body -->
   </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
                $("#receipts").dataTable({
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
</body>
</html>