
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
    	<h3><spring:message code="viewNewArrivals.heading"/></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
        <div class="row form-group" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px"></div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
        	<!--  <input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateNewarrivalForm('new')" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="createNewArrivals.button.save"/>&nbsp;&nbsp;&nbsp;&nbsp;">-->
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewNewArrivals('newArrivals');" value="<spring:message code="createNewArrivals.button.cancel"/>">	 
        </div>
		<div class="row">
        	 <div class=" col-lg-6 col-sm-6 form-group">
        	 
        	 		<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2"></div>
		               <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px;margin-bottom: 3px">
		               <label><spring:message code="createNewArrivals.title.label"/><span style="color:red; font-size:2"></span></label>
		                <input type="text"  class="form-control" value="${newarrivalslist.newCategoryName}" readonly="readonly" id="newarrivalGroup" placeholder="<spring:message code="createNewArrivals.title.label.placeholder"/>">
		                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;position: absolute;"></span>
             		</div>
            
            </div>
             <div class=" col-lg-6 col-sm-6 form-group">
		
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
				</div>
				<div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px ;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.newArrivalType.label"/></label>
         <select class="form-control" id="newarrivalType" style="padding: 3px 4px;" disabled="disabled">
                            <%-- <option value="${newarrivalslist.newCategoryType}">${newarrivalslist.newCategoryType}</option>
                	 		<option value="newCategoryName"><spring:message code="createNewArrivals.newArrivalType.option.all.label"/></option>
	               		<option value="homepage"><spring:message code="createNewArrivals.option.homepage.label"/></option>
	               		<option value="category"><spring:message code="createNewArrivals.option.catageory.label"/></option>
	               		<option value="brand"><spring:message code="createNewArrivals.option.brand.label"/></option>
	              		<option value="group"><spring:message code="createNewArrivals.option.group.label"/></option>
	                --%>
	                <option value=""><spring:message code="createNewArrivals.newArrivalType.option.all.label"/></option>
	               		<option value="homepage"${'homepage' == newarrivalslist.newCategoryType ? 'selected' : ''}><spring:message code="createNewArrivals.option.homepage.label"/></option>
	               		<option value="category"${'category' == newarrivalslist.newCategoryType ? 'selected' : ''}><spring:message code="createNewArrivals.option.catageory.label"/></option>
	               		<option value="brand"${'brand' == newarrivalslist.newCategoryType ? 'selected' : ''}><spring:message code="createNewArrivals.option.brand.label"/></option>
	              		<option value="group"${'group' == newarrivalslist.newCategoryType ? 'selected' : ''}><spring:message code="createNewArrivals.option.group.label"/></option>
	              
	              	</select>
			        </div>
			
		</div>
         
          </div>
      
		<div class="row">
			 <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.startDate.label"></spring:message></label>
           <input class="form-control calendar_icon  fromNewarrivals" readonly="readonly" disabled="disabled" value="${newarrivalslist.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Start Date" />               <span style="color:red; font-size:2; position: absolute;" id="startDateError"></span>
            </div>
 			</div>
			 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.endDate.label"/></label>
                    <input class="form-control calendar_icon  toNewarrivals" disabled="disabled" readonly="readonly" value="${newarrivalslist.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />               <span style="color:red; font-size:2; position: absolute;" id="endDateError"></span>
                    <span style="color:red; font-size:2; position: absolute;" id="toNewarrivalsError"></span>
                  </div>
			</div>
			
			
		</div>
		<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px ;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.effectiveFrom.label"/></label>
          <input class="form-control calendar_icon  startDateFeatured" readonly="readonly" disabled="disabled" value="${newarrivalslist.effectiveFromStr}" style="background-color: white;" id="effective" size="20" type="text" onfocus="callCalender('effective')" onclick="callCalender('effective')" placeholder="Effective From" />               <span style="color:red; font-size:2; position: absolute;" id="effectiveError"></span>
               <span style="color:red; font-size:2; position: absolute;" id="startDateError"></span>
            </div>
 			</div>
		 <div class=" col-lg-6 col-sm-6 form-group">
            
  				<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
          </div>
          <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9" style="padding-left:0px;margin-bottom: 3px">
          <label><spring:message code="createNewArrivals.lastDate.label"/></label>
          <input class="form-control calendar_icon  startDateFeatured" readonly="readonly" disabled="disabled" value="${newarrivalslist.lastDateStr}" style="background-color: white;" id="last" size="20" type="text" onfocus="callCalender('last')" onclick="callCalender('last')" placeholder="Last Date" />               <span style="color:red; font-size:2; position: absolute;" id="effectiveError"></span>
               <span style="color:red; font-size:2; position: absolute;" id="startDateError"></span>
            </div>
 			</div>
		</div>
		


