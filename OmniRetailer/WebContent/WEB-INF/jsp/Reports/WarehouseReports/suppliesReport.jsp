<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/stockLedger.jsp
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
    width: 25% !important;
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
callCalender('fromSupplier');
callCalender('toSupplier');

/* $("#supplierReport").val($("#reports").val());
$("#supplierReport").focus(); 
 */
$('#supplierReport').on('input',function(e){
	if($(this).val().trim()==""){
		viewWarehousesuppliereport('','0','');
	}
});

 /*added by manasa to search supplies when we trigger search button  */
$('#mySearch').click(function(){
    var search = $('#supplierReport').val();
    return viewWarehousesuppliereport('warehouseSuppliesReports','0',search);
})
$('#supplierReport').keypress(function(e){
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
});


//if($("#stocksObj").val()!="" && $("#stocksLineChart").length > 0)
    //new Chart(document.getElementById("stocksLineChart").getContext("2d")).Line(getprocurementconsumptiongraph(),newopts);
});

</script>
</head>
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
				<h3 class="box-title" >
					<spring:message code="supplies.report.label" />
				</h3>			
				</div><!-- /.box-header -->
			
                    <div class="box-body table-responsive">
                     <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse')">
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
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="fromSupplier" size="20" type="text" onfocus="callCalender('fromSupplier')" onclick="callCalender('fromSupplier')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
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
                         <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.supplierCode}" ${supplierList.supplierCode == supplierId ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="toSupplier" size="20" type="text" onfocus="callCalender('toSupplier')" onclick="callCalender('toSupplier')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewWarehousesuppliereport('warehouseSuppliesReports','0','')" class="button"><spring:message code="searchbutton.label"/></a>
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
                  
                  <div class="col-lg-12 col-xs-12" style="padding-bottom:3px;padding-left: 0px;padding-right: 0px;">
                      
                      <!--added by manasa  -->
                      
                      <div class="wrapper">
	        	 		 <input type="text"  class="form-control" value="${searchName}" id="supplierReport" placeholder="<spring:message code="search.items.here.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						 
							</div>
	        	 		<input type="hidden" id="reports" value="${searchName}">
                      	 <%-- <input type="text" value="${searchName}"  class="form-control searchItems searchBar" style=""  id="supplierReport" placeholder="<spring:message code="search.items.here.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl supplierReport" style=""></ul>
				   				</div>
							</div> --%>
						<%-- <input type="hidden" id="stock" value="${searchName}"> --%>
                    </div>
                    
                    <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid">
				         <table id="example1" class="table table-bordered table-striped">
                            <thead style="background-color: #ccc !important; color: #ffffff">
                               <tr>
                                	<th style="border: 2px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                	     <th style="border: 2px solid #444 !important;"><spring:message code="report.supplierid.label" /></th>
                                          <th style=" border: 2px solid #444 !important;"><spring:message code="report.suppliername.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.st.date.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.enddate.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.skuid.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.description.laabel" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="report.uom.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="report.price.label" /></th>
                                          <th style=" border: 2px solid #444 !important;"><spring:message code="report.qty.label" /></th>
                                             <th style="border: 2px solid #444 !important;"><spring:message code="report.cost.label" /></th>
                                </tr>
                            </thead>
                           <tbody style="text-align: center;">
                             <c:forEach var="warehousereport" items="${warehousereport.suppliesReport}" varStatus="thecount">
                          	 <tr>
                                 <td>${thecount.index+index}
                                 </td>
                                 <td class="graph" id="skuid${thecount.index+index}">${warehousereport.supplierId}</td> 
                                  <td>${warehousereport.supplierName}</td> 
                                   <td>${warehousereport.startDateStr}</td> 
                                    <td>${warehousereport.endDateStr}</td> 
                                     <td>${warehousereport.skuID}</td> 
                                      <td id="Pqty${thecount.index+index}">${warehousereport.itemDescription}</td> 
                                       <td id="Cqty${thecount.index+index}">${warehousereport.uom}</td> 
                                        <td><select class="form-control" style="width: 86px!important;" onchange="changeqty(this.value,'${thecount.index+index}',this.text)">
                                        <c:forEach var="price" items="${warehousereport.priceList}" varStatus="number">
                                        <option value="${number.index}id${thecount.index+index}">${price} </option>
                                        </c:forEach>
                                        </select>
                                        <c:forEach var="price" items="${warehousereport.priceList}" varStatus="cosrcol">
                                       <input type="hidden" value="${price}" id="cosrcol${cosrcol.index}id${thecount.index+index}"/>
                                        </c:forEach>
                                        </td> 
                                         <td id="quantity${thecount.index+index}">
                                         <c:set var="count" value="0"/>
                                        <c:forEach var="qty" items="${warehousereport.qtyList}" varStatus="thecount1">
                                          <c:set var="count" value="${count+qty}"/>
                                        </c:forEach>
                                        ${count}
                                         </td> 
                                          <c:forEach var="qty" items="${warehousereport.qtyList}" varStatus="thecount1">
                                        <input type="hidden" value="${qty}" id="qty${thecount1.index}id${thecount.index+index}"/>
                                        </c:forEach>
                                         <td id="cost${thecount.index+index}">${warehousereport.cost}</td>
                                        
                              </tr>
                             </c:forEach>
                          </tbody> 
                      </table></div>
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehousesuppliereport('warehouseSuppliesReports','${totalValue}','${searchName }')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehousesuppliereport('warehouseSuppliesReports','${index - 11}','${searchName}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehousesuppliereport('warehouseSuppliesReports','${index - 11}','${searchName }');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehousesuppliereport('warehouseSuppliesReports','${totalValue}','${searchName }')">
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
              		  <input type="button" onclick="viewWarehousesuppliereport('warehouseSuppliesReports',document.getElementById('pagination').value,'')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		</div>
              		
              	
              	
              	
              	
              	
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
                        <h4 class="modal-title" style="text-align: center;" ><spring:message code="procurementvsconsumption.label" /><h4>
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
                            </div><!-- /.box -->
  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
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