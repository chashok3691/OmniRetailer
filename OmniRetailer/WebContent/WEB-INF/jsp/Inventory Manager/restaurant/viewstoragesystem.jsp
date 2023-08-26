<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Grocery Configuration/View storage system
 * file type		        : JSP
 * description				: view selected storage systems
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Latest Restaurant Layout | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
<%--         <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/outletconfiguration.css" rel="stylesheet" type="text/css" />
         <script src="${pageContext.request.contextPath}/js/editgrocery_configuration.js" type="text/javascript"></script> 
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
          
            <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
			<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
			
	    <script src="${pageContext.request.contextPath}/js/order.js" type="text/javascript"></script> --%>
	    
	            <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/outletconfiguration.css" rel="stylesheet" type="text/css" />
         <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script> 
		 <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> 
		 
        <script src="${pageContext.request.contextPath}/js/editRestaurant_configuration.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	    <script src="${pageContext.request.contextPath}/js/order.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
	
	 //prepareJsonForExistingOutletStorageSystems();
	 
	 $("#workLocation").val($("#hideLocation").val());
	 $("#dynamicValue").html($("#outletIdHidden").val());
	 $("#dynamicValue1").html($("#outletIdHidden").val());
	 $("#hiddenStore").val($("#outletIdHidden").val());

	
		var levelsStr = $("#levelsStr").val();
		var parsedJson = jQuery.parseJSON(levelsStr);     
		var buildingName = $("#buildingName").val();
		var currentLevel = $("#currentLevel").val();
		
		console.info(parsedJson+"  >>> parsedJson");
		var facilityOptions = "";
		$.each(parsedJson, function(index, value) {
			console.info(index+"  "+value+"   currentLevel "+currentLevel);
			if(index.endsWith('Restaurant')){
				facilityOptions = facilityOptions+'<option value="Restaurant" selected>Restaurant</option>';
				
				var level =  parsedJson[buildingName+"Restaurant"];
				if(level != undefined){
					var op = '';
					for(var i=1;i<=level;i++){
						if (i == currentLevel) {
							op += '<option selected value="'+i+'">'+i+'</option>';
						}else
						op += '<option value="'+i+'">'+i+'</option>';
					}
					$("#level_Id").html(op);
					return false;
				}
			}else if(index.endsWith('Room')){
				facilityOptions = facilityOptions+'<option value="Room">Room</option>';
				
				var level =  parsedJson[buildingName+"Room"];
				if(level != undefined){
					var op = '';
					for(var i=1;i<=level;i++){
						if (i == currentLevel) {
							op += '<option selected value="'+i+'">'+i+'</option>';
						}else
						op += '<option value="'+i+'">'+i+'</option>';
					}
					$("#level_Id").html(op);
				}
				
			}
		    //$("#servers").text($("#servers").text() + " " + value.servername);
		});
		console.info(facilityOptions+"  >>facilityOptions");
		$("#facilityCategory").empty().append(facilityOptions);
		
		
	  
});
</script>
<style type="text/css">

/* addded by kalyan for image upload*/
 img.thumbnail {
   	 	background: none repeat scroll 0 0 #FFFFFF;
    	margin-bottom: 0px !important;
    	border:none !important;
	}

	.image:before {
        content: "";
        display: inline-block;
    }
    
    .image {
        -moz-box-sizing: border-box;
        float: left;
    }
    
    .delete {
    	position: relative;
    	vertical-align: middle;
    	display: inline-block;
    }
    
    .delImage {
    	/* content: ''; */
    	position:absolute;
    	 top:0;
        right:0;
    	height: 16px;
    	width: 16px;
     	cursor: pointer;
    }
    .myFile {
  position: relative;
  overflow: hidden;
  float: left;
  clear: left;
}
    
   .myFile input[type="file"] {
  display: block;
  position: absolute;
  top: 0;
  right: 0;
  opacity: 0;
  font-size: 100px;
  filter: alpha(opacity=0);
  cursor: pointer;
}

/* .form-group input,.form-group  select,.form-group  textarea{
}
input:not([type=button]):not([type=reset]):not([type=submit]):not([type=file]) {
 width: 100%;
	padding: 5px 5px;
} */
//above added by kalyan 
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 4%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
#warehouse_toolbar{
width: 9%;
    float: right;
    margin-top: -460px;
    height: 498px;
    border-left: 1px solid #CCCCCC;
}
</style>       
</head>
<body>


