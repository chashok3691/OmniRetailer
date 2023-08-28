<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Inventory Manager/Reports/salesReportsCategoryWise.jsp
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
         <!-- InputMask -->
        <%-- <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script> --%>
        
<script type="text/javascript">

	$(document).ready(function(){
		// callCalenderYYYYMMDD('date');
		callCalender('startDate');
		callCalender('endDate');
		
		 /* var zone = $("#outletZone").val();
		 if( zone != null && zone !="")
			 {
			 	searchlocationsBasedOnZoneForDashboard('outletZone','location','');
			 } */
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

</style>
    </head>
<body>
<div id="gensalereportcriteriawise">
				<section class="content-header">
                    <h1>
                       <c:if test = "${flowLocation ==''}">
                       <spring:message code="outlet_management.reports.label"/>
                       </c:if>
                       <c:if test = "${flowLocation !=''}">
                      <spring:message code="warehouse_management.reports.label"/> 
                      </c:if>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;<spring:message code="category.wise.label"/>&nbsp;<spring:message code="report.label"/>
                    </h1>
                   <%--  <ol class="breadcrumb">
                        <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showReportsFlows();"><spring:message code="reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletReportsFlows();"><spring:message code="outlet_management.reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletSalesReportsFlows();"><spring:message code="sales.reports.label"/></a></li>
                        <li class="active"><spring:message code="xreading.reports.label"/></li>
                    </ol> --%>
                </section>
                
                         <!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body">  
       <div class="col-lg-12">
         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchZonallocationsBasedOnZone('outletZone','location','${flowLocation}')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="businessarea.label"/></label>
                           <select class="form-control" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                        </select>
                      </div>
                      </div>
                    
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" onchange="searchSectionsBasedOnSubCategory('productCategory','outletSubcategory', 'section');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
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
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" onchange="searchCategorybasedonlocation('location','productCategory','');">
<%--                            		 <option value="all"><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${workLocationsList}">
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
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="productCategory" onchange="searchSubCategories('productCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="section.label"/></label>
                           <select class="form-control" id="section" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2" style="display:none;">
                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          
	                        </select>
                      </div>
                      </div>
                      
            <div class="col-lg1-2 col-lg-2">
	            
               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 <label>Sales Channel</label>
	             <select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
                    	<option value=""><spring:message code="ALL.label"/></option>
							<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
							<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
							<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
							<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
                 </select>
          
                      </div>
                      </div>
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="generateSalesReportCriteriaWise('${criteria}','','0','NOPOP','${flowLocation}');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
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
														onclick="generateSalesReportCriteriaWise('${criteria}','','0','','${flowLocation}');;"
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
       
       
       <div class="col-lg-12">
			                <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn nopadding">
			               
			                	<img class="summaryImg" style="float: right;width: 35%;" src="${pageContext.request.contextPath}/images/summary.png" onclick="getreportsummary('category')" style="cursor: pointer;" >
			              
			                </div>
			          </div>
         <%-- <div class="row">
         <div class="form-group col-lg-3">
         <label><spring:message code="location.label" /></label>
            <select class="form-control" name="location" id="location">
               <c:forEach var="location" items="${workLocationsList}">
            	 <option value="${location}">${location}</option>
 	           </c:forEach>
 	        </select>
         </div>
         <div class="form-group col-lg-2">
         	<label><spring:message code="product.category.label" /></label>
           	  <select id="productCategory" name ="productCategory" class="form-control" >
           	  	<option value="" >ALL</option>
           	  	 <c:forEach var="category" items="${categories}">
           	  	 
					<option value="${category}">${category}</option>
				 </c:forEach>
			  </select>
            <label><spring:message code="location.label" /></label>
            <select class="form-control" name="location" id="location">
               <c:forEach var="location" items="${workLocationsList}">
            	 <option value="${location}">${location}</option>
 	           </c:forEach>
 	        </select>
          </div>
           <div class="form-group col-lg-1"></div>
          <div class="form-group col-lg-2">
            <label><spring:message code="billing_counter.label" /></label>
            <select class="form-control" name="counter" id="counter">
               <c:forEach var="counter" items="${countersList}">
            	 <option value="${counter}">${counter}</option>
 	           </c:forEach>
            </select>
            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            <label><spring:message code="offer_start_date.label" /></label>
            <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
             <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
          <div class="form-group col-lg-1"></div>
          <div class="form-group col-lg-2">
           	 <label><spring:message code="offer_end_date.label" /></label>
             <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="endDate" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
             <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
            <div class="form-group col-lg-1"></div>
         </div> --%>
          <br/>
        <%--  <div class="row" style="text-align: center;">
		   <input type="button" class="btn bg-olive btn-inline" onclick="generateSalesReportCriteriaWise('${criteria}','','0');" style="" value="<spring:message code="generate.report.label" />" />
		 </div> --%>
		  <%--  <div class="col-lg-12" style="text-align: right;margin-top: 17px">
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="" value="<spring:message code="save.label" />" />
		 </div> --%>
		 
		 <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align: center;"><div id="locationLable"></div><div id="dateLable"></div></h4>
        </div>
        <div class="modal-body">
        <div class="box-body table-responsive" id="summary">
                  
                     <%-- <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table> --%>
                
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
       
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="generateSalesReportCriteriaWise('${criteria}','save','0','','${flowLocation}');"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>  </div>
   <br/>
   
        </div></div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
		 <input type="hidden" id="criteria" value="${criteria}">
          <div id="xReportsDisplay" style="">
            <%@ include file="viewCategoriesReport.jsp" %>
          </div>
      </div>
    </div>
  </div>
</div>
</section><!-- /.content -->
</div>
</body>
</html>