<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/editSubCategory.jsp
 * file type		        : JSP
 * description				: The new subcategory form is displayed using this jsp
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
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/subCategoryMaster.js"></script>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
	  #sectionsList{
 overflow-y: auto;
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
	$("#subCategoryName").focus();
});
$("#subCategoryName").keydown(function(){
    $(".Error").html("");
    $("#subCategoryNameError").html("");
});
$("#subCategoryDescription").keydown(function(){
	$(".Error").html("");
	$("#subCategoryDescriptionError").html("");
});
</script>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	 


</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="masters.label" />
     <small><spring:message code="sub.category.master.label" /></small>
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
                        <h3><spring:message code="edit.sub.category.label" /></h3>
                         </div><!-- /.box-header -->
                         <!-- form start -->
                          <form>
                           <div class="box-body">
                            <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                           	  <div class="row" style="padding: 0% 1%;">
                           	    <div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-7">
                                  <label><spring:message code="category.name.label" /></label>
                                  <select class="form-control" name="categoryName" id="categoryName">
                                             <c:forEach var="category" items="${categoriesList}">
												<option value="${category.categoryName}" ${category.categoryName == subCategoryDetails.categoryName ? 'selected' : ''}>${category.categoryDescription}</option>
											</c:forEach>
                                           </select>
                               </div>
                               </div>
                               <div class="row" style="padding: 0% 1%;">
								<div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-7">
                                  <label><spring:message code="sub.category.name.label" /> <font color="red" size="2">*</font></label>
                                  <input type="text" onblur="criteriaSlashes(this)" class="form-control" readonly="readonly" id="subCategoryName" placeholder="<spring:message code="enter.sub.category.name" />" value="${subCategoryDetails.subcategoryName}" />
                                   <span id="subCategoryNameError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></span>
                                </div>
                                </div>
                                 
                                  <div class="row" style="padding: 0% 1%;">
									<div class="form-group col-lg-1"></div>
									<div class="col-lg-7">
										<label><spring:message code="sections.label" /></label> <input
											class="form-control form-group" onblur="criteria(this)" id="sections"
											style="resize: none;"
											placeholder="<spring:message code="enter.subCategoty.section.label" />"></input>
									</div>
									<div class="col-lg-1">
										<a onclick="appendSections('sections')">
											<h2 style="">
												<i class="fa fa-plus-circle" aria-hidden="true" style="cursor: pointer;" ></i>
											</h2>
										</a>
									</div>
								</div>

								<div class="row" style="padding: 0% 1%;">
									<div class="form-group col-lg-1"></div>
									<div class="col-lg-7">

										<section  class="form-control form-group" 
											id="sectionsList"  style="height: 100px" multiple="multiple" >
											<c:forEach var="sectionList" items="${subCategoryDetails.subcategorySections}">
											<option value="${sectionList.sectionName}">${sectionList.sectionName}</option>
											</c:forEach>
											
											</section>
									</div>
								</div>
                                 
                                 <div class="row" style="padding: 0% 1%;">
								<div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-4">
                                  <label><spring:message code="sub.category.image.label" /> <!-- <font color="red" size="2">*</font> --></label>
                                  <input id="subCategoryFile" class="form-control" value="" placeholder="Choose File" disabled="disabled">
                        		       <input type="hidden" id="subCategory_refId">
                        		       <input type="hidden" id="subCategory_url" value="${subCategoryDetails.image}">
                                </div>
                                 <div class="col-lg-2" style="margin-top: 18px">
                                  <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Browse...</span>
			    			         
			    			         <input id="subCategoryBtn" type="file" accept=".jpg ,.jpeg, .png, .PNG, .gif" onchange="addNameToTextBox('subCategory',this);" class="upload">
						               
						                
						                </div>
                                 </div>
                                   <div class=" col-lg-3 col-sm-3 col-xs-3" style="margin-top:1%">
            <div class="" title="Sub Category Image" id="subCategory_image" style="text-align: center;width:150px;;">
            <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
            <img class="thumbnail companyimage" id="subCategory_thumbnail" alt="No Image" src="${subCategoryDetails.image}">
											<label class="myFile" id="logo1_label"></label>
											</div>
            </div>        
                                 
                                </div>
                               <div class="row" style="padding: 0% 1%;">
								<div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-7">
                                  <label><spring:message code="sub.category.description.label" /> <font color="red" size="2">*</font></label>
                                  <textarea class="form-control" onblur="criteria(this)" id="subCategoryDescription" style="resize:none;" placeholder="<spring:message code="enter.sub.category.description" />" >${subCategoryDetails.subcategoryDescription}</textarea>
                                  <span id="subCategoryDescriptionError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></span>
                                </div>
                                </div>
                          </div><!-- /.box-body -->
                           
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls"  onclick="saveSubCategory('edit');" value="<spring:message code="submit.label" />" />
						 <input type="button" class="btnCls buttonMargin"  onclick="return viewSubCategoryMaster('subCategoryMaster','0');" value="<spring:message code="cancel.label" />" />
						</div>
					<br/>
					
					
					<input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchSubCategory"/>
					
                    <div class="box-footer">
                                    
                    </div>
             </form>
      </div>

</div>
</div>
<script>
/* $("#subCategory_refId").val($("#subCategory_thumbnail").val()); */
</script>
</section><!-- /.content -->

</body>
</html>