<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/outlet/editstorestockposting.jsp
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
    width: 100%;
}
        </style>



<script type="text/javascript">
$(document).ready(function(){
$('#StockPosting').click(function(){
        var searchStockPosting = $('#searchStockPosting').val();
        return viewStoreStockPostingData('','','${stockPosting.verification_code}','');
    })
    $('#searchStockPosting').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#StockPosting').click();//Trigger search button click event
        }
    });
    
	callCalender('from');
	callCalender('to');
	
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
			Stock Uploading-New
		</h3>
		</div>
	<div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
		

<div class="row" style="margin-top:15px;padding:14px">
<div class="col-lg-12">

<div class="row">
<div class="col-lg-2">
<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;"><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>

</div>
<div class="col-lg-2">

<div class="bootstrap-timepicker">
           <label style="font-family: Calibri;color: gray;">Verify Start Time</label>
             <input type="text" class=" form-control timepicker" value="00:00:00" name="startTime" id="startTime">
               <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
 			</div>
</div>

<div class="col-lg-2">
<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;">Verification Reference</label>
                	 	<input class="form-control" style="background-color: white;" id="verificationRef" type="text" value="${StockVerificationMasterChildList[0].verificationRef}" placeholder="Verification Reference" />
	              </div>


</div>

<div class="col-lg-2">


</div>
<div class="col-lg-2">
	               
 </div>
 <div class="col-lg-2">
	               
 </div>
</div>
<div class="row" style="margin-top: 20px;">
<div class="col-lg-2">
 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label style="font-family: Calibri;color: gray;"><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>

</div>
<div class="col-lg-2">
 <div class="bootstrap-timepicker">
         <label style="font-family: Calibri;color: gray;">Verify End Time</label>
            <input type="text" class=" form-control timepicker" value="00:00:00" name="endTime" id="endTime">
                <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
          </div>

</div>

<div class="col-lg-2">
<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label style="font-family: Calibri;color: gray;">Approved By</label>
                	 	<input class="form-control" style="background-color: white;" id="uploadReferenceId" type="text" value="${sessionScope.firstName}" placeholder="Upload Reference" />
	              </div>

</div>

<div class="col-lg-2">

</div>
<div class="col-lg-2">
	               
 </div>
 <div class="col-lg-2">
	               
 </div>
</div>

 


</div>

</div>

 <div class="row" style="margin-top: 30px;">
  
                       <input type="hidden" id="flowUnder" value="Outlet">  
                       <div class="form-group col-lg-12" style="text-align:center;margin-bottom: 0.0%;margin-top: 2%;">
                                         <input type="hidden" id="desc"/>
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems searchBar" style="padding: 4px" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl newstockUploading" style=""></ul>
								   				</div>
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
                             	<th>Verify Qty</th>
                             	<th>Dump Qty</th>
                             	<th>MRP</th>
                             	<th>Size</th> 
                             	<th>Color</th>
                             	<th>Model</th>
                             	<th>Batch NO</th>
                             	<th>Action</th>
                             	
                             
                            </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="item" items="${StockPostingList}" varStatus="theCount">
                        
                         <tr id="dynamicdiv${theCount.count}">  
                           <td id="slno${theCount.count}" class="slno">${theCount.count +index-1}</td>
                           <td id="skuid${theCount.count}">${item.sku_id}</td>
                           <td id="description${theCount.count}">${item.skuDescription}</td>
                           <td id="ean${theCount.count}">${item.ean}</td>
                           <td id="verifyqty${theCount.count}"></td>
                           <td id="dumpqty${theCount.count}"></td>
                           <td id="mrp${theCount.count}">${item.mrp}</td>
                           <td id="size${theCount.count}">${item.size}</td>
                           <td id="color${theCount.count}">${item.color}</td>
                           <td id="model${theCount.count}">${item.model}</td>
                           <td id="batchno${theCount.count}">${item.productBatchNo}</td>
         				   <td id="action${theCount.count}"></td>
                           <%-- <td id="stock${theCount.count}" contenteditable="true" onblur="addclassslNo('${theCount.count}')" >${item.sku_physical_stock}</td> --%> 
         
         <input type="hidden" id="slno${theCount.count}" value="${item.s_no}">
         <input type="hidden" id="plucode${theCount.count}" value="${item.pluCode}">
         <input type="hidden" id="postlocation${theCount.count}" value="${item.location}">
         <input type="hidden" id="bookqty${theCount.count}" value="${item.bookedQty}">
         <input type="hidden" id="dumpqty${theCount.count}" value="${item.dumpQty}">
         <input type="hidden" id="poststatus${theCount.count}" value="${item.status}">
         <input type="hidden" id="postverefby${theCount.count}" value="${item.verifiedby}">
          <input type="hidden" id="postverefcode${theCount.count}" value="${item.verification_code}">
          <input type="hidden" id="postverefref${theCount.count}" value="${item.verification_reference}">
          <input type="hidden" id="postmasterveref${theCount.count}" value="${item.masterVerificationCode}">
          <input type="hidden" id="postverifiedon${theCount.count}" value="${item.verifiedOnStr}">
                           </tr>
                         </c:forEach>
                         </tbody>
                     </table>
          </div>
            
         <input type="hidden" id="verefref" value="${StockPostingList[0].verification_reference}">
         <input type="hidden" id="masterveref" value="${StockPostingList[0].masterVerificationCode}">
         <input type="hidden" id="verifyby" value="${StockPostingList[0].verifiedby}">
         <input type="hidden" id="location" value="${StockPostingList[0].location}">
         <input type="hidden" id="status" value="${StockPostingList[0].status}">
         <input type="hidden" id="startindex" value="${StockPostingList[0].startIndex}">
         <input type="hidden" id="enddate" value="${StockPostingList[0].endDate}">
         <input type="hidden" id="startdate" value="${StockPostingList[0].startDate}">
         
						
	
	<div class="row" style="text-align: center;margin-top:50px">
						 <input type="button" class="btnCls" style=" " onclick="validateStoreStockPosting('new')" value="<spring:message code="submit.label" />" />
						<input type="button" class="btnCls " style="margin-left:50px" onclick="viewOutletStockUploading('outletStockUploading','0','outlet','menu','','');" value="<spring:message code="cancel.label" />" />
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