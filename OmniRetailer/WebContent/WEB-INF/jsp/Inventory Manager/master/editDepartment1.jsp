<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/editDepartment.jsp
 * file type		        : JSP
 * */ -->


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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/department.js"></script>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
	<style type="text/css">
	.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
	</style>
	<script type="text/javascript">
$(document).ready(function(){
	setSubDepartmentDivContent();
	var subDept = $('input[type="radio"][name="subDepartments"]:checked').val();
	var id = $('input[type="radio"][name="subDepartments"]:checked').attr("id").replace('subDepartmentTD','');
	$("#subDeptName1").val(subDept);
	$("#subDeptDesc1").val($("#subDepartmentDescTD"+id).text());
}); 
	</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
             <h3><spring:message code="edit.department.master.label" /></h3>
        </div>
		 <form id="newDepartment">
            <div class="box-body">
            	<div class="row">
	              <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        	  <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
	            </div>
	            <div class="row">
	            	<div class=" col-md-12">
	            		 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="department.name.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" class="form-control"  readonly="readonly" id="deptName" value="${department.primaryDepartment}" placeholder="<spring:message code="enter.department.name.label" />" />
		                    <span id="deptNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-7">
		                   	<label><spring:message code="department.description.label" /></label>
		                    <input type="text" class="form-control"  id="deptDesc" value="${department.departmentDescription}" placeholder="<spring:message code="enter.department.description.label" />" />
		                    <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
						 <div class="subDept">
						 <%--  <div class="row">
						  		 <div class="form-group col-md-4">
				                   	<label><spring:message code="sub.department.name.label" /> <span style="color:red; font-size:2">*</span></label>
						  		 </div>
						  		 <div class="form-group col-md-7">
				                   	<label><spring:message code="sub.department.description.label" /></label>
						  		 </div>
						  		  <div class="form-group col-md-1">
							   </div>
						  </div> --%>
						  <div class="subDeptList">
						  	<div class="row">
			                   <div class="form-group col-md-4">
			                   <label><spring:message code="sub.department.name.label" /> <span style="color:red; font-size:2">*</span></label>
			                    <input type="text" class="form-control"  id="subDeptName1" value="" placeholder="<spring:message code="sub.department.name.label" />" />
			                    <span id="subDeptName1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							   </div>
							   <div class="form-group col-md-7">
							   <label><spring:message code="sub.department.description.label" /></label>
			                    <input type="text" class="form-control"  id="subDeptDesc1" value="" placeholder="<spring:message code="sub.department.description.label" />" />
			                    <span id="subDeptDesc1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							   </div>
							   <div class="form-group col-md-1">
							   		<br/>
							   		<img style="cursor: pointer;width: 23px;" onclick="appendSubDepartment();" alt="" src="${pageContext.request.contextPath}/images/addIcon.PNG">
							   		<img style="cursor: pointer;width: 23px;" id="img1" onclick="deleteSubDepartment(this);" alt="" src="${pageContext.request.contextPath}/images/deleteIcon.png">
							   </div>
						  	</div>
						  </div>
						</div>
				   </div>
				</div>
				 <div class="table-responsive col-md-11" style="padding: 0px;">
					 	<label><spring:message code="sub.departments.list.label" /></label>
					<div style="border: 1px solid #CCC;min-height: 40px;"> 	
					<table id="subDepartmentsList" class="table table-bordered table-hover" style="margin-bottom: 0px;">
						<tbody>
						<c:forEach var="subDept" items="${department.secondaryDepartments}" varStatus="theCount">
							<c:if test="${theCount.first}">
								<tr class="subDepartmentTR" id="subDepartmentTR${theCount.count}" ><td class="col-md-4" style="padding-left: 20px;"><input type="radio" style="vertical-align: -2px;" checked="checked" onclick="toggleRadio('update','edit');" name="subDepartments" id="subDepartmentTD${theCount.count}" value="${subDept.secondaryDepartment}">  ${subDept.secondaryDepartment}</td><td class="col-md-8" style="padding-left: 15px;" id="subDepartmentDescTD${theCount.count}">${subDept.departmentDescription}</td></tr>
							</c:if>
							<c:if test="${!theCount.first}">
								<tr class="subDepartmentTR" id="subDepartmentTR${theCount.count}" ><td class="col-md-4" style="padding-left: 20px;"><input type="radio" style="vertical-align: -2px;" onclick="toggleRadio('update','edit');" name="subDepartments" id="subDepartmentTD${theCount.count}" value="${subDept.secondaryDepartment}">  ${subDept.secondaryDepartment}</td><td class="col-md-8" style="padding-left: 15px;" id="subDepartmentDescTD${theCount.count}">${subDept.departmentDescription}</td></tr>
							</c:if>
						</c:forEach>
						</tbody>
          			</table>
          			</div>
				</div>
			<div class="row">
               <div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;">
                	<br>
                	<input type="hidden" id="desc"/>
                	<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="text-align:center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
					<div class="services">
			 			<div class="items">
			  				<ul class="matchedStringUl receipt" style=""></ul>
						</div>
					</div>
				<input type="hidden" id="desc">
                	<div id="triggerEvent"></div>
				</div>
                </div>
          
		  <div class="table-responsive" style="overflow: auto;max-height:300px;">
            <table id="productsList" class="table table-bordered table-hover">
              <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                	<%-- <th><spring:message code="s.no.label"/></th> --%>
                    <th><spring:message code="skuid.label"/></th>
                    <th><spring:message code="item.description.lable"/></th>
                    <th><spring:message code="uom.label"/></th>
                    <th><spring:message code="price.label"/></th>
                    <th><spring:message code="action.label"/></th>
               </tr>
              </thead>
			<tbody style="text-align: center;">
				<c:forEach var="skuDept" items="${skuDepartmentList}" varStatus="theCount">
					<tr id="dynamicdiv${theCount.count}" class='update' style='margin-top:5px;'>
						<td id="Name${theCount.count}">${skuDept.skuId}</td>
							<input type="hidden" id="skuId${theCount.count}" value="${skuDept.skuId}"/>
							<input type="hidden" id="subDept${theCount.count}" value="${skuDept.subDepartment}" />
						<td id="Desc${theCount.count}">${skuDept.description}</td>
						<c:choose>
							<c:when test="${empty skuDept.uom || skuDept.uom == ''}">
								<td id="UOM${theCount.count}">_</td>
							</c:when>
							<c:otherwise>
								<td id="UOM${theCount.count}">${skuDept.uom}</td>
							</c:otherwise>
						</c:choose>
					<td class='Price' id="Price${theCount.count}">${skuDept.price}</td>
					<td id="Del${theCount.count}"><img id="Img${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:25px;cursor:pointer;" onclick="deleteUpdateItem(this);" title="Delete ${skuDept.skuId}"/></td>
					</tr>
				</c:forEach>
			</tbody>
          </table>
          <br/>
        </div>		
		<div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<div class="buttons">
       		 <a onclick="validateDepartment('edit');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;</font></a>
       		  <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                  <c:if test="${accessControl.appDocument == 'Departments' && accessControl.write == true && accessControl.read == true}"> 
       		 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="viewDepartmentMaster('departmentMaster','0');" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
       		 	</c:if>
       		 </c:forEach>
         	</div>
        </div>
      </div>		
      </div>
   </form>
	</div>
  </div>
 </div>
</section>
</body>
</html>