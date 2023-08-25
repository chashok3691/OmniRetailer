<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/warehouse/stockverification/stockposting.jsp
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
        
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/outlet.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
        	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/stockUpload.js"></script>
      
        
        <style>
        
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
        </style>



<script type="text/javascript">
$(document).ready(function(){
$('#StockPosting').click(function(){
        var searchStockPosting = $('#searchStockPosting').val();
        return viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');
    })
    $('#searchStockPosting').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#StockPosting').click();//Trigger search button click event
        }
    });
	
});
</script>  

</head>
<body>
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary" style="padding: 10px;">
   <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Stock-Uploading
		</h3>
		</div>

<div class="row" style="margin-top:15px;padding:14px">
<div class="col-lg-12" style="border:1px solid #ccc">

<div class="row">
<div class="col-lg-2">
<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="zone.label"/></label>
                         
                        
                           <select class="form-control" id="warehouseZone" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                       
                         </div>

</div>
<div class="col-lg-2">
 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;"><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
</div>

<div class="col-lg-3">
 

</div>

<div class="col-lg-3">

</div>
<div class="col-lg1-2 col-lg-2" style="background: #ccc;">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                 
                   </div>
</div>
<div class="row">
<div class="col-lg-2">
 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label style="font-family: Calibri;color: gray;"><spring:message code="location.label"/></label>
                           <select class="form-control" id="warehouseLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="locations" items="${locationsList}">
	                       
								 <c:choose>
						           <c:when test="${locations == ''}">
							         <option value="${locations}" ${locations == location ? 'selected' : ''}>${locations}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${locations}" ${locations == location ? 'selected' : ''}>${locations}</option>
							        </c:otherwise>
							    </c:choose>
						 		</c:forEach>
	                        </select>
                      </div>

</div>
<div class="col-lg-2">
  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label style="font-family: Calibri;color: gray;"><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>

</div>

<div class="col-lg-3">

</div>

<div class="col-lg-3">

</div>
<div class="col-lg1-2 col-lg-2"style="background: #ccc;">
		          <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
</div>

 


</div>

</div>

  <div class="row" style="margin-top: 30px;">
   <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                       
                        <div class="col-lg-11 col-xs-10" style="margin-left: -15px;">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchStockPosting" placeholder="Search Items" />
											<button id="StockPosting" class="searchbutton"></button>
											</div>
											
				                  </div>
                       
                        
                       
                       
                       </div>
                       
                       <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="StockUploadingList" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                              <tr>
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="sku.id.label" /></th>
                             	<th><spring:message code="sku.description.label" /></th>
                             	
                             	<th>EAN</th>
                             	<th>Size</th>
                             	<th>Color</th>
                             	<th>Model</th>
                             	<th>Batch NO</th>
                             	<th ><spring:message code="costprice.label" /></th>
                             	<th>Stock Qty</th>
                             	<th>Action</th>
                             
                             	
                             
                            </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="stockPosting" items="${StockPostingList}" varStatus="theCount">
                         <tr>  
                           <td>${theCount.count +index-1}</td>
                           <td>${stockPosting.sku_id}</td>
                           <td>${stockPosting.skuDescription}</td>
                           <td>${stockPosting.ean}</td>
                           <td>${stockPosting.size}</td>
                           <td>${stockPosting.color}</td>
                           <td></td>
                           <td>${stockPosting.productBatchNo}</td>
                           <td>${stockPosting.skuCostPrice}</td>
                           <td>${stockPosting.sku_physical_stock}</td>
                           <td> <a style="color:#2e7ea7 !important;" href="#" onclick="return viewStockPostingData('${stockPosting.sku_id}','${flowUnder}','${stockPosting.verification_reference}','view')" title="View Item">View</a>&nbsp&nbsp&nbsp&nbsp<a style="color:#2e7ea7 !important;" href="#" onclick="return viewStockPostingData('${stockPosting.sku_id}','${flowUnder}','${stockPosting.verification_reference}','edit')" title="Edit Item">Edit</a>
                          </td>
                           </tr>
                           </c:forEach>
                         </tbody>
                     </table>
          </div>
            
         <%--  <div class="row" >
                    <div class="col-lg-6" style="text-align: center;">
							<input type="button" id="edit"  class="btn bg-olive btn-inline"  style="margin-left:3%;width: 16%;" value="Submit" />
						</div>
						
						 <div class="col-lg-6" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" style="margin-left:3%;margin-right: 1%;width: 16%;"  value="<spring:message code="cancel.label" />" />
						 
						 </div>
						
						</div> --%>
						
						 <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockUploading('warehouseStockUploading','${totalValue}','warehouse','menu','','');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockUploading('warehouseStockUploading','${index - 11}','warehouse','menu','','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockUploading('warehouseStockUploading','${index - 11}','warehouse','menu','','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockUploading('warehouseStockUploading','${totalValue}','warehouse','menu','','');">
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
              		  <input type="button" onclick="viewStockUploading('warehouseStockUploading',document.getElementById('pagination').value,'warehouse','menu','','');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
          
</div>
</div>
</div>
</section>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
      
  });
/*   $('#buildingtable').dataTable({
      "bPaginate": false,
      "bLengthChange": false,
      "bFilter": false,
      "bSort": false,
      "bInfo": false,
      "bAutoWidth": false
  }); */
  </script>
</body>
</html>