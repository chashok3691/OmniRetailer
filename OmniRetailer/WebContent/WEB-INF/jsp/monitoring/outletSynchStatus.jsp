<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : vijay
 * file name		        : inventorymanager/retailoutlets/DayWiseStock.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * Written Date				: 21-11-2017
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
</head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
    white-space: nowrap;
    
  }

} 
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
}
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
.col-lg1-2{
    width: 20% !important;
}
.form-control {
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
    }
	.align
    {
        padding-bottom: 27px !important;
    }

</style>
<script type="text/javascript">
/*  
 * width: 100%; 
 
 margin-bottom: 15px; 
overflow-x: auto;
overflow-y: hidden;
-webkit-overflow-scrolling: touch;
-ms-overflow-style: -ms-autohiding-scrollbar;
border: 1px solid #DDD;

display: inline-block;
white-space: nowrap;
 */
$(document).ready(function(){
	
	 
	    
	 
	
});
</script>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" >
			<spring:message code="outletSynchStatus.label" />
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
             
             
             
               <div class="row" style="margin-top: -15px;">
               
               <div class="col-lg-1 col-xs-4" style="padding-top: 8px;margin-bottom: -5px">
               	<label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewoutletNewSynchStatus('OutletNewSynchStatus','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
               
	        <div class="col-lg-3 col-xs-4" style="padding-top: 8px;margin-bottom: -5px">
                  <label><spring:message code="location.label"/></label>
	          <select class="form-control" id="outletLocation" >
                           		 <option value="all"><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
								<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
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
         <div class="col-lg-7"></div>
         
         <div class="col-lg-1 col-xs-4" style="padding-top: 8px;margin-bottom: -5px;  padding-left: 0px;">
               <input type="button" style="margin-top: 18px;" class="btn bg-olive btn-inline addBtn" onclick="viewoutletNewSynchStatus('OutletNewSynchStatus','0')" value="<spring:message code="search" />" />
           </div>
         </div>
             
            <%--  <div class="row">
                                
                                  <div class="col-lg-1 col-xs-2" style="padding-top: 8px;margin-bottom: -5px">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewoutletNewSynchStatus('OutletNewSynchStatus','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
			                     <div class="col-lg-10">
			                     </div>
			                     </div> --%>
             
                   <div>
                      <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th rowspan="2" class="align"><div><spring:message code="sl.no.label" /></div></th>
                             
                             	<th rowspan="2" class="align"><spring:message code="outletlocation.label" /></th>
                             	<th rowspan="2" class="align">Counter ID</th>
                             	<th rowspan="2" class="align">Device ID</th>
                             	<th rowspan="2" class="align"><spring:message code="email.label" /></th>
                             	<th rowspan="2" class="align"><spring:message code="customer.phonenumber.label" /></th>
                             
                             <%--    <th rowspan="2" class="align"><div ><spring:message code="date.label" /></div></th>
                                <th rowspan="2" class="align"><spring:message code="uom.label" /></th> --%>
                                <th colspan="10" class=""><spring:message code="synchstatus.label" /></th>
                              
                                 </tr>
                                 <tr>
                                 <th>SKU</th>
                                 <th>Downloaded Date</th>
                                 <th><spring:message code="edit.employee.header.label" /></th>
                               <th>Deal</th>
                                <th>Downloaded Date</th>
                                <th>Offer</th>
                                <th>Downloaded Date</th>
                                 <th>Customers</th>
                                <th><spring:message code="denomination.label" /></th>
                                </tr>
                           
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="synchStatusdetails" items="${synchStatusdetails}" varStatus="theCount">
                         <tr>
                         <td>${theCount.count+index-1}</td>
                          <td>${synchStatusdetails.storeLocation}</td>
                          <td>${synchStatusdetails.counterId}</td>
                          <td>${synchStatusdetails.deviceId}</td>
                          <td>${synchStatusdetails.emailId}</td>
                         <td>${synchStatusdetails.phoneNumber}</td>
                         <c:choose>
                         <c:when test="${synchStatusdetails.skuStatus == true}">
                          <td>Yes</td>
                         </c:when>
                         <c:otherwise>
                         <td>No</td>
                         </c:otherwise>
                         </c:choose>
                         
                         <td>${synchStatusdetails.lastDownloadedDateSkuStr}</td>
                        
                         <c:choose>
                         <c:when test="${synchStatusdetails.employeeStatus == true}">
                          <td>Yes</td>
                         </c:when>
                         <c:otherwise>
                         <td>No</td>
                         </c:otherwise>
                         </c:choose>
                        
                         <c:choose>
                         <c:when test="${synchStatusdetails.dealStatus == true}">
                          <td>Yes</td>
                         </c:when>
                         <c:otherwise>
                         <td>No</td>
                         </c:otherwise>
                         </c:choose>
                         
                         <td>${synchStatusdetails.lastDownloadedDateDealStr}</td>
                         
                         <c:choose>
                         <c:when test="${synchStatusdetails.offerStatus == true}">
                          <td>Yes</td>
                         </c:when>
                         <c:otherwise>
                         <td>No</td>
                         </c:otherwise>
                         </c:choose>
                         
                         <td>${synchStatusdetails.lastDownloadedDateOfferStr}</td>
                       
                        <c:choose>
                         <c:when test="${synchStatusdetails.customerStatus == true}">
                          <td>Yes</td>
                         </c:when>
                         <c:otherwise>
                         <td>No</td>
                         </c:otherwise>
                         </c:choose>
                       
                       <c:choose>
                         <c:when test="${synchStatusdetails.denominationMasterStatus == true}">
                          <td>Yes</td>
                         </c:when>
                         <c:otherwise>
                         <td>No</td>
                         </c:otherwise>
                         </c:choose>
                       
                           
                        </tr>
                        </c:forEach>
                         </tbody>
                     </table>
                     </div>
                     </div>


<!-- <div class="col-lg-7"></div> -->
<!--                        <div class="col-lg-5" style="padding-right: 0px; text-align: right;" > -->
<!--              <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;"> -->
<!--                  <div class="col-lg-3 col-sm-3" style="text-align: right;font-size: 16px">Total Qty</div> -->
<%-- 					<div class="col-lg-3 col-sm-2" style="text-align: left;">: ${totalquantity} </div> --%>
				
					
<!--              <div class="col-lg-3 col-sm-3" style="text-align: right;font-size: 16px">Total Value</div> -->
<%-- 					<div class="col-lg-3 col-sm-3" style="text-align: left;">: ${totalcost} </div> --%>
<!-- 					</div> -->
<!--               </div> -->
             <div class="row" style="padding-top:2px;">
              
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2"> 
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletNewSynchStatus('OutletNewSynchStatus','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletNewSynchStatus('OutletNewSynchStatus','${index - 11}')"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">  
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletNewSynchStatus('OutletNewSynchStatus','${index - 11}')"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewoutletNewSynchStatus('OutletNewSynchStatus','${totalValue}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">  
              		  <input type="button" onclick="viewoutletNewSynchStatus('OutletNewSynchStatus',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
				
               </div>

              </div>    
            </div><!-- /.box-body -->
        </div><!-- /.box -->

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
                  "bAutoWidth": false,
                 
    			});
            }); 
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>