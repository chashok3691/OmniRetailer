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
    margin-bottom:4px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}


.numberCircle {
       border-radius: 50%;
    width: 25px;
    height: 25px;
    padding: 0px;
    background: #fff;
    border: 2px solid #666;
    color: #666;
    text-align: center;
    font: 20px Arial, sans-serif;
    margin-right:10px;
    cursor: pointer;
}

 .activeBlock {
      
    background:#3c8dbc !important;
    
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	for(var i = 1; i<11;i++){
	callCalender('DateInventory'+i);	
	}
	
	 var dateTime = getCurrentDate();
 	  var date = dateTime.split(' ');
 	  date = date[0].split('/');
 	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
	 var noOfDaysend = daydiff(parseDate($('#EventEnd').val()), parseDate(formatedDate));


	debugger;
	if($("#statusoftheevents").val() !="Approved" || noOfDaysstart < -1 || noOfDaysend > 0 ){
		$("#eventinventoryeditable").css("pointer-events","none");
		for(var i = 1; i<11;i++){
		$("#submitEventInventory"+i).css("display","none");
		 $("#ErrorInventory"+i).html("Note: Inventory can be added only one day before the Approved Event.");
		}
		
	}
	
	  if(parseFloat($("#lengthofMenu").val()) == 0 ){
			for(var i = 1; i<11;i++){
			 $("#ErrorInventory"+i).html("Please add atleast one item to Menu first. ");
				$("#eventinventoryeditable").css("pointer-events","none");
			}
				
	  }
	
		for(var i = 1; i<11;i++){
	 if($("#EventInventory"+i+" tr").length == 1 ){   
		 $("#inventoryprint"+i).css("display","none");
		 
	 }
		}
	
		debugger;
	 
	 var length  = $("#lengthofMenu").val();
	 var lengthofInvval  = parseInt($("#lengthofInv").val());
	 
	 
	 for(var i = 1; i<11;i++){
	 if($("#EventInventory"+i+" tr").length != 1 || parseFloat(length) == 0 ){
		 
		 $("#searchPackage"+i).css("pointer-events","none");
		 $("#EventInventory"+i).css("pointer-events","none");
		 $("#submitEventInventory"+i).css("display","none");
		 $("#deleteinv"+i).css("pointer-events","none");
		 
	 }
	 }
	
	 
	   var pageno = $("#SubmittionCountpage").val();
	   if(pageno == ""){
		   pageno = 1; 
	   }
	   
		 $("#inv"+pageno).trigger('click');	
	
	 
		
		});
		
