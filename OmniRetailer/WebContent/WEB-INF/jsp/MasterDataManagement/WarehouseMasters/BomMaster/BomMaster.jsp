<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : V.Chaithanya
 * file name		        : MasterDataManagement/Outlet master/BomMaster/BomMaster.jsp
 * file type		        : JSP
 * description				: The PriceRangeMaster form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
 <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/bomMaster.js"></script>
 <style type="text/css">
 .buttons {
	float: right;
	padding-top: 0px;
	margin:3px 0px 2px;
	/* margin-right: 2%;
	margin-top:1%; */
}
.col-lg-2{
padding-right: 3px;
}
a.button, .list a.button {
    position: relative;
    text-decoration: none;
    color: #FFF;
    display: inline-block;
    padding: 5px 10px 5px 10px;
    background: #3c8dbc;
    border-radius: 5px;
    box-shadow: 1px 0px 2px #000;
    cursor: pointer;
    behavior: url(css/PIE.htc);
}
.searchbutton
{
    margin-right: 15px;
}
 </style>
 <script>
 $(document).ready(function(){
	/*  $("#searchPriceRange").val($("#priceRangePrice").val());
	 //if($("#searchSKU").val().trim()!="")
	 	$("#searchPriceRange").focus(); */
	 $('#mySearch').click(function(){
	      var search = $('#searchBOM').val();
	      return viewBomMasterWarehouse('BomMasterWH','0');
	  })
	   $('#searchBOM').keyup(function(e){
	  	 
	      if(e.which == 13){//Enter key pressed
	          $('#mySearch').click();//Trigger search button click event
	      }
	       else if(e.which == 8){ //backspace key pressed
	      	 if($('#searchBOM').val()=="")
	      	 $('#mySearch').click();//Trigger search 
	      }
	     });
	 });
 </script>
 
 <script type="text/javascript">
