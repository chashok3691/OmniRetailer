<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/stockVerification/allverifiedstocks.jsp
 * file type		        : JSP
 * description				: All verified stocks details are displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
.searchbutton{
    margin-right: 10px;
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
/* callCalender('from');
callCalender('to'); */
// $("#searchStockVerification").val($("#stockVerification").val());
// $("#searchStockVerification").focus();
// $('#searchStockVerification').on('input',function(e){
// 	if($(this).val().trim()==""){
// 		viewStockVerification('','0','','','');
// 	}
// });$("#searchStocks").val($("#stock").val());
 $("#searchStockVerificationMaster").val($("#stockVerification").val());
		$("#searchStockVerificationMaster").focus();  
	$('#searchStockVerificationMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewStockVerification('outletStockVerification','0','outlet','menu','');
		}
	});
	
	
	 $('#mySearch').click(function(){
	        var search = $('#searchStockVerificationMaster').val();
	        return searchStockVerification(search,'','0');
	    })
	    $('#searchStockVerificationMaster').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });


/* var sDate=$("#sd").val();
var s=sDate.split(' ');
$("#from").val(s[0]);
var eDate=$("#ed").val();
var e=eDate.split(' ');
$("#to").val(e[0]); */

});
</script> 
</head>
<body>

 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stock.verification.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
                
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                  <div class="box-header" style="text-align: center;">
                     <h3 class="box-title" >
                     Stock Verification Masters
					<%-- 	<spring:message code="stockverification.label"/> --%>
					 </h3>
                     </div><!-- /.box-header -->
					<input type="hidden" id="sd" value="${startDate}">
				    <input type="hidden" id="ed" value="${endDate}">
				     <input type="hidden" id="verification_code" value="${whstockverifiObj}">
                                <div class="box-body table-responsive" style="padding-top: 0px;">
                                	<div class="row">
								    <%--     <div class="col-lg-3">
								              <label><spring:message code="location.label"/></label>
							               <div class="row">
							                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" >
							                 <select class="form-control form-group" id="location" onchange="searchStockVerification('','','0')">
	 				                           <option value=""><spring:message code="ALL.label"/></option>
	 				                             <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
												 </c:forEach>
	                                           </select>
							                 </div>
								        	</div>
								        </div> --%>
								         <div class="col-lg-5"></div>
								     <%--     <div class="col-lg-3" style="    padding-right: 0px;">
								        <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								        <label><spring:message code="offer_start_date.label"/></label>
							              <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
							             	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
							             </div>
								              </div>
								            </div>
							             
								            <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								             <label><spring:message code="offer_end_date.label"/></label>
								               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
								                 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
								                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
							                	  </div>
									           </div>
									          </div></div>
								           <div class="col-lg-1" style="padding-left:0px;">
								                <input type="button" style="padding: 4px 8px;float: right;margin-top: 18px;width:100%" class="btn bg-olive btn-inline" onclick="searchStockVerification('','','0')" value="<spring:message code="search" />" />
								           </div> --%>
									      </div>
									      <input type="hidden" id="flowUnder" value="${flowUnder}">  
									      <br>
									      <br>
									      <br>
	      								<div class="row" style="margin-top:-40px;">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchStockVerification('','','0');">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	</select>
								           </div>
								             
									        <div class="col-lg-10 col-xs-10" style="margin-top: 10px; padding-left:0px;">
								       	 		<%--  <input type="text"  class="form-control searchItems searchBar" value="" id="searchStockVerification" placeholder="<spring:message code="search.stock.verification.label" />" style=""  />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl searchStockVerification" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="stockVerification" value="${searchName}"> --%>
												
									<input type="text"  class="form-control" value="${searchName}" id="searchStockVerificationMaster" placeholder="<spring:message code="search.stock.verification.label" />" />
                     				<button id="mySearch" class="searchbutton"></button>
										<input type="hidden" id="stockVerification" value="${searchName}">
						
												
								       	 	</div>
								       	 
								       	 	<%-- 
								       	 	 <c:if test="${flowUnder=='warehouse'}">
									        <div class="col-lg-10 col-xs-10" style="margin-top: 10px; padding-left:0px;">
								       	 		 <input type="text"  class="form-control searchItems searchBar" value="" id="searchWarehouseStockVerification" placeholder="<spring:message code="search.stock.verification.label" />" style=""  />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl searchwarehouseStockVerification" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="stockWarehouseVerification" value="${searchName}">
								       	 	</div>
								       	 	</c:if> --%>
								       	 	
								       	 	
								       	 	
								       	 	
								       	 	
								       	 	 <div class="col-lg-1" style="padding-left:0px;">
								               
								                <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="newstockverification()" value="<spring:message code="new.label" />" />
								                 
								       </div>
								          <div>
								        <%--   <input type="button" style="padding: 4px 8px;    width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="viewEditWarehouseStockVerification('${whstockverifiObj}','0')" value="<spring:message code="view.stock.verification" />" /> --%>
								           </div>
									       </div>
									       
                                    <table id="verifiedProductStocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="verificationcode.label" /></th>
                                            	<th><spring:message code="location.label" /></th>
                                            <%-- 	<th><spring:message code="department.label" /></th> --%>
                                                <th><spring:message code="start.date.label" /></th>
                                                <th><spring:message code="end.date.label" /></th>
                                                 <th><spring:message code="status.label" /></th>
                                               <%--  <th ><spring:message code="remarks.label" /></th> --%>
                                                <th ><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                            <c:forEach var="productStockVerificationDetails" items="${productStockVerificationDetailsList}">
                                            <tr>
                                            	<td>${productStockVerificationDetails.slNo}</td>
                                            	<td>${productStockVerificationDetails.verification_code}</td>
                                            	<td>${productStockVerificationDetails.location}</td>
                                            	<%-- <td>${productStockVerificationDetails.department}</td> --%>
                                            	<td>${productStockVerificationDetails.verificationStartDateStr}</td>
                                            	<td>${productStockVerificationDetails.verificationEndDateStr}</td>
                                            	<td>${productStockVerificationDetails.status}</td>
                                            	
                                            	<%-- <td>${productStockVerificationDetails.remarks}</td> --%>
                                            	<td style=""><a style="color:#2e7ea7 !important;margin-left:10px;cursor: pointer;" onclick="viewEditWarehouseStockVerification('outletStockVerification','${productStockVerificationDetails.verification_code}','view')" ><spring:message code="stock.verification.master.view.label" /></a> &nbsp;
                                            <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditWarehouseStockVerification('outletStockVerification','${productStockVerificationDetails.verification_code}','edit')" ><spring:message code="stock.verification.master.Edit.label" /></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--                                              <input type="button" style="padding: 2px 11px;;margin-top: 0px;" class="btn bg-olive btn-inline" onclick="viewWarehouseStockVerification('outlettStockVerification','0','${flowUnder}','menu','${productStockVerificationDetails.verification_code}','${productStockVerificationDetails.location}');" value="<spring:message code="stock.verification.master.Report.label" />">  --%>
                                            	</td>	
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                  
                                    
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockVerification('','${totalValue}','','','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockVerification('','${index - (maxRecords + 1)}','','','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockVerification('','${index - (maxRecords + 1)}','','','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockVerification('','${totalValue}','','','')">
              	</div> 
              	</c:if>
              	
              	
              	
             
              	
 <!--added by manasa  -->
<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords+1}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewStockVerification('',document.getElementById('pagination').value,'','','')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div> 

<!--/..modified by manasa  -->    
              	
              	
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
                $("#verifiedProductStocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    		});
          });
        </script>
        
</body>
</html>