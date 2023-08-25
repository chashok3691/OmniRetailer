<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/WarrantsAndFeedback/CustomerWarrants.jsp
 * file type		        : JSP
 * description				: The CustomerWarrants form is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/customerWarranty.js"></script>
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

   .table.table-bordered.table-striped {
         width: 100%; 
        
         margin-bottom: 15px;
       
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
	 callCalender('From');
	 callCalender('To'); 
	 
	var err = $("#err").val();
if(err != "")
alert(err);
/* callCalender('warrantFrom');
callCalender('warrantTo'); */

$("#searchWarrant").val($("#warrants").val());
	$("#searchWarrant").focus();
	$('#searchWarrant').on('input',function(e){
		if($(this).val().trim()==""){
			
			viewCustomerWarrants('searchWarrant','0');
		}
	});
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#From").val(s[0]);
	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#To").val(e[0]);


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
  <h3 class="box-title"><spring:message code="customer.warrants.label" /></h3>
   </div><!-- /.box-header -->
              		<div class="box-body table-responsive">
                    <div class="row" style="margin-left:1%;margin-right:0.5%; border-radius:0px;box-shadow:none; border: 1px solid #ccc;">
					 <!-- <div class="box" style="border-radius:0px;box-shadow:none; height: 93px; border: 1px solid #ccc; "> --> 
                    
                    <div class="row">
                    <div class=" col-lg-4 col-md-4 ">
                    <div class="col-lg-5 col-md-6 " style="text-align:right;top:13px;padding-right: 5px; text-align:right;padding-left:0px;  ">
                 		<label><spring:message code="warrant_product_category.label"/></label>
	                 </div>
                	<div class="col-lg-7 col-md-6 " style="margin-top: 10px;padding-left: 0px;">
	                <select class="form-control" id="product" onchange="searchWarrant('','','0')">
                           	<option value="">Select</option>
	                       <c:forEach var="category" items="${categoryList}">
								<option value="${category.categoryName}" ${category.categoryName == product ? 'selected' : ''}>${category.categoryDescription}</option>
						   </c:forEach>
					</select>
	           		 </div>
	            	</div>
	           		
	           		<div class=" col-lg-1 col-md-1 "></div>
	           		<div class=" col-lg-4 col-md-4 ">
               		<div class="col-lg-6 col-md-6 " style="text-align:right;top:13px;padding-right: 5px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
	                 </div>
                	 <div class="col-lg-6  col-md-6 " style="padding-left: 0px;top:7px">
                	 	 <input class="form-control calendar_icon form-group" readonly="readonly" value="${startDate}" style="background-color: white;" id="From" size="20" type="text" onfocus="callCalender('From')" onclick="callCalender('From')" placeholder="DD/MM/YYYY" />
                	 	<!-- <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="warrantFrom" size="20" type="text" onfocus="callCalender('warrantFrom')" onclick="callCalender('warrantFrom')" placeholder="DD/MM/YYYY" onchange="searchWarrant('','','0')"/> -->
                	 </div>
                		<input type="hidden" id="sd" value="${startDate}"> 
	              	 </div>
	            
	            	 <div class=" col-lg-3 col-md-3 ">
	               
	                 <div class="col-lg-4 col-md-4 "  style="text-align:right;top:13px;padding-right: 5px; padding-left:0px">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 </div>
	                 <div class="col-lg-8 col-md-8 " style="padding-left: 0px;top:7px">
	                 	 <input class="form-control calendar_icon form-group" readonly="readonly" value="${endDate}" style="background-color: white;" id="To" size="20" type="text" onfocus="callCalender('To')" onclick="callCalender('To')" placeholder="DD/MM/YYYY" />
	                 	<!-- <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="warrantTo" size="20" type="text" onfocus="callCalender('warrantTo')" onclick="callCalender('warrantTo')" placeholder="DD/MM/YYYY" onchange="searchWarrant('','','0') "/> -->
                	  </div>
                		<input type="hidden" id="ed" value="${endDate}">
		           	  </div>
		          		</div>
                  
               		<div class="row">
               		<div class=" col-lg-5 col-md-5 "></div>
               		<div class=" col-lg-4 col-md-4 ">
               		<div class="col-lg-6  col-md-6 " style="text-align:right;top:5px;padding-right: 5px; ">
                 	<label><spring:message code="warrant_status.label"/></label>
	                 </div>
                	 <div class="col-lg-6  col-md-6 " style="padding-left: 0px; text-align:right">
                	 	<select class="form-control" name="dealStatus" id="dealStatus" onchange="searchWarrant('','','0')" >
                	 						<option value="">--Select--</option>
                                            <option value= "valid" ${dealStatus == 'valid' ? 'selected' : ''}>Valid</option>
                                            <option value= "expired" ${dealStatus == 'expired' ? 'selected' : ''}>Expired</option>
                                            <option value="replaced" ${dealStatus == 'replaced' ? 'selected' : ''}>Replaced</option>
                                            </select>
                	 </div>
                	 </div>
	               
	                 <div class=" col-lg-3 col-md-3 ">
	                 <div class="col-lg-4 col-md-4 col-sm-5 col-xs-5" style="text-align:right;top:5px;padding-right: 5px; padding-left:0px">
	                   <label><spring:message code="warrant_location.label"/></label>
	                 </div>
	                 <div class="col-lg-8 col-md-8 " style="padding-left: 0px;">
	                 	<select class="form-control form-group" id="warehouse_location" onchange="searchWarrant('','','0')">
<!-- 						                		<option value="">ALL</option> -->
							                   <c:forEach var="location" items="${locationsList}">
<%-- 													<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
												<c:choose>
							                      <c:when test="${location.description == ''}">
							                        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							                      </c:when>
							                     <c:otherwise>
							                       <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                     </c:otherwise>
							                    </c:choose>
												</c:forEach>
					  </select>
                	  </div>
		           	</div>
		          	</div>
		          	</div>
		          	<br>
		          	<div class="row">
                  	<div class="col-lg-1 col-md-1" style="padding-left: 28px; padding-right: 0px; margin-top: 5px">
	                <select class="form-control" id="maxRecords" style="" onchange="searchWarrant('','','0')">
	               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
	               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
	               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
	              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
	               	</select>
	                </div>
                      <div class=" col-lg-10 col-md-10 ">
                       <input type="text"  class="form-control searchItems" style="margin-top: 5px; margin-left:1.1%; text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="searchWarrant" placeholder="<spring:message code="search.Warrant.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchWarrant" style=""></ul>
				   				</div>
						    </div>
						<span id="WarrantError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						<input type="hidden" id="warrants" value="${searchName}">
	        	 	 </div>
                                <c:if test="${sessionScope.role == 'super admin'}"> 
                                 <div class="col-lg-1 col-md-1" style="padding-left: 0px;padding-right: 10px;">
								  <div class="buttons" style="margin-top: 5px;">
			  				        <a onclick="return newCustomerWarrants();" class="button"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;
			   			           </div>
								   </div>
                                 </c:if>
                                 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    								<c:if test="${accessControl.appDocument == 'TaxMaster' && accessControl.write == true}"> 
	                                   <div class="col-lg-1 col-md-1" style="padding-left: 0px;">
										<div class="buttons" style="margin-top: 5px;">
			  				               <a onclick="return newCustomerWarrants();" class="button"><spring:message code="addnew.label" /></a>&nbsp;&nbsp;
			   			                 </div>
										 </div>
									 </c:if>
								</c:forEach>
					 </div>
								 <table id="example1" class="table table-bordered table-striped" style="margin-left: 10px; width: 99.0%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="s.no.label" /></th>
                                                <th><spring:message code="customer.name.label" /></th>
                                              	<th><spring:message code="contact.number.label" /></th>
                                                <th><spring:message code="warrant_sales.date.label" /></th>
                                                <th><spring:message code="warrant_item.id.label" /></th>
                                                <th><spring:message code="warrant_item.description.label" /></th>
                                                <th><spring:message code="warrant_mfg.date.label" /></th> 
                                                <th><spring:message code="warrant_customer.warranty.till" /></th> 
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="warrants" items="${customerWarrants}">
                                            <tr>
                                            	<td>${warrants.slNo}</td>
                                            	<td>${warrants.customerName}</td>
                                            	 <td>${warrants.customerPhoneNum}</td>
                                            	<td>${warrants.dateOfPurchaseStr}</td>
                                                <td>${warrants.pluCode}</td>
                                                <td>${warrants.productDescription}</td> 
                                                <td>${warrants.mfgDateStr}</td>
                                                <td>${warrants.warrentyExpireDateStr}</td>
                                                
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                          
                           
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerWarrants('customerWarrants','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerWarrants('customerWarrants','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerWarrants('customerWarrants','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerWarrants('customerWarrants','${totalValue}')">
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