<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file type		        : JSP
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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontselect.css">
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/jquery.fontselect.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
	 <script src="${pageContext.request.contextPath}/js/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
	  <script src="${pageContext.request.contextPath}/js/b2c/homePageBannerAndMiniBanner.js"></script>
 <style type="text/css">
.form-group {
    margin-bottom: 5px;
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
	 $(".my-colorpicker2").colorpicker();
	callCalender('startDate');
	callCalender('endDate');
	$("#bannerImageTextFont").fontselect();
	 var bannerImageTextFont = $("#bannerImageTextFontHidden").val();
	 if(bannerImageTextFont != "")
	 $("#bannerImageTextFontHidden").siblings(".font-select").children("a").children("span").text(bannerImageTextFont);
	$("#bannerId").keydown(function(){
		   $("#bannerIdError").html("");
		   $(".Error").html("");
	});
	$("#bannerName").keydown(function(){
		   $("#bannerNameError").html("");
		   $(".Error").html("");
	});
	$("#description").keydown(function(){
		   $("#descriptionError").html("");
		   $(".Error").html("");
	});
	
});

function getFont(ele){
	 var font = $(ele).attr("data-value").replace(/\+/g,' ');
	 $(".font-select").removeClass("font-select-active");
	 $(".fs-drop").css("display","none");
	 $(ele).parents(".font-select").children("a").children("span").text(font);
	 var selectId = $(ele).parents(".font-select").siblings("select").attr("id");
	 $("#"+selectId+"Hidden").val(font);
	// $(ele).parents(".font-select").siblings("select").val(font);
	 $(".font-select").trigger("click");
}
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <%-- <h3><spring:message code="new.home.page.banner.label" /></h3> --%>
                                <c:if test="${type == 'edit'}">
	                                <h3><spring:message code="edit.home.page.banner.label" /></h3>
								</c:if>
								<c:if test="${type == 'new'}">
									<h3><spring:message code="new.home.page.banner.label" /></h3>
								</c:if>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newGiftVouchers" method="post" >
                                    <div class="box-body">
                                    <input type="hidden" id="type">
                                   	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        						<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   		<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="banner.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                       <!--  </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                         <c:if test="${type == 'edit'}">
                                            <input type="text" class="form-control" readonly="readonly" id="bannerId" value="${banner.bannerId}" name="bannerId" oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.banner.id.label" />"/>
										</c:if>
										<c:if test="${type == 'new'}">
											<input type="text" class="form-control" id="bannerId" value="${banner.bannerId}" name="bannerId" oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="if.not.given.auto.generated" />"/>
										</c:if>
                                             <span style="color:red; font-size:2" id="bannerIdError"></span>
										<!-- </div> -->                                        
                                     	</div>
										<div class="form-group col-lg-4">
										<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="banner.name.label" /> <span style="color:red; font-size:2">*</span></label>
										<!-- </div>
										<div class="col-lg-8" style="padding-left: 0px;"> -->
                                            <input type="text" class="form-control" id="bannerName" value="${banner.bannerName}" name="bannerName" placeholder="<spring:message code="enter.banner.name.label" />" />
                                            <span style="color:red; font-size:2" id="bannerNameError"></span>
										<!-- </div> -->
                                     	</div>
                                     	<div class="form-group col-lg-4">
										<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="banner.priority.label" /></label>
                                        <!-- </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                            <select id="bannerPriority" class="form-control" >
												<option value="1" ${banner.bannerPriorityStr == "1" ? 'selected' : ''}>1</option>
												<option value="2" ${banner.bannerPriorityStr == "2" ? 'selected' : ''}>2</option>
												<option value="3" ${banner.bannerPriorityStr == "3" ? 'selected' : ''}>3</option>
												<option value="4" ${banner.bannerPriorityStr == "4" ? 'selected' : ''}>4</option>
												<option value="5" ${banner.bannerPriorityStr == "5" ? 'selected' : ''}>5</option>
												<option value="6" ${banner.bannerPriorityStr == "6" ? 'selected' : ''}>6</option>
											  </select>
                                            <span style="color:red; font-size:2" id="bannerPriorityError"></span>
                                        <!--  </div> -->
                                    	</div>
                                    	</div>
                                    	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   		<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="start.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                        <!-- </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                            <input class="form-control calendar_icon"  value="${banner.effectiveFromStr}" readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" onclick="callCalender('startDate')" onfocus="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
                                             <span style="color:red; font-size:2" id="startDateError"></span>
                                        <!-- </div> -->
                                     	</div>
										<div class="form-group col-lg-4">
										<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="end.date.label" /></label>
                                        <!-- </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                            <input class="form-control calendar_icon" value="${banner.endDateStr}" readonly="readonly" style="background-color: white;" name="endDate" id="endDate" size="20" type="text" onclick="callCalender('endDate')" onfocus="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
                                            <span style="color:red; font-size:2" id="endDateError"></span>
                                        <!-- </div> -->
                                     	</div>
                                     	<div class="form-group col-lg-4">
                                     	<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="banner.status.label" /></label>
                                       <!--  </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                            <select id="status" class="form-control" >
												<option value="1" ${banner.statusStr == "1" ? 'selected' : ''}>Active</option>
												<option value="0" ${banner.statusStr == "0" ? 'selected' : ''}>Disabled</option>
											  </select>
                                            <span style="color:red; font-size:2" id="statusError"></span>
                                        <!-- </div> -->
                                    	</div>
                                    	</div>
                                    	<div class="row">
                                    	<div class="form-group col-lg-4">
                                    	<div class="row">
                                    	<div class="form-group col-lg-9">
                                    		<!-- <div class="col-lg-4" style="padding-left: 0px;margin-right: -5px;"> -->
                                            	<label><spring:message code="banner.image.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <!--  </div>
                                            <div class="form-group col-lg-8" style="padding-left: 0px;padding-right: 25px;"> -->
						  						<input id="bannerImageFile" class="form-control" placeholder="Choose File" disabled="disabled" />
						  					<!-- </div> -->
						  					<span style="color:red; font-size:2" id="bannerImageError"></span>
						  					</div>
						  					<div class="col-lg-3" style="padding-left: 2px;">
						  					<!-- <div class="form-group col-lg-12"> -->
						  					<br>
												<div class="fileUpload btn btn-primar" style="font-weight: bold;height: 29px;width: 75px;border-color: ''">
									    			<span style="font-size: 15px;">Upload..</span>
									    			<input id="bannerImage" type="file" accept="image/x-png, image/gif, image/jpeg" onchange="loadImageFileAsURL('bannerImage',this);" class="upload" />
									    			<!-- <div id="bannerImageimage" class="form-group col-lg-3" style="width:65px;height:20px;display: none;"></div> -->
									    			<input type='hidden' id='bannerImagebyte' value="${banner.bannerImage}" >
									    			<input type='hidden' id='bannerImage_refId'>
												</div> 
											<!-- </div> -->
                                            
                                            
                                         <%-- <div class='row'>
                                         	<div class='form-group col-lg-9'>
                                         		<input id="category_icon${theCount.count}" type="file" onchange="loadImageFileAsURL('${theCount.count}','category_icon')"><span id="category_iconError${theCount.count}" style="color: red;"></span>
                                         		</div><div id="category_icon_image${theCount.count}" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="data:image/jpeg;base64,${menu.categoryIcons}" /></div>
                                         	</div><input type="hidden" id="category_icon_byte${theCount.count}" value="${menu.categoryIcons}"> --%>
                                            
                                    	</div>
                                    	</div>
                                    	<div class="row">
                                    	<div class="form-group col-lg-9">
                                    		<!-- <div class="col-lg-4" style="padding-left: 0px;margin-right: -5px;"> -->
                                            	<label><spring:message code="banner.thumbnail.label" /></label>
                                           <!--  </div>
                                            <div class="form-group col-lg-8" style="padding-left: 0px;padding-right: 25px;"> -->
						  						<input id="bannerThumbnailFile" class="form-control" placeholder="Choose File" disabled="disabled" />
						  					<!-- </div> -->
						  					<span style="color:red; font-size:2" id="bannerThumbnailError"></span>
						  					</div>
						  					<div class="col-lg-3" style="padding-left: 2px;">
						  					<!-- <div class="form-group col-lg-12"> -->
						  						<br>
												<div class="fileUpload btn btn-primar" style="font-weight: bold;height: 29px;width: 75px;">
									    			<span style="font-size: 15px;">Upload..</span>
									    			<input id="bannerThumbnail" type="file" accept="image/x-png, image/gif, image/jpeg" onchange="loadImageFileAsURL('bannerThumbnail',this);" class="upload" />
									    			<!-- <div id="bannerThumbnailimage" class="form-group col-lg-3" style="width:65px;height:20px;display: none;"></div> -->
									    			<input type='hidden' id='bannerThumbnailbyte' value="${banner.bannerThumbnail}">
									    			<input type='hidden' id='bannerThumbnail_refId'>
									    			<!-- <input id="productMasterBtn" type="file" accept="image/x-png, image/gif, image/jpeg" onchange="addNameToTextBox('productMaster');" class="upload" /> -->
												</div> 
											<!-- </div> -->
                                            
                                    	</div>
                                    	</div>
                                    	</div>
                                    	<div class="form-group col-lg-1" style="">
                                    	<div id="bannerImageimage" style="width:65px;height:20px;padding-top: 10px;"><img style="width:65px;height:50px;" src="${banner.bannerImage}" /></div><br>
                                    	<div id="bannerThumbnailimage"  style="width:65px;height:20px;padding-top: 30px;"><img style="width:65px;height:50px;" src="${banner.bannerThumbnail}" /></div> 
                                      	</div>
                                    	<div class="form-group col-lg-7" style="">
                                    		<div style="margin: 0px;border: 1px solid #CCC;font-size: 16px;height: 85px;padding-top: 15px;padding-left: 15px;margin-top: 15px;">This Banner will be visible, automatically,with the customer's commerce site.The size of the image depends on your requirement. We recommend not exceed max 500 KB.</div>
                                    	</div>
                                    	</div>
                                        <div class="row" >
                                        <div class="form-group col-lg-12">
                                            <label><spring:message code="banner.description.label" /> <span style="color:red; font-size:2">*</span></label>
                                        <!-- </div>
                                      	<div class="form-group col-lg-11" style="padding-right: 30px;padding-left: 35px;"> -->
                                            <textarea style="resize:none" class="form-control"  id="description" rows="2" placeholder="<spring:message code="enter.banner.description.label" />">${banner.bannerDescription}</textarea>
                                            <span style="color:red; font-size:2" id="descriptionError"></span>
                                     	</div>
                                     	</div>
                                     	<br>
                                     	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   		<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="product.category.label" /></label>
                                        <!-- </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                        <select class="form-control" id="productCategory">
                                        	<c:forEach var="category" items="${categoryList}">
					                	  	 	<option value="${category.categoryName}" ${banner.productCategory == category.categoryName ? 'selected' : ''}>${category.categoryDescription}</option>
											 </c:forEach>
                                        </select>
                                            <%-- <input type="text" class="form-control" id="productCategory" name="productCategory" oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.banner.id.label" />"/> --%>
                                             <span style="color:red; font-size:2" id="productCategoryError"></span>
										<!-- </div> -->                                        
                                     	</div>
										<div class="form-group col-lg-4">
										<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="banner.category.label" /></label>
										<!-- </div>
										<div class="col-lg-8" style="padding-left: 0px;"> -->
										<select class="form-control" id="brandCategory">
                                        	<c:forEach var="brandName" items="${brandsList}">
												<option value="${brandName}"  ${banner.brandCategory == brandName ? 'selected' : ''}>${brandName}</option>
											</c:forEach>
                                        </select>
                                            <%-- <input type="text" class="form-control" id="bannerCategory" name="bannerCategory" placeholder="<spring:message code="enter.banner.name.label" />" /> --%>
                                            <span style="color:red; font-size:2" id="bannerCategoryError"></span>
										<!-- </div> -->
                                     	</div>
                                     	<div class="form-group col-lg-4">
										<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="department.category.label" /></label>
                                       <!--  </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                            <select id="departmentcategory" class="form-control" >
	                                             <c:forEach var="department" items="${departmentList}">
													<option value="${department}" ${banner.departmentCategory == department ? 'selected' : ''}>${department}</option>
												</c:forEach>
											  </select>
                                            <span style="color:red; font-size:2" id="departmentcategoryError"></span>
                                         <!-- </div> -->
                                    	</div>
                                    	</div>
                                    	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   		<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="deal_id.label" /></label>
                                        <!-- </div>
                                        <div class="col-lg-8" style="padding-left: 0px;"> -->
                                        	<select class="form-control" id="dealId">
                                        		<c:forEach var="deal" items="${dealsList}">
						                	  	 	<option value="${deal.dealID}" ${banner.dealId == deal.dealID ? 'selected' : ''}>${deal.dealID}</option>
												 </c:forEach>
                                        	</select>
                                            <%-- <input type="text" class="form-control" id="dealId" name="productCategory" oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.banner.id.label" />"/> --%>
                                             <span style="color:red; font-size:2" id="productCategoryError"></span>
										<!-- </div> -->                                        
                                     	</div>
										<div class="form-group col-lg-4">
										<!-- <div class="col-lg-4" style="padding-left: 0px;"> -->
                                            <label><spring:message code="offer_id.label" /></label>
										<!-- </div>
										<div class="col-lg-8" style="padding-left: 0px;"> -->
											<select class="form-control" id="offerId">
                                        		<c:forEach var="offer" items="${offersList}">
						                	  	 	<option value="${offer.offerID}" ${banner.offerId == offer.offerID ? 'selected' : ''}>${offer.offerID}</option>
												 </c:forEach>
                                        	</select>
                                            <%-- <input type="text" class="form-control" id="bannerCategory" name="bannerCategory" placeholder="<spring:message code="enter.banner.name.label" />" /> --%>
                                            <span style="color:red; font-size:2" id="bannerCategoryError"></span>
										<!-- </div> -->
                                     	</div>
                                     	<div class="form-group col-lg-2" style="margin-top: 5px;">
											<br>
											<c:if test="${banner.dealDisplayStr == 1}">
												<input type="checkbox" checked="checked" style="vertical-align: -2px" id="displayDeal"/>&nbsp;&nbsp;&nbsp; <spring:message code="display.the.deal.label" />
						        	 		</c:if>
						        	 		<c:if test="${banner.dealDisplayStr != 1}">
									            <input type="checkbox" style="vertical-align: -2px" id="displayDeal"/>&nbsp;&nbsp;&nbsp; <spring:message code="display.the.deal.label" />
						        	 		</c:if>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="margin-top: 5px;">
											<br>
											<c:if test="${banner.offerDisplayStr == 1}">
												<input type="checkbox" checked="checked" style="vertical-align: -2px" id="displayOffer"/>&nbsp;&nbsp;&nbsp; <spring:message code="display.the.offer.label" />
						        	 		</c:if>
						        	 		<c:if test="${banner.offerDisplayStr != 1}">
									            <input type="checkbox" style="vertical-align: -2px" id="displayOffer"/>&nbsp;&nbsp;&nbsp; <spring:message code="display.the.offer.label" />
						        	 		</c:if>
                                    	</div>
                                    	</div>
                                    	
                                    	<div class="row">
                                    	<div class="form-group col-lg-4">
                                    	<label><spring:message code="group_id.label" /></label>
                                    	<select class="form-control" id="grroupId">
                                        		<c:forEach var="offerGroup" items="${groupsList}">
						                	  	 	<option value="${offerGroup.groupId}" ${banner.groupId == offerGroup.groupId ? 'selected' : ''}>${offerGroup.groupId}</option>
												 </c:forEach>
                                        	</select>
                                    	</div>
                                    	</div>
                                    	
                                    		<div class="" style="margin-top: 8px;cursor: pointer;margin-bottom: 0px;" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="font.section.label" /></span></div>
                                         	<hr style="border-top: 1px solid rgb(181,230,29);margin-top: 0px;">
                                    	<div class="row">
                                    <div class="form-group col-lg-3" style="">
                                    	<label><spring:message code="banner.image.text.label" /></label>
                                    	<textarea class="form-control" name="bannerImageText" id="bannerImageText" rows="1" style="resize: none;" placeholder="<spring:message code="banner.image.text.label" />" >${banner.bannerImageText}</textarea>
                                    </div>
                                    	<div class="form-group col-lg-3" style="">
                                    		<label><spring:message code="deal.image.text.font.label" /></label><br>
                                    		<select class="form-control" id="bannerImageTextFont">
                                    		</select>
                                    		<input type="hidden" id="bannerImageTextFontHidden"  value="${banner.bannerImageTextFont}">
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
		                                   	<label><spring:message code="deal.image.size.label" /></label>
		                                   	<input class="form-control" type="text" value="${banner.bannerImageFontSize}" id="bannerImageFontSize" placeholder="<spring:message code="deal.image.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                    	</div>
                                    	<div class="form-group col-lg-2" style="">
	                                    	<label><spring:message code="deal.image.color.label" /></label>
	                                    	 <div class="input-group my-colorpicker2">
                                            <input type="text" value="${banner.bannerImageColor}" id="bannerImageColor" class="form-control"/>
                                            <div class="input-group-addon">
                                                <i></i>
                                            </div>
                                        </div><!-- /.input group -->

                                    	</div>
                                    	<div class="form-group col-lg-2" style="text-align: center;">
                                    		<br>
                                    		<c:if test="${banner.bannerImageBoldStr == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="bannerImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${banner.bannerImageBoldStr != 0}">
		                                    	<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="bannerImageBold" /> <i class="fa fa-bold"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${banner.bannerImageItalicStr == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="bannerImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${banner.bannerImageItalicStr != 0}">
		                                    	<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="bannerImageItalic" /> <i class="fa  fa-italic"></i>&nbsp;&nbsp;
	                                    	</c:if>
	                                    	<c:if test="${banner.bannerImageStrikeStr == 0}">
	                                    		<input type="checkbox" style="vertical-align: -2px;" id="bannerImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
	                                    	<c:if test="${banner.bannerImageStrikeStr != 0}">
		                                    	<input type="checkbox" checked="checked" style="vertical-align: -2px;" id="bannerImageStrike" /> <i class="fa  fa-strikethrough"></i>
	                                    	</c:if>
                                    	</div>
                                    </div>
                                    </div><!-- /.box-body -->
									<br>
						<div class="row" style="text-align: center;">
						<c:if test="${type == 'edit'}">
						  <input type="button" class="btnCls" style="" onclick="validateHomePageBanner('edit')" value="<spring:message code="submit.label" />" />
						</c:if>
						<c:if test="${type == 'new'}">
							<input type="button" class="btnCls" style="" onclick="validateHomePageBanner('new')" value="<spring:message code="submit.label" />" />
						</c:if>
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btnCls" style="margin-left:5%;" onclick="viewHomePageBanners('','0');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == true}">
							<input type="button" class="btnCls" style="margin-left:5%;" onclick="viewHomePageBanners('','0');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                </form>
                            </div>
                            
</div>
</div>
</section><!-- /.content -->
</body>
</html>