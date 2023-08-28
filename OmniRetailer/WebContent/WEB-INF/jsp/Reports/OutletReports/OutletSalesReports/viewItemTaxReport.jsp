
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vijay
 * file name		        : Reports/OutletReports/outletSalesReports/itemwisetaxreport.jsp
 * file type		        : JSP
 * description				: display price override report
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/billings.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">

.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}


.summaryImg {
    width: 50%;
    float: right;
    /* margin-right: 0%; */
    padding-bottom: 5px;
}



a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}

.iospopupp {
   	width: 61%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('startDateTax');
	callCalender('endDateTax');
	$('#creditNoteSearch').click(function(){
        return viewItemWiseTaxReport('ItemTaxReport','0','${flowLocation}');
    })
    $('#searchCredit').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#creditNoteSearch').click();//Trigger search button click event
        }
    });
	
/* 	 var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','location','');
		 } */
	
});



</script>
</head>
<body>
<div id="tax">
<!-- Main content -->

				<section class="content-header">
                    <h1>
                      <c:if test = "${flowLocation ==''}">
                       <spring:message code="outlet_management.reports.label"/>
                       </c:if>
                       <c:if test = "${flowLocation !=''}">
                      <spring:message code="warehouse_management.reports.label"/> 
                      </c:if>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;Tax Report
                    </h1>
                  
                </section>
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body">
   <div class="col-lg-12" style=" background: #f4f4f4;    ">

                  <div class="row">
                         <div  class="col-md-1" style="width: 14%">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','location','${flowLocation}')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                        
                      </div>
                      
                       <div  class="col-md-1" style="width: 14%">
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
                    
                         <div  class="col-md-1" style="width: 14%">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" onchange="searchSectionsBasedOnSubCategory('productCategory','outletSubcategory', 'section');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div  class="col-md-1" style="width: 14%">
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
                  
                     <div  class="col-md-1" style="width: 14%">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDateTax" size="20" type="text" onfocus="callCalender('startDateTax')" onclick="callCalender('startDateTax')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	          <div  class="col-md-1" style="width: 14%">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		 <label>Hour-wise</label>
	             	<select class="form-control form-group" id="hourselection" style=" padding-left: 5px !important;" onchange="" var="hourselection" items="${hourselection}" value="hourselection">
                    	<option value=""><spring:message code="ALL.label"/></option>
							<option value="00-01" ${'00-01' == hourselection ? 'selected' : ''}>00-01</option>
							<option value="01-02" ${'01-02' == hourselection ? 'selected' : ''}>01-02</option>
							<option value="02-03" ${'02-03' == hourselection ? 'selected' : ''}>02-03</option>
							<option value="03-04" ${'03-04' == hourselection ? 'selected' : ''}>03-04</option>
							<option value="04-05" ${'04-05' == hourselection ? 'selected' : ''}>04-05</option>
							<option value="05-06" ${'05-06' == hourselection ? 'selected' : ''}>05-06</option>
							<option value="06-07" ${'06-07' == hourselection ? 'selected' : ''}>06-07</option>
							<option value="07-08" ${'07-08' == hourselection ? 'selected' : ''}>07-08</option>
							<option value="08-09" ${'08-09' == hourselection ? 'selected' : ''}>08-09</option>
							<option value="09-10" ${'09-10' == hourselection ? 'selected' : ''}>09-10</option>
							<option value="10-11" ${'10-11' == hourselection ? 'selected' : ''}>10-11</option>
							<option value="11-12" ${'11-12' == hourselection ? 'selected' : ''}>11-12</option>
							<option value="12-13" ${'12-13' == hourselection ? 'selected' : ''}>12-13</option>
							<option value="13-14" ${'13-14' == hourselection ? 'selected' : ''}>13-14</option>
							<option value="14-15" ${'14-15' == hourselection ? 'selected' : ''}>14-15</option>
							<option value="15-16" ${'15-16' == hourselection ? 'selected' : ''}>15-16</option>
							<option value="16-17" ${'16-17' == hourselection ? 'selected' : ''}>16-17</option>
							<option value="17-18" ${'17-18' == hourselection ? 'selected' : ''}>17-18</option>
							<option value="18-19" ${'18-19' == hourselection ? 'selected' : ''}>18-19</option>
							<option value="19-20" ${'19-20' == hourselection ? 'selected' : ''}>19-20</option>
							<option value="20-21" ${'20-21' == hourselection ? 'selected' : ''}>20-21</option>
							<option value="21-22" ${'21-22' == hourselection ? 'selected' : ''}>21-22</option>
							<option value="22-23" ${'22-23' == hourselection ? 'selected' : ''}>22-23</option>
							<option value="23-00" ${'23-00' == hourselection ? 'selected' : ''}>23-00</option>
                 	</select>
	              </div>
	            </div>
	           
	                <div class=" col-md-1" style="background: #ccc;width:16%">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="searchItemWiseTaxReport('ItemTaxReport','0','NOPOP','${flowLocation}')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                 
                   </div></div>
                   
                   <div class="modal fade" id="myModalIoss" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
     
    
      <!-- Modal content-->
      <div class="modal-content iospopupp">
        <div class="modal-header" >
       
          <button type="button" class="close" style="margin-top: -17px;margin-right: -9px;" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">It may take  time. Do you want to continue ?
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          
         
         
          
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;margin-left:50px">
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: -30px;">
													<input type="button" class="iosclosebutton1"
														onclick="searchItemWiseTaxReport('ItemTaxReport','0','','${flowLocation}');"
														value="OK">
												</div>
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: 48px;">
													<input type="button" class="iosclosebutton1"
														data-dismiss="modal" value="Cancel">
												</div>
											</div>



   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
		
                   
                   
	           <div class="row">
                   
                     
                        <div  class="col-md-1" style="width: 14%">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
                           		 <option value="all"><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${workLocationsList}">
