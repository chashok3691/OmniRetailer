<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/home.jsp
 * file type		        : JSP
 * description				: This is the home page, which u get after login successful.
 * */ -->
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<META HTTP-EQUIV="Cache-Control" CONTENT="No-Cache,Must-Revalidate,No-Store">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">
    <title>Welcome | Omni Retailer</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/images/TechnoLabs-favicon.png"/>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"  type="text/javascript"></script>  --%>
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <link href="${pageContext.request.contextPath}/css/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>
     <!-- daterange picker -->
	<%-- <link href="${pageContext.request.contextPath}/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" /> --%>
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/css/AdminLTE.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/replication.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/counters.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/grocery_configurations.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/savePopUp.css">
     <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
	
 <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>
<!-- bootstrap wysihtml5 - text editor -->

  <!-- Morris.js charts -->
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
   #logo {
    height: 100%;
    padding-bottom: 2px;
    width: 100%;
    object-fit: contain;
}

 /* #loadingReports{width: 100%;height: 100%;top: 0px;left: 0px;position: fixed;display: none; z-index: 99;text-align:center} */ 
	#loading {width: 100%;height: 100%;top: 0px;left: 0px;position: fixed;display: none; z-index: 99}
	#loading-image {
		position: absolute;
		top: 57%;
		left: 58%;
		z-index: 100;
		width: 5%;
	}
	#loadingImgcontent {
		position: absolute;
		top: 45%;
		left: 46%;
        font-size:16px	
	}
	
	#loading-header {
		position: absolute;
		top: 45%;
		left: 41%;
        font-size:20px;
       text-align: center;
	}
	
	#loadingreport {
	width: 100%;
	height: 100%;
	top: -59px;
	left: 2px;
	position: fixed;
	display: none;
	z-index: 99;
	/* background:white */
}

#loading-imagereport {
	position: absolute;
	top: 57%;
	left: 60%;
	z-index: 100;
	width: 5%;
}

#loadingmenu {
	width: 100%;
	height: 100%;
	top: -59px;
	left: 2px;
	position: fixed;
	display: none;
	z-index: 99;
	/* background:white */
}
#loadingInventory {
	width: 100%;
	height: 100%;
	top: -59px;
	left: 2px;
	position: fixed;
	display: none;
	z-index: 99;
	/* background:white */
}

#loadingBillsSAP {
	width: 100%;
	height: 100%;
	top: -59px;
	left: 2px;
	position: fixed;
	display: none;
	z-index: 99;
	/* background:white */
}


#loadingImgcontent {
	position: absolute;
	top: 45%;
	left: 46%;
	font-size: 16px
}

#loading-headerreport {
	position: absolute;
	top: 45%;
	left: 46%;
	font-size: 16px;
	
}
	
	
	.active-menu{
		color : white !important;
	}
	.disabled{
	  pointer-events: none;
	  /* for "disabled" effect */
	  opacity: 0.5;
	  background: #CCC;
	}
    label {
	 font-weight: normal; 
	}

/* 	 to fix the  position after modal popup opens */
body.modal-open {
/* margin-left: auto;
margin-right: auto; */
padding-right: 0px !important;
}
	
</style>
   
<script type="text/javascript">
/* $("body").on("click", function () {
	var result = $("#right-side").height();
	$(".left-side").css("height",result+"px");
}); */
//function test(){
$(document).ready(function(){
	debugger;
		history.pushState(null, null, '');
		history.back(); 
		history.forward();
	    window.addEventListener('popstate', function(event) {
	    	debugger;
	    history.pushState(null, null, '');
	    });
	    
	    window.onpopstate = function () {
	    	history.pushState(null, null, '');
	    };
	
	
	    
	/* window.history.forward(); */
/* 	history.pushState(null, null, 'authenticateUser.do');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'authenticateUser.do');
    }); */
	/* if($("#ulUserAccessControl").children().length != 0){
		$("#liUserAccessControl").css("display","block");
	} */
	/* if($("#ulGenericData").children().length != 0){
		$("#liGenericData").css("display","block");
	}
	if($("#ulMasterDetails").children().length != 0){
		$("#master-details").css("display","block");
	}
	if($("#master-details").css("display") == "block" || $("#liGenericData").css("display") == "block"){
		$("#liMasterDataManagement").css("display","block");
	} */
	/* if($("#ulDataManagement").children().length != 0){
		$("#liDataManagement").css("display","block");
	} */
	/* if($("#ulShiftManagement").children().length != 0){
		$("#liShiftManagement").css("display","block");
	} */
	if($("#ulInventoryManagement").children().length != 0){
		$("#liInventoryManagement").css("display","block");
	}
	if($("#ulstoredetails").children().length != 1){
		$("#storedetails").css("display","block");
	}
	/* if($("#ulDealsOffers").children().length != 0){
		$("#deals-offers").css("display","block");
	} */
	if($("#ulOutletProcurement").children().length != 0){
		$("#liOutletProcurement").css("display","block");
	}
	  if($("#ulRestaurantManagement").children().length != 0){
		$("#liRestaurantManagement").css("display","block");
	} 
	  
	  if($("#ulDealsOffers").children().length != 0){
			$("#deals-offers").css("display","block");
		} 
	  
	  if($("#ulCampaignPromotions").children().length != 0){
			$("#liCampaignPromotions").css("display","block");
		} 
	  debugger;
	  if($("#ulOrders").children().length != 0){
			$("#liOrders").css("display","block");
		} 
	  
	  if($("#ulOutletGRNReports").children().length != 0){
			$("#liOutletGRNReports").css("display","block");
		} 
	/* if($("#ulLoyalty").children().length != 0){
		$("#liLoyalty").css("display","block");
	}
	if($("#ulLoyaltyProgram").children().length != 1){
		$("#loyaltyProgram").css("display","block");
	} */
	if($("#ulwarehouseDetails").children().length != 0){
		$("#warehouseDetails").css("display","block");
	}
	if($("#ulStockManagement").children().length != 0){
		$("#liStockManagement").css("display","block");
	}
	if($("#ulOrderManagementUl").children().length != 0){
		$("#liOrderManagementLi").css("display","block");
	}
	if($("#ulProcurement").children().length != 0){
		$("#liProcurement").css("display","block");
	}
	if($("#ulWarehouseSales").children().length != 0){
		$("#liWarehouseSales").css("display","block");
	}
	if($("#ulOutletSalesReports").children().length != 0){
		$("#liOutletSalesReports").css("display","block");
	}
	if($("#ulOutletReports").children().length != 0){
		$("#liOutletReports").css("display","block");
	} 
/* 	if($("#ulOutletReports").children().length != 1){
		$("#liOutletReports").css("display","block");
	} */
   if($("#ulReports").children().length != 0){
		$("#reports").css("display","block");
	} 
	if($("#ulWarehouseReports").children().length != 1){
		$("#liWarehouseReports").css("display","block");
	}

	 if($("#uloutletMonitoring").children().length != 0){
		$("#liOutletMonitoring").css("display","block");
	}  
	/* if($("#ulSettings").children().length != 0){
		$("#liSettings").css("display","block");
	} */
	/* if($("#dashboard").length > 0){
        activeMenu("outletDashboard");
		openMenu("liDashboard", "ulDashboard",0);
	} */ 
	
	
	
});
//}
</script>
</head>
<!-- <body class="skin-blue" onload="test();"> -->
<body class="skin-blue">
<div id="loading">
<img id="loading-image" src="${pageContext.request.contextPath}/images/loading.gif" alt="Loading..." />
</div> 


 <!--  added by koti -->
 
	<div id="loadingreport"   >
     <div style="width: 40%;
    height: 25%;
    top: 35%;
    left: 42%;
    position: fixed;
    background: #e6e6e6;
    border-radius: 20px;"></div> 
		<h1 id="loading-headerreport">
			<b>It may take several minutes to generate the report, please
				wait!</b>
		</h1>

		<img id="loading-imagereport"
			src="${pageContext.request.contextPath}/images/loading.gif"
			alt="Loading..." />
	</div>

	<div id="loadingmenu"   >
     <div style="width: 40%;
    height: 25%;
    top: 35%;
    left: 42%;
    position: fixed;
    background: #e6e6e6;
    border-radius: 20px;"></div> 
		<h1 id="loading-headerreport">
			<b>It may take several minutes to load menu, please
				wait!</b>
		</h1>

		<img id="loading-imagereport"
			src="${pageContext.request.contextPath}/images/loading.gif"
			alt="Loading..." />


	</div>


	<div id="loadingInventory"   >
     <div style="width: 40%;
    height: 25%;
    top: 35%;
    left: 42%;
    position: fixed;
    background: #e6e6e6;
    border-radius: 20px;"></div> 
		<h1 id="loading-headerreport">
			<b>It may take several minutes to load Inventory, please
				wait!</b>
		</h1>

		<img id="loading-imagereport"
			src="${pageContext.request.contextPath}/images/loading.gif"
			alt="Loading..." />


	</div>

<div id="loadingBillsSAP"   >
     <div style="width: 40%;
    height: 25%;
    top: 35%;
    left: 42%;
    position: fixed;
    background: #e6e6e6;
    border-radius: 20px;"></div> 
		<h1 id="loading-headerreport">
			<b>It may take several minutes to upload bills to SAP, please
				wait!</b>
		</h1>

		<img id="loading-imagereport"
			src="${pageContext.request.contextPath}/images/loading.gif"
			alt="Loading..." />
	</div>
	


<%--  
<div id="loadingReports">
<img id="loading-image" src="${pageContext.request.contextPath}/images/loading.gif" alt="Loading..." />
<div id="loadingImgcontent" style="text-align:ceneter"> Data is fetching,It May Take Long Time.Please Wait...
</div>
</div>  --%>

<div id="mainDiv">
      <!-- header logo: style can be found in header.less -->
      <header class="main-header" style="">
              <!-- Add the class icon to your logo image or logo icon to add the margining -->
               <c:choose>
                    <c:when test="${not empty sessionScope.logo}">
			          <a href="${pageContext.request.contextPath}/login/home.do" style="cursor: pointer;padding: 0px;" class="logo">
                      	<img id="logo" alt="Logo" src="data:image/jpeg;base64,${sessionScope.logo}" />
			          </a>
                    </c:when>
                    <c:otherwise>
 			          <a href="${pageContext.request.contextPath}/login/home.do" style="cursor: pointer;" class="logo">
				       <img id="logo" alt="Logo" src="${pageContext.request.contextPath}/images/LOGO.png" />
				      </a>
                    </c:otherwise>
                </c:choose>
          <!-- Header Navbar: style can be found in header.less -->
          <nav class="navbar navbar-static-top" role="navigation">
              <!-- Sidebar toggle button-->
              <a style="cursor: pointer;" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                  <span class="sr-only">Toggle navigation</span>
              </a>
              
               <%-- <c:if test="${sessionScope.customerId == 'CID8995445'}"> --%>
                   	 	<%-- <center>NAMDHARI SEEDS</center> --%>
                   	 	<span class="label col-lg-8" style="color:white;line-height:50px; font-size:18px">${sessionScope.businessName}</span>
              <%--  </c:if> --%>
              
              <div class="navbar-custom-menu col-lg-3">
                  <ul class="nav navbar-nav" style="float: right;">
                      <!-- Messages: style can be found in dropdown.less-->
                      <!-- User Account: style can be found in dropdown.less -->
                      <li class="dropdown user user-menu">
                          <a style="cursor: pointer;" class="dropdown-toggle" data-toggle="dropdown">
                              <i class="glyphicon glyphicon-user"></i>
                              <span>${sessionScope.firstName}<i class="caret"></i></span>
                          </a>
                          <ul class="dropdown-menu">
                              <!-- User image -->
                              <div style="text-align:center">
                              <li class="user-header bg-light-blue" >
                                  <img src="${pageContext.request.contextPath}/images/admin.png" class="img-circle" alt="User Image" />
                                  <p>
                                      ${sessionScope.firstName} 
                                  </p>
                                   ${sessionScope.role}
                              </li>
                              </div>
                            <%--   <li class="user-header bg-light-blue">
                                  <img src="${pageContext.request.contextPath}/images/admin.png" class="img-circle" alt="User Image" />
                                  <p>
                                      ${sessionScope.firstName} - ${sessionScope.role}
                                  </p>
                              </li>
 --%>
   <%--  <input type="hidden" id="windowName" value="${WINDOW_NAME}"> --%>
                              <!-- Menu Footer-->
                              <li class="user-footer">
                                  <div class="pull-left">
                                     <a style="cursor: pointer;" class="btn btn-default btn-flat" onclick="return editProfile();"><spring:message code="profile.settings" /></a> 
                                  </div>
                                  <div class="pull-right">
                                      <a href="${pageContext.request.contextPath}/login/logout.do" class="btn btn-default btn-flat"><spring:message code="signout.label" /></a>
                                  </div>
                              </li>
                          </ul>
                      </li>
                  </ul>
              </div>
          </nav>
     </header>
        <div class="">
            <!-- Left side column. contains the logo and sidebar -->
               <aside class="left-side sidebar-offcanvas" id="main-menu" style="" >

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${pageContext.request.contextPath}/images/admin.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p><spring:message code="hello.label" /> ${sessionScope.firstName}</p>

                            <a style="cursor: pointer;"><i class="fa fa-circle text-success"></i> <spring:message code="online.label" /></a>
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                    <c:if test="${sessionScope.role == 'super admin'}"> 
                        <li id="liDashboard" class="active-menu" style="cursor: pointer;">
                            <a id="dashboard" onclick="showOutletDashboard('all','all','month','all');">
                                <i class="fa fa-dashboard"></i> <span><spring:message code="dashboard.label" /></span>
                            </a>
                        </li>
				  	  </c:if>
				  	  <c:set var="dashBoardAdded" value="false" />
                     <c:forEach var="accessControl" items="${sessionScope.dashboard}">
	                     <c:if test="${accessControl.appFlow == 'Dashboard' && dashBoardAdded == 'false' }"> 
	                        <li id="liDashboard" class="active-menu" style="cursor: pointer;">
	                            <a id="dashboard" onclick="showOutletDashboard('all','all','month','all');">
	                                <i class="fa fa-dashboard"></i> <span><spring:message code="dashboard.label" /></span>
	                            </a>
	                        </li>
	                        <c:set var="dashBoardAdded" value="true" />
					  	  </c:if>
					 </c:forEach> 
                        <c:if test="${sessionScope.role == 'super admin'}">
                          <li class="treeview" id="liSettings" style="cursor: pointer;">
                            <a onclick="showCustomerSettingsFlow();"><i class="fa  fa-wrench"></i><span><spring:message code="customer.settings.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            <ul id="ulSettings" class="treeview-menu">
                              	<li ><a id="profile" onClick="viewEditCustomerSettings('profile','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="profile.settings.label" /></a></li>
                              	<li ><a id="email" onClick="viewEditMailSettings('email','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="email.settings.label" /></a></li>
                              	<li ><a id="sms" onClick="viewEditSMSSettings('sms','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="sms.settings.label" /></a></li>
                              	<li ><a id="whatsapp" onClick="viewEditWhatsAppSettings('whatsapp','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="whatsapp.settings.label" /></a></li>
                              	<li ><a id="print" onClick="viewEditPrintSettings('print','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="header.and.footer.label" /></a></li>
                              	<li ><a id="userSecurity" onClick="viewEditUserSecurity('userSecurity','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="system.and.security.label" /></a></li>
                              	<li ><a id="regional" onClick="viewEditRegionalSettings('regional','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="regional.settings.label" /></a></li>
                             	<li ><a id="integration" onClick="viewEditIntegrationSettings('integration','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="integration.settings.label" /></a></li>
                             	<li ><a id="ftp" onClick="viewEditFTPSettings('ftp','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="ftp.settings.label" /></a></li>
                              </ul>
                        </li>
                      </c:if>
                      
                      
                      <c:forEach var="accessControl" items="${sessionScope.settings}" varStatus="theCount">
                           <c:if test="${theCount.count == 1}">
                           		<li class="treeview" id="liSettings" style="cursor: pointer;">
		                           <a onclick="showCustomerSettingsFlow();"><i class="fa  fa-wrench"></i><span><spring:message code="customer.settings.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		                            <ul id="ulSettings" class="treeview-menu">
                           </c:if>
                      </c:forEach>
                      
                              <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'ProfileSettings'}">
                            		<li ><a id="profile" onClick="viewEditCustomerSettings('profile','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="profile.settings.label" /></a></li>
                           		</c:if>
                             </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'EmailSettings'}">
                           			<li ><a id="email" onClick="viewEditMailSettings('email','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="email.settings.label" /></a></li>
                           		</c:if>
                             </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'SmsSettings'}">
                           			<li ><a id="sms" onClick="viewEditSMSSettings('sms','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="sms.settings.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'WhatsAppSettings'}">
                           			<li ><a id="whatsapp" onClick="viewEditWhatsAppSettings('whatsapp','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="whatsapp.settings.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'PrintSettings'}">
                           			<li ><a id="print" onClick="viewEditPrintSettings('print','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="header.and.footer.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'UserSecuritySettings'}">
	                              	<li ><a id="userSecurity" onClick="viewEditUserSecurity('userSecurity','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="system.and.security.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                              <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'RegionalSettings'}">
	                              	<li ><a id="regional" onClick="viewEditRegionalSettings('regional','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="regional.settings.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'IntegrationSettings'}">
	                              	<li ><a id="integration" onClick="viewEditIntegrationSettings('integration','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="integration.settings.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.settings}">
                            	<c:if test="${accessControl.appDocument == 'FtpSettings'}">
	                              	<li ><a id="ftp" onClick="viewEditFTPSettings('ftp','edit')"><i class="fa fa-angle-double-right"></i><spring:message code="ftp.settings.label" /></a></li>
                           		</c:if>
                            </c:forEach>
                      <c:forEach var="accessControl" items="${sessionScope.settings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
                           		</ul>
                        	</li>
                          </c:if>
                      </c:forEach>
                  <c:if test="${sessionScope.role == 'super admin'}"> 
                     <li class="treeview" id="liMasterDataManagement" style="cursor: pointer;"><a onclick="showMasterDataManagement();"><i class="fa fa-cog"></i><span><spring:message code="master.data.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
						  <ul id="ulMasterDataManagement" class="treeview-menu">
					 		<li id="liGenericData" style="cursor: pointer;"><a onclick="showGenericMasterFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="generic.data.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            	<ul id="ulGenericData" class="treeview-menu">
<%--                             	<li><a id="assetMaster" onclick="return viewAssetMaster('assetMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="asset.master.label" /></a></li>
 --%>	                            <li><a id="brandMaster" onclick="return viewBrandMaster('brandMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="brand.master.label" /></a></li>
	                             	<li><a id="categoryMaster" onclick="return viewCategoryMaster('categoryMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="category.master.label" /></a></li>
	              					<li><a id="currencyMaster" onclick="return viewCurrencyMaster('currencyMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="currency.master.label" /></a></li>               	
	                             	 <li><a id="denominationMaster" onclick="return viewDenominationMaster('DenominationMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="denomination.master.label" /></a></li>
	                             	 <li><a id="departmentMaster" onclick="return viewDepartmentMaster('departmentMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="department.master.label" /></a></li>
	                             	<li><a id="organizationdepartmentMaster" onclick="return viewOrganizationDepartmentMaster('organizationdepartmentMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="organizationdepartment.master.label" /></a></li>
	                             	
	                             	<li><a id="employeeMaster" onclick="return viewEmployeeMaster('employeeMaster','0','');" ><i class="fa fa-angle-double-right"></i> <spring:message code="employee.master.label" /></a></li>
	                              <li><a id="hsnMaster" onclick="return viewHSNMaster('hsnMaster','0','');" ><i class="fa fa-angle-double-right"></i> Hsn Master</a></li>
	                             	
	                             	<li><a id="locationMaster" onclick="return viewLocationMaster('locationMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="location.master.label" /></a></li>
	                           		<%-- <li><a id="productmaster" onclick="return viewProductMaster('productmaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="product.master.label" /></a></li> --%>
	                             	<li><a id="supplierMaster" onclick="return viewSupplierMaster('supplierMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.master.label" /></a></li>
	                             	<li><a id="subCategoryMaster" onclick="return viewSubCategoryMaster('subCategoryMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="sub.category.master.label" /></a></li>
	                           <li><a id="shipmentRateMaster" onclick="return viewShipmentRateMaster('shipmentRateMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.rate.master.label" /></a></li>
	                          <li><a id="taxMaster" onclick="return viewTaxMaster('taxMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.master.label" /></a></li>
	                             	<li><a id="zoneMaster" onclick="return viewZoneMaster('zoneMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="zone.master.label" /></a></li>
	                            <li><a id="sectionMaster" onclick="return viewSectionMaster('sectionMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="section.master.label" /></a></li>
	                            </ul>
                        	</li>
                        	<li id="master-details" style="cursor: pointer;"><a onclick="showOutletMasterFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="masters.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            	<ul id="ulMasterDetails" class="treeview-menu">
	                             	  	<li><a id="skumaster" onclick="return viewSkuMaster('skumaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.master.label" /></a></li>
