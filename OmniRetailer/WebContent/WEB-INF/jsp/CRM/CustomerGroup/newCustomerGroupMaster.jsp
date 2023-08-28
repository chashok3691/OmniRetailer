<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Akhil M
 * Created Date             : 4th Nov,2018.
 * file name		        : /jsp/CRM/CustomerViewAndNoification/customerGroup.jsp
 * file type		        : JSP
 * description				: The new customer group layout is displayed using this jsp.
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/crm/customerGroup.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script> --%>



<style type="text/css">
	.col-xs-12 {
	 padding: 5%; 
	 }
.form-group {
    margin-bottom: 5px;
}
a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 23px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px ;
    height: 23px;
    text-align: center;
    margin-bottom: 15px ;
    width: 100% !important;
}
a.buttonsearch{
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 26px 10px;
    background: #3c8dbc;
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
    font-weight: normal; 
	color: white;
    background-color: rgb(128,128,128);
    /* border-color: black; */
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
	callCalender('startDate');
	callCalender('endDate');
	

		<!-- $("#searchProduct").focus(); -->
});
</script>        
</head>
<body>


<!-- Main content -->


<section class="content">
<div class="row">
  <div class="col-xs-12" style="padding-top: 0px; padding-bottom: 0px;padding-right: 15px;padding-left: 15px;">
	<div class="box box-primary " style="padding: ">
	
	
	
     <div class="box-header" style="text-align: left">
    	<h3 align="center" style=" margin-top :10px; margin-bottom : 0px;">${operation} <spring:message code="new.customer.group.label" /></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
         </div>
     
		<div class="row" style="margin-right: 0px; padding :0px;">
		
		 	<div class="col-lg-3" style="">
		 	    <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="customergroupid.label"/><span class="requiredField">*</span></label>
                    
	                        <input  class="form-control form-group" type= "text" value = "${customerGroup.group_id}" id="groupId"/>
	                        <span id="groupIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
		 	
		 	</div>
		 	<div class="col-lg-3" style="">
		 	
		 	 <div class="col-lg-7" style="padding-left:0px;padding-right: 0px;">
		 	                         <label><spring:message code="groupcategory.label"/></label>
		 	 
            		<input  class="form-control  form-group" type= "text" value = "${ customerGroup.group_category}" id="groupCategory"/>
            		<span id="groupCategoryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
		 	
		 	</div>
		 	<div class="col-lg-3" style="">
		 	
		 		 <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
		 	                         <label><spring:message code="zone.label"/></label>
		 	   <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value="${customerGroup.zone}"><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
            	<!--  	<input type= "text"  class="form-control  form-group" value = "" id="zone"/> -->
				</div>
		 	</div>
		 	<div class="col-lg-3" style="">
		 	  <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="deal_start_date.label"/><span class="requiredField">*</span></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerGroup.startDate}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
		 	</div>
		 	</div>
		 
<div class="row" style="margin-right: 0px; padding :0px;">

            <div class="col-lg-3" style="">
		 	    <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="groupdescription.label"/></label>
                        <input type= "text" class="form-control form-group" value = "${customerGroup.group_description}" id="groupDescription"/>
                         <span id="groupDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                </div>
		 	
		 	</div>
		 	<div class="col-lg-3" style="">
		    <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
		 	             <label><spring:message code="occasion.status.label"/></label>
		 	<select class="form-control" id="status">
                          <option value="true">Active</option>
                          <option value="false">InActive</option>
	        </select> 		
		 	</div>
		 	</div>
		 	
		 	
		 	
		 	<div class="col-lg-3" style="">
            <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
		 	<label><spring:message code="location.label"/></label>
		 	 <select class="form-control" id="location" >
                           		 <option value="${customerGroup.location}"><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
	               		         <c:choose>
							      <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}</option>
							      </c:when>
							      <c:otherwise>
							      <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							     </c:otherwise>
							     </c:choose>
<%-- 							          <option value="${location}" ${location == storeLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					         </c:forEach>
	                        </select>
	                   	 
				</div>
		 	</div>
		 	
		 	
		 	<div class="col-lg-3" style="">
		 	  <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_end_date.label"/><span class="requiredField">*</span></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerGroup.endDate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
	              <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
		 	</div>
</div>
        	
        
        
			
  		<div class="row">  
  		<br/>
  			<div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;">
                 <input type="hidden" id="groupId"/>
               	 <input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style=""  />
				<div class="services">
 					<div class="items">
  						<ul class="matchedStringUl customerGroupMaster" style=""></ul>
					</div>
				</div>
               <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
          	</div>
          	
  
  </div>

                    
                          
  <div class="table-responsive">
             <table id="customersList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
					 <th><spring:message code="report.sno.label" /></th>               
                     <th><spring:message code="customer.mobile.number.label" /></th>  
                     <th><spring:message code="EmployeeForm.firstName" /></th>   
                     <th><spring:message code="EmployeeForm.lastName" /></th>   
                     <th><spring:message code="EmployeeForm.email" /></th>   
                     <th><spring:message code="area.label" /></th>   
                     <th><spring:message code="category.label" /></th>
                     <th><spring:message code="status.label" /></th>
                     <th><spring:message code="action.label"/><img id='Img' src="${pageContext.request.contextPath}/images/cancel.png" style="width:25px;cursor:pointer;" onclick="deleteAll();"/></th>
                 </tr>
               </thead>
 			<tbody  style="text-align: center;">
 	
 			 
 			
 			 <c:forEach var="customerDetails" items="${customerGroup.customerGroupItems}" varStatus="theCount">
 			 <tr id="dynamicdiv${theCount.count}">
 			 <td>${theCount.count + index}</td>
 			 <td>${customerDetails.mobile_no}</td>
 			 
 			
 			 <td>${customerDetails.first_name}</td>
 			
 			 <td>${customerDetails.last_name}</td>
 			 <td>${customerDetails.email_id}</td>
 			 <td>${customerDetails.area}</td>
 			 <td>${customerDetails.customer_category}</td>
             <td>Active</td>
 			 <td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:25px;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
			
 			 
 			 
 			  
 			 
 			
 		
 			 
 			 
 			 <tr>
 			 
 			 </c:forEach> 

 			</tbody>
           </table>
           
     
           <br>
         
         
      </div>   
         
         <div class="row" style="text-align: center; margin-top: 10px;">
        	<input type="button" id="submit"  class="btnCls" onclick="validateCustomerGroupMasterForm('new','0')" value="<spring:message code="submit.label" />">
        	<input type="button" class="btnCls buttonMargin" style="" onclick="viewCustomerGroupMaster('customerGroup','0',false)" value="<spring:message code="cancel.label" />">
			  
		 	
        </div>
        </div>
       
       
       
       <input type = "hidden" id="operation" value="${operation}"/>
       
        <div class="box-footer"></div>
 		 
         
      </form>
</div>
</div>
</div>

 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
        
  
        </script>


</section><!-- /.content -->


<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript">



</script>
<%-- <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.productGroupDataTables.js" type="text/javascript"></script> --%>

</body>
</html>