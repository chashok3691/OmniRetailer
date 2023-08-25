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
      <script src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=initAutocomplete"
         async defer></script>
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
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	 var dateTime = getCurrentDate();
  	  var date = dateTime.split(' ');
  	  date = date[0].split('/');
  	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
 	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
 	var noOfDaysend = daydiff(parseDate($('#EventEnd').val()), parseDate(formatedDate));

 	if($("#statusoftheevents").val() !="Approved"){
 	$("#notetext").html("Note: Menu can be added only after Approved the Event.");
 	}
 	/* else if( noOfDaysstart < -1 && parseFloat($("#lengthofMenu").val()) == 0 ){
 		$("#notetext").html("Note: Menu can be added only one day before the Approved Event.");
 	}else if(noOfDaysend > 0 && parseFloat($("#lengthofMenu").val()) == 0 ) {
 	$("#notetext").html("Note: Menu can not  be added after Expiry date of the Event");
 	}else{
 		$("#notetext").html("");
 	} */
 		
	
	if($("#statusoftheevents").val() !="Approved"){
		$("#eventmenueditable").css("pointer-events","none");
		$("#submitEventmenu").css("display","none");
		
	}
	
	
	
	 if($("#eventMenu tr").length == 1){   
		 $("#menuPrint").css("display","none");
	 }
	 
	 if(parseFloat($("#lengthofMenu").val()) > 0 ){
		 $("#eventMenuName").css("background-color","#ccc");
			$("#eventMenuName").css("pointer-events","none");
			
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
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			MENU/PRODUCTS
		</h3>
		
		 <div id="ErrorMenu" style="text-align:center;color:red;font-weight:bold;">${errMenu}</div>
           <div id="SuccessMenu" style="text-align:center;color:blue;font-weight:bold;">${successMenu}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive"  id="eventmenueditable">
             <div class="row">
             
             
             <div class="col-lg-12">
  <div class="col-lg-4"></div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control" id="eventreference"  value="${eventMastersList.eventReference}" readonly="readonly" placeholder="Event Reference"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                     
                  <select class="form-control" id="outletLocation" disabled="disabled">
                           		<c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == eventMastersList.outletStoreLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>
	                           
	                        </select>
                         </div>
             </div>
             </div>
             
             
  <div class="col-lg-12" style="
    margin-top: 10px;margin-bottom: 20px;">
  <div class="col-lg-5" style="padding-left : 0px">
                           <div class=" col-lg-12" style="padding-left : 0px">
   <div id="notetext" style="color:red;font-weight:bold;"></div>
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                        <label>Event Menu Name <span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control"   value="${eventMastersMenuList.menu_name}" style="" id="eventMenuName"/>
                          
                         </div>
                         </div>
                           <div class=" col-lg-12" style="padding-left : 0px">
                          <%--   <label>Status</label>
                      <select class="form-control" id="status" style="width:60%">
                           		 <option value="Active" ${eventMastersMenuList.menu_status ==  true ? 'selected' : ''} >Active</option>
                           		 <option value="Disabled" ${eventMastersMenuList.menu_status == false ? 'selected' : ''} >Disabled</option>
	                           
	                        </select> --%>
                         </div>
                         
                          
                         
                         
                         
                         
  </div>
  <div class="col-lg-3">
     
  </div>
  <div class="col-lg-4" style="">
  
                       
                       
                         <div class=" col-lg-12" style="padding:0px">
                     <label>Remarks</label>
                    <textarea rows="4" cols="3" class="form-control" style="resize: none;" id="eventremarks">${eventMastersMenuList.remarks}</textarea>
                         </div>
  </div>
  
  </div>
           <div class="row" style="padding-left: 8px; padding-right: 8px;">
                       <div class="col-lg-2 col-xs-2">
                       <label>Category</label>
				                      	 <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')" style="margin-bottom: 0px;">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
				                      </div>
				                      
				                      <!--added by manasa  -->
				                      <div class="col-lg-9 col-xs-8" style="padding-left:0px;margin-top:18px">
                      	 
                   
                    <input type="text" class="form-control  searchItems" value="" id="searchPackage" placeholder="Search Menu" style="height:30PX;margin-bottom: 0px;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;">
                    <input type="hidden" id="packaging" value="">
                           <div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl eventManagement" style=""></ul>
						   					</div>
										</div>
                   
                   
                    </div>
				                      
                   
                  
                 
								            <div class="col-lg-1" style="padding-left: 0px;margin-top:18px">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="deleteAll('menu');" value="Delete All">
								</div> 
		                    
                  
                  
                   
                 
                        
                        
                    </div>
  
  <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap; padding-left: 8px; padding-right: 8px;">
                   
                     <table id="eventMenu" class="table table-bordered table-hover" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr >
                                             	
                             	                <th><spring:message code="s.no.label" /></th>
                                                <th><spring:message code="skuid.label" /></th>
                                                <th style="width:45%"><spring:message code="sku.description.label" /></th>
                                                <th>Size</th>
                                                <th>Crust</th>
                                                 <th>Department</th>
                                                <th>POS price</th>
                                                <th>Sale Price</th>
                                                <th><spring:message code="EmployeeForm.action" /></th>

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                               <c:forEach var="eventsmenulist" items="${eventMastersMenuList.menu_item_details}"  varStatus="theCount">
                          
<tr id="dynamicdiv${theCount.count}">
<td class="slno" id="itemno${theCount.count}">${theCount.count}</td>
<td id="skuID${theCount.count}">${eventsmenulist.sku_id}</td>

<td id="description${theCount.count}">${eventsmenulist.item_desc}</td>
<td id="measuremrntRange${theCount.count}">${eventsmenulist.measureRange}</td>
<td id="utility${theCount.count}">${eventsmenulist.utility}</td>
<td id="department${theCount.count}">${eventsmenulist.department}</td>
<td id="posPrice${theCount.count}">${eventsmenulist.mrp}</td>
<td id="salePrice${theCount.count}">${eventsmenulist.unit_price}</td>
<td id="Del${theCount.count}"><img id="Img${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:35%;cursor:pointer;" onclick="deleteItem(this);" title="Delete ${eventsmenulist.sku_id}"/></td>
      <input type='hidden' id="pluCodeMenu${theCount.count}" value="${eventsmenulist.pluCode}"/>
      <input type='hidden' id="categoryMenu${theCount.count}" value="${eventsmenulist.category_name}"/>
	<input type='hidden' id="avlqtyMenu${theCount.count}" value="${eventsmenulist.item_availability}"/>
	<input type='hidden' id="qtyMenu${theCount.count}" value="${eventsmenulist.qty}"/>
	<input type='hidden' id="uomMenu${theCount.count}" value="${eventsmenulist.unit_of_measurement}"/>
		<input type='hidden' id="imgMenu${theCount.count}" value="${eventsmenulist.item_icon}"/>
    <input type='hidden' id="pic1Menu${theCount.count}" value="${eventsmenulist.item_picture1}"/>
	<input type='hidden' id="pic2Menu${theCount.count}" value="${eventsmenulist.item_picture2}"/>
</tr>
                            
                      </c:forEach>    
                         </tbody>
                     </table>
                    </div>
  
  
  
  </div>
                    <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
                    
                    
                     <c:if test="${not empty eventMastersList.userActivitiesForMenu}">
                       <input type="button" class="btnCls" style="padding: 4px 12px; !important" id="submitEventmenu" onclick="createEventMenu('edit');" value="<spring:message code="submit.label" />" />                                       
                       </c:if>
                    
							
							 <input type="button" class="btnCls"  style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" id="menuPrint" onclick="PrintEventDetails('${eventMastersList.eventReference}','${eventMastersList.eventStatus}','edit','');" value="Print" /> 
														 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
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
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>