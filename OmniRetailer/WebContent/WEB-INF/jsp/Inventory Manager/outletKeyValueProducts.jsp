<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/Supplies Report/suppliesReport.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
</head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.fa1{
  
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
  
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
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
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
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
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

</script>
<body>



<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
      <div class="box-header" style="text-align: center;">
                            <h3 class="box-title">Key Value Products</h3>
       </div>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
              <div class="col-lg-12" style="background: #f4f4f4;">
                    <div class="col-lg-9">
                    <div class="row">
                       <div class="form-group col-lg-3">
                                            <label>KVP Ref</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="kvpRef" value="${employee.firstName}" id="kvpRef"  style=" width: 80%" />
                          </div>
                      <div class="form-group col-lg-3">
                       <label>Product Group Ref</label>
                       <select class="form-control" name="productGroup" id="productGroup" style="width: 80%;">
	                                        <option value="" >ALL</option>
	                                        <c:forEach var="groupsList" items="${groupsList}">
	                            			<option value="${groupsList.groupId}" >${groupsList.groupId}</option>
											</c:forEach>
	                  </select>
                      </div>
                    <div class="form-group col-lg-3">
                        <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		     <label><spring:message code="offer_start_date.label"/></label>
                	 	      <input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                    </div>
                    
                    </div>
                    </div>
                    
                     <div class="row">
                       <div class="form-group col-lg-3">
                                            <label>Description</label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="kvpRef" value="${employee.firstName}" id="kvpRef"  style=" width: 80%" />
                          </div>
                      <div class="form-group col-lg-3">
                       <label>Product Group Name</label>
                            <input type="text" onblur="criteria(this)" class="form-control" name="productGroupRef" value="${employee.firstName}" id="productGroupRef"  style=" width: 80%" />
                      </div>
                    <div class="form-group col-lg-3">
                 		     <label>End Date</label>
                	 	      <input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                    </div>
                    
                     </div>
                    </div>
                     <div class="form-group col-lg-3">
                       <label style="">Location</label>
                       <select id ="location" multiple="multiple" class="form-control" >
    							<c:forEach var="locationList" items="${locationsList}">
									<option value="${locationList}">${locationList}</option>
								</c:forEach>
    				 	</select>
                     </div>
                  </div>
                 
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                      </div>
                       <div class="col-lg-3">
                      </div>
                     <div class="col-lg-3">
                      </div>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                 <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewoutletSuppliersMovement('outletSuppliersMovement','0','outlet','menu');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                       
                    </div>
                    
                   
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                                <th style="width:40px!importtant">SKU ID</th>
                                <th>Description</th>
                                <th>EAN</th>
                                <th style="text-align: left;">Measure Range</th>
                              	 <th style="width: 98px !important;">Color</th>
                                 <th>Size</th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="stockDetails" items="${bomreports}" varStatus="thecount">
                         	 <tr>
                                <td>${thecount.count}</td>
                                 <td >${stockDetails.receiptCreatedStr}</td>
                                <td>${stockDetails.location}</td>
                                <td>${stockDetails.skuId}</td>
                                <td style="text-align: left;">${stockDetails.description}</td>
                                <td></td>
                                <td>${stockDetails.suppliedQty}</td>
                                <td>${stockDetails.receivedQty}</td>
                                <td>${stockDetails.price}</td>
                                <td>${stockDetails.cost}
                              
                                </td>
                             </tr>
                               <c:set var="dataExists" value="true"></c:set>
                            </c:forEach>
                            
                         
                            
                         </tbody>
                     </table>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletSuppliersMovement('outletSuppliersMovement','${totalValue}','outlet','menu');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletSuppliersMovement('outletSuppliersMovement','${index - 11}','outlet','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletSuppliersMovement('outletSuppliersMovement','${index - 11}','outlet','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletSuppliersMovement('outletSuppliersMovement','${totalValue}','outlet','menu')">
              	</div> 
              	</c:if>
              	
              	
              	
              	
              	 <!--added by manasa  -->

<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords-maxRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewoutletSuppliersMovement('outletSuppliersMovement',document.getElementById('pagination').value,'outlet','menu')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>