<%-- 	                             	  	<li><a id="OutletStorageSystemsMaster" onclick="return viewOutletStorageSystemsMaster('OutletStorageSystemsMaster','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="storagesystemsmaster.label" /></a></li>
 --%>	                             	  	
	                             	  	<li><a id="productGroupMaster" onclick="return viewProductGroupMaster('productGroupMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="product.group.master.label" /></a></li>
									<li><a id="priceRangeMaster" onclick="return viewpriceRangeMaster('priceRangeMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.range.master.label" /></a></li>
										<li><a id="BomMaster" onclick="return viewBomMaster('BomMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bom.master.label" /></a></li>
								<li><a id="PriceUpdate" onclick="return viewPriceUpdate('PriceUpdate','0','priceoutletLocation');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.updating.label" /></a></li>
								</ul>
							</li>
							    <li id="warehousemaster-details" style="cursor: pointer;"><a onclick="showWarehouseMasterFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="warehouse.master.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                            <ul id="ulWarehouseMasterDetails" class="treeview-menu">
								<li><a id="warehouseskumaster" onclick="return viewWarehouseSkuMaster('warehouseskumaster','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.master.label" /></a></li>
									<li><a id="WarehouseStorageSystemsMaster" onclick="return viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="storagesystemsmaster.label" /></a></li>
									<li><a id="WarehouseFleetMaster" onclick="return viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="fleetmaster.label" /></a></li>
									<li><a id="BomMasterWH" onclick="return viewBomMaster('BomMasterWH','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bom.master.label" /></a></li>
									<li><a id="WarehouseLogisticsPartners" onclick="return viewWarehouseLogisticsPartners('WarehouseLogisticsPartners','0','');"><i class="fa fa-angle-double-right"></i><spring:message code="logisticspartner.label" /></a></li>
						  </ul>
					   </li>
					   </ul>
							</li>
                     </c:if>
                     <c:set var="mdmAdded" value="false" />
                     <c:set var="mdmAddedOutlet" value="false" />
                      <c:set var="mdmAddedOutletWHouse" value="false" />
                     <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
                           <li class="treeview" id="liMasterDataManagement" style="cursor: pointer;"><a onclick="showMasterDataManagement();"><i class="fa fa-cog"></i><span><spring:message code="master.data.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
					  		  <ul id="ulMasterDataManagement" class="treeview-menu">
					 			<li id="liGenericData" style="cursor: pointer;"><a onclick="showGenericMasterFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="generic.data.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            		<ul id="ulGenericData" class="treeview-menu">
                            <c:set var="mdmAdded" value="true" />
                          </c:if>
                      </c:forEach>
                      <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1 && mdmAdded == 'false'}">
                           <li class="treeview" id="liMasterDataManagement" style="cursor: pointer;"><a onclick="showMasterDataManagement();"><i class="fa fa-cog"></i><span><spring:message code="master.data.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
					  		  <ul id="ulMasterDataManagement" class="treeview-menu">
					  		  <c:set var="mdmAddedOutlet" value="true" />
                          </c:if>
                      </c:forEach>
                      <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1 && mdmAdded == 'false'}">
                           <li class="treeview" id="liMasterDataManagement" style="cursor: pointer;"><a onclick="showMasterDataManagement();"><i class="fa fa-cog"></i><span><spring:message code="master.data.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
					  		  <ul id="ulMasterDataManagement" class="treeview-menu">
					  		  <c:set var="mdmAddedOutletWHouse" value="true" />
                          </c:if>
                      </c:forEach>
                      <input type="hidden" value="${mdmAdded}">
					<%-- <c:set var="assetMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                           		<c:if test="${accessControl.appDocument == 'AssetMaster' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="assetMaster" value="true"/>		
									<li><a id="assetMaster" onclick="return newAssetMaster('assetMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="asset.master.label" /></a></li>
								</c:if>
								<c:if test="${accessControl.appDocument == 'AssetMaster' && assetMaster == false}"> 		
                           			<li><a id="assetMaster" onclick="return viewAssetMaster('assetMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="asset.master.label" /></a></li>
                           		</c:if>
						   </c:forEach> --%>
					<c:set var="brandMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'BrandMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="brandMaster" value="true"/>		
                             			<li><a id="brandMaster" onclick="return newBrandMaster('brandMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="brand.master.label" /></a></li>
                             		</c:if>
                             		<c:if test="${accessControl.appDocument == 'BrandMaster' && brandMaster == false}"> 		
                            			<li><a id="brandMaster" onclick="return viewBrandMaster('brandMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="brand.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                       <c:set var="categoryMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            	<c:if test="${accessControl.appDocument == 'CategoryMaster' && accessControl.write == true && accessControl.read == false}">
                            		<c:set var="categoryMaster" value="true"/> 
                            		<li><a id="newCategory" onclick="return newCategory('newCategory');" ><i class="fa fa-angle-double-right"></i> <spring:message code="category.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'CategoryMaster' && categoryMaster == false}"> 
                            		<li><a id="categoryMaster" onclick="return viewCategoryMaster('categoryMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="category.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                      
                             <c:set var="currencyMaster" value="false"/> 
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true && accessControl.read == false}"> 	
                             		 <c:set var="currencyMaster" value="true"/> 		
                            			<li><a id="newCurrency" onclick="return newCurrency('newCurrency');" ><i class="fa fa-angle-double-right"></i> <spring:message code="currency.master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CurrencyMaster' && currencyMaster == false}"> 			
                            			<li><a id="currencyMaster" onclick="return viewCurrencyMaster('currencyMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="currency.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                            <c:set var="denominationMaster" value="false"/>	
						   <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
						   <c:if test="${accessControl.appDocument == 'DenominationMaster'&& accessControl.write == true && accessControl.read == false }"> 
                           				<c:set var="denominationMaster" value="true"/>	
                           			<li><a id="denominationMaster" onclick="return viewDenominationMaster('denominationMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="denomination.master.label" /></a></li>
                           		</c:if>
                           		<c:if test="${accessControl.appDocument == 'DenominationMaster'&& denominationMaster == false }"> 
                           				
                           			<li><a id="denominationMaster" onclick="return viewDenominationMaster('denominationMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="denomination.master.label" /></a></li>
                           		</c:if>
						   
						   </c:forEach>
                            
                           <c:set var="departmentMaster" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'Departments' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="departmentMaster" value="true"/>
                            			<li><a id="departmentMaster" onclick="return viewDepartmentMaster('departmentMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="counter_master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'Departments' && departmentMaster == false}"> 
                             			<li><a id="departmentMaster" onclick="return viewDepartmentMaster('departmentMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="department.master.label" /></a></li>
                             		</c:if>
                             </c:forEach>
                             
                           <c:set var="organizationdepartmentMaster" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            	<c:if test="${accessControl.appDocument == 'OrgDepartments' && organizationdepartmentMaster == false}"> 
                             			<li><a id="organizationdepartmentMaster" onclick="return viewOrganizationDepartmentMaster('organizationdepartmentMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="organizationdepartment.master.label" /></a></li>
                             		</c:if>
                            </c:forEach>
                            
                            <c:set var="employeeMaster" value="false"/> 			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="employeeMaster" value="true"/>  		
                            			<li><a id="newEmployee" onclick="return viewNewEmployee('newEmployee');" ><i class="fa fa-angle-double-right"></i> <spring:message code="employee.master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'EmployeeMaster' && employeeMaster == false}"> 		
                            			<li><a id="employeeMaster" onclick="return viewEmployeeMaster('employeeMaster','0','');" ><i class="fa fa-angle-double-right"></i> <spring:message code="employee.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>	
                            
                             <c:set var="hsnMaster" value="false"/> 			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="hsnMaster" value="true"/>  		
                            			<li><a id="newhsn" onclick="return viewhsncode('newhsn');" ><i class="fa fa-angle-double-right"></i> Hsn Master</a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'HSNMaster' && hsnMaster == false}"> 		
                            		<li><a id="hsnMaster" onclick="return viewHSNMaster('hsnMaster','0','');" ><i class="fa fa-angle-double-right"></i> Hsn Master</a></li>
                            		
                            		</c:if>
                            </c:forEach>
                            
                         <c:set var="B2BPartners" value="false"/>			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'B2BPartners' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="stateMaster" value="true"/>  		
                            			<li><a id="newstate" onclick="return viewstatecode('newstate');" ><i class="fa fa-angle-double-right"></i>B2B Partners</a></li>
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'B2BPartners' && B2BPartners == false}">
                            		<li><a id=b2bPartners onclick="return viewb2bPartners('b2bPartners','0');" ><i class="fa fa-angle-double-right"></i>B2B Partners</a></li>
                            		</c:if>
                             </c:forEach>	
                             		
                           
                              <c:set var="stateMaster" value="false"/>			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'StateMaster' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="stateMaster" value="true"/>  		
                            			<li><a id="newstate" onclick="return viewstatecode('newstate');" ><i class="fa fa-angle-double-right"></i>State Master </a></li>
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'StateMaster' && stateMaster == false}">
                            		<li><a id=stateMaster onclick="return viewStateMaster('stateMaster','0','');" ><i class="fa fa-angle-double-right"></i>State Master</a></li>
                            		</c:if>
                             </c:forEach>	
                            
                            
                             <c:set var="locationMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="locationMaster" value="true"/>		
                            			<li><a id="newLocation" onclick="return newLocation('newLocation');" ><i class="fa fa-angle-double-right"></i> <spring:message code="location.master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'LocationMaster' && locationMaster == false}"> 		
                            			<li><a id="locationMaster" onclick="return viewLocationMaster('locationMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="location.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                           
                            
							  
						    <%-- <c:set var="productMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            	<c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="productMaster" value="true"/>
                            		<li><a id="newProduct" onclick="return viewNewProduct('newProduct');"><i class="fa fa-angle-double-right"></i> <spring:message code="product.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'ProductMaster' && productMaster == false}"> 
                            		<li><a id="productmaster" onclick="return viewProductMaster('productmaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="product.master.label" /></a></li>
                            	</c:if>
                            </c:forEach> --%>
                            <c:set var="supplierMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            	<c:if test="${accessControl.appDocument == 'SupplierMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="supplierMaster" value="true"/>
                            		<li><a id="newSupplier" onclick="return viewNewSupplier('newSupplier');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'SupplierMaster' && supplierMaster == false}"> 
                            		<li><a id="supplierMaster" onclick="return viewSupplierMaster('supplierMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                              
                            <c:set var="subCategoryMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            	<c:if test="${accessControl.appDocument == 'SubcategoryMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="subCategoryMaster" value="true"/>
                            		<li><a id="newSubCategory" onclick="return newSubCategory('newSubCategory');" ><i class="fa fa-angle-double-right"></i> <spring:message code="sub.category.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'SubcategoryMaster' && subCategoryMaster==false}"> 
                            		<li><a id="subCategoryMaster" onclick="return viewSubCategoryMaster('subCategoryMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="sub.category.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                             <c:set var="shipmentRateMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            	<c:if test="${accessControl.appDocument == 'ShipmentRateMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="shipmentRateMaster" value="true"/>
                            		<li><a id="shipmentRateMaster" onclick="return newShipmentRateMaster('shipmentRateMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.rate.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'ShipmentRateMaster' && shipmentRateMaster==false}"> 
                            		<li><a id="shipmentRateMaster" onclick="return viewShipmentRateMaster('shipmentRateMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.rate.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                           <%--  <li><a id="sectionMaster" onclick="return viewSectionMaster('sectionMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="section.master.label" /></a></li> --%>
                              <c:set var="taxMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'TaxMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="taxMaster" value="true"/> 
                            			<li><a id="newTax" onclick="return newTax('newTax');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'TaxMaster' && taxMaster==false}"> 
                            			<li><a id="taxMaster" onclick="return viewTaxMaster('taxMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                            
                             <c:set var="zoneMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            	<c:if test="${accessControl.appDocument == 'ZoneMaster' && zoneMaster == false}"> 		
                            			<li><a id="zoneMaster" onclick="return viewZoneMaster('zoneMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="zone.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                            
                          
                            	
                            
                            
                             <c:set var="routeMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'RouteMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="zoneMaster" value="true"/>		
                            			<li><a id="newZone" onclick="return newZone('newZone');" ><i class="fa fa-angle-double-right"></i> <spring:message code="route.master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'RouteMaster' && routeMaster == false}"> 		
                            			<li><a id="routeMaster" onclick="return viewRouteMaster('routeMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="route.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>


                             <c:set var="serviceAreaMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'ServiceAreaMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="zoneMaster" value="true"/>		
                            			<li><a id="newZone" onclick="return newZone('newZone');" ><i class="fa fa-angle-double-right"></i> <spring:message code="service.area.master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ServiceAreaMaster' && serviceAreaMaster == false}"> 		
                            			<li><a id="serviceAreaMaster" onclick="return viewServiceAreaMaster('serviceAreaMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="service.area.master.label" /></a></li>
                            		</c:if>
                            </c:forEach>

  							
  							<c:set var="TenderMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'TenderMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="TenderMaster" value="true"/>		
                            			<li><a id="TenderMaster" onclick="return newTenderMaster('tenderMaster','0');" ><i class="fa fa-angle-double-right"></i>Tender Master</a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'TenderMaster' && TenderMaster == false}"> 		
                            			<li><a id="tenderMaster" onclick="return viewTenderMaster('tenderMaster','0');" ><i class="fa fa-angle-double-right"></i>Tender Master</a></li>
                            		</c:if>
                            </c:forEach>
							<%-- <li><a id="featuredProducts " onclick="return viewAssetMaster('assetMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="asset.master.label" /></a></li> --%>
							
						<c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
	                           </ul>
	                         </li>
                          </c:if>
                      </c:forEach>
                      <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
	                          <li id="master-details" style="cursor: pointer;"><a onclick="showOutletMasterFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="masters.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                            <ul id="ulMasterDetails" class="treeview-menu">
                          </c:if>
                      </c:forEach>
                           
                            <c:set var="skuMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == false}">
                            		<c:set var="skuMaster" value="true"/> 
                            		<li><a id="newSku" onclick="return newSku('newSku');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'SkuMaster' && skuMaster==false}"> 
                            		<li><a id="skumaster" onclick="return viewSkuMaster('skumaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                            
                             <c:set var="productGroupMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="productGroupMaster" value="true"/>
                            		<li><a id="productGroupMaster" onclick="return newProductGroupMaster('productGroupMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="product.group.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && productGroupMaster==false}"> 
                            		<li><a id="productGroupMaster" onclick="return viewProductGroupMaster('productGroupMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="product.group.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                             <c:set var="priceRangeMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="priceRangeMaster" value="true"/>
                            		<li><a id="priceRangeMaster" onclick="return newpriceRangeMaster('priceRangeMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.range.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && priceRangeMaster==false}"> 
                            		<li><a id="priceRangeMaster" onclick="return viewpriceRangeMaster('priceRangeMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.range.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            <c:set var="BomMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'BOMMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="BomMaster" value="true"/>
                            		<li><a id="BomMaster" onclick="return newBomMaster('priceRangeMaster');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bom.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'BOMMaster' && BomMaster==false}"> 
                            		<li><a id="BomMaster" onclick="return viewBomMaster('BomMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bom.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                            
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
	                            		<li id="liPriceManagement"><a onclick="showpricemgmtflows('outlet');"><i class="fa fa-angle-double-right"></i><spring:message code="price.management.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulPriceManagement" class="treeview-menu">
                            			</c:if>
                            		</c:forEach>
                            <c:set var="PriceUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}">
                            	<c:if test="${accessControl.appSubDocument == 'PriceUpdate' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="PriceUpdate" value="true"/>
                            		<li><a id="PriceUpdate" onclick="return newPriceUpdate('PriceUpdate');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.updating.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appSubDocument == 'PriceUpdate' && PriceUpdate==false}"> 
                            		<li><a id="PriceUpdate" onclick="return viewPriceUpdate('PriceUpdate','0','priceoutletLocation');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.updating.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                             <c:set var="BulkPriceUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}">
                            	<c:if test="${accessControl.appSubDocument == 'BulkPriceUpdate' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="BulkPriceUpdate" value="true"/>
                            		<li><a id="PriceUpdate" onclick="return newPriceUpdate('PriceUpdate');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bulkPrice.update.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appSubDocument == 'BulkPriceUpdate' && BulkPriceUpdate==false}"> 
                            		<li><a id="BulkPriceUpdate" onclick="return viewBulkPriceUpdate('BulkPriceUpdate','0','outletLocation');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bulkPrice.update.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
              <c:forEach var="accessControl" items="${sessionScope.priceManagement}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
		                  						</ul>
		                  					</li>     
                            			</c:if>
                            		</c:forEach>
               <c:set var="OutletStockUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'StockUpdate' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="OutletStockUpdate" value="true"/>
                            	<li><a id="newSku" onclick="return newSku('newSku');"><i class="fa fa-angle-double-right"></i><spring:message code="stock.update.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'StockUpdate' && OutletStockUpdate == false}"> 
                            		<li><a id="OutletStockUpdate" onclick="return viewOutletStockUpdateDetails('OutletStockUpdate','0','');"><i class="fa fa-angle-double-right"></i><spring:message code="stock.update.label" /></a></li>
                            	</c:if>
                            </c:forEach>
              
                            
                      <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
	                          </ul>
                        	</li>
                          </c:if>
                      </c:forEach>
                     
                     
					<c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
	                          <li id="warehousemaster-details" style="cursor: pointer;"><a onclick="showWarehouseMasterFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="warehouse.master.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                            <ul id="ulWarehouseMasterDetails" class="treeview-menu">
                          </c:if>
                      </c:forEach>
                      
                            
                             <c:set var="warehouseSkuMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="warehouseSkuMaster" value="true"/>
                            		<li><a id="warehousenewsku" onclick="return newWarehouseSku('warehousenewsku');"><i class="fa fa-angle-double-right"></i><spring:message code="sku.master.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && warehouseSkuMaster == false}"> 
                            		<li><a id="warehouseskumaster" onclick="return viewWarehouseSkuMaster('warehouseskumaster','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                              <c:set var="WarehouseStorageSystemsMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseStorageSystemsMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="WarehouseStorageSystemsMaster" value="true"/>
                            		<li><a id="warehousenewsku" onclick="return newWarehouseSku('warehousenewsku');"><i class="fa fa-angle-double-right"></i><spring:message code="storagesystemsmaster.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'WarehouseStorageSystemsMaster' && WarehouseStorageSystemsMaster == false}"> 
                            		<li><a id="WarehouseStorageSystemsMaster" onclick="return viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="storagesystemsmaster.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                              <c:set var="WarehouseFleetMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseFleetMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="WarehouseFleetMaster" value="true"/>
                            		<li><a id="warehousenewsku" onclick="return newWarehouseSku('warehousenewsku');"><i class="fa fa-angle-double-right"></i><spring:message code="fleetmaster.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'WarehouseFleetMaster' && WarehouseFleetMaster == false}"> 
                            		<li><a id="WarehouseFleetMaster" onclick="return viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="fleetmaster.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                             <c:set var="WarehouseBOMMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseBomMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="WarehouseBOMMaster" value="true"/>
                            		<li><a id="BomMasterWH" onclick="return newWHBomMaster('BomMasterWH');"><i class="fa fa-angle-double-right"></i><spring:message code="fleetmaster.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'WarehouseBomMaster' && WarehouseBOMMaster == false}"> 
                            	<li><a id="BomMasterWH" onclick="return viewBomMasterWarehouse('BomMasterWH','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bom.master.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                            
                            
                              <c:set var="warehouseLogisticsPartners" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseLogisticsPartners' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="WarehouseLogisticsPartners" value="true"/>
                            		<li><a id="warehousenewsku" onclick="return newWarehouseSku('warehousenewsku');"><i class="fa fa-angle-double-right"></i><spring:message code="logisticspartner.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'WarehouseLogisticsPartners' && warehouseLogisticsPartners == false}"> 
                            		<li><a id="WarehouseLogisticsPartners" onclick="return viewWarehouseLogisticsPartners('WarehouseLogisticsPartners','0','');"><i class="fa fa-angle-double-right"></i><spring:message code="logisticspartner.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                            
                                 <c:forEach var="accessControl" items="${sessionScope.priceManagement}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
	                            		<li id="liPriceManagement"><a onclick="showarehousemasterspricemgmtflows('warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="price.management.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulPriceManagement" class="treeview-menu">
                            			</c:if>
                            		</c:forEach>
                            <c:set var="PriceUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}">
                            	<c:if test="${accessControl.appSubDocument == 'PriceUpdate' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="PriceUpdate" value="true"/>
                            		<li><a id="PriceUpdate" onclick="return newPriceUpdate('PriceUpdate');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.updating.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appSubDocument == 'PriceUpdate' && PriceUpdate==false}"> 
                            		<li><a id="warehousePriceUpdate" onclick="return viewPriceUpdate('warehousePriceUpdate','0','warehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="price.updating.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                            <%--  <c:set var="BulkPriceUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}">
                            	<c:if test="${accessControl.appSubDocument == 'BulkPriceUpdate' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="BulkPriceUpdate" value="true"/>
                            		<li><a id="PriceUpdate" onclick="return newPriceUpdate('PriceUpdate');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bulkPrice.update.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appSubDocument == 'BulkPriceUpdate' && BulkPriceUpdate==false}"> 
                            		<li><a id="warehouseBulkPriceUpdate" onclick="return viewBulkPriceUpdate('warehouseBulkPriceUpdate','0','warehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="bulkPrice.update.label" /></a></li>
                            	</c:if>
                            </c:forEach> --%> 
                            
              <c:forEach var="accessControl" items="${sessionScope.priceManagement}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
		                  						</ul>
		                  					</li>     
                            			</c:if>
                            		</c:forEach>
                            
                            
                            
                            
                            
                             <c:set var="WarehouseStockUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseStockUpdate' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="WarehouseLogisticsPartners" value="true"/>
                            		<li><a id="warehousenewsku" onclick="return newWarehouseSku('warehousenewsku');"><i class="fa fa-angle-double-right"></i><spring:message code="stock.update.label" /></a></li>
                            	</c:if>
	                           	<c:if test="${accessControl.appDocument == 'WarehouseStockUpdate' && WarehouseStockUpdate == false}"> 
                            		<li><a id="WarehouseStockUpdate" onclick="return viewStockUpdateDetails('WarehouseStockUpdate','0','');"><i class="fa fa-angle-double-right"></i><spring:message code="stock.update.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                            
                            
                            
                    <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}" varStatus="theCount">
                         <c:if test="${theCount.count == 1 }">
                          			</ul>
		                       </li>
                          </c:if>
                      </c:forEach> 
                      <!-- master data end -->
                       <!-- Closing Master date li ui if any of the three masters are having permission -->
                        <c:if test="${mdmAdded == true || mdmAddedOutlet==true || mdmAddedOutletWHouse==true}"> 
                         </ul>
                  			</li>
                       </c:if> 
              				
						 <li class="treeview" id="storedetails" style="cursor: pointer;display: none;">
                            <a onclick="showOutletFlows()">
                                <i class="glyphicon "><img alt="" src="${pageContext.request.contextPath}/images/outlet1.png"></i>
                                <span><spring:message code="outlet.management.label" /></span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul id="ulstoredetails" class="treeview-menu">
                             <c:if test="${sessionScope.role == 'super admin'}"> 
                             	<li><a id="outletConfigurations" onclick="viewConfigurations('outletConfigurations','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="grocery_outlet_configurations.label" /></a> </li>
                             	<li><a id="menuConfigurations" onclick="return viewMenuConfigurations('menuConfigurations');">
										<i class="fa fa-angle-double-right"></i> <spring:message code="menu.label" /></a></li>
                             	<li><a id="counterMaster" onclick="return viewCounterMaster('counterMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="counter_master.label" /></a></li>
                             	<li><a id="taxation"  onclick="return viewStoreTaxation('taxation','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="taxation.label" /></a></li>
                             	<li><a id="daysOpen" onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu')" ><i class="fa fa-angle-double-right"></i> <spring:message code="day.open.label" /></a></li>
                            	<li><a id="daysClose" onclick="viewoutletdaysClose('daysClose','daysClose','0','menu');" ><i class="fa fa-angle-double-right"></i> <spring:message code="day.close.label" /></a></li>
                             </c:if>
                            <c:set var="outletConfig" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="outletConfig" value="true"/>
                          				<li><a id="newOutlet" onclick="return newOutlet('newOutlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="grocery_outlet_configurations.label" /></a> </li>
                          			</c:if>
	                            	<c:if test="${accessControl.appDocument == 'Configuration' && outletConfig == false}"> 
                          				<li><a id="outletConfigurations" onclick="viewConfigurations('outletConfigurations','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="grocery_outlet_configurations.label" /></a> </li>
                          			</c:if>
                          	</c:forEach>
                          <%-- 	<li><a id="menuConfigurations" onclick="return viewMenuConfigurations('menuConfigurations');">
							<i class="fa fa-angle-double-right"></i> <spring:message code="menu.label" /></a></li> --%>
                           <c:set var="viewcounthome" value='0'></c:set>
                           <c:set var="outletEvent" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appSubflow == 'Event' && outletEvent == false}"> 
                          			
                          			 <c:set var="viewcounthome" value='${viewcounthome+1}'></c:set>
	                          <c:if test="${viewcounthome == 1}">
                          				<li><a id="outletEvents" onclick="viewEventsManagement('outletEvents','0')"><i class="fa fa-angle-double-right"></i> Event Management</a> </li>
                          			</c:if>
                          			</c:if>
                          	</c:forEach>
                          
                          
                          <c:set var="menuConfigurations" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'MenuConfigurations' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="menuConfigurations" value="true"/>
                            			<li><a id="newCounter" onclick="return viewNewCounter('newCounter');" ><i class="fa fa-angle-double-right"></i> <spring:message code="menu.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'MenuConfigurations' && menuConfigurations == false}"> 
                             		<li><a id="menuConfigurations" onclick="return viewMenuConfigurations('menuConfigurations');">
										<i class="fa fa-angle-double-right"></i> <spring:message code="menu.label" /></a></li>
                             		</c:if>
                             </c:forEach> 
                          
                          	<c:set var="counterMaster" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            	
                            		<c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="counterMaster" value="true"/>
                            			<li><a id="newCounter" onclick="return viewNewCounter('newCounter');" ><i class="fa fa-angle-double-right"></i> <spring:message code="counter_master.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CounterMaster' && counterMaster == false}"> 
                             			<li><a id="counterMaster" onclick="return viewCounterMaster('counterMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="counter_master.label" /></a></li>
                             		</c:if>
                             </c:forEach>
                             <c:set var="storeTaxation" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'Taxation' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="storeTaxation" value="true"/>
                            			<li><a id="taxation"  onclick="return newStoreTax('taxation');"><i class="fa fa-angle-double-right"></i> <spring:message code="taxation.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'Taxation' && storeTaxation == false}"> 
                             			<li><a id="taxation"  onclick="return viewStoreTaxation('taxation','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="taxation.label" /></a></li>
                             		</c:if>
                             </c:forEach>
                             <input type="hidden" id="restaruntlicensetest" value="${sessionScope.restaruntLicense}">
                           <c:if test="${sessionScope.restaruntLicense == true}"> 
                           <c:if test="${sessionScope.role == 'super admin'}">
                             <li id="liRestaurantManagement" ><a id="RestaurantManagement">
                            		<i class="fa fa-angle-double-right"></i> <spring:message code="restaurentManagement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                            		<!-- <ul id="ulRestaurantManagement" class="treeview-menu menu-open" style="display: block;"> -->
                            			<ul id="ulRestaurantManagement" class="treeview-menu">
                               				<li ><a id=restaurantBookingDetails onclick="viewRestaurantBookings('restaurantBookingDetails');"><i class="fa fa-angle-double-right"></i> <spring:message code="bookings.label" /></a> </li>
			                            	<li ><a id="takeAway" onclick="return viewRestaurantTakeAways('takeAway');"><i class="fa fa-angle-double-right"></i> <spring:message code="restaurant.takeaway.label" /></a> </li>
			                            	<li ><a id="rawMaterialStocks" onclick="return viewOutletRawMaterialStocks('rawMaterialStocks');"><i class="fa fa-angle-double-right"></i> <spring:message code="restaurant.rawmaterial.label" /></a> </li>
                  					</ul>
                  					</li>
                  					</c:if>
                  	
                  	 <!--added by manasa  -->
                  	<c:set var="restauranrManagementAdded" value="false"/> 					
		            <c:forEach var="accessControl" items="${sessionScope.restaurantManagement}" varStatus="theCount">
       					<c:if test="${theCount.count == 1}">
       						<li id="liRestaurantManagement" style="cursor: pointer;display: none;"><a onclick=""><i class="fa fa-angle-double-right"></i><span><spring:message code="restaurentManagement.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		                  		<ul id="ulRestaurantManagement" class="treeview-menu">
		                  		<c:set var="restauranrManagementAdded" value="true"/> 		
       					</c:if>
       				</c:forEach>    
       				<c:forEach var="accessControl" items="${sessionScope.restaurantManagement}">
            			<c:if test="${accessControl.appDocument == 'RestaurentManagementBookings'}"> 
   							<li><a id="restaurantBookingDetails" onclick="return viewRestaurantBookings('restaurantBookingDetails');"><i class="fa fa-angle-double-right"></i> <spring:message code="bookings.label" /></a></li>
   						</c:if>
     				</c:forEach> 
     				 
     				<c:forEach var="accessControl" items="${sessionScope.restaurantManagement}">
            			<c:if test="${accessControl.appDocument == 'RestaurentManagementTakeaway'}"> 
   						 <li><a id="takeAway" onclick="viewRestaurantTakeAways('takeAway');" ><i class="fa fa-angle-double-right"></i> <spring:message code="restaurant.takeaway.label" /></a></li>
   						</c:if>
     				</c:forEach>  
     				 					
	              <c:if test="${restauranrManagementAdded == true}">
      					</ul>
	             	</li>  
      			  </c:if>
                  	
                  	</c:if>
                  	
                  <%-- 	
                  	<c:forEach var="accessControl" items="${sessionScope.restaurantManagement}" varStatus="theCount">
                       	<c:if test="${accessControl.appDocument == 'RestaurantManagement' && restaurantManagement == 'false'}">
                         <c:if test="${theCount.count == 1}">
	                          <li id="liRestaurantManagement" style="cursor: pointer;"><a onclick=""><i class="fa fa-angle-double-right"></i><span><spring:message code="restaurentManagement.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                            <ul id="ulRestaurantManagement" class="treeview-menu">
                          </c:if>
                         
                      </c:forEach>
                      
	                       <c:forEach var="accessControl" items="${sessionScope.restaurantManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">
                  					 <li id="liRestaurantManagement" style=""><a onclick=""><i class="fa fa-angle-double-right"></i><span><spring:message code="restaurentManagement.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulRestaurantManagement" class="treeview-menu">
	                  			</c:if>		
	                  			 </c:forEach>	
	                  			 
	                  			 
	                  			 
	                  			 <!--added by manasa  -->
	                  			 		 <li id="liRestaurantManagement" style=""><a onclick=""><i class="fa fa-angle-double-right"></i><span><spring:message code="restaurentManagement.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulRestaurantManagement" class="treeview-menu">
	                  				<c:forEach var="accessControl" items="${sessionScope.restaurantManagement}">
	                                   	<c:if test="${accessControl.appDocument == 'RestaurentManagementBookings' && accessControl.write == true && accessControl.read == false}">
	                                  	<li><a id="restaurantBookingDetails" onclick="return viewRestaurantBookings('restaurantBookingDetails');"><i class="fa fa-angle-double-right"></i> <spring:message code="bookings.label" /></a></li>
	                                     </c:if>
	                                </c:forEach> 
		                            		 <c:forEach var="accessControl" items="${sessionScope.restaurantManagement}">
	                            <c:if test="${accessControl.appDocument == 'RestaurentManagementTakeaway' && accessControl.write == true && accessControl.read == false}">
	                            <li><a id="takeAway" onclick="viewRestaurantTakeAways('takeAway');" ><i class="fa fa-angle-double-right"></i> <spring:message code="restaurant.takeaway.label" /></a></li>
	                              </c:if>
	                            </c:forEach>
		                            <c:forEach var="accessControl" items="${sessionScope.restaurantManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">		
		                          </ul>
		                        </li>
	                        </c:if>
	                      </c:forEach>	 --%>	
                  					
                  					
                  					
                  					
                  					
                  					
	                            <c:if test="${sessionScope.role == 'super admin'}">
	                            
	                             <li id="liShiftManagement" style=""><a onclick="showShiftManagementFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="shift.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                             	<ul id="ulShiftManagement" class="treeview-menu">
	                             		<li><a id="shiftMaster" onclick="return viewShiftMaster('shiftMaster','0','');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                             		 <li><a id="shiftConfiguration" onclick="viewShiftAllocationMaster('shiftConfiguration','0')" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
	                             	</ul>
	                             </li>
	                            </c:if>
	                       <c:forEach var="accessControl" items="${sessionScope.shiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">
	                           <li id="liShiftManagement" style=""><a onclick="showShiftManagementFlows('outlet')"><i class="fa fa-angle-double-right"></i><span><spring:message code="shift.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                             <ul id="ulShiftManagement" class="treeview-menu">
	                         </c:if>
	                      </c:forEach>
	                            
 				            	<c:set var="shiftMaster" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
	                            	<c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true && accessControl.read == false}"> 
	                            		<c:set var="shiftMaster" value="true"/>
	                            		<li><a id="newShift" onclick="return viewNewShift('newShift');"><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ShiftMaster' && shiftMaster == false}"> 		
	                           			<li><a id="outletshiftMaster" onclick="return viewShiftMaster('outletshiftMaster','0','','outlet');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                           		</c:if>
	                            </c:forEach> 
	                            		
	                            <c:set var="shiftConfiguration" value="false"/>
	                             <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
	                             	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true && accessControl.read == false}"> 
	                            		<c:set var="shiftConfiguration" value="true"/>
	                            		<li><a id="newShiftAllocation" onclick="return newShiftAllocation('newShiftAllocation');"><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && shiftConfiguration == false}"> 		
                            			<li><a id="outletshiftConfiguration" onclick="viewShiftAllocationMaster('outletshiftConfiguration','0','outlet')" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
                            		 </c:if>
	                            </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.shiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">		
		                          </ul>
		                        </li>
	                        </c:if>
	                      </c:forEach>

	                      
	                      <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}" varStatus="theCount">
                         <c:if test="${theCount.count == 1}">
	                          <li id="liOutletMonitoring" style="cursor: pointer;"><a onclick="showoutletmonitoringflows('outlet')"><i class="fa fa-angle-double-right"></i><span><spring:message code="outletmonitoring.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                            <ul id="uloutletMonitoring" class="treeview-menu">
                          </c:if>
                      </c:forEach>
                      
                            
                             <c:set var="OutletMonitoringVedio" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                            	<%-- <c:if test="${accessControl.appDocument == 'OutletVedioStatus' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="OutletMonitoringVedio" value="true"/>
                            		<li><a id="warehousenewsku" onclick="return newWarehouseSku('warehousenewsku');"><i class="fa fa-angle-double-right"></i><spring:message code="outletsVedio.label" /></a></li>
                            	</c:if> --%>
<%--                               <li id="liOutletMonitoring" style="cursor: pointer;"><a onclick="viewoutletMonitoring('liOutletMonitoring','0');"><i class="fa fa-angle-double-right"></i><span><spring:message code="outletmonitoring.label" /></span><i class="fa fa-angle-left pull-right"></i></a> --%>
	                           	<c:if test="${accessControl.appDocument == 'OutletVedioStatus' && OutletMonitoringVedio == false}"> 
                            			<li><a id="OutletMonitoringVedio" onclick="return viewoutletVedeioMonitoring('OutletMonitoringVedio','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outletsVedio.label" /></a></li>
                            	</c:if>
                            	
                            	<c:if test="${accessControl.appDocument == 'OutletTracking' && OutletMonitoringVedio == false}"> 
                            		 <li id="liOutletMonitoring" style="cursor: pointer;"><a id="OutletMonitoring" onclick="viewoutletMonitoring('OutletMonitoring','0');"><i class="fa fa-angle-double-right"></i><span><spring:message code="outlet.tracking.label" /></span></a> 
                            	</c:if>
                            	
                            	<c:if test="${accessControl.appDocument == 'OutletMonitoringUserLog' && OutletMonitoringVedio == false}"> 
                            		 <li id="liOutletMonitoringUserLog" style="cursor: pointer;"><a id="OutletMonitoringUserLog" onclick="viewoutletUserLog('OutletMonitoringUserLog','0');"><i class="fa fa-angle-double-right"></i><span><spring:message code="usagelog.label" /></span></a> 
                            	</c:if>
                            		<%-- <c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'UserLog'}"> 
	                             	<li ><a id="OutletMonitoringUserLog" onClick="viewoutletUserLog('OutletMonitoringUserLog','0');"><i class="fa fa-angle-double-right"></i><spring:message code="usagelog.label" /></a></li>
	                          </c:if>
					 	</c:forEach>  --%>
                            	
                            		<c:if test="${accessControl.appDocument == 'OutletSynchStatusMonitoring' && OutletMonitoringVedio == false}"> 
                            		 <li id="liOutletNewSynchStatus" style="cursor: pointer;"><a id="OutletNewSynchStatus" onclick="viewoutletNewSynchStatus('OutletNewSynchStatus','0');"><i class="fa fa-angle-double-right"></i><span><spring:message code="outletSynchStatus.label" /></span></a> 
                            	</c:if>
                            	
                            </c:forEach>
	                      
	                      <c:set var="OutletSynchStatus" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                            	<%-- <c:if test="${accessControl.appDocument == 'OutletSynchStatus' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="OutletSynchStatus" value="true"/>
                            		<li><a id="outletMonitoring" onclick="return viewNewoutletMonitoring('outletMonitoring');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outletSynchStatus.label" /></a></li>
                            	</c:if> --%>
	                           	<c:if test="${accessControl.appDocument == 'OutletSynchStatus' && OutletSynchStatus == false}"> 
                            		<%-- 	<li><a id="outletSynchStatus" onclick="return viewoutletSynchStatus('outletSynchStatus','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outletSynchStatus.label" /></a></li> --%>
                            	     	<li><a id="outletSynchStatus" onclick="return viewoutletSynchStatus('outletSynchStatus','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.log.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">		
		                          </ul>
		                        </li>
	                        </c:if>
	                      </c:forEach>
	                        <%-- <c:set var="outletMonitoring" value="false"/> 
                             <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'OutletMonitoring' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="outletMonitoring" value="true"/>
                            			<li><a id="outletMonitoring" onclick="return viewNewoutletMonitoring('outletMonitoring');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outletmonitoring.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'OutletMonitoring' && outletMonitoring == false}"> 
                             			<li><a id="outletMonitoring" onclick="return viewoutletMonitoring('outletMonitoring','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outletmonitoring.label" /></a></li>
                             		</c:if>
                             </c:forEach> --%>
                              <c:set var="daysOpen" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'DaysOpen' && accessControl.write == true && accessControl.read == false}">
	                            		<c:set var="daysOpen" value="true"/> 
	                  					<li><a id="daysOpen" onclick="newOutletNotification('daysOpen');" ><i class="fa fa-angle-double-right"></i> <spring:message code="day.open.label" /></a></li>
	                  				</c:if>
	                  			</c:forEach>
                  				<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'DaysOpen' && daysOpen == false}"> 
	                  					<li><a id="daysOpen" onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu')" ><i class="fa fa-angle-double-right"></i> <spring:message code="day.open.label" /></a></li>
	                  				</c:if>
	                  			</c:forEach>
	                  			     <c:set var="daysClose" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'DaysClose' && accessControl.write == true && accessControl.read == false}">
	                            		<c:set var="daysClose" value="true"/> 
	                  					<li><a id="daysClose" onclick="newOutletNotification('daysClose');" ><i class="fa fa-angle-double-right"></i> <spring:message code="day.close.label" /></a></li>
	                  				</c:if>
	                  			</c:forEach>
                  				<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'DaysClose' && daysClose == false}"> 
	                  					<li><a id="daysClose" onclick="viewoutletdaysClose('daysClose','daysClose','0','menu');" ><i class="fa fa-angle-double-right"></i> <spring:message code="day.close.label" /></a></li>
	                  				</c:if>
	                  			</c:forEach>   
	                        <c:if test="${sessionScope.role == 'super admin'}">
                           		<li id="liBills"><a onclick="showBillsFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="billing.payment.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulBills" class="treeview-menu">
                    					<li><a id="outletBilling" onclick="viewBills('outletBilling','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="all.bills.label" /> <spring:message code="bills.label" /></a></li>
                    					<li><a id="creditBills" onclick="viewBills('creditBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="credit.label" /> </a></li>
                    					<li><a id="pendingBills" onclick="viewBills('pendingBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="pending.bills.label" /></a></li>
                    					<li><a id="cancelledBills" onclick="viewBills('cancelledBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="cancelled.bills.label" /></a></li>
                    					<li><a id="ReturnedBills" onclick="viewBills('ReturnedBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="returned.bills.label" /></a></li>
                    					<li><a id="exchengedBills" onclick="viewBills('exchengedBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="exchange.bills.label" /></a></li>
                    					<li><a id="completedBills" onclick="viewBills('completedBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="completed.bills.label" /></a></li>
                    					<li><a id="homeDeliveryBills" onclick="viewBills('homeDeliveryBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="home.delivery.bills.label" /></a></li>
