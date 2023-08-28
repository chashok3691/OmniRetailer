<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newDepartment.jsp
 * file type		        : JSP
 * description				: The new Department is displayed using this jsp
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
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
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
}); 
	</script>
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	

	
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
		
		 <div class="box-header" align="center">
               <h3  class="box-title" style="border:1px solid #937c7c;padding:7px;font-weight: 600;"><spring:message code="new.department.master.label" /></h3>
           </div>
		
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
	            			<div class=" col-md-6 nopadding">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="department.name.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" 	 onblur="criteria(this)" class="form-control"  id="deptName" value="" placeholder="<spring:message code="enter.department.name.label" />" />
		                    <span id="deptNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-7">
		                   	<label><spring:message code="department.description.label" /></label>
		                    <input type="text" 	 onblur="criteria(this)" class="form-control"  id="deptDesc" value="" placeholder="<spring:message code="enter.department.description.label" />" />
		                    <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						    </div>
						       	<div class=" col-md-6 nopadding">
							    	<div class="form-group col-md-8">
							   </div>
			                   <div class="form-group col-md-4">
			                       <label><spring:message code="status.label" /></label>
			                      
									<div class="col-lg-12 nopadding" style="">
										<select class="form-control" name="status" id="status">
											<option value="Active">Active</option>
											<option value="InActive">InActive</option>
										
										</select>
									</div>
							   </div>
							   
							 
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
						  	<div class=" col-md-6 nopadding">
			                   <div class="form-group col-md-4">
			                   <label><spring:message code="sub.department.name.label" /> <span style="color:red; font-size:2">*</span></label>
			                    <input type="text" 	 onblur="criteria(this)" class="form-control"  id="subDeptName1" value="" placeholder="<spring:message code="sub.department.name.label" />" />
			                    <span id="subDeptName1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							   </div>
							   <div class="form-group col-md-7">
							   <label><spring:message code="sub.department.description.label" /></label>
			                    <input type="text" 	 onblur="criteria(this)"  class="form-control"  id="subDeptDesc1" value="" placeholder="<spring:message code="sub.department.description.label" />" />
			                    <span id="subDeptDesc1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							   </div>
							   <div class="form-group col-md-1 nopadding">
							   		<br/>
							   		<img style="cursor: pointer;width: 23px;" onclick="appendSubDepartment();" alt="" src="${pageContext.request.contextPath}/images/addIcon.PNG">
<%-- 							   		<img style="cursor: pointer;width: 23px;" id="img1" onclick="deleteSubDepartment(this);" alt="" src="${pageContext.request.contextPath}/images/deleteIcon.png">
 --%>							   </div>
							    </div>
							 
						  	</div>
						  </div>
						</div>
				   </div>
				</div>
					<div class="row">
					
				 <div class="table-responsive col-md-6 nopadding" style="">
				  <div class="form-group col-md-11">
					 	<label><spring:message code="sub.departments.list.label" /></label>
					<div style="border: 1px solid #CCC;min-height: 40px;"> 	
					<table id="subDepartmentsList" class="table table-bordered table-hover" style="margin-bottom: 0px;">
						<tbody>
						<!-- <tr><td class="col-md-4"><input type="checkbox" style="vertical-align: -2px;">  ABC</td><td class="col-md-7" style="padding-left: 15px;">gshghg</td></tr> -->
						</tbody>
          			</table>
          			</div>
				</div>
				 <div class="form-group col-md-1 nopadding" style="padding-top: 1%;">
							   		<br/>
<%-- 							   		<img style="cursor: pointer;width: 23px;" onclick="appendSubDepartment();" alt="" src="${pageContext.request.contextPath}/images/addIcon.PNG">
 --%>							   		<img style="cursor: pointer;width: 23px;" id="img1" onclick="deleteSubDepartment(this);" alt="" src="${pageContext.request.contextPath}/images/deleteIcon.png">
							   </div>
				</div>
				
							   </div>
			<div class="row">
               <div class="form-group col-lg-9" style="text-align:center;  margin-bottom: 0.3%;">
				<br>
                	<input type="hidden" id="desc"/>
                	<input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style=""  />
					<div class="services">
			 			<div class="items">
			  				<ul class="matchedStringUl receipt" style=""></ul>
						</div>
					</div>
				<input type="hidden" id="desc">
                	<div id="triggerEvent"></div>
				</div>
				
								<div class="col-lg-2 col-xs-2" style="margin-top: 18px;">
								
									<input type="file" class="btn bg-olive btn-inline"
										accept=".xlsx" id="fileUploadCSV"
										onchange="addNameToTextBoxGRN('fileUploadCSV')"
										style="padding: 4px 0px;width: 100%;" />
								</div>
								<div class="col-lg-1 col-xs-2" style="padding-left: 0px;margin-top: 18px;">
    					<input type="button"  class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelDataForGRN(this,'edit')" style="padding: 5px 8px;width: 100%;margin-left: -12px;" />
						</div>
                </div>
          
		  <div class="table-responsive" style="overflow: auto;max-height:300px;">
            <table id="productsList" class="table table-bordered table-hover">
              <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                	<th><spring:message code="s.no.label"/></th>
                    <th><spring:message code="skuid.label"/></th>
                    <th><spring:message code="item.description.lable"/></th>
                    <th><spring:message code="uom.label"/></th>
                    <th><spring:message code="color.label"/></th>
                    <th><spring:message code="size.label"/></th>
                    <th><spring:message code="utility.label"/></th>
                    <th><spring:message code="costprice.label"/></th>
                    
                    <th><spring:message code="price.label"/></th>
                    <th><spring:message code="action.label"/></th>
               </tr>
              </thead>
			<tbody style="text-align: center;"></tbody>
          </table>
          <br/>
        </div>		
		<div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<div class="buttons">
           	<input type="button" style="" class="btnCls" onclick="validateDepartment('new');" value="<spring:message code="submit.label" />" />
       		 <%-- <a onclick="validateDepartment('new');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;</font></a> --%>
       		  <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                  <c:if test="${accessControl.appDocument == 'Departments' && accessControl.write == true && accessControl.read == true}"> 
       		 	
       		 	  <input type="button" class="btnCls buttonMargin" onclick="return viewDepartmentMaster('departmentMaster','0');" value="<spring:message code="cancel.label" />" />
       		 		<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="viewDepartmentMaster('departmentMaster','0');" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a> --%>
       		 	  </c:if>
       		 </c:forEach>
         	</div>
        </div>
      </div>		
      <br>
      </div>
      
      
      <input type="hidden" value="${maxRecords}" id="maxRecords"/>
         <input type="hidden" value="${searchName}" id="searchDepartment"/>

   </form>
	</div>
  </div>
 </div>
</section>
</body>
</html>