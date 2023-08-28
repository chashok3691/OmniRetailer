<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/stockLedger.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * modified By				: Vijay
 * modification Description : Added Totals for Tables Cloumns 
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/warehouseReports/warehousereports.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    /* border: 2px solid gray; */
    border-radius: 10px;
   /*  background: #eee; */
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 5px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	    width: 50%;
    float: right;
    margin-right: 5%;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    /* border-color: transparent transparent #eee transparent; */
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
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
}
</style>  
<script>



$(document).ready(function(){
	//$("#billDate").trigger("click");
/* 	callCalender('from');
callCalender('to'); */
	$('#profitReportSearch').click(function(){
        var search = $('#profitsearch').val();
        var type = $("#periodictype").val();
        return viewdsrReports('salesDsrReport','0',type);;
    })
    $('#profitsearch').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#profitReportSearch').click();//Trigger search button click event
        }
    });
	
	function sumOfColumns(className, classNo)
	{
	var total = 0.0;
	var numArray = [];
	$("."+className+classNo).each(function(){
		numArray.push( $(this).text() );
	});
	for (var i = 0; i < numArray.length; i++) {
		total=parseFloat(total) + parseFloat(numArray[i]);
	}
	return total;
	}
	debugger;
	var totalValue = $("#totalCountNo").val();
	
	for(var i=1,count=1;i<=totalValue;i++,count++)
		{
		
			$('#daycolumn'+i).text(parseFloat(sumOfColumns('dayQuantity', count)+0.00).toFixed(2));
			$('#daycolumn'+(++i)).text(parseFloat(sumOfColumns('dayPrice',count)+0.00).toFixed(2));
			$('#daycolumn'+(++i)).text(parseFloat(sumOfColumns('dayCatCont',count)+0.00).toFixed(2));
			$('#daycolumn'+(++i)).text(parseFloat(sumOfColumns('dayStoreCont',count)+0.00).toFixed(2));
			
		}
	
	for(var i=1,count=1;i<=25;i++,count++)
	{
	
		$('#weekcolumn'+i).text(parseFloat(sumOfColumns('weekQuantity', count)+0.00).toFixed(2));
		$('#weekcolumn'+(++i)).text(parseFloat(sumOfColumns('weekPrice',count)+0.00).toFixed(2));
		$('#weekcolumn'+(++i)).text(parseFloat(sumOfColumns('weekCatCont',count)+0.00).toFixed(2));
		$('#weekcolumn'+(++i)).text(parseFloat(sumOfColumns('weekStoreCont',count)+0.00).toFixed(2));
		
	}
	for(var i=1,count=1;i<=1;i++,count++)
	{
	
		$('#yearcolumn'+i).text(parseFloat(sumOfColumns('yearQuantity', count)+0.00).toFixed(2));
		$('#yearcolumn'+(++i)).text(parseFloat(sumOfColumns('yearPrice',count)+0.00).toFixed(2));
		$('#yearcolumn'+(++i)).text(parseFloat(sumOfColumns('yearCatCont',count)+0.00).toFixed(2));
		$('#yearcolumn'+(++i)).text(parseFloat(sumOfColumns('yearStoreCont',count)+0.00).toFixed(2));
		
	}
	
	for(var i=1,count=1;i<=48;i++,count++)
	{
	
		$('#monthcolumn'+i).text(parseFloat(sumOfColumns('monthQuantity',count)+0.00).toFixed(2));
		$('#monthcolumn'+(++i)).text(parseFloat(sumOfColumns('monthPrice',count)+0.00).toFixed(2));
		$('#monthcolumn'+(++i)).text(parseFloat(sumOfColumns('monthCatCont',count)+0.00).toFixed(2));
		$('#monthcolumn'+(++i)).text(parseFloat(sumOfColumns('monthStoreCont',count)+0.00).toFixed(2));
		
	}
	
// 	Added to fetch the locations based on zone 
	 var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
		 }
		
		});

