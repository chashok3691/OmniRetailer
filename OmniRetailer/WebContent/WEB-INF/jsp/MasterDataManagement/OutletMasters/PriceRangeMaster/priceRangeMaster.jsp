<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : N.RaviTeja
 * file name		        : MasterDataManagement/Outlet master/PriceRangeMaster/PriceRangeMaster.jsp
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
 <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
 <%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
 
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
	/*  var err = $("#err").val();
	 if(err != "")
	   alert(err); */
	 /* $("#searchProductGroup").val($("#productGroup").val());
	 //if($("#searchTax").val().trim()!="")
	 	$("#searchProductGroup").focus(); */
	 $('#mySearch').click(function(){
	     var search = $('#searchPriceRange').val();
	     viewpriceRangeMaster('priceRangeMaster','0')
	 })
	  $('#searchPriceRange').keyup(function(e){
	 	 
	     if(e.which == 13){//Enter key pressed
	         $('#mySearch').click();//Trigger search button click event
	     }
	      else if(e.which == 8){ //backspace key pressed
	     	 if($('#searchPriceRange').val()=="")
	     	 $('#mySearch').click();//Trigger search 
	     }
	    });
	 	
	 	
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
     
        <div class="box-header" align="center">
     <h3 class="box-title"><spring:message code="priceRangeMaster.allPriceRange.label" /></h3> 
     </div>
      <div class="box-body table-responsive">
      <div class="row">
      <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewpriceRangeMaster('priceRangeMaster','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                     <div class="col-lg-9 " style="">
	        	 		 <!--<input type="text"  class="form-control searchItems searchBar" style="" value="" id="searchPriceRange" placeholder="<spring:message code="search.priceRange.rates.label" />" />
							 <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl PriceRangeMaster" style=""></ul>
				   				</div>
							</div> -->
							<input type="text"  class="form-control" value="${searchName}" id="searchPriceRange" placeholder="<spring:message code="search.priceRange.rates.label" />" />
                     <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							
							
							
							<span id="PriceRangeError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							<%-- <input type="hidden" id="priceRangePrice" value="${searchName}"> --%>
	        	 		</div>
                               <c:if test="${sessionScope.role == 'super admin'}"> 
                               <!--  <div class="col-lg-2" style="margin-top: 3px;padding-left:0px;">
								 <div class="buttons" style=""> -->
								 <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newPriceRangeMaster(priceRangeMaster);" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('priceRange');" value="<spring:message code="delete.label" />">
								           </div>
	  				             <%--   <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newPriceRangeMaster(priceRangeMaster);" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('priceRange');" value="<spring:message code="delete.label" />">
								           </div> --%>
	  				               <%-- <a onclick="return newPriceRangeMaster(priceRangeMaster);" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
	   			                   <a onclick="return validate('priceRange');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
								<!--  </div>
								 </div> -->
                               </c:if>
                           <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                             
								<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true}"> 
                                    

                          <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return newPriceRangeMaster(priceRangeMaster);" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return validate('priceRange');" value="<spring:message code="delete.label" />">
								           </div>
							 </c:if>
						</c:forEach>
						</div>
						 <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                                  <tr role="row">
                                   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
									<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true}"> 
                                  		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                  	</c:if>
                                  </c:forEach>
                                  	  <th><div><spring:message code="sl.no.label" /></div></th>
                                  	  <th><spring:message code="priceRangeMaster.priceRangeId.label" /></th>
                                  	  <th><spring:message code="priceRangeMaster.createdDateStr.label" /></th>
                                      <th><spring:message code="priceRangeMaster.updatedDateStr.label" /></th>
                                      
                                      
                                      <th><spring:message code="priceRangeMaster.priceRangDescription.label" /></th>
                                       
                                       <th><spring:message code="EmployeeForm.action" /></th>
                                  </tr>
                              </thead>
                              <tbody style="text-align: center;">
                                 <c:forEach var="rates" items="${shipmentRatesList}" varStatus="loop">
                               <%--   <input type="hidden" value="${rates.priceRangeId}"> --%>
                                  <tr>
                                   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${rates.priceRangeId}' /></td>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
									<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true}"> 
                                  		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${rates.priceRangeId}' /></td>
                                  	</c:if>
                                  </c:forEach>	
                                  	  <td>${loop.count+index-1}
                                  	  <input type="hidden" id="sno" value="${loop.index+1}">
                                  	  </td>
                                  	  <td>${rates.priceRangeId}</td>
                                  	  <td>${rates.createdDateStr}</td>
                                  	  <td>${rates.updatedDateStr}</td>
                                  	  <td>${rates.priceRangeDescription}</td>
                                  	  
                                 
                                      <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditPriceRangeMaster('${rates.priceRangeId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                       <c:if test="${sessionScope.role == 'super admin'}"> 
                                       	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditPriceRangeMaster('${rates.priceRangeId}','edit')">Edit</a>
                                       </c:if>
                                      <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
										<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true}"> 
                                      		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditPriceRangeMaster('${rates.priceRangeId}','edit')">Edit</a>
                                      	</c:if>
                                      </c:forEach> 
                                      </td>
      							</tr>
                                  </c:forEach> 
                              </tbody>
                          </table>
                          
				 	<div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewpriceRangeMaster('priceRangeMaster','${totalValue}');">
              	</div>                                                                   
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewpriceRangeMaster('priceRangeMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >                
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewpriceRangeMaster('priceRangeMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewpriceRangeMaster('priceRangeMaster','${totalValue}');">
              	</div> 
              	</c:if>
              	
              	
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
              		  <input type="button" onclick="viewpriceRangeMaster('priceRangeMaster',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
						
						                              
           <%-- <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewpriceRangeMaster('priceRangeMaster','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewpriceRangeMaster('priceRangeMaster','${index - maxRecords+1}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewpriceRangeMaster('priceRangeMaster','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewpriceRangeMaster('priceRangeMaster','${index+maxRecords-1}')">
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
              		  <input type="button" onclick="viewpriceRangeMaster('priceRangeMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>    --%>
          
             
           
           
           
						 
						 
						 
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