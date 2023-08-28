<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : VIJAY
 * file name		        : Inventory Manager/Reports/salesReportsCounterWise.jsp
 * file type		        : JSP
 * description				: display outlet sales reports
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
        <script src="${pageContext.request.contextPath}/js/outletReports/reports.js"></script>  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
      
<script type="text/javascript">

	$(document).ready(function(){
		// callCalenderYYYYMMDD('date');
		callCalender('startDateTender');
		callCalender('endDateTender');
// 		 var zone = $("#outletZone").val();
// 		 if( zone != null && zone !="")
// 			 {
// 			 	searchlocationsBasedOnZoneForDashboard('outletZone','location','');
// 			 }
	});
</script>
<style type="text/css">
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
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
.col-lg1-2{
    width: 25% !important;
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
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 4px 10px 28px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 19.5px;
    height: 25px;
    text-align: center;
    margin-bottom: 19px;
    width: 100%;
}
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}

	.iospopupp {
   	width: 61%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}
</style>
    </head>
<body>
<div id="tender">

				<section class="content-header">
                    <h1>
  					<c:if test = "${flowLocation ==''}">
                       <spring:message code="outlet_management.reports.label"/>
                       </c:if>
                       <c:if test = "${flowLocation !=''}">
                      <spring:message code="warehouse_management.reports.label"/> 
                      </c:if>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;<spring:message code="reports.tender.wise.sales.label"/>&nbsp;<spring:message code="report.label"/>
                   
                    </h1>
                  
                </section>
                
                      
<section class="content">
<div class="row">
  <div class="col-lg-12" >
	<div class="box box-primary">
       <div class="box-body">  
       <div class="col-lg-12" style="padding: 0px;">
         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg-2" style="width:20%;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','${flowLocation}')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zone == zoneList.zoneID ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                     
                  
                       
                         <div class="col-lg-2" style="width:20%;">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${startDate}" style="background-color: white;" id="startDateTender" size="20" type="text" onfocus="callCalender('startDateTender')" onclick="callCalender('startDateTender')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class=" col-lg-2"  style="width:20%;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <%-- <select class="form-control" id="location" >
                           		 <option value="all"><spring:message code="ALL.label"/></option>
	                          
						 		  <c:forEach var="location" items="${workLocationsList}">
								<c:choose>
								 <c:when test="${flowUnder == 'outlet'}">
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
						 		</c:forEach>
						 		
	                        </select> --%>
	                        <select class="form-control" id="location" >
                           		 <option value="" selected><spring:message code="ALL.label"/></option> 
	                              
						 		  <c:forEach var="location" items="${workLocationsList}">
								<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : '' } >${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" >${location.locationId}-${location.description}</option><%-- ${location.locationId == selectedLocation ? 'selected' : ''} --%>
							        </c:otherwise>
							    </c:choose>
						 		</c:forEach>
						 		
	                        </select>
                      </div>
                      </div>
                   
                       
                     
                      <div class="col-lg-2"  style="width:20%;">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${endDate}" style="background-color: white;" id="endDateTender" size="20" type="text" onfocus="callCalender('endDateTender')" onclick="callCalender('endDateTender')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchTenderWiseSales('tenderWiseSales','0','NOPOP','${flowLocation}')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  
                  <div class="modal fade" id="myModalIoss" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
     
    
      <!-- Modal content-->
      <div class="modal-content iospopupp">
        <div class="modal-header" >
       
          <button type="button" class="close" style="margin-top: -17px;margin-right: -9px;" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">It may take  time. Do you want to continue ?
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          
         
         
          
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;margin-left:50px">
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: -30px;">
													<input type="button" class="iosclosebutton1"
														onclick="searchTenderWiseSales('tenderWiseSales','0','','${flowLocation}')"
														value="OK">
												</div>
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: 48px;">
													<input type="button" class="iosclosebutton1"
														data-dismiss="modal" value="Cancel">
												</div>
											</div>



   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
		
                  
                  
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
       </div>    
            
            
            <div class="col-lg-12" style="padding: 0px;">
				                     <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                   <!--    <input type="hidden" id="skuSales" value=""> -->
				                       <div class="col-lg-1"style="padding: 0px;">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewTenderWiseSales('tenderWiseSales','0','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      
				                      </div>
            
    
     <div class="col-lg-12"style="padding: 0px;">
<!--       <div id="example2_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
 -->
 
             <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
 				         <table id="tenderTable" class="table table-bordered table-striped">
                            <thead style="background-color: #3c8dbc; color: #ffffff">
                               <tr>
                               <th><spring:message code="sl.no.label"/></th>
                                 <c:forEach var="labels" items="${labels}" varStatus="theCount">
                                             <th>${labels}</th>
                                                <c:set var="lableCount" value="${theCount.count}"/>
                                    </c:forEach>
                               </tr>
                               
                               </thead>
                               
                                <tbody  style="text-align: center;">
                                
                 		   <c:set var="indexRead" value="${index}"/>
                 		   <c:forEach var ="i" begin ="2" end="${maxRecords+1}">
                 		  
                 		   <c:if test = "${totalRecords ge indexRead}"> 
                 		   <tr>
<%--                  		   <c:set var="indexRead" value="${i+index-2}"/> --%>
                 		  
                 		   <td>${indexRead}</td>
                 		  
                 		   <c:forEach var="map" items="${tenderWiseReport}">
                 		   <c:forTokens items="${map}" varStatus="thePrintCount" delims=",[]" var="dataPrint">
                 		   
                 		   <c:if test="${i ==  thePrintCount.count}">
                 		   		<td>${dataPrint}</td>
                 		   		 <c:set var="indexRead" value="${i+index-1}"/>
                 		   </c:if>
                 		</c:forTokens>
                 		</c:forEach>
                 		</tr>
                 		</c:if>
                   </c:forEach>
                   
                       
                   
                                </tbody>
                               
                               </table>
                               </div>
     </div>
                                
           <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewTenderWiseSales('tenderWiseSales','${index+maxRecords-1}','${flowLocation}')">
              	</div>
              	</c:if>
              
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewTenderWiseSales('tenderWiseSales','${index - maxRecords-1}','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue - maxRecords <= 0}">
              		<div class="form-group col-lg-6" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewTenderWiseSales('tenderWiseSales','${index - maxRecords-1}','${flowLocation}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewTenderWiseSales('tenderWiseSales','${index+maxRecords-1}','${flowLocation}')">
              	</div> 
              	</c:if>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;font-size: 16px;"><spring:message code="pages.label" /></div>
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
              		  <input type="button" onclick="viewTenderWiseSales('tenderWiseSales',document.getElementById('pagination').value,'${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>   
          
		
      </div>
    </div>
  </div>
</div>

</section><!-- /.content -->

 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#tenderTable").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": true,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false,
                 
    			});
            });
        </script>



</div>

</body>
</html>