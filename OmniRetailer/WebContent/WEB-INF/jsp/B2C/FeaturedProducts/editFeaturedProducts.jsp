<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sreedhar
 * file name		        : B2C/FeaturedProducts/editFeaturedProduct.jsp
 * file type		        : JSP
 * description				: The newFeaturedProductGroupMaster form is displayed using this jsp
 * */ -->


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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/feature.js"></script>
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	
<style type="text/css">
.featuredfilter{
    height: 28px;
    padding: 3px 10px;
    width:100%
    }
@media (max-width: 768px){
.featuredfilter{
    height: 28px;
       padding: 3px 3px;
    /* position: absolute; */
    margin-left: 0%;
    width: 100%;}
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#featuredGroup").on('input',function(e){
		   $("#groupNameError").html("");
		   $(".groupNameError").html("");
	});
	$("#featuredTitle").on('input',function(e){
		   $("#featuredTitleError").html("");
		   $(".Error").html("");
	});
	$("#targetUrl").on('input',function(e){
		   $("#targetUrlError").html("");
		   $(".Error").html("");
	});
});
</script>        
</head>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12  col-xs-12">
	<div class="box box-primary " >
     <div class="box-header" style="text-align: left">
    	<h3><spring:message code="edit.featured.product.group.label" /></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
        <div class="row form-group" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
        	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateFeaturedProductGroupMasterForm('edit')" value="&nbsp;&nbsp;&nbsp;&nbsp;Save&nbsp;&nbsp;&nbsp;&nbsp;">
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewFeaturedProducts('featuredproducts','0');" value="Cancel">	 
        </div>
		<div class="row">
        	  <div class=" col-lg-6 col-sm-6 form-group">
        	 
        	 		<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
      					</div>
		               <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
		               <label><spring:message code="featured.group.name.label" /> <span style="color:red; font-size:2"></span></label>
		                <input type="text" class="form-control "  value="${featuredProductsResponse.featureId}" readonly="readonly" id="featuredGroup" placeholder="<spring:message code="enter.featured.group.name" />" />
		                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;"></span>
             		</div>
            
            </div>
            	 <div class=" col-lg-6 col-sm-6 form-group">
		
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
				</div>
				<div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
					<label><spring:message code="Title.label" /></label>
		       <input type="text" class="form-control "  value="${featuredProductsResponse.featuredTitle}" id="featuredTitle" placeholder="<spring:message code="enter.title.label" />" />
			     <span style="color:red; font-size:2" id="featuredTitleError"></span>
			    </div>
			
		</div>
        
          </div>
      
		<div class="row">
			 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
		</div>
		<div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
			<label><spring:message code="approved.by.label" /></label>
		 <input type="text" class="form-control form-group" value="${featuredProductsResponse.approvedBy}" id="approvedByFeatured" placeholder="<spring:message code="approved.by.label" />" />
		</div>
			</div>
			  <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
            <label><spring:message code="featured.startdate.label"/></label>
          <input class="form-control calendar_icon  startDateFeatured" readonly="readonly" value="${featuredProductsResponse.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="From Date" />
              <span style="color:red; font-size:2" id="startDateError"></span>
            </div>
 			</div>
			
			
		</div>
		<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
		 <div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-4 col-md-4 col-xs-7 col-sm-4" style="padding-left:0px">
           <label><spring:message code="status.label"/></label>
         <select class="form-control " name="status" id="status">
					<option value="1" ${'1' == featuredProductsResponse.status ? 'selected' : ''}>Active</option>
						<option value="0"${'0' == featuredProductsResponse.status ? 'selected' : ''}>Inactive</option>
			        </select>
			        </div> 
		</div>
		 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px">
                    <label><spring:message code="featured_end_date.label"/></label>
                    <input class="form-control calendar_icon  toDateFeatured" readonly="readonly" value="${featuredProductsResponse.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
                    <span style="color:red; font-size:2" id="endDateError"></span>
                  </div>
			</div>
		</div>
		<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
		<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4" style="padding-left:0px">
          <label><spring:message code="featured.type.label"/></label>
         <select class="form-control " name="featuredType" id="featuredtype">
						<option value="homepage" ${'homepage' == featuredProductsResponse.featuredType ? 'selected' : ''}>Home Page</option>
						<option value="category"${'category' == featuredProductsResponse.featuredType ? 'selected' : ''}>Category</option>
						<option value="brand"${'brand' == featuredProductsResponse.featuredType ? 'selected' : ''}>Brand</option>
						<option value="group"${'group' == featuredProductsResponse.featuredType ? 'selected' : ''}>Group</option>
			        </select>
			        </div> 
		</div>
		</div>
		<div class="row">
		<div class="col-lg-12">
		
            <div class="col-lg-1 col-md-1 col-xs-0 col-sm-1">
				</div>
				<div class="col-lg-10 col-md-10 col-xs-7 col-sm-10" style="padding-left:0px">
				<label><spring:message code="description.label" /></label>
				<textarea class="form-control form-group" id="description"  style="resize: none;" placeholder="<spring:message code="enter.description.label" />">${featuredProductsResponse.description}</textarea>
			</div>
		
		</div>
		</div>
		</br>

		<div class="row">
		
		<div class="col-lg-3 col-sm-3 col-xs-6">
		<div class="col-lg-10 col-md-10 col-xs-12 col-sm-12" style="padding-left:0px">
		  <label><spring:message code="product.category.label" /></label>
		<select class="form-control form-group" name="category" id="category">
		<option value="${featuredProductsResponse.productCategory}" >ALL</option>
		 <c:forEach var="category" items="${categories}">
                             	<%-- <option value="${category.categoryName}">${category.categoryDescription}</option> --%>
                             	<option value="${category.categoryName}" ${category.categoryName == featuredProductsResponse.productCategory ? 'selected' : ''}>${category.categoryDescription}</option>
						 		<%-- <option value="${category}">${category}</option> --%>
							 </c:forEach>

		</select>
		</div>
	</div>
		<div class="col-lg-3 col-sm-3 col-xs-12">
		<div class="col-lg-10 col-md-10 col-xs-12 col-sm-12" style="padding-left:0px">
		  <label><spring:message code="brand.category.label" /></label>
		 <select class="form-control" name="sub_category" id="brandcode">
                               <option value="" >ALL</option>
                               <c:forEach var="brand" items="${brands}">
                             	<%-- <option value="${category.categoryName}">${category.categoryDescription}</option> --%>
                             	<option value="${brand.bName}" >${brand.bDescription}</option>
						 		<%-- <option value="${category}">${category}</option> --%>
							 </c:forEach>
                              	
           </select>
		</div>
	</div>
		<div class="col-lg-3 col-sm-3 col-xs-12">
		<div class="col-lg-10 col-md-10 col-xs-12 col-sm-12" style="padding-left:0px;float:right;padding-right:0px;">
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
	<div class="col-lg-1 col-sm-0 col-xs-0" style="">
	<input type="hidden" value="edit" id="featurededit"/>
