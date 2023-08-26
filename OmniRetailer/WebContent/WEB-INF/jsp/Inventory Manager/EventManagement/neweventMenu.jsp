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
		
		 <div id="ErrorMenu" style="text-align:center;color:red;font-weight:bold;">Configure Event to Access Menu</div>
           <div id="SuccessMenu" style="text-align:center;color:blue;font-weight:bold;">${successMenu}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive" style="pointer-events:none">
             <div class="row">
             
             
             <div class="col-lg-12">
  <div class="col-lg-4"></div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control" id="eventreference"  value="${eventRef}" readonly="readonly" placeholder="Event Reference"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                      <select class="form-control" id="outletLocation" disabled="disabled">
                           		<c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>
	                           
	                        </select>
                         </div>
             </div>
             </div>
             
             
  <div class="col-lg-12" style="
    margin-top: 10px;margin-bottom: 20px;">
  <div class="col-lg-5" style="padding-left : 0px">
                           <div class=" col-lg-12" style="padding-left : 0px">
  
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                        <label>Event Menu Name <span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control"   value="" style="" id="eventMenuName"/>
                          
                         </div>
                         </div>
                           <div class=" col-lg-12" style="padding-left : 0px">
                           <!--  <label>Status</label>
                      <select class="form-control" id="status" style="width:60%">
                           		 <option value="Active">Active</option>
                           		 <option value="Disabled">Disabled</option>
	                           
	                        </select> -->
                         </div>
                         
                          
                         
                         
                         
                         
  </div>
  <div class="col-lg-3">
     
  </div>
  <div class="col-lg-4" style="">
  
                       
                       
                         <div class=" col-lg-12" style="padding:0px">
                     <label>Remarks</label>
                    <textarea rows="4" cols="3" class="form-control" style="resize: none;" id="eventremarks"></textarea>
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
                             <tr>
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
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
                            
                         </tbody>
                     </table>
                    </div>
  
  
  
  </div>
                    <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
							<input type="button" class="btnCls" style="padding: 4px 12px; !important"
								onclick="createEventMenu('new');"
								value="<spring:message code="submit.label" />" />
						 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor: pointer;" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
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