<%--                     					<li><a id="homeDeliveryBills" onclick="viewBills('homeDeliveryBills','0','menu')"><i class="fa fa-angle-double-right"></i><spring:message code="home.delivery.bills.label" /></a></li> --%>
	                 				</ul>
                				</li>
                				<li id="liOrders" style="display: none"><a onclick="showOutletOrdersFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="orders.label" /> - Fulfillment<i class="fa fa-angle-left pull-right"></i></a>
                 					<ul id="ulOrders" class="treeview-menu">
                           				<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
							       						<li><a id="${accessControl.appDocumentActivity}OutletOrderManagement" onclick="return viewOrders('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}OutletOrderManagement','0','','outlet','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
							     				</c:forEach> 		</ul>
                 				</li>
                  				
                           	</c:if>
                          	 <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'BillingAndPayments' && accessControl.read == true}"> 
		                            	<li id="liBills"><a onclick="showBillsFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="billing.payment.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulBills" class="treeview-menu">
		                    					<li><a id="outletBilling" onclick="viewBills('outletBilling','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="all.bills.label" /> <spring:message code="bills.label" /></a></li>
		                    					<li><a id="openBills" onclick="viewBills('openBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="credit.label" /></a></li>
		                    					<li><a id="pendingBills" onclick="viewBills('pendingBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="pending.bills.label" /></a></li>
		                    					<li><a id="cancelledBills" onclick="viewBills('cancelledBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="cancelled.bills.label" /></a></li>
		                    					<li><a id="ReturnedBills" onclick="viewBills('ReturnedBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="returned.bills.label" /></a></li>
		                    					<li><a id="voidBills" onclick="viewBills('voidBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="all.void.bills.label" /></a></li>
		                    					<li><a id="exchengedBills" onclick="viewBills('exchengedBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="exchange.bills.label" /></a></li>
		                    					<li><a id="completedBills" onclick="viewBills('completedBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="completed.bills.label" /></a></li>
		                    					<li><a id="homeDeliveryBills" onclick="viewBills('homeDeliveryBills','0','menu','')"><i class="fa fa-angle-double-right"></i><spring:message code="home.delivery.bills.label" /></a></li>
		                    					
		                    					<li><a id="mcnBills" onclick="viewMCNBills('mcnBills','0','menu','false','')"><i class="fa fa-angle-double-right"></i><spring:message code="mcn.label" /></a></li>
			                 				</ul>
		                				</li>
		                			</c:if>
		                	</c:forEach>
		                	<c:set var="outletCustOrders" value="false"/>
		                	 <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
		                	 		<c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == false && outletCustOrders == false}">
		                	 			<c:set var="outletCustOrders" value="true"/> 
		                            	<li><a id="newOutletOrder" onclick="return viewNewOrder('newOutletOrder','','outlet');"><i class="fa fa-angle-double-right"></i><spring:message code="customer.label" /> <spring:message code="orders.label" /></a>
		                            	</li>
		                            </c:if>
	                            	<c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.read == true && outletCustOrders==false}"> 
		                            	<%-- <li id="liOrders"><a onclick="showOutletOrdersFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="customer.label" /> <spring:message code="orders.label" /><i class="fa fa-angle-left pull-right"></i></a> --%>
		                            	<li id="liOrders" style="display: none;"><a onclick="showOutletOrdersFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="orders.label" /> - Fulfillment<i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulOrders" class="treeview-menu">
		                  						<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
							       						<li><a id="${accessControl.appDocumentActivity}OutletOrderManagement" onclick="viewOrders('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}OutletOrderManagement','0','','outlet','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
							     				</c:forEach> 
		                  					</ul>
		                  				</li>  
		                  			</c:if>
		                  	</c:forEach>
		                  	
		              <%-- <c:set var="outletShipmentAdded" value="false"/> 			
	                 <c:forEach var="accessControl" items="${sessionScope.outletShipment}" varStatus="theCount">
                  		<c:if test="${accessControl.appDocument == 'outletShipment' && accessControl.read == false && accessControl.write == true && outletShipmentAdded == false}"> 
       							<li><a id="newOutletShipmentManagement" onclick="return viewNewShipment('newOutletShipmentManagement','outlet');"><i class="fa fa-angle-double-right"></i><spring:message code="deliveries.label" /></a>
		                  		<c:set var="outletShipmentAdded" value="true"/> 
       					</c:if>
	       				<c:if test="${outletShipmentAdded == 'false'}">
	       					<c:set var="outletShipmentFlowAdded" value="false"/> 		
		       				<c:forEach var="accessControl" items="${sessionScope.outletShipment}" varStatus="theCount">
	                  			<c:if test="${accessControl.appDocument == 'outletShipment' && accessControl.read == true && outletShipmentFlowAdded == false}">
	                  				<c:set var="outletShipmentFlowAdded" value="true"/>
			       					<li id="liShipments"><a onclick="showOutletShipmentsFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="deliveries.label" /><i class="fa fa-angle-left pull-right"></i></a>
					                  <ul id="ulShipments" class="treeview-menu">
			       				</c:if>
			       			</c:forEach>
			       			<c:if test="${outletShipmentFlowAdded == 'true'}">
			       				<c:forEach var="accessControl" items="${sessionScope.outletShipmentActivity}">
			       						<li><a id="${accessControl.appDocumentActivity}OutletShipmentManagement" onclick="viewOutletShipments('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}OutletShipmentManagement','0','','outlet','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
			     				</c:forEach>
			     			  </ul>
			     			</li>
			     			</c:if>
		     			</c:if>
		            </c:forEach> --%>    	
		                  	
                            <c:set var="outletGoodsTransfer" value="false"/>
                            	<li id="liInventoryManagement" style="display: none;"><a onclick="showInventoryManagementFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="inventory.management.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulInventoryManagement" class="treeview-menu">
                  					<c:if test="${sessionScope.role == 'super admin'}"> 
                  						<li id="liOutletStocks"><a onclick="showOutletStocksFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="stocks.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulOutletStocks" class="treeview-menu">
		                               			<li><a id="OutletDailyStockTracker" onclick="viewDailyStockTracker('OutletDailyStockTracker','0','outlet','menu');"><i class="fa fa-angle-double-right"></i>Stock History</a> </li>    
		                               			<li><a id="NormalStock" onclick="viewOutletStocks('NormalStock','Normal','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="availablestock.label" /></a> </li>    
		                            			<li><a id="OrderedStock" onclick="viewOutletStocks('OrderedStock','Ordered','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="orderedstock.label" /></a> </li>
		                            			<li><a id="CriticalStock" onclick="viewOutletStocks('CriticalStock','Critical','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="criticalstock.label" /></a> </li>
		                            			<li><a id="BlockedStock" onclick="viewOutletStocks('BlockedStock','Blocked','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="blockedstock.label" /></a> </li>    
		                            			<li><a id="ReturnedStock" onclick="viewOutletStocks('ReturnedStock','Returned','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="returnedstock.label" /></a> </li>
		                            			<li><a id="BoneyardStock" onclick="viewOutletStocks('BoneyardStock','Boneyard','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="boneyard.label" /></a> </li>
		                  					<li><a id="DayWiseStockHistory" onclick="viewOutletStocks('DayWiseStockHistory','DayWiseHistory','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="day.wise.stock.history.label" /></a> </li>
                            		
		                  					</ul>
		                  				</li>
		                  				<li id="liGoodsTransfer"><a onclick="showOutletGoodsTransferFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="goods.transfer.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulGoodsTransfer" class="treeview-menu">
		                               			<li><a id="stockReceipt" onclick="viewAllStockReceipts('stockReceipt','all','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goodsreceipts.label" /></a> </li>    
		                            			<li><a id="stockIssue" onclick="viewAllStockIssues('stockIssue','all','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goodsindent.label" /></a> </li>
												<li><a id="outletStockRequest" onclick="viewStockRequest('outletStockRequest','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.stock.request.label" /></a> </li>
		                            			<li><a id="outletGoodsReturn" onclick="viewGoodsReturn('outletGoodsReturn','0','','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goods.return.label" /></a> </li>    
		                  					</ul>
		                  				</li>  
		                  				<li><a id="outletMaterialConsumption" onclick="viewMaterialConsumption('outletMaterialConsumption','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="material.consumption.label" /></a> </li>   
                  						<li><a id="outletstockMovement" onclick="viewoutletstockMovement('outletstockMovement','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="stockmovement.label" /></a> </li>
                  						<li><a id="outletSuppliersMovement" onclick="viewoutletSuppliersMovement('outletSuppliersMovement','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="suppliers.movements.label" /></a> </li>
                  						<li><a id="outletStockVerification" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.label" /></a> </li>
                  					</c:if>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.outletStocks}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
	                            		<li id="liOutletStocks"><a onclick="showOutletStocksFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="stocks.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulOutletStocks" class="treeview-menu">
                            			</c:if>
                            		</c:forEach>
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletAvailableStock' && accessControl.read == true}"> 
		                               			<li><a id="OutletDailyStockTracker" onclick="viewDailyStockTracker('OutletDailyStockTracker','0','outlet','menu');"><i class="fa fa-angle-double-right"></i>Stock History</a> </li>    
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletAvailableStock' && accessControl.read == true}"> 
		                               			<li><a id="NormalStock" onclick="viewOutletStocks('NormalStock','Normal','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="availablestock.label" /></a> </li>    
                            			</c:if>
                            		</c:forEach>
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletDayWiseStock' && accessControl.read == true}"> 
		                            			<li><a id="DayWiseStock" onclick="viewOutletStocks('DayWiseStock','DayWise','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="day.wise.stock.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                            	  <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletDayWiseStockHistory' && accessControl.read == true}"> 
		                            	  <li><a id="DayWiseHistoryStock" onclick="viewOutletStocksHistory('DayWiseHistoryStock','DayWiseHistory','0','outlet','menu');"><i class="fa fa-angle-double-right"></i>Day Wise Stock History</a> </li>
                            			</c:if>
                            		</c:forEach>  
                            		
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletOrderedStock' && accessControl.read == true}"> 
		                            			<li><a id="OrderedStock" onclick="viewOutletStocks('OrderedStock','Ordered','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="orderedstock.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletCriticalStock' && accessControl.read == true}"> 
		                            			<li><a id="CriticalStock" onclick="viewOutletStocks('CriticalStock','Critical','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="criticalstock.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletBlockedStock' && accessControl.read == true}"> 
		                            			<li><a id="BlockedStock" onclick="viewOutletStocks('BlockedStock','Blocked','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="blockedstock.label" /></a> </li>    
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletReturnedStock' && accessControl.read == true}"> 
		                            			<li><a id="ReturnedStock" onclick="viewOutletStocks('ReturnedStock','Returned','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="returnedstock.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletBoneyardStock' && accessControl.read == true}"> 
		                            			<li><a id="BoneyardStock" onclick="viewOutletStocks('BoneyardStock','Boneyard','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="boneyard.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStocks}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
		                  						</ul>
		                  					</li>     
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}" varStatus="theCount">
                            			<c:if test="${theCount.count == 1}">
                            				<li id="liGoodsTransfer"><a onclick="showOutletGoodsTransferFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="goods.transfer.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  						<ul id="ulGoodsTransfer" class="treeview-menu">
                            			</c:if>
                            		</c:forEach>
                            				
                            				
                            				<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            					<c:if test="${accessControl.appSubDocument == 'OutletStockRequest' && accessControl.read == true}"> 
														<li><a id="outletStockRequestIn" onclick="viewStockRequest('outletStockRequestIn','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.stock.request.label" /> - In</a> </li>
													</c:if>
											</c:forEach>
											<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            					<c:if test="${accessControl.appSubDocument == 'OutletStockRequestout' && accessControl.read == true}"> 
														<li><a id="outletStockRequestOut" onclick="viewStockRequest('outletStockRequestOut','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.stock.request.label" /> - Out</a> </li>
													</c:if>
											</c:forEach>
                            				
                            				
                            				
                            			
		                               		<c:set var="outletStockIssue" value="false"/> 
		                               		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            				<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && accessControl.write == true && accessControl.read == false}"> 
		                            				<c:set var="outletStockIssue" value="true"/> 
		                            				<li><a id="stockIssue" onclick="newStockIssueView('stockIssue','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goodsindent.label" /></a> </li>
		                            			</c:if>
		                            		</c:forEach>  
		                               		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            				<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && accessControl.read == true && outletStockIssue == 'false'}"> 
		                            				<li><a id="stockIssue" onclick="viewAllStockIssues('stockIssue','all','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goodsindent.label" /></a> </li>
		                            			</c:if>
		                            		</c:forEach>
		                            		
		                            			<c:set var="StockReceipt" value="false"/> 
                            				<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            				<c:if test="${accessControl.appSubDocument == 'StockReceipt' && accessControl.write == true && accessControl.read == false}"> 
	                            					<c:set var="StockReceipt" value="true"/> 
		                               				<li><a id="stockReceipt" onclick="newStockReceiptView('stockReceipt','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goodsreceipts.label" /></a> </li>
		                               			</c:if>
		                               		</c:forEach>    
		                               		
		                  					<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            				<c:if test="${accessControl.appSubDocument == 'StockReceipt' && accessControl.read == true && StockReceipt == 'false'}"> 
		                               				<li><a id="stockReceipt" onclick="viewAllStockReceipts('stockReceipt','all','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goodsreceipts.label" /></a> </li>
		                               			</c:if>
		                               		</c:forEach>  
		                            		<%-- <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            					<c:if test="${accessControl.appSubDocument == 'OutletStockRequest' && accessControl.read == true}"> 
														<li><a id="outletStockRequest" onclick="viewStockRequest('outletStockRequest','0','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.stock.request.label" /></a> </li>
													</c:if>
											</c:forEach> --%>
											<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                            					<c:if test="${accessControl.appSubDocument == 'OutletStockReturn' && accessControl.read == true}"> 
			                            				<li><a id="outletGoodsReturn" onclick="viewGoodsReturn('outletGoodsReturn','0','','outlet');"><i class="fa fa-angle-double-right"></i> <spring:message code="goods.return.label" /></a> </li>    
													</c:if>
											</c:forEach>
		                  			<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}" varStatus="theCount">
                            			<c:if test="${theCount.count == 1}">
	                            				</ul>
	                            			</li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletMaterialConsumption}">
	                            		<c:if test="${accessControl.appDocument == 'OutletMaterialConsumption' && accessControl.read == true}"> 
                            				<li><a id="outletMaterialConsumption" onclick="viewMaterialConsumption('outletMaterialConsumption','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="material.consumption.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStockMovement}">
	                            		<c:if test="${accessControl.appDocument == 'OutletStockMovement' && accessControl.read == true}"> 
                            				<li><a id="outletstockMovement" onclick="viewoutletstockMovement('outletstockMovement','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="stockmovement.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletSuppliersMovements}">
	                            		<c:if test="${accessControl.appDocument == 'OutletSuppliersMovements' && accessControl.read == true}"> 
                            				<li><a id="outletSuppliersMovement" onclick="viewoutletSuppliersMovement('outletSuppliersMovement','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="suppliers.movements.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletKeyValueProducts}">
	                            		<c:if test="${accessControl.appDocument == 'OutletKeyValueProducts' && accessControl.read == true}"> 
                            				<li><a id="outletKeyValueProducts" onclick="viewoutletKeyValue('outletKeyValueProducts','0');"><i class="fa fa-angle-double-right"></i>Key Value</a> </li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		<%-- <c:forEach var="accessControl" items="${sessionScope.InventoryManagement}">
	                            		<c:if test="${accessControl.appDocument == 'OutletKeyValue' && accessControl.read == true}"> 
                            				<li><a id="outletKeyValue" onclick="viewoutletKeyValue('outletKeyValue','0');"><i class="fa fa-angle-double-right"></i>Key Value</a> </li>
                            			</c:if>
                            		</c:forEach> --%>
                            		
                            		<%-- <c:set var="OutletKeyValue" value="false"/>			
                             	<c:forEach var="accessControl" items="${sessionScope.InventoryManagement}">
                             		<c:if test="${accessControl.appDocument == 'B2BPartners' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="stateMaster" value="true"/>  		
                            			<li><a id="newstate" onclick="return viewstatecode('newstate');" ><i class="fa fa-angle-double-right"></i>B2B Partners</a></li>
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'OutletKeyValue' && OutletKeyValue == false}">
                            		<li><a id="outletKeyValue" onclick="viewoutletKeyValue('outletKeyValue','0');"><i class="fa fa-angle-double-right"></i>Key Value</a> </li>
                            		</c:if>
                             	</c:forEach> --%>
                            		
                            		<%--  <c:set var="B2BPartners" value="false"/>			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'B2BPartners' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="stateMaster" value="true"/>  		
                            			<li><a id="newstate" onclick="return viewstatecode('newstate');" ><i class="fa fa-angle-double-right"></i>B2B Partners</a></li>
                            		</c:if>
                            		<c:if test="${accessControl.appDocument == 'B2BPartners' && B2BPartners == false}">
                            		<li><a id=b2bPartners onclick="return viewb2bPartners('b2bPartners','0');" ><i class="fa fa-angle-double-right"></i>B2B Partners</a></li>
                            		</c:if>
                             </c:forEach>	 --%>
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}" varStatus="theCount">
                            			<c:if test="${theCount.count == 1}">
                            				<li id="liOutletStockVerifications"><a onclick="ShowStockVerificationflows();"><i class="fa fa-angle-double-right"></i><spring:message code="stock.verification.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  						<ul id="ulOutletStockVerifications" class="treeview-menu">
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                               		<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletStockVerification' && accessControl.read == true}"> 
                            				<li><a id="outletStockVerification" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');"><i class="fa fa-angle-double-right"></i> <spring:message code="verficationMasters.label" /></a> </li>
                            				
                            				<%-- <li><a id="outletStockVerificationReport" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.report.label" /></a> </li> --%>
                            				
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                            		<c:if test="${accessControl.appSubDocument == 'StoreStockVerification' && accessControl.read == true}"> 
                            				<li><a id="outletStockVerificationReport" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> Verifications</a> </li>
                            				
                            				<%-- <li><a id="outletStockVerificationReport" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.report.label" /></a> </li> --%>
                            				
                            			</c:if>
                            		</c:forEach>
                            		
                            		<%--  <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                            		<c:if test="${accessControl.appSubDocument == 'OutletVerficationStocks' && accessControl.read == true}"> 
                            				<li><a id="outletStockVerificationUpload" onclick="viewStockVerificationUpload('outletStockVerificationUpload','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i>Stock Upload</a> </li>
                            			
                            			</c:if>
                            		</c:forEach>  --%>
                            		<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                            		<c:if test="${accessControl.appSubDocument == 'StoreStockVerificationPosting' && accessControl.read == true}"> 
                            				<li><a id="outletStockUploading" onclick="viewOutletStockUploading('outletStockUploading','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i>Stock Posting</a> </li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}" varStatus="theCount">
                            			<c:if test="${theCount.count == 1}">
	                            				</ul>
	                            			</li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                            			<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                            		<c:if test="${accessControl.appDocument == 'OutletStockVerification' && accessControl.read == true}"> 
                            				<li><a id="outletStockVerification" onclick="viewWarehouseStockVerification('outlettStockVerification','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.plan.label" /></a> </li>
                            				
                            				<%-- <li><a id="outletStockVerificationReport" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.report.label" /></a> </li> --%>
                            				
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                            		<c:forEach var="accessControl" items="${sessionScope.storeStockVerification}">
	                            		<c:if test="${accessControl.appDocument == 'StoreStockVerification' && accessControl.read == true}"> 
                            				<li><a id="outletStockVerificationReport" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.report.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                            		<%--  <c:forEach var="accessControl" items="${sessionScope.outletKeyValue}">
	                            		<c:if test="${accessControl.appDocument == 'outletKeyValue' && accessControl.read == true}"> 
                            				<li><a id="outletKeyValue" onclick="viewoutletKeyValue('outletKeyValue','0');"><i class="fa fa-angle-double-right"></i> Key Value Products</a> </li>
                            			</c:if>
                            		</c:forEach>  --%>
                            		
                            	
                             
                             
                  				<%-- <c:if test="${sessionScope.role == 'super admin'}"> 
                  					<li class="treeview" id="liOutletHealth" style="cursor: pointer;"><a id="outletHealth" onclick="showOutletHealthFlows();" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.health.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  						<ul id="ulOutletHealth" class="treeview-menu">
		                            		<li><a id="avgInventory" onclick="viewAverageInventory('avgInventory')"><i class="fa fa-angle-double-right"></i> <spring:message code="avg.inventory.label" /></a> </li>
		                            		<li><a id="CustomerWalkIns" onclick="viewCustomerWalkIns('CustomerWalkIns')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.walkins.label" /></a> </li>
		                            		<li><a id="CustomerConversion" onclick="viewCustomerConversion('CustomerConversion')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.conversion.label" /></a> </li>
		                            		<li><a id="BillingAverages" onclick="viewBillingAverages('BillingAverages')"><i class="fa fa-angle-double-right"></i> <spring:message code="billing.avg.label" /></a> </li>
		                            		<li><a id="HealthSales" onclick="viewHealthSales('HealthSales')"><i class="fa fa-angle-double-right"></i> <spring:message code="health.sales.label" /></a> </li>
		                            	</ul>
                  					</li>
                  					<li><a id="outletNotifications" onclick="viewOutletNotifications('outletNotifications','0')" ><i class="fa fa-angle-double-right"></i> <spring:message code="notifications.label" /></a></li>
                  				</c:if> --%>
                  				
                  				<c:if test="${sessionScope.role == 'super admin'}"> 
                  					<%--  <li class="treeview" id="liOutletHealth" style="cursor: pointer;"><a id="outletHealth" onclick="showOutletHealthFlows();" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.health.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  						<ul id="ulOutletHealth" class="treeview-menu">  --%>
                  						
                  						 <li id="liOutletHealth"><a onclick="showOutletHealthFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="outlet.health.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  		         <ul id="ulOutletHealth" class="treeview-menu"> 
                  						
		                            		<li><a id="avgInventory" onclick="viewAverageInventory('avgInventory')"><i class="fa fa-angle-double-right"></i> <spring:message code="avg.inventory.label" /></a> </li>
		                            		<li><a id="CustomerWalkIns" onclick="viewCustomerWalkIns('CustomerWalkIns')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.walkins.label" /></a> </li>
		                            		<li><a id="CustomerConversion" onclick="viewCustomerConversion('CustomerConversion')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.conversion.label" /></a> </li>
		                            		<li><a id="BillingAverages" onclick="viewBillingAverages('BillingAverages')"><i class="fa fa-angle-double-right"></i> <spring:message code="billing.avg.label" /></a> </li>
		                            		<li><a id="HealthSales" onclick="viewHealthSales('HealthSales')"><i class="fa fa-angle-double-right"></i> <spring:message code="health.sales.label" /></a> </li>
		                            	</ul></li>
                  					
                  					<li><a id="outletNotifications" onclick="viewOutletNotifications('outletNotifications','0')" ><i class="fa fa-angle-double-right"></i> <spring:message code="notifications.label" /></a></li>
                  				</c:if> 
                  				
                            	<%-- <c:forEach var="outletHealth" items="${sessionScope.outletHealth}" varStatus="theCount">
                            	<c:if test="${theCount.count == 1}">
                            			<li class="treeview" id="liOutletHealth" style="cursor: pointer;"><a id="outletHealth" onclick="showOutletHealthFlows();" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.health.label" /><i class="fa fa-angle-left pull-right"></i></a>
	                  						<ul id="ulOutletHealth" class="treeview-menu">
	                  			</c:if>	
	                  			</c:forEach> --%>	
	                  			
	                  			<c:forEach var="outletHealth" items="${sessionScope.outletHealth}" varStatus="theCount">
                            	<c:if test="${theCount.count == 1}"> 
                            			<%-- <li class="treeview" id="liOutletHealth" style="cursor: pointer;"><a id="outletHealth" onclick="showOutletHealthFlows();" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet.health.label" /><i class="fa fa-angle-left pull-right"></i></a>
	                  		 --%>		
	                  		 
	                  		 	<li id="liOutletHealth"><a onclick="showOutletHealthFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="outlet.health.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  		<ul id="ulOutletHealth" class="treeview-menu">
	                  			</c:if>	
	                  			</c:forEach>
	                  			
	                  				
	                  						<c:forEach var="accessControl" items="${sessionScope.outletHealth}">
	                  							<c:if test="${accessControl.appDocument == 'AverageInventory' && accessControl.read == true}">
			                            		<li><a id="avgInventory" onclick="viewAverageInventory('avgInventory')"><i class="fa fa-angle-double-right"></i> <spring:message code="avg.inventory.label" /></a> </li>
			                            	</c:if></c:forEach>
			                            	<c:forEach var="accessControl" items="${sessionScope.outletHealth}">
			                            	<c:if test="${accessControl.appDocument == 'CustomerWalkIns' && accessControl.read == true}">
			                            	<li><a id="CustomerWalkIns" onclick="viewCustomerWalkIns('CustomerWalkIns')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.walkins.label" /></a> </li>
		                            		</c:if>
		                            		</c:forEach>
		                            		<c:forEach var="accessControl" items="${sessionScope.outletHealth}">
		                            		<c:if test="${accessControl.appDocument == 'CustomerConversion' && accessControl.read == true}">
		                            		<li><a id="CustomerConversion" onclick="viewCustomerConversion('CustomerConversion')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.conversion.label" /></a> </li>
		                            		</c:if></c:forEach>
		                            		<c:forEach var="accessControl" items="${sessionScope.outletHealth}">
		                            		<c:if test="${accessControl.appDocument == 'BillingAverages' && accessControl.read == true}">
		                            		<li><a id="BillingAverages" onclick="viewBillingAverages('BillingAverages')"><i class="fa fa-angle-double-right"></i> <spring:message code="billing.avg.label" /></a> </li>
		                            		</c:if></c:forEach>
		                            		<c:forEach var="accessControl" items="${sessionScope.outletHealth}">
		                            		<c:if test="${accessControl.appDocument == 'HealthSales' && accessControl.read == true}">
		                            		<li><a id="HealthSales" onclick="viewHealthSales('HealthSales')"><i class="fa fa-angle-double-right"></i> <spring:message code="health.sales.label" /></a> </li>
		                            		</c:if></c:forEach>
		                            		
		                            <c:forEach var="outletHealth" items="${sessionScope.outletHealth}" varStatus="theCount">		
		                            <c:if test="${theCount.count == 1}">	
			                            	</ul>
	                  					</li>
	                  				</c:if>
                            		</c:forEach>
	                            
	                           
	                           <c:set var="outletNotifications" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'OutletNotifications' && accessControl.write == true && accessControl.read == false}">
	                            		<c:set var="outletNotifications" value="true"/> 
	                  					<li><a id="outletNotifications" onclick="newOutletNotification('outletNotifications');" ><i class="fa fa-angle-double-right"></i> <spring:message code="notifications.label" /></a></li>
	                  				</c:if>
	                  			</c:forEach>
                  				<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'OutletNotifications' && outletNotifications == false}"> 
	                  					<li><a id="outletNotifications" onclick="viewOutletNotifications('outletNotifications','0')" ><i class="fa fa-angle-double-right"></i> <spring:message code="notifications.label" /></a></li>
	                  				</c:if>
	                  			</c:forEach>
	                  			</ul>
                  				</li>
                          </ul>
                        </li>
                        <input type="hidden" id="warehouelicensedata" value="${sessionScope.warehouseLicense}">
                        <c:if test="${sessionScope.warehouseLicense == true}">
                        <li class="treeview" id="warehouseDetails" style="cursor: pointer;display: none;"> <a onclick="showWarehouseFlows('warehouseDetails')"> <i class="fa fa-home"></i> <span><spring:message code="warehouse.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            <ul id="ulwarehouseDetails" class="treeview-menu">
                            <c:if test="${sessionScope.role == 'super admin'}">
                                  <li ><a id="WarehouseConfigurations" onclick="getWareHouses('WarehouseConfigurations','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="configurations.label" /></a></li>
                            
                            	<li ><a id="WarehousePOSs" onclick="getWareHousespos('WarehousePOSs','0')"><i class="fa fa-angle-double-right"></i>Warehouse POS</a></li>
                          <li><a id="menuConfigurationsWH" onclick="return viewMenuConfigurations('menuConfigurationsWH','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="menu.label" /></a></li>
                           <li ><a id="WhcounterMaster" onclick="return viewWhCounterMaster('WhcounterMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="operation.counters.label" /></a></li>
                            <li><a id="Whtaxation"  onclick="return viewWarehouseTaxation('Whtaxation','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="taxation.label" /></a></li>
                            
                            </c:if>
                             <c:set var="warehouseConfig" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true && accessControl.read == false}"> 
                            		 <c:set var="warehouseConfig" value="true"/>
                            			<li ><a id="newWarehouseConfig" onclick="return newWarehouse('newWarehouseConfig');"><i class="fa fa-angle-double-right"></i> <spring:message code="configurations.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && warehouseConfig == false}"> 
                            			<li ><a id="WarehouseConfigurations" onclick="getWareHouses('WarehouseConfigurations','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="configurations.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                            <c:set var="warehousepos" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WarehousePOS' && accessControl.write == true && accessControl.read == false}"> 
                            		 <c:set var="warehousepos" value="true"/>
                            			<li ><a id="newWarehousePOS" onclick="return newWarehouse('newWarehousePOS');"><i class="fa fa-angle-double-right"></i> <spring:message code="configurations.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehousePOS' && warehousepos == false}"> 
                            			<li ><a id="WarehousePOSs" onclick="getWareHousespos('WarehousePOSs','0')"><i class="fa fa-angle-double-right"></i>Warehouse POS</a></li>
                            		</c:if>
                            </c:forEach>
                            
                             <c:set var="warehouseMenu" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		
	                            	<c:if test="${accessControl.appDocument == 'WarehouseMenu' && warehouseMenu == false}"> 
                          <li><a id="menuConfigurationsWH" onclick="return viewMenuConfigurationsWH('menuConfigurationsWH');"><i class="fa fa-angle-double-right"></i> <spring:message code="menu.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                            
                            
                            
                            	<c:set var="WhcounterMaster" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WhCounterMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="WhcounterMaster" value="true"/>
                            			<li><a id="WhnewCounter" onclick="return viewNewCounter('WhnewCounter');" ><i class="fa fa-angle-double-right"></i> <spring:message code="operation.counters.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WhCounterMaster' && WhcounterMaster == false}"> 
                             			<li><a id="WhcounterMaster" onclick="return viewWhCounterMaster('WhcounterMaster','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="operation.counters.label" /></a></li>
                             		</c:if>
                             </c:forEach>
                             
                             <c:set var="whTaxation" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WhTaxation' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="whTaxation" value="true"/>
                                  <li><a id="Whtaxation"  onclick="return viewWarehouseTaxation('Whtaxation','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="taxation.label" /></a></li>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WhTaxation' && whTaxation == false}"> 
                                      	<li><a id="Whtaxation"  onclick="return viewWarehouseTaxation('Whtaxation','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="taxation.label" /></a></li>
                             		</c:if>
                             </c:forEach>
                             
                             
                             
                             
                             
                    
