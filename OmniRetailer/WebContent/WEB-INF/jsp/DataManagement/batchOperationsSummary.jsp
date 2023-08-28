<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manoj...
 * file name		        : jsp/bachOperations.jsp
 * file type		        : JSP
 * description				: display Batch Operations information
 * */ -->


    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Batch Operations | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
		 <script type="text/javascript" src="${pageContext.request.contextPath}/js/dataManagement/batchOperation.js"></script>

<style type="text/css">


</style> 

 <script type="text/javascript">
$(document).ready(function(){
	debugger;
	var err = $("#err").val();
	if(err != "")
	$('#Success').val(err);
	///  alert(err);
	
		$('#searchBatches').on('input',function(e){
			if($(this).val().trim()==""){
				viewBatchOperationsFlow('BatchOperations','0');
			}
		});
		
		$('#mySearch').click(function(){
		    var search = $('#searchBatches').val();
		    return viewBatchOperationsFlow('BatchOperations','0');
		})
		$('#searchBatches').keypress(function(e){
		    if(e.which == 13){//Enter key pressed
		        $('#mySearch').click();//Trigger search button click event
		    }
		});	
		
		
	});


</script> 
</head>
<body>
<!-- Main content -->
<section class="content">

 <div class="row">
 	<div class="col-xs-12">
 		<div class="box box-primary">
 		
 			<div class="box-header">
 				<div class="form-group col-lg-12" style="text-align: center;">
 				<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">Batch Operations</h3>
 				</div>
 			
 			</div><!-- box-header -->
 			<div class="box-body">
 			<div id="Success" class="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
 			<div class="row" style="margin-left: 0%;margin-right: 0%">
 			
 			<div class="row" style="margin-left: 0px; margin-right: 0px;">
 				<div class="row">
 				<div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewBatchOperationsFlow('BatchOperations','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				 </div>
				                      
				    <div class="col-lg-9 col-xs-6">
		        	 		<div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="${searchName}" id="searchBatches" placeholder="Search Batches " />
							<button id="mySearch" class="searchbutton"></button>
							
							</div>
								<input type="hidden" id="searchName" value="${searchName}">
		        	 	</div>
					
					 			<%-- <c:if test="${sessionScope.role == 'super admin'}"> --%> 
								<div class="col-lg-1 col-xs-2" style="padding-left: 5px;padding-right:5px;height: 20px;">
									<a onclick="return viewNewBatchOperation();" style="padding: 4px 8px;width: 100%;"  class="btn bg-olive btn-inline" ><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								</div>
								
					    		<div class="col-lg-1 col-xs-2" style="padding-left: 0px;height: 20px;">
									<a onclick="return validate('BatchOperations');" style="padding: 4px 8px; width: 100%;"  class="btn bg-olive btn-inline" ><font size="2px"><spring:message code="delete.label" /></font></a>
								</div>
                      			<%-- </c:if>   --%>
		               	
 				
 				</div>
 				
		<div id="example1_wrapper" class="table table-bordered table-striped" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;"> 				
			
			<table id="batchTable" class="table table-bordered table-striped">
							<thead style="background-color: #3c8dbc; color: #ffffff">
								 <tr> 
								      <c:if test="${sessionScope.role == 'super admin'}"> 
								   		<th style="width: 40px" align="center"><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
								    </c:if>  
								  <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                            		<c:if test="${accessControl.appDocument == 'BatchOperations' && accessControl.write == true}">
										 <th style="width: 40px" align="center"><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> 
									 </c:if>
								</c:forEach>  
									<th><div><spring:message code="sl.no.label" /></div></th>
									<th>Batch ID</th>
									<th>Batch Name</th>
									<th>Created Date</th>
									<th>Period Type</th>
									<th>Batch Time</th>
									<th>Status</th> 
									<th><spring:message code="EmployeeForm.action" /></th>
								 </tr> 
							</thead>
							<tbody style="text-align: center;">
								<c:forEach var="batchList" items="${batchOperationsList}" varStatus="thecount">
									<tr>
									   <c:if test="${sessionScope.role == 'super admin'}"> 
									 	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${batchList.batch_id }" /></td>
									  </c:if> 
									   <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                           				<c:if test="${accessControl.appDocument == 'BatchOperations' && accessControl.write == true}"> 
											<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${batchList.batch_id }" /></td>
										</c:if>
									</c:forEach>   
										<td>${thecount.index+index}</td>
										<td>${batchList.batch_id}</td>
										<td>${batchList.batch_title}</td>
										<td>${batchList.createOnStr}</td>
										<td>${batchList.batch_period}</td>
										<td>${batchList.batchTimeStr}</td>
										<td>${batchList.status}</td> 
										<td>
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditBatchOperation('${batchList.batch_id}','view')">View</a>&nbsp;&nbsp;&nbsp;
										  <c:if test="${sessionScope.role == 'super admin'}">  
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditBatchOperation('${batchList.batch_id}','edit')">Edit</a>
										  </c:if>  
										  <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                            				<c:if test="${accessControl.appDocument == 'BatchOperations' && accessControl.write == true}"> 
												<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditBatchOperation('${batchList.batch_id}','edit')">Edit</a>
											</c:if>
										</c:forEach> 
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
 				</div>
 				
 				
 				<div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBatchOperationsFlow('BatchOperations','${totalValue}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBatchOperationsFlow('BatchOperations','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBatchOperationsFlow('BatchOperations','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBatchOperationsFlow('BatchOperations','${totalValue}');">
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
              		<div class="col-lg-2 col-xs-4" style="padding-right: 0px;"> 
              		  <input type="button" onclick="viewBatchOperationsFlow('BatchOperations',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>
              
 				</div>
 			</div>
 			</div><!-- box-body -->
 			<input type="hidden" id="err" value="${err}" />
 		</div>
 	</div>
 </div>

</section><!-- Main content -->
</body>
</html>