<input type="hidden" name="lodgingFloor" id="lodgingFloor"  value="<spring:message code="room.max.level.label"/>">

<%-- <select id="roomCatogeriesClone" style="display: none;">
	<option value="<spring:message code="single.room.label"/>" ><spring:message code="single.room.label"/></option>
	<option value="<spring:message code="double.room.label"/>" ><spring:message code="double.room.label"/></option>
	<option value="<spring:message code="suite.room.label"/>" ><spring:message code="suite.room.label"/></option>
	<option value="<spring:message code="villa.room.label"/>" ><spring:message code="villa.room.label"/></option>
	<option value="<spring:message code="cabin.room.label"/>" ><spring:message code="cabin.room.label"/></option>
</select>
 --%>

<select id="tableStatusClone" style="display: none;">
	<%-- <option value="<spring:message code="reserved.label"/>" ><spring:message code="reserved.label"/></option>
	<option value="<spring:message code="dirty.table.label"/>" ><spring:message code="dirty.table.label"/></option>
	<option value="<spring:message code="free.label"/>" ><spring:message code="free.label"/></option>
	<option value="<spring:message code="under.service.label"/>" ><spring:message code="under.service.label"/></option> --%>
	 <option value="<spring:message code="active.label"/>" ><spring:message code="reserved.label"/></option>
	<option value="<spring:message code="inactive.label"/>" ><spring:message code="dirty.table.label"/></option>
</select>

<select id="tableCleanStatusClone" style="display: none;">
	<option value="<spring:message code="Cleaned.label"/>" ><spring:message code="Cleaned.label"/></option>
	<option value="<spring:message code="not.cleaned.label"/>" ><spring:message code="not.cleaned.label"/></option>
	<option value="<spring:message code="cleaning.label"/>" ><spring:message code="cleaning.label"/></option>
</select>
<!-- sectionDetailsList -->

<select id="tableSectionClone" style="display: none;">
<c:forEach var="section" items="${sectionDetailsList}"> 
 <option value="${section.sectionId }">${section.sectionName }</option>
</c:forEach>
	<%-- <option value="<spring:message code="Cleaned.label"/>" ><spring:message code="Cleaned.label"/></option>
	<option value="<spring:message code="not.cleaned.label"/>" ><spring:message code="not.cleaned.label"/></option>
	<option value="<spring:message code="cleaning.label"/>" ><spring:message code="cleaning.label"/></option> --%>
</select>


 <!-- Content Header (Page header) -->
<!-- Main content -->

				<%-- <section class="content-header">
                    <h1>
                        <spring:message code="grocery_outlet_configurations.label"/>
                    </h1>
                    <ol class="breadcrumb">
                   <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showOutletFlows()"><spring:message code="rooms.management.label"/></a></li>
                      <li> <a href="#" onclick="viewOutletConfigurations('outletConfigurations')"><spring:message code="stores.label"/></a></li>
                    <li>  <span id="dynamicValue">&nbsp;</span> - <spring:message code="outlet.label"/></li>
                </section> --%>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                               <%--  <div class="box-header" >
                                    <h3 class="box-title"> <span id="workLocation">${location}&nbsp;</span>:<spring:message code="level.label"/>&nbsp<span id="locationLevel">${level}&nbsp;</span> - <spring:message code="outlet.label"/></h3>
                                </div> --%>
                                <!-- /.box-header -->
                                <div class="box-header" >
                                	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
				                     <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${msg}</div>
                                    <%-- <h3 class="box-title"> <span id="workLocation">${location}&nbsp;</span>:<spring:message code="level.label"/>&nbsp;<span id="locationLevel">${level}&nbsp;</span> - <spring:message code="outlet.label"/></h3> --%>
                                    <div class="form-group col-lg-3">
									  <label><spring:message code="procurement.location.label" /></label>
									  <span style="font-weight: bold;">: ${location}</span> 
									  <br>
									     <label><spring:message code="building.name.label" /></label>
									     	<input type="hidden" id="locationList" value="${location}">
									     	<input type="hidden" id="buildingName" value="${buildingName}">
                                            <%-- <select name="locationName" class="form-control" id="locationList" required="required">
                                           	<option>Choose Location</option>
                                           	<c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
                                           </select> --%>
												 <span style="font-weight: bold;" id="buildingLable">: ${buildingName}</span> 
                                           
									  </div>
									  
									  <div class="form-group col-lg-3">
									     <input type="hidden" name="storeCode"  id="storeCode" value=""/>
                                            <label><spring:message code="facility.category.label" /></label>
                                            <select class="form-control" id="facilityCategory" onchange="facilityCategoryChange();">
		                                  		<option >Restaurant</option>
		                                  		<option  >Room</option>
		                                  	</select>
                                            <span id="facilityCategoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
									  <!-- <div class="form-group col-lg-4" style="display: none;">
									     <input type="hidden" name="storeCode" value=""/>
									  </div> -->
									  
									  
									

									
									   <div class="form-group col-lg-3">
									    <label><spring:message code="level.label" /></label>
									    	<input type="hidden" id="levelsStr" value='${levelsStr}'>
									    	<input type="hidden" id="currentLevel" value='${level}'>
                                           <!-- <input type="number" name="level" value="0" id="level_Id"/> -->
                                           <select name="level" class="form-control" id="level_Id" required="required"  onchange="levelChange()">
                                           	<!-- <option>Choose Level</option> -->
                                           </select>
                                        </div>
                                        <br>
                                        
									    <div class="form-group col-lg-3" style="text-align: right;">