</script>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Inventory Issue
		</h3>
		
		 
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive" id="eventinventoryeditable">
         <div class="row">
         
         
         
         
         <c:forEach var="invPageCount" items="${eventMastersList.array}">
         
           <c:if test="${invPageCount == 1}">
          <div class="row" style="padding: 15px;;padding-top: 0px;padding-bottom:0px">         
          </c:if>
           <c:if test="${invPageCount != 1}">
          <div class="row" style="padding: 15px;;padding-top: 0px;padding-bottom:0px;">         
          </c:if>
          
          
    <div class="row eventInventoryList" id="InventorymulSubmition${invPageCount}" style="padding: 15px;display: none;">       
     <div id="ErrorInventory${invPageCount}" style="text-align:center;color:red;font-weight:bold;">${errInventory}</div>
    <div id="SuccessInventory${invPageCount}" style="text-align:center;color:blue;font-weight:bold;">${successInventory}</div>
         
         
         <div class="col-lg-12">
  <div class="col-lg-4" style="padding-left: 0px;">
  
  
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control"   id="eventrefInventory" value="${eventRef}" placeholder="" readonly="readonly"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                      <select class="form-control" id="outletInventory" disabled="disabled">
                           		<c:forEach var="location1" items="${locationsList}" >
				                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>
	                           
	                        </select>
                         </div>
             </div>
             </div>
             
             <c:set var = "ftab" scope = "session" value = "1"/>
           <%--   <c:set var = "stab" scope = "session" value = "1"/>
             <c:set var = "ttab" scope = "session" value = "1"/>
             <c:set var = "fttab" scope = "session" value = "1"/> --%>
             
             
     
             
             
               <div class="col-lg-12">
  <div class="col-lg-4" style="padding-left: 0px;">
  
   <div class="col-lg-6" style="padding-left:0px">
  <label><spring:message code="customer.newfeedback.emptyspace"/></label>
                          
     	                    <c:set var = "dateunique" scope = "session" value = "1"/>
     		                <c:set var = "dateuniqueforempty" scope = "session" value = "1"/>
                            <c:forEach var="inventories" items="${eventMastersList.eventInventoryIssueDetails}"  varStatus="theCount">
                            
                            <c:if test="${inventories.submissionCount == invPageCount && dateunique == 1 }">
                           <c:set var = "dateunique" scope = "session" value = "${dateunique+1}"/>
                           	<c:set var = "dateuniqueforempty" scope = "session" value = "${dateuniqueforempty+1}"/>
                            <input class="form-control" readonly="readonly"
											style="background-color: white;" name="DateInventory${invPageCount}"
											id="DateInventory${invPageCount}" size="20" type="text"
											
											onfocus="callCalender('DateInventory${invPageCount}')"
											onclick="callCalender('DateInventory${invPageCount}')" placeholder="DD/MM/YYYY"  value="${inventories.createdDateStr}"/>
											</c:if>
											
											 
							</c:forEach>
							<c:if test="${dateuniqueforempty == 1}">
                           <c:set var = "dateuniqueforempty" scope = "session" value = "${dateuniqueforempty+1}"/>
                            <input class="form-control" readonly="readonly"
											style="background-color: white;" name="DateInventory${invPageCount}"
											id="DateInventory${invPageCount}" size="20" type="text"
											
											onfocus="callCalender('DateInventory${invPageCount}')"
											onclick="callCalender('DateInventory${invPageCount}')" placeholder="DD/MM/YYYY"  value="${inventories.createdDateStr}"/>
							</c:if>	   
							
							
							
							
                          
                         </div>
                         <input type="hidden" id="DateInventory${invPageCount}${invPageCount}" value="">
  
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             
             </div>
             </div>
             
              <div class="col-lg-12" style="">
                       
				                      <div class="col-lg-11 col-xs-11" style="margin-top:10px;padding-left: 0px;">
                      	 
                   
                    <input type="text" class="form-control " value="" id="searchPackage${invPageCount}" onkeyup="InventoryMulSearch('${invPageCount}')" placeholder="Search Inventory" style="height:30PX;margin-bottom: 0px;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;">
                   
                    <div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl eventInventory${invPageCount}" style=""></ul>
						   					</div>
										</div>
                    </div>
				                    
								            <div class="col-lg-1" style="padding: 0px;margin-top:10px">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="deleteAllInventory('${invPageCount}');" id="deleteinv${invPageCount}" value="Delete All">
								</div> 
		                    
                  
                  
                   
                 
                        
                        
                    </div>
         <div class="col-lg-12">
        
          <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="EventInventory${invPageCount}" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr >
                             	                <th><spring:message code="s.no.label" /></th>
                                                <th>Item code</th>
                                                <th style="width: 50%;">Item Description</th>
                                                 <th>Price</th>
                                                 <th>Tax Code</th>
                                                <th>Tax %</th>
                                                <th>CGST</th>
                                                <th>SGST</th>
                                                <th>UOM</th>
                                                <th>Size</th>
                                                <th>Issued Qty</th>
                                                <th>Action</th>

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="inventories" items="${eventMastersList.eventInventoryIssueDetails}"  varStatus="theCount">
                            <c:if test="${inventories.submissionCount == invPageCount}">
                         	 <tr id="dynamicdiv${ftab}" class="dynamicdiv${ftab}${invPageCount}">
                         	 	<td class="slnoInventory${invPageCount}" id="itemno${ftab}">${ftab}</td>
                         	 	<td id="skuIDInventory${invPageCount}${ftab}">${inventories.itemCode}</td>
                             	<td id="skuNameInventory${invPageCount}${ftab}">${inventories.item_description}</td>
                             	<td id="saleprice${invPageCount}${ftab}">${inventories.price}</td>
                             	<td id="taxCategory${invPageCount}${ftab}">${inventories.taxCode}</td>
                             	<td id="taxvalue${invPageCount}${ftab}">${inventories.tax_value}</td>
                             	<td id="sgsttaxvalue${invPageCount}${ftab}">${inventories.sgst}</td>
                             	<td id="cgsttaxvalue${invPageCount}${ftab}">${inventories.cgst}</td>
                             	<td id="uomInventory${invPageCount}${ftab}">${inventories.uom}</td>
                             	<td id="sizeInventory${invPageCount}${ftab}">${inventories.size}</td>
                             	<td id="transferqtyInventory${invPageCount}${ftab}" contenteditable="true">${inventories.quantity}</td>
                             	<td id="Del${ftab}${invPageCount}"><img id="Img${ftab}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItemInventory(this,'${invPageCount}');" title="Delete ${inventories.itemCode}"/></td>
                             	<c:set var = "ftab" scope = "session" value = "${ftab+1}"/>
                             </tr>
                              <input type="hidden" id="dateforinventory${invPageCount}" value="${inventories.createdDateStr}">
                             </c:if>
                            </c:forEach>
                          
                         </tbody>
                     </table>
                    </div>
  
         
         </div>
         
           
                    <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
           
           
           
       <c:if test="${not empty eventMastersList.userActivitiesForInventory}">
