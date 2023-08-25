	<!--
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : chaithanya.v
 * file name		        : B2c/newArrivals/newArrivals.jsp
 * file type		        : JSP
 * description				: The newArrivals  is displayed using this jsp
  -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/newarrivals.js"></script>
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	
<style type="text/css">
.newarrivalfilter{
       height: 89px;
    width: 80%;
    background: #eee;
    /* padding: 17px; */
    font-size: 24px;
    /* text-overflow: ellipsis; */
    border: 1px solid #333;
    white-space: normal;
    margin-bottom: 10px;
    }
</style>

<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	$("#to").on('input',function(e){
		   $("#endDateError").html("");
		   $(".Error").html("");
	});
	
	$("#from").on('input',function(e){
		   $("#startDateError").html("");
		   $(".Error").html("");
	});
});
</script>        
</head>
<body onload="foo">
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12  col-xs-12">
	<div class="box box-primary ">
     <div class="box-header" style="text-align: left">
    	<h3><spring:message code="new.newarrival.label" /></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
      <div class="col-lg-9 col-sm-9 form-group">
		<div class="row">
		<div class="col-lg-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;">
		  <label><spring:message code="newarrival.category" /></label>
		<select class="form-control form-group"  name="category" id="category">
		<option value="" >ALL</option>
		 <c:forEach var="categories" items="${categories}">
                             	<option value="${categories.categoryName}" ${categories.categoryName == category ? 'selected' : ''}>${categories.categoryDescription}</option>
							 </c:forEach>
		</select>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;">
		  <label><spring:message code="newarrival.brand" /></label>
		 <select class="form-control" name="sub_category" id="brandcode">
                               <option value="" >ALL</option>
                               <c:forEach var="brand" items="${brands}">
                             	<option value="${brand.bName}" ${brand.bName == brandcode ? 'selected' : ''}>${brand.bDescription}</option>
							 </c:forEach>
                              	
           </select>
		</div>
	</div>
		<div class="col-lg-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;">
		  <label><spring:message code="newarrival.group" /></label>
		 <select class="form-control" name="sub_category" id="groupid">
                               <option value="" >ALL</option>
                               <c:forEach var="brand" items="${brands}">
                             	<option value="${brand.bName}" ${brand.bName == product.category ? 'selected' : ''}>${brand.bDescription}</option>
							 </c:forEach>
                              	
           </select>
		</div>
	</div>
		</div>
			<div class="row">
		<div class="col-lg-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;">
		  <label><spring:message code="pricerange.category.label" /></label>
                            	<select class="form-control" name="pricerange" id="pricerange">
                               	<option value="" >ALL</option>
                             	<option value="0-100" >&#8377;0 - &#8377;100</option>
                             	<option value="100-300">&#8377;100 - &#8377;300</option>
                             	<option value="300-500" >&#8377;300 - &#8377;500</option>
                             	<option value="500-1000" >&#8377;500 - &#8377;1000</option>
                             	<option value="1000-2000" >&#8377;1000 - &#8377;2000</option>
                             	<option value="2000-5000" >&#8377;2000 - &#8377;5000</option>
                             	<option value="5000- " >above  &#8377; 5000</option>
          						 </select>
		</div>
	</div>
		<div class="col-lg-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;">
		  <label><spring:message code="newarrival.startdate" /></label>
		 <input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
		</div>
	</div>
		<div class="col-lg-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;">
		  <label><spring:message code="newarrival.enddate" /></label>
		 <input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		</div>
	</div>
		</div>
		</div>
		<div class="col-lg-3 col-sm-3 ">
		<label></label>
		<div>
		<input type="button" class="btn btn-inline newarrivalfilter" onclick="getProductsByCriteria('','filter','0')" value="<spring:message code="newarrival.filter"/>"></div>
		<a><span></span></a>
		</div>
  		<div class="col-lg-12 col-sm-12 col-xs-12 form-group">  
  		  <div class="col-lg-1 col-xs-2" style="margin-top: 0px;    padding-left: 0px;">
	                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="filterNewarrivals('','filter','0');">
	               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
	               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
	               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
	              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
	               	</select>
	           </div>
  			<div class="form-group col-lg-11 col-xs-10" style="text-align:center;margin-top:-0px;  margin-bottom: 0%;">
                 <input type="hidden" id="desc"/>
               	 <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
 					<div class="items">
  							<ul class="matchedStringUl filter" style=""></ul>
					</div>
				</div>
               <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
          	</div>
  </div>
  <div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                              </c:if>
                              <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                          		<c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true}"> 
                             		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	</c:if>
                             	</c:forEach>
                				 <th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                             	 <th><spring:message code="skuid.label" /></th>
                                 <th style="text-align: left;"><spring:message code="sku.description.label" /></th>
                                 <th><spring:message code="product.id.label" /></th>
                                 <th><spring:message code="manufacturer.label" /></th>
                                 <th><spring:message code="model.name.label" /></th>
                                 <th><spring:message code="status.label" /></th>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                </tr>
               </thead>
 			<tbody   style="text-align: center;">
 			 
                          <c:forEach var="sku" items="${skuList}">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${sku.skuId}' /></td>
                              </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                          		<c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true}"> 
                             		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${sku.skuId}' /></td>
                             	</c:if>
                            </c:forEach>
                            	<td>${theCount.count}</td>
                            	 <td>${sku.skuId}</td>
                                 <td style="text-align: left;">${sku.skuDescription}</td>
                                 <td>${sku.productId}</td>
                                 <td></td>
                                 <td></td>
                                 <td>${sku.status}</td>
                                 <td>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSKU('${sku.skuId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSKU('${sku.skuId}','edit')">Edit</a>
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                         			 <c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditSKU('${sku.skuId}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach>
                                 </td> 
 							</tr>
                             </c:forEach>
 			</tbody>
           </table>
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="filterNewarrivals('','','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return filterNewarrivals('','','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return filterNewarrivals('','','${index - (maxRecords+1)}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="filterNewarrivals('','','${totalValue}'); ">
              	</div> 
              	</c:if>
              </div>
           <br/>
         </div>
         <div class="row" style="text-align: right; margin-top: 10px;">
        	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateFeaturedProductGroupMasterForm('new')" value="<spring:message code="submit.label" />">
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewFeaturedProducts('featuredproducts','0');" value="Cancel">	 
        </div>
        </div>
        <div class="box-footer"></div>
      </form>
</div>
</div>
</div>
</section><!-- /.content -->
</body>
</html>