<c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}" varStatus="theCount">
<%-- 	                        <c:out value="fdgdf"/> --%>
	                         <c:if test="${theCount.count == 1}">
	                           <li id="liWarehouseShiftManagement" style=""><a onclick="showShiftManagementFlows('warehouse')"><i class="fa fa-angle-double-right"></i><span><spring:message code="shift.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                             <ul id="ulWarehouseShiftManagement" class="treeview-menu">
	                         </c:if>
	                      </c:forEach>
	                              <c:set var="warehouseshiftMaster" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true && accessControl.read == false}"> 
	                            		<c:set var="warehouseshiftMaster" value="true"/>
	                            		<li><a id="newShift" onclick="return viewNewShift('newShift');"><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && warehouseshiftMaster == false}"> 		
	                           			<li><a id="warehouseshiftMaster" onclick="return viewShiftMaster('warehouseshiftMaster','0','','warehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                           		</c:if>
	                            </c:forEach> 		
	                            <c:set var="warehouseshiftAllocation" value="false"/>
	                             <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
	                             	<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true && accessControl.read == false}"> 
	                            		<c:set var="warehouseshiftAllocation" value="true"/>
	                            		<li><a id="newShiftAllocation" onclick="return newShiftAllocation('newShiftAllocation');"><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && warehouseshiftAllocation == false}"> 		
                            			<li><a id="warehouseshiftConfiguration" onclick="viewShiftAllocationMaster('warehouseshiftConfiguration','0','warehouse')" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
                            		 </c:if>
	                            </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">		
		                          </ul>
		                        </li>
	                        </c:if>
	                      </c:forEach>
	                      
                 
                 
                 
                             
           						<c:if test="${sessionScope.role == 'super admin'}">
           						<li id="liStockManagement" style="display: none;"><a onclick="showWarehouseStockManagementFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="stockmanagement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulStockManagement" class="treeview-menu">
                  							
                  							<li id="liwarehouseStorageStocks"><a onclick="showWarehouseStocksVerificationflow();"><i class="fa fa-angle-double-right"></i>Storage<i class="fa fa-angle-left pull-right"></i></a>
			                  					<ul id="ulwarehouseStocks" class="treeview-menu">
			                               			<li><a id="warehouseNormalStock" onclick="viewOutletStocks('warehouseNormalStock','Normal','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="availablestock.label" /></a> </li>    
			                  					</ul>
		                  					</li>
                  							
                  							
                  							
                  							
                  							<li id="liwarehouseStocks"><a onclick="showWarehouseStocksFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="stocks.label" /><i class="fa fa-angle-left pull-right"></i></a>
			                  					<ul id="ulwarehouseStocks" class="treeview-menu">
			                  						<li><a id="DemandForeCast" onclick="viewHomePageDeals('DemandForeCast');"><i class="fa fa-angle-double-right"></i> <spring:message code="demandforecast.label" /></a> </li>
			                               			<li><a id="WHDailyStockTracker" onclick="viewDailyStockTracker('WHDailyStockTracker','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i>Stock History</a> </li>
			                               			<li><a id="warehouseNormalStock" onclick="viewOutletStocks('warehouseNormalStock','Normal','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="availablestock.label" /></a> </li>    
			                            			<li><a id="warehouseOrderedStock" onclick="viewOutletStocks('warehouseOrderedStock','Ordered','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="orderedstock.label" /></a> </li>
			                            			<li><a id="warehouseCriticalStock" onclick="viewOutletStocks('warehouseCriticalStock','Critical','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="criticalstock.label" /></a> </li>
			                            			<li><a id="warehouseBlockedStock" onclick="viewOutletStocks('warehouseBlockedStock','Blocked','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="blockedstock.label" /></a> </li>    
			                            			<li><a id="warehouseReturnedStock" onclick="viewOutletStocks('warehouseReturnedStock','Returned','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="returnedstock.label" /></a> </li>
			                            			<li><a id="warehouseBoneyardStock" onclick="viewOutletStocks('warehouseBoneyardStock','Boneyard','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="boneyard.label" /></a> </li>
			                  					</ul>
		                  					</li>
	                  			 
	                  			 
	                  			 
	                  			 
	                  		<%-- 	  <c:if test="${sessionScope.role == 'super admin'}">
	                            
	                             <li id="liShiftManagement" style=""><a onclick="showShiftManagementFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="shift.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                             	<ul id="ulShiftManagement" class="treeview-menu">
	                             		<li><a id="shiftMaster" onclick="return viewShiftMaster('shiftMaster','0','');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                             		 <li><a id="shiftConfiguration" onclick="viewShiftAllocationMaster('shiftConfiguration','0')" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
	                             	</ul>
	                             </li>
	                            </c:if>
	                       <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">
	                           <li id="liShiftManagement" style=""><a onclick="showShiftManagementFlows()"><i class="fa fa-angle-double-right"></i><span><spring:message code="shift.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                             <ul id="ulShiftManagement" class="treeview-menu">
	                         </c:if>
	                      </c:forEach>
	                              <c:set var="warehouseshiftMaster" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true && accessControl.read == false}"> 
	                            		<c:set var="shiftMaster" value="true"/>
	                            		<li><a id="newShift" onclick="return viewNewShift('newShift');"><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && warehouseshiftMaster == false}"> 		
	                           			<li><a id="shiftMaster" onclick="return viewShiftMaster('shiftMaster','0','');" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.master.label" /></a></li>
	                           		</c:if>
	                            </c:forEach> 		
	                            <c:set var="warehouseshiftAllocation" value="false"/>
	                             <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
	                             	<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true && accessControl.read == false}"> 
	                            		<c:set var="shiftAllocation" value="true"/>
	                            		<li><a id="newShiftAllocation" onclick="return newShiftAllocation('newShiftAllocation');"><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && warehouseshiftAllocation == false}"> 		
                            			<li><a id="shiftConfiguration" onclick="viewShiftAllocationMaster('shiftConfiguration','0')" ><i class="fa fa-angle-double-right"></i> <spring:message code="shift.configuration.label" /></a></li>
                            		 </c:if>
	                            </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">		
		                          </ul>
		                        </li>
	                        </c:if>
	                      </c:forEach>
	                       --%>
	                  			 
	                  			 
	                  			 
	                  			 <li id="liWarehouseProcurementShipment"  ><a onclick="showWarehouseProcurementShipmentsFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="procurement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  							<ul id="ulWarehouseProcurementShipment" class="treeview-menu">
	                  							<li><a id="warehouserequestForQuotation" onclick="viewRequestForQuotation('rqstForQutation','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="rqst.for.quotation.label" /></a></li>
				                            	<li><a id="outletPurchaseOrder" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="purchase.order.label" /></a></li>
				                            	
				                            </ul>
				                         </li>
	                  			 
	                  			 
			                           
			                           <li id="liShipment" style=""><a onclick="showWarehouseProcurementFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="procurement.shipment.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulShipment" class="treeview-menu">
			                            	<li><a id="wshipmentNote" onclick="viewShipmentNotes('wshipmentNote','0','menu','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentnote.label" /></a> </li>
			                            	<li><a id="wshipmentInspection" onclick="viewShipmentInspection('wshipmentInspection');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentinspection.label" /></a> </li>
			                            	<li><a id="warehouseStockReciept" onclick="viewShipmentReceipts('all','warehouseStockReciept','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="goods.receipts.label" /></a> </li>
			                            	<li><a id="wshipmentRejection" onclick="viewShipmentRejection('wshipmentRejection');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentrejection.label" /></a> </li>
											<li><a id="wShipmentReturn" onclick="viewShipmentReturn('wShipmentReturn','0','menu','warehouse','clear');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.return.label" /></a> </li>
                  					</ul>
                  				</li>
			                    
			                    
			                    
			                   
			                    
			                    
			                          <li id="liWarehouseGoodsTransfer" style=" "><a onclick="showWarehouseGoodsTrasferFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.stocktransfer.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulWarehouseGoodsTransfer" class="treeview-menu">
			                            	<li><a id="wstockRequest" onclick="viewStockRequest('wstockRequest','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockrequests.label" /></a> </li>
			                      			<li><a id="wstockIssue" onclick="viewAllStockIssues('wstockIssue','all','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockissue.label" /></a> </li>
			                            	<li><a id="wstockReturn" onclick="viewGoodsReturn('wstockReturn','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockreturn.label" /></a> </li>
                  					</ul>
                  				</li>
			                          
			                          
			                      <li><a id="warehouseProcessingAndpackaging" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.pacakeandprocessing.label" /></a> </li>      
			                   	<li><a id="warehouseStockVerification" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.label" /></a> </li>  
			                                 
			                          
			                          
			                          
			                            </ul>
                  					</li>
			                    </c:if>
			                    <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}" varStatus="theCount">
			                    	<c:if test="${theCount.count == 1}">
			                    		 <li id="liStockManagement" style="display: none;"><a onclick="showWarehouseStockManagementFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="stockmanagement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  							<ul id="ulStockManagement" class="treeview-menu">
			                    	</c:if>
			                    </c:forEach>
			                    
			                    
			                    
			                     <c:set var="warehouseStorageStock" value="false"/>
			                      <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                           			<c:if test="${accessControl.appDocument == 'WarehouseStorageStocks' && warehouseStorageStock == 'false'}"> 
                          				<li id="liwarehouseStorageStocks"><a onclick="showWarehouseStorageFlow();"><i class="fa fa-angle-double-right"></i>Storage<i class="fa fa-angle-left pull-right"></i></a>
		                  				  <ul id="ulwarehouseStorageStocks" class="treeview-menu">
		                  					<c:set var="warehouseStorageStock" value="true"/>
		                  			</c:if>
		                  		</c:forEach>
		                  		
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseStorageAvailableStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseStorageNormalStock" onclick="viewWarehouseStorageStocks('warehouseStorageNormalStock','Normal','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="availablestock.label" /></a> </li>
			                        </c:if>
				                </c:forEach>
				                
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseStorageUnprocessed' && accessControl.read == true}"> 
			                             <li><a id="warehouseStorageUnprocessed" onclick=""><i class="fa fa-angle-double-right"></i> Unprocessed</a> </li>
			                        </c:if>
				                </c:forEach>
				                
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseStoragePickList' && accessControl.read == true}"> 
			                             <li><a id="warehouseStoragePickList" onclick="viewWarehouseStoragePickList('warehouseStoragePickList','pickList','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> Picklist</a> </li>
			                        </c:if>
				                </c:forEach>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseStorageBoneyard' && accessControl.read == true}"> 
			                             <li><a id="warehouseStorageBoneyard" onclick=""><i class="fa fa-angle-double-right"></i> Boneyard</a> </li>
			                        </c:if>
				                </c:forEach>
				               
		                  		<c:if test="${warehouseStorageStock == 'true'}"> 
                         				</ul>
                         				</li>
	                  			</c:if>	
			                    
			                      <c:set var="warehouseStock" value="false"/>
			                      <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                           			<c:if test="${accessControl.appDocument == 'WarehouseStocks' && warehouseStock == 'false'}"> 
                          				<li id="liwarehouseStocks"><a onclick="showWarehouseStocksFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="stocks.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  				  <ul id="ulwarehouseStocks" class="treeview-menu">
		                  					<c:set var="warehouseStock" value="true"/>
		                  			</c:if>
		                  		</c:forEach>
		                  		<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseDemandForecast' && accessControl.read == true}"> 
			                             <li><a id="DemandForeCast" onclick="viewHomePageDeals('DemandForeCast');"><i class="fa fa-angle-double-right"></i> <spring:message code="demandforecast.label" /></a> </li>
			                        </c:if>
				                </c:forEach>
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseDemandForecast' && accessControl.read == true}"> 
				                		<li><a id="WHDailyStockTracker" onclick="viewDailyStockTracker('WHDailyStockTracker','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i>Stock History</a> </li>
			                        </c:if>
				                </c:forEach>
				                
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseAvailableStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseNormalStock" onclick="viewOutletStocks('warehouseNormalStock','Normal','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="availablestock.label" /></a> </li>
			                        </c:if>
				                </c:forEach>
				                
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseDayWiseStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseDayWiseStock" onclick="viewOutletStocksHistory('warehouseDayWiseStock','DayWiseHistory','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> Day wise Stock </a> </li>
			                        </c:if>
				                </c:forEach>
				                
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseOrderedStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseOrderedStock" onclick="viewOutletStocks('warehouseOrderedStock','Ordered','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="orderedstock.label" /></a> </li>
			                        </c:if>
				                </c:forEach>	
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseCriticalStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseCriticalStock" onclick="viewOutletStocks('warehouseCriticalStock','Critical','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="criticalstock.label" /></a> </li>
			                        </c:if>
				                </c:forEach>
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseBlockedStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseBlockedStock" onclick="viewOutletStocks('warehouseBlockedStock','Blocked','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="blockedstock.label" /></a> </li>
			                        </c:if>
				                </c:forEach>
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseReturnedStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseReturnedStock" onclick="viewOutletStocks('warehouseReturnedStock','Returned','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="returnedstock.label" /></a> </li>
			                        </c:if>
				                </c:forEach>	
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                           		<c:if test="${accessControl.appSubDocument == 'WarehouseBoneyardStock' && accessControl.read == true}"> 
			                             <li><a id="warehouseBoneyardStock" onclick="viewOutletStocks('warehouseBoneyardStock','Boneyard','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="boneyard.label" /></a> </li>
			                        </c:if>
				                </c:forEach>		
		                  		<c:if test="${warehouseStock == 'true'}"> 
                         				</ul>
                         				</li>
	                  			</c:if>	
	                  			<c:set var="warehouseprocessandpackage" value="false"/>
	                  		<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                      					<c:if test="${accessControl.appDocument == 'WarehousePackaging' && accessControl.read == true}"> 
                        				<c:set var="warehouseprocessandpackage" value="true"/>
                        				<li><a id="warehouseProcessingAndpackaging" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.pacakeandprocessing.label" /></a> </li>  
                        				</c:if>
                        				
                        		</c:forEach>	
                        		<c:if test="${warehouseprocessandpackage == 'true'}"> 
                         				
                         				</li>
	                  			</c:if>	
	                  			
	                  			<c:set var="warehouseStockverificationsFlow" value="false"/>
	                  		<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                      			<c:if test="${accessControl.appDocument == 'WarehouseStockVerifications' && warehouseStockverificationsFlow == 'false'}"> 
                            				<li id="liWarehouseStockVerifications"><a onclick="showWarehouseStocksVerificationflow()"><i class="fa fa-angle-double-right"></i><spring:message code="stock.verification.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  						<ul id="ulWarehouseStockVerifications" class="treeview-menu">
		                  						<c:set var="warehouseStockverificationsFlow" value="true"/>
                            			</c:if>
                            		</c:forEach>
                            		
                            		
                               		<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                      					<c:if test="${accessControl.appSubDocument == 'WarehouseStockVerification' && accessControl.read == true}"> 
                        					<li><a id="warehouseStockVerification" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');"><i class="fa fa-angle-double-right"></i><spring:message code="verficationMasters.label" /></a> </li>
                        				</c:if>
                        				
                        		</c:forEach>
                            		
                            		 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            		<c:if test="${accessControl.appSubDocument == 'WarehouseVerficationStocks' && accessControl.read == true}"> 
                            				<li><a id="warehouseStockVerificationReport" onclick="viewWarehouseStockVerification('warehouseStockVerificationReport','0','warehouse','menu','','');"><i class="fa fa-angle-double-right"></i>Verifications</a> </li>
                            				
<%--                             				<li><a id="outletStockVerificationReport" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.report.label" /></a> </li>
 --%>                            				
                            			</c:if>
                            		</c:forEach> 
                            		
                            		   <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            		<c:if test="${accessControl.appSubDocument == 'WarehouseStocksUpload' && accessControl.read == true}"> 
                            				<li><a id="warehouseStockUploading" onclick="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');"><i class="fa fa-angle-double-right"></i>Stock Uploading</a> </li>
                            			</c:if>
                            		</c:forEach>  
                            		
                            		
                            			<c:if test="${warehouseStockverificationsFlow == 'true'}">
	                            				</ul>
	                            			</li>
                            			</c:if>
                            	
	                  			
                        		
                        		
                            		
	                  	
                  			<!-- 	<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}" varStatus="theCount">
			                    	<c:if test="${theCount.count == 1}">
			                    		 </ul>
			                    		 </li>
			                    	</c:if>
			                    </c:forEach> -->
	                  		
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	 <c:set var="warehouseProcurementShipments" value="false"/>
			                     <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                           			<c:if test="${accessControl.appDocument == 'WarehouseProcurementShipment' && warehouseProcurementShipments == 'false'}"> 
                          				<li id="liWarehouseProcurementShipment"  style=""><a onclick="showWarehouseProcurementShipmentsFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="procurement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  							<ul id="ulWarehouseProcurementShipment" class="treeview-menu">
		                  					<c:set var="warehouseProcurementShipments" value="true"/>
		                  			</c:if>
		                  		</c:forEach>
	                  		
	                  	
	              
	                  	
	                  	
	                  	
	                  	<c:set var="warehouserequestForQuotation" value="false"/>
                  					 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                  							<c:if test="${accessControl.appSubDocument == 'WarehouseRequestForQuotation' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="warehouserequestForQuotation" value="true"/> 
                    							<li><a id="newOutletPurchaseOrder" onclick="return newRFQ();"><i class="fa fa-angle-double-right"></i><spring:message code="rqst.for.quotation.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseRequestForQuotation' && warehouserequestForQuotation == false}"> 
                    							<li><a id="warehouserequestForQuotation" onclick="viewRequestForQuotation('warehouserequestForQuotation','0');"><i class="fa fa-angle-double-right"></i><spring:message code="rqst.for.quotation.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
			                     	<c:set var="warehousequtation" value="false"/>
                  					<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                  							<c:if test="${accessControl.appSubDocument == 'WarehouseQuotation' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="warehousequtation" value="true"/> 
                    							<li><a id="warehousequtation" onclick="return vewNewPurchaseOrder('newOutletPurchaseOrder');"><i class="fa fa-angle-double-right"></i><spring:message code="qutation.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseQuotation' && warehousequtation == false}"> 
                    							<li><a id="WarehouseQutation" onclick="viewqutation('warehouse','WarehouseQutation','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="qutation.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                  					<c:set var="purchaseOrder" value="false"/>
                  					 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                  							<c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="purchaseOrder" value="true"/> 
                    							<li><a id="newwarehousePurchaseOrder" onclick="return vewNewPurchaseOrder('newwarehousePurchaseOrder');"><i class="fa fa-angle-double-right"></i><spring:message code="purchase.order.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && purchaseOrder == false}"> 
                    							<li><a id="warehousePurchaseOrder" onclick="viewPurchaseOrder('warehouse','warehousePurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="purchase.order.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
	                  	
	                  	 <c:if test="${warehouseProcurementShipments == 'true'}"> 
                         				</ul>
                         				</li>
	                  			</c:if>	
	                  	
	                  	
	                  	
	                  			
		                   
		                   <c:set var="warehouseProcurement" value="false"/>
			                      <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                           			<c:if test="${accessControl.appDocument == 'WarehouseProcurement' && warehouseProcurement == 'false'}"> 
                          				<li id="liShipment" style=""><a onclick="showWarehouseProcurementFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="supplier.shippments.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  				<ul id="ulShipment" class="treeview-menu">
		                  					<c:set var="warehouseProcurement" value="true"/>
		                  			</c:if>
		                  		</c:forEach>
	                  			
				       			
				       	
				       			
                     			
				           
		                   <c:set var="warehouseShipmentNote" value="false"/>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentNotes' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="warehouseShipmentNote" value="true"/>
                          			<li><a id="wshipmentNote" onclick="newShipmentNote('wshipmentNote','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentnote.label" /></a> </li>
                          		</c:if> 
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentNotes' && warehouseShipmentNote == false}">
                          			<li><a id="wshipmentNote" onclick="viewShipmentNotes('wshipmentNote','0','menu','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentnote.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>
	                       <c:set var="wshipmentInspection" value="false"/>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseInspectionReceipt' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wshipmentInspection" value="true"/>
                          			<li><a id="wshipmentInspection" onclick="viewShipmentInspection('wshipmentInspection');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentinspection.label" /></a> </li>
                          		</c:if> 
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseInspectionReceipt' && wshipmentInspection == false}">
                          			<li><a id="wshipmentInspection" onclick="viewShipmentInspection('wshipmentInspection');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentinspection.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>
	                        <c:set var="warehouseStockReciept" value="false"/>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="warehouseStockReciept" value="true"/>
                          			<li><a id="warehouseStockReciept" onclick="viewNewShipmentReceipt('warehouseStockReciept','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentinspection.label" /></a> </li>
                          		</c:if>                          	
                          			<c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && warehouseStockReciept == false}">
                          			<li><a id="warehouseStockReciept" onclick="viewShipmentReceipts('all','warehouseStockReciept','0','warehouse','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="goods.receipts.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>
	                       <c:set var="wshipmentRejection" value="false"/>
				                <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentRejection' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wshipmentRejection" value="true"/>
                          			<li><a id="wshipmentRejection" onclick="viewShipmentRejection('wshipmentRejection');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentrejection.label" /></a> </li>
                          		</c:if> 
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentRejection' && wshipmentRejection == false}">
                          			<li><a id="wshipmentRejection" onclick="viewShipmentRejection('wshipmentRejection');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentrejection.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>
	                       <c:set var="wStockReturn" value="false"/>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wStockReturn" value="true"/>
                          			<li><a id="wShipmentReturn" onclick="newShipmentReturn('wShipmentReturn','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.return.label" /></a> </li>
                          		
                          		</c:if>
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && wStockReturn == false}">
                          			<li><a id="wShipmentReturn" onclick="viewShipmentReturn('wShipmentReturn','0','menu','warehouse','clear');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.return.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>   		
											  <c:set var="wStockIssue" value="false"/>
				                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentInvoice' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wStockIssue" value="true"/>
                          			<li><a id="wShipmentInvoice" onclick="viewShipmentInvoice('wShipmentInvoice','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="invoice.label" /></a> </li>
                          		</c:if>
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentInvoice' && wStockReturn == false}">
                          			<li><a id="wShipmentInvoice" onclick="viewShipmentInvoice('wShipmentInvoice','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="invoice.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>   	
				              <c:if test="${warehouseProcurement == 'true'}"> 
                         				</ul>
                         				</li>
	                  			</c:if>	
		                 
	                  			
	                  		   <c:set var="warehouseGoodsTransfer" value="false"/>
			                     <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                           			<c:if test="${accessControl.appDocument == 'WarehouseGoodsTransfer' && warehouseGoodsTransfer == 'false'}"> 
                          				<li id="liWarehouseGoodsTransfer" style=" "><a onclick="showWarehouseGoodsTrasferFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.stocktransfer.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  						<ul id="ulWarehouseGoodsTransfer" class="treeview-menu">
		                  					<c:set var="warehouseGoodsTransfer" value="true"/>
		                  			</c:if>
		                  		</c:forEach>
	                  		

			                   
                      <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">         		
                            <c:if test="${accessControl.appSubDocument == 'StockRequest' && accessControl.read == true}">
                          			<li><a id="wstockRequestIn" onclick="viewStockRequest('wstockRequestIn','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockrequests.label" /> - In</a> </li>
                          		</c:if>
	                       </c:forEach>
			                   
                         <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">         		
                            <c:if test="${accessControl.appSubDocument == 'StockRequestOut' && accessControl.read == true}">
                          			<li><a id="wstockRequestOut" onclick="viewStockRequest('wstockRequestOut','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockrequests.label" /> - Out</a> </li>
                          		</c:if>
	                       </c:forEach> 
	                       <c:set var="wstockIssue" value="false"/>
                         <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">		             
                               		<c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wstockIssue" value="true"/>
                          			<li><a id="wstockIssue" onclick="newStockIssueView('wstockIssue','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockissue.label" /></a> </li>
                          		</c:if>
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.read == true && wstockIssue == false}">
                          			<li><a id="wstockIssue" onclick="viewAllStockIssues('wstockIssue','all','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockissue.label" /></a> </li>
                          		</c:if>
	                       </c:forEach> 
	                       <c:set var="wstockReceipt" value="false"/>
                         <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">		             
                               		<c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wstockReceipt" value="true"/>
                          			<li><a id="wstockReceipt" onclick="newStockReceiptView('wstockReceipt','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockreceipts.label" /></a> </li>
                          		</c:if>
                          		<c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.read == true && wstockIssue == false}">
                          			<li><a id="wstockReceipt" onclick="viewAllStockReceipts('wstockReceipt','all','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockreceipts.label" /></a> </li>
                          		</c:if>
	                       </c:forEach> 
	                      <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseStockReturn' && accessControl.read == true}">
                          			<li><a id="wstockReturn" onclick="viewGoodsReturn('wstockReturn','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.stockreturn.label" /></a> </li>
                          		</c:if>
	                       </c:forEach> 
			                    	 <c:if test="${warehouseGoodsTransfer == 'true'}"> 
                         				</ul>
                         				</li>
	                  			</c:if>	
			                   
	                  	
	                  	
	                  		
	                  		  
	                  	
	                  	<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}" varStatus="theCount">
			                    	<c:if test="${theCount.count == 1}">
			                    		 </ul>
			                    		 </li>
			                    	</c:if>
			                    </c:forEach>
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	  <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseBillingAndPayments' && accessControl.read == true}"> 
			                    	<li id="liBillsWareHouse"><a onclick="showBillsFlowsWareHouse()"><i class="fa fa-angle-double-right"></i><spring:message code="billing.payment.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulBillsWareHouse" class="treeview-menu">
		                  					
		                  					<li><a id="outletBillingWarehouse" onclick="viewBills('outletBillingWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="all.bills.label" /> <spring:message code="bills.label" /></a></li>

												<li><a id="openBillsWarehouse" onclick="viewBills('openBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="credit.label" /></a></li>

												<li><a id="pendingBillsWarehouse" onclick="viewBills('pendingBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="pending.bills.label" /></a></li>

												<li><a id="cancelledBillsWarehouse" onclick="viewBills('cancelledBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="cancelled.bills.label" /></a></li>
                          		
												<li><a id="ReturnedBillsWarehouse" onclick="viewBills('ReturnedBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="returned.bills.label" /></a></li>

												<li><a id="voidBillsWarehouse" onclick="viewBills('voidBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="all.void.bills.label" /></a></li>
		                    	
												<li><a id="exchengedBillsWarehouse" onclick="viewBills('exchengedBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="exchange.bills.label" /></a></li>
		                    		
												<li><a id="completedBillsWarehouse" onclick="viewBills('completedBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="completed.bills.label" /></a></li>
                          		
												<li><a id="homeDeliveryBillsWarehouse" onclick="viewBills('homeDeliveryBillsWarehouse','0','menu','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="home.delivery.bills.label" /></a></li>
		                    		
												<li><a id="mcnBillsWarehouse" onclick="viewMCNBills('mcnBillsWarehouse','0','menu','false','warehouse')"><i class="fa fa-angle-double-right"></i><spring:message code="mcn.label" /></a></li>
			         
		                  					
		                  					
		               </ul>
		                				</li>
		                			</c:if>
		                	</c:forEach>
	                  	
	                  	
	                  	
	                
		                   <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}" varStatus="theCount">
			                    <c:if test="${theCount.count == 1}">
			                    	<li id="liWarehouseOrders" style="display: "><a onclick="showWarehouseOrders();"><i class="fa fa-angle-double-right"></i><spring:message code="order.fulfillment.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  						<ul id="ulWarehouseOrders" class="treeview-menu">
		                  		</c:if>
		                   </c:forEach>
                  			 <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		                   		<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.read == true}">
                          			<li><a id="wshipmentOrders" onclick="viewOrders('ShipmentOrders','wshipmentOrders','0','','warehouse','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentirders.label" /></a> </li>
                          		</c:if>
	                       </c:forEach> 
	                     <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		                   		<c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.read == true && accessControl.write == true }">
                          			<li><a id="shipmentgatepass" onclick="viewShipmentGatePass('shipmentgatepass','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentgatepass.label" /></a> </li>
                          		</c:if>
                          		 <c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.read == false && accessControl.write == false  }"> 
                          			<li><a id="shipmentgatepass" onclick="return viewNewShipmentGatePass('','0','');"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.shipmentgatepass.label" /></a> </li>
                          		 </c:if> 
                          		<c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.read == true && accessControl.write == false }">
                          			<li><a id="shipmentgatepass" onclick="viewShipmentGatePass('shipmentgatepass','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentgatepass.label" /></a> </li>
                          		</c:if>
                          		<c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.read == false && accessControl.write == true }">
                          			<li><a id="shipmentgatepass" onclick="return viewNewShipmentGatePass('shipmentgatepass','shipmentgatepass','');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipmentgatepass.label" /></a> </li>
                          		</c:if>
                          		
	                       </c:forEach> 
	                       <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		                   		<c:if test="${accessControl.appDocument == 'WarehouseShipments' && accessControl.read == true}">
                          			<li><a id="wshipments" onclick="viewOutletShipments('','wshipments','0','','warehouse','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipments.label" /></a> </li>
                          		</c:if>
	                       </c:forEach>
	                        <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		                   		<c:if test="${accessControl.appDocument == 'WarehouseInvoices' && accessControl.read == true}">
                          			<li><a id="winvoice" onclick="viewInvoicing('winvoice','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.invoices.label" /></a> </li>
                          		</c:if>
	                       </c:forEach> 	
	                        <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		                   		<c:if test="${accessControl.appDocument == 'WarehousePayments' && accessControl.read == true}">
                          			<li><a id="wpayments" onclick="viewPayments('wpayments');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.payments.label" /></a> </li>
                          		</c:if>
	                       </c:forEach> 	 	
                  		  <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}" varStatus="theCount">
			                    <c:if test="${theCount.count == 1}">
			                    	</ul>
			                       </li>
		                  		</c:if>
		                   </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WarehouseHealth' && accessControl.read == true}"> 
                           			<li id="warehouseHealth" style="display:"><a onclick="viewHomePageDeals('warehouseHealth');"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.health.label" /></a>
                           		</c:if>
                            </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WarehouseNotifications' && accessControl.read == true}"> 
                           			<li id="warehouseNotation" style="display: "><a onclick="viewHomePageDeals('warehouseNotation');"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.notification.label" /></a>
                           		</c:if>
                            </c:forEach>
                          </ul>
                        </li>
                        </c:if>
                  					<c:if test="${sessionScope.role == 'super admin'}">
                  						<li class="treeview" id="liOutletProcurement"  style="cursor: pointer;display: none;"><a onclick="showOutletProcurementFlow()"><i class="fa fa-cart-plus"></i><spring:message code="procurement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  							<ul id="ulOutletProcurement" class="treeview-menu">
	                  							<li><a id="rqstForQutation" onclick="viewRequestForQuotation('rqstForQutation','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="rqst.for.quotation.label" /></a></li>
				                            	<li><a id="Qutation" onclick="viewqutation('all','Qutation','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="qutation.label" /></a></li>
		                                        <li><a id="outletGeneratePurchaseOrder" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="generate.purchase.order.label" /></a></li>
				                            	<li><a id="outletPurchaseOrder" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="purchase.order.label" /></a></li>
				                            	<li><a id="shipmentNotes" onclick="viewShipmentNotes('shipmentNotes','0','menu','procurement');"><i class="fa fa-angle-double-right"></i><spring:message code="shipment.notes.label" /></a></li>
				                            	<li><a id="outletgoodsReceipts" onclick="viewShipmentReceipts('all','outletgoodsReceipts','0','procurement','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="goods.receipts.label" /></a></li>
				                            	<li><a id="shipmentReturn" onclick="viewShipmentReturn('shipmentReturn','0','menu','procurement','clear');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.return.label" /></a> </li>
				                            	<%-- <li><a id="shipmentInspection" onclick="viewShipmentInspection('shipmentInspection');"><i class="fa fa-angle-double-right"></i><spring:message code="shipment.inspection.label" /></a></li>
				                            	<li><a id="invoicing" onclick="viewHomePageDeals('invoicing');"><i class="fa fa-angle-double-right"></i><spring:message code="invoicing.label" /></a></li>
				                            	<li><a id="payments" onclick="viewHomePageDeals('payments');"><i class="fa fa-angle-double-right"></i><spring:message code="payments.label" /></a></li>
				                            --%> </ul>
				                         </li>
			                         </c:if>
			                     <c:forEach var="accessControl" items="${sessionScope.procurement}" varStatus="theCount" >
			                     	<c:if test="${theCount.count == 1}">
			                     		<li class="treeview" id="liOutletProcurement"  style="cursor: pointer;display: none;"><a onclick="showOutletProcurementFlow()"><i class="fa fa-cart-plus"></i><spring:message code="procurement.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  							<ul id="ulOutletProcurement" class="treeview-menu">
			                     	</c:if>
			                     </c:forEach>
			                     
			                     <c:set var="rqstForQutation" value="false"/>
                  					<c:forEach var="accessControl" items="${sessionScope.procurement}">
                  							<c:if test="${accessControl.appDocument == 'RequestForQuotation' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="rqstForQutation" value="true"/> 
                    							<li><a id="rqstForQutation" onclick="return newRFQ('rqstForQutation');"><i class="fa fa-angle-double-right"></i><spring:message code="rqst.for.quotation.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appDocument == 'RequestForQuotation' && accessControl.read == true && rqstForQutation == false}"> 
                    							<li><a id="rqstForQutation" onclick="viewRequestForQuotation('rqstForQutation','0');"><i class="fa fa-angle-double-right"></i><spring:message code="rqst.for.quotation.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
			                     	<c:set var="qutation" value="false"/>
                  					<c:forEach var="accessControl" items="${sessionScope.procurement}">
                  							<c:if test="${accessControl.appDocument == 'Qutation' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="qutation" value="true"/> 
                    							<li><a id="Qutation" onclick="return vewNewPurchaseOrder('newOutletPurchaseOrder');"><i class="fa fa-angle-double-right"></i><spring:message code="qutation.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appDocument == 'Qutation' && qutation == false}"> 
                    							<li><a id="Qutation" onclick="viewqutation('all','Qutation','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="qutation.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                    				
                    					<c:set var="autoIndent" value="false"/>
                  					<c:forEach var="accessControl" items="${sessionScope.procurement}">
                  							<c:if test="${accessControl.appDocument == 'AutoIndent' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="autoIndent" value="true"/> 
                    							<li><a id="OutletGeneratePurchaseOrder" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="generate.purchase.order.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appDocument == 'AutoIndent' && autoIndent == false}"> 
                    							<li><a id="outletGeneratePurchaseOrder" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="generate.purchase.order.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                    				
                  					<c:set var="purchaseOrder" value="false"/>
                  					<c:forEach var="accessControl" items="${sessionScope.procurement}">
                  							<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true && accessControl.read == false}">
                  								<c:set var="purchaseOrder" value="true"/> 
                    							<li><a id="newOutletPurchaseOrder" onclick="return vewNewPurchaseOrder('newOutletPurchaseOrder');"><i class="fa fa-angle-double-right"></i><spring:message code="purchase.order.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appDocument == 'PurchaseOrder' && purchaseOrder == false}"> 
                    							<li><a id="outletPurchaseOrder" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="purchase.order.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                    				<c:set var="shipmentNotes" value="false"/>
                    				<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                            			<c:if test="${accessControl.appDocument == 'ShipmentNotes' && accessControl.write == true && accessControl.read == false}">
	                            				<c:set var="shipmentNotes" value="true"/>  
                    							<li><a id="shipmentNotes" onclick="newShipmentNote('shipmentNotes','procurement');"><i class="fa fa-angle-double-right"></i><spring:message code="shipment.notes.label" /></a></li>
                    						</c:if>
                    						<c:if test="${accessControl.appDocument == 'ShipmentNotes' && shipmentNotes == false}">
                    							<li><a id="shipmentNotes" onclick="viewShipmentNotes('shipmentNotes','0','menu','procurement');"><i class="fa fa-angle-double-right"></i><spring:message code="shipment.notes.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                    				<c:set var="shipmentReceipts" value="false"/>
                    				<c:forEach var="accessControl" items="${sessionScope.procurement}">
                    						<c:if test="${accessControl.appDocument == 'ShipmentReceipts' && accessControl.write == true && accessControl.read == false}">
                    							<c:set var="shipmentReceipts" value="true"/> 
                    							<li><a id="newOutletProcurementReceipts" onclick="return viewNewShipmentReceipt('newOutletProcurementReceipts','procurement');"><i class="fa fa-angle-double-right"></i><spring:message code="goods.receipts.label" /></a></li>
                    						</c:if>
	                            			<c:if test="${accessControl.appDocument == 'ShipmentReceipts' && shipmentReceipts == false}">
                    							<li><a id="outletgoodsReceipts" onclick="viewShipmentReceipts('all','outletgoodsReceipts','0','procurement','menu');"><i class="fa fa-angle-double-right"></i><spring:message code="goods.receipts.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                    				<c:set var="shipmentReturn" value="false"/>
                    				<c:forEach var="accessControl" items="${sessionScope.procurement}">
                    						<c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.write == true && accessControl.read == false}">
                    							<c:set var="shipmentReturn" value="true"/> 
                    							<li><a id="shipmentReturn" onclick="newShipmentReturn('shipmentReturn','procurement');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.return.label" /></a> </li>
                    						</c:if>
	                            			<c:if test="${accessControl.appDocument == 'ShipmentReturn' && shipmentReturn == false}">
                    							<li><a id="shipmentReturn" onclick="viewShipmentReturn('shipmentReturn','0','menu','procurement','clear');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.return.label" /></a> </li>
                    						</c:if>
                    				</c:forEach>
                    				<%-- 
                    				<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                            			<c:if test="${accessControl.appDocument == 'ShipmentInspection'}"> 
			                    				<li><a id="shipmentInspection" onclick="viewShipmentInspection('shipmentInspection');"><i class="fa fa-angle-double-right"></i><spring:message code="shipment.inspection.label" /></a></li>
                    						</c:if>
                    				</c:forEach> --%>
                    				<%-- <c:forEach var="accessControl" items="${sessionScope.procurement}">
	                            			<c:if test="${accessControl.appDocument == 'Invoicing'}"> 
                    							<li><a id="invoicing" onclick="viewHomePageDeals('invoicing');"><i class="fa fa-angle-double-right"></i><spring:message code="invoicing.label" /></a></li>
                    						</c:if>
                    				</c:forEach>
                    				<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                            			<c:if test="${accessControl.appDocument == 'Payments'}"> 
                    							<li><a id="payments" onclick="viewHomePageDeals('payments');"><i class="fa fa-angle-double-right"></i><spring:message code="payments.label" /></a></li>
                    						</c:if>
                    				</c:forEach>  --%>
                    			<c:forEach var="accessControl" items="${sessionScope.procurement}" varStatus="theCount" >
			                     	<c:if test="${theCount.count == 1}">
			                     			</ul>
                						</li>
			                     	</c:if>
			                     </c:forEach>
                     	
       			<c:if test="${sessionScope.role == 'super admin'}">
       				 <li class="treeview" id="liOrderManagement" style="cursor: pointer;display: none;"> <a onclick="showOrderManagementFlows()"> <i class="fa fa-cart-plus"></i> <span><spring:message code="order.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            <ul id="ulOrderManagement" class="treeview-menu">
       				<%-- <li class="treeview" id="liOrderManagement"  style="cursor: pointer;"><a onclick="showOrderManagementFlows();"><i class="fa fa-cart-plus"></i><spring:message code="order.management.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulOrderManagement" class="treeview-menu"> --%>
                  						<li id="liSalesOrders"><a onclick="showSalesOrderFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="sales.orders.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulSalesOrders" class="treeview-menu">
		                            			<li><a id="newSalesOrders" onclick="viewOrders('all','newSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="submitted.orders.label" /></a> </li>
		                               			<li><a id="confirmedSalesOrders" onclick="viewOrders('Confirmed','confirmedSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="confirmed.label" /></a> </li>
		                               			<li><a id="pendingSalesOrders" onclick="viewOrders('Pending','pendingSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.label" /></a> </li>
		                               			<li><a id="cancelledSalesOrders" onclick="viewOrders('Cancelled','cancelledSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="cancelled.label" /></a> </li>
		                               			<li><a id="shippedSalesOrders" onclick="viewOrders('Shipped','shippedSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipped.label" /></a> </li>
		                               			<li><a id="fulfilledSalesOrders" onclick="viewOrders('Delivered','fulfilledSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="fullfilled.orders.label" /></a> </li>        
		                  					</ul>
		                  				</li> 
		                  				
		                  				<li><a id="b2bSaleOrders" onclick="showB2BSaleOrdersFlow()"><i class="fa fa-angle-double-right"></i> <spring:message code="b2bsale.orders.label" /></a></li>
		                  				
		                  				<li><a id="outletOrdersReport" onclick="showOrderReportsFlow()"><i class="fa fa-angle-double-right"></i> <spring:message code="orders.reports.label" /></a></li>
		                  				 
		                  				<%-- <li id="liFulfillmentOrders"><a onclick="showFulfilmentOrders()"><i class="fa fa-angle-double-right"></i><spring:message code="fulfillment.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulFulfillmentOrders" class="treeview-menu">
		                            			<li><a id="newFulfillmentOrders" onclick="viewOutletShipments('all','newFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipments.label" /></a> </li>
		                               			<li><a id="pendingFulfillmentOrders" onclick="viewOutletShipments('Ready','pendingFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.label" /></a> </li>
		                               			<li><a id="confirmedFulfillmentOrders" onclick="viewHomePageDeals('confirmedFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.notes.label" /></a> </li>
		                               			<li><a id="cancelledFulfillmentOrders" onclick="viewOutletShipments('Rejected','cancelledFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="returned.bills.label" /></a> </li>
		                               			<li><a id="shippedFulfillmentOrders" onclick="viewOutletShipments('Delivered','shippedFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="delivered.order.label" /></a> </li>
		                               			<li><a id="fulfilledFulfillmentOrders" onclick="viewHomePageDeals('fulfilledFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.of.landing" /></a> </li>        
		                  					</ul>
		                  				</li>  --%>
		                  				<%-- <li id="liPaymentsOrders"><a onclick="showOrderPayments();"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.payments.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulPaymentsOrders" class="treeview-menu">
		                            			<li><a id="newPaymentsOrders" onclick="viewHomePageDeals('newPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bills.label" /></a> </li>
		                               			<li><a id="pendingPaymentsOrders" onclick="viewHomePageDeals('pendingPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.payments.label" /></a> </li>
		                               			<li><a id="fulfilledPaymentsOrders" onclick="viewHomePageDeals('fulfilledPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.payments.label" /></a> </li>        
		                  					</ul>
		                  				</li>    --%>
                  					</ul>
                  		</li>	
                  	</c:if>	
                  	
                  	<li class="treeview" id="liOrderManagementLi" style="cursor: pointer;display: none;"><a onclick="showOrderManagementFlows()"><i class="fa fa-cart-plus "></i><span><spring:message code="order.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                       <ul id="ulOrderManagementUl" class="treeview-menu">
               		<c:set var="salesOrderAdded" value="false"/> 
                  	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}">
       						<li id="liSalesOrdersLi" style=""><a onclick="showSalesOrderFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="sales.orders.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulSalesOrdersUl" class="treeview-menu">
		                  			<c:set var="salesOrderAdded" value="true"/> 
       						</c:if>
       				</c:forEach>
       				<c:set var="salesOrderNewAdded" value="false"/> 
                  	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}" varStatus="theCount">
                  		<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.read == false && accessControl.write == true && salesOrderNewAdded == false}"> 
       							<li><a id="newSalesOrderManagement" onclick="return viewNewOrder('SalesOrderManagement','','management');"><i class="fa fa-angle-double-right"></i><spring:message code="new.order" /></a>
		                  		<c:set var="salesOrderNewAdded" value="true"/> 
       					</c:if>
       				</c:forEach>
       				<c:if test="${salesOrderAdded == 'true' && salesOrderNewAdded == 'false'}">
       				<li><a id="SalesOrderManagement" onclick="viewOrders('all','SalesOrderManagement','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> All </a> </li>
	    
	       				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}">
	       						<li><a id="${accessControl.appDocumentActivity}SalesOrderManagement" onclick="viewOrders('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}SalesOrderManagement','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
	     				</c:forEach> 
     				</c:if>
       				<c:if test="${salesOrderAdded == 'true'}">
       					</ul>
		             </li>  
       				</c:if>
       				
       				<c:set var="ordervsstock" value="false"/>
       				<c:forEach var="accessControl" items="${sessionScope.orderManagementSalesOrderVsStock}">
                      	<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrderVsStock' && accessControl.read == true}">
       				
                        				<c:set var="ordervsstock" value="true"/>
                        				<li><a id="ordervsstock" onclick="viewOrdervsStock('ordervsstock','0','false');"><i class="fa fa-angle-double-right"></i>Order vs Stock</a> </li>  
                        		</c:if>		
                        		</c:forEach>	
                        		<c:if test="${ordervsstock == 'true'}"> 
                         				
                         				</li>
	                  			</c:if>	
       				
       				<c:set var="salesOrderFulfilmentAdded" value="false"/> 			
	                 <%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}">
       							<li id="liFulfillmentOrders"><a onclick="showFulfilmentOrders()"><i class="fa fa-angle-double-right"></i><spring:message code="fulfillment.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  			<ul id="ulFulfillmentOrders" class="treeview-menu">
		                  			<c:set var="salesOrderFulfilmentAdded" value="true"/> 	
       						</c:if>
       				</c:forEach> --%>
       				<c:set var="fulfillmentOrderNewAdded" value="false"/> 
                  	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}" varStatus="theCount">
                  		<c:if test="${accessControl.appDocument == 'OrderManagementFulFillment' && accessControl.read == false && accessControl.write == true && fulfillmentOrderNewAdded == false}"> 
       							<li><a id="newFulfilmentOrderManagement" onclick="return viewNewShipment('newFulfilmentOrderManagement','management');"><i class="fa fa-angle-double-right"></i><spring:message code="new.shipment.label" /></a>
		                  		<c:set var="fulfillmentOrderNewAdded" value="true"/> 
       					</c:if>
       				</c:forEach>
       				<c:if test="${fulfillmentOrderNewAdded == 'false'}">
	       				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilmentActivity}" >
	       					<c:if test="${accessControl.activityRead == false}">
	       						<li><a id="${accessControl.appDocumentActivity}FulfilmentOrderManagement" onclick="viewOutletShipments('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}FulfilmentOrderManagement','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
	       					</c:if>
	     				</c:forEach>
	     			</c:if>
                		<%-- <li><a id="newFulfillmentOrders" onclick="viewOutletShipments('all','newFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipments.label" /></a> </li>
              			<li><a id="pendingFulfillmentOrders" onclick="viewOutletShipments('Ready','pendingFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.label" /></a> </li>
              			<li><a id="cancelledFulfillmentOrders" onclick="viewOutletShipments('Rejected','cancelledFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="returned.bills.label" /></a> </li>
              			<li><a id="shippedFulfillmentOrders" onclick="viewOutletShipments('Delivered','shippedFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="delivered.order.label" /></a> </li> --%>
              		<%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementShipmentNotes'}"> 
   							<li><a id="confirmedFulfillmentOrders" onclick="viewHomePageDeals('confirmedFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.notes.label" /></a> </li>
   						</c:if>
     				</c:forEach>  --%> 
     				<%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementBillOfLading'}"> 
   							<li><a id="fulfilledFulfillmentOrders" onclick="viewHomePageDeals('fulfilledFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.of.landing" /></a> </li>
   						</c:if>
     				</c:forEach>  --%>
                  	<c:if test="${salesOrderFulfilmentAdded == 'true'}">
       					</ul>
		             </li>  
       				</c:if>	
       				
       				
       				<c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletOrdersReports'}">
								     	   <li id="outletOrdersReport"><a onclick="showB2BSaleOrdersFlow()"><i class="fa fa-angle-double-right"></i><spring:message code="b2bsale.orders.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulOrdersReportDetails" class="treeview-menu">
		                            			<li><a id="saleQuotation" onclick="showSaleQuotation('saleQuotation','0','clear')"><i class="fa fa-angle-double-right"></i> <spring:message code="sale.quotation.label" /></a> </li>
		                  						<li><a id="salePO" onclick="showSaleQuotation('saleQuotation','0','clear')"><i class="fa fa-angle-double-right"></i> <spring:message code="sale.po.label" /></a> </li>
		                  					
		                  					</ul>
		                  				</li>
								     	   
								      	</c:if>
								     </c:forEach>
       				
       				<c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletOrdersReports'}">
								     	   <li id="outletOrdersReport"><a onclick="showOrderReportsFlow()"><i class="fa fa-angle-double-right"></i><spring:message code="orders.reports.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulOrdersReportDetails" class="treeview-menu">
		                            			<li><a id="pendingCartReport" onclick="viewPendingCartsReports('0','','pendingCartReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.cart.report" /></a> </li>
		                               			<li><a id="orderToBillReport" onclick="viewOrderToBillReports('0','clear','orderToBillReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="order.to.bill.report" /></a> </li>
		                  					</ul>
		                  				</li>
								     	   
								      	</c:if>
								     </c:forEach>
       				
       					
       				<c:set var="salesOrderPaymentsAdded" value="false"/> 					
		           <%--  <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}" varStatus="theCount">
       					<c:if test="${theCount.count == 1}">
       						<li id="liPaymentsOrders"><a onclick="showOrderPayments();"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.payments.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  		<ul id="ulPaymentsOrders" class="treeview-menu">
		                  		<c:set var="salesOrderPaymentsAdded" value="true"/> 		
       					</c:if>
       				</c:forEach>  --%>   
       				<%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementBills'}"> 
   							<li><a id="newPaymentsOrders" onclick="viewHomePageDeals('newPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bills.label" /></a> </li>
   						</c:if>
     				</c:forEach>   --%>
     				<%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementBillsPayments'}"> 
   							<li><a id="pendingPaymentsOrders" onclick="viewHomePageDeals('pendingPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.payments.label" /></a> </li>
   						</c:if>
     				</c:forEach>  --%> 
     				<%-- <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementPendingPayments'}"> 
   							<li><a id="fulfilledPaymentsOrders" onclick="viewHomePageDeals('fulfilledPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.payments.label" /></a> </li> 
   						</c:if>
     				</c:forEach>  --%> 					
	             <%--  <c:if test="${salesOrderPaymentsAdded == 'true'}">
      					</ul>
	             	</li>  
      			  </c:if> --%>	    				
         			</ul>
         		</li>
         		
         		
         		
         		
                             <c:if test="${sessionScope.role == 'super admin'}">
                              <li class="treeview" id="deals-offers" style="cursor: pointer;"> <a onclick="showDealsFlow();"> <i class="fa fa-tags"></i> <span><spring:message code="campaignmanagment.label" /> </span><i class="fa fa-angle-left pull-right"></i> </a>
                            	<ul id="ulDealsOffers" class="treeview-menu">
                             		<li><a id="dealsConfigurations" onclick="viewdealsandoffers('deals','dealsConfigurations','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.label" /> </a> </li>
                             		<li><a id="offersConfigurations" onclick="viewdealsandoffers('offers','offersConfigurations','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="offers.label" /> </a> </li>
                             		<%-- <li><a id="socialMediaCampaign" onclick="viewsocialMediaCampaigns('socialmediacampaigns','socialMediaCampaign','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="socialmediacampaigns.label" /> </a> </li>
                             		 --%>
                             		 <%-- <li><a id="EmailCampaign" onclick="viewemailCampaigns('emailcampaigns','EmailCampaign','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="emailcampaigns.label" /> </a> </li>
                             		 --%>
                             		 <%-- <li><a id="MobileCampaign" onclick="viewmobileCampaigns('mobilecampaigns','MobileCampaign','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="mobilecampaigns.label" /> </a> </li>
                             		 --%><li><a id="CustomerReferal" onclick="viewcustomerReferals('customerreferals','CustomerReferal','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="customerreferals.label" /> </a> </li>
                             		<li><a id="Promotions" onclick="viewpromotions('promotions','Promotions','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="promotions.label" /> </a> </li>
                             	</ul>
                             </li>
                             </c:if>
                             
                             
                              <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" varStatus="theCount" >
			                   	<c:if test="${theCount.count == 1}">
                  					<li class="treeview" id="deals-offers" style="cursor: pointer;display: none;"> 
         		                                <a onclick="showDealsFlow();"> <i class="fa fa-tags"></i>
  <span><spring:message code="campaignmanagment.label" /> </span>
         		  <i class="fa fa-angle-left pull-right"></i> 
         		  </a>
                            		<ul id="ulDealsOffers" class="treeview-menu"> 
			                     	</c:if>
			                     </c:forEach>
                             
                             
