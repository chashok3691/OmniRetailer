<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/serailBillSalesReport.jsp
 * file type		        : JSP
 * description				: display total billings
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
        	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
<%--         <script type="text/javascript" src="${pageContext.request.contextPath}/js/billings.js"></script> --%>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">

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
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.pagination1{
       padding: 4px 14px;
    background: #337ab7;
   /*  width: 67px; */
    color: #fff;
    /* margin-right: 30px; */
    text-align: center;
    font-size: 16px;
    border-radius: 0px;
}
.pagination1:hover{
cursor:pointer;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}


.iospopupp {
   	width: 29%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}

@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
}
/* @media (min-width: 1200px){
	.summaryBtn{
		margin-top: -10px;
	}
} */

@media (min-width: 1200px){
.summaryBtn {
    margin-top: -10px;
}
.summaryImg {
    width: 50%;
    float: right;
    /* margin-right: 0%; */
    padding-bottom: 5px;
}

}

a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}

.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	
	$('#mySearch').click(function(){
	viewSerialBillSalesReports('serialBillSales','0',"NOPOP",'${flowLocation}');
	});
/* 	
	 var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
		 }
	 */
	
});


</script>
</head>
<body>
<!-- Main content -->
<div id="bills">
<section class="content">
<div class="row">
  <div class="col-lg-12">
 
  <div class="box box-primary">
                   <div class="box-header" align="center">
						
					</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                
         <!--  <div class="row"> -->
          
          <div class="col-lg-11" style="padding: 10px 20px;width: 88%;background: #f1f1f1">
           <div class="row">
              <div class="col-lg1-2 col-lg-3">
                       <div class="col-lg-12" style="">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                      <div class="col-lg1-2 col-lg-3">
                   
                      </div>
                      
                      
                      <div class="col-lg1-2 col-lg-3">
                       
                      </div>
                       
                      
                      
                    
                      
                      <div class="col-lg1-2 col-lg-3">
              <div class="col-lg-12" style="">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	            <input type="hidden" id="sd" value="${startdate}">
<%-- 	              <input type="hidden" id="locationList" value="${locationList}"> --%>
                     </div>
          
                      <div class="row">
                       <div class="col-lg1-2 col-lg-3">
	            
               <div class="col-lg-12" style="">
                 <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="outletLocation" onchange="countersByLocation('outletLocation','counterId');">
                     	<option value=""><spring:message code="ALL.label"/></option>
                        <c:forEach var="location" items="${locationsList}">
							<c:choose>
							<c:when test="${location.description == ''}">
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							</c:when>
							<c:otherwise>
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							</c:otherwise>
							</c:choose>
							<%-- <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					<%-- <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.description}-${location.locationId}</option> --%>
	 					</c:forEach>
                 </select>
	           
	        </div>
	        </div>
	        
	        <div class="col-lg1-2 col-lg-3">
                      
                      </div>
	        
	        <div class="col-lg1-2 col-lg-3">
                    
                      </div>
                      
                      <div class="col-lg1-2 col-lg-3">
	               <div class="col-lg-12" style="">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                      
                      </div>  
                   
          </div>
          
          <div class="col-lg-1" style="padding-bottom: 4px;background: #D8D8D8;    width: 12%;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchSerialBillSalesReports('serialBillSales','0','','NOPOP','${flowLocation}');" class="button" ><spring:message code="searchbutton.label" /></a>
                  </div>
                  
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label" /></a>
                  </div>
                  </div>
                  
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
														onclick="generateSalesReportCriteriaWise('${criteria}','validationCheck','0','','${flowLocation}');"
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
                <div class="col-lg-12"></div>
              
          </div>
          <br>
          
          
				                    <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewBills('','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-10 col-xs-10 ">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="" id="searchBills" placeholder="<spring:message code="search.bills.label" />" />
											<button id="mySearch" class="searchbutton"></button>
											<!-- <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div> -->
										<input type="hidden" id="bill" value="${searchName}">
				                    </div></div>
				                    <div class="col-lg-1" style="">
                     <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="searchBills('','save','0');" value="SAVE"/>
<%--                          <input type="hidden" id="stockdownloadurl" value="${downloadurl}"> --%>
                  </div>
				                  </div>
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><div><spring:message code="location.label" /></div></th>
                                            	<th><div><spring:message code="serialbillid.label" /></div></th>
                                            	<th><spring:message code="billing_id.label" /></th>
                                            	<th>Yearly Bill Id</th>
                                            	<th><div><spring:message code="billed.type.label" /></div></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="billingDetails" items="${billDetails}">
                                        	 <tr>
                                        	 	<td>${billingDetails.slNo}</td>
                                        	 	<td>${billingDetails.store_location}</td>
                                        	 	  <td>${billingDetails.serialBillId}</td>
                                        	 	  <td>${billingDetails.billId}</td>
                                        	 	  <td>${billingDetails.serailBillIdYearly}</td>
                                        	 	<c:choose>
                                        	 	<c:when test="${billingDetails.offlineBill == '0' || billingDetails.offlineBill == 'false'}">
                                        	 	<td><spring:message code="online.label"/></td>
                                        	 	</c:when>
                                        	 	<c:otherwise>
                                        	 	<td><spring:message code="offline.label"/></td>
                                        	 	</c:otherwise>
                                        	 	</c:choose>
												
										</tr>
                                           </c:forEach>
                                                             
                                        </tbody>
                                    </table>
                                    </div>
             <div class="row" style="padding-right: 15px;">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSerialBillSalesReports('serialBillSales','${totalValue}','','${flowLocation}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSerialBillSalesReports('serialBillSales','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-3" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSerialBillSalesReports('serialBillSales','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords}
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSerialBillSalesReports('serialBillSales','${totalValue}','','${flowLocation}')">
              	</div> 
              	</c:if>
              	
              	<div class="col-lg-7" style=""></div>
              	
              	 	<div class="col-lg-1" style="padding-right: 0px;">
              		<select class="form-control" id="pagination" >
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	</div>
              		<div class="col-lg-1" style="padding-right: 0px;">
              		  <input type="button" onclick="viewSerialBillSalesReports('serialBillSales',document.getElementById('pagination').value,'','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		
              </div>    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
             <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
             <i class="billsPopUpUpArrow" aria-hidden="true"></i>
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" style="text-align: center;"><div id="locationLable"></div><div id="dateLable"></div></h3>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
  
</div>
</div>
</section>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable(
             		{
             			  "bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
        <c:choose>
        <c:when test="${status=='all'}">
         <input type="hidden" id="billStatus" value="">
        </c:when>
        <c:otherwise>
         <input type="hidden" id="billStatus" value="${status}">
        </c:otherwise>
        </c:choose>
       
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
        </div>
</body>
</html>