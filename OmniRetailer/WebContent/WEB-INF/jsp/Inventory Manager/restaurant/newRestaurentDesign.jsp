<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/restaurant/newRestaurantconfiguration.jsp
 * file type		        : JSP
 * description				: new configuration settings
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Location Restaurant Design | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
     
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/outletconfiguration.css" rel="stylesheet" type="text/css" />
         <%-- <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>  --%>
		 <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> 
        <script src="${pageContext.request.contextPath}/js/restaurant_configurations.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	    <script src="${pageContext.request.contextPath}/js/order.js" type="text/javascript"></script>
        
<script>
$(document).ready(function(){
//$("#workLocation").val($("#locationHidden").val());
	var levelsStr = $("#levelsStr").val();
	var parsedJson = jQuery.parseJSON(levelsStr);     
	var buildingName = $("#buildingName").val();
	var level = parsedJson[buildingName];
	if(level != undefined){
		var op = '';
		for(var i=1;i<=level;i++){
			op += '<option value="'+i+'">'+i+'</option>';
		}
		$("#level_Id").html(op);
	}
	 $('#buildingName').change(function () {
		 var buildingName = $("#buildingName").val();
		 level = parsedJson[buildingName];
		 	var op = '';
		 	for(var i=1;i<=level;i++){
				op += '<option value="'+i+'">'+i+'</option>';
			}
			$("#level_Id").html(op);
	    });
});
</script>
<style type="text/css">

//below added by kalyan

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
</select> --%>

<select id="tableStatusClone" style="display: none;">
	<option value="<spring:message code="reserved.label"/>" ><spring:message code="reserved.label"/></option>
	<option value="<spring:message code="dirty.table.label"/>" ><spring:message code="dirty.table.label"/></option>
	<option value="<spring:message code="free.label"/>" ><spring:message code="free.label"/></option>
	<option value="<spring:message code="under.service.label"/>" ><spring:message code="under.service.label"/></option>
</select>

<select id="tableCleanStatusClone" style="display: none;">
	<option value="<spring:message code="Cleaned.label"/>" ><spring:message code="Cleaned.label"/></option>
	<option value="<spring:message code="not.cleaned.label"/>" ><spring:message code="not.cleaned.label"/></option>
	<option value="<spring:message code="cleaning.label"/>" ><spring:message code="cleaning.label"/></option>
</select>



 <!-- Content Header (Page header) -->