</script>
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
  
          <div class="box-header" align="center">
				<h3 class="box-title" >
					<spring:message code="dsrreport.label" />
				</h3>			
				</div><!-- /.box-header -->
    <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchZonallocationsBasedOnZone('outletZone','outletLocation','${type}','false')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
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
                           <label><spring:message code="section.label"/></label>
                           <select class="form-control" id="section" >
                           <c:if test="${not empty section}">
                            <option value="${section}">${section}</option>
                           </c:if>
                           		 <option value=""><spring:message code="ALL.label"/></option>
                           		 
	                            
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12 form-group" style="padding-left:0px;padding-right: 0px;">
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
            <%--   <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div> --%>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
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
                   
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" onchange="searchSectionsBasedOnSubCategory('outletCategory','outletSubcategory', 'section');">
                           		   <c:if test="${not empty subcategory}">
                            <option value="${subcategory}">${subcategory}</option>
                           </c:if>
                           		 <option value=""><spring:message code="ALL.label"/></option>
                          </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                         <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == supplierId ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                            <div class="col-lg1-2 col-lg-2">
                   <div class="col-lg-12 form-group" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	              <%--  <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div> --%>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewdsrReports('salesDsrReport','0','${type}','false');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div> <%-- <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getstockRequestSummary()" style="cursor: pointer;" >
			                </a>
			                </div> --%>
                  <div class="col-lg-12">
                  <br>
                  </div>
                       <div class="col-lg-12">
				                     <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                   <!--    <input type="hidden" id="skuSales" value=""> -->
				                       <div class="col-lg-1">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewdsrReports('salesDsrReport','0','${type}','false');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-10" style="margin-top: 17px;    padding-left: 0px;">
				                       <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="profitsearch" placeholder="<spring:message code="search.sku.label" />" />
						<button id="profitReportSearch" class="searchbutton" style=" margin-right: 17px;"></button>
						
							<input type="hidden" id="pricewise" value="${searchName}">
							<input type="hidden" value="${type}" id="periodictype"/></div>
	        	 		</div>
					              <div class="col-lg-1" style="margin-top: 17px;">
                     <input type="button"  class="btn bg-olive btn-inline  addBtn" onclick="viewdsrReports('salesDsrReport','0','${type}','save');" value="SAVE"/>
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                  </div>
				            </div>  
              <br><br>
              <br>
  <div class="nav-tabs-custom">
 <ul class="nav nav-tabs">
  <c:choose>
 <c:when test="${type=='DAILY'}">
  <li class="active"><a data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','DAILY');" href="#home1"><spring:message code="daily.label" /></a></li>
 </c:when>
 <c:otherwise>
  <li><a data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','DAILY');" href="#home1"><spring:message code="daily.label" /></a></li>
 </c:otherwise>
 </c:choose>
 <c:choose>
 <c:when test="${type=='WEEKLY'}">
  <li class="active"><a data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','WEEKLY');" href="#home">	<spring:message code="weekly.label" /></a></li>
 </c:when>
 <c:otherwise>
  <li><a data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','WEEKLY');" href="#home">	<spring:message code="weekly.label" /></a></li>
 </c:otherwise>
 </c:choose>
  <c:choose>
 <c:when test="${type=='MONTHLY'}">
  <li class="active" ><a data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','MONTHLY');" href="#menu1"><spring:message code="monthly.label" /></a></li>
 </c:when>
 <c:otherwise>
 <li ><a data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','MONTHLY');" href="#menu1"><spring:message code="monthly.label" /></a></li>
 </c:otherwise>
 </c:choose>
  <c:choose>
 <c:when test="${type=='YEARLY'}">
  <li class="active"><a  data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','YEARLY');" href="#menu2"><spring:message code="yearly.label" /></a></li>
 </c:when>
 <c:otherwise>
 <li><a  data-toggle="tab" onclick="viewdsrReports('salesDsrReport','0','YEARLY');" href="#menu2"><spring:message code="yearly.label" /></a></li>
 </c:otherwise>
 </c:choose>
</ul>