<%-- 	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" >
	               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
	               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
	               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
	              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
	               	</select> --%>
	</div>
	<div class="col-lg-2 col-sm-3 col-xs-12">
	<label> </label>
	<div class="col-lg-12 col-md-10 col-xs-10 col-sm-12" style="padding-left:0px;float:right;padding-right:0px;margin-top:20px;">
	<input type="button" class="btn btn-inline featuredfilter" onclick="getProductsByCriteria('','filter','0')" value="<spring:message code="newarrival.filter"/>"></div></div>
		</div>
<%--   		<div class="row">  
  		<br/>
  			<div class="form-group col-lg-12" style="text-align:center;margin-top:-19px;  margin-bottom: 0%;">
                 <input type="hidden" id="desc"/>
               	 <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
 					<div class="items">
  							<ul class="matchedStringUl receipt" style=""></ul>
					</div>
				</div>
               <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
          	</div>
  </div> --%>
  <div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th><spring:message code="sno.label" /></th>
                     <th><spring:message code="featured.item.label" /></th>
                     <th><spring:message code="item.description.label" /></th>
                     <th><spring:message code="sku.image.label" /></th>
                     <th><spring:message code="featured.text.label" /></th>
                     <th><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody   style="text-align: center;">
 			<c:forEach var="productList" items="${featuredProductsResponse.productList}" varStatus="theCount">
			<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
			<td id="sno${theCount.count}">${theCount.count}
			<input id="itemno${theCount.count}" type="hidden" value="${productList.sno}"/>
			</td>
			<td id="skuId${theCount.count}">${productList.skuId}</td>
  			 <td id="productDescription${theCount.count}">
  			 ${productList.productDescription}</td>
    		<td id="skuImage${theCount.count}">
    		<div class="col-lg-3 col-sm-3 col-xs-3">
    		<div id="picture${theCount.count}image">
    		 		<c:choose>
    		 		<c:when test="${ not empty productList.skuImage}">
    		 		<img style="float: left;width:65px;height:50px;" src="${productList.skuImage}">
    		 		</c:when>
    		 		<c:otherwise>
    		 		
    		 		</c:otherwise>
    		 		</c:choose>
    		 		</div></div>
    		 		<div class="col-lg-9 col-sm-9 col-xs-9">
				<input type='file'  id="picture${theCount.count}" onchange="loadImageFileAsURL('picture${theCount.count}',this);" style="" />
	                 <input type="hidden" id="picture${theCount.count}_refId" name="picture" value="" />
	                  <input type="hidden"  id="picture${theCount.count}_name" /></div>
	                 
	                  		</td>
				<td><input id="featuredText${theCount.count}" type="text" value="${productList.featuredText}" /></td>

				<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style='width:25px;cursor:pointer;' onclick="deleteItem(this);" title="Delete ${productList.productDescription}" />
				</td>
			</tr>
     </c:forEach> 
 			</tbody>
           </table>
            <div id="resultsearch"></div>
           <br/>
           
           <!--added by manasa  -->
			<input type="hidden" id="featuredType" value="${featureObj.featuredType}"> 
		 <input type="hidden" id="featurefrom" value="${featureObj.startDateStr}">
        <input type="hidden" id="featureto" value="${featureObj.endDateStr}">
         <input type="hidden" id="searchFeaturedGroup" value=""> 
				<!--added by manasa  -->
           
         </div>
         <div class="row" style="text-align: right; margin-top: 10px;">
        	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateFeaturedProductGroupMasterForm('edit')" value="<spring:message code="submit.label" />">
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