<!-- Main content -->

				<%-- <section class="content-header">
                    <h1>
                        <spring:message code="apparel_outlet_configuration.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showOutletFlows()"><spring:message code="outlet.management.label"/></a></li>
                      <li> <a href="#" onclick="viewOutletConfigurations('outletConfigurations')"><spring:message code="stores.label"/></a></li>
                    <li> <span id="workLocation">${location}</span><spring:message code="apparel_outlet_configuration.label"/></li>
                    </ol>
                </section> --%>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"><span id="workLocation">${location}</span>  &nbsp;&nbsp;-&nbsp;&nbsp; <spring:message code="apparel_outlet_configuration.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                	
				                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      
									<div class="row">
									  <div class="form-group col-lg-4" style="display: none;">
									     <input type="hidden" name="storeCode" value=""/>
									     <input type="hidden"  id="restLocation" value="${location}"/>
									  </div>
									   <div class="form-group col-lg-4">
									     <label><spring:message code="building.name.label" /></label>
									     	<input type="hidden" id="locationList" value="${location}">
                                           <select name="buildingName" class="form-control" id="buildingName" required="required">
                                           	<c:forEach var="buildingName" items="${buildingNameList}"> 
												 <option value="${buildingName}">${buildingName}</option>
											 </c:forEach>
                                           </select>
									  </div>
									   <div class="form-group col-lg-4">
									    <label><spring:message code="level.label" /></label>
									    	<input type="hidden" id="levelsStr" value='${levelsStr}'>
                                           <select name="level" class="form-control" id="level_Id" required="required">
                                           </select>
                                        </div>
									   <%-- <div class="form-group col-lg-4">
									    <label><spring:message code="level.label" /></label>
                                           <!-- <input type="number" name="level" value="0" id="level_Id"/> -->
                                           <select name="level" class="form-control" id="level_Id" required="required">
                                           	<option>Choose Level</option>
                                           </select>
                                        </div> --%>
                                        
                                        <%-- <div class="form-group col-lg-3">
                                        
		                                        <div class="form-group" style="text-align: right;">
		                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="saveGroceryOutlet();" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
										  	<input type="button" id="edit"  class="btn bg-olive btn-inline" title="Cleare all storage systems" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
										  	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewConfigurations('outletConfigurations','grocery')" value="<spring:message code="cancel.label" />" />
											</div> 
                                        </div> --%>
                                        
									
									</div>
									
									   <div class="row" style="margin-top:-46px;">
									    <!-- <div class="form-group col-lg-4"></div>
									   <div class="form-group col-lg-4"></div>
									    -->
									    <div class="form-group" style="text-align: right;">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="saveGroceryOutlet();" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
								  	<%-- <input type="button" id="edit"  class="btn bg-olive btn-inline" title="Cleare all storage systems" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								   --%>	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="return viewRestaurantConfigurations('restaurantConfig');" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
                                       <div id="sketch" style="height: 500px;border: 1px solid #cccccc;">
                                      <%-- <canvas id="paint"></canvas> --%>
											<div id="outlet_innerview" style="margin-top:-21px;">
												 <%-- <img src="${pageContext.request.contextPath}/images/directions.gif" style="height: 108px;float: right;"> --%>
												 <div id="GroceryDroppable" style="height: 500px;">
												 	<ul>
												 	
												 	</ul>
												 </div>
												 
											</div>
											<div id="grocery_toolbar">
											<label style="margin-left: 17%;margin-top:7px;color:#777;"><spring:message code="warehouse_toolbar.label" /></label>
											<hr style="margin-top:-1px;">
											<%-- <div style="margin-left: 24px;cursor: pointer;" title="<spring:message code="grocery_outlet_shelfs.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_shelf.png" style="margin-top: -7px;" id="grocery_shelfs">
											 <span style="margin-left: 8px;color: #666666;"><spring:message code="grocery_outlet_shelfs.label" /></span>
											</div>
											<div style="margin-left: 24px;cursor: pointer;margin-top: 6px;" title="Rack">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_racks.png" style="margin-top: -7px;" id="grocery_racks">
											 <span style="margin-left: 7px;color: #666666;">	<spring:message code="warehouse_racks.label" /></span>
											</div> --%>
											<%--  --%>
											<%-- <div style="margin-left: 24px;margin-top:10px;cursor: pointer;" title="Bin">
											 <img src="${pageContext.request.contextPath}/images/warehouse-toolbar-bin.png" style="margin-top: -7px;"  id="grocery_bin" >
											 <span style="margin-left: 10px;color: #666666;">	<spring:message code="warehouse_bins.label" /></span>
											</div>
											
											<div style="margin-left: 26px;margin-top:10px;cursor: pointer;" title="<spring:message code="grocery_outlet_fridge.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_toolbar_fridge.png" style="margin-top: -7px;"  id="grocery_fridge" >
											 <span style="margin-left: 5px;color: #666666;">	<spring:message code="grocery_outlet_fridge.label" /></span>
											</div>
											 --%>
											<div style="margin-left: 27px;margin-top:10px;cursor: pointer;" title="<spring:message code="table.label" />">
											 <img src="${pageContext.request.contextPath}/images/chair_2_64.png" style="margin-top: -7px;"  id="grocery_bayarea" >
											 <span style="margin-left: 5px;color: #666666;">	<spring:message code="table.label" /></span>
											</div>
											
											<%-- <div style="margin-left: 18px;margin-top:10px;cursor: pointer;" title="<spring:message code="grocery_outlet_binarray.label" />">
											 <img src="${pageContext.request.contextPath}/images/grocery_display_binarray.png" style="margin-top: -7px;"  id="grocery_binarray" >
											 <span style="margin-left: 9px;color: #666666;">	<spring:message code="grocery_outlet_binarray.label" /></span>
											</div> --%>
												<!--  <div style="margin-left: 23%;margin-top: -7px;" id="warehouse_racks">Hi</div> -->
											</div>
										</div>
										<div class="row" style="margin-top:12px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="saveGroceryOutlet();" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
								  	<%-- <input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								   --%>	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="return viewRestaurantConfigurations('restaurantConfig');" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
										<%-- <input type="hidden" value="${categories}" id="productCategories"> --%>
										
										<input type="hidden" value='${location}' id="locationHidden">
                                		<input type="hidden" value="${storeCode}" id="storeCodeHidden">
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
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
        <input type="hidden" id="whlocation" value="${location}"/>
       
        <div class="modal fade popup-display" id="myModal" role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:180px;">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 171%;margin-left: -98px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" >&times;</button>
          <h4 class="modal-title" align="center" id="systemName"> </h4>
        </div>
        <div class="modal-body">
        	<div id="model_main_div">
        		<div id="model_main_div_storages">
        			<table id="systemsTable" border="1" ></table>
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
         			<span id="productSpan"></span> <span id="productSpanValue"></span><br><br>
         			<span id="productSpan1"></span> <span id="productSpanDescValue"></span><br><br>
         			<span id="selectedLabel"></span> <span id="selectedLabelVal"> </span> <br>
         			</div>
         		</div>
         	</div>
        </div>
        
        <div class="modal-footer">
        	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" data-dismiss="modal" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" onclick = "closeDialougeBox('save')"/>
      		<input type="button" class="btn bg-olive btn-inline"  data-dismiss="modal" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" value="<spring:message code="cancel.label" />"  onclick = "closeDialougeBox('close')"/>
      		
        <!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
       		
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>