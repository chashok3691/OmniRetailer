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
	    $("#Error").html("");
});
$("#subCategoryDescription").keydown(function(){
    $("#Error").html("");
});



</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">

				<div class="box box-primary" style="padding: ">
                     <div class="box-header" style="text-align: center">
                     <br/>
                        <h3><spring:message code="view.sub.category.label" /></h3>
                         </div><!-- /.box-header -->
                         <!-- form start -->
                          <form>
                           <div class="box-body">
                           <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                           	   <div class="row" style="padding: 0% 1%;">
                                  <div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-7">
                                  <label><spring:message code="category.name.label" /></label>
                                  <select class="form-control" disabled="disabled" name="categoryName" id="categoryName">
                                             <c:forEach var="category" items="${categoriesList}">
												<option value="${category}" ${category == subCategoryDetails.categoryName ? 'selected' : ''}>${category}</option>
											</c:forEach>
                                           </select>
                               </div>
                               </div>
                                <div class="row" style="padding: 0% 1%;">
								<div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-7">
                                  <label><spring:message code="sub.category.name.label" /> <font color="red" size="2">*</font></label>
                                  <input type="text" class="form-control" id="subCategoryName" readonly="readonly" placeholder="<spring:message code="enter.sub.category.name" />" value="${subCategoryDetails.subcategoryName}" />
                                </div>
                                </div>
                                 
                                  <div class="row" style="padding: 0% 1%;">
									<div class="form-group col-lg-1"></div>
									<div class="col-lg-7">
										<label><spring:message code="sections.label" /></label> <input
											class="form-control form-group" id="sections"
											style="resize: none;"
											placeholder="<spring:message code="enter.subCategoty.section.label" />"></input>
									</div>
									<div class="col-lg-1">
										<a onclick="">
											<h2 style="">
												<i class="fa fa-plus-circle" aria-hidden="true" ></i>
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
                                </div>
                                 <div class="col-lg-2" style="margin-top: 18px">
                                  <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Browse...</span>
			    			         
			    			         <input id="subCategoryBtn" type="file" accept=".jpg ,.jpeg, .png, .PNG, .gif" disabled="disabled" class="upload">
						               
						                </div>
						                </div>
						                  <div class=" col-lg-3 col-sm-3 col-xs-3" style="margin-top:1%">
            <div class="" title="Sub Category Image" id="subCategory_image" style="text-align: center;width:150px;;">
            <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
            <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="${subCategoryDetails.image}">
											<label class="myFile" id="logo1_label"></label>
											</div>
            </div>        
                                 </div>
                                  
                              <div class="row" style="padding: 0% 1%;">
								<div class="form-group col-lg-1"></div>
								<div class="form-group col-lg-10">
                               
                                  <label><spring:message code="sub.category.description.label" /> <font color="red" size="2">*</font></label>
                                  <textarea class="form-control" id="subCategoryDescription" style="resize:none;" readonly="readonly" placeholder="<spring:message code="enter.sub.category.description" />">${subCategoryDetails.subcategoryDescription}</textarea>
                                </div>
                                </div>
                          </div><!-- /.box-body -->
                           
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" onclick="return viewSubCategoryMaster('subCategoryMaster','0');" value="<spring:message code="cancel.label" />" />
						</div>
					<br/>
                    <div class="box-footer">
                                    
                    </div>
                    
                    <input type="hidden" value="${maxRecords}" id="maxRecords"/>
                           <input type="hidden" value="${searchName}" id="searchSubCategory"/>
                    
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>