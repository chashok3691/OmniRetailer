<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/packagingandprocessing/packagingandprocessingsummary.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
</head>
<style>
.allignment{
   /*   width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}

a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
   /*  height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	callCalender('from');
	callCalender('to');
	$('#mySearch').click(function(){
	    return viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');
	})
	$('#searchPackage').keypress(function(e){
		
		var searchName=$('#searchPackage').val()
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }else if(searchName!=""&&searchName.length>=2){
	    	$('#mySearch').click();
	    }
	});
	/*  $('#mySearch').click(function(){
	        return viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');
	    })
	    $('#searchPackage').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    }); */
	
	/* $("#searchStocks").val($("#stock").val());
		$("#searchStocks").focus();  
	$('#searchStocks').on('input',function(e){
		if($(this).val().trim()==""){
			viewOutletStocks('','','0');
		}
	});
	


	/*added by manasa to search stocks when trigger search button  */
/*
		 $('#mySearch').click(function(){
		        var search = $('#searchStocks').val();
		        return searchStocks(search,'','0');
		    })
		    $('#searchStocks').keypress(function(e){
		        if(e.which == 13){//Enter key pressed
		            $('#mySearch').click();//Trigger search button click event
		        }
		    });
	

			 var packTotal = [];
			   var totalPack=0.0;
			   $('.packQty').each( function(){
				   if($(this).text()=="")
					   packTotal.push("0");
				   else
					   {
					   packTotal.push( $(this).text() );  
					   } 
			   	     });
				
				for (var i = 0; i < packTotal.length; i++) {
					totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
				}
				if(totalPack < 0)
					totalPack = totalPack * (-1);
					
				$('#totalPackQty').text(parseFloat(totalPack+0.00).toFixed(2));
				
				 var StockTotal = [];
				   var totalStock=0.0;
				   $('.stockQty').each( function(){
					   if($(this).text()=="")
						   StockTotal.push("0");
					   else
						   {
						   StockTotal.push( $(this).text() );  
						   }
				   	     });
					
					for (var i = 0; i < StockTotal.length; i++) {
						totalStock  = parseFloat(totalStock ) + parseFloat(StockTotal[i]);
					}
					if(totalStock < 0)
						totalStock = totalStock * (-1);
					
					$('#totalStockQty').text(parseFloat(totalStock+0.00).toFixed(2));
				
					

							var StockTotal = [];
						   var totalStock=0.0;
						   $('.stockVal').each( function(){
							   if($(this).text()=="")
								   StockTotal.push("0");
							   else
								   {
								   StockTotal.push( $(this).text() );  
								   }
						   	     });
							
							for (var i = 0; i < StockTotal.length; i++) {
								totalStock  = parseFloat(totalStock ) + parseFloat(StockTotal[i]);
							}
							if(totalStock < 0)
								totalStock = totalStock * (-1);
							$('#totalStockValue').text(parseFloat(totalStock+0.00).toFixed(2));
						
				 
							// added to fetch locations based on zone 
						/* 	var zone = $("#outletZone").val();
					var flowUnder = $("#flowUnder").val();
					 var location = $("#outletLocation").val();
					 if( zone != null && zone !="" && location!= null && location == "")
						 {
						searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation',flowUnder);
					} */
			 
		});
</script>
<body>

<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stocks.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			<spring:message code="packaging.summary" />
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
                         <div class="col-lg-11" style="background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                          <c:choose>
                         <c:when test ="${flowUnder == 'warehouse' }" > 
                           <select class="form-control" id="outletZone" ><!-- onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse')" -->
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
	                         <select class="form-control" id="outletZone" ><!-- onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')" -->
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
	                        
	                        </c:otherwise>
                         </c:choose>
                         </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
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
	                          <%--   <c:choose>
								 <c:when test="${flowUnder == 'outlet'}"> --%>
								 <c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
								<%--  </c:when>
								 <c:otherwise>
								 <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
								 </c:otherwise>
								 
								 </c:choose> --%>
	                            
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == selectedLocation ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       <div class="col-lg-1">
                      
                      </div>
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br>
                    <br>
                    <div class="row">
                       <div class="col-lg-1 col-xs-2" style="padding-right: 4px;">
				                      	<select class="form-control" id="maxRecords" style="margin-top: 15%;padding: 3px 4px;" onchange="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				       </div>
				                      
				                      <!--added by manasa  -->
				                      <div class="col-lg-10 col-xs-8 nopadding" style="padding-top: 10px;">
                      	 
                   
                  <input type="text" class="form-control" value="" id="searchPackage" placeholder="Search Package" style="height:29px;">
                   <button id="mySearch" class="searchbutton" style="margin-top: 10px;"></button>
                   <input type="hidden" id="packaging" value=""> 
                    </div>
				                      
                   
                  <div class="col-lg-1 col-sm-2" style="padding-top: 10px; padding-left: 4px;">
                  
             <a  class="button" onclick="addpackaging();" style="padding-top: 5px;padding-bottom: 25px;margin-top:0px;margin-bottom: 0px;">New</a>
                  
                  </div>
                   <input type="hidden" id="stockType" value="${stockType}">
                       <input type="hidden" id="maxRecords" value="10">
                       <input type="hidden" id="stockdownload" value="false">
                       <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                   
                 
                        
                        
                    </div>
                  
                  <input type="hidden" id="stockType" value="${stockType}">
                   <input type="hidden" id="flowUnder" value="${flowUnder}">
                   <div>
                     <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="productstocks" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="packaging.ref.label" /></th>
                             	<th><spring:message code="report.suppliername.label" /></th>
                             	<th><spring:message code="grn.bathno.label" /></th>
                             	<th><spring:message code="dateTimeStr.label" /></th>
                             
                             	<th ><spring:message code="noofitems.label" /></th>
                             	
                             	
                             <th ><spring:message code="createshoppinglist.shopppinglist.status.label" /></th>
                                <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="packages" items="${packageList}"  varStatus="theCount">
                         	 <tr>
								 <td>${theCount.index + index}</td>
                         	 	<td>${packages.packagingRefId}</td>
                         	 	<td>${packages.supplierName}</td>
                             	<td>${packages.GRNNumber}</td>
                             	<td>${packages.createdDate}</td>
                             	<td >${packages.noOfItems}</td>
                                
                                
                                <td>${packages.status}</td>
                            <%--    --%>   <td><a style="color:#2e7ea7 !important;" onclick="viewEditPack('${packages.packagingRefId}','view');" href="#" >View
                                               
                               <%--   --%> </a> &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;" onclick="viewEditPack('${packages.packagingRefId}','edit');" href="#" >Edit</a>
                                               
                                 </td>
                             </tr>
                            </c:forEach>
                           
                         </tbody>
                     </table>
                    </div>
                     </div>


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','${totalValue}','warehouse','menu','');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPackagingandProcessing('warehouseProcessingAndpackaging','${index - 11}','warehouse','menu','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPackagingandProcessing('warehouseProcessingAndpackaging','${index - 11}','warehouse','menu','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','${totalValue}','warehouse','menu','');">
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
              		  <input type="button" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging',document.getElementById('pagination').value,'warehouse','menu','');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>    


                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>