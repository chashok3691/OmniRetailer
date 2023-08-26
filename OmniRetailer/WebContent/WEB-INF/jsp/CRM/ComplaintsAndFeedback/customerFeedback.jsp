<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Soumya Vatte
 * file name		        : CRM/complaintsAndFeedback/customerFeedback.jsp
 * file type		        : JSP
 * description				: The CustomerFeedback form is displayed using this jsp
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/customerFeedback.js"></script>
        
     
<style type="text/css">
a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
}

</style>     
<script type="text/javascript">
$(document).ready(function(){
	
	 callCalender('startdate');
	 callCalender('enddate'); 


});
</script>  
</head>
<body>
<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"><spring:message code="customer.feedback.label" /></h3>
                                </div><!-- /.box-header -->
                                
				                 
                     <div class="box-body table-responsive" >
                    
                    
                    <div class="col-lg-11" style="background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                      <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Sales Channel</label>
                          <select class="form-control" name="FeedbackChannel" id="feedbackChannel">
                          <option value=""><spring:message code="ALL.label"/></option>
                                            <option value="Online" ${salesChannel == 'Online' ? 'selected' : ''}>Online</option>
                                            <option value="Phone" ${salesChannel == 'Phone' ? 'selected' : ''}>Phone</option>
                                            <option value="Sales Executive" ${salesChannel == 'Sales Executive' ? 'selected' : ''}>Sales Executive</option>
                                            <option value="Direct" ${salesChannel == 'Direct' ? 'selected' : ''}>Direct</option>
                                            </select>
                      </div>
                      </div>
                      
                    
                      
                     <div class="col-lg1-2 col-lg-3" >
                      
                      </div>
                       
                         <div class="col-lg1-2 col-lg-3">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="startdate" size="20" type="text" onfocus="callCalender('startdate')" onclick="callCalender('startdate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
                           		 <option value="" ${'' == selectedLocation ? 'selected' : ''}><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Feedback Category</label>
                             <select id="feedbackCategory" name="feedbackCategory" class="form-control" onchange="">
                             <option value=""><spring:message code="ALL.label"/></option>
	                 <option value="customer_rating" ${feedbackCategory == 'customer_rating' ? 'selected' : ''}  >Customer Rating</option>
	                 <option  value="outlet_rating" ${feedbackCategory == 'outlet_rating' ? 'selected' : ''} >Outlet Rating</option>
                     <option value="onlineExp_rating" ${feedbackCategory == 'onlineExp_rating' ? 'selected' : ''} >Online Experience Rating</option>
                     <option value="mobileShopping_rating" ${feedbackCategory == 'mobileShopping_rating' ? 'selected' : ''} >Mobile Shopping Rating</option>
                     <option value="staffBehaviour_rating" ${feedbackCategory == 'staffBehaviour_rating' ? 'selected' : ''} >Staff Behaviour Rating</option>
                     </select>
                      </div>
                      </div>
                       
                        <div class="col-lg1-2 col-lg-3" >
                       
                      </div>
                      
                      <div class="col-lg1-2 col-lg-3">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="enddate" size="20" type="text" onfocus="callCalender('enddate')" onclick="callCalender('enddate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  
                   <div class="col-lg-1" style=" background: #ccc;height:142px;width: 12%;">
                  <div class="row" style="margin-left: 5px;margin-right: 5px;">
                  <a onclick="viewCustomerFeedback('customerFeedback','0','');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row" style="margin-left: 5px;margin-right: 5px;" >
                  <a onclick="viewCustomerFeedback('customerFeedback','0','clear');" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
                    
                    
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    
                    <br>
					
		        
		        
	 <div class="row" style="margin-left: 0px; margin-right: 0px;">
                  
                   <div class=" col-lg-11 col-md-11 " style="    padding-left: 0px;">
                      <input type="text"  class="form-control searchItems" style="margin-top: 10px;  text-align: center;height:30PX;width: 1070px;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="${searchName}" id="searchCustomerFeedback" placeholder="<spring:message code="search.feedback.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchCustomerFeedback" style=""></ul>
				   				</div>
							</div>
							<span id="FeedbackError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							<input type="hidden" id="feedback" value="${searchName}">
	        	 	</div>
                           <c:if test="${sessionScope.role == 'super admin'}"> 
                                 
                            </c:if>
                             <c:forEach var="accessControl" items="${sessionScope.crm}">
    								<c:if test="${accessControl.appDocument == 'CustomerFeedback' && accessControl.write == true}"> 
	              
									 </c:if>
							 </c:forEach>
	    </div>
                                    <table id="example1" class="table table-bordered table-striped" style="width: 100%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	  <th><spring:message code="customer.feedback.sno" /></th>
                                                <th><spring:message code="feedback.location.label" /></th>
                                                  <th><spring:message code="customer.name.label" /></th>
                                                <th><spring:message code="customer.contact.number" /></th>
                                                <th><spring:message code="dateTimeStr.label" /></th>
                                                 <th><spring:message code="sales.channel" /></th>
                                                <th><spring:message code="feedback.avg.rating" /></th>
                                                <th><spring:message code="feedback.category.label" /></th>
                                                <%-- <th><spring:message code="feedback.rating.label" /></th> --%>
                                                <th><spring:message code="feedback.customer.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                    
                                        <c:forEach var="feedback" items="${feedbackDetails}">
                                            <tr>
                                                <td>${feedback.slNo}</td>
                                                <td>${feedback.storeLocation}</td>
                                                 <td>${feedback.customerName}</td>
                                                <td>${feedback.customer_mobileNo}</td>
                                                <td>${feedback.feedback_date}</td>
                                                <td>${feedback.feedbackChannel}</td>
                                                <%-- <td>${feedback.customer_rating}</td> --%>
                                                 <td>${feedback.summaryRating}</td>
                                                <td>${feedback.feedbackCategory}</td>
                                               <%--  <td>${feedback.outlet_rating}</td> --%>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editFeedback('${feedback.feedback_id}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                 <%-- <c:if test="${sessionScope.role == 'super admin'}"> 
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editFeedback('${feedback.feedback_id}','edit')">Edit</a>
                                                 </c:if>
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editFeedback('${feedback.feedback_id}','edit')">Edit</a> --%>
                                                
                                                </td>
                							</tr>
                                            </c:forEach>  
                                        </tbody>
                                    </table>
                           
       <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		     <input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		     <input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerFeedback('feedbackDetails','${totalValue}')">
              	    </div>
              	</c:if>
              	
             	<c:if test="${totalValue == totalRecords}">
              	<c:if test="${totalValue-maxRecords >0}">
              	     <div class="form-group col-lg-12" style="text-align: right;">
              		      <input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerFeedback('customerFeedback','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		  <input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerFeedback('customerFeedback','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		  <input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerFeedback('customerFeedback','${totalValue}')">
              	    </div> 
              	</c:if>
           </div>
           </div><!-- /.box-body -->
       </div><!-- /.box -->
</div>
</div>
</section><!-- /.content -->
	
       
         <input type="hidden" id="err" value="${err}" />
         
</body>
</html>