<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newSku.jsp
 * file type		        : JSP
 * description				: The new Sku is displayed using this jsp
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- <meta charset="UTF-8"> -->
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script
	src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>


<style type="text/css">

.colpadding
{
width:14.5%;
}
.col-lg9-9
{
width:81%;
}
.row-fluid-5 {
	width: 100%;
	*zoom: 1;
}
.dropdownwidth
{
    width: 135px;
}
.imgtextbox
{
 width: 92px;
}
.row-fluid-5:before, .row-fluid-5:after {
	display: table;
	line-height: 0;
	content: "";
}

.row-fluid-5:after {
	clear: both;
}

.row-fluid-5 [class*="span"] {
	display: block;
	float: left;
	width: 100%;
	min-height: 30px;
	margin-left: 1.875%;
	*margin-left: 1.875%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.row-padding
{
}
.row-fluid-5 .controls-row [class*="span"]+[class*="span"] {
	margin-left: 1.875%;
}

.row-fluid-5 [class*="span"]:first-child {
	margin-left: 0;
}

.row-fluid-5 .span2 {
	width: 15.5%;
	*width: 15.5%;
	padding:0px 0px 0px 0px;
	
}


/* responsive ONLY */
@media ( max-width : 600px) {
	/* spans reduce to 100px then go full width */
	.row-fluid-5 [class*="span"] {
		margin-left: 0;
		float: left;
		width: 100%;
		padding: 10px;
	}
	.col-padding{
	padding: 10px;
	}
}


}
img.thumbnail {
	background: none repeat scroll 0 0 #FFFFFF;
	margin-bottom: 0px !important;
	border: none !important;
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
	position: absolute;
	top: 0;
	right: 0;
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
	filter: alpha(opacity = 0);
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
					   $(this).scrollTop(0);
	});
	

	
	</script>
</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					
					
					
					<div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
					               
                                <li class="active"><a href="#tab_1" data-toggle="tab"><spring:message code="quickEdit.label"/></a></li>
                               
                                <li><a href="#tab_2" data-toggle="tab" target="_self"><spring:message code="detailedEdit.label"/></a></li>
                                 <c:if test="${type=='new' && customerId =='CID9990101'}">
                                 <li><a href="#tab_3" data-toggle="tab" target="_self"><spring:message code="forwellness.label"/></a></li>
					            </c:if>
                                
                                 </ul>
					            
					            
					             <div class="tab-content">
					             
					             <c:if test="${type=='new'}">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        				<%@ include file="newQuickSkuMaster.jsp" %>  
                                  	 	</div>
                                  	 
                                    </div>
					            
					</div>
					</c:if>
					
					
					 <c:if test="${type=='edit'}">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        				<%@ include file="editQuickSkuMaster.jsp" %>  
                                  	 	</div>
                                  	 
                                    </div>
                                       
					</div>
					</c:if>
					
					
					
					 <c:if test="${type=='view'}">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        				<%@ include file="viewQuickSku.jsp" %>  
                                  	 	</div>
                                  	 
                                    </div>
                                       
					</div>
					</c:if>
					
					
					
					<c:if test="${type=='new'}">
					             <div class="tab-pane" id="tab_2" >
                                    <div class="row">
                        			<!-- left column -->
                      				  <div class="col-lg-12">
                        				 <%@ include file="newSku.jsp" %>  
                                  	 	</div>
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                    <c:if test="${customerId =='CID9990101'}">
                                     <div class="tab-pane" id="tab_3" >
                                    <div class="row">
                        			<!-- left column -->
                      				  <div class="col-lg-12">
                        				 <%@ include file="newWellnessSku.jsp" %>  
                                  	 	</div>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                    </c:if>
					</c:if>
					
					<c:if test="${type=='edit'}">
					             <div class="tab-pane" id="tab_2" >
                                    <div class="row">
                        			<!-- left column -->
                      				  <div class="col-lg-12">
                        				 <%@ include file="editSku.jsp" %>  
                                  	 	</div>
                                    </div>
                                    </div><!-- /.tab-pane -->	
					</c:if>
					
					
					
					 <c:if test="${type=='view'}">
                                    <div class="tab-pane " id="tab_2" >
                                    <div class="row">
                        			<!-- left column -->
                        			
                      				  <div class="col-lg-12">
                        				<%@ include file="viewSku.jsp" %>  
                                  	 	</div>
                                  	 
                                    </div>
                                       
					</div>
					</c:if>
					
					
			   </div>
					
			</div>	
		</div>	
	</div>
</div>				
				</section>
			</body>
	</html>