
<!--
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : chaithanya.v
 * file name		        : B2c/newArraival/createNewArraival.jsp
 * file type		        : JSP
 * description				: The newArraival form is displayed using this jsp
  -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    
    
    


<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	    <script type="text/javascript" src="/${pageContext.request.contextPath}/js/validation.js"></script>
         <script type="text/javascript" src="/${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="/${pageContext.request.contextPath}/js/b2c/newarrivals.js"></script>
          <link rel="stylesheet" type="text/css" href="/${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="/${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="/${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="/${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	
<style type="text/css">
.featuredfilter{
    height: 28px;
    padding: 3px 10px;
    width: 100%;
    }
    @media (max-width: 768px){
.featuredfilter{
    height: 28px;
       padding: 3px 3px;
    /* position: absolute; */
    margin-left: 0%;
    width: 100%;
    }
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#newarrivalGroup").on('input',function(e){
		   $("#groupNameError").html("");
		   $(".groupNameError").html("");
	});
	$("#featuredTitle").on('input',function(e){
		   $("#featuredTitleError").html("");
		   $(".Error").html("");
	});
	callCalender('from');
	callCalender('to'); 
	callCalender('effective');
	callCalender('last'); 
	
	$(".toNewarrivals").on('input',function(e){
		   $("#toNewarrivalsError").html("");
		   $(".Error").html("");
	});
	
	$(".fromNewarrivals").on('input',function(e){
		   $("#fromNewarrivalsError").html("");
		   $(".Error").html("");
	});
});
</script>        


<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12 col-xs-12">
	<div class="box box-primary ">
     <div class="box-header" style="text-align: left">
    	<h3><spring:message code="createNewArrivals.heading"/></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
        <div class="row form-group" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px"></div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
        	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateNewarrivalForm('new')" value="<spring:message code="submit.label" />">
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewNewArrivals('newArrivals');" value="<spring:message code="createNewArrivals.button.cancel"/>">	 
        </div>
		<div class="row">
        	 <div class=" col-lg-6 col-sm-6 form-group">
        	 
        	 		<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2"></div>
		               <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px;margin-bottom: 3px">
		               <label><spring:message code="createNewArrivals.title.label"/><span style="color:red; font-size:2">*</span></label>
		                <input type="text"  class="form-control " value="" id="newarrivalGroup" placeholder="<spring:message code="createNewArrivals.title.label.placeholder"/>">
		                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;position: absolute;font-weight: bold;"></span>
             		</div>
            
            </div>
             <div class=" col-lg-6 col-sm-6 form-group">
		
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
				</div>
				<div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px ;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.newArrivalType.label"/></label>
         <select class="form-control" id="newarrivalType" style="padding: 3px 4px;" >
                	 		<option value=""><spring:message code="createNewArrivals.newArrivalType.option.all.label"/></option>
	               		<option value="homepage"><spring:message code="createNewArrivals.option.homepage.label"/></option>
	               		<option value="category"><spring:message code="createNewArrivals.option.catageory.label"/></option>
	               		<option value="brand"><spring:message code="createNewArrivals.option.brand.label"/></option>
	              		<option value="group"><spring:message code="createNewArrivals.option.group.label"/></option>
	               	</select>
			        </div>
			
		</div>
         
          </div>
      
		<div class="row">
			 <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.startDate.label"></spring:message><span style="color:red; font-size:2">*</span></label>
           <input class="form-control calendar_icon  fromNewarrivals" readonly="readonly" value="${featuredProductsResponse.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Start Date" />               <span style="color:red; font-size:2; position: absolute;" id="startDateError"></span>
            </div>
 			</div>
			 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.endDate.label"/></label>
                    <input class="form-control calendar_icon  toNewarrivals" readonly="readonly" value="${featuredProductsResponse.startDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />               <span style="color:red; font-size:2; position: absolute;" id="endDateError"></span>
                    <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="toNewarrivalsError"></span>
                  </div>
			</div>
			
			
		</div>
		<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px ;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.effectiveFrom.label"/></label>
          <input class="form-control calendar_icon  startDateFeatured" readonly="readonly" value="${featuredProductsResponse.startDateStr}" style="background-color: white;" id="effective" size="20" type="text" onfocus="callCalender('effective')" onclick="callCalender('effective')" placeholder="Effective From" />               <span style="color:red; font-size:2; position: absolute;" id="effectiveError"></span>
               <span style="color:red; font-size:2; position: absolute;font-weight: bold;font-weight: bold;" id="startDateError"></span>
            </div>
 			</div>
		 <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.lastDate.label"/></label>
          <input class="form-control calendar_icon  startDateFeatured" readonly="readonly" value="${featuredProductsResponse.startDateStr}" style="background-color: white;" id="last" size="20" type="text" onfocus="callCalender('last')" onclick="callCalender('last')" placeholder="Last Date" />              
           <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="lastDateError"></span>
            </div>
 			</div>
		</div>
		


