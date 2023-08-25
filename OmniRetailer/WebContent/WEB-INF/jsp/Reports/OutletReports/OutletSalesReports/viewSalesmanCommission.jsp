<!--  * Project Name 	        : OmniRetailerCustomer
 * Written By		        : vijay
 * Written On				: 04/09/2017
 * file name		        : reports/outletReports/outletSalesReport/outletReports/viewSalesmanCommission.jsp
 * file type		        : JSP
 * description				: This view is used to display viewSalesmanCommission.
 * 
 * * -->

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
                <%-- 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style>

.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}

.wrapper {
    /* border:1px solid #000;
    display:inline-block; */
    position:relative;
}

.searchbutton{
background-image: url(../images/search.png);
    background-position: right;
    text-align: left;
    height: 30PX;
    background-repeat: no-repeat;
    margin-bottom: 2px;
    background-origin: content-box;
    width: 41px;
    padding: 4px 10px;
    border-left: 1px solid #ccc;
    /* background: #3c8dbc; */
    z-index: 999;
    position: absolute;
    background-color: #3c8dbc;
        right: 0;
    top: 0;
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
    padding: 7px 10px 35px 10px;
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




.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}


.col-lg1-2{
    width: 20% !important;
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
    .calendar_icon {
    background-position: 3px 3px;
    }
    
    		.iospopupp {
   	width: 61%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}
  
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$('#mySearch').click(function(){
        var searchVoidItems = $('#searchSaleCommissionItems').val();
        return viewSalesmanCommission('outletSalesmanCommission','0','','${flowLocation}');
    })
    $('#searchSaleCommissionItems').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });
	callCalender('startDate');
	callCalender('endDate');
	
	 var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','location','${flowLocation}');
		 }
	
});



</script>
</head>
<body>
<div id="saleitem">
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" >
			<spring:message code="salesman.commission.label"/>
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
             <div class="col-lg-12">
         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px; width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','location','${flowLocation}')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                          <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
                        <div class="col-lg1-2 col-lg-2">
                 
                      </div>
                    
                         <div class="col-lg1-2 col-lg-2">
                   
                      </div>
                    <div class="col-lg1-2 col-lg-2">
               
                      </div>
                  
                       
                     
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == loc ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                     <div class="col-lg1-2 col-lg-2">
                   
                      </div>
                     
                        <div class="col-lg1-2 col-lg-2">

                      </div>
                       <div class="col-lg1-2 col-lg-2">
                 
                      </div>
                    
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchSalesmanCommission('outletSalesmanCommission','0','','NOPOP','${flowLocation}');" class="button"><spring:message code="searchbutton.label"/></a>
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
       
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
         
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;margin-left:50px">
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: -30px;">
													<input type="button" class="iosclosebutton1"
														onclick="searchSalesmanCommission('outletSalesmanCommission','0','','','${flowLocation}');"
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
         <div class="col-lg-12 col-xs-12">
                  <br>   <br>
                  </div>
	 <div>
          
				                 <div class="col-lg-1" style="margin-top:-18px" >
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewSalesmanCommission('outletSalesmanCommission','0','','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-10" style=" padding-left: 0px;">
				              
	        	 		</div>
				               
				                       <div class="col-lg-1" style="text-align: right;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div> 
				                  </div></div>
              <div>
                         <input type="hidden" id="salesdownloadurl" value="${downloadurl1}">
                     <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width: 95.8%;;position: relative;white-space: nowrap;margin-left:24px">
                   
                     <table id="commissionSales" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                               <th><spring:message code="salesman.name.label"/></th>
							   <th><spring:message code="salesman.id.label"/></th>
                               <th><spring:message code="bussiness.date.label"/></th>
                               <th><spring:message code="shift.id.label"/></th>
							    <th>Sale Bills  </th>
							    <th>Return Bills</th>
                                <th> Sale Qty</th>
                                <th > Return Qty </th> 
                                <th>Sale Amt </th>
                                <th > Return Amt </th> 
                             	<th ><spring:message code="average.quantity.or.transaction.label" /></th>
								<th ><spring:message code="average.amount.or.transaction.label" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="saleCommissionDetails" items="${salesReportList}">
                         	 <tr>
                         	 <td>${saleCommissionDetails.cashierName}</td>
                         	  <td>${saleCommissionDetails.cashierId}</td>
                         	  <td>${saleCommissionDetails.date}</td>
                         	  <td>${saleCommissionDetails.hour}</td>
                         	   <td>${saleCommissionDetails.saleBills}</td>  
                         	   <td>${saleCommissionDetails.returnBills}</td>
                         	   <td>${saleCommissionDetails.saleQuantity}</td>
                         	   <td>${saleCommissionDetails.returnQuantity}</td>
                         	   <td> ${saleCommissionDetails.saleAmount}</td>
                         	   <td>${saleCommissionDetails.returnAmount}</td>
                         	    <td>${saleCommissionDetails.avgQuantity}</td>
                         	    <td>${saleCommissionDetails.avgValue}</td>
                             </tr>
                            </c:forEach>
                               </tbody>
                     </table>
                     
                      <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="margin-left: 45%;margin-top: 0%; border-radius: 0;">
        <div class="modal-header">
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px"><spring:message code="savePopUp.label" />
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="validateSalesmanCommission('outletSalesmenSalesCommission','0','save','${flowLocation}');"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
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
                    </div>
                     </div>
               <div class="col-lg-12 col-xs-12">
                  <br>
                  </div>
             
          <%-- <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
               <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;padding-left:35px">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSalesmanCommission('outletSalesmanCommission','${totalValue}','','${flowLocation}')">
              	</div>
              	</c:if>
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;padding-left:35px">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSalesmanCommission('outletSalesmanCommission','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;padding-left:35px">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	
              	
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;padding-left:35px">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSalesmanCommission('outletSalesmanCommission','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSalesmanCommission('outletSalesmanCommission','${totalValue}','','${flowLocation}')">
              	</div> 
              	</c:if>
                   	<div class="col-lg-6" style="float:right;padding-right:33px">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords-maxRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewSalesmanCommission('outletSalesmanCommission',document.getElementById('pagination').value,'','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>       --%>
              
              
              	<div class="row">
              	
              	<input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewSalesmanCommission('outletSalesmanCommission','${index - (maxRecords + 1)}','','${flowLocation}');"> 
              	</div>
              	</c:if>
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSalesmanCommission('outletSalesmanCommission','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSalesmanCommission('outletSalesmanCommission','${index - (maxRecords + 1)}','','${flowLocation}');">  ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSalesmanCommission('outletSalesmanCommission','${totalValue}','','${flowLocation}')">
              	</div> 
              	</c:if>
             
				<div class="col-lg-6 col-xs-6" style="float:right;">
              	<div class="col-lg-8 col-xs-4" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2 col-xs-4" style="padding-right: 0px;">
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
              		  <input type="button" onclick="viewSalesmanCommission('outletSalesmanCommission',document.getElementById('pagination').value,'','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>
             
             </div>
             </div> <!--/.box-body  -->
             </div> <!--/.box-primary -->
             </section>
          </div>   
</body>
</html>