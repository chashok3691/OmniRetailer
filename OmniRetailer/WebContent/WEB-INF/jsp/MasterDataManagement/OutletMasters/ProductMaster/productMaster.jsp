<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/productMaster.jsp
 * file type		        : JSP
 * description				: The product details table is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
       <script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/productMaster.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin:4px 0px 2px;
	/* margin-right: 2%;
	margin-top:1%; */
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
.searchbutton
{
    margin-right: 15px;
}
</style>     
<script type="text/javascript">
$(document).ready(function(){
/* var err = $("#err").val();
if(err != "")
  alert(err);
	$("#searchProduct").val($("#product").val());
	//if($("#searchProduct").val().trim()!="")
		$("#searchProduct").focus(); */
		

	$('#mySearch').click(function(){
	      var search = $('#searchProduct').val();
	      return searchProductMaster(search,'','0');
	  })
	   $('#searchProduct').keyup(function(e){
	  	 
	      if(e.which == 13){//Enter key pressed
	          $('#mySearch').click();//Trigger search button click event
	      }
	       else if(e.which == 8){ //backspace key pressed
	      	 if($('#searchProduct').val()=="")
	      	 $('#mySearch').click();//Trigger search 
	      }
	     });

});



</script> 
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="masters.label" />
     <small><spring:message code="product.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="masters.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
   				<div class="box-header" align="center">
                   <h3 class="box-title"><spring:message code="allProducts.label" /></h3>
               </div><!-- /.box-header -->
            <div class="box-body table-responsive">
               <div class="row">
                	<%-- <div class="form-group col-lg-4">
                			<label style="font-size: 20px;"><spring:message code="allProducts.label" /></label>
                     </div> --%>
                     
                         <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewProductMaster('productmaster','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                     
                     
                     <div class="col-lg-9">
	        	 		 <%-- <input type="text"  class="form-control searchItems searchBar" style="" value="${searchName}" id="searchProduct" placeholder="<spring:message code="search.product.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl productMaster" style=""></ul>
				   				</div>
							</div> --%>
							<input type="text"  class="form-control" value="${searchName}" id="searchProduct" placeholder="<spring:message code="search.product.label" />" />
                     <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							
							
							<input type="hidden" id="product" value="${searchName}">
	        	 	</div>
                      <c:if test="${sessionScope.role == 'super admin'}"> 
                      	<!-- <div class="col-lg-2" style="margin-top: 3px;padding-left: 0px;">
                      <!-- 	<div class="buttons" style=""> -->
                      	<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewProduct();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('product');" value="<spring:message code="delete.label" />">
								           </div>
						   		<%-- <a onclick="return viewNewProduct();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
						        <a onclick="return validate('product');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
						<!--  </div>
						 </div> -->
                      </c:if>
                   <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                  <c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true}"> 
	                  	<!-- <div class="col-lg-2" style="margin-top:3px;padding-left:0px;">
						<div class="buttons" style=""> -->
						<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewProduct();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('product');" value="<spring:message code="delete.label" />">
								           </div>
						   		
					 </c:if>
				  </c:forEach>
				</div>
				<table id="example1" class="table table-bordered table-striped" style="">
                    <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                         <c:if test="${sessionScope.role == 'super admin'}"> 
                         	<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                         </c:if>
                         <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                  		<c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true}"> 
                        		<th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                        	</c:if>
                        </c:forEach>
                        	<th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 98px;">
<div style="">SL No.</div></th>
                            <th><spring:message code="product.code.label" /></th>
                            <th style="text-align: left;"><spring:message code="product.name.label" /></th>
                            <th style="text-align: left;"><spring:message code="category.name.label" /></th>
                           <%--  <th><spring:message code="primary.supplier.label" /></th> --%>
                            <th><spring:message code="product.buy.unit.price.label" /></th>
                            <th><spring:message code="product.sell.unit.price.label" /></th> 
                            <th><spring:message code="EmployeeForm.action" /></th>
                        </tr>
                    </thead>
                    
                    <tbody style="text-align: center;">
                    	<c:forEach var="product" items="${productList}" varStatus = "theCount">
                        <tr>
                         <c:if test="${sessionScope.role == 'super admin'}"> 
                         	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${product.productId}" /></td>
                         </c:if>
                         <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                  		<c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true}"> 
                        		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${product.productId}" /></td>
                        	</c:if>
                        </c:forEach>
                        	<td>${theCount.count + index -1}</td>
                            <td>${product.productId}</td>
                            <td style="text-align: left;">${product.productName}</td>
                            <td style="text-align: left;">${product.categoryDescription}</td>
                            <%-- <td>${product.primary_supplier}</td> --%>
                            <td>${product.buy_unit_price}</td>
                            <td>${product.sell_unit_price}</td>
                            <td>
                            <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditProduct('${product.productId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                             <c:if test="${sessionScope.role == 'super admin'}"> 
                             	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditProduct('${product.productId}','edit')">Edit</a>
                             </c:if>
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                  			<c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true}">
                            		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditProduct('${product.productId}','edit')">Edit</a>
                            	</c:if>
                            </c:forEach>		
                            </td>
                            		 
						</tr>
                        </c:forEach> 
                      </tbody>
                </table>
              <%--  <div class="row" id="pagination">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewProductMaster('productmaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewProductMaster('productmaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewProductMaster('productmaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewProductMaster('productmaster','${totalValue}')">
              	</div> 
              	</c:if>
              </div>
                 --%>
                 
                      <div class="row">
        
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewProductMaster('productmaster','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewProductMaster('productmaster','${index - maxRecords+1}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewProductMaster('productmaster','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewProductMaster('productmaster','${index+maxRecords-1}')">
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
              		  <input type="button" onclick="viewProductMaster('productmaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="product.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>