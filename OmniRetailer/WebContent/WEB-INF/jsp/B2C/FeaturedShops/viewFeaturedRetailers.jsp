<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file type		        : JSP
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/b2c/featureRetailers.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/js/b2c/homePageBannerAndMiniBanner.js"></script> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fontselect.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.fontselect.min.js"></script>
<link
	href="${pageContext.request.contextPath}/css/colorpicker/bootstrap-colorpicker.min.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/plugins/colorpicker/bootstrap-colorpicker.min.js"
	type="text/javascript"></script>
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
	filter: alpha(opacity = 0);
}

.btn-primar {
	font-weight: normal;
	color: white;
	background-color: rgb(128, 128, 128);
	/* border-color: black; */
}
.button{
   width:84px;
   height:28px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".my-colorpicker2").colorpicker();
		callCalender('startDate');
		callCalender('endDate');
		$("#bannerImageTextFont").fontselect();
		$("#bannerId").keydown(function() {
			$("#bannerIdError").html("");
			$(".Error").html("");
		});
		$("#bannerName").keydown(function() {
			$("#bannerNameError").html("");
			$(".Error").html("");
		});
		$("#description").keydown(function() {
			$("#descriptionError").html("");
			$(".Error").html("");
		});

	});
	/* function loadImageFileAsURL(id,ele) {
	 $("."+id+"Error").text("");
	 $("#"+id+"Error").text("");
	 var filesSelected = document.getElementById(id).files;
	 if (filesSelected.length > 0) {
	 var fileToLoad = filesSelected[0];
	 var fsize = fileToLoad.size;
	 if (fileToLoad.type.match("image.*")) {
	 if((fsize <= 70000 && id == "bannerThumbnail") || id == "bannerImage" ){
	 var name = fileToLoad['name'];
	 $("#"+id+"File").val(name);
	 var fileReader = new FileReader();
	 fileReader.onload = function(fileLoadedEvent) {
	 var byteVal = fileLoadedEvent.target.result;
	 var index = byteVal.indexOf(',');
	 byteVal = byteVal.substring(index + 1);
	 $("#" + id + "byte").val(byteVal);
	 $("#" + id + "image").html(
	 '<img style="width:65px;height:50px;" src=' + fileLoadedEvent.target.result + '>');

	 };
	 fileReader.readAsDataURL(fileToLoad);
	 var oMyForm = new FormData();
	 oMyForm.append("file",  ele.files[0]);
	 if($("#"+id+"_refId").val() != "")
	 oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
	 else
	 oMyForm.append("refId", "");
	 var contextPath = $("#contextPath").val();
	 var URL = contextPath + "/inventorymanager/addToAttachementList.do";
	 $.ajax({
	 //					dataType : 'json',
	 url : URL,
	 data : oMyForm,
	 type : "POST",
	 enctype : 'multipart/form-data',
	 processData : false,
	 contentType : false,
	 beforeSend : function(xhr) {
	 },
	 success : function(result) {
	 $("#"+id+"_refId").val(result);
	 },
	 error : function() {
	 alert("something went wrong");
	 }
	 });
	 }else{
	 $("#"+id+"Error").text("Select Image < 70kb");
	 return;
	 } 
	 }
	 }
	 } */
	function getFont(ele) {
		var font = $(ele).attr("data-value").replace(/\+/g, ' ');
		$(".font-select").removeClass("font-select-active");
		$(".fs-drop").css("display", "none");
		$(ele).parents(".font-select").children("a").children("span")
				.text(font);
		var selectId = $(ele).parents(".font-select").siblings("select").attr(
				"id");
		$("#" + selectId + "Hidden").val(font);
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
					<div class="box-header" style="text-align: center; ">
						<br />
						
						<div class="col-lg-4"></div>
						<div class="col-lg-4" ><span style="border: 1px solid black;font-size:20px;padding: 4px 12px 4px 12px;">Featured Retailer - View</span></div>
						
						
							
					</div >
					
					<!-- /.box-header -->
					<!-- form start -->
					<form id="newGiftVouchers" method="post">
						<div class="container">
							<input type="hidden" id="type">
							
							<div class="row" style="height:60px;"></div>
							<div style="margin:30px">
							
							      <div id="Error" class="Error"
								style="text-align: center; color: red; font-size: 2; font-weight: bold; margin-bottom: 10px; margin-top: -20px">${err}</div>
							<div id="Success" class="Error"
								style="text-align: center; color: blue; font-size: 2; font-weight: bold; margin-bottom: 10px; margin-top: -20px">${success}</div>
							     
							</div>
<!-- Row1 -->						
							
					
							<div class="row">
							
<!-- Retailer Id -->			
								<div class="form-group col-lg-5">
									<div class="col-lg-8" >
									<label><spring:message code="featured.store.group" /><span style="color: red; font-size: 2">*</span></label><br>
									<div class="col-lg-8" style="padding:0px">
										<input type="text" class="form-control" id="featureId" name="featureId" value="${featuredRetailer.featuredRetailerId}" placeholder="<spring:message code="enter.featuredStore.Group.label" />" disabled />
										<span style="color: red; font-size: 2; font-weight: bold;"id="featureIdError"></span>
										</div><br>
										
									</div>	
										
								</div>
								
								
<!-- Rating -->
								
								
								<div class="form-group col-lg-4">
									<div class="col-lg-7">
									<label><spring:message code="featured.rating" /> </label>
									 <select class="form-control" id="featuredRating" value="${featuredRetailer.priorityNo}" disabled>
									      <option value="1" ${'1' == featuredRetailer.priorityNo ? 'selected' : ''}>1</option>
										<option value="2" ${'2' == featuredRetailer.priorityNo ? 'selected' : ''}>2</option>
										<option value="3" ${'3' == featuredRetailer.priorityNo ? 'selected' : ''}>3</option>
										<option value="4" ${'4' == featuredRetailer.priorityNo ? 'selected' : ''}>4</option>
										<option value="5" ${'5' == featuredRetailer.priorityNo ? 'selected' : ''}>5</option>
										<option value="6" ${'6' == featuredRetailer.priorityNo ? 'selected' : ''}>6</option>
									 </select>
									</div>
								</div>



<!--  Status-->

								<div class="form-group col-lg-2">

									<label><spring:message code="featuredShops.status.label" /></label>
									 <select id="status" class="form-control" value="${featuredRetailer.status}" disabled>
										<option value="Active">Active</option>
										<option value="Inactive">In-Active</option>
									</select> <span style="color: red; font-size: 2" id="statusError"></span>

								</div>

					</div>
							
							<p></p><p></p>
<!-- Row2 -->				
							
				   <div class="row">  
				   
<!-- description -->			  
								<div class="form-group col-lg-5">
								  <div class="col-lg-10" >
								    <label><spring:message code="featuredShops.description.label" /></label>
									<input type="text"  class="form-control" id="description" value="${featuredRetailer.featureDescription}" placeholder="<spring:message code="enter.featured.description.label" />" disabled/>
									<span style="color: red; font-size: 2; font-weight: bold;" id="descriptionError"></span>
								  </div>
								 </div>
<!-- package -->
								<div class="form-group col-lg-4">
								  <div class="col-lg-7">
								    <label><spring:message code="featuredShops.package.label" /></label>
									<input type="text"   class="form-control" id="package" value="${featuredRetailer.packageName}" disabled/>
									<span style="color: red; font-size: 2; font-weight: bold;" id="packageError"></span>
								  </div>
								 </div>
<!-- startDate -->
								<div class="form-group col-lg-2">
								
									<label><spring:message code="start.date.label" /> <span style="color: red; font-size: 2">*</span></label>
									<c:set var="start" value="${ featuredRetailer.startDateStr}"/>
									<input class="form-control calendar_icon" value='${fn:substring(start, 0, 10) } ' readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" onclick="callCalender('startDate')" onfocus="callCalender('startDate')"  placeholder="DD/MM/YYYY" disabled/>
									<span style="color: red; font-size: 2; font-weight: bold;" id="startDateError"></span>

										
								
									
								</div>
								<div class="form-group col-lg-1"></div>
							</div>
							<p></p><p></p>
<!-- row3 -->
							<div class="row">
							
							    <div class="form-group col-lg-5">
							    <div class="col-lg-10" >
							     <label><spring:message code="featuredShops.AddRetailer.label" /></label><br>
							     <div class="col-lg-9" style="padding:0px">
							      
										<select id="selectedRetailerloc" class="form-control" disabled>
										<c:forEach var="locationId" items="${workLocationsList}">
							         	<option value="${locationId}">${locationId}</option>
						 				</c:forEach>
									 	</select> 
									 	<span style="color: red; font-size: 2" id="selectedRetailerlocError"></span>
								 </div>
								 <div class="col-lg-3" style="padding:0px 0px 0px 3px">
								    <input type="button" class="button btn-primary" style="" id="addReatiler" onclick="replaceReatilerLocs();" value="Add" disabled/>
								 </div>
							    </div>
							    </div>
								
								
								 <div class="form-group col-lg-4">
								 <div class="col-lg-7">
								 <label><spring:message code="zone.label" /></label><br>
								    <select id="zone" class="form-control"  value="" disabled>
	                                             <c:forEach var="zone" items="${zones}">
													<option value="${zone}" ${zone == featuredRetailer.zone ? 'selected' : ''}>${zone}</option>
												</c:forEach>
									</select>
								 </div>
								 </div>
								 
								 
<!-- endDate -->								 
								 <div class="form-group col-lg-2">
								 <label><spring:message code="end.date.label" /></label>
								 	<c:set var="end" value="${ featuredRetailer.endDateStr}"/>
								 	<input class="form-control calendar_icon" readonly="readonly" value="${fn:substring(end, 0, 10)}"style="background-color: white;" name="endDate" id="endDate" size="20" type="text" onclick="callCalender('endDate')" onfocus="callCalender('endDate')" placeholder="DD/MM/YYYY" disabled/>
									<span style="color: red; font-size: 2" id="endDateError"></span>

								 </div>
								 
								 
								 
								 
								
								</div>
								
<!-- row4 -->								
								 <div class="row">  
				   
<!-- Empty box -->			   
								<div class="form-group col-lg-5">
								<div class="col-lg-10" style=" height:150px;">
									<textarea type="text" class="form-control" id="reatilerLocation" readonly="readonly" style=" height:100px;resize: none;">${featuredRetailer.locationId}</textarea>
									<span style="color: red; font-size: 2; font-weight: bold;" id="reatilerLocationError"></span>
								</div>
								</div>
<!-- Image -->
								<div class="form-group col-lg-4" ><!--style="padding-top:50px  -->
								
								<div class="col-lg-7">
								 <div style="margin-bottom:0px;height: 29px;width: 125px;"> <label style="padding-top: 27px;"><spring:message code="featuredShops.image.label" /></label></div>
								        <div>
						  					<br>
												<div class="fileUpload btn btn-primar" style="font-weight: bold;height: 29px;width: 125px;border-color: ''">
									    			<span style="font-size: 15px;">Upload Image..</span>
									    			<input id="retailerImage" type="file" accept="image/x-png, image/gif, image/jpeg" onchange="loadImageFileAsURL('retailerImage',this);" class="upload" disabled />
									    			<!-- <div id="bannerImageimage" class="form-group col-lg-3" style="width:65px;height:20px;display: none;"></div> -->
									    			<input type='hidden' id='retailerImagebyte'>
									    			<input type='hidden' id='retailerImage_refId'  value="${featuredRetailer.imageLink}">
												</div> 
											
                                            
                                            
                                           <!--  <div class="row">
                                            	<div class="form-group col-lg-9">
                                            		<input id="category_icon1" name="category_icon1" type="file" onchange="loadImageFileAsURL('1','category_icon');"><span id="category_iconError1" style="color: red;"></span></div>
                                            		<div id="category_icon_image1" class="form-group col-lg-3" style="width:65px;height:20px;"></div></div><input type='hidden' id='category_icon_byte1'> -->
                                            
                                      </div>
								 
								 </div>
								  <div class="col-lg-2">
								 	<br>
								 	
								 	<c:choose>
											<c:when test="${featuredRetailer.imageLink !=  null && not empty featuredRetailer.imageLink && featuredRetailer.imageLink != ''}">
											<div id="retailerImageimage" style="width:65px;height:20px;padding-top: 10px;"><img style="width:65px;height:50px;" src="${featuredRetailer.imageLink}" alt="Image" /></div><br>
											</c:when>
											<c:otherwise>
												<td>${featuredshops.status}</td>
												<div id="retailerImageimage" style="width:65px;height:20px;padding-top: 10px;display: none;"><img style="width:65px;height:50px;" src="" alt="Image" /></div><br>
											</c:otherwise>
										</c:choose>
										
								 	<%-- <c:if test="${not empty featuredRetailer.imageLink || featuredRetailer.imageLink != ''}">
								 	<div id="retailerImageimage" style="width:65px;height:20px;padding-top: 10px;"><img style="width:65px;height:50px;" src="${featuredRetailer.imageLink}" alt="Image" /></div><br>
								 	</c:if>
								 	<c:if test="${featuredRetailer.imageLink == null || empty featuredRetailer.imageLink || featuredRetailer.imageLink == ''}">
								 	<div id="retailerImageimage" style="width:65px;height:20px;padding-top: 10px;display: none;"><img style="width:65px;height:50px;" src="" alt="Image" /></div><br>
								 	</c:if> --%>
								 </div>
								 
							</div>
							
							
							<div class="form-group col-lg-3" style="padding-top:50px">
							 <!--  <div id="bannerImageimage" style="width:65px;height:20px;padding-top: 10px;"></div><br> -->
						
						<%-- <c:choose>
											<c:when test="${featuredRetailer.imageLink !=  null && not empty featuredRetailer.imageLink && featuredRetailer.imageLink != ''}">
											<div id="retailerImageimage" style="width:65px;height:20px;padding-top: 10px;"><img style="width:65px;height:50px;" src="${featuredRetailer.imageLink}" alt="Image" /></div><br>
											</c:when>
											<c:otherwise>
												<td>${featuredshops.status}</td>
												<div id="retailerImageimage" style="width:65px;height:20px;padding-top: 10px;display: none;"><img style="width:65px;height:50px;" src="" alt="Image" /></div><br>
											</c:otherwise>
										</c:choose> --%>
						
							</div>
							
							
								<div class="row">
                                    	<div class="form-group col-lg-4">
                                    	<div class="row">
                                    	
						  					
                                    	</div>
                                    	
                                    	</div>
                                    	<div class="form-group col-lg-1" style="">
                                    	
                                    	
                                      	</div>
                                    	
                                    	</div>
							
							
							
							
							
                          </div>
<div class="row" style="height:60px;"></div>
							<div class="row" style="text-align: center;">
							
								<%-- <input type="button" class="btnCls" style=""
									onclick="validateFeaturedRetailers('edit')"
									value="<spring:message code="submit.label" />" /> --%>
								<c:if test="${sessionScope.role == 'super admin'}">
									<input type="button" class="btnCls buttonMargin" style=""
										onclick="viewHomePageBanners('','0');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
								<c:forEach var="accessControl"
									items="${sessionScope.b2cManagement}">
									<c:if
										test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btnCls buttonMargin" style=""
											onclick="viewFeaturedShops('featuredShops','0')"
											value="<spring:message code="cancel.label" />" />
									</c:if>
								</c:forEach>
							</div>
							<br />
							<div class="box-footer"></div>
							
							
							
							
							</div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>