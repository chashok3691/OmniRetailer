<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/stockReturn/stockReturns.jsp
 * file type		        : JSP
 * description				: The employee details table is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockReturn.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
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
.wrapper {
    /* border:1px solid #000;
    display:inline-block; */
    position:relative;
}
</style>       
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
/* var err = $("#err").val();
if(err != "")
  alert(err); */
 $("#searchStocksReturn").val($("#stockReturn").val());
//if($("#searchEmployeeMaster").val().trim()!="")
	$("#searchStocksReturn").focus(); 
	
	
	
	$('#searchStocksReturn').on('input',function(e){
		if($(this).val().trim()==""){
			viewGoodsReturn('outletGoodsReturn','0','','outlet');
		}
	});	
	
	//added by manasa
	$('#mySearch').click(function(){
	    var search = $('#searchStocksReturn').val();
	    return searchOutletStockReturn(search,'','0');
	})
	$('#searchStocksReturn').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }
	});
	var sDate=$("#sd").val();
	var s=sDate.split(' ');
	$("#from").val(s[0]);

	var eDate=$("#ed").val();
	var e=eDate.split(' ');
	$("#to").val(e[0]);
	
	
/* 	
	var zone = $("#outletLocation").val();
	var flowUnder = $("#flowUnder").val();
	
	var location = $("#fromLocation").val();
	
	if( zone != null && zone !="" && flowUnder==  'outlet' && location==  '')
		searchlocationsBasedOnZoneForDashboard('outletLocation','fromLocation','');
	else if(zone != null && zone !="" && flowUnder==  'warehouse'  && location==  '')
		searchlocationsBasedOnZoneForDashboard('outletLocation','fromLocation','warehouse');
	else
		{
		
		}
	 */
	
	
	
	
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
                            <h3 class="box-title" style="width: 100%;text-align: center;"><spring:message code="allStockReturns.label" /></h3>
                        </div><!-- /.box-header -->
                        <div class="box-body table-responsive">
                         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                        		<div class="row">
                        		 <div class="col-lg-3" style="padding-right: 5px;">
								             <label><spring:message code="zone.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
								                
								                <c:choose>
								                <c:when test="${flowUnder ==  'outlet'}">
								                 <select class="form-control" id="outletLocation" onchange="searchlocationsBasedOnZoneForDashboard('outletLocation','formLocation','');"><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="zoneList" items="${zoneList}">
															<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${location}" >${zoneList.zoneID}</option>
														</c:forEach>
							                   </select>
							                   </c:when>
							                   <c:otherwise>
							                    <select class="form-control" id="outletLocation" onchange="searchlocationsBasedOnZoneForDashboard('outletLocation','formLocation','warehouse');"><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="zoneList" items="${zoneList}">
															<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${location}" >${zoneList.zoneID}</option>
														</c:forEach>
							                   </select>
							                   
							                   </c:otherwise>
							                   </c:choose>
							                 </div>
								        </div>
								        
								        <div class="col-lg-6"></div>
								        
								      <div class=" col-lg-3">
								             <input type="hidden" id="sd" value="${startDate}">
										<div class="col-lg-12"
											style="padding-left: 0px; padding-right: 5px;">
							                 		<label><spring:message code="offer_start_date.label"/></label>
							                	 	<input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
								              </div>
										
									      </div>
									      </div>
									      
							<div class="row">
								        <div class="col-lg-3" style="padding-right: 5px;">
								          <label><spring:message code="location.label"/></label>
							               <div class="col-lg-12" style="padding: 0px">
								                 <select class="form-control" id="formLocation" onchange="return viewGoodsReturn('','0',this.options[this.selectedIndex].value);">             
							                         <c:forEach var="location" items="${locationsList}">
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
								        <div class="col-lg-6"></div>
								             <div class=" col-lg-3">
								                    <input type="hidden" id="ed" value="${endDate}">
										<div class="col-lg-12"
											style="padding-left: 0px; padding-right: 0px;">
								                <label><spring:message code="offer_end_date.label"/></label>
								                 	<input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
									           </div>
									          </div>
									      </div>
									      
									      
									      </div>
									      
									      
				 <div class="col-lg-1" style="width: 12%;background: #ccc;height: 115px;">
                  	<div class="col-lg-12" style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                 <input type="button" style="padding: 4px 8px;    width: 100%; margin-top: 18px;" class="btn bg-olive btn-inline" onclick="searchOutletStockReturn('','','0');" value="<spring:message code="search" />" />
				</div>
                  <div class="row">
                 <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 18px;"  onclick="resetForm();" class="btn bg-olive btn-inline" value="<spring:message code="clearbutton.label"/>" />
                  </div>
                  </div>
                  </div> 	      
									      
									      <br>
									       <div class="col-lg-12" style="padding: 0px;">
									       <div class="row">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchOutletStockReturn('','','0');">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	</select>
								           </div>
								           
								           
								           <!--modified by manasa  -->
				                       <div class="col-lg-11 col-xs-8" style="padding-left:0px;margin-top: 11px;">
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="" id="searchStocksReturn" placeholder="<spring:message code="search.stock.return.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="stockReturn" value="${searchName}">
                    </div></div>
                    </div>
								           
									       <%--  <div class="col-lg-11 col-xs-10" style="margin-top: 10px;">
								       	 		 <input type="text"  class="form-control searchItems searchBar" value="" id="searchStocksReturn" placeholder="<spring:message code="search.stock.return.label" />"   />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl outletStockReturn" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="stockReturn" value="${searchName}">
								       	 	</div>
									       </div> --%>
                                    <table id="example1" class="table table-bordered table-striped" style="margin-left: 0px; width: 100%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="date.label" /> & Time</th>
                                            	<th><spring:message code="return.note.ref.label" /></th>
                                            	<th><spring:message code="fromlocation.label" /></th>
                                                <th><spring:message code="tolocation.label" /></th>
                                                <%-- <th><spring:message code="shipped.on.label" /></th> --%>
                                                <th><spring:message code="shipment_mode.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                            <c:forEach var="stockReturn" items="${stockReturnsList}" varStatus="theCount">
                                            <tr>
                                            	<td>${stockReturn.slNo}</td>
                                                <td>${stockReturn.dateAndTime}</td>
                                                <td>${stockReturn.returnNoteRef }</td>
                                                <td>${stockReturn.fromLocation}</td>
                                                <td>${stockReturn.toLocation}</td>
                                                <%-- <td>${stockReturn.shippedOnStr}</td> --%>
                                                <td>${stockReturn.shipmentMode}</td>
                                                <td>
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditStockReturn('${stockReturn.returnNoteRef}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                               
                                                <%--  <c:if test="${sessionScope.role == 'super admin'}">  
                                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditStockReturn('${stockReturn.returnNoteRef}','edit')">Edit</a>
                                                 </c:if>  --%>
                                              <%--  <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             					<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == true}">
                                                	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditStockReturn('${stockReturn.returnNoteRef}','edit')">Edit</a>
                                                </c:if>
                                               </c:forEach> --%>
                                                </td>
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                       
                                    </table>
              <%-- <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewGoodsReturn('outletGoodsReturn','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGoodsReturn('outletGoodsReturn','${index - 11}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGoodsReturn('outletGoodsReturn','${index - 11}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewGoodsReturn('outletGoodsReturn','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div> 
              	</c:if>
              </div> --%>
              <input type="hidden" id="flowUnder" value="${flowUnder}">  
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewGoodsReturn('','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div>									<!--viewOutletShipments('Ready','pendingOutletShipment','0')  -->
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGoodsReturn('','${index - (maxRecords + 1)}','<c:out value="${selectedLocation}"/>')"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGoodsReturn('','${index - (maxRecords + 1)}','<c:out value="${selectedLocation}"/>');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewGoodsReturn('','${totalValue}','<c:out value="${selectedLocation}"/>')">
              	</div> 
              	</c:if>
              	
              	
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
              		  <input type="button" onclick="viewGoodsReturn('','',document.getElementById('pagination').value,'<c:out value="${selectedLocation}"/>')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>  
              	
              	
              	
              	
              	
              </div>  
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                </div>
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
                //$("#example1").dataTable();
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="employee.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>