<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Akhil M
 * Created Date             : 4th Nov,2018.
 * file name		        : /jsp/CRM/CustomerViewAndNoification/customerGroup.jsp
 * file type		        : JSP
 * description				: The Customer Group Master table is displayed using this jsp.
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
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script src="${pageContext.request.contextPath}/js/crm/customerGroup.js"></script>
        
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin:3px 0px 2px;
	/* margin-right: 2%;
	margin-top:1%; */
}
.col-lg1-2{
    width: 25% !important;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
  </style>     
    <script type="text/javascript">
$(document).ready(function(){
 var err = $("#err").val();
if(err != "")
  alert(err);
callCalender('from');
callCalender('to');
  
$('#mySearch').click(function(){
    var search = $('#searchCustomerGroup').val();
    return viewCustomerGroupMaster('customerGroupMaster','0');
})
 $('#searchCustomerGroup').keyup(function(e){
	 
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
     else if(e.which == 8){ //backspace key pressed
    	 if($('#searchCustomerGroup').val()=="")
    	 $('#mySearch').click();//Trigger search 
    }
   });
});
</script>  

</head>
<body>

<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
              <div class="box-header" align="center">
                  <h3 class="box-title"><spring:message code="customerGroups.label" /></h3>
              </div><!-- /.box-header -->
              
              
              <div class="box-body table-responsive">
               <div class="row" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
         </div>
              
              <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
              <form id="xReportsDisplay">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                     <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 <!--            <label><spring:message code="customerCategory.label" /></label>
                           <select id="customerCategory"  class="form-control clearError" >
                           		<option value="">ALL</option>
		                	  	<option value="BASIC" ${customerCategory == 'BASIC' ? 'selected' : ''}>BASIC</option>
		                	  	<option value="GENERIC" ${customerCategory == 'GENERIC' ? 'selected' : ''}>GENERIC</option>
		                	  	<option value="PLUS" ${customerCategory == 'PLUS' ? 'selected' : ''}>PLUS</option>
		                	  	<option value="PREMIUM" ${customerCategory == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
							    <option value="SILVER" ${customerCategory == "SILVER" ? 'selected' : ''}>SILVER</option>
								<option value="GOLD" ${customerCategory == "GOLD" ? 'selected' : ''}>GOLD</option>
							    <option value="PLATINUM" ${customerCategory == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
							    <option value="EMPLOYEE PREMIUM" ${customerCategory == "EMPLOYEE PREMIUM" ? 'selected' : ''}>EMPLOYEE PREMIUM</option>
							   <option value="EMPLOYEE GENERIC" ${customerCategory == "EMPLOYEE GENERIC" ? 'selected' : ''}>EMPLOYEE GENERIC</option>
							    <option value="MEMBERSHIP SILVER" ${customerCategory == "MEMBERSHIP SILVER" ? 'selected' : ''}>MEMBERSHIP SILVER</option>
							    <option value="MEMBERSHIP PLATINUM" ${customerCategory == "MEMBERSHIP PLATINUM" ? 'selected' : ''}>MEMBERSHIP PLATINUM</option>
							   <option value="MEMBERSHIP GOLD" ${customerCategory == "MEMBERSHIP GOLD" ? 'selected' : ''}>MEMBERSHIP GOLD</option>
							</select> -->
                      </div> 
                      </div>
                    
                    <div class="col-lg1-2 col-lg-2">
                      
                      </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
	               		         <c:choose>
							      <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}</option>
							      </c:when>
							      <c:otherwise>
							      <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							     </c:otherwise>
							     </c:choose>
<%-- 							          <option value="${location}" ${location == storeLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					         </c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                  
                      </div>
                      
                       <div class="col-lg1-2 col-lg-3 form-group">
                      
                      </div>
                      
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                  <div class="row">
                  <a onclick="viewCustomerGroupMaster('customerGroup',0)" class="btn bg-olive btn-inline" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                  
                  <div class="col-lg-12">
                  <br>
                  </div>
                  
               <div class="row">
               <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewCustomerGroupMaster('customerGroup','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      
				                      
				              <div class="col-lg-8">
	                            <input type="text"  class="form-control" value="${searchName}" id="searchCustomerGroup" placeholder="<spring:message code="search.customerGroup.label" />" />
                                 <button id="mySearch" class="searchbutton" style="margin-right: 14px;"></button>
							      <input type="hidden" id="searchName" value="${searchName}">
			                  </div> 
			                  
			                  
			         <!--           <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
								<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true}"> -->
                                          <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newCustomerGroupMaster();" value="<spring:message code="addnew.label" />">
								           </div>
								          
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return downloadCustomerReport(this);" value="<spring:message code="save.label" />">
								           </div>
								           
								           
								        <!--    <input type="hidden" id="stockType" value="${stockType}">  --> 
                     
                       <input type="hidden" id="saveCustomerGroup" value="false">
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
								           
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('customerGroup');" value="<spring:message code="delete.label" />">
								           </div>
					 <!--  		  </c:if>
						     </c:forEach>        -->   
				                      
				           </div>           
				                    
				                    
				                    
				                    
				   <table id="example1" class="table table-bordered table-striped" style="">
                     <thead style="background-color: #3c8dbc; color: #ffffff">
                          <tr>
                                
                                 <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
								  	<c:if test="${accessControl.appDocument == 'CustomerGroupMaster' && accessControl.write == true}"> 
                                  		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick=''></th>
                                  	</c:if> 
                                  </c:forEach>
                                  <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'>
                                  	 <th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 98px;">
                                              <div style="">SL No.</div></th>
                                      <th><spring:message code="groupid.label" /></th>
                                      <th><spring:message code="groupdescription.label" /></th>
                                       <th><spring:message code="groupcategory.label" /></th>
                                       <th><spring:message code="location.label" /></th>
                                      <th><spring:message code="start.date.label" /></th>
                                      <th><spring:message code="end.date.label" /></th>
                                       <th><spring:message code="EmployeeForm.action" /></th>
                                  </tr>
                              </thead>
                              
                           <tbody style="text-align: center;">
                                 <c:forEach var="customerGroup" items="${groupsList}">
                                  <tr>
                                   
                                    <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${customerGroup.group_id}' /></td>
                                  	  <td>${customerGroup.slNo}</td>
                                      <td>${customerGroup.group_id}</td>
                                      <td>${customerGroup.group_description}</td>
                                      <td>${customerGroup.group_category}</td>
                                      <td>${customerGroup.location}</td> 
									  <td>${customerGroup.startDate}</td> 
									  <td>${customerGroup.endDate}</td> 
									
                                 
                                      <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerGroup('${customerGroup.group_id}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                         
                                       	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCustomerGroup('${customerGroup.group_id}','edit')">Edit</a>
                                       
                                   
                                      </td>
      							</tr>
                                  </c:forEach> 
                              </tbody>  
                          </table>     
				              
                
          
                  <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerGroupMaster('customerGroup','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerGroupMaster('customerGroup','${index - maxRecords-1}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerGroupMaster('customerGroup','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewCustomerGroupMaster('customerGroup','${index+maxRecords-1}');">
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
              		  <input type="button" onclick="viewCustomerGroupMaster('customerGroup',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>   
                        
            </div> 
          
            </div>   <!-- /.box-body -->
       </div>   <!-- /.box -->
  
</div>
     <input type="hidden" id="deleteActionLabel" value="<spring:message code="customer.group.label" />"/>
         <input type="hidden" id="err" value="${err}" />
</section>     



</body>
</html>
				                      