<div class="tab-content">

 <c:if test="${type =='DAILY'}">
  <div id="home1" class="tab-pane active ">
  
			
                    <div class="box-body table-responsive">
                  
                    
                    <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x:auto;width:100%">
				         <table id="example1" class="table table-bordered table-striped" style="    white-space: nowrap;">
                            <thead style="background-color: #ccc !important; color: #ffffff">
                               <tr>
                                	<th style="border: 2px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                	  <th style="border: 2px solid #444 !important;"><spring:message code="report.skuid.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.description.laabel" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="location.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="category.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="subcategory.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="section.label" /></th>
                                          <th style=" border: 2px solid #444 !important;"><spring:message code="department.label" /></th>
                                           <c:forEach var="labels" items="${labels}" >
                                             <th colspan="4" style="border: 2px solid #444 !important;">${labels}</th>
                                             </c:forEach>
                                </tr>
                                     <tr>
                                	<th style="border: 2px solid #444 !important;"></th>
                                	  <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                       <th style="border: 2px solid #444 !important;"></th>
                                          <th style=" border: 2px solid #444 !important;"></th>
                                           <c:forEach var="labels" items="${labels}" >
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="saleqty.label" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="sale.value" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="category.cont.label" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="store.cont.label" /></th>
                                             </c:forEach>
                                </tr>
                            </thead>
                           <tbody style="text-align: center;">
                             <c:forEach var="warehousereport" items="${warehousereport.reportsList}" varStatus="thecount">
                          	 <tr>
                                 <td>${thecount.index+index}
                                 </td>
                                 <td class="graph" id="skuid${thecount.index+index}">${warehousereport.skuId}</td> 
                                  <td>${warehousereport.itemDesc}</td> 
                                   <td>${warehousereport.store_location}</td> 
                                    <td id="date${thecount.index+index}">${warehousereport.categoryName}</td> 
                                     <td>${warehousereport.subCategory}</td> 
                                      <td id="Pqty${thecount.index+index}">${warehousereport.section}</td> 
                                       <td id="Cqty${thecount.index+index}">${warehousereport.department}</td> 
                                        <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                         <c:forEach var="labels" items="${labels}" >
                                          <input type="hidden" id="flowUnder" value="${map.key}">
                                          <input type="hidden" id="flowUnder" value="${map.value}">
                                           <input type="hidden" id="flowUnder" value="${labels}">
                                          <c:set var="data" value="${map.value}">
                                          </c:set>
                                         <input type="hidden" id="flowUnder" value="${data.price}">
                                         </c:forEach></c:forEach>
                                        <%--   <c:forEach var="labels" items="${labels}" > --%>
                                           <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                            <c:set var="data" value="${map.value}"></c:set>
                                             <td class="dayQuantity${thecount.count}" style="border: 2px solid #444 !important;">${data.quantity}</td>
                                             <td class="dayPrice${thecount.count}" style="border: 2px solid #444 !important;">${data.price}</td>
                                             <td class="dayCatCont${thecount.count}" style="border: 2px solid #444 !important;">${data.catContVal}</td>
                                             <td  class="dayStoreCont${thecount.count}"style="border: 2px solid #444 !important;">${data.storeContVal}</td>
                                                <c:set var="totalCount" value="${thecount.count}"/>
                                                
                                                   </c:forEach>
                                            
                                        
                              </tr>
                             </c:forEach>
                             <tr>
                             <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                          <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="#ffffff"><spring:message code="totals.label" /></font></div></td>
                             
                        	 <c:forEach var = "i" begin = "1" end = "${totalCount*4}" varStatus="thecount">
                              <td style="padding:3px;width: 160px;"><div id="daycolumn${thecount.count}" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                  			 </c:forEach>
                             </tr>
                             
                             
                             
                          </tbody> 
                      </table></div>
                     <input type="hidden" id="totalCountNo" value=" ${totalCount * 4}"/>
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
                <c:forEach var="labels" items="${labels}" varStatus="thecount">
                  <input type="hidden" id="totalnum" value="${labels}">
                </c:forEach>
               
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div> 
              	</c:if>
              </div>    
              
              
                           <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header" style="border-bottom-color: #fff !important;">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="procurementvsconsumption.label" /><h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div>
 	</div>
  </div>
                                </div>
                            </div>
                            
                            </c:if>
                            