<%--                                   	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return updateOutletStorageSystems()" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
 --%>								  <%-- 	<input type="button" id="edit"  class="btn bg-olive btn-inline" title="Cleare all storage systems" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								  --%> 	
								  <input type="button" id="saveBottom" style="position: relative;visibility :hidden;     margin-left: 0px;" class="btn bg-olive btn-inline" onclick="saveGroceryOutlet();" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
								     	<input type="button" id="editBottom" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewEditStorageSystems('edit', '${level }')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
									 <input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;"  onclick="return viewRestaurantConfigurations('restaurantConfig');"  value="<spring:message code="cancel.label" />" />
									 </div> 
									  
									  
                                </div><!-- /.box-header -->
                                <div class="box-body">
									     <input type="hidden" name="storeCode" value=""/>
                                	
                                   <%-- <div class="row" style="margin-top:0px;">
                                   
                                   <div class="form-group col-lg-4" style="display: none;">
									  </div>
									  
									  
									  
									
									
                                   
                                   
                                   
                                   
                                   
                                   
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  	<spring:message code="draw_warehouse_configuration.label" />
									  </div>
									   
									
									</div> --%>
								<div class="row" style="">
                                       <div id="sketch" style="height: 500px;border: 1px solid #cccccc;width:98%;margin-left:11px;">
                                      <%-- <canvas id="paint"></canvas> --%>
											<div id="warehouse_innerview" style="margin-top:-10px;">
