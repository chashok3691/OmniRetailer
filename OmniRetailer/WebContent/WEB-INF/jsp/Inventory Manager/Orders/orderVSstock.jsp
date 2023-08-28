<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Orders/vieOrders.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.js"></script>	
	<script src="${pageContext.request.contextPath}/js/d3.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
        
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
    
  }
  }
.buttons {
	float: right;
	padding-top: 0px;
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
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

table.dataTable {
    clear: both;
    margin-top: 3px !important;
    margin-bottom: 6px !important;
    max-width: none !important;
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
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
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
		margin-top: 9px;
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
    border-color: transparent transparent #eee transparent;
}

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 9;
  /* background-color: white; */
}

.first-col {
 /*  width: 100px;
  min-width: 100px;
  max-width: 100px; */
  left: 0px;    
}

.second-col {
    left: 30px;
}
.third-col {
    min-width: 100px;
    max-width: 100px; 
    left: 80px;
}
.fourth-col {
    min-width: 200px;
    max-width: 200px;
    left: 195px;
}

#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
}
 
</style>  
<script type="text/javascript">
$(document).ready(function(){
	
	callCalender('from');
	callCalender('to');
  

	
	
	 $('#mySearch').click(function(){
	        var search = $('#searchOrders').val();
	        return viewOrdervsStock('ordervsstock','0','false');
	    })
	    $('#searchOrders').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });
	
	
	
	
	
	

	
});
</script>
</head>
<body>


 
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
     <div class="box-header" style="padding-bottom: 0px;">
		
		
		<div style="text-align: center;">
		<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">
				Ordres Vs Stock
				
			</h3>
		
		</div>
			
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	      
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
                         </div>
                      </div>
                      
                      <div class="col-lg-2">
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
                       
                       
                      <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId')" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       
                       
                        <div class="col-lg-3">  
              
	 </div>
	                <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" readonly="readonly"  value="${startdate}" style="background-color: white;" id="from" size="20" type="text"  onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              
	              </div>
	            </div>
	       <!-- Added by:Swathi
	       Purpose :To add Start Timeslot field    
	         -->   
	             
	            
	            
                    </div>
                     <div class="row">
                       <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" >
	             	<option value="">ALL</option>
	                <c:forEach var="location1" items="${locationsList}">
	                 <c:if test="${location1.locationId !='B2C'}"> 
	                <option value="${location1.locationId}" ${location1.locationId == selectedLocation ? 'selected' : ''} id="${location1.locationId}" >${location1.locationId}</option>
	                 </c:if> 
						<%-- <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option> --%>
					</c:forEach>
	            </select> 
                      </div>
                      </div>
                   
                       
                     
                        <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategoryName ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
               
		               <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Section</label>
                      
                           		  <select class="form-control" name="outletSection" id="outletSection">
                                  <option value=""><spring:message code="ALL.label"/></option>
                                  </select>
                                
	                        
                      </div>
                      </div>
                       <div class="col-lg-3">  
            
	 </div>
                          <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;"  value="${enddate}" id="to" size="20" type="text" readonly="readonly" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		        
		        
		       
		         
                    </div>
                  </div>
                  <div class="col-lg-9" style="padding-right:15px;    background: #ccc;    border-right: 1px solid #ccc;    width: 12%; padding-top: 2px;padding-bottom: 23px;">
                  <div class="col-lg-12" style="">
                  <div class="row">
                  
                   <input type="button" style="margin-top:22px" class="btn bg-olive btn-inline addBtn" onclick="viewOrdervsStock('ordervsstock','0','false');" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="margin-top:34px"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	      
	       
	        
	         <div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
	        
	        
	      <div class="row">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewOrdervsStock('ordervsstock','0','false');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
           
           <div class="col-lg-10" style="margin-top: 10px; padding-left: 1px;">
                      <div class="wrapper">	 
                     <input type="text"  class="form-control"  value="${criteria}" id="searchOrders" placeholder="<spring:message code="search.orders.label" />"/>
							<button id="mySearch" class="searchbutton"></button>
							
							</div>
                    </div>
           
	      
	  
			 <div class="col-lg-1" style="margin-top: 10px;padding-left: 10px;">
	       <input type="button" class="addBtn btn bg-olive btn-inline"  onclick="viewOrdervsStock('ordervsstock','0','true');"  value="<spring:message code="save.label" />" />
	        </div>
		</div>
		 <input type="hidden" id="downloadurlref" value="${downloadurl}">
		
	 <div id="orderitemsForLocations">         
	  <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                
                 	 <th class="sticky-col first-col" style="background-color: #a1dbf1 !important;"><spring:message code="sl.no.label" /></th>
                 	 <th class="sticky-col second-col" style="background-color: #a1dbf1 !important;"><spring:message code="location.label" /></th>
                 	 <th  class="sticky-col third-col" style="background-color: #a1dbf1 !important;"><spring:message code="bom.skuid.label" /></th>
                     <th><spring:message code="description.label" /></th>
                     <th><spring:message code="size.weight.label" /></th>
                      <th><spring:message code="mrp.label" /></th>
                     <th><spring:message code="saleprice.label" /></th>
                     <th><spring:message code="stock.qty.label" /></th>
                     <th><spring:message code="order.qty.label" /></th>
                     <th>Net Stock</th>
                 </tr>
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="orderVsStock" items="${OrderVsStockList}" varStatus="theCount">
             	 <tr>
             
             	 
             	 	 <td class="sticky-col first-col" style="background: #f9f9f9;">${theCount.count + index-1}</td>
             	 	 <td class="sticky-col second-col" style="background: #f9f9f9;">${orderVsStock.location}</td>
                 	 <td class="sticky-col third-col" style="background: #f9f9f9;">${orderVsStock.skuID}</td>
                 	 <td><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${orderVsStock.description}">${orderVsStock.description}</a></div> </td>
                 	 
                 	  <td>${orderVsStock.measurementRange}${orderVsStock.uom}</td>
                   
                     <td>${orderVsStock.mrp}</td>
                     <td>${orderVsStock.salePrice}</td>
                      <td>${orderVsStock.quantityInHand}</td>    
                     <td>${orderVsStock.orderQty}</td>
                    
                     <td>${orderVsStock.netStock}</td>
                     
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>
         </div>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrdervsStock('ordervsstock','${totalValue}','false');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=" return viewOrdervsStock('ordervsstock','${index - 11}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrdervsStock('ordervsstock','${index - 11}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrdervsStock('ordervsstock','${totalValue}','false');">
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
              		  <input type="button" onclick="viewOrdervsStock('ordervsstock',document.getElementById('pagination').value,'false');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div> 
               <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    
    
    
		  <div id="triggerEvent"></div>
  
    
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><div id="locationLable"></div><div id="dateLable"></div></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  
                     
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
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        
</body>
</html>