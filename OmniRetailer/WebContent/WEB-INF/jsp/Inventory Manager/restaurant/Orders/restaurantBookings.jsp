<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/restaurant/orders/restaurantBookings.jsp
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
        <title>Restaurant Booking Information | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/restaurantBooking.js"></script>
	
          <!-- callender display -->
          <script type="text/javascript">
 $(document).ready(function(){
	 /*  var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#restaurantStartDate').val(formatedDate); */
	  callCalender('restaurantStartDate1');
	  callCalender('restaurantEndDate1');
	 // callCalender('deliveryDate');
 });
 
 
</script>



<script type="text/javascript">
$(".searchItems").blur(function(e) {
	 //viewBookingsByFilter(0, $("#searchItems").val());
});


$(".searchItems").keydown(function(e) {
		if (e.keyCode == 27) {
		  $(this).siblings("div").hide();
		  $(this).siblings("div").children("div").children(".matchedStringUl").html(""); // need check
		}
		
	    if (e.keyCode == 13) { // enter
	    	console.info(" >>> "+$(this).siblings("div").is(":visible"));
	        if ($(this).siblings("div").is(":visible")) {
	        	$(this).val($(this).siblings("div").children("div").children("ul").children(".selected").children("a").text());
	        	
	        	if($(this).val().trim() != ""){
		    	console.info($(this).val().trim()+" <<<???>>> "+$(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ',''));
	        		var id = $(this).siblings("div").children("div").children("ul").children(".selected").children("a").parent().attr("id");
	        		var typeSearch = $(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
	        		console.info("typeSearch : "+typeSearch);
	        		if(typeSearch == "restaurantBookingIds")
	        			 viewRestaurantBookingsByFilter(0, $("#searchItems").val());
	        		//var label = $(element).children("a").text();
				} else 
	        	$(this).siblings("div").show();
		    }
	        
	        
		    if (e.keyCode == 38) { // up
		        var selected = $(this).siblings("div").children("div").children("ul").children(".selected");
		        if ($(this).siblings("div").children("div").children("ul").children("li").length != 1 ) 
		        	$(this).siblings("div").children("div").children("ul").children("li").removeClass("selected");
		        if (selected.prev().length == 0) 
		            selected.siblings().last().addClass("selected");
		        else 
		            selected.prev().addClass("selected");
		    }
		    if (e.keyCode == 40) { // down
		        var selected = $(this).siblings("div").children("div").children("ul").children(".selected");
		        if ($(this).siblings("div").children("div").children("ul").children("li").length != 1 ) 
		        	$(this).siblings("div").children("div").children("ul").children("li").removeClass("selected");
		        if (selected.next().length == 0) 
		            selected.siblings().first().addClass("selected");
		        else 
		            selected.next().addClass("selected");
		    }
	    }
	});



</script>

<style type="text/css">
/* added for calender Start*/
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif ) no-repeat left center #fff;
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

  
/* added for calender End*/

/* added for search  Start*/
/* ------------------------------ */

/* for search string  START*/

div.matchedString {
	background: #fff;
	position: absolute;
	/* top: -9px; */
	/* left: -8px; */
	z-index: 100;
	width: 300px;
	overflow: auto;
	display: none;
	margin-left: 0px;
	padding: 0px 0 0px;
	border-radius: 6px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
}

.matchedString {
	padding: 0px 0px 0px 0px;
	position: absolute;
	list-style: none;
	background-color: #e5e55e;
}

div.matchedString {
	text-align: left;
	border-bottom: 1px solid #f5f5f5;
	color: #666666 !important;
	display: block;
	/* margin: 0; */
	padding: 8px 12px;
	text-decoration: none;
	/* margin-left: 10%; */
	/* width: 150px; */
	/* margin-left: 50%; */
}

.matchedStringUl {
	background-color: #FFF;
	list-style: none;
	position: absolute;
	width: 94%;
	z-index: 1;
	margin: 0px -0px;
	  padding: 10px;
    border: 1px solid #ccc;
    display: none;
}

.matchedStringUl li {
  padding: 5px;
  }
.matchedStringUl li:hover {
	color: #fff;
	background-color: #E2E2E2;
}

.matchedStringUl li a {
	cursor : pointer;
}

.services li.selected {
	background-color: #E2E2E2;
}
/* for search string  END*/
/* added for search END */

.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 1.5%;
	margin-top:2%;
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

<script type="text/javascript">
/* 
var ladgeLevels = $("#lodgingFloor").val();
//roomTypes = roomTypes.replace('[','').replace(']','');
var ladgeLevel = ladgeLevels.split(",");
var ladgeLevelOption = '';
for(var i=0;i<ladgeLevel.length;i++){
//	alert(ladgeLevel[i]);
	ladgeLevelOption = ladgeLevelOption+'<option value="'+ladgeLevel[i]+'">'+ladgeLevel[i]+'</option>'; 		
} */

//$("#level_Id").append(ladgeLevelOption);



</script>   
</head>
<body>
<input type="hidden" name="lodgingFloor" id="lodgingFloor"  value="<spring:message code="room.max.level.label"/>">
 <!-- Content Header (Page header) -->
<!-- Main content -->

			<%-- 	<section class="content-header">
					<h1><spring:message code="hospitality.management.label" />
     					<small><p id="heading"><spring:message code="rastaurant.bookings.label" /></p></small>
   					</h1>
                   <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section>
                 --%>
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary" style="height:1000px;">
                                <div class="box-header" >
                                    <h3 class="box-title"><spring:message code="all.booking.label" /></h3>
                                </div><!-- /.box-header -->
                                
            
            
                                <div class="box-body table-responsive">
                                	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                	<div class="row" style="">
                                     <div class="form-group col-lg-3">
                                         <label><spring:message code="deal_start_date.label" /><span style="color:red; font-size:2"></span></label>
                                            <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="startDate" id="restaurantStartDate1" size="20" type="text" onfocus="callCalender('restaurantStartDate1')" onclick="callCalender('restaurantStartDate1')" placeholder="DD/MM/YYYY"/>
                                        <span id="restaurantStartDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                        <label><spring:message code="deal_end_date.label" /> <span style="color:red; font-size:2"></span></label>
                                        <input class="form-control calendar_icon" readonly="readonly"  onchange="" style="background-color: white;" name="endDate" id="restaurantEndDate1" size="20" type="text" onfocus="callCalender('restaurantEndDate1')" onclick="callCalender('restaurantEndDate1')" placeholder="DD/MM/YYYY"/>
                                        <span id="restaurantEndDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        <input type="hidden" id="prevDate">
                                     </div>
                                     <div class="form-group col-lg-3">
									     <label><spring:message code="location.label" /></label>
                                            <select name="locationName" class="form-control" id="locationList" ><!-- onchange="viewRestaurantBookingsByFilter('0','');" -->
<%--                                            	<option><spring:message code="filter.by.location.label" /> </option> --%>
                                           	<c:forEach var="location" items="${Locations}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
                                           </select>
									  </div>
									  <div class="form-group col-lg-3">
									    <label><spring:message code="slot.label" /></label>
                                           <!-- <input type="number" name="level" value="0" id="level_Id"/> -->
                                           <select name="slot" class="form-control" id="slot_id" ><!-- onchange="viewRestaurantBookingsByFilter('0','');" -->
                                           	<option><spring:message code="filter.by.slot.label" /> </option>
                                           	<option value="Lunch">Lunch</option>
                                           	<option value="Dinner">Dinner</option>
                                           </select>
                                        </div>
                                   </div>
				                   <div class="row">
				                  
				                    <div class="form-group col-lg-10">
                                        <input type="hidden" id="desc">
                                        <label><spring:message code="filter.booking.id.label" /> <span style="color:red; font-size:2"></span></label>
                                        <input class="form-control searchItems"  id="searchItems" placeholder="Search Items Here" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
                                        <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl restaurantBookingIds" style="display: none;"></ul>
								   				</div>
											</div>
                                     </div>
                                    
									  <div class="buttons" style="margin-bottom: 7px;">
									  <a onclick="return viewRestaurantBookingsByFilter('0','');" class="button" style="margin-left:"><font size="2px"><spring:message code="search" /></font></a>&nbsp;&nbsp;
		  				                <a onclick="return viewRestaurantBookings('restaurantBookingDetails');" class="button"><font size="2px">
		  				                <spring:message code="view.all.bookings.label" /></font></a>
		   			                  </div>
									</div>
                                    
                                    
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="slno.label" /></th>
                                            	<th><spring:message code="order_id.label" /></th>
                                            	<th><spring:message code="customer.phone.label" /></th>
                                                <th><spring:message code="customer.name.label" /></th>
                                                <th><spring:message code="date.label" /></th>
                                                <th><spring:message code="occasion.label" /></th>
                                                <th><spring:message code="slot.label" /></th>
                                                <th><spring:message code="order_status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                            	<%-- <th><spring:message code="order_id.label" /></th>
                                            	<th><spring:message code="table_number.label" /></th>
                                                <th><spring:message code="waiter_name.label" /></th>
                                                <th><spring:message code="order_date.label" /></th>
                                                <th><spring:message code="total_bill.label" /></th>
                                                <th><spring:message code="order_status.label" /></th>
                                                <th><spring:message code="action.label" /></th> --%>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:choose>
                                        	<c:when test="${!empty bookings}">
	                                           <c:forEach var="orderDetails" items="${bookings}">
	                                        	 <tr>
	                                        	 	<td>${orderDetails.slNo}</td>
	                                        	 	<td>${orderDetails.orderReference}</td>
	                                                <td>${orderDetails.mobileNumber}</td>
	                                                <td>${orderDetails.customerName}</td>
	                                                <td>${orderDetails.date}</td>
	                                                <td>${orderDetails.occasionDesc}</td>
	                                                <td>${orderDetails.slotId}</td>
	                                                 <td>${orderDetails.status}</td>
	                                            	<%-- <td>${orderDetails.orderReference}</td>
	                                                <td>${orderDetails.salesLocation}</td>
	                                                <td>${orderDetails.salesExecutive}</td>
	                                                <td>${orderDetails.dateStr}</td>
	                                                <td>${orderDetails.grandTotal}</td>
	                                                 <td>${orderDetails.status}</td> --%>
	                                            	<%--<c:choose> 
	 											  <c:when test="${orderDetails.status == 'pending'}">
	    												<td><a style="color:#2e7ea7 !important;" href="#" onclick="viewOrderDetails('${orderDetails.orderReference}','${orderDetails.orderType}');"><spring:message code="view.label"/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
													<a style="color:#2e7ea7 !important;" href="#" onclick="editOrder('${orderDetails.orderReference}','${orderDetails.orderType}');"><spring:message code="edit.label"/></a></td>
	                                          
	  												</c:when>
	  												<c:otherwise> --%>
	    												<td><a style="color:#2e7ea7 !important;" href="#" onclick="viewRestaurantBookingInfo('${orderDetails.orderReference}','${orderDetails.storeLocation}');"><spring:message code="view.label"/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
													</td>
	  											<%-- 	</c:otherwise>
												</c:choose> --%>
	                                            
	                                            </tr>
	                                             
	                                           </c:forEach>
                                        	
                                        	</c:when>
                                        	<c:otherwise>
                                        		<tr ><td colspan="7"><div style="color: black;text-align: center;">No Booking Records Found</div></td></tr>
                                        	
                                        	</c:otherwise>
                                        </c:choose>
                                           
                                        </tbody>
                                       
                                    </table>
                                    
                                      <div class="row">
                                      <%-- <c:if test="${index-1 == 0 && totalRecords >10}">onchange="viewBookingsByFilter('0',''); --%>
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index } - ${totalValue } of ${totalRecords } 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewRestaurantBookingsByFilter('${totalValue }','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
       				<div class="form-group col-lg-12" style="text-align: right;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewRestaurantBookingsByFilter('${index - 11 }','');"> ${index } - ${totalValue} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
	              		<input type="button" class='paginationButton' value="&#60;"> ${index } - ${totalValue } of ${totalRecords } 
	              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords }">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewRestaurantBookingsByFilter('${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords}
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewRestaurantBookingsByFilter('${totalValue}','')">
              		</div> 
              	</c:if>
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
</body>
</html>