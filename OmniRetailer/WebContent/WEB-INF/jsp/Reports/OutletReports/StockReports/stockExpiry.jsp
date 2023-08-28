<!-- 
      Written by  :Swathi
      File name   :Inventory Manager/stockAging/stockAging
      Description :This page is used to display the stock aging details
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
 </head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.fa1{
 
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
  
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
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
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
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
  /*   height: 24px; */
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
	if($("#flowUnder").val()=='outlet'){
		$("#productstocks").removeClass("dataTable2");
		$("#productstocks").addClass("dataTable1");
		
	}
	else{
		$("#productstocks").removeClass("dataTable1");
		$("#productstocks").addClass("dataTable2");
	}
	callCalender('expiryDate');
	//callCalender('to');
	  $("#searchStocks").val($("#stock").val());
		$("#searchStocks").focus();  
	$('#searchStocks').on('input',function(e){
		if($(this).val().trim()==""){
			viewOutletStocks('','','0');
		}
	});
	
	// added to fetch locations based on zone 
	var zone = $("#outletZone").val();
	
	 var location = $("#outletLocation").val();
	 if( zone != null && zone !="" && location!= null && location == "")
	{
		searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
	}
});
</script>
<body>


 

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h2 class="box-title" style="font-size: 20px;" >
			Stock-Expiry Report
		</h2>
		</div>
             <div class="box-body table-responsive">
              <div class="col-lg-11" style="background: #f4f4f4;    padding: 14px 20px;    width: 88%;">
                  <div class="row">
                      <div class="col-lg1-3 col-lg-3">
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
                      <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory"  onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                  
                      <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div> 
                       
                         <div class="col-lg1-3 col-lg-3">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="expiry.date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="expiryDate" size="20" type="text" onfocus="callCalender('expiryDate')" onclick="callCalender('expiryDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" onchange="searchCategorybasedonlocation('outletLocation','outletCategory','outletBrandId');">
                             <option value=""><spring:message code="ALL.label"/></option> 
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-3 col-lg-3">
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
                       <div class="col-lg1-3 col-lg-3">
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
                      <%--  <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div> --%>
                        <%-- <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                           
	                        </select>
                      </div>
                      </div> --%>
                      <%-- <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div> --%>
                    </div>
                  </div>
                  <div class="col-lg-1" style=" background: #ccc;    width: 12%;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewoutletstockExpiry('outletstockExpiry','0','outlet','menu');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%-- <label><spring:message code="startprice.label"/></label> --%>
                      </div>

                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br>
                    <div class="row">
                  
                    
                 <div class="col-lg-1 col-xs-2">
                    	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewoutletstockExpiry('outletstockExpiry','0','outlet','menu');">
                    		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
                    		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
                    		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
                   			<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
                    	</select>
				  </div>
                    <div class="col-lg-9" style="margin-top: 0px; padding-left: 0px;padding-right:7px;width: 78%;">
                      <div class="wrapper">	 
                         <input type="text" class="form-control" value="" id="searchAccount">												
					  </div>
						
                    </div>
   	
		       
           <div class="col-lg-2" style="float:right;padding-right:15px;margin-top:0px;padding-left:0px;width: 13%;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="viewoutletstockExpiry('outletstockExpiry','0','outlet','save');" value="Save">
            <input type="hidden" id="stockdownloadurl" value="${url}">                     
           </div>
           
           </div>   
                   
                  
      <div id="example1_wrapper" class="table table-bordered table-striped" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
               
                     <table id="productstocks" class= "table table-bordered table-striped">
            
                     
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                       
                        <tr>
                        <th><div><spring:message code="sl.no.label" /></div></th>
                        <th style="width:40px!importtant"><spring:message code="skuID.label" /></th>
                        <th><div><spring:message code="description.label" /></div></th>
                        <th><spring:message code="location.label" /></th>
                        <th><div><spring:message code="category.label"/></div></th>
                        <th style="text-align: left;"><spring:message code="subcategory.label" /></th>
                         <th style="width: 98px !important;"><spring:message code="department.label" /></th>
                         <th><spring:message code="brand.label" /></th> 
                         <th><div><spring:message code="batchNo.label" /></div></th>
                         <th><spring:message code="expiry.date.label" /></th>
                         <th><spring:message code="qty.in.hand.label" /></th>
                         </tr>
                              
                        
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="stockDetails" items="${report}" varStatus="thecount">
                         	 <tr>
                                <td>${thecount.count+index-1}</td>
                                <td>${stockDetails.skuId}</td>
                                <td>${stockDetails.itemDesc}</td>
                                <td>${stockDetails.store_location}</td>
                                <td>${stockDetails.categoryName}</td>
                                <td>${stockDetails.subCategory}</td>
                                <td>${stockDetails.department}</td>
                             	<td>${stockDetails.brand}</td>
                             	<td>${stockDetails.batchNo}</td>
                             	<td>${stockDetails.expiryDate}</td>
                             	<td>${stockDetails.quantityInHand}</td>
                             </tr>
                                
                               <c:set var="dataExists" value="true"></c:set>
                            </c:forEach>
             
                      
                         </tbody>
                         
                     </table>
                     </div>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              	<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletstockExpiry('outletstockExpiry','${totalValue}','outlet','menu');">
              	</div>
              	
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              	<c:if test="${totalValue-10 >0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletstockExpiry('outletstockExpiry','${index - 11}','outlet','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletstockExpiry('outletstockExpiry','${index - 11}','outlet','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletstockExpiry('outletstockExpiry','${totalValue}','outlet','menu')">
              		</div> 
              	</c:if>
              	
              	
              	
            

<div class="col-lg-6" style="float:right;">
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
              	<input type="button" onclick="viewoutletstockExpiry('outletstockExpiry',document.getElementById('pagination').value,'outlet','menu')" class="btn bg-olive btn-inline  addBtn" value="GO">
              	</div>
</div>
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