<%--                             <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" varStatus="theCount"> --%>
<%--                             	<c:if test="${theCount.count == 1}">     --%>
                            	 
<%--                             	 </c:if> --%>
<%--                             </c:forEach> --%>
                            
                            <c:set var="campaignPromotionsCheck" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">
	                           <li id="liCampaignPromotions" style="display: none;"><a onclick="showPromotionsFlow()"><i class="fa fa-angle-double-right"></i><span><spring:message code="promotions.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
	                             <ul id="ulCampaignPromotions" class="treeview-menu">
	                             <c:set var="campaignPromotionsCheck" value="true"/>
	                         </c:if>
	                      </c:forEach>
                            
                            <c:set var="deals" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'DealsConfiguration' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="deals" value="true"/>
                           			<li><a id="dealsConfigurations" onclick="return createNewDeal('dealsConfigurations');"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'DealsConfiguration' && deals==false}"> 
                           			<li><a id="dealsConfigurations" onclick="viewdealsandoffers('deals','dealsConfigurations','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                            <c:set var="offers" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="offers" value="true"/>
                           			<li><a id="offersConfigurations" onclick="return createNewOffer('offersConfigurations');"><i class="fa fa-angle-double-right"></i> <spring:message code="offers.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'OffersConfiguration' && offers==false}"> 
                           			<li><a id="offersConfigurations" onclick="viewdealsandoffers('offers','offersConfigurations','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="offers.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	
                           	
                           		  <c:set var="customerreferals" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'CustomerReferal' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="customerreferals" value="true"/>
                           			<li><a id="CustomerReferal" onclick="return createNewOffer('CustomerReferal');"><i class="fa fa-angle-double-right"></i> <spring:message code="customerreferals.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'CustomerReferal' && customerreferals==false}"> 
                           			<li><a id="CustomerReferal" onclick="viewCustomerReferrals('CustomerReferal','0','false');"><i class="fa fa-angle-double-right"></i> <spring:message code="customerreferals.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	
                           	 <c:set var="customersignup" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'CustomerSignUp' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="customersignup" value="true"/>
                           			<li><a id="CustomerSignUp" onclick="return createNewOffer('CustomerSignUp');"><i class="fa fa-angle-double-right"></i> <spring:message code="signUp.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'CustomerSignUp' && customersignup==false}"> 
                           			<li><a id="CustomerSignUp" onclick="viewCustomerSignUp('CustomerSignUp','0','false');"><i class="fa fa-angle-double-right"></i> <spring:message code="signUp.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	
                           	
                           
                           	 <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" varStatus="theCount">
                            	<c:if test="${theCount.count  == 1}">    
                            	 	</ul>
                            	 </li>
                            	 </c:if>
                            </c:forEach> 
                           	
                           	<c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'CustomerNotification' && accessControl.write == true && accessControl.read == true}">
	                            	<li><a id="customerNotifications" onclick="viewCustomerNotifications('customerNotifications')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.notifications.label" /> </a> </li>
	                              </c:if>
	                            </c:forEach>
                           	
                           	 <%--  <c:set var="socialmediacampaigns" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'socialMediaCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="socialmediacampaigns" value="true"/>
                           			<li><a id="socialMediaCampaign" onclick="return createNewOffer('socialMediaCampaign');"><i class="fa fa-angle-double-right"></i> <spring:message code="socialmediacampaigns.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'socialMediaCampaign' && socialmediacampaigns==false}"> 
                           			<li><a id="socialMediaCampaign" onclick="viewsocialMediaCampaigns('socialmediacampaigns','socialMediaCampaign','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="socialmediacampaigns.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach> --%>
                           	
                           	
                           	
                           	
                           	
                           	
                           	
                           	 <%--  <c:set var="emailcampaigns" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'EmailCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="emailcampaigns" value="true"/>
                           			<li><a id="EmailCampaign" onclick="return createNewOffer('EmailCampaign');"><i class="fa fa-angle-double-right"></i> <spring:message code="emailcampaigns.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'EmailCampaign' && offers==false}"> 
                           			<li><a id="EmailCampaign" onclick="viewemailCampaigns('emailcampaigns','EmailCampaign','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="emailcampaigns.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach> --%>
                           	  <%-- <c:set var="mobilecampaigns" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'MobileCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="emailcampaigns" value="true"/>
                           			<li><a id="MobileCampaign" onclick="return createNewOffer('MobileCampaign');"><i class="fa fa-angle-double-right"></i> <spring:message code="mobilecampaigns.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'EmailCampaign' && offers==false}"> 
                           			<li><a id="MobileCampaign" onclick="viewmobileCampaigns('mobilecampaigns','MobileCampaign','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="mobilecampaigns.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach> --%>
                           
                           	 <%--  <c:set var="promotions" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'Promotion' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="promotions" value="true"/>
                           			<li><a id="Promotion" onclick="return createNewOffer('Promotion');"><i class="fa fa-angle-double-right"></i> <spring:message code="promotions.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'Promotion' && offers==false}"> 
                           			<li><a id="Promotion" onclick="viewpromotions('promotions','Promotion','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="promotions.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach> --%>
                           	
                           	
                           	 <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" varStatus="theCount">
                            	<c:if test="${theCount.count == 1}">    
                            	 	</ul>
                            	 </li>
                            	 </c:if>
                            </c:forEach> 
                           	
                          
                            <!-- campaignmanagment -->  		
                           		<!-- customer loyality start -->
                           		
                           	 <c:if test="${sessionScope.role == 'super admin'}">
                              <li class="treeview" id="customer-loyality" style="cursor: pointer;"> <a onclick="showLoyaltyFlow();"> <i class="fa fa-tags"></i> <span><spring:message code="customer.loyality.label" /> </span><i class="fa fa-angle-left pull-right"></i> </a>
                            	<ul id="ulCustomerLoyality" class="treeview-menu">
                             		<%-- <li><a id="CustomerRetention" onclick="viewcustomerRetention('customerretention','CustomerRetention','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.retention.label" /> </a> </li>
                             		<li><a id="CustomerPatterns" onclick="viewcustomerPatterns('customerPatterns','CustomerPatterns','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.patterns.label" /> </a> </li>
                             		 --%><li><a id="Loyaltycards" onclick="viewLoyaltyCards('loyaltycards','Loyaltycards','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.cards.label" /> </a> </li>
                             		<li><a id="GiftCoupons" onclick="viewGiftCoupons('giftcoupons','GiftCoupons','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.coupons.label" /> </a> </li>
                             		<li><a id="GiftVoucher" onclick="viewGiftVouchers('giftvoucher','GiftVoucher','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.giftvouchers.label" /> </a> </li>
                             		
                             		<li><a id="Memberships" onclick="viewMemberships('membership','Memberships','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.memberships.label" /> </a> </li>
                             		
                             		<%-- <li><a id="LoyalityRewards" onclick="viewloyalityRewards('loyalityRewards','LoyalityRewards','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.rewards.label" /> </a> </li>
                             		 --%>
                             	</ul>
                             </li>
                             </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" varStatus="theCount">
                            	<c:if test="${theCount.count == 1}">    
                            	  <li class="treeview" id="customer-loyality" style="cursor: pointer;"> <a onclick="showLoyaltyFlow();"> <i class="fa fa-user-plus"></i> <span><spring:message code="customer.loyality.label" /> </span><i class="fa fa-angle-left pull-right"></i> </a>
                            		<ul id="ulCustomerLoyality" class="treeview-menu"> 
                            	 </c:if>
                            </c:forEach>
                           <%--  <c:set var="customerretention" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                           		<c:if test="${accessControl.appDocument == 'CustomerRetention' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="customerretention" value="true"/>
                           			<li><a id="CustomerRetention" onclick="return createNewDeal('CustomerRetention');"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.retention.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'CustomerRetention' && customerretention==false}"> 
                           			<li><a id="CustomerRetention" onclick="viewcustomerRetention('customerretention','CustomerRetention','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.retention.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                            <c:set var="customerPatterns" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                           		<c:if test="${accessControl.appDocument == 'CustomerPatterns' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="customerPatterns" value="true"/>
                           			<li><a id="CustomerPatterns" onclick="return createNewOffer('CustomerPatterns');"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.patterns.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'CustomerPatterns' && customerPatterns==false}"> 
                           			<li><a id="CustomerPatterns" onclick="viewcustomerPatterns('customerPatterns','CustomerPatterns','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.patterns.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach> --%>
                           	  <c:set var="loyalitycards" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                           		<c:if test="${accessControl.appDocument == 'Loyaltycards' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="loyalitycards" value="true"/>
                           			<li><a id="Loyaltycards" onclick="return viewNewLoyaltyCard('Loyaltycards');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.cards.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'Loyaltycards' && loyalitycards==false}"> 
                           			<li><a id="Loyaltycards" onclick="viewLoyaltyCards('loyalitycards','Loyaltycards','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.cards.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	  <c:set var="loyalitycoupons" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                           		<c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="loyalitycoupons" value="true"/>
                           			<li><a id="GiftCoupons" onclick="return viewNewGiftCoupons('GiftCoupons');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.coupons.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'GiftCoupons' && loyalitycoupons==false}"> 
                           			<li><a id="GiftCoupons" onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.coupons.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	  <c:set var="giftvoucher" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                           		<c:if test="${accessControl.appDocument == 'GiftVoucher' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="giftvoucher" value="true"/>
                           			<li><a id="GiftVoucher" onclick="return viewNewGiftVouchers('GiftVoucher');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.giftvouchers.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'GiftVoucher' && giftvoucher==false}"> 
                           			<li><a id="GiftVoucher" onclick="viewGiftVouchers('giftvoucher','GiftVoucher','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.giftvouchers.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	
                           	<c:set var="Memberships" value="false"/>
                           	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                            	<c:if test="${accessControl.appDocument == 'Memberships' && Memberships==false}"> 
                           			<li><a id="Memberships" onclick="viewMemberships('membership','Memberships','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.memberships.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                  <!-- Added by:Swathi
                  Purpose :To add Wallets to the flow.         	
                    -->       
                     <c:set var="wallets" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                            	<c:if test="${accessControl.appDocument == 'Wallets' && wallets==false}"> 
                     	<li><a id="Wallet" onclick="viewWallets('wallet','Wallet','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.wallets.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	
                           	
                           		<c:set var="subscriptions" value="false"/>
                           	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                            	<c:if test="${accessControl.appDocument == 'Subscription' && subscriptions==false}"> 
                           			<li><a id="subscription" onclick="viewSubscriptions('subscriptions','subscription','0','menu');"><i class="fa fa-angle-double-right"></i> Subscriptions </a> </li>
                           		</c:if>
                           	</c:forEach>
                           	
                           	<%--   <c:set var="loyalityrewards" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                           		<c:if test="${accessControl.appDocument == 'LoyalityRewards' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="loyalityrewards" value="true"/>
                           			<li><a id="LoyalityRewards" onclick="return createNewOffer('LoyalityRewards');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.rewards.label" /> </a> </li>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'LoyalityRewards' && loyalityrewards==false}"> 
                           			<li><a id="LoyalityRewards" onclick="viewloyalityRewards('loyalityrewards','LoyalityRewards','0','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyality.rewards.label" /> </a> </li>
                           		</c:if>
                           	</c:forEach> --%>
                          <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" varStatus="theCount">
                            	<c:if test="${theCount.count == 1}">    
                            	 	</ul>
                            	 </li>
                            	 </c:if>
                            </c:forEach> 
                           		<!-- customer loyality end -->
                        
                         <c:if test="${sessionScope.role == 'super admin'}">
                          <li class="treeview" id="loyaltyProgram" style="cursor: pointer;"><a onclick="showCRMFlow();"> <i class="glyphicon glyphicon-credit-card"></i><span><spring:message code="loyaltyprogram.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            <ul id="ulLoyaltyProgram" class="treeview-menu">
                        		 <li><a id="customerViews" onclick="viewCustomers('customerViews')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.view.label" /> </a> </li>
                           		 <li><a id="customerGroup" onclick="viewCustomerGroupMaster('CustomerGroup',0)"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.group.label" /> </a> </li>
      
                           		 <li><a id="customerVisits" onclick="viewCustomerVisits('customerVisits');" ><i class="fa fa-angle-double-right"></i> <spring:message code="customer.visits.label" /> </a> </li>
                             	 <li><a id="customerPurchases" onclick="viewCustomerPurchases('customerPurchases','0');" ><i class="fa fa-angle-double-right"></i> <spring:message code="customer.purchases.label" /> </a> </li>
                             	  <li id="liLoyalty" style="display: none;"><a onclick="showLoyaltyFlow();"><i class="fa fa-angle-double-right"></i> <spring:message code="loyalty.program.label" /><i class="fa fa-angle-left pull-right"></i></a>
                             		<ul id="ulLoyalty" class="treeview-menu">
                             			<li><a id="giftVouchers" onclick="viewGiftVouchers('giftVouchers','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="giftvouchers.label" /> </a> </li>
	                             		<li><a id="giftCoupons" onclick="viewGiftCoupons('giftCoupons','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="giftCoupons.label" /> </a> </li>
	                             		<li><a id="loyaltyCards" onclick="viewLoyaltyCards('loyaltyCards','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="loyaltycards.label" /> </a> </li>
	                             	</ul>
	                            </li>
                             	 <%--  <li><a id="customerNotifications" onclick="viewCustomerNotifications('customerNotifications')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.notifications.label" /> </a> </li> --%>
	                              <li><a id="customerWarrants" onclick="viewCustomerWarrants('customerWarrants','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.warrants.label" /> </a> </li>
      		                      <li><a id="customerFeedback" onclick="viewCustomerFeedback('customerFeedback','0','menu')" ><i class="fa fa-angle-double-right"></i> <spring:message code="customer.feedback.label" /> </a> </li>
            		              <li><a id="customerComplaints" onclick="viewCustomerComplaints('customerComplaints','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.complaints.label" /> </a> </li>
            		              <li><a id="businessEnquiry" onclick="viewBusinessEnquiry('businessEnquiry','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="business.enquiry.label" /> </a> </li>
            		         </ul>
                        </li>
                      </c:if>
                      <c:set var="loyalProgramMenuAdded" value="false" />
                      <c:forEach var="accessControl" items="${sessionScope.crm}" varStatus="theCount">
                           	<c:if test="${theCount.count == 1}">
                           		<li class="treeview" id="loyaltyProgram" style="cursor: pointer;"><a onclick="showCRMFlow();"> <i class="glyphicon glyphicon-credit-card"></i><span><spring:message code="loyaltyprogram.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            		<ul id="ulLoyaltyProgram" class="treeview-menu">
                            	 <c:set var="loyalProgramMenuAdded" value="true" />
                           	</c:if>
                      </c:forEach>
                      <c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}" varStatus="theCount">
                           	<c:if test="${theCount.count == 1 && loyalProgramMenuAdded == 'false' }">
                           		<li class="treeview" id="loyaltyProgram" style="cursor: pointer;"><a onclick="showCRMFlow();"> <i class="glyphicon glyphicon-credit-card"></i><span><spring:message code="loyaltyprogram.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            		<ul id="ulLoyaltyProgram" class="treeview-menu">
                            	 <c:set var="loyalProgramMenuAdded" value="true" />
                           	</c:if>
                      </c:forEach>
                       <c:forEach var="accessControl" items="${sessionScope.crm}">
                            <c:if test="${accessControl.appDocument == 'CustomerView' && accessControl.write == true && accessControl.read == true}">
                     		   <li><a id="customerViews" onclick="viewCustomers('customerViews')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.view.label" /> </a> </li>
                     		</c:if>
                     </c:forEach>
                     		  <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	<c:if test="${accessControl.appDocument == 'CustomerGroup' && accessControl.write == true && accessControl.read == true}">
                     		       <li><a id="customerGroup" onclick="viewCustomerGroupMaster('CustomerGroup',0)"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.group.label" /> </a> </li>
							</c:if>
                     		 </c:forEach> 
                     		 
                     		  <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	<c:if test="${accessControl.appDocument == 'CustomerVisits' && accessControl.write == true && accessControl.read == true}">
                  		          <li><a id="customerVisits" onclick="viewCustomerVisits('customerVisits','0','false')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.visits.label" /> </a> </li>
                  		        </c:if>
                  		      </c:forEach>
                  		      <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	<c:if test="${accessControl.appDocument == 'CustomerPurchases' && accessControl.write == true && accessControl.read == true}">
                            		<li><a id="customerPurchases" onclick="viewCustomerPurchases('customerPurchases','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.purchases.label" /> </a> </li>
                            	</c:if>
                              </c:forEach>
		                       <c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}" varStatus="theCount">
		                           	<c:if test="${theCount.count == 1}">
		                           		 <li id="liLoyalty" style=""><a onclick="showLoyaltyFlow();"><i class="fa fa-angle-double-right"></i> <spring:message code="loyalty.program.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                             		<ul id="ulLoyalty" class="treeview-menu">
		                           	</c:if>
		                      </c:forEach>
	                            <c:set var="giftVoucher" value="false"/>
	                            	<c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}">
	                            	<c:if test="${accessControl.appDocument == 'GiftVoucher' && accessControl.write == true && accessControl.read == false}"> 
	                            		 <c:set var="giftVoucher" value="true"/>
	                            			<li><a id="newVoucher" onclick="return viewNewGiftVoucher('newVoucher');"><i class="fa fa-angle-double-right"></i> <spring:message code="giftvouchers.label" /> </a> </li>
	                            		</c:if>
		                            	<c:if test="${accessControl.appDocument == 'GiftVoucher' && giftVoucher == false}"> 
	                            			<li><a id="giftVouchers" onclick="viewGiftVouchers('giftVouchers','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="giftvouchers.label" /> </a> </li>
	                            		</c:if>
	                            	</c:forEach>
	                            	 <c:set var="giftCoupon" value="false"/>
	                            	<c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}">
	                            	<c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == false}"> 
	                            			<c:set var="giftCoupon" value="true"/>
	                            			<li><a id="newCoupon" onclick="return viewNewGiftCoupons('newCoupon');"><i class="fa fa-angle-double-right"></i> <spring:message code="giftCoupons.label" /> </a> </li>
	                            		</c:if>
		                            	<c:if test="${accessControl.appDocument == 'GiftCoupons' && giftCoupon==false}"> 
	                            			<li><a id="giftCoupons" onclick="viewGiftCoupons('giftCoupons','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="giftCoupons.label" /> </a> </li>
	                            		</c:if>
	                            	</c:forEach>
	                            	<c:set var="loyaltyCard" value="false"/>
	                            	<c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}">
	                            	<c:if test="${accessControl.appDocument == 'Loyaltycards' && accessControl.write == true && accessControl.read == false}">
	                            			<c:set var="loyaltyCard" value="true"/> 
	                            			<li><a id="newLoyalty" onclick="return viewNewLoyaltyCard('newLoyalty');"><i class="fa fa-angle-double-right"></i> <spring:message code="loyaltycards.label" /> </a> </li>
	                            		</c:if>
		                            	<c:if test="${accessControl.appDocument == 'Loyaltycards' && loyaltyCard == false}"> 
	                            			<li><a id="loyaltyCards" onclick="viewLoyaltyCards('loyaltyCards','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="loyaltycards.label" /> </a> </li>
	                            		</c:if>
	                            	</c:forEach>
	                           <c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}" varStatus="theCount">
		                           	<c:if test="${theCount.count == 1}">
		                           		  </ul>
	                            	   </li>
		                           	</c:if>
		                      </c:forEach>
	                           
	                            <%-- <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'CustomerNotification' && accessControl.write == true && accessControl.read == true}">
	                            	<li><a id="customerNotifications" onclick="viewCustomerNotifications('customerNotifications')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.notifications.label" /> </a> </li>
	                              </c:if>
	                            </c:forEach> --%>
	                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'CustomerWarrants' && accessControl.write == true && accessControl.read == true}">
	                            	<li><a id="customerWarrants" onclick="viewCustomerWarrants('customerWarrants','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.warrants.label" /> </a> </li>
	                              </c:if>
	                            </c:forEach>
	                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'CustomerFeedback' && accessControl.write == true && accessControl.read == true}">
	                                <li><a id="customerFeedback" onclick="viewCustomerFeedback('customerFeedback','0','menu')" ><i class="fa fa-angle-double-right"></i> <spring:message code="customer.feedback.label" /> </a> </li>
	                              </c:if>
	                           </c:forEach>
	                           
	                           <c:set var="customerComplaints" value="false"/>
	                           <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'CustomerComplaints' && accessControl.write == true && accessControl.read == false}">
                             	  	<c:set var="customerComplaints" value="true"/> 
	                                <li><a id="customerComplaints" onclick="newCustomerComplaints('customerComplaints')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.complaints.label" /> </a> </li>
	                              </c:if>
	                              <c:if test="${accessControl.appDocument == 'CustomerComplaints' && customerComplaints == false}">
	                                <li><a id="customerComplaints" onclick="viewCustomerComplaints('customerComplaints','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.complaints.label" /> </a> </li>
	                              </c:if>
	                           </c:forEach>
	                           
	                             <c:set var="customerOTP" value="false"/>
	                           <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'customerOTP' && accessControl.write == true && accessControl.read == false}">
                             	  	<c:set var="customerOTP" value="true"/> 
	                                <li><a id="customerOTP" onclick="newCustomerOTP('customerOTP')"><i class="fa fa-angle-double-right"></i> Customer OTP </a> </li>
	                              </c:if>
	                              <c:if test="${accessControl.appDocument == 'CustomerOTP' && customerOTP == false}">
	                                <li><a id="customerOTP" onclick="viewCustomerOTP('customerOTP','0','menu')"><i class="fa fa-angle-double-right"></i> Customer OTP</a> </li>
	                              </c:if>
	                           </c:forEach> 
	                           
	                           
	                           
	                           
	                           <c:set var="businessEnquiry" value="false"/>
	                           <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'BusinessEnquiry' && accessControl.write == true && accessControl.read == false}">
                             	  	<c:set var="businessEnquiry" value="true"/> 
	                                <li><a id="businessEnquiry" onclick="newBusinessEnquiry('businessEnquiry')"><i class="fa fa-angle-double-right"></i> <spring:message code="business.enquiry.label" /> </a> </li>
	                              </c:if>
	                              <c:if test="${accessControl.appDocument == 'BusinessEnquiry' && businessEnquiry == false}">
	                                <li><a id="businessEnquiry" onclick="viewBusinessEnquiry('businessEnquiry','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="business.enquiry.label" /> </a> </li>
	                              </c:if>
	                           </c:forEach>
	                         	<c:if test="${loyalProgramMenuAdded == 'true' }">
			                          </ul>
			                        </li>
	                         	</c:if>
	                           
                        <c:if test="${sessionScope.role == 'super admin'}">
                        <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="b2c.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
            				<ul id="ulb2cConfig" class="treeview-menu">
								<li><a id="homePageBanner" onclick="viewHomePageBanners('homePageBanner','0','banner')"><i class="fa fa-angle-double-right"></i> <spring:message code="home.page.banner.label" /></a> </li>
								<li><a id="miniBanner" onclick="viewHomePageBanners('miniBanner','0','miniBanner')"><i class="fa fa-angle-double-right"></i> <spring:message code="mini.banner.label" /></a> </li>
								<%-- <li><a id="homePageBanner" onclick="viewHomePageBanners('homePageBanner','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="home.page.banner.label" /></a> </li> --%>
                     										<li><a id="homePageGroups" onclick="viewAllHomePageGroups('homePageGroups','0');"><i class="fa fa-angle-double-right"></i> Home Page Groups</a> </li>
                     		
                     			<li><a id="homePageDeals" onclick="viewAllHomePageDeals('homePageDeals','0');"><i class="fa fa-angle-double-right"></i><spring:message code="home.page.offers.label" /></a> </li>
                     			<%-- <li><a id="brandDeals" onclick="viewBrandDeals('brandDeals')"><i class="fa fa-angle-double-right"></i> <spring:message code="brand.deals.label" /></a> </li>    
                     			<li><a id="dealCategories" onclick="viewDealCategories('dealCategories')"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.categories.label" /></a> </li>
                      --%>			<li><a id="newArrivals" onclick="viewNewArrivals('newArrivals')"><i class="fa fa-angle-double-right"></i> <spring:message code="new.arrivals.label" /></a> </li>
                     			<li><a id="featuredProducts" onclick="viewFeaturedProducts('featuredProducts','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
                     			<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>        
                     			<li><a id="events" onclick="viewEvents('events','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
        					</ul>
               			</li> 
               			</c:if>

               				
               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="b2c.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		            					<ul id="ulb2cConfig" class="treeview-menu">
                   			</c:if>
                   		</c:forEach>
                   		<c:set var="homePageBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageBanner" onclick="newBannerImage('homePageBanner','banner')"><i class="fa fa-angle-double-right"></i> <spring:message code="home.page.banner.label" /></a> </li>
		                        <c:set var="homePageBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && homePageBanner == 'false' }">
								<li><a id="homePageBanner" onclick="viewHomePageBanners('homePageBanner','0','banner')"><i class="fa fa-angle-double-right"></i> <spring:message code="home.page.banner.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="miniBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="miniBanner" onclick="newBannerImage('miniBanner','miniBanner')"><i class="fa fa-angle-double-right"></i> <spring:message code="mini.banner.label" /></a> </li>
		                        <c:set var="miniBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && miniBanner == 'false' }">
								<li><a id="miniBanner" onclick="viewHomePageBanners('miniBanner','0','miniBanner')"><i class="fa fa-angle-double-right"></i> <spring:message code="mini.banner.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="homePageGroups" value="false" />
	                    <c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageGroups' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageGroups" onclick=""><i class="fa fa-angle-double-right"></i> Home Page Groups</a> </li>
		                        <c:set var="homePageGroups" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageGroups' && homePageGroups == 'false' }">
								<li><a id="homePageGroups" onclick="viewAllHomePageGroups('homePageGroups','0');"><i class="fa fa-angle-double-right"></i> Home Page Groups</a> </li>
	                        </c:if>
	                    </c:forEach>
	                     <c:set var="homePageDeals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageDeals" onclick="newHomePageDeal('homePageDeals');"><i class="fa fa-angle-double-right"></i> <spring:message code="home.page.offers.label" /></a> </li>
		                        <c:set var="homePageDeals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && homePageDeals == 'false' }">
								<li><a id="homePageDeals" onclick="viewAllHomePageDeals('homePageDeals','0');"><i class="fa fa-angle-double-right"></i><spring:message code="home.page.offers.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