<%-- 												 <img src="${pageContext.request.contextPath}/images/directions.gif" style="height: 108px;float: right;">
 --%>												 <div id="editoutletdroppable" style="height: 500px;" onclick="">
												 
												 
												 <c:choose>
												 	<c:when test="${roomDetailsList ne null }">
												 	<%int count = 0; %>
												 <c:forEach var="table" items="${roomDetailsList}">
												 
												<div  
													style="left: ${table.tableLeft}px; top: ${table.tableTop}px;visibility:${table.display };  width: 64px; position: relative; background: white;"
													id="table<%=count %>id" class="table<%=count %>class ui-draggable editcurrentSelectionclass" title="">
													<img src="${pageContext.request.contextPath}/images/chair_2_64.png"
														style="cursor: pointer;" id="table<%=count %>imageid"
														class="table<%=count %>imageclass"
														onclick="showeditOutletStorageSystemDetails('table<%=count %>')">
														
														<div style="display:none; border: 1px solid rgb(204, 204, 204); width: 250px;padding:10px; position: absolute; margin-top: -15px; z-index: 999; background: rgba(204, 204, 204, 0.66);"
													id="table<%=count %>Details">
													<br>
													<center style="margin-top: -15px;">
														<span id="table<%=count %>span">Table Details</span>
													</center>
													<hr
														style="margin-top: 1px; border: 1px solid #CCCCCC; margin-bottom: 5px;">
													<div id="table<%=count %>DetailsDiv">
														<div style="height: 250px; overflow-x: hidden;">
															<div>
																Table No 
																<input type="number" name="table<%=count %>tableNo" oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');" id="table<%=count %>tableNo"  class='form-control'  value="${table.tableNo}" readonly>
															<input type="hidden" value="${table.sequenceNumber }" id="table<%=count %>serialNum">
															</div>
															
															<div>
																Table Status
																 <select name="table<%=count %>tableStatus"
																	class="tableStatusOptions form-control"
																	style=" display: inline;" disabled
																	id="table<%=count %>tableStatus">
																	<option value="${table.tableStatus}" selected="selected">${table.tableStatus}</option>
																	<!-- <option value="Ready To Occupy">Ready To Occupy</option>
																	<option value="Dirty Room">Dirty Room</option>
																	<option value="Occupied">Occupied</option>
																	<option value="Under Service">Under Service</option> -->
																	</select>
															</div>
															<br>
															<div>
																Min Capacity<input type="text" name="table<%=count %>minCapacity"
																	oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(..*)/g, '$1');"
																	class="form-control" id="table<%=count %>minCapacity" value="${table.minCapacity}"
																	placeholder="Minimum Capacity" readonly>
															</div>
															
															<%-- <div>
																Clean Status <select name="table<%=count %>cleanStatus"
																	class="cleanStatusOptions form-control"
																	style=" display: inline;" disabled
																	id="table<%=count %>cleanStatus">
																	<option selected="selected">${table.cleanStatus}</option>
																	<!-- <option value="cleaned">cleaned</option>
																	<option value="not cleaned">not cleaned</option>
																	<option value="cleaning">cleaning</option> -->
																	</select>
															</div> --%>
															<div>
																Section <select name="table<%=count %>Section"
																	class="sectionOptions form-control"
																	style=" display: inline;" disabled
																	id="table<%=count %>Section">
																	<option selected="selected" value="${table.sectionId}">${table.sectionName}</option>
																	<!-- <option value="cleaned">cleaned</option>
																	<option value="not cleaned">not cleaned</option>
																	<option value="cleaning">cleaning</option> -->
																	</select>
															</div>
															
															<div>
																Table Description
																<textarea name="table<%=count %>tableDescription" class='form-control' 
																	id="table<%=count %>tableDescription" readonly>${table.tableDescription } </textarea>
																	</div>
															<div class="icon-remove blue delete"  id="table<%=count %>picture_image">
																		
																		
																		
																		<c:choose>
																			<c:when test="${table.picture != '' && table.picture != null}">
																				<label class="myFile" id="table<%=count %>picture_Lable" style="display: none;">
																				<img src="${pageContext.request.contextPath}/images/Add_image.png" id="table<%=count %>pictureDisplay" alt="Add Picture" style="width: 1<%=count %><%=count %>px;">
																				<input type="file" name="table<%=count %>picture" accept="image/*" id="table<%=count %>picture" onchange="loadFile(event,'table<%=count %>picture')" style="display : inline;"> 
																				<input type="hidden" id="table<%=count %>picture_refId" value="">
																				<input type="hidden" id="table<%=count %>picture_namewe">
																				</label>
																				<img class="thumbnail" id="table<%=count %>picture_thumbnail"  src="data:image/jpeg;base64, ${table.pictureString }" style="min-height: 50px; max-height: 150px; "/>
																				<img class="delImage"  id="table<%=count %>picture_delImage"   src="${pageContext.request.contextPath}/images/deny.png" style="display: none;" onclick="deletePic('table<%=count %>picture');">
																				<input type="hidden" id="table<%=count %>picture_Removed">
																				
																			
																			</c:when>
																		<c:otherwise>
																			<label class="myFile" id="table<%=count %>picture_Lable" style="display: block;"><img src="${pageContext.request.contextPath}/images/Add_image.png" id="table<%=count %>pictureDisplay" alt="Add Picture" style="width: 100px;">
																			<input type="file" disabled="disabled" name="table<%=count %>picture" accept="image/*" id="table<%=count %>picture" onchange="loadFile(event,'table<%=count %>picture')" style="display : inline;"> 
																			<input type="hidden" value="" id="table<%=count %>picture_refId">
																			<input type="hidden" value="" id="table<%=count %>picture_Removed">
																			<input type="hidden" id="table<%=count %>picture_namewe"> </label>
																		</c:otherwise>
																		</c:choose>
																		
															</div>
														</div>
													</div>
													<span>Actions : </span>
													<hr
														style="margin-top: 1px; border: 1px solid #CCCCCC; margin-bottom: 5px;">
													<img src="${pageContext.request.contextPath}/images/view.png"
														id="table<%=count %>viewStorageSystem"
														style="display:none; cursor: pointer; height: 33px; margin-left: 7px; margin-top: -7px;"
														data-toggle="modal" data-target="#myModal"
														title="View Storage System"
														onclick="viewStorageSystem('table<%=count %>','grocery_bayarea')">
														
														<img
														src="${pageContext.request.contextPath}/images/remove.png"
														id="table<%=count %>removeStorageSystem"
														style="display:none; cursor: pointer; height: 29px; margin-left: 17px; margin-top: -6px;"
														onclick="removeGroceryStorageSystem('table<%=count %>')"
														title="Remove Storage System">
														
														<img
														src="${pageContext.request.contextPath}/images/ok.png"
														id="table<%=count %>saveStorageSystemDetails"
														style="display:none; cursor: pointer; height: 23px; margin-left: 17px; margin-top: -4px;"
														onclick="saveGroceryStorageSystemDetails('table<%=count %>')"
														title="Save Storage System Details">
														
														<img
														src="${pageContext.request.contextPath}/images/cancel.png"
														id="table<%=count %>closeStorageSystemDetails"
														style="display:none; cursor: pointer; height: 26px; margin-left: 18px; margin-top: -4px;"
														onclick="closeGroceryStorageSystemDetails('table<%=count %>')"
														title="Close Storage System Details">
													<center>
														<label id="table<%=count %>message"
															style="color: #666666; text-decoration: blink;"></label>
													</center>
												</div>
												</div>


												
												<%count++; %>
												 
												 </c:forEach>
												 	</c:when>
												 	<c:otherwise>
												 	<%-- 
												 	<h3  id="noConfig">Not Yet Configured ,<a href="#" onclick="return viewEditStorageSystems('edit', '${level }')">Click Here To Configure</a></h3>
												 	 --%>
												 	</c:otherwise>
												 </c:choose>
												 
												 
												 
												 	<!-- adding the storage systems  -->
							 <c:forEach var="storageSystems" items="${storageSystems}" varStatus="systems">
								 <c:if test="${storageSystems.storageSystemType=='Shelf'}">
										<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/grocery_display_shelfs.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit">
											<img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" title="Remove Storage System">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.storagesInformation }" id="editOutletStorageSystem${systems.count}Systems">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
             		   			</c:if>
             		   			<c:if test="${storageSystems.storageSystemType=='Fridge'}">
             		   				<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Product : ${storageSystems.productId} &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/grocery_display_fridge.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
             		   			</c:if>
             		   			<c:if test="${storageSystems.storageSystemType=='Bin Array'}">
             		   					<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/grocery_display_binarray.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" title="Remove Storage System">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
             		   			</c:if>
             		   			<c:if test="${storageSystems.storageSystemType=='Empty Area'}">
             		   					<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/warehouse-bayarea.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
             		   			</c:if>
								<c:if test="${storageSystems.storageSystemType=='Rack'}">
										<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/grocery_display_rack.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" title="Remove Storage System">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
								</c:if>
								<c:if test="${storageSystems.storageSystemType=='Bin'}">
										<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/warehouse-bin.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
								</c:if>
             		   										
             		   										<input type="hidden" value="${storageSystems.outletId}" id="outletIdHidden">
              										</c:forEach> 
												 		<ul>
												 		</ul>
												 </div>
												 
											</div>
										<div id="warehouse_toolbar" style="margin-top:-490px;display: none;">
											<label style="margin-left: 17%;margin-top:7px;color:#777;"><spring:message code="warehouse_toolbar.label" /></label>
											<hr style="margin-top:-1px;">
											<div style="margin-left: 27px;margin-top:10px;cursor: pointer;" title="<spring:message code="table.label" />">
											 <img src="${pageContext.request.contextPath}/images/chair_2_64.png" style="margin-top: -7px;"  id="grocery_bayarea" >
											 <span style="margin-left: 5px;color: #666666;">	<spring:message code="table.label" /></span>
											</div>
											<%-- <div style="margin-left: 24px;cursor: pointer;" title="<spring:message code="grocery_outlet_shelfs.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_shelf.png" style="margin-top: -7px;" id="grocery_shelfs">
											 <span style="margin-left: 8px;color: #666666;"><spring:message code="grocery_outlet_shelfs.label" /></span>
											</div>
											<div style="margin-left: 24px;cursor: pointer;margin-top: 6px;" title="Rack">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_racks.png" style="margin-top: -7px;" id="grocery_racks">
											 <span style="margin-left: 7px;color: #666666;">	<spring:message code="warehouse_racks.label" /></span>
											</div>
											<div style="margin-left: 24px;margin-top:10px;cursor: pointer;" title="Bin">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bin.png" style="margin-top: -7px;"  id="grocery_bin" >
											 <span style="margin-left: 10px;color: #666666;">	<spring:message code="warehouse_bins.label" /></span>
											</div>
											
											<div style="margin-left: 26px;margin-top:10px;cursor: pointer;" title="<spring:message code="grocery_outlet_fridge.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_fridge.png" style="margin-top: -7px;"  id="grocery_fridge" >
											 <span style="margin-left: 5px;color: #666666;">	<spring:message code="grocery_outlet_fridge.label" /></span>
											</div>
											<div style="margin-left: 27px;margin-top:10px;cursor: pointer;" title="<spring:message code="warehouse_bay_area_title.label" />">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bayarea.png" style="margin-top: -7px;"  id="grocery_bayarea" >
											 <span style="margin-left: -12px;color: #666666;">	<spring:message code="warehouse_bay_area.label" /></span>
											</div>
											
											<div style="margin-left: 18px;margin-top:10px;cursor: pointer;" title="<spring:message code="grocery_outlet_binarray.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_display_binarray.png" style="margin-top: -7px;"  id="grocery_binarray" >
											 <span style="margin-left: 9px;color: #666666;">	<spring:message code="grocery_outlet_binarray.label" /></span>
											</div> --%>
										</div>
										<div class="row" style="margin-top:35px;text-align: center;">
									   <!-- <div class="form-group col-lg-3" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-1"></div> -->
									    <div class="form-group col-lg-12" style="text-align: center;">
									    <input type="button" id="save" style="position: relative;visibility :hidden; " class="btn bg-olive btn-inline" onclick="saveGroceryOutlet();" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
								     	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewEditStorageSystems('edit', '${level }')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
									 <input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;"  onclick="return viewRestaurantConfigurations('restaurantConfig');" value="<spring:message code="cancel.label" />" />
							    	<%-- <input type="button" id="save" style="position: relative;visibility :hidden;" class="btn bg-olive btn-inline" onclick="saveGroceryOutlet();" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewOutletStorageSystem('edit','${level }')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
									 <input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewConfigurations('outletConfigurations','grocery')" value="<spring:message code="cancel.label" />" />
									 	 --%></div> 
								<!-- 	<div class="row" style="">
									</div>
									<div class="row" style="">
									</div> -->
									</div>
										<input type="hidden" value="${categoriesList}" id="productCategories">
										<input type="hidden" value='${warehouse}' id="warehouseDetails">
                                </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
      <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
     
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
         <!-- page script -->
        <script type="text/javascript">
           /*  $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            }); */
            $('#resizable')
            .draggable()
            .resizable();
        </script> 
      
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
        <input type="hidden" id="hideLocation" value="${location}"/>
                <input type="hidden" id="hiddenStore" value=""/>
        
    <div class="modal fade popup-display1" id="myModalEdit" role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:180px;">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 171%;margin-left: -98px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" >&times;</button>
          <h4 class="modal-title" align="center" id="systemNameEdit"> </h4>
        </div>
        <div class="modal-body">
        	<div id="model_main_div">
        		<div id="model_main_div_storages">
        			<table id="systemsTableEdit" border="1" ></table>
        		</div>
        		<div id="model_main_div_toolbar">
         			<div id="model_sub_tool_bar">
