\<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sreedhar
 * file name		        : B2C/FeaturedProducts/viewFeaturedproducts.jsp
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
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/feature.js"></script>
	
<style type="text/css">
</style>

<script type="text/javascript">
$(document).ready(function(){

/* 	$("#brand_name").focus();
var subCategories = $("#subCategories").val();
var parsedJson = jQuery.parseJSON(subCategories);     
var category = $("#category").val();
var subcategoryArray = new Array();
subcategoryArray = parsedJson[category];
if(subcategoryArray != undefined){
	var op = '';
	for(var i=0;i<subcategoryArray.length;i++){
		op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
	}
	$("#sub_category").html(op);
}

$('#category').change(function () {
	 var category = $("#category").val();
	 subcategoryArray = parsedJson[category];
	 	var op = '';
		for(var i=0;i<subcategoryArray.length;i++){
			op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
		}
		$("#sub_category").html(op);
   });
	$("#searchProduct").val($("#product").val()); */
	//if($("#searchProduct").val().trim()!="")
		<!-- $("#searchProduct").focus(); -->
});
</script>        
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12  col-xs-12">
	<div class="box box-primary ">
     <div class="box-header" style="text-align: left">
    	<h3><spring:message code="view.featuredProducts.label" /></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
        <div class="row form-group" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
        
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewFeaturedProducts('featuredproducts','0');" value="Cancel">	 
        </div>
		<div class="row">
        	 <div class=" col-lg-6 col-sm-6 form-group">
        	 
        	 		<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
      				</div>
		               <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
		               	<label><spring:message code="featured.group.name.label" /> <span style="color:red; font-size:2"></span></label>
		                <input type="text" class="form-control " value="${featuredProductsResponse.featureId}"  readonly id="featuredGroup" placeholder="<spring:message code="enter.featured.group.name" />" />
		                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
             		</div>
            
            </div>
           <div class=" col-lg-6 col-sm-6 form-group">
		
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
				</div>
				<div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
					<label><spring:message code="Title.label" /></label>
		       <input type="text" class="form-control " value="${featuredProductsResponse.featuredTitle}" readonly  id="title" placeholder="<spring:message code="enter.title.label" />" />
			    </div>
			
		</div>
         
          </div>
      
		<div class="row">
			 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
		</div>
		<div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
		<label><spring:message code="approved.by.label" /></label>
		 <input type="text" class="form-control " value="${featuredProductsResponse.approvedBy}"  readonly id="title" placeholder="<spring:message code="approved.by.label" />" />
		</div>
			</div>
			  <div class=" col-lg-6 col-sm-6 form-group">
            
  			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
           <label><spring:message code="featured.startdate.label"/></label>
          <input class="form-control calendar_icon " readonly="readonly"  readonly value="${featuredProductsResponse.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="From Date" />
            </div>
 			</div>
			
			
		</div>
		<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
		<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px">
            <label><spring:message code="status.label"/></label>
         <select class="form-control " name="status"  disabled="${isvisible}"  id="status">
						<option value="1" ${'1' == featuredProductsResponse.status ? 'selected' : ''}>Active</option>
						<option value="0"${'0' == featuredProductsResponse.status ? 'selected' : ''}>Inactive</option>
			        </select>
			        </div> 
		</div>
		 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px">
                  <label><spring:message code="approved.by.label" /></label>
                    <input class="form-control calendar_icon "  readonly readonly="readonly" value="${featuredProductsResponse.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
                  </div>
			</div>
		</div>
		<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
		<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
          </div>
          <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4" style="padding-left:0px">
          <label><spring:message code="featured.type.label"/></label>
         <select class="form-control " name="featuredType" disabled="${isvisible}" id="featuredtype">
						<option value="homepage" ${'homepage' == featuredProductsResponse.featuredType ? 'selected' : ''}>${featuredProductsResponse.featuredType}</option>
						
			        </select>
			        </div> 
		</div>
		</div>
		<br>
		<div class="row">
		<div class="col-lg-12">
		
            <div class="col-lg-1 col-md-1 col-xs-1 col-sm-1">
				</div>
				<div class="col-lg-10 col-md-10 col-xs-7 col-sm-10" style="padding-left:0px">
				<label><spring:message code="description.label" /></label>
				<textarea class="form-control form-group" id="description"  readonly="readonly" style="resize: none;" placeholder="<spring:message code="enter.description.label" />">${featuredProductsResponse.description}</textarea>
			</div>
		
		</div>
		</div>
		<div class="row">
		
		<div class="col-lg-4 col-sm-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px">
		  <label><spring:message code="product.category.label" /></label>
		<select class="form-control form-group" disabled="${isvisible}"  name="category" id="category">
		<option value="Select" >${featuredProductsResponse.productCategory}</option>
		</select>
		</div>
	</div>
	<div class="col-lg-4 col-sm-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px">
		  <label><spring:message code="brand.category.label" /></label>
		 <select class="form-control" name="sub_category" disabled="${isvisible}" id="sub_category">
                               <option  value="Select" ></option>
                             
                              	
           </select>
		</div>
	</div>
		<div class="col-lg-4 col-sm-4">
		<div class="col-lg-10 col-md-10 col-xs-10 col-sm-10" style="padding-left:0px;float:right;padding-right:0px;">
		  <label><spring:message code="pricerange.category.label" /></label>
		 <select class="form-control" name="sub_category" disabled="${isvisible}" id="sub_category">
                               <option value="Select" ></option>
                             
                              	
           </select>
		</div>
	</div>
		</div>

	
  <div class="table-responsive">
             <table id="skusList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th><spring:message code="sno.label" /></th>
                     <th><spring:message code="featured.item.label" /></th>
                     <th><spring:message code="item.description.label" /></th>
                     <th><spring:message code="sku.image.label" /></th>
                     <th><spring:message code="featured.text.label" /></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 				<c:forEach var="productList" items="${featuredProductsResponse.productList}" varStatus="theCount">
			<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
			<td id="sno${theCount.count}">${theCount.count}</td>
			<td id="skuId${theCount.count}">${productList.skuId}</td>
  			 <td id="productDescription${theCount.count}">
  			 ${productList.productDescription}</td>
    		<td id="skuImage${theCount.count}">
    		<c:choose>
    		 		<c:when test="${ not empty productList.skuImage}">
    		 		<img style="float: left;width:65px;height:50px;" src="${productList.skuImage}">
    		 		</c:when>
    		 		<c:otherwise>
    		 		
    		 		</c:otherwise>
    		 		</c:choose>
				<%-- <input type='file'  id="picture${theCount.count}" onchange="loadImageFileAsURL('picture${theCount.count}',this);" style="float:right;" />
	                 <input type="hidden" id="picture${theCount.count}_refId" name="picture" />
	                  <input type="hidden"  id="picture${theCount.count}_name" />
	                  		<div id="picture${theCount.count}image"></div> --%>
	                  		</td>
				<td><input id="featuredText${theCount.count}" type="text" readonly="readonly" value="${productList.featuredText}" /></td>
			</tr>
     </c:forEach>    
 			</tbody>
           </table>
           <br/>
         </div>
         
         <!--added by manasa  -->
			<input type="hidden" id="featuredType" value="${featureObj.featuredType}"> 
		 <input type="hidden" id="featurefrom" value="${featureObj.startDateStr}">
        <input type="hidden" id="featureto" value="${featureObj.endDateStr}">
         <input type="hidden" id="searchFeaturedGroup" value=""> 
				<!--added by manasa  -->
         
         <div class="row" style="text-align: right; margin-top: 10px;">
        
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewFeaturedProducts('featuredProducts','0');" value="Cancel">	 
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