<%-- 	                    <c:set var="brandDeals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'BrandDeals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="brandDeals" onclick="viewBrandDeals('brandDeals')"><i class="fa fa-angle-double-right"></i> <spring:message code="brand.deals.label" /></a> </li>
		                        <c:set var="brandDeals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'BrandDeals' && brandDeals == 'false' }">
								<li><a id="brandDeals" onclick="viewBrandDeals('brandDeals')"><i class="fa fa-angle-double-right"></i> <spring:message code="brand.deals.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="dealCategories" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'DealCategories' && accessControl.write == true && accessControl.read == false}">
								<li><a id="dealCategories" onclick="viewDealCategories('dealCategories')"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.categories.label" /></a> </li>
		                        <c:set var="miniBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'DealCategories' && dealCategories == 'false' }">
								<li><a id="dealCategories" onclick="viewDealCategories('dealCategories')"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.categories.label" /></a> </li>
	                        </c:if>
	                    </c:forEach> --%>
	                    <c:set var="newArrivals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="newArrivals" onclick="viewNewArrivals('newArrivals')"><i class="fa fa-angle-double-right"></i> <spring:message code="new.arrivals.label" /></a> </li>
		                        <c:set var="newArrivals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && newArrivals == 'false' }">
								<li><a id="newArrivals" onclick="viewNewArrivals('newArrivals')"><i class="fa fa-angle-double-right"></i> <spring:message code="new.arrivals.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    
	                    <c:set var="featuredShops" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true && accessControl.read == false}">
								<li><a id="featuredShops" onclick="newFeaturedShopsGroupMaster('featuredShops')"><i class="fa fa-angle-double-right"></i><spring:message code="featured.shops.label" /></a> </li>
		                        <c:set var="featuredShops" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredShops == 'false' }">
								<li><a id="featuredShops" onclick="viewFeaturedShops('featuredShops','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.shops.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    
	                    <c:set var="featuredProducts" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true && accessControl.read == false}">
								<li><a id="featuredProducts" onclick="newFeaturedProductGroupMaster('featuredProducts')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
		                        <c:set var="featuredProducts" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredProducts == 'false' }">
								<li><a id="featuredProducts" onclick="viewFeaturedProducts('featuredProducts','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
                     	<c:set var="paymentGateway" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && accessControl.write == true && accessControl.read == false}">
								<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>
		                        <c:set var="paymentGateway" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && paymentGateway == 'false' }">
								<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>	
	                    <c:set var="events" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'Events' && accessControl.write == true && accessControl.read == false}">
								<li><a id="events" onclick="newEvent('events')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
		                        <c:set var="events" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'Events' && events == 'false' }">
								<li><a id="events" onclick="viewEvents('events','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="shoppinglist" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true && accessControl.read == false}">
								<li><a id="shoppinglist" onclick="viewDealCategories('dealCategories')"><i class="fa fa-angle-double-right"></i> <spring:message code="shoppinglist.label" /></a> </li>
		                        <c:set var="shoppinglist" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'ShoppingList' && shoppinglist == 'false' }">
								<li><a id="shoppinglist" onclick="viewShoppingList('shoppinglist')"><i class="fa fa-angle-double-right"></i> <spring:message code="shoppinglist.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    
	                    
               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 </ul>
                   				</li>
                   			</c:if>
                   		</c:forEach>
    <!--////////////////////////////////  -->
    
    	<!--  sales start-->
                   	<%-- <c:if test="${sessionScope.role == 'super admin'}">
                        <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="sales.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
            				<ul id="ulb2cConfig" class="treeview-menu">
								<li><a id="SalesEstimate" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.Estimates" /></a> </li>
								<li><a id="SalesCustomerStatements" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.customerStatements" /></a> </li>
								<li><a id="SalesCustomers" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.Customers" /></a> </li>
                     			<li><a id="SalesProductNservices" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.ProductNservices" /></a> </li>
        					</ul>
               			</li> 
               			</c:if>

               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="sales.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		            					<ul id="ulb2cConfig" class="treeview-menu">
                   			</c:if>
                   		</c:forEach>
                   		<c:set var="homePageBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.Estimates" /></a> </li>
		                        <c:set var="homePageBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && homePageBanner == 'false' }">
								<li><a id="homePageBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.Estimates" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="miniBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="miniBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.customerStatements" /></a> </li>
		                        <c:set var="miniBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && miniBanner == 'false' }">
								<li><a id="miniBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.customerStatements" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="homePageDeals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageDeals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.Customers" /></a> </li>
		                        <c:set var="homePageDeals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && homePageDeals == 'false' }">
								<li><a id="homePageDeals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.Customers" /></a> </li>
	                        </c:if>
	                    </c:forEach>

	                    <c:set var="newArrivals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="newArrivals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.ProductNservices" /></a> </li>
		                        <c:set var="newArrivals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && newArrivals == 'false' }">
								<li><a id="newArrivals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.ProductNservices" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    --<c:set var="featuredProducts" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true && accessControl.read == false}">
								<li><a id="featuredProducts" onclick="newFeaturedProductGroupMaster('featuredProducts')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
		                        <c:set var="featuredProducts" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredProducts == 'false' }">
								<li><a id="featuredProducts" onclick="viewFeaturedProducts('featuredProducts','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
                     	<c:set var="paymentGateway" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && accessControl.write == true && accessControl.read == false}">
								<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>
		                        <c:set var="paymentGateway" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && paymentGateway == 'false' }">
								<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>	
	                    <c:set var="events" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'Events' && accessControl.write == true && accessControl.read == false}">
								<li><a id="events" onclick="newEvent('events')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
		                        <c:set var="events" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'Events' && events == 'false' }">
								<li><a id="events" onclick="viewEvents('events','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="shoppinglist" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true && accessControl.read == false}">
								<li><a id="shoppinglist" onclick="viewDealCategories('dealCategories')"><i class="fa fa-angle-double-right"></i> <spring:message code="shoppinglist.label" /></a> </li>
		                        <c:set var="shoppinglist" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'ShoppingList' && shoppinglist == 'false' }">
								<li><a id="shoppinglist" onclick="viewShoppingList('shoppinglist')"><i class="fa fa-angle-double-right"></i> <spring:message code="shoppinglist.label" /></a> </li>
	                        </c:if>
	                    </c:forEach> --
	                    
	                    
               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 </ul>
                   				</li>
                   			</c:if>
                   		</c:forEach>
                    --%>
                   <!--sales end  -->
                   
                   <!-- Purchases start -->
             <%--      <c:if test="${sessionScope.role == 'super admin'}">
                        <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="Purchases.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
            				<ul id="ulb2cConfig" class="treeview-menu">
								<li><a id="SalesEstimate" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Bills" /></a> </li>
								<li><a id="SalesCustomerStatements" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Receipts" /></a> </li>
								<li><a id="SalesCustomers" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Vendors" /></a> </li>
                     			<li><a id="SalesProductNservices" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.ProductNservices" /></a> </li>
        					</ul>
               			</li> 
               			</c:if>

               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="Purchases.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		            					<ul id="ulb2cConfig" class="treeview-menu">
                   			</c:if>
                   		</c:forEach>
                   		<c:set var="homePageBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Bills" /></a> </li>
		                        <c:set var="homePageBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && homePageBanner == 'false' }">
								<li><a id="homePageBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Bills" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="miniBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="miniBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Receipts" /></a> </li>
		                        <c:set var="miniBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && miniBanner == 'false' }">
								<li><a id="miniBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Receipts" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="homePageDeals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageDeals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Vendors" /></a> </li>
		                        <c:set var="homePageDeals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && homePageDeals == 'false' }">
								<li><a id="homePageDeals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Purchases.menu.Vendors" /></a> </li>
	                        </c:if>
	                    </c:forEach>

	                    <c:set var="newArrivals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="newArrivals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.ProductNservices" /></a> </li>
		                        <c:set var="newArrivals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && newArrivals == 'false' }">
								<li><a id="newArrivals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="sales.menu.ProductNservices" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    --<c:set var="featuredProducts" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true && accessControl.read == false}">
								<li><a id="featuredProducts" onclick="newFeaturedProductGroupMaster('featuredProducts')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
		                        <c:set var="featuredProducts" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredProducts == 'false' }">
								<li><a id="featuredProducts" onclick="viewFeaturedProducts('featuredProducts','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="featured.products.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
                     	<c:set var="paymentGateway" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && accessControl.write == true && accessControl.read == false}">
								<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>
		                        <c:set var="paymentGateway" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && paymentGateway == 'false' }">
								<li><a id="paymentGateway" onclick="viewPaymentGateway('paymentGateway')"><i class="fa fa-angle-double-right"></i> <spring:message code="payment.gateway.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>	
	                    <c:set var="events" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'Events' && accessControl.write == true && accessControl.read == false}">
								<li><a id="events" onclick="newEvent('events')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
		                        <c:set var="events" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'Events' && events == 'false' }">
								<li><a id="events" onclick="viewEvents('events','0','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="events.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="shoppinglist" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'ShoppingList' && accessControl.write == true && accessControl.read == false}">
								<li><a id="shoppinglist" onclick="viewDealCategories('dealCategories')"><i class="fa fa-angle-double-right"></i> <spring:message code="shoppinglist.label" /></a> </li>
		                        <c:set var="shoppinglist" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'ShoppingList' && shoppinglist == 'false' }">
								<li><a id="shoppinglist" onclick="viewShoppingList('shoppinglist')"><i class="fa fa-angle-double-right"></i> <spring:message code="shoppinglist.label" /></a> </li>
	                        </c:if>
	                    </c:forEach>--
	                    
	                    
               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 </ul>
                   				</li>
                   			</c:if>
                   		</c:forEach> --%>
                   <!--purchases end  -->
                   
                   <!--Accounting start-->
                   
                  <%--  <c:if test="${sessionScope.role == 'super admin'}">
                        <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="Accounting.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
            				<ul id="ulb2cConfig" class="treeview-menu">
								<li><a id="SalesEstimate" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Transactions" /></a> </li>
								<li><a id="SalesCustomerStatements" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Reconciliation" /></a> </li>
								<li><a id="SalesCustomers" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Assets" /></a> </li>
                     			<li><a id="SalesProductNservices" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Liabilities" /></a> </li>
                     			<li><a id="SalesCustomers" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Income" /></a> </li>
                     			<li><a id="SalesProductNservices" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Expenses" /></a> </li>
        					</ul>
               			</li> 
               			</c:if>

               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 <li class="treeview" id="lib2cConfig" style="cursor: pointer;"><a id="b2cConfigurations" onclick="showB2cFlows();"><i class="fa fa-image"></i><span><spring:message code="Accounting.configuration.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		            					<ul id="ulb2cConfig" class="treeview-menu">
                   			</c:if>
                   		</c:forEach>
                   		<c:set var="homePageBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Transactions" /></a> </li>
		                        <c:set var="homePageBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageBanner' && homePageBanner == 'false' }">
								<li><a id="homePageBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Transactions" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="miniBanner" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && accessControl.write == true && accessControl.read == false}">
								<li><a id="miniBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Reconciliation" /></a> </li>
		                        <c:set var="miniBanner" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'MiniBanner' && miniBanner == 'false' }">
								<li><a id="miniBanner" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Reconciliation" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                    <c:set var="homePageDeals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="homePageDeals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Assets" /></a> </li>
		                        <c:set var="homePageDeals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'HomePageDeals' && homePageDeals == 'false' }">
								<li><a id="homePageDeals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Assets" /></a> </li>
	                        </c:if>
	                    </c:forEach>

	                    <c:set var="newArrivals" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && accessControl.write == true && accessControl.read == false}">
								<li><a id="newArrivals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Liabilities" /></a> </li>
		                        <c:set var="newArrivals" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'NewArrivals' && newArrivals == 'false' }">
								<li><a id="newArrivals" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Liabilities" /></a> </li>
	                        </c:if>
	                    </c:forEach>
	                     <c:set var="featuredProducts" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && accessControl.write == true && accessControl.read == false}">
								<li><a id="featuredProducts" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Income" /></a> </li>
		                        <c:set var="featuredProducts" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'FeaturedProducts' && featuredProducts == 'false' }">
								<li><a id="featuredProducts" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Income" /></a> </li>
	                        </c:if>
	                    </c:forEach>
                     	<c:set var="paymentGateway" value="false" />
                   		<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && accessControl.write == true && accessControl.read == false}">
								<li><a id="paymentGateway" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Expenses" /></a> </li>
		                        <c:set var="paymentGateway" value="true" />
	                        </c:if>
	                        <c:if test="${accessControl.appDocument == 'PaymentGateway' && paymentGateway == 'false' }">
								<li><a id="paymentGateway" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Expenses" /></a> </li>
	                        </c:if>
	                    </c:forEach>	
	                   
	                    
	                    
               			<c:forEach var="accessControl" items="${sessionScope.b2cManagement}" varStatus="theCount">
                   			<c:if test="${theCount.count == 1}">
                   				 </ul>
                   				</li>
                   			</c:if>
                   		</c:forEach> --%>
                   
                   <!--Accounting end -->
                   
                   