<div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.priceRange.label"/></label>
						<select class="form-control" name="pricerange" id="pricerange" onchange="getProductsByCriteria('','filter','0')" disabled="disabled">
                               
                               	<option value="${newarrivalslist.priceRange}" >${newarrivalslist.priceRange}</option>
                             	<option value="0-100" ><spring:message code="createNewArrivals.priceRange.option.100.label"/></option>
                             	<option value="100-300"><spring:message code="createNewArrivals.priceRange.option.300.label"/></option>
                             	<option value="300-500" ><spring:message code="createNewArrivals.priceRange.option.500.label"/></option>
                             	<option value="500-1000" ><spring:message code="createNewArrivals.priceRange.option.1000.label"/></option>
                             	<option value="1000-2000" ><spring:message code="createNewArrivals.priceRange.option.2000.label"/></option>
                             	<option value="2000-5000" ><spring:message code="createNewArrivals.priceRange.option.5000.label"/></option>
                             	<option value="5000- " ><spring:message code="createNewArrivals.priceRange.option.5001.label"/></option>
          						 </select>
          						 
                        
                    <span style="color:red; font-size:2; position: absolute;" id="endDateError"></span>
                  </div>
			</div>


			<div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.brandName.label"/></label>
					<select class="form-control" name="pricerange" id="brandcode" onchange="getProductsByCriteria('','filter','0')" disabled="disabled">
                               	<option value=""><spring:message code="createNewArrivals.brandName.option.all.label"/></option>
                             	  <c:forEach var="brand" items="${brands}">
                             	<option value="${newarrivalslist.brandId}" >${newarrivalslist.brandId}</option>
							 </c:forEach>
          						 </select>
                    <span style="color:red; font-size:2; position: absolute;" id="endDateError"></span>
                  </div>
				</div>




		</div><div class="row">
		 <div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.productCatageory.label"/></label>
					<select class="form-control" name="pricerange" id="category" onchange="getProductsByCriteria('','filter','0')" disabled="disabled">
                               	<option value="${newarrivalslist.categoryId}">${newarrivalslist.categoryId}<spring:message code="createNewArrivals.productCatageory.option.all.label"/></option>
                             			 <c:forEach var="category" items="${categories}">
                             	<option value="${newarrivalslist.categoryId}" ></option>
							 </c:forEach>
          						 </select>
                    
                    <span style="color:red; font-size:2; position: absolute;" id="endDateError"></span>
                  </div>
			</div>


			<div class=" col-lg-6 col-sm-6 form-group">
			<div class="col-lg-2 col-md-2 col-xs-0 col-sm-2">
                  </div>
                  <div class="col-lg-8 col-md-8 col-xs-7 col-sm-9 " style="padding-left:0px ;margin-bottom: 3px">
                   <label><spring:message code="createNewArrivals.productCatageory.groupID.label"/></label>
				<select class="form-control" name="pricerange" id="groupId" onchange="getProductsByCriteria('','filter','0')" disabled="disabled">
                               	<option value="${newarrivalslist.groupId}">${newarrivalslist.groupId}<spring:message code="createNewArrivals.groupID.option.all.label"/></option>
                             	  <c:forEach var="offerGroup" items="${groupsList}">
												<option value="${newarrivalslist.groupId}">${newarrivalslist.groupId}</option>
											 </c:forEach>
          						 </select>
                    
                    <span style="color:red; font-size:2; position: absolute;" id="endDateError"></span>
                  </div>
				</div>




		</div>
		<div class="row">
		<div class="col-lg-12">
		
            <div class="col-lg-1 col-md-1 col-xs-0 col-sm-1">
				</div>
				<div class="col-lg-10 col-md-10 col-xs-7 col-sm-10" style="padding-left:0px;;margin-bottom: 3px">
				<label><spring:message code="createNewArrivals.remark.label"/></label>
				<textarea class="form-control form-group" id="description" style="resize: none;" placeholder=<spring:message code="createNewArrivals.remark.Description.placeholder" /> readonly="readonly">${newarrivalslist.remarks}</textarea>
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
                </tr>
               </thead>
 			<tbody   style="text-align: center;">
 	<c:forEach var="newArrivalsList" items="${newarrivalslist.newArrivalProductsList}" varStatus="theCount">
			<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
			<td id="sno${theCount.count}">${theCount.count}
			<input id="itemno${theCount.count}" type="hidden" value="${newArrivalsList.serNo}"/>
			</td>
			<td id="skuId${theCount.count}">${newArrivalsList.skuId}</td>
  			 <td id="productDescription${theCount.count}">
  			 ${newArrivalsList.skuDesc}</td>
    		<td id="skuImage${theCount.count}">
    		<div class="col-lg-3 col-sm-3 col-xs-3">
    		<div id="picture${theCount.count}image">
    		 		<c:choose>
    		 		<c:when test="${ not empty newArrivalsList.image}">
    		 		<img style="float: left;width:65px;height:50px;" src="${newArrivalsList.image}">
    		 		</c:when>
    		 		<c:otherwise>
    		 		
    		 		</c:otherwise>
    		 		</c:choose>
    		 		</div></div>
    		 		<div class="col-lg-9 col-sm-9 col-xs-9">
				<input type='file'  id="picture${theCount.count}" onchange="loadImageFileAsURL('picture${theCount.count}',this);" style="" disabled="disabled" />
	                 <input type="hidden" id="picture${theCount.count}_refId" name="picture" value="" />
	                  <input type="hidden"  id="picture${theCount.count}_name" /></div>
	                 
	                  		</td>
				 <td><input id="featuredText${theCount.count}" type="text" value=""  readonly="readonly"></td>

			</tr>
     </c:forEach> 
 			</tbody>
           </table>
            <div id="resultsearch"></div>
           <br/>
         </div>
  			
  			 <!--added by manasa  -->
			<input type="hidden" id="newarrivaltype" value="${arrivalObj.newCategoryType}"> 
		 <input type="hidden" id="arrivalfrom" value="${arrivalObj.startDateStr}">
        <input type="hidden" id="arrivalto" value="${arrivalObj.endDateStr}">
         <input type="hidden" id="searchNewarrivalGroup" value=""> 
				<!--added by manasa  -->
  
         <div class="row" style="text-align: right; margin-top: 10px;">
        	<!--  <input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateNewarrivalForm('new')" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="createNewArrivals.button.save"/>&nbsp;&nbsp;&nbsp;&nbsp;"> -->
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewNewArrivals('newArrivals');" value="<spring:message code="createNewArrivals.button.cancel"/>">	 
        </div>
       
        <div class="box-footer"></div>
      </form>
</div>
</div>
</div>
</section><!-- /.content -->

<!-- /.content -->