<%-- 									<option value="${location}" ${location == loc ? 'selected' : ''} id="${location}" >${location}</option> --%>
						    	<c:choose>
							   <c:when test="${location.description == ''}">
							    <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}</option>
							   </c:when>
							  <c:otherwise>
							   <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							  </c:otherwise>
							 </c:choose>
						 	
						 	
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      <div  class="col-md-1" style="width: 14%">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="productCategory" onchange="searchSubCategories('productCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                     
                         <div  class="col-md-1" style="width: 14%">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="section.label"/></label>
                           <select class="form-control" id="section" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2" style="display: none;">
                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          
	                        </select>
                      </div>
                      </div>
                     
                     <div  class="col-md-1" style="width: 14%">
					<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
					 <label>Sales Channel</label>
					 <select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
							<option value=""><spring:message code="ALL.label"/></option>
								<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
								<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
								<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
								<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
					 </select>
					 </div>
					 </div>
                     
                      <div  class="col-md-1" style="width: 14%">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDateTax" size="20" type="text" onfocus="callCalender('endDateTax')" onclick="callCalender('endDateTax')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          <div  class="col-md-1" style="width: 14%"></div>
		          <div class="col-md-1"style="background: #ccc;width: 16%">
		          <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
                   
                 
                  
                </div></div>
 
 
 <br><br>
	
          <div class="row">
                <div class="col-lg-12"><br></div>
                </div>
          
          
				                    <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewItemWiseTaxReport('ItemTaxReport','0','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-10 col-xs-10 ">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchCredit" placeholder="Search" />
											<button id="creditNoteSearch" class="searchbutton"></button>
											<!-- <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div> -->
										
				                    </div></div>
				                    <div class="col-lg-1" style="">
                     <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="viewItemWiseTaxReport('save','0','${flowLocation}');" value="SAVE"/>
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                  </div>
				                  </div>
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            		
                                                <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="customer.newfeedback.date" /></th>
                                                <th>Update Date</th>
                                                <th><spring:message code="bill.ref.label" /></th>
                                                <th>Yearly Bill ID</th>
                                                <th>Event ID</th>  
                                                  <th><spring:message code="product.name.table.label" /></th> 
                                                    <th><spring:message code="skuid.label" /></th> 
                                                     <th><spring:message code="category.label" /></th> 
                                                    <th><spring:message code="subcategory.label" /></th> 
                                                <th><spring:message code="location.label" /></th> 
                                                <th><spring:message code="hsnCode.label" /></th> 
                                                <th><spring:message code="customer_contact_num.label" /></th> 
                                                <th><spring:message code="qty.label" /></th> 
                                                 <th>Sale Price</th>
                                                 <th>Taxable Value</th> 
                                                 <th>
                                                CGST Tax Rate
                                                 </th>
                                                   <th>
                                                CGST Tax Value
                                                 </th>
                                                    <th>
                                                SGST Tax Rate
                                                 </th>
                                                   <th>
                                                SGST Tax Value
                                                 </th>
                                                    <th>
                                                IGST Tax Rate
                                                 </th>
                                                   <th>
                                                IGST Tax Value
                                                 </th>
                                                    <th>
                                                Other Tax Rate
                                                 </th>
                                                   <th>
                                                Other Tax Value
                                                 </th>
                                                <th><spring:message code="cash_total.label" /></th> 
                                                <th><spring:message code="card_total.label" /></th> 
                                                <th>Credits Total</th> 
                                                <th>Credit Note Amt</th> 
                                                <th>Sodexo Amount</th> 
                                                <th>Ticket Total</th> 
                                                 <th>Total Received</th> 
                                                  <th>Total Due</th> 
                                      </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="warehouseReport" items="${WarehouseReportObj.reportsList}" varStatus="theCount">
                                        	 <tr>
                                        	 	 <td>${theCount.count+index-1}</td>
                                        	 	<td>${warehouseReport.date}</td>
                                        	 	<td>${warehouseReport.updatedDate}</td>
                                        	 	<td>${warehouseReport.serialBillId}</td>
                                        	 	<td>${warehouseReport.serailBillIdYearly}</td>
                                        	 	<td>${warehouseReport.eventId}</td>
                                        	 	<td style="text-align: left;">${warehouseReport.itemDesc}</td>
                                        	 		<td>${warehouseReport.skuId}</td>
                                        	 	<td>${warehouseReport.categoryName}</td>
                                        	 	<td>${warehouseReport.subCategory}</td>
                                        	 	<td>${warehouseReport.store_location}</td>
                                        	 	<td>${warehouseReport.hsnCode}</td>
                                        	 	<td>${warehouseReport.phoneNum}</td>
                                        	 	<td>${warehouseReport.quantity}</td>
                                        	 	<td>${warehouseReport.totalCost}</td>
                                        	 	<td>${warehouseReport.tax}</td>
                                        	 	<td>${warehouseReport.cgstTaxRate}</td>
                                        	 	<td>${warehouseReport.cgstTaxValue}</td>
                                        	 	<td>${warehouseReport.sgstTaxRate}</td>
                                        	 	<td>${warehouseReport.sgstTaxValue}</td>
                                        	 	<td>${warehouseReport.igstTaxRate}</td>
                                        	 	<td>${warehouseReport.igstTaxValue}</td>
                                        	 	<td>${warehouseReport.otherTaxRate}</td>
                                        	 	<td>${warehouseReport.otherTaxValue}</td>
                                        	 	<td>${warehouseReport.cashTotal}</td>
                                        	 	<td>${warehouseReport.cardTotal}</td>
                                        	 	<td>${warehouseReport.creditTotal}</td>
                                        	 	<td>${warehouseReport.creditsAmt}</td>
                                        	 	<td>${warehouseReport.sodexTotal}</td>
                                        	 	<td>${warehouseReport.ticketTotal}</td>
                                        	 		<td>${warehouseReport.receivedAmt}</td>
                                        	 	<td>${warehouseReport.dueAmount}</td>
                                        	 	
                                        	 	
                                            </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
                                    </div>
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewItemWiseTaxReport('ItemTaxReport','${totalValue}','${flowLocation}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewItemWiseTaxReport('ItemTaxReport','${index - (maxRecords + 1)}','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewItemWiseTaxReport('ItemTaxReport','${index - (maxRecords + 1)}','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewItemWiseTaxReport('ItemTaxReport','${totalValue}','${flowLocation}')">
              	</div> 
              	</c:if>
              	<div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="viewItemWiseTaxReport('ItemTaxReport',document.getElementById('pagination').value,'${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
       </div></div>

</section>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable(
             		{
             			"bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
       </div>
</body>
</html>