<%--                           	
       			<c:if test="${sessionScope.role == 'super admin'}">
       				 <li class="treeview" id="liOrderManagement" style="cursor: pointer;"> <a onclick="showOrderManagementFlows()"> <i class="fa fa-cart-plus"></i> <span><spring:message code="Financial.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                            <ul id="ulOrderManagement" class="treeview-menu">
       				<li class="treeview" id="liOrderManagement"  style="cursor: pointer;"><a onclick="showOrderManagementFlows();"><i class="fa fa-cart-plus"></i><spring:message code="order.management.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulOrderManagement" class="treeview-menu">
                  						<li id="liSalesOrders"><a onclick="showSalesOrderFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="sales.orders.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulSalesOrders" class="treeview-menu">
		                            			<li><a id="newSalesOrders" onclick="viewOrders('all','newSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="submitted.orders.label" /></a> </li>
		                               			<li><a id="confirmedSalesOrders" onclick="viewOrders('Confirmed','confirmedSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="confirmed.label" /></a> </li>
		                               			<li><a id="pendingSalesOrders" onclick="viewOrders('Pending','pendingSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.label" /></a> </li>
		                               			<li><a id="cancelledSalesOrders" onclick="viewOrders('Cancelled','cancelledSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="cancelled.label" /></a> </li>
		                               			<li><a id="shippedSalesOrders" onclick="viewOrders('Shipped','shippedSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipped.label" /></a> </li>
		                               			<li><a id="fulfilledSalesOrders" onclick="viewOrders('Delivered','fulfilledSalesOrders','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="fullfilled.orders.label" /></a> </li>        
		                  					</ul>
		                  				</li>  
		                  				<li id="liFulfillmentOrders"><a onclick="showFulfilmentOrders()"><i class="fa fa-angle-double-right"></i><spring:message code="fulfillment.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulFulfillmentOrders" class="treeview-menu">
		                            			<li><a id="newFulfillmentOrders" onclick="viewOutletShipments('all','newFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipments.label" /></a> </li>
		                               			<li><a id="pendingFulfillmentOrders" onclick="viewOutletShipments('Ready','pendingFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.label" /></a> </li>
		                               			<li><a id="confirmedFulfillmentOrders" onclick="viewHomePageDeals('confirmedFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.notes.label" /></a> </li>
		                               			<li><a id="cancelledFulfillmentOrders" onclick="viewOutletShipments('Rejected','cancelledFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="returned.bills.label" /></a> </li>
		                               			<li><a id="shippedFulfillmentOrders" onclick="viewOutletShipments('Delivered','shippedFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="delivered.order.label" /></a> </li>
		                               			<li><a id="fulfilledFulfillmentOrders" onclick="viewHomePageDeals('fulfilledFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.of.landing" /></a> </li>        
		                  					</ul>
		                  				</li> 
		                  				<li id="liPaymentsOrders"><a onclick="showOrderPayments();"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.payments.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulPaymentsOrders" class="treeview-menu">
		                            			<li><a id="newPaymentsOrders" onclick="viewHomePageDeals('newPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bills.label" /></a> </li>
		                               			<li><a id="pendingPaymentsOrders" onclick="viewHomePageDeals('pendingPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.payments.label" /></a> </li>
		                               			<li><a id="fulfilledPaymentsOrders" onclick="viewHomePageDeals('fulfilledPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.payments.label" /></a> </li>        
		                  					</ul>
		                  				</li>   
                  					</ul>
                  		</li>	
                  	</c:if>	
                  	
                  	<li class="treeview" id="liOrderManagementLi" style="cursor: pointer;"><a onclick="showOrderManagementFlows()"><i class="fa fa-cart-plus "></i><span><spring:message code="order.management.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
                       <ul id="ulOrderManagementUl" class="treeview-menu">
               		<c:set var="salesOrderAdded" value="false"/> 
                  	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}">
       						<li id="liSalesOrdersLi" style=""><a onclick="showSalesOrderFlows();"><i class="fa fa-angle-double-right"></i><spring:message code="sales.orders.label" /><i class="fa fa-angle-left pull-right"></i></a>
                  					<ul id="ulSalesOrdersUl" class="treeview-menu">
		                  			<c:set var="salesOrderAdded" value="true"/> 
       						</c:if>
       				</c:forEach>
       				<c:set var="salesOrderNewAdded" value="false"/> 
                  	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}" varStatus="theCount">
                  		<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.read == false && accessControl.write == true && salesOrderNewAdded == false}"> 
       							<li><a id="newSalesOrderManagement" onclick="return viewNewOrder('SalesOrderManagement','','management');"><i class="fa fa-angle-double-right"></i><spring:message code="new.order" /></a>
		                  		<c:set var="salesOrderNewAdded" value="true"/> 
       					</c:if>
       				</c:forEach>
       				<c:if test="${salesOrderAdded == 'true' && salesOrderNewAdded == 'false'}">
	       				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}">
	       						<li><a id="${accessControl.appDocumentActivity}SalesOrderManagement" onclick="viewOrders('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}SalesOrderManagement','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
	     				</c:forEach> 
     				</c:if>
       				<c:if test="${salesOrderAdded == 'true'}">
       					</ul>
		             </li>  
       				</c:if>
       				<c:set var="salesOrderFulfilmentAdded" value="false"/> 			
	                 <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}">
       							<li id="liFulfillmentOrders"><a onclick="showFulfilmentOrders()"><i class="fa fa-angle-double-right"></i><spring:message code="fulfillment.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  			<ul id="ulFulfillmentOrders" class="treeview-menu">
		                  			<c:set var="salesOrderFulfilmentAdded" value="true"/> 	
       						</c:if>
       				</c:forEach>
       				<c:set var="fulfillmentOrderNewAdded" value="false"/> 
                  	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}" varStatus="theCount">
                  		<c:if test="${accessControl.appDocument == 'OrderManagementFulFillment' && accessControl.read == false && accessControl.write == true && fulfillmentOrderNewAdded == false}"> 
       							<li><a id="newFulfilmentOrderManagement" onclick="return viewNewShipment('newFulfilmentOrderManagement','management');"><i class="fa fa-angle-double-right"></i><spring:message code="new.shipment.label" /></a>
		                  		<c:set var="fulfillmentOrderNewAdded" value="true"/> 
       					</c:if>
       				</c:forEach>
       				<c:if test="${fulfillmentOrderNewAdded == 'false'}">
	       				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilmentActivity}" >
	       					<c:if test="${accessControl.activityRead == false}">
	       						<li><a id="${accessControl.appDocumentActivity}FulfilmentOrderManagement" onclick="viewOutletShipments('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}FulfilmentOrderManagement','0','management','management','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
	       					</c:if>
	     				</c:forEach>
	     			</c:if>
                		<li><a id="newFulfillmentOrders" onclick="viewOutletShipments('all','newFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.shipments.label" /></a> </li>
              			<li><a id="pendingFulfillmentOrders" onclick="viewOutletShipments('Ready','pendingFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.label" /></a> </li>
              			<li><a id="cancelledFulfillmentOrders" onclick="viewOutletShipments('Rejected','cancelledFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="returned.bills.label" /></a> </li>
              			<li><a id="shippedFulfillmentOrders" onclick="viewOutletShipments('Delivered','shippedFulfillmentOrders','0','management','','menu')"><i class="fa fa-angle-double-right"></i> <spring:message code="delivered.order.label" /></a> </li>
              		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementShipmentNotes'}"> 
   							<li><a id="confirmedFulfillmentOrders" onclick="viewHomePageDeals('confirmedFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="shipment.notes.label" /></a> </li>
   						</c:if>
     				</c:forEach>  
     				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementBillOfLading'}"> 
   							<li><a id="fulfilledFulfillmentOrders" onclick="viewHomePageDeals('fulfilledFulfillmentOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.of.landing" /></a> </li>
   						</c:if>
     				</c:forEach> 
                  	<c:if test="${salesOrderFulfilmentAdded == 'true'}">
       					</ul>
		             </li>  
       				</c:if>		
       				<c:set var="salesOrderPaymentsAdded" value="false"/> 					
		            <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}" varStatus="theCount">
       					<c:if test="${theCount.count == 1}">
       						<li id="liPaymentsOrders"><a onclick="showOrderPayments();"><i class="fa fa-angle-double-right"></i><spring:message code="warehouse.payments.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  		<ul id="ulPaymentsOrders" class="treeview-menu">
		                  		<c:set var="salesOrderPaymentsAdded" value="true"/> 		
       					</c:if>
       				</c:forEach>    
       				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementBills'}"> 
   							<li><a id="newPaymentsOrders" onclick="viewHomePageDeals('newPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="bills.label" /></a> </li>
   						</c:if>
     				</c:forEach>  
     				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementBillsPayments'}"> 
   							<li><a id="pendingPaymentsOrders" onclick="viewHomePageDeals('pendingPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse.payments.label" /></a> </li>
   						</c:if>
     				</c:forEach>  
     				<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}">
            			<c:if test="${accessControl.appDocument == 'OrderManagementPendingPayments'}"> 
   							<li><a id="fulfilledPaymentsOrders" onclick="viewHomePageDeals('fulfilledPaymentsOrders');"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.payments.label" /></a> </li> 
   						</c:if>
     				</c:forEach>  					
	              <c:if test="${salesOrderPaymentsAdded == 'true'}">
      					</ul>
	             	</li>  
      			  </c:if>	    				
         			</ul>
         		</li>
                    --%>
                    
                    
                    
                  <!--Add the finantial management flow by manideep-->   
                 <%--By Manideep: Edited the flow for the puropos of roles, implemented roles  --%>
                 
                  <c:set var="rolesManagement" value="${sessionScope.Finantial}"/>
                    <c:if test="${sessionScope.role == 'super admin'}">
	                           <li class="treeview" id="liAccountAccessControl" style="cursor: pointer;"><a onclick="showFinancialManagementFlow();"><i class="fa fa-user"></i><span><spring:message code="Financial.management.label" /></span><i class="fa fa-angle-left pull-right"></i> </a>
	                            <ul id="ulAccountAccessControl" class="treeview-menu">
	                             	<%-- <li ><a id="role" onClick=""><i class="fa fa-angle-double-right"></i><spring:message code="sales.configuration.label" /></a></li>
	                             	<li ><a id="role" onClick=""><i class="fa fa-angle-double-right"></i><spring:message code="Purchases.configuration.label" /></a></li> --%>
	                             	<li id="Account-details"><a onclick="showAccountingFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.configuration.label" /><i class="fa fa-angle-left pull-right"></i></a>
	                  					<ul id="ulAccountDetails" class="treeview-menu">
	                            			<li><a id="allUsers" onclick="viewOrganizationMaster('','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.configuration.Organisation" /></a> </li>
	                            			<li><a id="allUsers" onclick="accountingAssets('','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Assets" /></a> </li>
	                               			<li><a id="activeUsers"onclick="accountingLiabilities('','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Liabilities" /></a> </li>
	                  					    <li><a id="suspendedUsers" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Income" /></a></li>
	                  					     <li><a id="suspendedUsers" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Expenses" /></a></li>
	                  					     <li id=""><a onclick="viewcustomerRetention('','','','');"><i class="fa fa-angle-double-right"></i><spring:message code="Equity.label" /></a></li>
		                  					<li id="reconciliation"><a onclick="accountingReconciliationSummary('clear','reconciliation','0')"><i class="fa fa-angle-double-right"></i><spring:message code="Reconciliation.label" /></a></li>
	                  						<li><a id="journal" onclick="accountingjournal('View','journal','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.journal" /></a></li>
	                  						<li><a id="creditNote"  onclick="creditNoteSummary('clear','creditNote','');"><i class="fa fa-angle-double-right"></i><spring:message code="credit.note.label" /></a></li>
	                  						<li><a  id="debitNote" onclick="accountingDebitNoteSummary('clear','debitNote','');"><i class="fa fa-angle-double-right"></i><spring:message code="debit.note.label" /></a></li>
	                  					
	                  					</ul>
	                  				</li>
	                  				
	                  				<li id="purchasesPayments"><a onclick="getPurchasesAndPayments('back','purchasesPayments','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.PurchasesandPayments.label" /></a></li>
	                  				<li id="salesandpayments"><a onclick="getSalesAndPayments('back','salesandpayments','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.SalesandPayments.label" /></a></li>
	                  				<li id="pettyCash"><a onclick="getPettyCash('back','pettyCash','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.PettyCash.label" /></a></li>
	                  				<li id="advanceandpayments"><a onclick="getAdvancesAndPayments('back','advancesandpayments','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.AdvanceandPayments.label" /></a></li>
	                  				
	                  				<li id=""><a onclick="showReportsFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="Reports.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="" class="treeview-menu">		                  					
		                            			<li><a id="profitability" onclick="profitability('profitability');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.profitability" /></a> </li>
		                            			<li><a id="taxation" onclick="taxation('taxation');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.taxation" /></a> </li>
		                               			<li><a id="receivable" onclick="receivable('receivable');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.receivable" /></a> </li>
		                  					    <li><a id="payables" onclick="payables('payables');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.payables" /></a></li>
		                  					     <li><a id="deep" onclick="deep('deep');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.deep" /></a></li>
		                  					</ul>
	                  				</li>	
	                  				
	                  					
	                  				
	                  			  </ul>
	                  		    </li>
	                        </c:if>
	                        
	               			 <c:forEach var="accessControl" items="${sessionScope.Finantial}" varStatus="theCount">
		                         <c:if test="${theCount.count == 1}">         
			                        <li class="treeview" id="liAccountAccessControl" style="cursor: pointer;"><a onclick="showFinancialManagementFlow();"><i class="fa fa-user"></i><span><spring:message code="Financial.management.label" /></span><i class="fa fa-angle-left pull-right"></i> </a>
			                          <ul id="ulAccountAccessControl" class="treeview-menu">
			                     </c:if>
			                 </c:forEach>
	                            
	                             <c:set var="rolesAccounting" value="false"/>
	                             <c:set var="rolesReports" value="false"/>
   	
                            	<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		 <c:if test="${accessControl.appSubflow == 'FAccounting' && accessControl.read == true}">
		                            	<c:set var="rolesAccounting" value="true"/> 
		                            </c:if>
		                         </c:forEach> 
	                            	<c:if test="${rolesAccounting==true}"> 
		                            	<li id="Account-details"><a onclick="showAccountingFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.configuration.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulAccountDetails" class="treeview-menu">
		                  			</c:if>
		                  			
		                  			<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'OrganizationMaster' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="OrganizationMaster" onclick="viewOrganizationMaster('OrganizationMaster','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.configuration.Organisation" /></a> </li>
		                            </c:if>
                  					</c:forEach> 
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FAssets' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="Assets" onclick="accountingAssets('Assets','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Assets" /></a> </li>
		                             </c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FLiabilities' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="liabilities" onclick="accountingLiabilities('liabilities','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Liabilities" /></a> </li>
		                  			</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FIncome' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="income" onclick="accountingIncome('income','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Income" /></a></li>
		                  			</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FExpences' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="expenses" onclick="accountingExpenses('expenses','clear','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.Expenses" /></a></li>		                  					    
		                  			</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FEquity' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="equity" onclick="viewcustomerRetention('','equity','','');"><i class="fa fa-angle-double-right"></i><spring:message code="Equity.label" /></a></li>
		                  			</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FReconciliation' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="reconciliation" onclick="accountingReconciliationSummary('clear','reconciliation','0')"><i class="fa fa-angle-double-right"></i><spring:message code="Reconciliation.label" /></a></li>
		                  			</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FJournal' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="journal" onclick="accountingjournal('View','journal','');"><i class="fa fa-angle-double-right"></i> <spring:message code="Accounting.menu.journal" /></a></li>
	                  				</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FCreditNote' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="creditNote" onclick="creditNoteSummary('clear','creditNote','');"><i class="fa fa-angle-double-right"></i><spring:message code="credit.note.label" /></a></li>
		                  			</c:if>
                  					</c:forEach>
                  					
                  					<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FDebitNote' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="debitNote" onclick="accountingDebitNoteSummary('clear','debitNote','');"><i class="fa fa-angle-double-right"></i><spring:message code="debit.note.label" /></a></li>
		                  			</c:if>
                  					</c:forEach>
		                  						
		                            			
		                  			<c:if test="${rolesAccounting==true}">
		                  					</ul>
		                  				</li>
                  					</c:if>
                  			
                  				
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FPurchasesPayments' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="purchasesPayments" onclick="getPurchasesAndPayments('back','purchasesPayments','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.PurchasesandPayments.label" /></a></li>
		                            </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FSalesandPayments' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="salesandpayments" onclick="getSalesAndPayments('back','salesandpayments','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.SalesandPayments.label" /></a></li>
		                            </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FPettyCash' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="pettyCash" onclick="getPettyCash('back','pettyCash','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.PettyCash.label" /></a></li>
		                            </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FAdvanceandPayments' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="advanceandpayments" onclick="getAdvancesAndPayments('back','advancesandpayments','','false')"><i class="fa fa-angle-double-right"></i><spring:message code="Accounting.AdvanceandPayments.label" /></a></li>
		                            </c:if>
                  				</c:forEach> 
                  					          
								<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appSubflow == 'FReports' && accessControl.read == true}">
		                            	<c:set var="rolesReports" value="true"/> 
		                            </c:if>
		                        </c:forEach> 
		                        
	                            	<c:if test="${rolesReports == true}"> 			
										<li id=""><a onclick="showReportsFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="Reports.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="" class="treeview-menu">
		                  					
		                  			</c:if>
		                  			
		                  			<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FProfitability' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="profitability" onclick="profitability('profitability');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.profitability" /></a> </li>
		                            </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FTaxation' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="taxation" onclick="taxation('taxation');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.taxation" /></a> </li>
		                            </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FReceivable' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="receivable" onclick="receivable('receivable');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.receivable" /></a> </li>
		                  		  </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FPayables' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="payables" onclick="payables('payables');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.payables" /></a></li>
		                  		  </c:if>
                  				</c:forEach> 
                  				
                  				<c:forEach var="accessControl" items="${sessionScope.Finantial}">
                            		<c:if test="${accessControl.appDocument == 'FDeepAnalysis' && accessControl.write == true && accessControl.read == true}">
		                            	<li><a id="deep" onclick="deep('deep');"><i class="fa fa-angle-double-right"></i> <spring:message code="Reports.deep" /></a></li>
		                  			</c:if>
                  				</c:forEach> 
                  				
		                       <c:if test="${rolesReports == true}">
		                  					</ul>
	                  					</li>
                  					</c:if>
                  				
                  				
                  				
                  				
                  			<c:forEach var="accessControl" items="${sessionScope.Finantial}" varStatus="theCount">
		                         <c:if test="${theCount.count == 1}">         
					                       </ul>
			                        </li>
			                     </c:if>
			                 </c:forEach>
                    
                   
    <!--////////////////// End of finantial management -->               		 
                   		 <c:forEach var="accessControl" items="${sessionScope.Reports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">         
                        <li id="reports" style="cursor: pointer;display: none;">
                            	   <a onclick="showReportsFlows()"><i class="fa fa-pie-chart"></i> <spring:message code="report.and.analytics.label" /><i class="fa fa-angle-left pull-right"></i></a>
                            	   <ul id="ulReports" class="treeview-menu">
                          </c:if>
			            </c:forEach> 
			            
			            <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">         
                            	      <li id="liOutletReports" style="display: none;">
								        <a id="outletReports" onclick="showOutletReportsFlows('outletReports');">
								         <i class="fa fa-angle-double-right"></i> <spring:message code="outlet_management.reports.label" />
								         <i class="fa fa-angle-left pull-right"></i>
								        </a>
								        <ul id="ulOutletReports" class="treeview-menu">
								        
						</c:if>
						</c:forEach>
						
						
								         <li id="liOutletSalesReports">
								         
								         <c:set var="myNumber" value="0"/>
						 <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}"  varStatus="theCount">
						 
						 <c:set var="myNumber" value="${myNumber+1}"/>
						 <c:if test="${myNumber == 1}">
						 
								           <a id="outletSalesReports" onclick="showOutletSalesReportsFlows('outletSalesReports','');">
								            <i class="fa fa-angle-double-right"></i> <spring:message code="sales.reports.label" />
								            <i class="fa fa-angle-left pull-right"></i>
								          </a>
								          </c:if>
								       
								       </c:forEach>
								          <ul id="ulOutletSalesReports" class="treeview-menu">
								          <c:if test="${sessionScope.role == 'super admin'}">
								          	 <li><a id="outletXReadingReport" onclick="viewOutletXReadingReport('outletXReadingReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="xreading.reports.label" /></a></li>
								             <li><a id="outletZReadingReport" onclick="viewOutletZReadingReport('outletZReadingReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="zreading.reports.label" /></a></li>
											 <li><a id="outletXZReadingReport" onclick="viewOutletXZReadingReportDifference('outletXZReadingReport','0','')"><i class="fa fa-angle-double-right"></i> <spring:message code="xzreading.reports.label" /></a></li>
								             <li><a id="salesReportDateWise" onclick="viewSalesReportsCriteriaWise('salesReportDateWise','date','');"><i class="fa fa-angle-double-right"></i> <spring:message code="date.wise.sales.label" /></a></li>
								             <li><a id="salesReportCounterWise" onclick="viewSalesReportsCriteriaWise('salesReportCounterWise','counter','');"><i class="fa fa-angle-double-right"></i> <spring:message code="counter.wise.label" /></a></li>
								             <li><a id="salesReportCategoryWise" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWise','category','');"><i class="fa fa-angle-double-right"></i> <spring:message code="category.wise.label" /></a></li>
								             <li><a id="salesReportDepartmentWise" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWise','Department','');"><i class="fa fa-angle-double-right"></i> <spring:message code="department.wise" /></a></li>
											 <li><a id="salesReporthourWise" onclick="viewSalesReportsCriteriaWise('salesReporthourWise','hour','');"><i class="fa fa-angle-double-right"></i> <spring:message code="hour.wise.sales.label" /></a></li>
											 <li><a id="salesReportSkuWise" onclick="viewSalesReportsCriteriaWise('salesReportSkuWise','skuSales','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.wise.label" /></a></li>
 								             <li><a id="salesReportSupplierWise" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWise','supplier','');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.wise.label" /></a></li>
								             <li><a id="salesReportPriceVariation" onclick="viewSalesPriceVariationReport('salesReportPriceVariation','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sale.price.variation.label" /></a></li>
								             <li><a id="salesReportTaxWise" onclick="viewSalesReportsCriteriaWise('salesReportTaxWise','tax','');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.label" /></a></li>
								             <li><a id="dueCollection" onclick="viewSalesReportsCriteriaWise('dueCollection','duecollection','');"><i class="fa fa-angle-double-right"></i> <spring:message code="due.collection.label" /></a></li>
								              <li><a id="creditsales" onclick="viewSalesReportsCriteriaWise('creditsales','creditsales','');"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.sales.label" /></a></li>
								          	  <li><a id="serialBillSales" onclick="viewSerialBillSalesReports('serialBillSales','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.report.label" /></a></li>
								         		<li><a id="salesCouponIssueId" onclick="viewSalesCouponReports('salesCouponIssueId','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.coupon.issue" /></a></li>
								         		<li><a id="salesVoucherIssueId" onclick="viewSalesVoucherReports('salesVoucherIssueId','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.Voucher.issue" /></a></li>
								         		<li><a id="PersonWiseReportId" onclick="viewPersonWiseReports('PersonWiseReportId','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.person.Wise.issue" /></a></li>
								          </c:if>
								          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesX'}">
								            	<li><a id="outletXReadingReport" onclick="viewOutletXReadingReport('outletXReadingReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="xreading.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesZ'}">
								            	<li><a id="outletZReadingReport" onclick="viewOutletZReadingReport('outletZReadingReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="zreading.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesXZ'}">
												<li><a id="outletXZReadingReport" onclick="viewOutletXZReadingReportDifference('outletXZReadingReport','0','')"><i class="fa fa-angle-double-right"></i> <spring:message code="xzreading.reports.label" /></a></li>
								            </c:if>
								            </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesDateWise'}">
								            	<li><a id="salesReportDateWise" onclick="viewSalesReportsCriteriaWise('salesReportDateWise','date','');"><i class="fa fa-angle-double-right"></i> <spring:message code="date.wise.sales.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCounterWise'}">
								            	<li><a id="salesReportCounterWise" onclick="viewSalesReportsCriteriaWise('salesReportCounterWise','counter','');"><i class="fa fa-angle-double-right"></i> <spring:message code="counter.wise.label" /></a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCategoryWise'}">
												<li><a id="salesReportCategoryWise" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWise','category','');"><i class="fa fa-angle-double-right"></i> <spring:message code="category.wise.label" /></a></li>
											</c:if>
										   </c:forEach>
										     <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesDepartmentWise'}">
												<li><a id="salesReportDepartmentWise" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWise','Department','');"><i class="fa fa-angle-double-right"></i> <spring:message code="department.wise" /></a></li>
											</c:if>
										   </c:forEach>
										    <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCategoryWise'}">
												<li><a id="salesReportSkuWise" onclick="viewSalesReportsCriteriaWise('salesReportSkuWise','skuSales','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.wise.label" /></a></li>
											</c:if>
										   </c:forEach>
										   <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesHourWise'}">
												<li><a id="salesReporthourWise" onclick="viewSalesReportsCriteriaWise('salesReporthourWise','hour','');"><i class="fa fa-angle-double-right"></i> <spring:message code="hour.wise.sales.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										    <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesHourWiseBill'}">
												<li><a id="salesReporthourWisebill" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="hourlyBill.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										    <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesBrandWise'}">
												<li><a id="salesReportbrandWise" onclick="viewSalesReportsCriteriaWise('salesReportbrandWise','Brand','');"><i class="fa fa-angle-double-right"></i> <spring:message code="brandwise.reports.label" /></a></li>
											</c:if>
										   </c:forEach>
										     <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCategoryWise'}">
												<li><a id="salesReportSectionWise" onclick="viewSalesReportsCriteriaWise('salesReportSectionWise','Section','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sectionwise.reports.label" /></a></li>
											</c:if>
										   </c:forEach>
										   <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesSupplierWise'}">
								            	<li><a id="salesReportSupplierWise" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWise','supplier','');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.wise.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           
								             <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesPriceVariationReport'}">
								            	<li><a id="salesReportPriceVariation" onclick="viewSalesPriceVariationReport('salesReportPriceVariation','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="sale.price.variation.label" /></a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesSalesVsProcurementReport'}">
								            	<li><a id="salesReportSupplierSales" onclick="viewOutletsuppliereport('salesReportSupplierSales','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="salesvsprocurement" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesVoidReport'}">
								            	<li><a id="outletVoidReport" onclick="viewOutletVoidReport('outletVoidReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="void.item.report.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesPriceOverride'}">
								            <li><a id="outletNewReport" onclick="viewOutletNewReport('outletNewReport','0','','','')"><i class="fa fa-angle-double-right"></i> <spring:message code="price.override.report.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesItemWiseTax'}">
								            <li><a id="ItemTaxReport" onclick="viewItemWiseTaxReport('ItemTaxReport','0','')"><i class="fa fa-angle-double-right"></i>Item Wise Tax Report</a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesItemWiseGST'}">
								            <li><a id="ItemTaxGSTReport" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','')"><i class="fa fa-angle-double-right"></i>Item Wise GST Report</a></li>
								            </c:if>
								           </c:forEach>
								           
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCreditNoteReport'}">
								            <li><a id="outletCreditNoteReport" onclick="viewOutletCreditNoteReport('outletCreditNoteReport','0','false','')"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.note.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           
								           
								         <!--credit note redemption report  -->
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCreditNoteRedeemReport'}">
								            <li><a id="outletCreditNoteRedeemReport" onclick="viewOutletCreditNoteRedemptionReport('outletCreditNoteRedeemReport','0','false','')"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.note.redemption.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								        <!--credit note redemption report  end-->
								           
								           
								           
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesTax'}">
								            	<li><a id="salesReportTaxWise" onclick="viewSalesReportsCriteriaWise('salesReportTaxWise','tax','');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesTenderWiseSales'}">
												<li><a id="tenderWiseSales" onclick="viewTenderWiseSales('tenderWiseSales','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.tender.wise.sales.label" /></a></li>
										 </c:if>
										   </c:forEach> 
										   
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesDueCollection'}">
												<li><a id="dueCollection" onclick="viewSalesReportsCriteriaWise('dueCollection','duecollection','');"><i class="fa fa-angle-double-right"></i> <spring:message code="due.collection.label" /></a></li>
											</c:if>
										   </c:forEach>
										   <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesManSales'}">
								           <li><a id="outletSalesmanCommission" onclick="viewSalesmanCommission('outletSalesmanCommission','0','false','');"><i class="fa fa-angle-double-right"></i> <spring:message code="salesman.commission.label" /></a></li>

								            </c:if>
								           </c:forEach>
								           
								           
								           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesMenSales'}">
								           <li><a id="outletSalesmenSalesCommission" onclick="viewNewSalesmanCommission('outletSalesmenSalesCommission','0','false','');"><i class="fa fa-angle-double-right"></i> <spring:message code="salesmenCommission.label" /></a></li>

								            </c:if>
								           </c:forEach>
								           
										   <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCreditSales'}">
												<li><a id="creditsales" onclick="viewSalesReportsCriteriaWise('creditsales','creditsales','');"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.sales.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										     <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesSerialBillReport'}">
												<li><a id="serialBillSales" onclick="viewSerialBillSalesReports('serialBillSales','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.report.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										   
										    <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCouponReport'}">
												<li><a id="salesCouponIssueId" onclick="viewSalesCouponReports('salesCouponIssueId','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.coupon.issue" /></a></li>
								          </c:if>
										   </c:forEach>
										   
										   <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesVoucherReport'}">
												<li><a id="salesVoucherIssueId" onclick="viewSalesVoucherReports('salesVoucherIssueId','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.Voucher.issue" /></a></li>
											 </c:if>
										   </c:forEach>
										   
										   
										   <%--  <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesSerialBillReport'}">
												<li><a id="PersonWiseReportId" onclick="viewPersonWiseReports('PersonWiseReportId','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.person.Wise.issue" /></a></li>
								       		 </c:if>
										   </c:forEach> --%>
										 <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesPersonWiseReport'}">
												<li><a id="PersonWiseReportId" onclick="viewDeliveryPersonWiseReports('PersonWiseReportId','0','','');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.Delievy.person.Wise" /></a></li>
								       		 </c:if>
										   </c:forEach>
										   
										    <!--Cashier efficiency report  -->
								            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCashierEfficiencyReport'}">
								            <li><a id="outletCashierEfficiencyReport" onclick="viewOutletCashierEfficiencyReport('outletCashierEfficiencyReport','0','false','')"><i class="fa fa-angle-double-right"></i> <spring:message code="cashier.efficeency.report" /></a></li>
								            </c:if>
								           </c:forEach>
								        <!--cashier efficiency report  end-->
								        
								        <!--Price Change Report  -->
								          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesPriceChangeReport'}">
								            <li><a id="outletPriceChangeReport" onclick="viewOutletPriceChangeReport('outletPriceChangeReport','0','','','clear','')"><i class="fa fa-angle-double-right"></i> <spring:message code="price.change.report.label" /></a></li>
								            </c:if>
								           </c:forEach> 
								        <!--Price Change Report end -->
								        
								         <!--Price Change Report  -->
								         <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesCashierShortageReport'}">
								            <li><a id="cashierShortageReport" onclick="viewCashierShortageReport('cashierShortageReport','0','','clear','')"><i class="fa fa-angle-double-right"></i><spring:message code="cashier.shortage.report.label" /></a></li>
								        </c:if>
								        </c:forEach>
								        
								        <!--Price Change Report end  -->
								        
								        <!--Standard Sales Report  -->
								        <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesStandardSalesReport'}">
								        <li><a id="standardSalesReport" onclick="viewStandardSalesReport('standardSalesReport','0','','clear','')"><i class="fa fa-angle-double-right"></i>Standard Sales</a></li>
										</c:if>
										</c:forEach>
										
										<c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesStandardSalesDetailedReport'}">
										<li><a id="standardSalesDetailedReport" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','0','','clear','')"><i class="fa fa-angle-double-right"></i>Standard Sales Detailed</a></li>
										</c:if>
										</c:forEach>
										<!--Standard Sales Report end -->
										
										<!--Event Summary Report -->
									<!--Event DashBoard Summary Report -->
										<c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'EventsDashboardReport'}">
								            	<li><a id="eventsSummaryReport" onclick="viewEventsSummaryReport('eventsSummaryReport','0','outlet');"><i class="fa fa-angle-double-right"></i> Events Dashboard</a></li>
								            </c:if>
								           </c:forEach>
								           
								           <!--Event Details Report -->
										<c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'EventsSummaryReport'}">
								            	<li><a id="eventsReport" onclick="viewEventsReport('eventsReport','0','outlet');"><i class="fa fa-angle-double-right"></i> Events Summary</a></li>
								            </c:if>
								           </c:forEach>
								           
								           <!--Event Details Report -->
										<c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'BillWiseReport'}">
								            	<li><a id="billWiseReport" onclick="viewBillWiseReport('billWiseReport','0','outlet');"><i class="fa fa-angle-double-right"></i> Bill Wise</a></li>
								            </c:if>
								           </c:forEach>
                                       

										  </ul>
								       </li>
								       
								       <input type="hidden" value="${myNumber}">
								       
								       
								        <c:if test="${sessionScope.role == 'super admin'}">
								        	 <%-- <li><a id="outletOrdersReport" onclick="showOrderReportsFlow()"><i class="fa fa-angle-double-right"></i> <spring:message code="orders.reports.label" /></a></li>
										     --%> <li><a id="outletStocksReport" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="stock.reports.label" /></a></li>
										     <li><a id="outletPurchasesReport" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="purchases.reports.label" /></a></li>
								    		 <li><a id="outletShipmentsReport" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="shipments.reports.label" /></a></li>
										     <li><a id="outletWasteManagementReport" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="waste_management.reports.label" /></a></li>
										     <li><a id="outletExpiryManagementReport" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="expiry_management.reports.label" /></a></li>
										     <li><a id="outletFinancialReport" onclick=""><i class="fa fa-angle-double-right"></i> <spring:message code="financial.reports.label" /></a></li>
										     <li><a id="outletStockVerificationReport" onclick="viewOutletStockVerificationReport('outletStockVerificationReport','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.label" /></a> </li>
										     <li ><a id="dealsReports"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" /> </a> </li>
										     <li><a id="loyaltyProgramReports"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.label" /> </a> </li>
								        </c:if>
								      <%--  <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletOrdersReports'}">
								     	   <li id="outletOrdersReport"><a onclick="showOrderReportsFlow()"><i class="fa fa-angle-double-right"></i><spring:message code="orders.reports.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulOrdersReportDetails" class="treeview-menu">
		                            			<li><a id="pendingCartReport" onclick="viewPendingCartsReports('0','','pendingCartReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="pending.cart.report" /></a> </li>
		                               			<li><a id="orderToBillReport" onclick="viewOrderToBillReports('0','clear','orderToBillReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="order.to.bill.report" /></a> </li>
		                  					</ul>
		                  				</li>
								     	   
								      	</c:if>
								     </c:forEach> --%>
								    
								     <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            			<c:if test="${accessControl.appDocument == 'OutletProfitabilityReports'}">
								            	<li><a id="salesReportProfitabilityReport" onclick="viewprofitabilityReports('salesReportProfitabilityReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="profitability.report.label" /></a></li>
								            </c:if>
								      </c:forEach> 
								      
								       <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            			<c:if test="${accessControl.appDocument == 'OutletDSRReports'}">
								            	<li><a id="salesDsrReport" onclick="viewdsrReports('salesDsrReport','0','DAILY','false');"><i class="fa fa-angle-double-right"></i> <spring:message code="dsrreport.label" /></a></li>
								            </c:if>
								      </c:forEach> 
								       <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            			<c:if test="${accessControl.appDocument == 'OutletProfitabilityReports'}">
								            	<li><a id="salesReportnewProfitabilityReport" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','0','');"><i class="fa fa-angle-double-right"></i> <spring:message code="new.report.label" /></a></li>
								            </c:if>
								      </c:forEach> 
								     <%--  <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletStockReports'}">
								     	 	<li><a id="outletStocksReport" onclick="viewOMStockReports('outletStocksReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.reports.label" /></a></li>
								      	</c:if>
								     </c:forEach> --%>
								     
								 <!--Stock Reports Start  -->
								     <c:set var="outletStockExpReprtsAdded" value="false"/> 					
							            <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}" varStatus="theCount">
					       					<c:if test="${theCount.count == 1}">
					       						<li id="liOutletStockReprts" style="cursor: pointer;"><a onclick="showStockReportsFlow('outletStockReprts')"><i class="fa fa-angle-double-right"></i><span><spring:message code="stock.reports.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
							                  		<ul id="ulOutletStockReprts" class="treeview-menu">
							                  		<c:set var="outletStockExpReprtsAdded" value="true"/> 		
					       					</c:if>
					       				</c:forEach>  
					       				<c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
					            			<c:if test="${accessControl.appDocument == 'OutletStockReports'}">
											<li><a id="eventInventory" onclick="viewEventInventory('eventInventory','0','outlet','menu');"><i class="fa fa-angle-double-right"></i>Events Inventory</a> </li>
											</c:if>
					     				</c:forEach>
					       				 <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
					            			<c:if test="${accessControl.appDocument == 'OutletStockReports'}">
											<li><a id="outletstockAging" onclick="viewoutletstockAging('outletstockAging','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="stockaging.label" /></a> </li>
											</c:if>
					     				</c:forEach> 
					     				
					     				 
					     				<c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
					            			<c:if test="${accessControl.appDocument == 'OutletStockReports'}">
											 <li><a id="outletstockExpiry" onclick="viewoutletstockExpiry('outletstockExpiry','0','outlet','menu');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.expiry.label" /></a> </li>
											</c:if>
					     				</c:forEach>  
					     				 					
						              <c:if test="${outletStockExpReprtsAdded == true}">
					      					</ul>
						             	</li>  
					      			  </c:if>
								     
								     <!--Stock Reports end  -->
								     
								    <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletPurchaseReports'}">
								      		<li><a id="outletPurchasesReport" onclick="viewOMPurchases('outletPurchasesReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="purchases.reports.label" /></a></li>
								    	</c:if>
								   </c:forEach>
								   
					<c:set var="outletGRNReprtAdded" value="false"/> 					
		            <c:forEach var="accessControl" items="${sessionScope.outletGRNReports}" varStatus="theCount">
       					<c:if test="${theCount.count == 1}">
       						<li id="liOutletGRNReports" style="cursor: pointer;display: none;"><a onclick="showShipmentsFlow('outletGRNReports')"><i class="fa fa-angle-double-right"></i><span><spring:message code="shipments.reports.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
		                  		<ul id="ulOutletGRNReports" class="treeview-menu">
		                  		<c:set var="outletGRNReprtAdded" value="true"/> 		
       					</c:if>
       				</c:forEach>    
       				<c:forEach var="accessControl" items="${sessionScope.outletGRNReports}">
            			<c:if test="${accessControl.appSubDocument == 'OutletShipmentReceiptReports'}">
								      		<li><a id="outletShipmentsReceiptReport" onclick="viewOMShipmentsReceipt('outletShipmentsReceiptReport','0','','false')"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.wise.shipments.label" /></a></li>
								      </c:if>
     				</c:forEach> 
     				 
     				<c:forEach var="accessControl" items="${sessionScope.outletGRNReports}">
            			<c:if test="${accessControl.appSubDocument == 'OutletShipmentReports'}">
								   <li><a id="outletShipmentsReport" onclick="viewOMShipments('outletShipmentsReport','0','','false')"><i class="fa fa-angle-double-right"></i> <spring:message code="itemWise.shipments.label" /></a></li>
					 </c:if>
     				</c:forEach>  
     				 					
	              <c:if test="${outletGRNReprtAdded == true}">
      					</ul>
	             	</li>  
      			  </c:if>
								   
								 <%--  <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletShipmentReceiptReports'}">
								      		<li><a id="outletShipmentsReceiptReport" onclick="viewOMShipmentsReceipt('outletShipmentsReceiptReport','0','','false')"><i class="fa fa-angle-double-right"></i> <spring:message code="shipments.reports.label" /></a></li>
								      </c:if>
								  </c:forEach>
								   <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletShipmentReports'}">
								      		<li><a id="outletShipmentsReport" onclick="viewOMShipments('outletShipmentsReport','0','','false')"><i class="fa fa-angle-double-right"></i> <spring:message code="itemWise.shipments.label" /></a></li>
								      </c:if>
								  </c:forEach> --%>
								   <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletWasteReports'}">
								      		    <li><a id="outletWasteManagementReport" onclick="viewWasteManagement('outletWasteManagementReport')"><i class="fa fa-angle-double-right"></i> <span><spring:message code="waste_management.reports.label" /></span><i class="fa fa-angle-left pull-right"></i></a>
								       <ul id="ulWasteManagementReports" class="treeview-menu">
								       	 <li><a id="outletDumpReport" onclick="viewOutletDumpReport('outletDumpReport','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="dump.report.label" /></a></li>
								       
								      </ul></li>
								      </c:if>
								    </c:forEach>
								    
								
								     <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletExpiryReports'}">
								     		<li><a id="outletExpiryManagementReport" onclick="viewExpiryManagement('outletExpiryManagementReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="expiry_management.reports.label" /></a></li>
								      </c:if>
								     </c:forEach>
								      <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletFinancialReports'}">
								      		<li><a id="outletFinancialReport" onclick="viewFinancial('outletFinancialReport')"><i class="fa fa-angle-double-right"></i> <spring:message code="financial.reports.label" /></a></li>
								      </c:if>
								      </c:forEach>
								      <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletStockVerificationReports' && accessControl.read == true}">     
                            				<li><a id="outletStockVerificationReport" onclick="viewOutletStockVerificationReport('outletStockVerificationReport','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="stock.verification.label" /></a> </li>
                            			</c:if>
                            		</c:forEach>
                            		<c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
		                            	<c:if test="${accessControl.appDocument == 'OutletDealsAndOffersReports'}"> 
		                           			<li ><a id="dealsReports" onclick="viewOMDealsAndOffers('dealsReports')"><i class="fa fa-angle-double-right"></i> <spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" /> </a> </li>
		                           		</c:if>
		                            </c:forEach>
		                           <%-- <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
		                            	<c:if test="${accessControl.appDocument == 'OutletCRMReports'}"> 
	                             			<li><a id="loyaltyProgramReports" onclick="viewOMCRM('loyaltyProgramReports')"><i class="fa fa-angle-double-right"></i> <spring:message code="loyaltyprogram.label" /> </a> </li>
	                             		</c:if>
	                             	</c:forEach> --%>
	                             	
	                             	  <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
		                            	<c:if test="${accessControl.appDocument == 'OutletCRMReports'}"> 
	                             			<li><a id="loyaltyProgramReport" onclick="viewOMCRM('loyaltyProgramReports')"><i class="fa fa-angle-double-right"></i>  <span><spring:message code="loyaltyprogram.label" /></span><i class="fa fa-angle-left pull-right"></i></a> 
	                             		  <ul id="loyaltyProgramReports" class="treeview-menu">
								       	 <li><a id="outletCustomerConversionReport" onclick="viewOutletCustomerConversionReport('outletCustomerConversionReport','0')"><i class="fa fa-angle-double-right"></i> <spring:message code="customer.conversion.label" /></a></li>
								       </ul>
								      </li>
	                             		
	                             		</c:if>
	                             	</c:forEach>
	                          
	                  <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">      	
								   </ul>
								      </li>
						</c:if>
						</c:forEach>		      
								        
							<!-- promotion report -->	      
						
						<c:forEach var="accessControl" items="${sessionScope.CampaignReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">   
								       <li id="liCampaignsReports" > <a id="campaignsReports"  onclick="showCampaignManagementReportsFlows('campaignsReports')" >
									      <i class="fa fa-angle-double-right"></i>  <spring:message code="campaign.code.label" />
								         <i class="fa fa-angle-left pull-right"></i>
									     </a>
									       <ul id="ulCampaignsReports" class="treeview-menu">
						</c:if>
						</c:forEach>	       
								            <c:forEach var="accessControl" items="${sessionScope.CampaignReports}">
		                            	       <c:if test="${accessControl.appDocument == 'PWSalesReports'}">  
	                             			    <li><a id="promotionwiseSaleReports" onclick=""><i class="fa fa-angle-double-right"></i><spring:message code="promotion.wise.sales.label" /> </a> </li>
	                             		      </c:if>
	                             	        </c:forEach>  
								        
									     <c:forEach var="accessControl" items="${sessionScope.CampaignReports}">
		                            	     <c:if test="${accessControl.appDocument == 'PWOrdersReports'}"> 
	                             			    <li><a id="promotionwiseOrdersReports" onclick=""><i class="fa fa-angle-double-right"></i><spring:message code="promotion.wise.orders.label" /> </a> </li>
	                             		    </c:if>
	                             	   </c:forEach>  
								       
								       
								         <c:forEach var="accessControl" items="${sessionScope.CampaignReports}">
		                            	       <c:if test="${accessControl.appDocument == 'IWPromotionSalesReports'}">  
	                             		 	     <li><a id="itemWisePromotionSales" onclick="viewItemWisePromotionSales(0,'')"><i class="fa fa-angle-double-right"></i><spring:message code="item.wise.promotion.sales.label" /></a> </li>
	                             		       </c:if>
	                                     	</c:forEach>  
	                    <c:forEach var="accessControl" items="${sessionScope.CampaignReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">      	
	                             	      
								       </ul>
									     </li>
		      				</c:if>
							</c:forEach>
								    <!-- end promotion -->  

								      <c:if test="${sessionScope.role == 'super admin'}">
								      	<c:if test="${sessionScope.warehouseLicense == true}">
								      	 	<li><a id="warehousesReports" onclick="viewWarehouseReports('warehousesReports')"><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse_management.reports.label" /></a></li>
									     </c:if>
								      </c:if> 
								      
								      
						<c:forEach var="accessControl" items="${sessionScope.warehouseReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">   
								       <li id="liWarehouseReports" style="display:none;"> <a id="warehouseReports"  onclick="showWarehouseReportsFlows('warehousesReports')" >
									      <i class="fa fa-angle-double-right"></i>  <spring:message code="warehouse_management.reports.label" />
								         <i class="fa fa-angle-left pull-right"></i>
									     </a>
									       <ul id="ulWarehouseReports" class="treeview-menu">
						</c:if>
						</c:forEach>
								         <!-- <li id="liWarehouseSuppliesReports" style="display: block;"> -->
					
								         <li id="liWarehouseSalesReports">
								         <c:set var="myNumber" value="0"/>			         
					 <c:forEach var="accessControl" items="${sessionScope.warehouseReports}"  varStatus="theCount">
	                            			<c:if test="${accessControl.appDocument == 'WarehouseSalesReports'}">
					  <c:set var="myNumber" value="${myNumber +1 }"/>
						 <c:if test="${myNumber == 1}">
						 
								           <a id="warehouseSalesReports" onclick="showWarehouseSalesReportsFlows('warehouseSalesReports','warehouse');">
								            <i class="fa fa-angle-double-right"></i> <spring:message code="sales.reports.label" />
								            <i class="fa fa-angle-left pull-right"></i>
								          </a>
								           </c:if>
								           </c:if>
								         
								         </c:forEach>
								          <ul id="ulWarehousealesReports" class="treeview-menu">
								          <c:if test="${sessionScope.role == 'super admin'}">
								          	 <li><a id="outletXReadingReportwarehouse" onclick="viewOutletXReadingReport('outletXReadingReportwarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="xreading.reports.label" /></a></li>
								             <li><a id="outletZReadingReportwarehouse" onclick="viewOutletZReadingReport('outletZReadingReportwarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="zreading.reports.label" /></a></li>
											 <li><a id="outletXZReadingReportwarehouse" onclick="viewXZReading('outletXZReadingReportwarehouse','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="xzreading.reports.label" /></a></li>
								             <li><a id="salesReportDateWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportDateWisewarehouse','date','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="date.wise.sales.label" /></a></li>
								             <li><a id="salesReportCounterWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportCounterWisewarehouse','counter','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="counter.wise.label" /></a></li>
								             <li><a id="salesReportCategoryWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWisewarehouse','category','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="category.wise.label" /></a></li>
								             <li><a id="salesReportDepartmentWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWisewarehouse','Department','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="department.wise" /></a></li>
											 <li><a id="salesReporthourWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReporthourWisewarehouse','hour','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="hour.wise.sales.label" /></a></li>
											 <li><a id="salesReportSkuWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportSkuWisewarehouse','skuSales','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.wise.label" /></a></li>
 								             <li><a id="salesReportSupplierWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWisewarehouse','supplier','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.wise.label" /></a></li>
								             <li><a id="salesReportPriceVariationwarehouse" onclick="viewSalesPriceVariationReport('salesReportPriceVariationwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="sale.price.variation.label" /></a></li>
								             <li><a id="salesReportTaxWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportTaxWisewarehouse','tax','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.label" /></a></li>
								             <li><a id="dueCollectionwarehouse" onclick="viewSalesReportsCriteriaWise('dueCollectionwarehouse','duecollection','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="due.collection.label" /></a></li>
								              <li><a id="creditsaleswarehouse" onclick="viewSalesReportsCriteriaWise('creditsaleswarehouse','creditsales','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.sales.label" /></a></li>
								          	  <li><a id="serialBillSaleswarehouse" onclick="viewSerialBillSalesReports('serialBillSaleswarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.report.label" /></a></li>
								         		<li><a id="salesCouponIssueIdwarehouse" onclick="viewSalesCouponReports('salesCouponIssueIdwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.coupon.issue" /></a></li>
								         		<li><a id="salesVoucherIssueIdwarehouse" onclick="viewSalesVoucherReports('salesVoucherIssueIdwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.Voucher.issue" /></a></li>
								         		<li><a id="PersonWiseReportIdwarehouse" onclick="viewPersonWiseReports('PersonWiseReportIdwarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.person.Wise.issue" /></a></li>
								          </c:if>

                                              <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesX'}">
								            	<li><a id="outletXReadingReportwarehouse" onclick="viewOutletXReadingReport('outletXReadingReportwarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="xreading.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesZ'}">
								            	<li><a id="outletZReadingReportwarehouse" onclick="viewOutletZReadingReport('outletZReadingReportwarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="zreading.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesXZ'}">
												<li><a id="outletXZReadingReportwarehouse" onclick="viewXZReading('outletXZReadingReportwarehouse','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="xzreading.reports.label" /></a></li>
								            </c:if>
								            </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesDateWise'}">
								            	<li><a id="salesReportDateWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportDateWisewarehouse','date','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="date.wise.sales.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCounterWise'}">
								            	<li><a id="salesReportCounterWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportCounterWisewarehouse','counter','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="counter.wise.label" /></a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCategoryWise'}">
												<li><a id="salesReportCategoryWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWisewarehouse','category','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="category.wise.label" /></a></li>
											</c:if>
										   </c:forEach>
										     <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesDepartmentWise'}">
												<li><a id="salesReportDepartmentWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWisewarehouse','Department','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="department.wise" /></a></li>
											</c:if>
										   </c:forEach>
										    <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCategoryWise'}">
												<li><a id="salesReportSkuWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportSkuWisewarehouse','skuSales','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="sku.wise.label" /></a></li>
											</c:if>
										   </c:forEach>
										   <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesHourWise'}">
												<li><a id="salesReporthourWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReporthourWisewarehouse','hour','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="hour.wise.sales.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										    <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesHourWiseBill'}">
												<li><a id="salesReporthourWisebillwarehouse" onclick="viewSalesHourWiseBillReport('salesReporthourWisebillwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="hourlyBill.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										    <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesBrandWise'}">
												<li><a id="salesReportbrandWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportbrandWisewarehouse','Brand','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="brandwise.reports.label" /></a></li>
											</c:if>
										   </c:forEach>
										     <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCategoryWise'}">
												<li><a id="salesReportSectionWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportSectionWisewarehouse','Section','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="sectionwise.reports.label" /></a></li>
											</c:if>
										   </c:forEach>
										   <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesSupplierWise'}">
								            	<li><a id="salesReportSupplierWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWisewarehouse','supplier','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="supplier.wise.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           
								             <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceVariationReport'}">
								            	<li><a id="salesReportPriceVariationwarehouse" onclick="viewSalesPriceVariationReport('salesReportPriceVariationwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="sale.price.variation.label" /></a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesSalesVsProcurementReport'}">
								            	<li><a id="salesReportSupplierSaleswarehouse" onclick="viewOutletsuppliereport('salesReportSupplierSaleswarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="salesvsprocurement" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesVoidReport'}">
								            	<li><a id="outletVoidReportwarehouse" onclick="viewOutletVoidReport('outletVoidReportwarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="void.item.report.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceOverride'}">
								            <li><a id="outletNewReportwarehouse" onclick="viewOutletNewReport('outletNewReportwarehouse','0','','','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="price.override.report.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesItemWiseTax'}">
								            <li><a id="ItemTaxReportwarehouse" onclick="viewItemWiseTaxReport('ItemTaxReportwarehouse','0','warehouse')"><i class="fa fa-angle-double-right"></i>Item Wise Tax Report</a></li>
								            </c:if>
								           </c:forEach>
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesItemWiseGST'}">
								            <li><a id="ItemTaxGSTReportwarehouse" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReportwarehouse','0','false','warehouse')"><i class="fa fa-angle-double-right"></i>Item Wise GST Report</a></li>
								            </c:if>
								           </c:forEach>
								           
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditNoteReport'}">
								            <li><a id="outletCreditNoteReportwarehouse" onclick="viewOutletCreditNoteReport('outletCreditNoteReportwarehouse','0','false','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.note.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           
								           
								         <!--credit note redemption report  -->
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditNoteRedeemReport'}">
								            <li><a id="outletCreditNoteRedeemReportwarehouse" onclick="viewOutletCreditNoteRedemptionReport('outletCreditNoteRedeemReportwarehouse','0','false','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.note.redemption.reports.label" /></a></li>
								            </c:if>
								           </c:forEach>
								        <!--credit note redemption report  end-->
								           
								           
								           
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesTax'}">
								            	<li><a id="salesReportTaxWisewarehouse" onclick="viewSalesReportsCriteriaWise('salesReportTaxWisewarehouse','tax','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="tax.label" /></a></li>
								            </c:if>
								           </c:forEach>
								           
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesTenderWiseSales'}">
												<li><a id="tenderWiseSaleswarehouse" onclick="viewTenderWiseSales('tenderWiseSaleswarehouse','0','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.tender.wise.sales.label" /></a></li>
										 </c:if>
										   </c:forEach> 
										   
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesDueCollection'}">
												<li><a id="dueCollectionwarehouse" onclick="viewSalesReportsCriteriaWise('dueCollectionwarehouse','duecollection','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="due.collection.label" /></a></li>
											</c:if>
										   </c:forEach>
										   <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesManSales'}">
								           <li><a id="outletSalesmanCommissionwarehouse" onclick="viewSalesmanCommission('outletSalesmanCommissionwarehouse','0','false','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="salesman.commission.label" /></a></li>

								            </c:if>
								           </c:forEach>
								           
								           
								           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesMenSales'}">
								           <li><a id="outletSalesmenSalesCommissionwarehouse" onclick="viewNewSalesmanCommission('outletSalesmenSalesCommissionwarehouse','0','false','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="salesmenCommission.label" /></a></li>

								            </c:if>
								           </c:forEach>
								           
										   <c:forEach var="accessControl" items="${sessionScope.WarehousetSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditSales'}">
												<li><a id="creditsaleswarehouse" onclick="viewSalesReportsCriteriaWise('creditsaleswarehouse','creditsales','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="credit.sales.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										     <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesSerialBillReport'}">
												<li><a id="serialBillSaleswarehouse" onclick="viewSerialBillSalesReports('serialBillSaleswarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="bill.report.label" /></a></li>
											</c:if>
										   </c:forEach>
										   
										   
										    <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCouponReport'}">
												<li><a id="salesCouponIssueIdwarehouse" onclick="viewSalesCouponReports('salesCouponIssueIdwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.coupon.issue" /></a></li>
								          </c:if>
										   </c:forEach>
										   
										   <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesVoucherReport'}">
												<li><a id="salesVoucherIssueIdwarehouse" onclick="viewSalesVoucherReports('salesVoucherIssueIdwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.sales.Voucher.issue" /></a></li>
											 </c:if>
										   </c:forEach>
										   
										   
										   <%--  <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'OutletSalesSerialBillReport'}">
												<li><a id="PersonWiseReportId" onclick="viewPersonWiseReports('PersonWiseReportId','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.person.Wise.issue" /></a></li>
								       		 </c:if>
										   </c:forEach> --%>
										 <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesPersonWiseReport'}">
												<li><a id="PersonWiseReportIdwarehouse" onclick="viewDeliveryPersonWiseReports('PersonWiseReportIdwarehouse','0','','warehouse');"><i class="fa fa-angle-double-right"></i> <spring:message code="reports.Delievy.person.Wise" /></a></li>
								       		 </c:if>
										   </c:forEach>
										   
										    <!--Cashier efficiency report  -->
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCashierEfficiencyReport'}">
								            <li><a id="outletCashierEfficiencyReportwarehouse" onclick="viewOutletCashierEfficiencyReport('outletCashierEfficiencyReportwarehouse','0','false','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="cashier.efficeency.report" /></a></li>
								            </c:if>
								           </c:forEach>
								        <!--cashier efficiency report  end-->
								        
								        <!--Price Change Report  -->
								          <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceChangeReport'}">
								            <li><a id="outletPriceChangeReportwarehouse" onclick="viewOutletPriceChangeReport('outletPriceChangeReportwarehouse','0','','','clear','warehouse')"><i class="fa fa-angle-double-right"></i> <spring:message code="price.change.report.label" /></a></li>
								            </c:if>
								           </c:forEach> 
								        <!--Price Change Report end -->
								        
								         <!--Price Change Report  -->
								         <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesCashierShortageReport'}">
								            <li><a id="cashierShortageReportwarehouse" onclick="viewCashierShortageReport('cashierShortageReportwarehouse','0','','clear','warehouse')" style="white-space: nowrap;"><i class="fa fa-angle-double-right"></i> <spring:message code="cashier.shortage.report.label" /></a></li>
								        </c:if>
								        </c:forEach>
								        
								        <!--Price Change Report end  -->
								        
								        <!--Standard Sales Report  -->
								        <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesStandardSalesReport'}">
								        <li><a id="standardSalesReportwarehouse" onclick="viewStandardSalesReport('standardSalesReportwarehouse','0','','clear','warehouse')"><i class="fa fa-angle-double-right"></i>Standard Sales</a></li>
										</c:if>
										</c:forEach>
										
										<c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appSubDocument == 'WarehouseSalesStandardSalesDetailedReport'}">
										<li><a id="standardSalesDetailedReportwarehouse" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReportwarehouse','0','','clear','warehouse')"><i class="fa fa-angle-double-right"></i>Standard Sales Detailed</a></li>
										</c:if>
										</c:forEach>
										<!--Standard Sales Report end -->
										
										
										
										
										

										  </ul>
								       </li>
								         
								        
								         
								         
								         
								       
								            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
		                            	       <c:if test="${accessControl.appDocument == 'WarehouseSuppliesReports'}"> 
	                             			    <li><a id="warehouseSuppliesReports" onclick="viewWarehousesuppliereport('warehouseSuppliesReports','0','')"><i class="fa fa-angle-double-right"></i><spring:message code="supplies.report.label" /> </a> </li>
	                             		      </c:if>
	                             	        </c:forEach> 
								        
									    <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
		                            	     <c:if test="${accessControl.appDocument == 'WarehouseSupplies'}"> 
	                             			    <li><a id="warehouseSupplies" onclick="viewWarehousesupplies('warehouseSupplies')"><i class="fa fa-angle-double-right"></i><spring:message code="supplies.label" /> </a> </li>
	                             		     </c:if>
	                             	   </c:forEach> 
								       
								       
								        <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
		                            	       <c:if test="${accessControl.appDocument == 'WarehousePriceVariation'}"> 
	                             		 	     <li><a id="warehousePriceVariation" onclick="viewPriceVariationreport('warehousePriceVariation','0','')"><i class="fa fa-angle-double-right"></i><spring:message code="price.variation.label" /></a> </li>
	                             		       </c:if>
	                                     	</c:forEach> 
	                             	
	                             	      <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
		                            	     <c:if test="${accessControl.appDocument == 'WarehouseProcurementVsConsumption'}"> 
	                             			   <li><a id="warehouseProcurementVsConsumption" onclick="viewProcurementConsumptionreport('warehouseProcurementVsConsumption','0','')"><i class="fa fa-angle-double-right"></i><spring:message  code="procurement.consumption.label" /></a> </li>
	                             		     </c:if>
	                             	      </c:forEach> 
	                             	      
	                             	        <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appDocument == 'WarehouseStockIssueReport'}">
										<li><a id="stockissueReports" onclick="viewStockIssueReport('stockissueReports','0','','clear','warehouse')"><i class="fa fa-angle-double-right"></i>Stock Issue Report</a></li>
										</c:if>
										</c:forEach>
										
										<!--Purchase Report -->
										<c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                            			<c:if test="${accessControl.appDocument == 'WarehousePurchaseReport'}">
										<li><a id="purchaseReports" onclick="viewPurchaseReports('purchaseReports','0','','clear','warehouse')"><i class="fa fa-angle-double-right"></i>Purchase Report</a></li>
										</c:if>
										</c:forEach> 
	                             	      
	                             	      
	                             	      
	                    <c:forEach var="accessControl" items="${sessionScope.warehouseReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">         	      
								       </ul>
									     </li>
						</c:if>
						</c:forEach>
						<c:forEach var="accessControl" items="${sessionScope.Reports}" varStatus="theCount">
		                      <c:if test="${theCount.count == 1}">  
                            	   </ul>
								</li>
						</c:if>
						</c:forEach>
						
						
						
	                        <c:if test="${sessionScope.role == 'super admin'}">
	                           <li class="treeview" id="liUserAccessControl" style="cursor: pointer;"><a onclick="showUserAccessControlFlow();"><i class="fa fa-user"></i><span><spring:message code="user.access.control.label" /></span><i class="fa fa-angle-left pull-right"></i> </a>
	                            <ul id="ulUserAccessControl" class="treeview-menu">
	                             	<li ><a id="role" onClick="return viewRolesMaster('role','0');"><i class="fa fa-angle-double-right"></i><spring:message code="roles.label" /></a></li>
	                             	<li id="user-details"><a onclick="showUsersFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="users.label" /><i class="fa fa-angle-left pull-right"></i></a>
	                  					<ul id="ulUserDetails" class="treeview-menu">
	                            			<li><a id="allUsers" onclick="return viewUserDetails('all','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="all.users.label" /></a> </li>
	                               			<li><a id="activeUsers" onclick="return viewUserDetails('active','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="enabled.users.label" /></a> </li>
	                  					    <li><a id="suspendedUsers" onclick="return viewUserDetails('suspend','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="disabled.users.label" /></a></li>
	                  					</ul>
	                  				</li>
	                  			  </ul>
	                  		    </li>
	                        </c:if>
	               			 <c:forEach var="accessControl" items="${sessionScope.userAccessControl}" varStatus="theCount">
		                         <c:if test="${theCount.count == 1}">         
			                        <li class="treeview" id="liUserAccessControl" style="cursor: pointer;"><a onclick="showUserAccessControlFlow();"><i class="fa fa-user"></i><span><spring:message code="user.access.control.label" /></span><i class="fa fa-angle-left pull-right"></i> </a>
			                          <ul id="ulUserAccessControl" class="treeview-menu">
			                     </c:if>
			                 </c:forEach>
	                            
	                             <c:set var="rolesManagement" value="false"/>
	                             <c:set var="userManagement" value="false"/>
	                             
