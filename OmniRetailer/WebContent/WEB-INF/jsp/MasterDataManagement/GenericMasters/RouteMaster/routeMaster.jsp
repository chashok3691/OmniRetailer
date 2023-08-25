<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/zoneMaster.jsp
 * file type		        : JSP
 * description				: The category details table is displayed using this jsp
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
       <%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
             <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/routeMaster.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
.col-lg1-2{
    width: 25% !important;
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
	
	callCalender('startdate');
	callCalender('enddate');
var err = $("#err").val();
if(err != "")
  alert(err);
/* $("#searchZone").val($("#zone").val());
//if($("#searchSKU").val().trim()!="")
	$("#searchZone").focus(); */
	
$('#mySearch').click(function(){
    var search = $('#searchRoute').val();
    viewRouteMaster('routeMaster','0');
})
 $('#searchRoute').keyup(function(e){
	 
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
     else if(e.which == 8){ //backspace key pressed
    	 if($('#searchRoute').val()=="")
    	 $('#mySearch').click();//Trigger search 
    }
   });
	
	
//	Added to fetch the locations based on zone 
var zone = $("#outletZone").val();
if( zone != null && zone !="")
	 {
	 	searchlocationsBasedOnZoneForDashboard('outletZone','location','');
	 }
	
});


</script>      
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="masters.label" />
     <small><spring:message code="sku.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="masters.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
   		  <div class="box-header" align="center">
<%--               <h3 class="box-title"><spring:message code="all.zone.label" /></h3> --%>
          </div><!-- /.box-header -->
                      <div class="box-body table-responsive">
                      
                      
                       <div class="col-lg-12">
         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                     
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="startdate" size="20" type="text" onfocus="callCalender('startdate')" onclick="callCalender('startdate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletlocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
<%-- 									<option value="${location}" ${location == loc ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 	<c:choose>
							<c:when test="${location.description == ''}">
							<option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}</option>
							</c:when>
							<c:otherwise>
							<option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							</c:otherwise>
							</c:choose>
						 	
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                      
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="enddate" size="20" type="text" onfocus="callCalender('enddate')" onclick="callCalender('enddate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                 <div class="col-lg-1" style="    width: 12%;    padding: 10px 15px;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewRouteMaster('routeMaster','0')" style="padding: 4px 8px;     margin-bottom: 16px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                      
                      
       </div>    
            
                      
                     <div class="col-lg-12">
                        <br>
                    
                     </div> 
                   
                      
                          <div class="row">
                            <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewRouteMaster('routeMaster','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
		                <div class="col-lg-9" style="margin-left: -2%;
    margin-right: 2%;">
	        	 		 <%-- <input type="text"  class="form-control searchItems searchBar"  value="" id="searchZone" placeholder="<spring:message code="search.zone.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl zoneMaster" style=""></ul>
				   				</div>
							</div> --%>
							
							<input type="text"  class="form-control" value="${searchName}" id="searchRoute" placeholder="<spring:message code="searchRouteMasters.label" />" />
                     <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							<input type="hidden" id="zone" value="${searchName}">
							<input type="hidden" id="locality" >
							
	        	 		</div>
		               <c:if test="${sessionScope.role == 'super admin'}">
		              <!--  <div class="col-lg-2" style="margin-top: 3px;padding-left: 0px;"> 
		               		<div class="buttons" style=""> -->
		               		<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newRouteMaster('routeMaster');" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('routeMaster');" value="<spring:message code="delete.label" />">
								           </div>
							        <%-- <a onclick="return newZone('newZone');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('zone');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
						<!-- 	</div>
						</div> -->
		               </c:if>
                     <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          <c:if test="${accessControl.appDocument == 'RouteMaster' && accessControl.write == true}"> 
                          <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newRouteMaster('routeMaster');" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('routeMaster');" value="<spring:message code="delete.label" />">
								           </div>
						 </c:if>
					</c:forEach>
					</div>
                          <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                              </c:if>
                              <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          		<c:if test="${accessControl.appDocument == 'RouteMaster' && accessControl.write == true}"> 
                             		<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	</c:if>
                             </c:forEach>
                             	 <th><div style=""><spring:message code="sl.no.label" /></div></th>
                                 <th><spring:message code="route.id.label" /></th>
                                 <th><spring:message code="route.name.label" /></th>
                                 <th><spring:message code="route.category.label" /></th>
                                  <th><spring:message code="pickup.lcation.label" /></th>
                                  <th><spring:message code="priceRangeMaster.createdDateStr.label" /></th>
<%--                                   <th><spring:message code="newarrival.enddate" /></th> --%>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                        
                         <c:forEach var="routeList" items="${routeList}"  varStatus="theCount">
                          <tr>
                         <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${routeList.routeId}' /></td>
                              </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          		<c:if test="${accessControl.appDocument == 'RouteMaster' && accessControl.write == true}"> 
                             		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${routeList.routeId}' /></td>
                             	</c:if>
                            </c:forEach>
                            <td>${theCount.count}</td>
                            <td>${routeList.routeId}</td>
                            <td>${routeList.routeName}</td>
                            <td>${routeList.routeCategory}</td>
                             <td>${routeList.pickupPoint}</td>
                             <td>${routeList.createdDateStr}</td>
<%--                              <td>${routeList.endDateStr}</td> --%>
                              <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditRouteMaster('${routeList.routeId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                               <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditRouteMaster('${routeList.routeId}','edit')">Edit</a>&nbsp;&nbsp;&nbsp;
                              </td>
                         
                         </tr>
                         </c:forEach>
                         
                         </tbody>
                     </table>
                     
                     
                     
                       <br>
           <%--      <div class="row" id="pagination">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewZoneMaster('zoneMaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewZoneMaster('zoneMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewZoneMaster('zoneMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewZoneMaster('zoneMaster','${totalValue}')">
              	</div> 
              	</c:if>
              </div>
             --%>     
             
                 <div class="row">
        
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewRouteMaster('routeMaster','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewRouteMaster('routeMaster','${index - maxRecords-1}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewRouteMaster('routeMaster','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewRouteMaster('routeMaster','${index+maxRecords-1}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewRouteMaster('routeMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>