<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.priceRange.label"/></label>
						<select class="form-control" name="pricerange" id="pricerange" onchange="getProductsByCriteria('','filter','0')">
                               
                               	<option value="" ><spring:message code="createNewArrivals.priceRange.option.all.label"/></option>
                             	<option value="0-100" ><spring:message code="createNewArrivals.priceRange.option.100.label"/></option>
                             	<option value="100-300"><spring:message code="createNewArrivals.priceRange.option.300.label"/></option>
                             	<option value="300-500" ><spring:message code="createNewArrivals.priceRange.option.500.label"/></option>
                             	<option value="500-1000" ><spring:message code="createNewArrivals.priceRange.option.1000.label"/></option>
                             	<option value="1000-2000" ><spring:message code="createNewArrivals.priceRange.option.2000.label"/></option>
                             	<option value="2000-5000" ><spring:message code="createNewArrivals.priceRange.option.5000.label"/></option>
                             	<option value="5000- " ><spring:message code="createNewArrivals.priceRange.option.5001.label"/></option>
          						 </select>
          						 
                        
                    <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="endDateError"></span>
                  </div>
			</div>


			<div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.brandName.label"/></label>
					<select class="form-control" name="pricerange" id="brandcode" onchange="getProductsByCriteria('','filter','0')">
                               	<option value=""><spring:message code="createNewArrivals.brandName.option.all.label"/></option>
                             	  <c:forEach var="brand" items="${brands}">
                             	<option value="${brand.bName}" >${brand.bName}</option>
							 </c:forEach>
          						 </select>
                    <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="endDateError"></span>
                  </div>
				</div>




		</div><div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.productCatageory.label"/></label>
					<select class="form-control" name="pricerange" id="category" onchange="getProductsByCriteria('','filter','0')">
                               	<option value=""><spring:message code="createNewArrivals.productCatageory.option.all.label"/></option>
                             			 <c:forEach var="category" items="${categories}">
                             	<option value="${category.categoryName}" ${category.categoryName == featuredlist.productCategory ? 'selected' : ''}>${category.categoryDescription}</option>
							 </c:forEach>
          						 </select>
                    
                    <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="endDateError"></span>
                  </div>
			</div>


			<div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.productCatageory.groupID.label"/></label>
				<select class="form-control" name="pricerange" id="groupId" onchange="getProductsByCriteria('','filter','0')">
                               	<option value=""><spring:message code="createNewArrivals.groupID.option.all.label"/></option>
                             	  <c:forEach var="offerGroup" items="${groupsList}">
												<option value="${offerGroup.groupId}">${offerGroup.groupId}</option>
											 </c:forEach>
          						 </select>
                    
                    <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="endDateError"></span>
                  </div>
				</div>




		</div>
		<div class="row">
		<div class="col-lg-12">
		
            <div class="col-lg-1 col-md-1 col-xs-0 col-sm-1">
				</div>
			<div class="col-lg-10 col-md-10 col-xs-7 col-sm-10" style="padding-left:0px;;margin-bottom: 3px">
				<label><spring:message code="createNewArrivals.remark.label"/></label>
				<textarea class="form-control form-group" id="description" style="resize: none;" placeholder=<spring:message code="createNewArrivals.remark.Description.placeholder"/>/></textarea>
			    <span style="color:red; font-size:2; position: absolute;font-weight: bold;" id="descriptionError"></span>
			</div>
		
		</div>
		</div>
		<br>

		
		</div>
  <div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th><spring:message code="sno.label" /></th>
                     <th><spring:message code="featured.item.label" /></th>
                     <th><spring:message code="item.description.label" /></th>
                     <th><spring:message code="sku.image.label" /></th>
                     <th><spring:message code="newarrival.text.label" /></th>
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
         </div>
  			
  
         <div class="row" style="text-align: right; margin-top: 10px;">
        	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateNewarrivalForm('new')" value="<spring:message code="submit.label" />" >
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewNewArrivals('newArrivals');" value="<spring:message code="createNewArrivals.button.cancel"/>">	 
        </div>
       
        <div class="box-footer"></div>
      </form>
</div>
</div>
</div>
</section><!-- /.content -->

<!-- /.content -->

