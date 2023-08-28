<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/menu/menuCategories.jsp
 * file type		        : JSP
 * description				: The menu category details table is displayed using this jsp
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
        <script src="${pageContext.request.contextPath}/js/menu.js"></script>
        <script src="${pageContext.request.contextPath}/js/controller.js"></script>
<style type="text/css">
/* .buttons {
	float: right;
	padding-top: 0px;
	margin-right: 3%;
	margin-top:1%;
} */
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

 table.dataTable {
    clear: both;
    margin-top: 0px !important;
    margin-bottom: 6px !important;
    max-width: none !important;
} 

</style> 
<script type="text/javascript">


$(function() {
	$("#searchMenus").val($("#menu").val());
	//if($("#searchTax").val().trim()!="")
		$("#searchMenus").focus();
	
		$('#searchMenus').on('input',function(e){
			if($(this).val().trim()==""){
				viewMenuConfigurations('menuConfigurations');
			}
		});
		
		
		 $('#mySearch').click(function(){
		        var search = $('#searchMenus').val();
		        return searchMenuCategories(search,'','0');
		    })
		    $('#searchMenus').keypress(function(e){
		        if(e.which == 13){//Enter key pressed
		            $('#mySearch').click();//Trigger search button click event
		        }
		    });
});

$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);


	
	
	
});
</script>        
</head>
<body>
 <!-- Content Header (Page header) -->


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"><spring:message code="menu.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	
                                	 <div class="row">
				                    
				                      <div class="col-lg-3">
				                         <div class="col-lg-10 nopadding" style=" text-align:left;   ">
				                          <label><spring:message code="location.label"/></label>
				                           <select class="form-control" id="outletname" onchange="getMenuCategories();">
				                          <option value="">ALL</option>
				                           <c:forEach var="store" items="${storesList}">
												<option value="${store.location}" ${store.location == selectedStore ? 'selected' : ''} id="${store.location}" >${store.location}</option>
											</c:forEach>
											
 				                           </select>
				                         </div>
				                    
				                      </div>
				                        <div class="col-lg-4"></div>
				                      <div class="col-lg-4" style="text-align: left;">
				                      </div>
				                    </div>
				                    <br/>
				 
                                  
                                    <div class="row" style="   ">
                                    
                                      <div class="col-lg-10" style=" "> 
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="${searchName}" id="searchMenus" placeholder="<spring:message code="menu.search.label" />"/>
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="menu" value="${searchName}">
						<input type="hidden" id=searchName value="${searchName}">
                    </div>
                                    
                                    
                              <%--       <div class="col-lg-10" style="  /*     margin-top: 20px; */">
	        	 		 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchMenus" placeholder="<spring:message code="menu.search.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl menu_search" style=""></ul>
				   				</div>
							</div>
							<span id="searchNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							<input type="hidden" id="menu" value="${searchName}">
							
	        	 	</div> --%>
	        	 	
	        	 	
	        	 					<div class="col-lg-1" style="padding-left: 0px;margin-left: 5px;">
		  				               <input type="button" onclick="return newMenuCategory();" class="btn bg-olive btn-inline  addBtn" value="<spring:message code="addnew.label"/>" style="">
		  				             </div>
		  				             <div class="col-lg-1" style="padding-left: 0px;margin-left: -6px">
		  				               <input type="button" onclick="return validate('menu');" class="btn bg-olive btn-inline  addBtn" value="<spring:message code="delete.label"/>" style="">
		   			                  
									
									 </div>
									 </div>
									  <table id="example1" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	<th><spring:message code="sl.no.label" /></th>
                                            	<th><spring:message code="menu.name.label" /></th>
                                            	<th><spring:message code="status.label" /></th>
                                            	<th><spring:message code="created.on.label" /></th>
                                            	<th><spring:message code="description.label" /></th>
                                                <th style="text-align: center;"><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:forEach var="menu" items="${menuDetailsList}">
                                            <tr>
                                            	<td><input type="checkbox" name="selectall" 
                                            	class="selectableCheckbox" id="selectall" value='${menu.menu_name}' /></td>
                                            	<td>${menu.slNo}</td>
                                            	<td>${menu.menu_name}</td>
                                            	<c:if test="${menu.status == 'true'}">
                                            	<td>Active</td>
                                            	</c:if>
                                            	<c:if test="${menu.status != 'true'}">
                                            	<td>Inactive</td>
                                            	</c:if>
                                            	<td>${menu.createdOnStr}</td>
                                            	<td>${menu.remarks}</td>
                                                <td style="text-align: center;"><a style="color: #2e7ea7 !important; cursor: pointer;" href="#" onclick="return viewMenuCategory('${menu.menu_name}')">View</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="#" style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditMenuCategory('${menu.menu_name}')">Edit</a></td> 
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                        
                                    </table>
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
              //  $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="category.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>