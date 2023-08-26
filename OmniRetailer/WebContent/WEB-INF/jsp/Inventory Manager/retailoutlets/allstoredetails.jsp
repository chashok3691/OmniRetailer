<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlet/storedetails.jsp
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
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}

@media screen and (max-width: 1240px) and (min-width: 767px) {
   .table.dataTable {
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
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2px;
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
.modal-backdrop
{
    opacity:0.0 !important;
}
.modal {

}
.modal-dialog {

}
.modal-content {
  background-color: #fefefe;
  text-align:left;
  width: 80%;
  margin-left: 60%;
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
$("#searchStores").val($("#store").val());
	$("#searchStores").focus();
	
	
		$('#searchStores').on('input',function(e){
			if($(this).val().trim()==""){
				viewConfigurations('outletConfigurations','0');
			}
		});
		
	    $('#mySearch').click(function(){
	        var search = $('#searchStores').val();
	        return viewConfigurations('outletConfigurations','0');;
	    })
	    $('#searchStores').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });

	
});
</script>  
     
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->

				<%-- <section class="content-header">
					<h1><spring:message code="outlet.management.label" />
     					<small><spring:message code="configurations.label" /></small>
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
                                <div class="box-header" align="center">
                                    <h3 class="box-title"><spring:message code="allstores.label" /></h3>
                               		<a style="float:right;color:#2e7ea7 !important;cursor: pointer;" data-toggle="modal" data-target="#myModal"><u>Help</u></a>
										
										<div class="modal fade" id="myModal" role="dialog">
										    <div class="modal-dialog">
										    
										      <!-- Modal content-->
										      <div class="modal-content">
										        <div class="modal-header">
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										          <h4 class="modal-title">Outlet Configuration</h4>
										        </div>
										        <div class="modal-body">
										          <p>You can configure new outlet in no time. It just take few mins to configure
										          a new outlet. You just need to select appropriate options before creating an outlet.</p>
										          <br>
										          <p>Please follow the below steps for creating an Outlet.</p>
										          <ul style="list-style: none;">
										          <li>1) Create a Location of type Retail Outlet by going to Master
										          Data Management --> Generic Masters Flow. This flow will be visible provided you have access rights.</li>
										          <li>2) Click Add New to get GUI panel for creating a new Outlet.</li>
										          <li>3) As a first, you need to select a location where you want to setup an Outlet.
										          For a given location, you can setup only one Outlet or any other Business Activity.</li>
										          <li>4) Enter/Configure the below options. You may take support TechnoLabs support team for detailed information on 
										          Outlet Options.</li>
										          <li><b>Outlet Name:</b> The name you want to see every where including Billing Printing.</li>
										          <li><b>Road/Street:</b> This is also required and mandatory field so that this value can be used in other documents.</li>
										          <li><b>Locality:</b> Area that is validated by Google API. This picks the longitude and latitude values as well.</li>
										          <li><b>Authorized Signatory:</b> This image is used to have signature at the bottom of the Bill.
										          This is not mandatory field.</li>
										          <li><b>Longitude/Lattitude:</b> We recommend you to capture the longitude/lattitude of the point where Outlet is located.
										          Omni Retailer cloud platform uses the coordinates to route the Online orders. So is the case with Self Checkouts and security.</li>
										          </ul>
										        </div>										        
										      </div>
										      
										    </div>
										  </div>
  
                             		
                                </div><!-- /.box-header -->                                
                                <div id="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${err}</div>
                                <div class="box-body table-responsive">
                                <div class="row">
                                
                                  <div class="col-lg-1 col-xs-2">
				                      	<label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewConfigurations('outletConfigurations','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
			                     <div class="col-lg-10" style="    margin-top: 20px;margin-left: -10px;">
			                     
			                     <div class="wrapper">
				        	 		  <input type="text"  class="form-control "  value="${searchStores}" id="searchStores" placeholder="<spring:message code="search.stores.label" />" />
									
						<button id="mySearch" class="searchbutton"></button>
						
							<input type="hidden" id="sku" value="${searchStores}"></div>
										
										 
				        	 	</div>
                                <c:if test="${sessionScope.role == 'super admin'}">
                                  <div class="col-lg-1" style="padding-left: 0px;    margin-top: 18px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newOutlet();" value="<spring:message code="addnew.label" />">
								           </div>
                                 
                                	
                                </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true}"> 
					                  <div class="col-lg-1" style="padding-left: 0px;float:right;    margin-top: 18px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newOutlet();" value="<spring:message code="addnew.label" />">
								           </div>
									</c:if>
								</c:forEach>
								</div>
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<!-- <th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> -->
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                            	
                                                <th><spring:message code="storecode.label" /></th>
                                                <th><spring:message code="created.date.label" /></th>
                                                    <th><spring:message code="updated.date.label" /></th>
                                                <th ><spring:message code="storename.label" /></th>
                                                <th ><span><spring:message code="location.label" /></span></th>
                                                 <th><spring:message code="status.label" /></th>
                                                 
                                               <%--  <th><spring:message code="phone.label" /></th> --%>
                                               <%--  <th><spring:message code="minepayamount.label" /></th> --%>
                                               
                                               <%--  <th><spring:message code="billing.starttime.label"/></th>
                                                <th><spring:message code="billing.endtime.label"/></th> --%>
                                                <th><spring:message code="event.type.label"/></th>
                                                <th><spring:message code="no.of_counters"/></th>
                                                
                                                <th><span style=""><spring:message code="action.label" /></span></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="store" items="${storeDetailsList}">
                                            <tr>
                                            	<!-- <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value=${store.storeCode} /></td> -->
                                                <td>${store.slNo}</td>
                                                <td >${store.storeCode}</td>
                                                <td>${store.createdDatestr}</td>
                                                <td>${store.updatedDatestr}</td>
                                                <td >${store.storeName}</td>
                                                <td >${store.locationId}</td>
                                                 <td>${store.storeStatus=='1' ? 'Active' : 'Inactive'}</td>
                                                <%-- <td>${store.phone}</td> --%>
                                              <%--   <td>${store.minPayAmount}</td> --%>
                                              <td>${store.companyOwned}</td>
                                              <td>${store.countersCount}</td>
                                               <%--  <td>${store.startTime}</td>
                                                <td>${store.endTime}</td> --%>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewOutlet('${store.locationId}')"><spring:message code="data.label"/></a>&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewLayout('${store.storeCode}','${store.location}')"><spring:message code="layout.label"/> </a></td>
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewConfigurations('outletConfigurations','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewConfigurations('outletConfigurations','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewConfigurations('outletConfigurations','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewConfigurations('outletConfigurations','${totalValue}')">
              	</div> 
              	</c:if>
             



<div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="viewConfigurations('outletConfigurations',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
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
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
</body>
</html>