<%-- 	                             	<li ><a id="role" onClick="return viewRolesMaster('role','0');"><i class="fa fa-angle-double-right"></i><spring:message code="roles.label" /></a></li> --%>
	                            <c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
		                            <c:if test="${accessControl.appDocument == 'RolesManagement' && accessControl.write == true && accessControl.read == false}">
		                            	<c:set var="rolesManagement" value="true"/> 
		                            	<li ><a id="role" onClick="return newRole('role');"><i class="fa fa-angle-double-right"></i><spring:message code="roles.label" /></a></li>
		                            </c:if>
	                            	<c:if test="${accessControl.appDocument == 'RolesManagement' && rolesManagement == false}"> 
	                            		<li ><a id="role" onClick="return viewRolesMaster('role','0');"><i class="fa fa-angle-double-right"></i><spring:message code="roles.label" /></a></li>
	                            	</c:if>
                            	</c:forEach>
                            	<c:forEach var="accessControl" items="${sessionScope.userAccessControl}">
                            		<c:if test="${accessControl.appDocument == 'UserManagement' && accessControl.write == true && accessControl.read == false}">
		                            	<c:set var="userManagement" value="true"/> 
		                            	<li><a id="newUser" onclick="return viewNewUser('newUser');"><i class="fa fa-angle-double-right"></i><spring:message code="users.label" /></a>
		                            </c:if>
	                            	<c:if test="${accessControl.appDocument == 'UserManagement' && userManagement == false}"> 
		                            	<li id="user-details"><a onclick="showUsersFlow();"><i class="fa fa-angle-double-right"></i><spring:message code="users.label" /><i class="fa fa-angle-left pull-right"></i></a>
		                  					<ul id="ulUserDetails" class="treeview-menu">
		                            			<li><a id="allUsers" onclick="return viewUserDetails('all','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="all.users.label" /></a> </li>
		                               			<li><a id="activeUsers" onclick="return viewUserDetails('active','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="enabled.users.label" /></a> </li>
		                  					    <li><a id="suspendedUsers" onclick="return viewUserDetails('suspend','0');"><i class="fa fa-angle-double-right"></i> <spring:message code="disabled.users.label" /></a></li>
		                  					</ul>
		                  				</li>
                  					</c:if>
                  				</c:forEach> 
                  			<c:forEach var="accessControl" items="${sessionScope.userAccessControl}" varStatus="theCount">
		                         <c:if test="${theCount.count == 1}">         
					                       </ul>
			                        </li>
			                     </c:if>
			                 </c:forEach>
                        <c:if test="${sessionScope.role == 'super admin'}">
                          <li class="treeview" id="liDataManagement" style="cursor: pointer;"> <a onclick="showDataManagementFlow()"> <i class="fa  fa-database"></i><span><spring:message code="data.management.label" /></span> <i class="fa fa-angle-left pull-right"></i></a>
                            <ul id="ulDataManagement" class="treeview-menu">
                           		 <li ><a id="BatchOperations" onClick="return viewBatchOperationsFlow('BatchOperations','0');"><i class="fa fa-angle-double-right"></i><spring:message code="datamanagment.batch.operations" /></a></li>
                            	<li ><a id="import" onClick="return viewImportFlow('import');"><i class="fa fa-angle-double-right"></i><spring:message code="import.label" /></a>
                            	<ul id="ulImportData" class="treeview-menu">
                            	<li><a id="importGenric" onclick="return viewImportdetails('importGenric','generic');" ><i class="fa fa-angle-double-right"></i> Master Data</a></li>
                            	<li><a id="importOutlet" onclick="return viewImportdetails('importOutlet','outlet');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet_management.reports.label" /></a></li>
	                             	<li><a id="importWarehouse" onclick="return viewImportdetails('importWarehouse','warehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse_management.reports.label" /></a></li>	
                            	</ul>
                            	</li>
                            	<li ><a id="export" onClick="return viewExports('export');"><i class="fa fa-angle-double-right"></i><spring:message code="export.label" /></a>
                            	<ul id="ulExportData" class="treeview-menu">
                            	<li><a id="exportGeneric" onclick="return viewExportDetails('exportGeneric','generic');" ><i class="fa fa-angle-double-right"></i> Master Data</a></li>
                            		<li><a id="exportOutlet" onclick="return viewExportDetails('exportOutlet');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet_management.reports.label" /></a></li>
                            		<li><a id="exportWarehouse" onclick="return viewExportDetails('exportWarehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse_management.reports.label" /></a></li>
                            	</ul>
                            	</li>
                            	<li ><a id="backup" onClick="viewBackUP('backup','0')""><i class="fa fa-angle-double-right"></i><spring:message code="backup.label" /></a></li>
                            	<%-- <li ><a id="recovery" onClick="viewRecovery('recovery')"><i class="fa fa-angle-double-right"></i><spring:message code="recovery.label" /></a></li>
                             --%>
                             
                             <li ><a id="integrationMonitoring" onClick="viewIntegrationDashboard('integrationMonitoring','0')"><i class="fa fa-angle-double-right"></i>Integration Dashboard</a></li>
                         
                            <!-- koti --> 
                             
                             <li ><a id="replicationmain" onClick="return view('replicationmain');"><i class="fa fa-angle-double-right"></i><spring:message code="replication.label" /></a>
                            	<ul id="ulreplicationmain" class="treeview-menu">
                          	<li ><a id="replication" onClick="viewReplication()"><i class="fa fa-angle-double-right"></i><spring:message code="outlet_configuration.label" /></a></li>
                       	<li ><a id="manualreplication" onClick="viewReplication()"><i class="fa fa-angle-double-right"></i><spring:message code="outlet_configuration.label" /></a></li>
                            	
                            	</ul>
                            	</li>
                             
                            
                             <!-- koti -->   
                             </ul>
                          </li>
                         </c:if>
                          <c:forEach var="accessControl" items="${sessionScope.dataManagement}" varStatus="theCount">
	                          <c:if test="${theCount.count == 1}">
		                          <li class="treeview" id="liDataManagement" style="cursor: pointer;"> <a onclick="showDataManagementFlow()"> <i class="fa  fa-database"></i><span><spring:message code="data.management.label" /></span> <i class="fa fa-angle-left pull-right"></i></a>
		                            <ul id="ulDataManagement" class="treeview-menu">
		                      </c:if>
		                 </c:forEach>
		                    <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
	                          <c:if test="${accessControl.appDocument == 'BatchOperations' && accessControl.write == true}">  
                            			<li ><a id="BatchOperations" onClick="return viewBatchOperationsFlow('BatchOperations','0');"><i class="fa fa-angle-double-right"></i><spring:message code="datamanagment.batch.operations" /></a></li>
                            		</c:if>
                            </c:forEach>
                             <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Import' &&count<1}"> 
                             			<c:set var="count" value="${count + 1}" />
                            <li ><a id="import" onClick="return viewImportFlow('import');"><i class="fa fa-angle-double-right"></i><spring:message code="import.label" /></a>
                            		 <ul id="ulImportData" class="treeview-menu">
                            </c:if>
                            </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.dataManagement}" varStatus="theCount">
	                          <c:if test="${accessControl.appDocument == 'GenricImports' && accessControl.write == true && accessControl.appSubflow == 'Import'}"> 
                            				<li><a id="importGenric" onclick="return viewImportdetails('importGenric','generic');" ><i class="fa fa-angle-double-right"></i> Master Data</a></li>
                            	  </c:if> <c:if test="${accessControl.appDocument == 'OuletImports' && accessControl.write == true}"> 
                            	<li><a id="importOutlet" onclick="return viewImportdetails('importOutlet','outlet');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet_management.reports.label" /></a></li>
	                             	  </c:if> <c:if test="${accessControl.appDocument == 'WarehouseImports' && accessControl.write == true}"> 
	                             	<li><a id="importWarehouse" onclick="return viewImportdetails('importWarehouse','warehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse_management.reports.label" /></a></li>
                            	</c:if>
                            </c:forEach>
                                <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Import' &&count<1}"> 
                             		 <c:set var="count" value="${count + 1}" />
                   						 </ul></li>
                            </c:if></c:forEach>
                           <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Export' &&count<1}"> 
                             			<c:set var="count" value="${count + 1}" />
                            <li ><a id="export" onClick="return viewExports('export');"><i class="fa fa-angle-double-right"></i><spring:message code="export.label" /></a>
                            		 <ul id="ulExportData" class="treeview-menu">
                            </c:if></c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.dataManagement}" varStatus="theCount">
	                            	<c:if test="${accessControl.appDocument == 'GenricMaster' && accessControl.appSubflow == 'Export'}">
                            				<li><a id="exportGeneric" onclick="return viewExportDetails('exportGeneric','generic');" ><i class="fa fa-angle-double-right"></i> Master Data</a></li>
                            	</c:if><c:if test="${accessControl.appDocument == 'OuletExports'}">
                            	<li><a id="exportOutlet" onclick="return viewExportDetails('exportOutlet','outlet');" ><i class="fa fa-angle-double-right"></i> <spring:message code="outlet_management.reports.label" /></a></li>
	                             	</c:if><c:if test="${accessControl.appDocument == 'WarehouseExports'}">
	                             	<li><a id="exportWarehouse" onclick="return viewExportDetails('exportWarehouse','warehouse');" ><i class="fa fa-angle-double-right"></i> <spring:message code="warehouse_management.reports.label" /></a></li>
                            			</c:if>
                             </c:forEach>
                              <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Export' &&count<1}"> 
                             		 <c:set var="count" value="${count + 1}" />
                   						 </ul></li>
                            </c:if></c:forEach>
                            	
                             <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
	                            	<c:if test="${accessControl.appDocument == 'BackupOperations'}">
                   <!--return viewBackupFlow('backup');  --><li ><a id="backup" onClick="viewBackUP('backup','0')"><i class="fa fa-angle-double-right"></i><spring:message code="backup.label" /></a></li>
                            		</c:if>
                            </c:forEach>
                            
                            <%-- <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
	                            	<c:if test="${accessControl.appDocument == 'RecoveryOperations' && accessControl.write == true}">
                            			<li ><a id="recovery" onClick="viewRecovery('recovery')"><i class="fa fa-angle-double-right"></i><spring:message code="recovery.label" /></a></li>
                            		</c:if>
                            </c:forEach> --%>
                            
                            
                             <c:set var="integrationMonitoring" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                           <c:if test="${accessControl.appDocument == 'IntegrationMonitoring'&& integrationMonitoring==false}">
                           			 <li ><a id="integrationMonitoring" onClick="viewIntegrationDashboard('integrationMonitoring','0')"><i class="fa fa-angle-double-right"></i>Integration Dashboard</a></li>
                            		</c:if>
                           	</c:forEach>
                            
                            
                                 <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Export' &&count<1}"> 
                             			<c:set var="count" value="${count + 1}" />
                            <li ><a id="replicationmain" onClick="return view('replicationmain');"><i class="fa fa-angle-double-right"></i><spring:message code="replication.label" /><i class="fa fa-angle-left pull-right"></i></a>
                            		 <ul id="ulreplicationmain" class="treeview-menu">
                            </c:if>
                            </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.dataManagement}" varStatus="theCount">
	                            	<c:if test="${accessControl.appDocument == 'GenricMaster' && accessControl.appSubflow == 'Export'}">

                            	<li ><a id="replication" onClick="viewReplication('replication','0')"><i class="fa fa-angle-double-right"></i><spring:message code="outlet_configuration.label" /></a></li>

                            	</c:if>
                            	
                            	<c:if test="${accessControl.appDocument == 'GenricMaster' && accessControl.appSubflow == 'Export'}">

                            	<li ><a id="replication2" onClick="viewReplication('replication2','0')"><i class="fa fa-angle-double-right"></i>Manual Replication</a></li>

                            	</c:if>
                            	
                             </c:forEach>
                              <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'replicationmain' &&count<1}"> 
                             		 <c:set var="count" value="${count + 1}" />
                   						 </ul></li>
                            </c:if>
                            </c:forEach>
                            
                     
                            
                         <c:forEach var="accessControl" items="${sessionScope.dataManagement}" varStatus="theCount">
	                          <c:if test="${theCount.count == 1}">
		                            </ul>
		                          </li>
		                      </c:if>
		                 </c:forEach>
		                 
		                 <!-- these condition for Close tag of Data Management flow -->
		                 <c:forEach var="accessControl" items="${sessionScope.dataManagement}" varStatus="theCount">
		                      <c:if test="${theCount.count == 1}">  
                            	   </ul>
								</li>
						</c:if>
						</c:forEach> 
						<!-- these condition for Close tag of Data Management flow -->
		                
                            
                        <c:if test="${sessionScope.role == 'super admin'}">
                        	 <li id="liSystemLog" class="active-menu" style="cursor: pointer;"> <a id="systemLog" onclick="showSystemLogs();"><i class="fa fa-book"></i> <span><spring:message code="systemlog.label" /></span> <i class="fa fa-angle-left pull-right"></i> </a>
	                             <ul id="ulSystemLog" class="treeview-menu">
	                             	<li ><a id="applicationLog" onClick="viewApplicationLog('applicationLog','0');"><i class="fa fa-angle-double-right"></i><spring:message code="application.log.label" /></a></li>
	                             	<li ><a id="exportLog" onClick="viewExportLog('exportLog','0');"><i class="fa fa-angle-double-right"></i><spring:message code="export.log.label" /></a></li>
	                             	<li ><a id="securityLog" onClick="viewSecurityLog('securityLog')"><i class="fa fa-angle-double-right"></i><spring:message code="security.log.label" /></a></li>
	                             	<li ><a id="userLog" onClick="viewUserLog('userLog')"><i class="fa fa-angle-double-right"></i><spring:message code="user.log.label" /></a></li>
	                             	<li ><a id="administrationLog" onClick="viewAdminstrationLog('administrationLog')"><i class="fa fa-angle-double-right"></i><spring:message code="administration.log.label" /></a></li>
	                             </ul>
	                        </li>
                        </c:if>
                         <c:forEach var="accessControl" items="${sessionScope.systemLog}" varStatus="theCount">
		                     <c:if test="${theCount.count == 1}"> 
		                     	<li id="liSystemLog" class="active-menu" style="cursor: pointer;"><a id="systemLog" onclick="showSystemLogs();"><i class="fa fa-book"></i><span><spring:message code="systemlog.label" /></span> <i class="fa fa-angle-left pull-right"></i> </a>
	                             <ul id="ulSystemLog" class="treeview-menu">
		                     </c:if>
	                     </c:forEach>
                         <c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'ApplicationLog'}"> 
	                             <li ><a id="applicationLog" onClick="viewApplicationLog('applicationLog','0');"><i class="fa fa-angle-double-right"></i><spring:message code="application.log.label" /></a></li>
	                        </c:if>
					 	</c:forEach> 
					 	
					 	<c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'ExportLog'}"> 
	                             <li ><a id="exportLog" onClick="viewExportLog('exportLog','0');"><i class="fa fa-angle-double-right"></i><spring:message code="export.log.label" /></a></li>
	                        </c:if>
					 	</c:forEach> 
					 	<c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'SystemLog'}"> 
	                             <li ><a id="securityLog" onClick="viewSecurityLog('securityLog')"><i class="fa fa-angle-double-right"></i><spring:message code="security.log.label" /></a></li>
	                         </c:if>
					 	</c:forEach> 
					 	<c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'UserLog'}"> 
	                             	<li ><a id="OutletMonitoringUserLog" onClick="viewsocialMediaCampaigns('OutletMonitoringUserLog','0','','');"><i class="fa fa-angle-double-right"></i><spring:message code="user.log.label" /></a></li>
	                          </c:if>
					 	</c:forEach> 
					 	
					 	<%-- 	<c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'UserLog'}"> 
	                             	<li ><a id="OutletMonitoringUserLog" onClick="viewoutletUserLog('OutletMonitoringUserLog','0');"><i class="fa fa-angle-double-right"></i><spring:message code="usagelog.label" /></a></li>
	                          </c:if>
					 	</c:forEach>  --%>
					 	
					 	<c:forEach var="accessControl" items="${sessionScope.systemLog}">
	                     	<c:if test="${accessControl.appDocument == 'AdministrationLog'}"> 
	                             	<li ><a id="administrationLog" onClick="viewAdminstrationLog('administrationLog')"><i class="fa fa-angle-double-right"></i><spring:message code="administration.log.label" /></a></li>
					  	   </c:if>
					 	</c:forEach> 
					 	<c:forEach var="accessControl" items="${sessionScope.systemLog}" varStatus="theCount">
		                     <c:if test="${theCount.count == 1}"> 
				                     	<!-- </ul>
			                        </li> -->
		                     </c:if>
	                     </c:forEach>
					 
                    <!-- </ul> -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
           
            <aside class="right-side" id="right-side" style="" >

        <c:if test="${sessionScope.customerId == 'CID8995427'}"> 
             <c:if test="${sessionScope.role == 'super admin'}"> 
            	<%@ include file="Inventory Manager/EventManagement/eventManagementSummary.jsp" %>
            </c:if>
             <c:set var="outletEvent" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appSubflow == 'Event' && outletEvent == false}"> 
                          		
                          		 <c:set var="outletEvent" value="true"/>
                          		 <%@ include file="Inventory Manager/EventManagement/eventManagementSummary.jsp" %>
                          		</c:if>
                          		</c:forEach>
                          		
            
        </c:if>
        <c:if test="${sessionScope.customerId != 'CID8995427'}"> 
            <c:if test="${sessionScope.role == 'super admin'}"> 
            	<%@ include file="dashboardDetails.jsp" %>
            </c:if>
            
            <c:set var="dashBoardAdded" value="false" />
             <c:forEach var="accessControl" items="${sessionScope.dashboard}">
              <c:if test="${accessControl.appFlow == 'Dashboard' && dashBoardAdded == 'false' }"> 
            		 <c:set var="dashBoardAdded" value="true" />
            		<%@ include file="dashboardDetails.jsp" %>
                </c:if>
            </c:forEach>
            </c:if>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
	</div>
	
		<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">

      <!-- add new calendar event modal -->
		<%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
       <%--  <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js" type="text/javascript"></script> --%>
        <%-- <script src="${pageContext.request.contextPath}/js/raphael-min.js"></script> --%>
         <%-- <script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js" type="text/javascript"></script> --%>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/js/AdminLTE/app.min.js" type="text/javascript"></script>
        <!-- InputMask -->
      <%--   <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script> --%>
        <!-- date-range-picker -->
  		<%-- <script src="${pageContext.request.contextPath}/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script> --%>
       	<!-- DATA TABES SCRIPT -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
		<script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/js/outletDashboard.js" type="text/javascript"></script>
        <input type="hidden" id="selectlabel" value="<spring:message code="selectatleast.label" />"/>

        <input type="hidden" id="role" value="${sessionScope.role}"/>
       <%-- 	<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> --%>
        
        
    </body>
</html>