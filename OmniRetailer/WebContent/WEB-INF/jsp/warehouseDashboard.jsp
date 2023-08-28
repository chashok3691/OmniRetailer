<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya P
 * file name		        : dashboard.jsp
 * file path                : jsp/outletDashboard.jsp
 * file type		        : JSP
 * description				: The outlet dashboard is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	<title>Omni Retailer Customer - Dashboard</title>
	  
	
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!--  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> -->
        <%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script> --%>
	 <!-- Morris.js charts -->
     <%--    <script src="${pageContext.request.contextPath}/js/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js" type="text/javascript"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.js"></script>	
	<script src="${pageContext.request.contextPath}/js/d3.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
       <script src="${pageContext.request.contextPath}/js/outletDashboard.js" type="text/javascript"></script>
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style type="text/css">
.box-header{
	padding: 0px !important;
}
#ion-bag {
	top: -5px;
}

#ion-bag:hover {
	top: -10px;
}

text {
	size: 5px !important;
	
}
.p0_segmentPercentage-inner{
	fill: rgb(255, 255, 255) !important;
}
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 4%;
	margin-top: 1%;
}

a.button,.list a.button {
	position: relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow: 1px 0px 2px #000;
	cursor: pointer;
	behavior: url(css/PIE.htc);
}

.bg-aqua,.callout.callout-info,.alert-info,.label-info,.modal-info .modal-body
	{
	background-color: #2e7ea7 !important;
}

