<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlet/allRestaurantDetails.jsp
 * file type		        : JSP
 * description				: The store details table is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Configurations | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 0.8%;
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
</style>       
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->

		<%-- 		<section class="content-header">
					<h1><spring:message code="outlet.management.label" />
     					<small><p id="heading"><spring:message code="configurations.label" /></p></small><small><p id="heading">/ <spring:message code="restaurant.label" /></p></small>
   					</h1>
                   <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"><spring:message code="allstores.label" /></h3>
                                </div><!-- /.box-header -->
                                
                                <c:choose>
                                	<c:when test="${not empty err }">
                                	<div class="row" style="text-align: center;">
                                		<span style="color: red;"> ${err }</span>
                                	</div>
                                	</c:when>
                                	<c:when test="${not empty msg }">
                                	<div class="row" style="text-align: center;">
                                		<span  style="color: blue;"> ${msg }</span>
                                	</div>
                                	</c:when>
                                </c:choose>
                                
                                <div class="box-body table-responsive">
                                	
									 <div class="row">
									  <div class="buttons" style="margin-bottom: -2px;">
		  				                <a onclick="return newRestaurantOutlet('','restaurant');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
		   			                  </div>
									</div>
									
                                    <%-- <table id="example1" class="table table-bordered table-striped">
                                   
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<!-- <th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> -->
                                                   <th><spring:message code="location.label" /></th>
                                                <th><spring:message code="level.label" /></th>
                                                <th><spring:message code="date.label" /></th>
                                                
                                                <th><spring:message code="storecode.label" /></th>
                                                <th><spring:message code="storename.label" /></th>
                                                <th><span style="margin-left:55px;"><spring:message code="location.label" /></span></th>
                                                <th><spring:message code="phone.label" /></th>
                                                <th><spring:message code="minepayamount.label" /></th>
                                                <th><spring:message code="billing.starttime.label"/></th>
                                                <th><spring:message code="billing.endtime.label"/></th>
                                                
                                                <th><span style="margin-left:55px;"><spring:message code="action.label" /></span></th>
                                            </tr>
                                        </thead>
                               
                                        
                                          
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="room" items="${roomDetailsList}">
                                            <tr>
                                            	<!-- <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value=${store.storeCode} /></td> -->
                                                <td>${store.layoutCode}</td>
                                                <td>${room.location}</td>
                                                <td>${room.level}</td>
                                                 <td>${room.dateTimeStr}</td>
                                                <td>${store.dateTimeStr}</td>
                                                <td>${store.minPayAmount}</td>
                                                <td>${store.startTime}</td>
                                                <td>${store.endTime}</td>
                                                
										<td><a
											style="color: #2e7ea7 !important; cursor: pointer;"
											onclick="return viewRestaurantLayout('${room.location}','${room.level}')"><spring:message
													code="view.label" /> <spring:message code="layout.label" />
										</a> &nbsp;&nbsp;&nbsp;<a
											style="color: #2e7ea7 !important; cursor: pointer;"
											onclick="return viewRestaurantOutlet('${room.location}')"><spring:message
													code="view.label" /> <spring:message code="outlet.label" /></a></td>

									</tr>
                                            </c:forEach>





                                            
                                        </tbody>
                                        
                                        
                                    </table> --%>
                                    
                                    <table id="example1" class="table table-bordered table-striped">
                                   
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<!-- <th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> -->
                                                <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="storecode.label" /></th>
                                                <th><spring:message code="storename.label" /></th>
                                                <th><span style=""><spring:message code="location.label" /></span></th>
                                                <th><spring:message code="phone.label" /></th>
                                                <th><spring:message code="minepayamount.label" /></th>
                                                <th><spring:message code="start.time.label"/></th>
                                                <th><spring:message code="end.time.label"/></th>
                                                <th><span style=""><spring:message code="action.label" /></span></th>
                                            </tr>
                                        </thead>
                               
                                        
                                          
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="store" items="${storeDetailsList}">
                                            <tr>
                                            	<!-- <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value=${store.storeCode} /></td> -->
                                                <td>${store.resSlNo}</td>
                                                <td>${store.storeCode}</td>
                                                <td>${store.storeName}</td>
                                                <td>${store.locationId}</td>
                                                <td>${store.phone}</td>
                                                <td>${store.minPayAmount}</td>
                                                <td>${store.startTime}</td>
                                                <td>${store.endTime}</td>
										<td>
										<%-- <input type="hidden" id="buildingName" value="${store.buildingName}">
									    <input type="hidden" id="levelsStr" value='${store.levelsStr}'> --%>
									    
										<input type="hidden" id="_${store.storeCode}_buildingName" value='${store.buildingName}'/>
										<input type="hidden" id="_${store.storeCode}_levelsStr" value='${store.levelsStr}'/>
										<c:forEach var="facility" items="${store.facilitiesInfo}">

										<input type="hidden" id="_${store.storeCode}_${facility.businessCategory}_facilityCategory" value="${facility.businessCategory}"/>
													
										</c:forEach>
										
										<a
											style="color: #2e7ea7 !important; cursor: pointer;"
											onclick="return viewRestaurantOutlet('${store.locationId}','restaurant')"><spring:message
													code="view.label" /> <spring:message code="outlet.label" /></a>&nbsp;&nbsp;&nbsp;
										<a
											style="color: #2e7ea7 !important; cursor: pointer;"
											onclick="return viewRestaurantLayout('${store.storeCode}','${store.locationId}','1')"><spring:message
													code="view.label" /> <spring:message code="layout.label" />
										</a> </td>

									</tr>
                                            </c:forEach>
                                        </tbody>
                                        
                                        
                                    </table>
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
              //  $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
</body>
</html>