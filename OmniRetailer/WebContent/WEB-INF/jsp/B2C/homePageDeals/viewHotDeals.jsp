<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : B2C/viewHotDeals.jsp
 * file type		        : JSP
 * description				: The HotDeals details table is displayed using this jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/homePageDeals.js"></script>
           <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
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
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
</style>     
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchHotDeals").val($("#dealsSearch").val());
//if($("#searchTax").val().trim()!="")
	$("#searchHotDeals").focus();
});

</script>  
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
              <div class="box-header">
                  <h3  style="text-align: center;margin: 0px;"><label style="text-align: center;padding: 5px;padding-left: 20px;padding-right: 20px;border: 1px solid gray;border-radius:5px;"><spring:message code="home.page.offers.label" /></label></h3>              
              </div><!-- /.box-header -->
              <div class="box-body table-responsive">
                     <div class="row">
	        <div class="col-lg-4 col-sm-0 form-group">
	        </div>
	        <div class="col-lg-1 col-sm-0"></div>
	        <div class="col-lg-3 col-sm-5">
              <div class="row">
                	<%-- <div class="col-lg-4 col-xs-4 col-sm-5 col-md-5" style="text-align:left;top:5px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
	                 </div> --%>
                	 <div class="col-lg-8 col-xs-8 col-sm-7 col-md-7" >
                	 <label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                	 </div>
	              </div>
	            </div>
	            <div class="col-lg-3 col-sm-5">
	               <div class="row">
	                 <%-- <div class="col-lg-4 col-xs-4 col-sm-5 col-md-5" style="text-align:left;top:5px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 </div> --%>
	                 <div class="col-lg-8 col-xs-8 col-sm-7 col-md-7" >
	                 <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                	  </div>
		           </div>
		          </div>
	           <div class="col-lg-1 col-sm-2" style="margin-top: 15px">
	                <input type="button" style="padding: 4px 8px;float: right;    border-radius: 5px !important;" class="btn bg-olive btn-inline" onclick="searchHotDeals('', 'hotDeals','0');" value="<spring:message code="search" />" />
	           </div>
		      </div>
               <div class="row">
                  <div class="col-lg-1 col-sm-2 col-xs-2" style="margin-top: 5px;">
	                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchHotDeals('', 'hotDeals','0');">
	               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
	               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
	               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
	              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
	               	</select>
	           		</div>
                     <div class="col-lg-9 col-sm-10">
	        	 		 <input type="text"  class="form-control searchItems" style="margin-top: 5px;text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="searchHotDeals" placeholder="<spring:message code="search.Homepage.deals" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl hotDeals" style=""></ul>
				   				</div>
							</div>
							<span id="hotDealsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							<input type="hidden" id="dealsSearch" value="${searchName}">
	        	 		</div>
                               <c:if test="${sessionScope.role == 'super admin'}"> 
                                <div class="col-lg-2" style="margin-top: 3px;padding-left: 0px;    margin-left: -2px;">
								 <div class="buttons" style="">
	  				               <a onclick="return newHomePageDeal('homePageDeals');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
	   			                   <a onclick="return validate('homePageDeals');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="delete.label" /></font></a>
								 </div>
								 </div>
                               </c:if>
                           <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
								<c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true}"> 
                                    <div class="col-lg-2" style="margin-top: 5px;padding-left: 0px;    margin-left: -2px;">
									 <div class="buttons" style="">
		  				               <a onclick="return newHomePageDeal('homePageDeals');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
		   			                   <a onclick="return validate('homePageDeals');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="delete.label" /></font></a>
									 </div>
								 </div>
							 </c:if>
						</c:forEach>
						</div>
                          <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                                  <tr>
                                   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
									<c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true}"> 
                                  		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                  	</c:if>
                                  </c:forEach>
                                  	  <th><div style=""><spring:message code="sl.no.label" /></div></th>
                                      <th><spring:message code="hot.deal.ref.label" /></th>
                                      <th><spring:message code="deal.title.label" /></th>
                                      <th><spring:message code="deal_start_date.label" /></th>
                                      <th><spring:message code="offer_end_date.label" /></th>
                                      <th><spring:message code="priority.label" /></th>
                                       <th><spring:message code="status.label" /></th>
                                       <th><spring:message code="EmployeeForm.action" /></th>
                                  </tr>
                              </thead>
                              <tbody style="text-align: center;">
                                 <c:forEach var="homePageDeals" items="${dealsList}">
                                  <tr>
                                   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${homePageDeals.hotDealRef}' /></td>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
									<c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true}"> 
                                  		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${homePageDeals.hotDealRef}' /></td>
                                  	</c:if>
                                  </c:forEach>	
                                  	  <%-- <td>${rates.slNo}
                                  	  <input type="hidden" id="sno" value="${rates.snoStr}">
                                  	  </td> --%>
                                  	  <td>${homePageDeals.slNo}</td>
                                  	  <td>${homePageDeals.hotDealRef}</td>
                                  	  <td>${homePageDeals.dealsDisplayTitle}</td>
                                  	  <td>${homePageDeals.effectiveFromDateStr}</td>
                                  	  <td>${homePageDeals.endDateStr}</td>
                                  	  <td>${homePageDeals.dealPriorityStr}</td>
                                  	  <td>${homePageDeals.statusStr}</td>
                                 
                                      <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditHotDeal('${homePageDeals.hotDealRef}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                       <c:if test="${sessionScope.role == 'super admin'}"> 
                                       	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditHotDeal('${homePageDeals.hotDealRef}','edit')">Edit</a>
                                       </c:if>
                                      <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
										<c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true}"> 
                                      		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditHotDeal('${homePageDeals.hotDealRef}','edit')">Edit</a>
                                      	</c:if>
                                      </c:forEach> 
                                      </td>
      							</tr>
                                  </c:forEach> 
                              </tbody>
                          </table>
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewHomePageDeals('homePageDeals','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewHomePageDeals('homePageDeals','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewHomePageDeals('homePageDeals','${index - (maxRecords+1)}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewHomePageDeals('homePageDeals','${totalValue}'); ">
              	</div> 
              	</c:if>
              </div>
           </div><!-- /.box-body -->
       </div><!-- /.box -->
  
</div>
</div>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="hot.deal(s).label" />"/>
         <input type="hidden" id="err" value="${err}" />
</section><!-- /.content -->
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
            $(function() {
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
</body>
</html>