<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/taxMaster.jsp
 * file type		        : JSP
 * description				: The tax details table is displayed using this jsp
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
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script src="${pageContext.request.contextPath}/js/b2c/events.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
margin:0px -7px 0px;
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
	 margin-right:7px;
}
</style>     
<script type="text/javascript">
$(document).ready(function(){
	
	
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchShopping").val($("#shopping").val());
	$("#searchShopping").focus();
	$('#searchShopping').on('input',function(e){
		if($(this).val().trim()==""){
			viewShoppingList('shoppinglist','0');
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
                   <h3 class="box-title"><spring:message code="createshoppinglist.tittle.label" /></h3>
               </div><!-- /.box-header -->
               <div class="box-body table-responsive">
            <input type="hidden" id="sd" value="${startDate}">
			<input type="hidden" id="ed" value="${endDate}">
          
		      	        	 	<input type="hidden" id="type">
		      
            <div class="row">
                <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
	                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchShoppingList('','','0');">
	               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
	               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
	               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
	              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
	               	</select>
	           </div>
			  <div class="col-lg-9 col-xs-10" style="margin-top: 10px;">
	       	 		 <input type="text"  class="form-control searchItems" value=""  id="searchShopping"  name="searchShopping" placeholder="<spring:message code="search.shopping.label" />" style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
						<div class="services">
			    			<div class="items">
			     				<ul class="matchedStringUl searchShopping" style=""></ul>
			   				</div>
						</div>
						<input type="hidden" id="shopping" value="${searchName}">
	       	 	</div>
              <c:if test="${sessionScope.role == 'super admin'}"> 
              	    <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
				     	 <a onclick="return newEvent();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
				      </div>
				      <div class="col-lg-1" style="margin-top: -10px;padding-left: 0px;">
				         &nbsp;&nbsp;&nbsp;<a onclick="return validate('events');" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="delete.label" /></font></a>
					
				</div>
             </c:if>
              <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
				<c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true}"> 
				   <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
				     	 <a onclick="return newShoppingLists();" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="addnew.label" /></font></a>
				        </div>
				         <div class="col-lg-1" style="margin-top: -10px;padding-left: 0px;">
				         &nbsp;&nbsp;&nbsp;<a onclick="return validate('ShoppingLists');" class="btn bg-olive btn-inline  addBtn"><font size="2px"><spring:message code="delete.label" /></font></a>
					
					</div>
				</c:if>
			</c:forEach>
		</div>
                                    <table id="example1" class="table table-bordered table-striped" style="">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                             <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    											<c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true}"> 
                                            		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="list_id.label" /></th>
                                                <th><spring:message code="list.title.label" /></th>
                                                <th><spring:message code="customer.phonenumber.label" /></th>
                                                <th><spring:message code="created.date.label" /></th>
                                                <th><spring:message code="updated.date.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                            <c:forEach var="shoppinglist" items="${shoppinglistresponse}" varStatus="loop">
                                            <tr>
                                            <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${shoppinglist.listId}' /></td>
                                             </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    											<c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true}"> 
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${shoppinglist.listId}' /></td>
                                            	</c:if>
                                            </c:forEach>
                                            	<td>${loop.index+1}</td>
                                                <td>${shoppinglist.listId}</td>
                                                <td>${shoppinglist.listName}</td>
                                                <td>${shoppinglist.customerPhNum}</td>
                                                <td>${shoppinglist.createdOnStr}</td>
	                                            <td>${shoppinglist.updatedOnStr}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShopping('${shoppinglist.listId}','${shoppinglist.startIndex}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                 <c:if test="${sessionScope.role == 'super admin'}"> 
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShopping('${shoppinglist.listId}','${shoppinglist.startIndex}','edit')">Edit</a>
                                                 </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
    												<c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true}"> 
                                                		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditShopping('${shoppinglist.listId}','${shoppinglist.startIndex}','edit')">Edit</a>
                                                	</c:if>
                                                </c:forEach> 
                                                </td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                           
                           
                <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchShoppingList('','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchShoppingList('','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchShoppingList('','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchShoppingList('','','${totalValue}')">
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="tax.label" />"/>
         <input type="hidden" id="err" value="${err}" />
</body>
</html>