<input type="button" class="btnCls" style="padding: 4px 12px; !important" id="submitEventInventory${invPageCount}" onclick="createEventInventory('edit','${invPageCount}')" value="<spring:message code="submit.label" />" />                          
	</c:if>
           
							
							 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" id="inventoryprint${invPageCount}" onclick="PrintEventDetails('${eventRef}','${eventMastersList.eventStatus}','edit','Inventory');" value="Print" /> 
														 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
						</div> 
         
         
         </div>
         
   
         
         </div>
         
         
         </c:forEach>
         
     
     
  </div>
  <div class="row" style="margin-left: 15px;pointer-events:all">
  
 <c:forEach var="invPageCount" items="${eventMastersList.array}">
   <c:if test="${invPageCount <= 4}">
<div class="col-lg-4 numberCircle activeBlock" id="${invPageCount}Inv" style="background:#ccc;"><a style="color:white;" id="inv${invPageCount}" onclick="appendEventInventory('${invPageCount}');">${invPageCount}</a></div>
</c:if>
 <c:if test="${invPageCount > 4}">
 <c:if test="${invPageCount == 5}">
 <a onclick="loadmore()" id="loadmore" style="color: #099ff7;  max-height: fit-content;padding-top: 2px;cursor:pointer;">Show more..</a>
 </c:if>
 
<div class="col-lg-4 numberCircle activeBlock" id="${invPageCount}Inv" style="background:#ccc;display: none;"><a style="color:white;" id="inv${invPageCount}" onclick="appendEventInventory('${invPageCount}');">${invPageCount}</a></div>
<c:if test="${invPageCount == 10}">
 <a onclick="loadless()" id="loadless" style="color: #099ff7;display: none; max-height: fit-content;padding-top: 2px;cursor:pointer;">Show less..</a>
 </c:if>

</c:if>
</c:forEach>

 </div>
                  
                    </div>
                     </div>
                    


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
             
   
</div>
</div>

</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
           
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
        <input type="hidden" id="SubmittionCount" value="1"/>
         <input type="hidden" id="SubmittionCountpage" value="${SubmittionCountval}"/>
</body>
</html>