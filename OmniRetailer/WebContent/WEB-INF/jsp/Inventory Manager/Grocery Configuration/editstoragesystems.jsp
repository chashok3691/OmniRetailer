<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Grocery Configuration/editOutletStorageSystems
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
         <script src="${pageContext.request.contextPath}/js/editgrocery_configuration.js" type="text/javascript"></script> 
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
          
          
         <%--    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> --%>
	    <script src="${pageContext.request.contextPath}/js/order.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
	
	 prepareJsonForExistingOutletStorageSystems();
	 
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
 <!-- Content Header (Page header) -->
<!-- Main content -->

				<section class="content-header">
                    <h1>
                        <spring:message code="grocery_outlet_configurations.label"/>
                    </h1>
                    <ol class="breadcrumb">
                   <li><a id="dashboard" href="#" onclick="return showOutletDashboard('all','all','month','all');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showOutletFlows()"><spring:message code="outlet.management.label"/></a></li>
                      <li> <a href="#" onclick="viewConfigurations('outletConfigurations','0')"><spring:message code="stores.label"/></a></li>
                    <li>  <span id="dynamicValue">&nbsp;</span> - <spring:message code="outlet.label"/></li>
                </section>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"> <span id="workLocation">${location}&nbsp;</span> - <spring:message code="outlet.label"/></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                <input type="hidden" id="storeCode" value="${storeCode }">
                                	<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
				                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                   <div class="row" style="margin-top:-46px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  <%-- 	<spring:message code="draw_warehouse_configuration.label" /> --%>
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return updateOutletStorageSystems()" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
								  <%-- 	<input type="button" id="edit"  class="btn bg-olive btn-inline" title="Cleare all storage systems" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								  --%> 	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewConfigurations('outletConfigurations','0')" value="<spring:message code="cancel.label" />" />
									</div> 
									
									</div>
								<div class="row" style="">
                                       <div id="sketch" style="height: 500px;border: 1px solid #cccccc;width:98%;margin-left:11px;">
                                      <%-- <canvas id="paint"></canvas> --%>
											<div id="warehouse_innerview" style="margin-top:-10px;">
