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
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	callCalender('DateEmp1');
	
			 
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
			Man/Woman Power
		</h3>
		
		 <div id="ErrorEmp" style="text-align:center;color:red;font-weight:bold;">Configure Event to Access Man Power</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${successManpower}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive" style="pointer-events:none">
             <div class="row">
             
             
             <div class="col-lg-12">
  <div class="col-lg-4" style="padding-left:0px">
 
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control"   value="${eventRef}" id="eventrefEmp" placeholder="Event Ref" readonly="readonly"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                      <select class="form-control" id="outletEmp" disabled="disabled" >
<c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>	                        </select>
                         </div>
             </div>
             </div>
             
              
              <div class="col-lg-12">
  <div class="col-lg-4" style="padding-left:0px">
  <div class="col-lg-6" style="padding-left:0px">
  <label><spring:message code="customer.newfeedback.emptyspace"/></label>
                       <input class="form-control" readonly="readonly"
											style="background-color: white;" name="DateEmp1"
											id="DateEmp1" size="20" type="text"
											value=""
											onfocus="callCalender('DateEmp1')"
											onclick="callCalender('DateEmp1')" placeholder="DD/MM/YYYY"  />
                          
                         </div>
  
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
            
             </div>
             </div>
             
             
           <div class="col-lg-12" >
                       
				                      <div class="col-lg-11 col-xs-11" style="margin-top:10px;padding-left: 0px">
                      	 
                   
                    <input type="text" class="form-control "  onkeyup="ManpowerMulSearch('1');" id="searchManpower1" placeholder="Search Man power" style="height:30PX;margin-bottom: 0px;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;">
                   
                     <div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl eventmanPower1" style=""></ul>
						   					</div>
										</div>
                    </div>
				                      
                   
                  
                 
								            <div class="col-lg-1" style="padding: 0px;margin-top:10px">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="deleteAll('Manpower');" value="Delete All">
								</div> 
		                    
                  
                  
                   
                 
                        
                        
                    </div>
  
  <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap; padding-left: 15px; padding-right: 15px;max-height: 400px;min-height: 200px;">
                   
                     <table id="eventManpower1" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	                <th><spring:message code="s.no.label" /></th>
                             	                <th><spring:message code="emp.id.label" /></th>
                                                <th><spring:message code="Delivery_Person.Name" /></th>
                                                <th style="width: 32%;"><spring:message code="role.label" /></th>
                                                <th style="width: 15%;">DOJ</th>
                                                 <th><spring:message code="EmployeeForm.location" /></th>
                                                <th><spring:message code="contact.no.label" /></th>
                                                <th>Action</th>
                                               

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                           
                           
                         </tbody>
                     </table>
                    </div>
                    
                    </div>
                    
                      <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
							<input type="button" class="btnCls" style="padding: 4px 12px; !important"
								onclick="createEventManpower('new');"
								value="<spring:message code="submit.label" />" />
							 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor: pointer;" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
						</div>  
                    </div>
                    
                    
                    
        
                    
                    
 
                    
                    
  
  
  
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
</body>
</html>