<c:if test="${type =='WEEKLY'}">
<script>

		
</script>
  <div id="home" class="tab-pane active">
  
  
			<c:set var="totol" value="0"></c:set>
                    <div class="box-body table-responsive">
                   
                  
				            
                                         <div id="example2_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
				         <table id="example2" class="table table-bordered table-striped">
                            <thead style="background-color: #ccc !important; color: #ffffff">
                               <tr>
                                	<th style="border: 2px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                	  <th style="border: 2px solid #444 !important;"><spring:message code="report.skuid.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.description.laabel" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="location.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="category.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="subcategory.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="section.label" /></th>
                                    <th style=" border: 2px solid #444 !important;"><spring:message code="department.label" /></th>
                                    <c:forEach var="labels" items="${labels}" >
                                             <th colspan="4" style="border: 2px solid #444 !important;">${labels}</th>
                                    </c:forEach>
                                </tr>
                                     <tr>
                                     
                                	<th style="border: 2px solid #444 !important;"></th>
                                	<th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style=" border: 2px solid #444 !important;"></th>
                                    <c:forEach var="labels" items="${labels}" >
                                    <th  style="border: 2px solid #444 !important;"><spring:message code="saleqty.label" /></th>
                                    <th  style="border: 2px solid #444 !important;"><spring:message code="sale.value" /></th>
                                    <th  style="border: 2px solid #444 !important;"><spring:message code="category.cont.label" /></th>
                                    <th  style="border: 2px solid #444 !important;"><spring:message code="store.cont.label" /></th>
                                             </c:forEach>
                                </tr>
                            </thead>
                           <tbody  style="text-align: center;">
                             <c:forEach var="warehousereport" items="${warehousereport.reportsList}" varStatus="thecount">
                          	 <tr>
                                 <td>${thecount.index+index}
                                 </td>
                                 <td class="graph" id="skuid${thecount.index+index}">${warehousereport.skuId}</td> 
                                  <td>${warehousereport.itemDesc}</td> 
                                   <td>${warehousereport.store_location}</td> 
                                    <td id="date${thecount.index+index}">${warehousereport.categoryName}</td> 
                                     <td>${warehousereport.subCategory}</td> 
                                      <td id="Pqty${thecount.index+index}">${warehousereport.section}</td> 
                                       <td id="Cqty${thecount.index+index}">${warehousereport.department}</td> 
                                        <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                         <c:forEach var="labels" items="${labels}" >
                                          <input type="hidden" id="flowUnder" value="${map.key}">
                                          <input type="hidden" id="flowUnder" value="${map.value}">
                                          <input type="hidden" id="flowUnder" value="${labels}">
                                          <c:set var="data" value="${map.value}">
                                          </c:set>
                                         <input type="hidden" id="flowUnder" value="${data.price}">
                                         </c:forEach></c:forEach>
                                        <%--   <c:forEach var="labels" items="${labels}" > --%>
                                           <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                            
                                            <c:set var="data" value="${map.value}"></c:set>
                                             <td class="weekQuantity${thecount.count}" style="border: 2px solid #444 !important;">${data.quantity}</td>
                                             <td class="weekPrice${thecount.count}" style="border: 2px solid #444 !important;">${data.price}</td>
                                             <td class="weekCatCont${thecount.count}" style="border: 2px solid #444 !important;">${data.catContVal}</td>
                                             <td  class="weekStoreCont${thecount.count}"style="border: 2px solid #444 !important;">${data.storeContVal}</td>
                                                   </c:forEach>
                                            <%--  </c:forEach> --%>
                              </tr>
                             </c:forEach>
                             <tr>
                             <td></td>
                              <td></td>
                               <td></td>
                                <td></td>
                                 <td></td>
                                  <td></td>
                                   <td></td>
                                        <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="#ffffff"><spring:message code="totals.label" /></font></div></td>
                             
                        	 <c:forEach var = "i" begin = "1" end = "20" varStatus="thecount">
                              <td style="padding:3px;width: 160px;"><div id="weekcolumn${thecount.count}" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                  		
                  			 </c:forEach>
                                       
                                      
                             </tr>
                          </tbody> 
                      </table></div>
                     
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
                <c:forEach var="labels" items="${labels}" varStatus="thecount">
                  <input type="hidden" id="totalnum" value="${labels}">
                </c:forEach>
               
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div> 
              	</c:if>
              </div>    
              
              
                           <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header" style="border-bottom-color: #fff !important;">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="procurementvsconsumption.label" /><h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
         
                                </div>
                            </div>
                            
                            </c:if>
                            <c:if test="${type =='MONTHLY'}">
                            
                              <div id="menu1" class="tab-pane active ">
                              
                                          <div class="box-body table-responsive">
               
                    
                    <div id="example3_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x:auto;width:100%">
				         <table id="example3" class="table table-bordered table-striped" style="    white-space: nowrap;">
                            <thead style="background-color: #ccc !important; color: #ffffff">
                               <tr>
                                	<th style="border: 2px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                	  <th style="border: 2px solid #444 !important;"><spring:message code="report.skuid.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.description.laabel" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="location.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="category.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="subcategory.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="section.label" /></th>
                                    <th style=" border: 2px solid #444 !important;"><spring:message code="department.label" /></th>
                                           <c:forEach var="labels" items="${labels}" >
                                             <th colspan="4" style="border: 2px solid #444 !important;">${labels}</th>
                                             </c:forEach>
                                </tr>
                                     <tr>
                                	<th style="border: 2px solid #444 !important;"></th>
                                	  <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                       <th style="border: 2px solid #444 !important;"></th>
                                          <th style=" border: 2px solid #444 !important;"></th>
                                           <c:forEach var="labels" items="${labels}" >
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="saleqty.label" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="sale.value" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="category.cont.label" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="store.cont.label" /></th>
                                             </c:forEach>
                                </tr>
                            </thead>
                           <tbody style="text-align: center;">
                             <c:forEach var="warehousereport" items="${warehousereport.reportsList}" varStatus="thecount">
                          	 <tr>
                                 <td>${thecount.index+index}
                                 </td>
                                 <td class="graph" id="skuid${thecount.index+index}">${warehousereport.skuId}</td> 
                                  <td>${warehousereport.itemDesc}</td> 
                                   <td>${warehousereport.store_location}</td> 
                                    <td id="date${thecount.index+index}">${warehousereport.categoryName}</td> 
                                     <td>${warehousereport.subCategory}</td> 
                                      <td id="Pqty${thecount.index+index}">${warehousereport.section}</td> 
                                       <td id="Cqty${thecount.index+index}">${warehousereport.department}</td> 
                                        <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                         <c:forEach var="labels" items="${labels}" >
                                          <input type="hidden" id="flowUnder" value="${map.key}">
                                          <input type="hidden" id="flowUnder" value="${map.value}">
                                           <input type="hidden" id="flowUnder" value="${labels}">
                                          <c:set var="data" value="${map.value}">
                                          </c:set>
                                         <input type="hidden" id="flowUnder" value="${data.price}">
                                         </c:forEach></c:forEach>
                                        <%--   <c:forEach var="labels" items="${labels}" > --%>
                                        
                                           <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                            
                                            <c:set var="data" value="${map.value}"></c:set>
                                             <td class="monthQuantity${thecount.count}" style="border: 2px solid #444 !important;">${data.quantity}</td>
                                             <td class="monthPrice${thecount.count}" style="border: 2px solid #444 !important;">${data.price}</td>
                                             <td class="monthCatCont${thecount.count}" style="border: 2px solid #444 !important;">${data.catContVal}</td>
                                             <td  class="monthStoreCont${thecount.count}"style="border: 2px solid #444 !important;">${data.storeContVal}</td>
                                                   
                                                   </c:forEach>
                                        
                                           <%--  </c:forEach> --%>
                                        
                              </tr>
                             </c:forEach>
                                <tr>
                             <td></td>
                              <td></td>
                               <td></td>
                                <td></td>
                                 <td></td>
                                  <td></td>
                                   <td></td>
                    <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="#ffffff"><spring:message code="totals.label" /></font></div></td>
                                     
                     <c:forEach var = "i" begin = "1" end = "48" varStatus="thecount">
                              <td style="padding:3px;width: 160px;"><div id="monthcolumn${thecount.count}" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                  			 </c:forEach>
                                      
                             </tr>
                          
                          </tbody> 
                         
                      </table></div>
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
                <c:forEach var="labels" items="${labels}" varStatus="thecount">
                  <input type="hidden" id="totalnum" value="${labels}">
                </c:forEach>
               
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div> 
              	</c:if>
              </div>    
              
              
                           <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header" style="border-bottom-color: #fff !important;">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="procurementvsconsumption.label" /><h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
                           </div><!-- /.box-body -->
                              
                              </div>
                              
                              </c:if>
                              <c:if test="${type == 'YEARLY'}">
                                <div id="menu2" class="tab-pane active ">
                              
                                         <div class="box-body table-responsive">
                  <div class="row">
				                 
				             
				            </div>  
                    
                    <div id="example4_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x:auto;width:100%">
				         <table id="example4" class="table table-bordered table-striped" style="    white-space: nowrap;">
                            <thead style="background-color: #ccc !important; color: #ffffff">
                               <tr>
                                	<th style="border: 2px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                	  <th style="border: 2px solid #444 !important;"><spring:message code="report.skuid.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.description.laabel" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="location.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="category.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="subcategory.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="section.label" /></th>
                                          <th style=" border: 2px solid #444 !important;"><spring:message code="department.label" /></th>
                                           <c:forEach var="labels" items="${labels}" >
                                             <th colspan="4" style="border: 2px solid #444 !important;">${labels}</th>
                                             </c:forEach>
                                </tr>
                                     <tr>
                                	<th style="border: 2px solid #444 !important;"></th>
                                	  <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                    <th style="border: 2px solid #444 !important;"></th>
                                       <th style="border: 2px solid #444 !important;"></th>
                                          <th style=" border: 2px solid #444 !important;"></th>
                                           <c:forEach var="labels" items="${labels}" >
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="saleqty.label" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="sale.value" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="category.cont.label" /></th>
                                             <th  style="border: 2px solid #444 !important;"><spring:message code="store.cont.label" /></th>
                                             </c:forEach>
                                </tr>
                            </thead>
                           <tbody style="text-align: center;">
                             <c:forEach var="warehousereport" items="${warehousereport.reportsList}" varStatus="thecount">
                          	 <tr>
                                 <td>${thecount.index+index}
                                 </td>
                                 <td class="graph" id="skuid${thecount.index+index}">${warehousereport.skuId}</td> 
                                  <td>${warehousereport.itemDesc}</td> 
                                   <td>${warehousereport.store_location}</td> 
                                    <td id="date${thecount.index+index}">${warehousereport.categoryName}</td> 
                                     <td>${warehousereport.subCategory}</td> 
                                      <td id="Pqty${thecount.index+index}">${warehousereport.section}</td> 
                                       <td id="Cqty${thecount.index+index}">${warehousereport.department}</td> 
                                        <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                         <c:forEach var="labels" items="${labels}" >
                                          <input type="hidden" id="flowUnder" value="${map.key}">
                                          <input type="hidden" id="flowUnder" value="${map.value}">
                                           <input type="hidden" id="flowUnder" value="${labels}">
                                          <c:set var="data" value="${map.value}">
                                          </c:set>
                                         <input type="hidden" id="flowUnder" value="${data.price}">
                                         </c:forEach></c:forEach>
                                        <%--   <c:forEach var="labels" items="${labels}" > --%>
                                          <c:forEach var="map" items="${warehousereport.mapDet}" varStatus="thecount">
                                            
                                            <c:set var="data" value="${map.value}"></c:set>
                                             <td class="yearQuantity${thecount.count}" style="border: 2px solid #444 !important;">${data.quantity}</td>
                                             <td class="yearPrice${thecount.count}" style="border: 2px solid #444 !important;">${data.price}</td>
                                             <td class="yearCatCont${thecount.count}" style="border: 2px solid #444 !important;">${data.catContVal}</td>
                                             <td  class="yearStoreCont${thecount.count}"style="border: 2px solid #444 !important;">${data.storeContVal}</td>
                                                   
                                                   </c:forEach>
                                            <%--  </c:forEach> --%>
                              </tr>
                             </c:forEach>
                             <tr>
                             <td></td>
                              <td></td>
                               <td></td>
                                <td></td>
                                 <td></td>
                                  <td></td>
                                   <td></td>
                                        <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="#ffffff"><spring:message code="totals.label" /></font></div></td>
                             
                        	 <c:forEach var = "i" begin = "1" end = "4" varStatus="thecount">
                              <td style="padding:3px;width: 160px;"><div id="yearcolumn${thecount.count}" style="white-space: nowrap;padding: 5px;background: #c1c1c1;"></div></td>
                  			 </c:forEach>
                              </tr>
                          </tbody> 
                      </table></div>
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
                <c:forEach var="labels" items="${labels}" varStatus="thecount">
                  <input type="hidden" id="totalnum" value="${labels}">
                </c:forEach>
               
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewdsrReports('salesDsrReport','${index - 11}','${type}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewdsrReports('salesDsrReport','${totalValue}','${type}','false')">
              	</div> 
              	</c:if>
              </div>    
              
              
                           <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header" style="border-bottom-color: #fff !important;">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="procurementvsconsumption.label" /><h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
                                </div><!-- /.box-body -->
                              </div></c:if>
  </div></div>
</div>
</div></div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
        if($("#totalnum").val>0)
        new Chart(document.getElementById("pricevar").getContext("2d")).Line(getpricevariationgraph(),newopts);
            $(function() {
                $("#stockLedger").dataTable({
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