.calendar_icon {
	background-color: white;
	color: #666;
	padding: 8px 0px 8px 27px !important;
	background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat
		left center #fff;
	width: 100%;
	background-position: 5px 8px;
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

/* #TurnOverPieChart {
	height: 360px !important;
	width: 360px !important;
} */
</style>
<script type="text/javascript">
$(document).ready(function(){

});

</script>
</head>
<body>
                      

	
		<%-- <section class="content-header">
                    <h1>
                        <spring:message code="dashboard.label" />
                        <small><spring:message code="controlPanel.label" /></small>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a style="cursor: pointer;"><i class="fa fa-dashboard"></i> <spring:message code="home.label" /></a></li>
                    <li class="active"><spring:message code="dashboard.label" /></li>
                    </ol>
                </section>
 --%>
                <!-- Main content -->
                <section class="content" style="background: #FFF none repeat scroll 0px 0px;">
                
                <div class="row">
                  <div class="form-group col-lg-4">
                    <label><spring:message code="location.label" /></label>
                     <select class="form-control" name="location" id="location" onchange="return showOutletDashboard(document.getElementById('location').value,document.getElementById('category').value,document.getElementById('searchCriteria').value,document.getElementById('stocksCategory').value);">
                      <c:forEach var="location" items="${workLocationsList}">
            	        <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
 	                  </c:forEach>
 	                 </select>
                 </div>
                  <div class="form-group col-lg-4">
                     <label><spring:message code="criteria.label" /></label>
                     <select class="form-control" name="searchCriteria" id="searchCriteria" onchange="return showOutletDashboard(document.getElementById('location').value,document.getElementById('category').value,document.getElementById('searchCriteria').value,document.getElementById('stocksCategory').value);">
            	        <option value="week" ${'week' == selectedCriteria ? 'selected' : ''}>Weekly</option>
            	        <option value="month" ${'month' == selectedCriteria ? 'selected' : ''}>Monthly</option>
 	                 </select>
                  </div>
                 <div class="form-group col-lg-4">
                 	<label><spring:message code="date.label" /></label>
                    <!-- <div class="input-group">
                    <div class="input-group-addon" onclick="callCalender('dob')">
                        <i class="fa fa-calendar"></i>
                    </div> -->
                    <!-- <input type="text" name="dateOfBirth" id="dob" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                    <input class="form-control calendar_icon" readonly="readonly" value="${selectedDate}" style="background-color: white;" id="selectedDate" size="20" type="text" onfocus="callCalender('selectedDate')" onclick="callCalender('selectedDate')" placeholder="DD/MM/YYYY"/>
                    <input type="hidden" id="prevDate" value="${selectedDate}">
                 </div>
                </div>
                <div class="row">
				  <div class="form-group col-lg-4" style="padding-left: 0px;padding-right: 0px;">
				    <!-- <div class="box box-primary"> -->
                      <div class="box-header" style="position: absolute;padding-left: 10px !important;">
                        <i class="fa fa-cart-plus"></i>
                        <h3 class="box-title"><spring:message code="weekly_orders.label"/><label>&nbsp;&nbsp;</label><c:out value="${empty ordersObj.totalOrders ? 0 : ordersObj.totalOrders}"></c:out></h3>
                      </div><!-- /.box-header -->
                      <div class="box-body" id="canvas-holder">
                       <c:choose>
                        <c:when test="${not empty ordersObj}">
                         <%--  <canvas id="OrdersPieChart" height="300" width="300"></canvas> --%>
                          <div id="OrdersPieChart" d3pie="0.1.6" style="margin-left: -30px;margin-top: -45px;margin-bottom: -25px;"></div>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Orders Foud
                        	</div>
      						<%-- <div class="alert alert-info alert-dismissable">
                    				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    				<h4><i class="icon fa fa-info"></i><spring:message code="no_records_found.label"/></h4>
                  			</div> --%>
                  			<%-- <span class="text-red" style="text-align: center;"><spring:message code="no_records_found.label"/></span> --%>
         				</c:otherwise>
    				  </c:choose>
                     </div><!-- /.box-body -->
                    <!-- </div> -->
				  </div>
				  
				  <div class="form-group col-lg-4">
				 <!--    <div class="box box-primary"> -->
                      <div class="box-header">
                        <i class="fa fa-line-chart"></i>
                        <h3 class="box-title"><spring:message code="weekly_sales.label"/></h3>
                        <br>
                        <!-- <div class="box-tools pull-right"> -->
                    <div>
                     <select class="form-control" name="category" id="category" onchange="return showOutletSales(document.getElementById('location').value,document.getElementById('searchCriteria').value,document.getElementById('category').value);">
                      <c:forEach var="category" items="${categoriesList}">
            	        <%-- <option value="${category}" ${category == selectedCategory ? 'selected' : ''}>${category}</option> --%>
            	        <option value="${category.categoryName}" ${category.categoryName == selectedCategory ? 'selected' : ''}>${category.categoryDescription}</option>
 	                  </c:forEach>
 	                 </select>
                        </div>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                      <c:choose>
                        <c:when test="${not empty salesObj}">
                        <canvas id="SalesLineChart" height="300" width="350"></canvas>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Sales Foud
                        	</div>
      						<%-- <div class="alert alert-info alert-dismissable">
                    				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    				<h4><i class="icon fa fa-info"></i><spring:message code="no_records_found.label"/></h4>
                  			</div> --%>
                  			<%-- <span class="text-red" style="text-align: center;"><spring:message code="no_records_found.label"/></span> --%>
         				</c:otherwise>
    				  </c:choose>
                      </div><!-- /.box-body -->
                    <!-- </div> -->
				  </div>
				  
				   <div class="form-group col-lg-4">
				 <!--    <div class="box box-primary"> -->
                       <div class="box-header">
                        <i class="fa fa-cubes"></i>
                        <h3 class="box-title"><spring:message code="weekly_stocks.label"/></h3>
                        <br>
                      <!--   <div class="box-tools pull-right">  -->
                     <div>
                     <select class="form-control" name="category" id="stocksCategory" onchange="return showOutletStocks(document.getElementById('location').value,document.getElementById('searchCriteria').value,document.getElementById('stocksCategory').value);">
                      <c:forEach var="category" items="${categoriesList}">
                      	<option value="${category.categoryName}" ${category.categoryName == selectedCategory ? 'selected' : ''}>${category.categoryDescription}</option>
            	        <%-- <option value="${category}" ${category == selectedstockCategory ? 'selected' : ''}>${category}</option> --%>
 	                  </c:forEach>
 	                 </select>
                        </div>
                        </div>
                      <div class="box-body">
                      <c:choose>
                        <c:when test="${not empty stocksObj}">
                        	<canvas id="stocksLineChart" height="300 !important;" width="350  !important;"></canvas>
                        	
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Stocks Foud
                        	</div>
      						<%-- <div class="alert alert-info alert-dismissable">
                    				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    				<h4><i class="icon fa fa-info"></i><spring:message code="no_records_found.label"/></h4>
                  			</div> --%>
         				</c:otherwise>
    				  </c:choose>
                      </div><!-- /.box-body -->
				  </div>
			</div>	  
			<div class="row">
			<div class="form-group col-lg-1"></div>
				  <div class="form-group col-lg-4" style="padding-left: 0px;padding-right: 0px;">
				    <!-- <div class="box box-primary"> -->
                      <div class="box-header" style="position: absolute;">
                        <i class="fa fa-history"></i>
                        <h3 class="box-title"><spring:message code="turnover.label"/><label>&nbsp;&nbsp;</label></h3>
                      </div><!-- /.box-header -->
                      <!-- <div class="box-body" id="canvas-holder"> -->
                       <c:choose>
                        <c:when test="${not empty turnOverObj}">
                          <%-- <canvas id="TurnOverPieChart" height="455" width="455" style=""></canvas> --%>
                           <div id="TurnOverPieChart" d3pie="0.1.6"></div>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Turn Over Foud
                        	</div>
      						<%-- <div class="alert alert-info alert-dismissable">
                    				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    				<h4><i class="icon fa fa-info"></i><spring:message code="no_records_found.label"/></h4>
                  			</div> --%>
                  			<%-- <span class="text-red" style="text-align: center;"><spring:message code="no_records_found.label"/></span> --%>
         				</c:otherwise>
    				  </c:choose>
                     <!-- </div> --><!-- /.box-body -->
                    <!-- </div> -->
				  </div>
				  <div class="form-group col-lg-2"></div>
				  <div class="form-group col-lg-4" style="padding-left: 0px;padding-right: 0px;">
				    <!-- <div class="box box-primary"> -->
                      <div class="box-header" style="position: absolute;">
                        <i class="fa fa-recycle"></i>
                        <h3 class="box-title"><spring:message code="wastage.label"/><label>&nbsp;&nbsp;</label></h3>
                      </div><!-- /.box-header -->
                      <!-- <div class="box-body" id="canvas-holder"> -->
                       <c:choose>
                        <c:when test="${not empty wastageDashboardBeanObj}">
                          <%-- <canvas id="WastagePieChart" height="350" width="350"></canvas> --%>
                          <div id="WastagePieChart" d3pie="0.1.6"></div>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Wastages Foud
                        	</div>
      						<%-- <div class="alert alert-info alert-dismissable">
                    				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    				<h4><i class="icon fa fa-info"></i><spring:message code="no_records_found.label"/></h4>
                  			</div> --%>
                  			<%-- <span class="text-red" style="text-align: center;"><spring:message code="no_records_found.label"/></span> --%>
         				</c:otherwise>
    				  </c:choose>
                    <!--  </div> --><!-- /.box-body -->
                    <!-- </div> -->
				  </div>
			</div>	
	</section>	
 <script>
        $(document).ready(function() {
        	if($("#ordersObj").val()!="" && $("#OrdersPieChart").length > 0){
        		new d3pie("OrdersPieChart", {
    				data: {
    					content: getOrderPieChartData()
    				},
    		    	tooltips: {
	    		        enabled: true,
	    		        type: "placeholder",
	    		        string: "{label}: {percentage}% ({value})",
	    		        placeholderParser: function(index, data) {
	    		          data.label = data.label + "!";
	    		          data.percentage = data.percentage.toFixed(2);
	    		          data.value = data.value.toFixed(5);
	    		        }
	    		    }
    			});
        	}
        //	  new Chart(document.getElementById("OrdersPieChart").getContext("2d")).Pie(orderPieChartData,newopts);
        	if($("#salesObj").val()!="" && $("#SalesLineChart").length > 0)
        	  new Chart(document.getElementById("SalesLineChart").getContext("2d")).Line(getSalesLineChartData(),newopts);
            if($("#stocksObj").val()!="" && $("#stocksLineChart").length > 0)
              new Chart(document.getElementById("stocksLineChart").getContext("2d")).Line(getStocksLineChartData(),newopts);
           /*  if($("#turnOverObj").val()!="" && $("#TurnOverPieChart").length > 0)
          	  new Chart(document.getElementById("TurnOverPieChart").getContext("2d")).Pie(getturnOverPieChartData(),newopts1); */
            if($("#turnOverObj").val()!="" && $("#TurnOverPieChart").length > 0){
   			 new d3pie("TurnOverPieChart", {
   				data: {
   					content: getturnOverPieChartContent()
   				},
   		    	tooltips: {
	    		        enabled: true,
	    		        type: "placeholder",
	    		        string: "{label}: {percentage}% ({value})",
	    		        placeholderParser: function(index, data) {
	    		          data.label = data.label + "!";
	    		          data.percentage = data.percentage.toFixed(2);
	    		          data.value = data.value.toFixed(5);
	    		        }
	    		    }
   			});
   		   }
          	if($("#wastageDashboardBeanObj").val()!="" && $("#WastagePieChart").length > 0){
              new d3pie("WastagePieChart", {
    				data: {
    					content: getWastagePieChartDta()
    				},
    		    	tooltips: {
	    		        enabled: true,
	    		        type: "placeholder",
	    		        string: "{label}: {percentage}% ({value})",
	    		        placeholderParser: function(index, data) {
	    		          data.label = data.label + "!";
	    		          data.percentage = data.percentage.toFixed(2);
	    		          data.value = data.value.toFixed(5);
	    		        }
	    		    }
    			});
            }
          	//  new Chart(document.getElementById("WastagePieChart").getContext("2d")).Pie(wastagePieChartData,newopts);
           
            callCalender('selectedDate');
         });
        
       </script>
     
    <!--  <script>
     $(document).ready(function() {
     if($("#turnOverObj").val()!="" && $("#TurnOverPieChart").length > 0){
    	 	alert("hi");
			var pie = new d3pie("pie", {
				data: {
					content: getturnOverPieChartContent()
						 /*  [
						{ label: "Elephants", value: 1 },
						{ label: "Motmots", value: 2 },
						{ label: "Pikas", value: 3 },
		        { label: "Jays", value: 2 },
		        { label: "Rhubarb", value: 5 },
		        { label: "Tennis", value: 2 },
		        { label: "Chickens", value: 1 }
					]  */
				},
				 labels: {
    		         inner: {
    		          format: "none"
    		        },
    		    	outer: {
	    		        format: "none"
	    		    }
    		      },
		    tooltips: {
		      enabled: true,
		      type: "placeholder",
		      string: "{label}: {percentage}%",
		      styles: {
		        fadeInSpeed: 500,
		        backgroundColor: "rgba(0, 0, 0, 0.8)",
		        backgroundOpacity: 0.8,
		        color: "#ffffcc",
		        borderRadius: 4,
		        font: "inherit",
		        fontSize: 12,
		        padding: 5
		      }
		    }
			});
		   }
     });
</script>     -->
       
<input type="hidden" value="${ordersObj.onlineCount}" id="onlineOrder"/>
<input type="hidden" value="${ordersObj.phoneCount}" id="phoneOrder"/>
<input type="hidden" value="${ordersObj.directCount}" id="directOrder"/>
<input type="hidden" value="${ordersObj.salesExecutiveCount}" id="salesExecutiveOrder"/>
<input type="hidden" value="${ordersObj}" id="ordersObj"/>
<input type="hidden" value="${salesObj}" id="salesObj"/>
<input type="hidden" value="${stocksObj}" id="stocksObj"/>
<input type="hidden" value='${turnOverObj}' id="turnOverObj"/>
<input type="hidden" value="${wastageDashboardBeanObj}" id="wastageDashboardBeanObj"/>
<input type="hidden" value="${wastageDashboardBeanObj.perishedStockAmount}" id="perishedStockAmount"/>
<input type="hidden" value="${wastageDashboardBeanObj.damagedStockAmount}" id="damagedStockAmount"/>
<input type="hidden" value="${wastageDashboardBeanObj.expiredStockAmount}" id="expiredStockAmount"/>
<input type="hidden" value="${wastageDashboardBeanObj.theftStockAmount}" id="theftStockAmount"/>
<input type="hidden" value="${wastageDashboardBeanObj.totalWastageAmount}" id="totalWastageAmount"/>
    </body>
</html>

 
