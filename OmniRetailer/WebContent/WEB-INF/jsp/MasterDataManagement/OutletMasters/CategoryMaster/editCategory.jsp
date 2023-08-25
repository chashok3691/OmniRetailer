<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/editCategory.jsp
 * file type		        : JSP
 * description				: The new category form is displayed using this jsp
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
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/categoryMaster.js"></script>
	
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	 
	
	
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
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
    }
   .browsebutton:hover {
    background: grey !important;
}
.browsebutton {
    font-weight: bold;
    height: 28px;
    border-radius: 0px;
    padding: 2px 17px;
    background: grey;
    border: none;
}
.fileUpload {
    position: relative;
    overflow: hidden;
    /* margin: 10px; */
}

.companyimage{
width: 152px;
  margin-left: 15px;
    /* margin-left: -100%; */
   /*  margin-top: -10%; */
    margin-bottom:0px;
    object-fit: contain;
    height: 46px;
}
	 
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#categoryName").focus();
});
$("#categoryName").keydown(function(){
	    $(".Error").html("");
	    $("#categoryNameError").html("");
});
$("#categoryDescription").keydown(function(){
    $(".Error").html("");
    $("#categoryDescriptionError").html("");
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="masters.label" />
     <small><spring:message code="category.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="masters.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">

				<div class="box box-primary" style="padding: ">
                   <div class="box-header" style="text-align: center">
                   <br/>
                   <h3><spring:message code="edit.category.label" /></h3>
                   </div><!-- /.box-header -->
                   
                    <%-- 
                      <div class="col-lg-10 col-xs-10" style="padding-left:0px;padding-right:0px">
                           <div class="wrapper">	 
                               <input type="text"  class="form-control" style="" value="${searchName}" id="searchCoupons" placeholder="<spring:message code="searchByCoupon.label" />" />
							   <button id="mySearch" class="searchbutton"></button>
							</div>
						 <input type="hidden" id="searchname" value="${searchName}">
                    </div> --%>
                   <!-- form start -->
                     <form>
                    
                       <div class="box-body">
                        <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        			<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                          <div class="form-group" style="padding-left: 0px">
                           <div class="form-group col-lg-6">
                            <label><spring:message code="category.name.label" /> <font color="red" size="2">*</font></label>
                            <input type="text" onblur="criteria(this)" class="form-control" readonly="readonly" id="categoryName" placeholder="<spring:message code="enter.category.name" />" value="${categoryDetails.categoryName}" />
                            <div id="categoryNameError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
                         </div>
                            <div class="form-group col-lg-6">
                            
                            <div class="form-group col-lg-6">
                            <label><spring:message code="priority.label" /> <!-- <font color="red" size="2">*</font> --></label>
                            <input type="text" class="form-control" id="categoryPriority" style="width:100%;" placeholder="<spring:message code="enter.priority.number" />" value="${categoryDetails.sortOrder}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                            <div id="categorypriorityError" style="color: red;font-size: 2;font-weight: bold;"></div>
                            </div>
                            
                              <div class="form-group col-lg-6">
                            <label>B2C Visibility</label>
                           <select class="form-control"  id="b2cvisibility">
											 <option value="true"
												${categoryDetails.b2cCategory == true ? 'selected' : ''}>Yes</option>
											<option value="false"
												${categoryDetails.b2cCategory == false ? 'selected' : ''}>No</option> 
										</select>
                            
                         </div>
                         
                         </div>
                         
                         
                          <div class="form-group" style="padding-left: 0px">
                           <div class="form-group col-lg-6">
                             <label><spring:message code="category.image.label" /> <!-- <font color="red" size="2">*</font> --></label>
                                  <input id="categoryFile" class="form-control" value="" placeholder="Choose File" disabled="disabled">
                        		       <input type="hidden" id="category_refId" >
                        		       <input type="hidden" id="category_url" >
                        		      
                           </div>
                           <div class="form-group col-lg-2" style="padding-top: 21px">
                              <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Browse...</span>
			    			         <input id="categoryBtn" type="file" accept=".jpg ,.jpeg, .png, .PNG, .gif" onchange="addNameToTextBox('category',this);" class="upload">
						                </div>
                           </div>
                           
                             <div class=" col-lg-3 col-sm-3 col-xs-3" style="margin-top: 1.5%;">
                <div class="" title="Category Image" id="category_image" style="text-align: center;width:132px;;">
               <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
                    <img class="thumbnail companyimage" id="category_thumbnail" alt="No Image" src="${categoryDetails.image}">
											<label class="myFile" id="logo1_label"></label>
											</div>
            </div>        
                </div>
                  <div class="form-group " style="padding-left: 0px">
                           <div class="form-group col-lg-6">
                             <label>Category Banner<!-- <font color="red" size="2">*</font> --></label>
                                  <input id="categorybannerFile" class="form-control" value="" placeholder="Choose File" disabled="disabled">
                        		       <input type="hidden" id="categorybanner_refId">
                           </div>
                           <div class="form-group col-lg-2" style="padding-top: 21px">
                              <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Browse...</span>
			    			         <input id="categorybannerBtn" type="file" accept=".jpg ,.jpeg, .png, .PNG, .gif" onchange="addNameToTextBox('categorybanner',this);" class="upload">
						      </div>
                           </div>
                           
                             <div class=" col-lg-3 col-sm-3 col-xs-3" style="margin-top: 1.5%;">
                <div class="" title="Category Image" id="categorybanner_image" style="text-align: center;width:132px;;">
               <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
                    <img class="thumbnail companyimage" id="dealBannerbanner_thumbnail" alt="No Image" src="${categoryDetails.banner}">
											<label class="myFile" id="logo1banner_label"></label>
											</div>
            </div>        
                </div>
                
               <div class="form-group" style="padding-left: 0px">
                <div class="form-group col-lg-6">
                
                 <label style="color:gray;"><spring:message code="business.activity.label" /></label>
                                    <select class="form-control" id="businessActivity" name="businessActivity" >
                                    <option value="Restaurant" ${'Restaurant' == categoryDetails.businessActivity ? 'selected' : ''}>Restaurant</option>
                                    <option value="Retail Outlet" ${'Retail Outlet' == categoryDetails.businessActivity ? 'selected' : ''}>Retail Outlet</option>
                                    <option value="Warehouse" ${'Warehouse' == categoryDetails.businessActivity ? 'selected' : ''}>Warehouse</option>
                                    <option value="BackOffice" ${'BackOffice' == categoryDetails.businessActivity ? 'selected' : ''}>BackOffice</option>
                                    <option value="Corporate Office" ${'Corporate Office' == categoryDetails.businessActivity ? 'selected' : ''}>Corporate Office</option>
                                    <option value="Administration" ${'Administration' == categoryDetails.businessActivity ? 'selected' : ''}>Administration</option>
                                    <option value="Zone" ${'Zone' == ProductCategory.categoryDetails ? 'selected' : ''}>Zone</option>
                                    <option value="franchise" ${'franchise' == categoryDetails.businessActivity ? 'selected' : ''}>franchise</option>
                               
                                </select>
                                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg-2"></div>
                
                </div>

                
                         
                        <div class="form-group" style="padding-left: 0px">
                           <div class="form-group col-lg-12">
                            <label><spring:message code="category.description.label" /> <font color="red" size="2">*</font></label>
                            <textarea class="form-control" onblur="criteria(this)" id="categoryDescription" style="resize: none;" placeholder="<spring:message code="enter.category.description" />" >${categoryDetails.categoryDescription}</textarea>
                             <div id="categoryDescriptionError" style="color: red;font-size: 2;font-weight: bold;"></div>
                         </div>
                         </div>
                         
                       </div><!-- /.box-body -->
                      <br>			
						<div class="row" style="text-align: center;">
						<div class="form-group col-lg-12">
						 <input type="button" class="btnCls"  style="" onclick="saveCategory('edit');" value="<spring:message code="submit.label" />" />
						 <input type="button" class="btnCls buttonMargin"  onclick="return viewCategoryMaster('categoryMaster','0');" value="<spring:message code="cancel.label" />" />
						</div>
						</div>
					<br/>
										<input type="hidden" value="${maxRecords}" id="maxRecords"/>
					<input type="hidden" value="${searchName}" id="searchCategory"/>
					
                    <div class="box-footer">
                                    
                    </div>
             </form>
      </div>

</div>
</div>

</section><!-- /.content -->
</body>
</html>