<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%--  <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
	 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> 
	 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/shiftAllocation.js"></script>
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	 
	
	
	<style type="text/css">
	tbody{
		overflow: auto;
		max-height:300px;
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
	</style>
	<script type="text/javascript">
	$(document).ready(function(){	
//		callCalender('startDate');
	//	callCalender('endDate');
		//selectDays();
		//$("#productsList tbody").html("");
		$('.odd').remove();
	});
	</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                           <div class="box-header" style="text-align: center">
                           <h3><spring:message code="new.shift.allocation.label" /></h3>
                           </div><!-- /.box-header -->
                           <!-- form start -->
                           <form id="newShiftAllocation" method="post">
                               <div class="box-body">
                               <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -10px">${err}</div>
	        				   <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -10px">${success}</div>
                              	<div class="row">
                              	 <div class="form-group col-lg-3">
                                       <label><spring:message code="shift.location.label" /> <span style="color:red; font-size:2">*</span></label>
                                        <select class="form-control" name="shiftLocation" id="shiftLocation" onchange="getShiftIds('location')">
                                            <c:forEach var="location" items="${workLocationsList}">
                                            <c:if test="${flowUnder == 'warehouse' }">
												<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											</c:if>
											  <c:if test="${flowUnder != 'warehouse' }">
											   <c:if test="${location.businessActivity != 'Warehouse' }">
												<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											</c:if>
											</c:if>
											</c:forEach>
                                        </select>
                                       <span id="shiftLocationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   </div>
                               	 <div class="form-group col-lg-3">
                                       <label><spring:message code="shift.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                       <select class="form-control" name="shiftId" id="shiftId" onchange="getShiftIds('shiftId')">
                                         <c:forEach var="shift" items="${shifts}">
										   <option value="${shift.shiftId}">${shift.shiftId}</option>
										 </c:forEach>
                                       </select>
                                    <span id="shiftIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   </div>
									<div class="form-group col-lg-3">
                                       <label><spring:message code="shift.name.label" /></label>
                                       <input type="text" class="form-control" name="shiftName" id="shiftName" value="${shiftMasterDetailsObj.shiftName}" readonly="readonly" />
                                   </div>
                                  <input type="hidden" id="shiftStartDate" value="${shiftMasterDetailsObj.start_date}">
                                  <input type="hidden" id="shiftEndDate" value="${shiftMasterDetailsObj.end_date}">
                                  <input type="hidden" id="shiftWeekDays" value="${shiftMasterDetailsObj.weekDays}">
                                     <div class="form-group col-lg-3">
                                       <label><spring:message code="shift.department.label" /> <span style="color:red; font-size:2">*</span></label>
                                       <!-- <input type="text" class="form-control" name="shiftDepartment" id="shiftDepartment" required /> -->
                                        <select class="form-control" name="shiftDepartment" id="shiftDepartment">
                                             <c:forEach var="department" items="${departmentList}">
												<option value="${department}">${department}</option>
											</c:forEach>
                                           </select>
                                       <span id="shiftDepartmentError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                   </div>
                                   </div>
                                   <div class="row">
                                    <div class="col-lg-3"></div>
                                    <div class="form-group col-lg-6">
                                    	<input type="hidden" id="desc"/>
                                    	<label><spring:message code="search.employee.label" /></label>
                                    	<input type="text"  onblur="criteria(this)" class="form-control searchItems searchBar" id="searchEmployee"  placeholder="<spring:message code="search.employee.label" />"  "  />
										<div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl employee" style=""></ul>
							   				</div>
										</div>
									 </div>
                                    <div class="col-lg-3">
                                    <div id="triggerEvent"></div>
                                    </div>
                                   </div>
                              	<div class="table-responsive" style="">
                                   <table id="productsList" class="table table-bordered table-hover">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                       <tr>
                                       	<th><spring:message code="emp.id.label"/></th>
                                           <th><div style="width: 70px;"><spring:message code="emp.name.label"/></div></th>
                                           <th><spring:message code="EmployeeForm.designation"/></th>
                                           <th><spring:message code="EmployeeForm.department"/></th>
                                           <th><spring:message code="deal_start_date.label"/></th>
                                           <th><spring:message code="deal_end_date.label"/></th>
                                           <th><spring:message code="days.label"/></th>
                                           <th><spring:message code="action.label"/></th>
                                      </tr>
                                     </thead>
                       				<tbody style="text-align: center;">
                       				
                       				<c:forEach var="shift" items="${shiftAllocation.shiftAllocationList}" varStatus="theCount">
                         <tr id="dynamicdiv${theCount.count}">
                            <td id="empId${theCount.count}">${shift.empId}</td>
                            <td id="empName${theCount.count}">${shift.empName}</td>
                            <td id="empDesg${theCount.count}">${shift.empDesignation}</td>
                            <td id="empDept${theCount.count}">${shift.empDepartment}</td>
                            <td><input class="form-control calendar_icon startDate" value="${shift.start_Date}" readonly="readonly" style="width:100px;background-color: white;" id="empStartDate${theCount.count}" onfocus="callCalender('empStartDate${theCount.count}')" onclick="callCalender('empStartDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/></td>
                            <td><input class="form-control calendar_icon endDate" value="${shift.end_Date}" readonly="readonly" style="width:100px;background-color: white;" id="empEndDate${theCount.count}" onfocus="callCalender('empEndDate${theCount.count}')" onclick="callCalender('empEndDate${theCount.count}')" type="text" placeholder="DD/MM/YYYY" /></td>
                            <td><div style="width: 355px;">
                            	<c:if test="${shift.day1Flag == true}">
	                            	<input type="checkbox" id="sun${teCount.count}" checked="checked" style="vertical-align: -2px" class="sun">Sun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day1Flag == false}">
	                            	<input type="checkbox" id="sun${teCount.count}" style="vertical-align: -2px" class="sun">Sun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day2Flag == true}">
                            		<input type="checkbox" id="mon${theCount.count}" checked="checked" style="vertical-align: -2px" class="mon">Mon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day2Flag == false}">
                            		<input type="checkbox" id="mon${theCount.count}" style="vertical-align: -2px" class="mon">Mon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day3Flag == true}">
                            		<input type="checkbox" id="tue${theCount.count}" checked="checked" style="vertical-align: -2px" class="tue">Tue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day3Flag == false}">
                            		<input type="checkbox" id="tue${theCount.count}" style="vertical-align: -2px" class="tue">Tue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day4Flag == true}">
                            		<input type="checkbox" id="wed${theCount.count}" checked="checked" style="vertical-align: -2px" class="wed">Wed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day4Flag == false}">
                            		<input type="checkbox" id="wed${theCount.count}" style="vertical-align: -2px" class="wed">Wed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>	
                            	<c:if test="${shift.day5Flag == true}">
                            		<input type="checkbox" id="thu${theCount.count}" checked="checked" style="vertical-align: -2px" class="thu">Thu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day5Flag == false}">
                            		<input type="checkbox" id="thu${theCount.count}" style="vertical-align: -2px" class="thu">Thu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day6Flag == true}">
                            		<input type="checkbox" id="fri${theCount.count}" checked="checked" style="vertical-align: -2px" class="fri">Fri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day6Flag == false}">
                            		<input type="checkbox" id="fri${theCount.count}" style="vertical-align: -2px" class="fri">Fri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${shift.day7Flag == true}">
                            		<input type="checkbox" id="sat${theCount.count}" checked="checked" style="vertical-align: -2px" class="sat">Sat
                            	</c:if>
                            	<c:if test="${shift.day7Flag == false}">
                            		<input type="checkbox" id="sat${theCount.count}" style="vertical-align: -2px" class="sat">Sat
                            	</c:if>
                            </div></td>
                            <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:30px;cursor:pointer;" onclick="deleteItem(this);" title="Delete ${shift.empId}" />
                         </tr>
                        </c:forEach> 
                       				
                        			</tbody>
                                 </table>
                                 <br/>
                               </div>
                               
                                               <input type="hidden" id="flowUnder" value="${flowUnder}">
                               
				<div class="row" style="text-align: center;">
				 <input type="button" style="" class="btnCls" onclick="validateShiftAllocation('new')" value="<spring:message code="submit.label" />" />
				  <c:if test="${sessionScope.role == 'super admin'}"> 
				  	<input type="button" class="btnCls buttonMargin"  onclick="viewShiftAllocationMaster('${flowUnder}shiftConfiguration','0','${flowUnder}')" value="<spring:message code="cancel.label" />" />
				  </c:if>
				  
				  <input type="button" class="btnCls buttonMargin"  onclick="viewShiftAllocationMaster('${flowUnder}shiftConfiguration','0','${flowUnder}')" value="<spring:message code="cancel.label" />" />
				  
				  <%--  <c:if test="${flowUnder == 'outlet'}">
                  <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
                  	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true && accessControl.read == true}"> 	
						<input type="button" class="btnCls buttonMargin"  onclick="viewShiftAllocationMaster('${flowUnder}shiftConfiguration','0','${flowUnder}')" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
				</c:if>
				
				 <c:if test="${flowUnder == 'warehouse'}">
				 <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
                  	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true && accessControl.read == true}"> 	
						<input type="button" class="btnCls buttonMargin"  onclick="viewShiftAllocationMaster('${flowunder}shiftConfiguration','0')" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
				</c:if> --%>
				
				</div>
				<br/>
               <div class="box-footer"></div>
               </div>
           </form>
       </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>