<%-- 												 <img src="${pageContext.request.contextPath}/images/directions.gif" style="height: 108px;float: right;">
 --%>												 <div id="editoutletdroppable" style="height: 500px;" onclick="">
												 
												 	<!-- adding the storage systems  -->
							 <c:forEach var="storageSystems" items="${storageSystems}" varStatus="systems">
								 <c:if test="${storageSystems.storageSystemType=='Shelf'}">
										<c:set var="msg" value="${storageSystems.storageLocation}"/>
             		   					<c:set var="heightwidth" value="${fn:split(msg,'#')}" />
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} &#013; Length : ${storageSystems.length} &#013; Width : ${storageSystems.width} ">
											<img src="${pageContext.request.contextPath}/images/grocery_display_shelfs.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											
											<div><div style="width:48%;"><span>Length</span><input type="number" name = "editOutletStorageSystem${systems.count }length" value="${storageSystems.length }" class="form-control" id="editOutletStorageSystem${systems.count }length"></div>
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name ="editOutletStorageSystem${systems.count }width" value="${storageSystems.width}" class="form-control" id="editOutletStorageSystem${systems.count }width"></div></div>
											
											
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('editOutletStorageSystem${systems.count }')" title="Remove Storage System">
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
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('editOutletStorageSystem${systems.count }')" title="Remove Storage System">
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
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('editOutletStorageSystem${systems.count }')" title="Remove Storage System">
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
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('editOutletStorageSystem${systems.count }')" title="Remove Storage System">
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
             		   					<div style="left:${heightwidth[1]}px;top:${heightwidth[0]}px;width:64px;position: relative;visibility:${heightwidth[2]}" id="editOutletStorageSystem${systems.count}id" class="editcurrentSelectionclass" title="Storage System Id :  ${storageSystems.storageSystemId } &#013; Storage System Name : ${storageSystems.storageSystemName } &#013; No Of Rows : ${storageSystems.rows} &#013; No Of Columns : ${storageSystems.columns} &#013; Length : ${storageSystems.rows} &#013; Width : ${storageSystems.columns} ">
											<img src="${pageContext.request.contextPath}/images/grocery_display_rack.png"  style="cursor:pointer;" id="currentSelectionimageid" class="currentSelectionimageclass" onclick="showeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')">
										<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="editOutletStorageSystem${systems.count}Details">
											<br><center style="margin-top: -15px;"><span id="editOutletStorageSystem${systems.count }span">${storageSystems.storageSystemId }</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">
											<span>Storage System Name : </span><input type="text" name = "editOutletStorageSystem${systems.count }name" value="${storageSystems.storageSystemName}" class="form-control" id="editOutletStorageSystem${systems.count }name">
											<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = "editOutletStorageSystem${systems.count }rows" value="${storageSystems.rows }" class="form-control" id="editOutletStorageSystem${systems.count }rows"></div>
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											
											
											<div><div style="width:48%;"><span>Length</span><input type="number" name = "editOutletStorageSystem${systems.count }length" value="${storageSystems.length }" class="form-control" id="editOutletStorageSystem${systems.count }length"></div>
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name ="editOutletStorageSystem${systems.count }width" value="${storageSystems.width}" class="form-control" id="editOutletStorageSystem${systems.count }width"></div></div>
											
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('editOutletStorageSystem${systems.count }')" title="Remove Storage System">
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
											<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name ="editOutletStorageSystem${systems.count }columns" value="${storageSystems.columns }" class="form-control" id="editOutletStorageSystem${systems.count }columns"></div></div>
											<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/view.png" id="editcurrentSelection${systems.count }viewStorageSystem" style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" title="View Storage" onclick="viewEditStorageSystems('editOutletStorageSystem${systems.count}','${storageSystems.storageSystemType}','${storageSystems.storageSystemId }','exist')" data-toggle="modal" data-target="#myModalEdit"><img src="${pageContext.request.contextPath}/images/remove.png" style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('editOutletStorageSystem${systems.count }')" title="Remove Storage System">
											<img src="${pageContext.request.contextPath}/images/ok.png" style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Save Storage System Details"><img src="${pageContext.request.contextPath}/images/cancel.png" style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('editOutletStorageSystem${systems.count}')" title="Close Storage System Details">
											<input type="hidden" value="${storageSystems.storageSystemType }" id="editOutletStorageSystem${systems.count}type">
											<input type="hidden" value="${heightwidth[2]}" id="editOutletStorageSystem${systems.count}visibility">
											<input type="hidden" value="${storageSystems.storageSystemId }" id="editOutletStorageSystem${systems.count}systemId">
											<input type="hidden" value="${storageSystems.serialNumber }" id="editOutletStorageSystem${systems.count}serialNum">
										</div>
									</div>
								</c:if>
             		   										
             		   		
              										</c:forEach> 
												 		<ul>
												 		</ul>
												 </div>
												 
											</div>
										<div id="warehouse_toolbar" style="margin-top:-490px;">
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
											<%--  --%>
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
										</div>
										<div class="row" style="margin-top:35px;">
									   <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div>
									    <div class="form-group col-lg-4" style="text-align: right;margin-left:363px;">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="return updateOutletStorageSystems()"  value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" />
								  <%-- 	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
								   --%>	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewConfigurations('outletConfigurations','0')" value="<spring:message code="cancel.label" />" />
									</div> 
									<div class="row" style="">
									</div>
									<div class="row" style="">
									</div>
									</div>
										<input type="hidden" value="${categoriesList}" id="productCategories">
										<input type="hidden" value='${warehouse}' id="warehouseDetails">
                                </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
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
                <!-- <input type="hidden" id="hiddenStore" value=""/> -->
                <input type="hidden" id="hiddenStore" value="${storeCode}"/>
                <input type="hidden" value="${storeCode}" id="outletIdHidden">
        
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
         			<input type='text' name='searchProduct' id='addSearchProduct' placeholder = 'Search Product..' class="searchItems">
         				<div class="services">
							<div class="items">
								<ul class="matchedStringUl storageSkus" style="width: 25% !important;"></ul>
							</div>
						</div>
         			<br>
         			<div style = "margin-left:25px;">
	         			<span id="productSpanEdit" style = "margin-left : 0px;"></span> <span id="productSpanValueEdit" style = "margin-left : 0px;"></span><br><br>
	         			<span id="productSpan1Edit" style = "margin-left : 0px;"></span> <span id="productSpanDescValueEdit" style = "margin-left : 0px;"></span><br><br>
	         			<span id="selectedLabelEdit" style = "margin-left : 0px;"></span> <span id="selectedLabelValEdit" style = "margin-left : 0px;"> </span> <br><br>
	         			<span id="selectedItemQty" style = "margin-left : 0px;"></span> <span id="selectedItemQtyVal" style = "margin-left : 0px;"> </span> <br><br>
         			</div>
         			</div>
         		</div>
         	</div>
        </div>
        
        <div class="modal-footer">
        	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" value="&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;" onclick = "updateStorageSystemDetails()"/>
      		<input type="button" class="btn bg-olive btn-inline"  data-dismiss="modal" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" value="<spring:message code="cancel.label" />"  onclick = ""/>
      		
        <!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
       		
        </div>
      </div>
      
    </div>
  </div>
       
</body>
</html>