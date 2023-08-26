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
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 140%;
}
        </style>



<script type="text/javascript">
$(document).ready(function(){

	
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
			Stock Uploading-Edit
		</h3>
		</div>
	<div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
		


 
 
 
                       
                       <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;margin-top:50px">
                   
                     <table id="StockUploadingList" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             
                              <tr>
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="sku.id.label" /></th>
                             	<th><spring:message code="sku.description.label" /></th>
                             	<th>Verification Code</th>
                             	<th>EAN</th>
                             	<th>Size</th>
                             	<th>Color</th>
                             	<th>Batch NO</th>
                             	<th ><spring:message code="costprice.label" /></th>
                             	<th>Stock Qty</th>
                             
                             	
                             
                            </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="item" items="${StockPostingList}" varStatus="theCount">
                        
                         <tr>  
                           <td id="slno${theCount.count}">${theCount.count}</td>
                           <td id="skuid${theCount.count}">${item.sku_id}</td>
                           <td id="description${theCount.count}">${item.skuDescription}</td>
                           <td>${item.verification_code}</td>
                           <td id="ean${theCount.count}">${item.ean}</td>
                           <td id="size${theCount.count}">${item.size}</td>
                           <td id="color${theCount.count}">${item.color}</td>
                           <td id="productbatchno${theCount.count}">${item.productBatchNo}</td>
                           <td id="skucostprice${theCount.count}">${item.skuCostPrice}</td>
                           <td id="stock${theCount.count}" contenteditable="true" onblur="addclassslNo('${theCount.count}')" >${item.sku_physical_stock}</td>
          <input type="hidden" id="slnos${theCount.count}" value="${item.s_no}">
          <input type="hidden" id="verefcode${theCount.count}" value="${item.verification_code}">
         <input type="hidden" id="verefref${theCount.count}" value="${item.verification_reference}">
         <input type="hidden" id="masterver${theCount.count}" value="${item.masterVerificationCode}">
         <input type="hidden" id="verefby${theCount.count}" value="${item.verifiedby}">
         <input type="hidden" id="plucode${theCount.count}" value="${item.pluCode}">
         <input type="hidden" id="location${theCount.count}" value="${item.location}">
         <input type="hidden" id="status${theCount.count}" value="${item.status}">
         <input type="hidden" id="bookqty${theCount.count}" value="${item.bookedQty}">
         <input type="hidden" id="dumpqty${theCount.count}" value="${item.dumpQty}">
                           </tr>
                         </c:forEach>
                         </tbody>
                     </table>
          </div>
            
         
						
	
	<div class="row" style="text-align: center;margin-top:50px">
						 <input type="button" class="btnCls" style=" " onclick="updateStockUploading('update')" value="<spring:message code="submit.label" />" />
						<input type="button" class="btnCls " style="margin-left:50px" onclick="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');" value="<spring:message code="cancel.label" />" />
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

  </script>
</body>
</html>