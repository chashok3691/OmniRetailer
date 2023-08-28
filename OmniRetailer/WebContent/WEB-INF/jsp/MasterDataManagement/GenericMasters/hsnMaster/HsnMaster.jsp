<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home | OmniRetailer</title>

        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        
        <!-- DATA TABLES -->
      
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/hsnMaster.js"></script>
        

        
</head>
<body>
	<section class="content">
	<div class="row">
		<div class="col-lg-12 col-sm-12 col-xs-12">
			<div class="box box-primary" >
				<div class="row" style="padding:30px 20px">
				<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
             	<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
					<div class="col-lg-12">
						<div class="col-lg-10"
							style="background: #F0F8FF; padding: 10px 20px;">
							<div class="col-lg-12">
							<div class="col-lg-3">
								<label>HSN Code <span style="color:red; font-size:2">*</span></label> <input type="text" name="hsncode" id="hsncode"
								value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="hsncodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Chapter <span style="color:red; font-size:2">*</span></label> <input type="text" name="chapter"
									id="chapter" value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="chapterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Heading <span style="color:red; font-size:2">*</span></label> <input type="text" name="heading"
									id="heading" value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="headingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Tax Rate <span style="color:red; font-size:2">*</span></label> <input type="number" name="taxrate" id="taxrate"
									value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="taxrateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							</div>
							<div class="col-lg-12">
							<div class="col-lg-3">
								<label>Description <span style="color:red; font-size:2">*</span></label> <input type="text" name="Description"
									id="Description" onblur="criteriaSlashes(this)" value="" placeholder="" class="form-control">
									 <span id="DescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Section <span style="color:red; font-size:2">*</span></label><br> <input type="text"
									name="section" id="section" onblur="criteriaSlashes(this)" value="" placeholder=""  class="form-control">
									 <span id="sectionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Sub-Heading <span style="color:red; font-size:2">*</span></label> <input type="text" name="subheading"
									id="subheading" value="" onblur="criteriaSlashes(this)" placeholder=""  class="form-control">
									 <span id="subheadingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Tax Code <span style="color:red; font-size:2">*</span></label> 
								<!-- <input type="text" name="taxcode" id="taxcode"
									value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"> -->
									
									<select class="form-control" id="taxcode"> <!-- onclick="selectTaxCode();" -->
											<c:forEach var="tax" items="${taxDetails}" varStatus="theCount">
												<option value="${tax.taxName}" >${tax.taxName}</option>
											</c:forEach>
									</select>
									 <span id="taxcodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							</div>
						</div>
						<div class="col-lg-2"
							style="padding: 10px 20px; background-color: #DCDCDC" id="createHSN" >
							<div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom: 8px; width: 100%; margin-top: 16px;" onclick="validateHSNmaster('hsnMaster','new');">Add
									New</a>
							</div>
							<div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom:8px; width: 100%; margin-top: 0px;" onclick="clearAll();">Clear</a>
							</div>
						</div>
						
							<div class="col-lg-2"
							style="padding: 10px 20px; background-color: #DCDCDC;display:none;" id="updateHSN" >
							<div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom: 8px; width: 100%; margin-top: 16px;" onclick="validateHSNmaster('hsnMaster','edit');">
									Update</a>
							</div>
							<div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom:8px; width: 100%; margin-top: 0px;">Clear</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12" style="padding: 10px 20px">
						<div class="col-lg-1">
						<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewHSNMaster('hsnMaster','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>

							
						</div>
						<div class="col-lg-10 ">

							<input type="text" class="form-control" value="" style=""
								id="searchHSn" placeholder="search Hsn" />
							<button id="mySearch" class="searchbutton"></button>

							<input type="hidden" id="sku" value="">
						</div>
						<input type="hidden" id="updatebtn" value="">
						<%-- <input type="hidden" id="contextPath" value="${pageContext.request.contextPath}"/> --%>
						<div class="col-lg-1">
							<input type="button" style=""
								class="btn bg-olive btn-inline  addBtn" onclick="validateHSN('hsnmaster')"
								value="Delete">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12" style="padding-right:35px;padding-left:35px">
						<table id="example1" class="table table-bordered table-striped" >
							<thead style="background-color: #3c8dbc; color: #ffffff">
								<tr>


									<th style="" align="center"><input type='checkbox'
										name='selectall' onClick='selectAll(this)'></th>

									<th>SL No.</th>

									<th>Hsn Code</th>

									<th>Section</th>

									<th>Chapter</th>
									<th>Heading</th>

									<th>Sub-Heading</th>
									<th>Tax Rate</th>
									<th>Tax Code</th>
									<c:if test="${sessionScope.role == 'super admin'}"> 
									<th>Action</th>
									</c:if>
									 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         					<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true}"> 
									<th>Action</th>
									</c:if>
									</c:forEach>
								</tr>
								
								
							</thead>
							
							<tbody style="text-align: center;">
                   	<c:forEach var="hsnListdetails" items="${hsnList}" varStatus="theCount">
                       <tr>
                       <c:if test="${sessionScope.role == 'super admin'}"> 
                       		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${hsnListdetails.hsnCode}' /></td>
                       </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         				<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true}"> 
                       			<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${hsnListdetails.hsnCode}' /></td>
                       		</c:if>
                       	</c:forEach>
                       	
                       	
                       		<td>${theCount.index + index}</td>
                       		<td>${hsnListdetails.hsnCode}</td>
                       		<td>${hsnListdetails.sectionName}</td>
                       		<td>${hsnListdetails.chapterName}</td>
                       		<td>${hsnListdetails.headingsName}</td>
                       		<td>${hsnListdetails.subHeadingsName}</td>
                       		<td>${hsnListdetails.taxRate}</td>
                       		<td>${hsnListdetails.taxCode}</td>
                       		<td>
                       			<c:if test="${sessionScope.role == 'super admin'}"> 
                           		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return EditHsnDetails('${hsnListdetails.hsnCode}','${hsnListdetails.sectionName}','${hsnListdetails.chapterName}','${hsnListdetails.headingsName}','${hsnListdetails.subHeadingsName}','${hsnListdetails.taxCode}','${hsnListdetails.taxRate}','${hsnListdetails.comments}')">Edit</a>
                           	</c:if>
                           	 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         					<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true}"> 
                           			<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return EditHsnDetails('${hsnListdetails.hsnCode}','${hsnListdetails.sectionName}','${hsnListdetails.chapterName}','${hsnListdetails.headingsName}','${hsnListdetails.subHeadingsName}','${hsnListdetails.taxCode}','${hsnListdetails.taxRate}','${hsnListdetails.comments}')">Edit</a>
                           		</c:if>
                           	</c:forEach>
                       		
                       		
                       		</td>
							
							</tr>
							</c:forEach>
							
							
							</tbody>
						</table>
					</div>
				</div>
				          <div class="row">
        
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} -  ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewHSNMaster('hsnMaster','${index+maxRecords-1}','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewHSNMaster('hsnMaster','${index - maxRecords+1}','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewHSNMaster('hsnMaster','${index - maxRecords-1}','');"> ${index} -  ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewHSNMaster('hsnMaster','${index+maxRecords-1}','')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
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
              		  <input type="button" onclick="viewHSNMaster('hsnMaster',document.getElementById('pagination').value),'')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>  
			</div>
		</div>
	</div>
	
	<input type="hidden" id="deleteActionLabel" value="HSN code"/>
	
	</section>
</body>
</html>