function criteria(str) {
	
    var x = $(str).val();
    if (x.includes("'") || x.includes("/") || x.includes("(")  || x.includes(")") || x.includes("|") || x.includes("$") || x.includes("\n") || x.includes("~") || x.includes("`") || x.includes("!") || x.includes("%") || x.includes('"') ||   x.includes("<") || x.includes(">")  || x.includes("*") || x.includes("#") || x.includes(":") ||  x.includes(";")  || x.includes("{") || x.includes("}") || x.includes("[") ||  x.includes("]") || x.includes("=") || x.includes("+") || x.includes("^") || x.includes("?")|| x.includes("@") ){
    
            alert("Special characters are not allowed!");
            x=$(str).val().replace(/['&~%/\\#!]/g,' ');
    /*   x=$(str).val(""); */

    }
     $(str).val(x.trim());
}
</script>
	
 
</head>
<body>
<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">

 <div class="row">
 
  <div class="col-xs-12">
  
    <div class="box box-primary">
     
        <div class="box-header">
     <h3 class="box-title"><spring:message code="bom.master.label" /></h3> 
   <br>
      <div class="box-body table-responsive">
      <div class="row">
      	  <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewBomMasterWarehouse('BomMasterWH','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
      
      
                     <div class="col-lg-9 " style="padding-left: 0px;padding-right: 15px">
	        	 		<%--  <input type="text"  class="form-control searchItems searchBar"   id="searchPriceRange" placeholder="<spring:message code="search.bom.master" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl BomMaster" style=""></ul>
				   				</div>
							</div> --%>
							
								<input type="text"  class="form-control" value="${searchName}" id="searchBOM" placeholder="<spring:message code="search.bom.master" />" />
                    		 <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							<input type="hidden" value="warehouse" id="flowUnder">
							
							
							<span id="BOMError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							<input type="hidden" id="BOMPrice" value="${searchName}">
	        	 		</div>
	        	 		
                               <c:if test="${sessionScope.role == 'super admin'}"> 
                                	<div class="col-lg-1" style="padding-right: 0px;padding-bottom: 5px;">
		  				               <input type="button" onclick="return newWHBomMaster('BomMasterWH');" class="btn bg-olive btn-inline addBtn" value="<spring:message code="addnew.label" />">
		  				               </div><div class="col-lg-1" style="padding-right: 0px;">
		   			                   <input type="button" onclick="return validate('BomMaster');" value="<spring:message code="delete.label" />" class="btn bg-olive btn-inline addBtn" style="text-align:center;">
						 
								 </div>
                               </c:if>
                           <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                             
								<c:if test="${accessControl.appDocument == 'BOMMaster' && accessControl.write == true}"> 
                                    

								<div class="col-lg-1" style="padding-right: 0px;padding-bottom: 5px;">
		  				               <input type="button" onclick="return newWHBomMaster('BomMasterWH');" class="btn bg-olive btn-inline addBtn" value="<spring:message code="addnew.label" />">
		  				               </div><div class="col-lg-1" style="padding-right: 0px;">
		   			                   <input type="button" onclick="return validate('BomMaster');" value="<spring:message code="delete.label" />" class="btn bg-olive btn-inline addBtn" style="text-align:center;">
						 
								 </div>
							 </c:if>
						</c:forEach>
						<br>
						 <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                                  <tr role="row">
                                   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
									<c:if test="${accessControl.appDocument == 'BOMMaster' && accessControl.write == true}"> 
                                  		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                  	</c:if>
                                  </c:forEach>
                                  	  <th><div><spring:message code="sl.no.label" /></div></th>
                                  	  <th><spring:message code="bom.ref.label" /></th>
                                  	  <th><spring:message code="bom.skuid.label" /></th>
                                  	   <th><spring:message code="itemdesc.label" /></th>
                                  	  
                                      <th><spring:message code="uom.label" /></th>
                                      
                                      
                                      <th><spring:message code="product.category.label" /></th>
                                       
                                       <th><spring:message code="EmployeeForm.action" /></th>
                                  </tr>
                              </thead>
                              <tbody style="text-align: center;">
                                 <c:forEach var="rates" items="${shipmentRatesList}" varStatus="loop">
                               <%--   <input type="hidden" value="${rates.bomRef}"> --%>
                                  <tr>
                                   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${rates.bomRef}' /></td>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
									<c:if test="${accessControl.appDocument == 'BOMMaster' && accessControl.write == true}"> 
                                  		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${rates.bomRef}' /></td>
                                  	</c:if>
                                  </c:forEach>	
                                  	  <td>${loop.count + index - 1}
                                  	  <input type="hidden" id="sno" value="${loop.index+1}">
                                  	  </td>
                                  	  <td>${rates.bomRef}</td>
                                  	  <td>${rates.productId}</td>
                                  	  <td>${rates.description}</td>
                                  	  <td>${rates.productUom}</td>
                                  	  <td>${rates.productCategory}</td>
                                  	  <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWHBomMaster('${rates.bomRef}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                       <c:if test="${sessionScope.role == 'super admin'}"> 
                                       	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWHBomMaster('${rates.bomRef}','edit')">Edit</a>
                                       </c:if>
                                      <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
										<c:if test="${accessControl.appDocument == 'BOMMaster' && accessControl.write == true}"> 
                                      		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWHBomMaster('${rates.bomRef}','edit')">Edit</a>
                                      	</c:if>
                                      </c:forEach> 
                                      </td>
      							</tr>
                                  </c:forEach> 
                              </tbody>
                          </table>
						<%-- <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewBomMaster('BomMaster','${totalValue}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBomMaster('BomMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBomMaster('BomMaster','${index - 11}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewBomMaster('BomMaster','${totalValue}'); ">
              	</div> 
              	</c:if>
              </div>
						 --%>
						 
						   <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBomMasterWarehouse('BomMasterWH','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBomMasterWarehouse('BomMasterWH','${index - maxRecords - 1}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewBomMasterWarehouse('BomMasterWH','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewBomMasterWarehouse('BomMasterWH','${index+maxRecords-1}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              		
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewBomMasterWarehouse('BomMasterWH',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>   
          
             
						 
						 
						 </div>
      
      </div>
        </div>
  
   </div>
</div>
</div>

 </section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
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
</body>
</html>