<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya P
 * file name		        : dashboard.jsp
 * file path                : jsp/outletDashboard.jsp
 * file type		        : JSP
 * description				: The outlet dashboard is displayed using this jsp
 * 
 */ -->


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
.allignment{
     width: 13.3%;
    margin-right: 0px;
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

a.buttonsearch{
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 26px 10px;
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
a.button-go
{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 3px 12px 20px 9px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 0px;
    height: 24px;
    text-align: center;
    margin-bottom: 0px;
    width: 133%;
    margin-left: 21px;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
    height: 24px;
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px !important;
    }
   .form-group {
    margin-bottom: 10px;
}




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
.talkbubble {
     width: 50px;
    height: 25px;
    position: relative;
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
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
.chart-container {
  width:100%;
  height:50%;
  border: 1px dotted silver;
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
.go-Select-Button{
      height: 24px;
    border-color: black;
    padding: 0px 6px;
    margin: 0px;
    width: 130%;
    }
.label-warning {
    background-color: #a3a3a3;
    font-size: 13px;
    width:100%;
}

.select-fontsize
{
    width: 75%;
    font-style: unset;
    font-size: 14px;
    font-weight: 600;
    margin-top: 4px;
}


.product-list-in-box > .item{
    padding-top: 5px;
    padding-bottom: 5px;
}
/* @media (min-width:1200px) and (max-width:1300px)
{
   #pieChart{
	   	height: 225px !important;
	    width: 170% !important;
   		margin-left: -35% !important;
   }
   #TurnOverPieChart
   {
   		height: 225px !important;
	    width: 170% !important;
   		margin-left: -35% !important;
   }
}  */
#pieChart
{
	height: 225px !important;
    width: 170% !important;
    margin-left: -35% !important;
}
#TurnOverPieChart
{
	height: 225px !important;
    width: 170% !important;
    margin-left: -35% !important;
}
#SalesLineChart
{
	height: 225px !important;
	width: 100% !important;
}
#stocksLineChart
{
	height: 225px !important;
	width: 100% !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
//	$("#tab1").addClass("active");
	callCalender('fromBoard');
	callCalender('to');
	
	var zone = $("#outletZone").val();
	//var flowUnder = $("#flowUnder").val();
 	var location = $("#outletLocationBoard").val();
	if( zone != null && zone !="" && location!= null && location == "")
	{
		searchlocationsBasedOnZoneForDashboard('outletZone','outletLocationBoard','');
	}
	
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
                
           <%--      <div class="row" style="    margin-right: 0px; border: 1px solid #ccc;margin-left: 0px;">
                  <div class="form-group col-lg-3">
                    <label><spring:message code="location.label" /></label>
                     <select class="form-control" name="location" id="location" onchange="return showOutletDashboard(document.getElementById('location').value,document.getElementById('category').value,document.getElementById('searchCriteriaorder').value,document.getElementById('stocksCategory').value);">
                     <option value="all">All Locations</option>
                      <c:forEach var="location" items="${workLocationsList}">
            	        <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
 	                  </c:forEach>
 	                 </select>
                 </div>
                 <div class="form-group col-lg-1"></div>
                  <div class="form-group col-lg-3">
                     <label><spring:message code="zone.label" /></label>
                     <select class="form-control" name="searchCriteria" id="searchCriteria" >
            	        <c:forEach var="location" items="${workLocationsList}">
            	        <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
 	                  </c:forEach>
 	                 </select>
                  </div>
                 <div class="form-group col-lg-4" style="display:none">
                 	<label><spring:message code="date.label" /></label>
                    <!-- <div class="input-group">
                    <div class="input-group-addon" onclick="callCalender('dob')">
                        <i class="fa fa-calendar"></i>
                    </div> -->
                    <!-- <input type="text" name="dateOfBirth" id="dob" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                    <input class="form-control calendar_icon" readonly="readonly" value="${selectedDate}" style="background-color: white;" id="selectedDate" size="20" type="text" onfocus="callCalender('selectedDate')" onclick="callCalender('selectedDate')" placeholder="DD/MM/YYYY"/>
                    <input type="hidden" id="prevDate" value="${selectedDate}">
                 </div>
                </div> --%>
                
                
                <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="padding: 9px 20px;    background: #eee;    width: 88%;">
                  <div class="row">
                         <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocationBoard','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == selectedLocation ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId')" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       
                         <div class="col-lg-2">
                            <label>Time Cycle</label>
                            
               <select class="form-control form-group" name="searchCriteriaorder" id="searchCriteria">
                		<option value=""><spring:message code="ALL.label"/></option>
            	        <option value="week" ${'week' == selectedCriteria ? 'selected' : ''}>Weekly</option>
            	        <option value="month" ${'month' == selectedCriteria ? 'selected' : ''}>Monthly</option>
 	                 </select>
	            </div>
	                <div class="col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 <input class="form-control calendar_icon form-group" readonly="readonly" value="${startDate}" style="background-color: white;" id="fromBoard" size="20" type="text" onfocus="callCalender('fromBoard')" onclick="callCalender('fromBoard')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                             <select class="form-control" id="outletLocationBoard" onchange="searchCategorybasedonlocation('outletLocationBoard','outletCategory','outletBrandId');">
	                            <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${workLocationsList}">
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		
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
                   
                       <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subCategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
                       <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == suppliername ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
                        <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == subDepartment ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
               
		               <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletModelId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                        </select>
                      </div>
                      </div>
                          <div class="col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          
                    </div>
                  </div>
                  <div class="col-lg-1" style="padding-right:15px;    background: #eee;    border-right: 1px solid #ccc;    width: 12%;">
                  <div class="col-lg-12" style="">
                  <div class="row">
                  <a onclick="showOutletDashboard('','','','');" class="buttonsearch"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="buttonsearch"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
                <br>
             
                <c:if test="${not empty monthly && monthly != 0}">
                 <div class="form-group col-lg-12" style="padding:0px;">
                        <div class="form-group col-lg-6" >
              
                   </div>
                       
                <div class="form-group col-lg-6" style="text-align:right;padding:0px;">
                  <div class="col-lg-10 select-fontsize">
               Month 1 0f ${monthly}
                 </div>
                  <div class="form-group col-lg-1" style="padding:0px;">
                    <select class="form-control go-Select-Button" id="monthId">
                           	  
	                            <c:forEach var="month" begin = "1" end = "${monthly}">
									<option value="${month}"id="" >${month}</option>
						 		</c:forEach>
	                        </select>
	                        </div>
          
             <div class="form-group col-lg-1" style="padding:0px;">
                  <a onclick="" class="button-go"><spring:message code="go.label"/></a>
					</div>
					</div> 
					   </div>
					</c:if>
              
              
              
<%--                 <c:if test="${not empty monthly}"> --%>
<%--                 month 1 0f ${monthly} --%>
                
<!--                     <select class="form-control" id="monthId" > -->
                           	
<%-- 	                            <c:forEach var="month" begin = "1" end = "${monthly}"> --%>
<%-- 									<option value="${month}"id="" >${month}</option> --%>
<%-- 						 		</c:forEach> --%>
<!-- 	                        </select> -->
              
<%-- 				</c:if> --%>
				              <%--  <c:if test="${not empty weekly && weekly != 0}">
                 <div class="form-group col-lg-12" style="padding:0px;">
                        <div class="form-group col-lg-6" >
              
                   </div>
                       
                <div class="form-group col-lg-6" style="text-align:right;padding:0px;">
                  <div class="col-lg-10 select-fontsize">
               Week 1 0f ${weekly}
                 </div>
                  <div class="form-group col-lg-1" style="padding:0px;">
                    <select class="form-control go-Select-Button" id="weekId">
                           	  
	                            <c:forEach var="week" begin = "1" end = "${weekly}">
									<option value="${week}"id="" >${week}</option>
						 		</c:forEach>
	                        </select>
	                        </div>
          
             <div class="form-group col-lg-1" style="padding:0px;">
                  <a onclick="" class="button-go"><spring:message code="go.label"/></a>
					</div>
					</div> 
					   </div>
					</c:if>
              
                   <br> --%>
                   <br>
                <div class="box-footer" style="">
                
                
              <div class="row">
                <div class="col-sm-3 col-xs-6" style="background-color: #2484c173;">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> ${dashboardinfo.totalSoldQty}</span>
                    <h5 class="description-header">${dashboardinfo.totalSoldValue}</h5>
                    <span class="description-text">TOTAL REVENUE <span style="text-transform: none;font-size: 12px;">(Exclusive of taxes)</span></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6" style="background-color: #65a620a6;">
                  <div class="description-block border-right">
                    <span class="description-percentage text-yellow"><i class="fa fa-caret-left"></i> ${dashboardinfo.procQty}</span>
                    <h5 class="description-header">${dashboardinfo.procCost}</h5>
                    <span class="description-text">TOTAL COST</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
               
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6" style="background-color: #2484c173;">
                  <div class="description-block">
                    <span class="description-percentage text-red"><i class="fa fa-caret-down"></i> ${dashboardinfo.dumpQty}</span>
                    <h5 class="description-header">${dashboardinfo.dumpCost}</h5>
                    <span class="description-text">DUMP COST</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                 <div class="col-sm-3 col-xs-6" style="background-color: #65a620a6;">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> ${dashboardinfo.marginPer}</span>
                    <h5 class="description-header">${dashboardinfo.marginValue}</h5>
                    <span class="description-text">TOTAL PROFIT</span>
                  </div>
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
            </div>
                
                  <div class="row">
				  <div class="form-group col-lg-4" style="">
                
                <div class="box box-primary ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Top 10 Profitable  Products</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">
              <ul class="products-list product-list-in-box">
              <c:forEach  begin="0" end="9" varStatus="status" var="profitableproducts" items="${dashboardinfo.reportsList}">
                <li class="item">
                
                 <%--  <div class="product-info" style="margin-left: 15px;">
                    <a href="javascript:void(0)" class="product-title">${profitableproducts.itemDesc}
                      <span class="label label-warning pull-right">${profitableproducts.marginvalue}</span></a>
                    <span class="product-description">
                         
                        </span>
                  </div> --%>
                  
                  <div class="row">
                <div class="col-lg-12">
                  <div class="product-info col-lg-8" style="margin-left: 0px;">
                    <a href="javascript:void(0)" class="product-title">${profitableproducts.itemDesc}</a>
                    </div>
                    <div class="product-info col-lg-4" style="margin-left: 0px;">
                       <a href="javascript:void(0)" class="product-title"> <span class="label label-warning pull-right">${profitableproducts.marginvalue}</span></a>
<!-- 					<div class="col-lg-12"><hr></div> -->
<!--                     <span class="product-description"> -->
                          
<!--                         </span> -->
                  </div>
                  </div>
                  </div>
                </li>
            </c:forEach>
                <!-- /.item -->
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
                
                </div>
                
                	  <div class="form-group col-lg-4" style="">
                
                <div class="box box-primary ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Top 10 Loss  Products</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa  fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">
              <ul class="products-list product-list-in-box">
              <c:forEach begin="0" end="9" varStatus="status" var="loass" items="${dashboardinfo.lossableList}">
                <li class="item">
                
                 <%--  <div class="product-info" style="margin-left: 15px;">
                    <a href="javascript:void(0)" class="product-title">${loass.itemDesc}
                      <span class="label label-warning pull-right">${loass.cost}</span></a>
                    <span class="product-description">
                        
                        </span>
                  </div> --%>
                      <div class="row">
                <div class="col-lg-12">
                  <div class="product-info col-lg-8" style="margin-left: 0px;">
                    <a href="javascript:void(0)" class="product-title">${loass.itemDesc}</a>
                    </div>
                    <div class="product-info col-lg-4" style="margin-left: 0px;">
                       <a href="javascript:void(0)" class="product-title"> <span class="label label-warning pull-right">${loass.cost}</span></a>
                    <span class="product-description">
                          
                        </span>
                  </div>
                  </div>
                  </div>
                </li>
            </c:forEach>
                <!-- /.item -->
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
                
                </div>
                
                
                
                	  <div class="form-group col-lg-4" style="">
                
                <div class="box box-primary ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Top 10 Damaged  Products</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">
              <ul class="products-list product-list-in-box">
              <c:forEach  begin="0" end="9" varStatus="status" var="profitableproducts" items="${dashboardinfo.profitableitemsList}">
                <li class="item">
                <div class="row">
                <div class="col-lg-12">
                  <div class="product-info col-lg-8" style="margin-left: 0px;">
                    <a href="javascript:void(0)" class="product-title">${profitableproducts.skuDescription}</a>
                    </div>
                    <div class="product-info col-lg-4" style="margin-left: 0px;">
                       <a href="javascript:void(0)" class="product-title"> <span class="label label-warning pull-right">${profitableproducts.dumpCost}</span></a>
                    <span class="product-description">
                          
                        </span>
                  </div>
                  </div>
                  </div>
                </li>
            </c:forEach>
                <!-- /.item -->
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
                
                </div>
                </div>
                
                <div class="row">
				  <div class="form-group col-lg-6" style="">
				  <div class="box ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Omni Retailer Sales Orders</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="row">
                <div class="col-md-7">
                  <div class="chart-responsive" >
                   <c:choose>
                        <c:when test="${not empty ordersObj && ((ordersObj.creditbills !=0)||(ordersObj.returnedbills !=0)||(ordersObj.exchangedbills !=0)||(ordersObj.completedbills !=0))}">
                         <%--  <canvas id="OrdersPieChart" height="300" width="300"></canvas> margin-left: -50%;style="height: 265px; width: 530px;" width="530" height="265"--%>
                          <canvas id="pieChart" style="height: 265px; width: 530px;" width="530" height="265"></canvas>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Orders Found
                        	</div>
      						</c:otherwise>
    				  </c:choose>
                  </div>
                  <!-- ./chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-5">
                  <ul class="chart-legend clearfix">
                  
                  
                <li><i class="fa fa-circle" style="color:#00a65a !important"></i>Sales Bills = ${ordersObj.completedbills}</li>
                  <li><i class="fa fa-circle" style="color:#f39c12 !important"></i>Return Bills = ${ordersObj.returnedbills}</li>
                  <li><i class="fa fa-circle" style="color:#f56954 !important"></i>Cancelled Bills = ${ordersObj.cancelledbills}</li>
                  <li><i class="fa fa-circle" style="color:#ffffff !important"></i>Void Bills = ${ordersObj.voidBills}</li>
                  <li><i class="fa fa-circle" style="color:#00c0ef !important"></i>Credit Bills = ${ordersObj.creditbills}</li>
                
                
                  </ul>
                   <div class="col-lg-10" style="margin-right: auto;background-color:#EEEEEE;margin-top: 10px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 5px;font-size:14pt;padding-bottom: 10px;padding-left: 20px;color:solid black;" ">
           <label style="width: 50%">Total :</label><label style="width: 50%;text-align: center;" id="totalSalesvalue">${ordersObj.completedbills+ordersObj.returnedbills+ordersObj.cancelledbills+ordersObj.voidBills+ordersObj.creditbills}</label>
           </div>
                </div>
                <!-- /.col -->
              </div>
                      
            </div>
            <!-- /.box-body -->
          </div>
				  </div>
				  
				  
				   <div class="form-group col-lg-6" style="">
				  <div class="box ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Product Categories vs Turnovers Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            
            <div class="box-body">
              <div class="row">
                <div class="col-md-7">
                  <div class="chart-responsive">
                     <c:choose>
                        <c:when test="${not empty ordersObj && ((ordersObj.creditbills !=0)||(ordersObj.returnedbills !=0)||(ordersObj.exchangedbills !=0)||(ordersObj.completedbills !=0))}">
                         <%--  <canvas id="OrdersPieChart" height="300" width="300"></canvas> margin-left: -50%;--%>
                        
                          <canvas id="TurnOverPieChart" style="height: 265px; width: 530px;" width="530" height="265"></canvas>
                          
                        </c:when>                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Orders Found
                        	</div>
      						</c:otherwise>
    				  </c:choose>
                  </div>
                  <!-- ./chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-5">
                  <ul class="chart-legend clearfix chart-legend-category">
                    <!-- <li><i class="fa fa-circle-o text-red"></i> Chrome</li>
                    <li><i class="fa fa-circle-o text-green"></i> IE</li>
                    <li><i class="fa fa-circle-o text-yellow"></i> FireFox</li>
                    <li><i class="fa fa-circle-o text-aqua"></i> Safari</li>
                    <li><i class="fa fa-circle-o text-light-blue"></i> Opera</li>
                    <li><i class="fa fa-circle-o text-gray"></i> Navigator</li> -->
                  </ul>
                  <div class="col-lg-12" style="float:right;margin-left: 100px;margin-right: auto;background-color:#EEEEEE;margin-top: 10px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color:#EEEEEE;padding-top: 5px;font-size:14pt;padding-bottom: 10px;padding-left: 20px;color:solid black;" ">
          <label style="width: 50%">Total :</label><label style="width: 50%;text-align: center;" id="totalturnover"></label>
           </div>
                </div>
                <!-- /.col -->
              </div>
                      
            </div>
            <!-- /.box-body -->
          </div>
				  </div>
				  
				  
				  
				  
				  
				  		  
				   <div class="form-group col-lg-6" style="">
				  <div class="box ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Sales Turnovers Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              
                       <c:choose>
                            <c:when test="${not empty salesObj}">
                        
                        <div class="chart">
                <canvas id="SalesLineChart" style="height: 230px; width: 510px;" width="510" height="230"></canvas>
              </div>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Orders Found
                        	</div>
      						</c:otherwise>
    				  </c:choose>
            </div>
            <!-- /.box-body -->
          </div>
				  </div>
				  
				  
				  
				  	   <div class="form-group col-lg-6" style="">
				  <div class="box ">
            <div class="box-header with-border" style="padding: 10px !important;">
              <h3 class="box-title">Stocks Movement Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              
                       <c:choose>
                            <c:when test="${not empty stocksObj}">
                        
                        <div class="chart">
                <canvas id="stocksLineChart" style="height: 230px; width: 510px;" width="510" height="230"></canvas>
              </div>
                        </c:when>
                        <c:otherwise>
                        	<div style="text-align: center" >
                        	<img alt="" style="width: 50px; margin-top: 60px;" src="${pageContext.request.contextPath}/images/icon_error.png"><br>
                        		No Orders Found
                        	</div>
      						</c:otherwise>
    				  </c:choose>
            </div>
            <!-- /.box-body -->
          </div>
				  </div>
				  
				
			</div>	  
	
		
	</section>	
 <script>
        $(document).ready(function() {
        	
        
        	try{
        	if($("#ordersObj").val()!="" && $("#pieChart").length > 0){
        		 var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        		    var pieChart       = new Chart(pieChartCanvas)
        		 var completed = $("#completed").val();
        		 var cancelled = $("#cancelled").val();
        		 var returned = $("#returned").val();
        		 var exchanged = $("#exchanged").val();
        		 var credit = $("#credit").val();
        		   var PieData        = [
        		                         {
        		                           value    : parseInt(completed),
        		                           color    : '#00a65a',
        		                           highlight: '#00a65a',
        		                           label    : 'Chrome'
        		                         },
        		                         {
        		                           value    : parseInt(cancelled),
        		                           color    : '#f56954',
        		                           highlight: '#f56954',
        		                           label    : 'IE'
        		                         },
        		                         {
        		                           value    : parseInt(returned),
        		                           color    : '#f39c12',
        		                           highlight: '#f39c12',
        		                           label    : 'FireFox'
        		                         },
        		                         {
        		                           value    : parseInt(credit),
        		                           color    : '#00c0ef',
        		                           highlight: '#00c0ef',
        		                           label    : 'Safari'
        		                         },
        		                         {
        		                           value    : parseInt(exchanged),
        		                           color    : '#3c8dbc',
        		                           highlight: '#3c8dbc',
        		                           label    : 'Opera'
        		                         }
        		                       ]
        		 
        		    //Create pie or douhnut chart
        		    // You can switch between pie and douhnut using the method below.
        		    pieChart.Doughnut(PieData, pieOptions)
        		
        
        	}
        }
  	  catch(e)
  	  {
  
  		  console.log(e);
  	  }
       
        try{
        if($("#salesObj").val()!=""){
            var barChartCanvas                   = $('#SalesLineChart').get(0).getContext('2d')
            var barChart                         = new Chart(barChartCanvas)
            var barChartData                     = getSalesLineChartData()
            barChartOptions.datasetFill = false
    		barChart.Bar(barChartData, barChartOptions)
     		
        } 
        }
    	  catch(e)
    	  {
    
    		  console.log(e);
    	  }
    	  try{
        	  if($("#turnOverObj").val()!="" ){
          		 var pieChartCanvas1 = $('#TurnOverPieChart').get(0).getContext('2d')
     		    var pieChart1       = new Chart(pieChartCanvas1)
          		pieChart1.Doughnut(getturnOverPieChartContent(), pieOptions)
             }
        }
  	  catch(e)
  	  {
  
  		  console.log(e);
  	  }
        try{	  
        if($("#stocksObj").val()!=""){
            var barChartCanvas                   = $('#stocksLineChart').get(0).getContext('2d')
            var barChart                         = new Chart(barChartCanvas)
            var barChartData                     = getStocksLineChartData()
            barChartOptions.datasetFill = false
    		barChart.Bar(barChartData, barChartOptions)
     		
        }
        }
  	  catch(e)
  	  {
  
  		  console.log(e);
  	  }
        
    
         });
</script>
       
<input type="hidden" value="${ordersObj.onlineCount}" id="onlineOrder"/>
<input type="hidden" value="${ordersObj.phoneCount}" id="phoneOrder"/>
<input type="hidden" value="${ordersObj.directCount}" id="directOrder"/>
<input type="hidden" value="${ordersObj.salesExecutiveCount}" id="salesExecutiveOrder"/>
<input type="hidden" value="${ordersObj.completedbills}" id="completed"/>
<input type="hidden" value="${ordersObj.cancelledbills}" id="cancelled"/>
<input type="hidden" value="${ordersObj.returnedbills}" id="returned"/>
<input type="hidden" value="${ordersObj.exchangedbills}" id="exchanged"/>
<input type="hidden" value="${ordersObj.creditbills}" id="credit"/>
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

 