<!--          			<input type='text' name='searchProduct' id='addSearchProduct' placeholder = 'Search Product..' class="searchItems">
 -->         				<div class="services">
							<div class="items">
								<ul class="matchedStringUl storageSkus" style=""></ul>
							</div>
						</div>
         			<br><br>
         			<span id="productSpanEdit"></span> <span id="productSpanValueEdit"></span><br><br>
         			<span id="productSpan1Edit"></span> <span id="productSpanDescValueEdit"></span><br><br>
         			<span id="selectedLabelEdit"></span> <span id="selectedLabelValEdit"> </span> <br>
         			</div>
         		</div>
         	</div>
        </div>
        
        <div class="modal-footer">
<%--         	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" onclick = "updateStorageSystemDetails()"/>
 --%>      		<input type="button" class="btn bg-olive btn-inline"  data-dismiss="modal" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" value="<spring:message code="cancel.label" />"  onclick = ""/>
      		
        <!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
       		
        </div>
      </div>
      
    </div>
  </div>
       
</body>
</html>

<%-- <!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Grocery Configuration/viewstoragesystems
 * file type		        : JSP
 * description				: view selected storage systems
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/outletconfiguration.css" rel="stylesheet" type="text/css" />
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
          
            <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $("#workLocation").val($("#hideLocation").val());
	 $("#dynamicValue").html($("#outletIdHidden").val());
	 $("#dynamicValue1").html($("#outletIdHidden").val());
	 $("#hiddenStore").val($("#outletIdHidden").val());
	 
});
</script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 4%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
</style>       
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->

				<section class="content-header">
                    <h1>
                        <spring:message code="grocery_outlet_configurations.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showOutletFlows()"><spring:message code="outlet.management.label"/></a></li>
                      <li> <a href="#" onclick="viewOutletConfigurations('outletConfigurations')"><spring:message code="stores.label"/></a></li>
                    <li>  <span id="dynamicValue">&nbsp;</span> - <spring:message code="outlet_storage_systems.label"/></li>
                </section>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"> <span id="workLocation">${location}&nbsp;</span> - <spring:message code="outlet_storage_systems.label"/></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                	
				                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      
									<div class="row">
									  <div class="form-group col-lg-4">
									     <input type="hidden" name="storeCode" value=""/>
									  </div>
									  <div class="form-group col-lg-4">
									     <label><spring:message code="location.label" /></label>
                                           <select class="form-control" name="location" id="workLocation" disabled="disabled">
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select>
									  </div>
									   <div class="form-group col-lg-4">
                                          
                                        </div>
									</div>
									
									   <div class="row" style="margin-top: -46px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
							<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                       		<c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true}"> 
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewOutletStorageSystems('edit')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
                                 </c:if>
                           </c:forEach>
								  <input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewConfigurations('outletConfigurations','grocery')" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
                                       <div id="sketch" style="height: 500px;border: 1px solid #cccccc;">
                                      <canvas id="paint"></canvas>
											<div id="warehouse_innerview" style="margin-top:-10px;">
												 <div id="droppable" style="height: 500px;">
												 	<!-- adding the storage systems  -->
												 	 <c:forEach var="storageSystems" items="${storageSystems}">
												 	
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   											<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } 	&#013; Storage System Name : ${storageSystems.storageSystemName } &#013;   No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																	<c:if test="${storageSystems.storageSystemType=='Shelf'}">
																		<img src="${pageContext.request.contextPath}/images/grocery_display_shelfs.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</c:if>
																	<c:if test="${storageSystems.storageSystemType=='Fridge'}">
																		<img src="${pageContext.request.contextPath}/images/grocery_display_fridge.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</c:if>
																	<c:if test="${storageSystems.storageSystemType=='Bin Array'}">
																		<img src="${pageContext.request.contextPath}/images/grocery_display_binarray.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</c:if>
																	<c:if test="${storageSystems.storageSystemType=='Empty Area'}">
																		<img src="${pageContext.request.contextPath}/images/warehouse-bayarea.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</c:if>
																	<c:if test="${storageSystems.storageSystemType=='Rack'}">
																		<img src="${pageContext.request.contextPath}/images/grocery_display_rack.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</c:if>
																	<c:if test="${storageSystems.storageSystemType=='Bin'}">
																		<img src="${pageContext.request.contextPath}/images/warehouse-bin.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</c:if>
																	
																</div>
             		   									
             		   										<c:if test="${storageSystems.storageSystemType=='Racks'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-racks.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
             		   										<c:if test="${storageSystems.storageSystemType=='Bins'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-bin.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if>
             		   										<c:if test="${storageSystems.storageSystemType=='Empty Area'}">
             		   											<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   											<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   												<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="currentSelection" class="currentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013;  No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} ">
																		<img src="${pageContext.request.contextPath}/images/warehouse-bayarea.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass">
																	</div>
             		   										</c:if> 
             		   										<input type="hidden" value="${storageSystems.outletId}" id="outletIdHidden">
              										</c:forEach> 
												 		<ul></ul>
												 </div>
												 
											</div>
										<div id="grocery_toolbar" style="margin-top:-490px;">
											<label style="margin-left: 17%;margin-top:7px;color:#777;"><spring:message code="warehouse_toolbar.label" /></label>
											<hr style="margin-top:-1px;">
											<div style="margin-left: 24px;cursor: pointer;" title="<spring:message code="grocery_outlet_shelfs.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_shelf.png" style="margin-top: -7px;" id="grocery_shelfs">
											 <span style="margin-left: 8px;color: #666666;"><spring:message code="grocery_outlet_shelfs.label" /></span>
											</div>
											<div style="margin-left: 24px;cursor: pointer;margin-top: 6px;" title="Rack">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_racks.png" style="margin-top: -7px;" id="grocery_racks">
											 <span style="margin-left: 7px;color: #666666;">	<spring:message code="warehouse_racks.label" /></span>
											</div>
											
											<div style="margin-left: 24px;margin-top:10px;cursor: pointer;" title="Bin">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bin.png" style="margin-top: -7px;"  id="grocery_bin" >
											 <span style="margin-left: 10px;color: #666666;">	<spring:message code="warehouse_bins.label" /></span>
											</div>
											
											<div style="margin-left: 26px;margin-top:10px;cursor: pointer;" title="<spring:message code="grocery_outlet_fridge.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_fridge.png" style="margin-top: -7px;"  id="grocery_fridge" >
											 <span style="margin-left: 5px;color: #666666;">	<spring:message code="grocery_outlet_fridge.label" /></span>
											</div>
											<div style="margin-left: 27px;margin-top:10px;cursor: pointer;" title="<spring:message code="warehouse_bay_area_title.label" />">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bayarea.png" style="margin-top: -7px;"  id="grocery_bayarea" >
											 <span style="margin-left: -12px;color: #666666;">	<spring:message code="warehouse_bay_area.label" /></span>
											</div>
											
											<div style="margin-left: 18px;margin-top:10px;cursor: pointer;" title="<spring:message code="grocery_outlet_binarray.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_display_binarray.png" style="margin-top: -7px;"  id="grocery_binarray" >
											 <span style="margin-left: 9px;color: #666666;">	<spring:message code="grocery_outlet_binarray.label" /></span>
											</div>
												<!--  <div style="margin-left: 23%;margin-top: -7px;" id="warehouse_racks">Hi</div> -->
											</div>
										</div>
										<div class="row" style="margin-top:12px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
							<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                       		<c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true}"> 
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return viewOutletStorageSystems('edit')" value="&nbsp;&nbsp;&nbsp;<spring:message code="edit.label" />&nbsp;&nbsp;&nbsp;" />
                                 </c:if>
                            </c:forEach>
								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								  	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewConfigurations('outletConfigurations','grocery')" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
										<input type="hidden" value="${categories}" id="productCategories">
										<input type="hidden" value='${warehouse}' id="warehouseDetails">
                                
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
      <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
        <script src="${pageContext.request.contextPath}/js/warehouse_configuration.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
           /*  $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            }); */
            $('#resizable')
            .draggable()
            .resizable();
        </script> 
      
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
        <input type="hidden" id="hideLocation" value="${location }"/>
        <input type="hidden" id="hiddenStore" value=""/>
        
        <div class="modal fade popup-display" id="myModalEdit" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 184%;margin-left: -140px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" >&times;</button>
          <h4 class="modal-title" align="center" id="systemNameEdit"> </h4>
        </div>
        <div class="modal-body">
        	<div id="model_main_div">
        		<div id="model_main_div_storages">
        			<table id="systemsTableEdit" border="1" ></table>
        		</div>
        		<div id="model_main_div_toolbar">
         			<div id="model_sub_tool_bar">
         			<input type='text' name='searchProduct' id='addSearchProduct' placeholder = 'Search Product..' class="searchItems">
         				<div class="services">
							<div class="items">
								<ul class="matchedStringUl storageSkus" style=""></ul>
							</div>
						</div>
         			<br><br>
         			<span id="productSpanEdit"></span> <span id="productSpanValueEdit"></span><br><br>
         			<span id="productSpan1Edit"></span> <span id="productSpanDescValueEdit"></span><br><br>
         			<span id="selectedLabelEdit"></span> <span id="selectedLabelValEdit"> </span> <br>
         			</div>
         		</div>
         	</div>
        </div>
        
        <div class="modal-footer">
      		<input type="button" class="btn bg-olive btn-inline"  data-dismiss="modal" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" value="<spring:message code="cancel.label" />"  onclick = ""/>
      		
        <!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
       		
        </div>
      </div>
      
    </div>
  </div>
</body>
</html> --%>