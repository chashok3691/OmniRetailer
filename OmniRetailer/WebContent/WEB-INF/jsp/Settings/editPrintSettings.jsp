<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/settings/editPrintSettings.jsp
 * file type		        : JSP
 * description				: The editPrintSettings form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/cusomerSettings/printSettings.js"></script>
	
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 --%>
<style type="text/css">
	/* .col-xs-12 {
	 padding: 5%; 
	 }*/
	 .form-group {
    margin-bottom: 1px;
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
	font-weight: bold;
	color: black;
    /* background-color: rgb(195,195,195); */
    background: #777;
    border-color: black;
}
.browsebutton {
    border-radius: 0px;
    padding: 2px;
    height: 28px;
    /* -webkit-box-shadow: none; */
    box-shadow: none;
    /* background: #777; */
    color: #fff;
    font-size: 8px;
    border: 1px solid transparent;
}
 .form-group{
 padding-bottom: 3px;
 }
 
 .fa-2x {
    margin-top: 2px;
    font-size: 1.7em;
}
.styleBoxforHelp{
	border: 1px solid #ccc;
	border-radius: 23px;
	height: 250px;
	
}

.widthStylingbox{
	width: 32%;
    float: right;
}
 

#first {
    width: 100px;
    float: left;
    height: 300px;
        background-color: blue;
}
#second {
    width: 200px;
    float: left;
    height: 300px;
    background-color: green;
}
#clear {
    clear: both;
}
#table1 {
  border-collapse: separate;
  border-spacing: 15px;
}

@media only screen and (max-width: 600px) {
	.navbar-header{
	padding-left: 1% !important;
	padding: 2px !important;
}
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
	$("#remotePrinting").change(function(e){
		if(!$(this).prop("checked")){
			$("#rmtPrint").val(false);
		}
		else{
			$("#rmtPrint").val(true);
		}
		return;
	});
	
	$("#allowDownloading").change(function(e){
		if(!$(this).prop("checked")){
			$("#allowDL").val(false);
		}
		else{
			$("#allowDL").val(true);
		}
		return;
	});
	
	$("#allowSignature").change(function(e){
		if(!$(this).prop("checked")){
			$("#allowSign").val(false);
		}
		else{
			$("#allowSign").val(true);
		}
		return;
	});
	
});
</script>        
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">

  
  <div class="col-xs-12">

				<div class="box box-primary " style="padding: ">
    <div class="box-header" style="text-align: left; height:25px;">
   
    <h3 align="center"><spring:message code="print.settings.label" /></h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <form>
    
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        
        <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;margin-top:20px;font-weight: bold;">${err}</div>
       <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;margin-top:20px;font-weight: bold;">${success}</div>
        	 </div>
			<br><br>

<div class="row">
        	 
 <%-- <div class="row" style="padding: 0% 2%;">
  <div class="col-lg-12">
  <label></label>
  <textarea class="form-control" id="header" style="resize:none;" rows="5" placeholder="" >
  </textarea> 
 </div>
  </div> --%>



<div class="row" style="margin-left:1.5%;margin-right:1.5%;">


<%-- <div class="row" style="text-align: right; margin-top: 0px;">
                     <div class="row">  
  <div class="col-lg-12" >
<!-- <div class="row" style=" margin-top: -26px; margin-bottom: 6px;"> -->
<c:forEach var="accessControl" items="${sessionScope.settings}">
      <c:if test="${accessControl.appDocument == 'PrintSettings' && accessControl.write == true}">
		<c:if test="${status == 'new'}">
		 <input type="button" id="submit" style="margin-right: 25px;" class="btnCls" onclick="validatePrintSettingsForm('new')" value="<spring:message code="submit.label" />">
		</c:if>
		<c:if test="${status == 'edit'}">
		 <input type="button" id="submit" style="margin-right: 28px;" class="btnCls" data-toggle="modal" data-target="#myModal" value="<spring:message code="submit.label" />">
		</c:if>
	</c:if>
</c:forEach>
		<input type="button" class="btnCls" style="margin-right: 28px;" onclick="showCustomerSettingsFlow();" value="<spring:message code="cancel.label" />">
</div>
	</div>
	</div>
        	 </div> --%>

<div class="row" style="">
                
 <div class="form-group col-lg-12 col-sm-12 col-xs-12 clear ">
 <div class="form-group col-lg-8 col-sm-12 col-xs-12 first styleBoxforHelp table1">
<p style="text-align:left;">We can configure and get Print out for any business document/transaction you create using the Retail Clouds. For example, you can configure Printout for POS Bill. Or you may want to send PO to your supplier. Our implementation team configure the formats as per your requirement. However, you can also create or
change formats as per the requirement.You just need to have xsl knowledge<br>
<br>
The Print Settings displays all business documents that are required to run Retail Business. One has to configure the format and upload the xsl file.

The Print Settings displays all business documents that are required to run Retail Business. One has to configure the format and upload the xsl file. For
testing the format, you may go to the respective functional flow and create a new business transaction. For example, to test your Purchase Order format,
you need to go to Procurement flow and create new PO. It generates PDF as per format file (xsl) you uploaded.</p>


</div>
<div class="form-group col-lg-4 col-sm-12 col-xs-12"> 
 <div class="form-group col-lg-12 col-sm-12 col-xs-12 second styleBoxforHelp ">
  <P style="visibility: hidden;">Test  the Print Settings displays all business documents that are required to run Retail Business. One has to configure the format and upload the xsl file. For
testing the format, you may go to the respective functional flow and create a new business transaction. For example, to test your Purchase Order format,
you need to go to Test Test Test To the respective functional flow and create a new business transaction. For example, to test your Purchase Order format,
 to </P> 
 
  
 
 <div class="col-lg-12">
 <div class="col-lg-8"></div>
 <div class="col-lg-2"></div>
 
 
</div>
 
        	 <%-- <label><spring:message code="enable.remote.printing.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-1">
                <!-- <input type="text" style="width:53px;" class="form-control" id="offlineLogin" placeholder="" /> -->
                <c:choose>
             	<c:when test="${printSettings.enableRemotePrinting}">
               	<input style="width: 43px; height: 17px;margin-left: -185%;" type="checkbox" id="remotePrinting"  checked> 
               <!-- 	<input type="checkbox" id="offlineLogin"  disabled="disabled" checked> -->
            	</c:when>
             	<c:otherwise>
               	<input style="width: 43px; height: 17px;margin-left: -185%;" type="checkbox" id="remotePrinting" >
             	</c:otherwise>
             </c:choose>
                 <!-- <input style="width: 43px; height: 17px;" type="checkbox" id="offlineLogin" > -->
                 <input type="hidden" id="rmtPrint" value="${printSettings.enableRemotePrinting}">
                <span id="remotePrintingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
  					</div>
  					
  					
  					<%-- <div class="form-group col-lg-2" style="margin-left:-10%;">
        	 <label><spring:message code="allow.downloading.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-1"> --%>
                <!-- <input type="text" style="width:53px;" class="form-control" id="offlineLogin" placeholder="" /> -->
                <%-- <c:choose>
             	<c:when test="${printSettings.allowDownLoading}">
               	<input style="width: 43px; height: 17px;margin-left: -95%;" type="checkbox" id="allowDownloading"  checked> 
               <!-- 	<input type="checkbox" id="offlineLogin"  disabled="disabled" checked> -->
            	</c:when>
             	<c:otherwise>
               	<input style="width: 43px; height: 17px;margin-left: -95%;" type="checkbox" id="allowDownloading" >
             	</c:otherwise>
             </c:choose>
                 <!-- <input style="width: 43px; height: 17px;" type="checkbox" id="offlineLogin" > -->
                 <input type="hidden" id="allowDL" value="${printSettings.allowDownLoading}">
                <span id="allowDownloadingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div> --%>
  					
  					
  					<%-- <div class="form-group col-lg-2" style="margin-left:-4%;">
        	 <label><spring:message code="allow.signature.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-1">
                <!-- <input type="text" style="width:53px;" class="form-control" id="offlineLogin" placeholder="" /> -->
                <c:choose> --%>
             	<%-- <c:when test="${printSettings.allowSignature}">
               	<input style="width: 43px; height: 17px;margin-left: -95%;" type="checkbox" id="allowSignature"  checked> 
               <!-- 	<input type="checkbox" id="offlineLogin"  disabled="disabled" checked> -->
            	</c:when>
             	<c:otherwise>
               	<input style="width: 43px; height: 17px;margin-left: -95%;" type="checkbox" id="allowSignature" >
             	</c:otherwise>
             </c:choose> --%>
                 <%-- <!-- <input style="width: 43px; height: 17px;" type="checkbox" id="offlineLogin" > -->
                 <input type="hidden" id="allowSign" value="${printSettings.allowSignature}">
                <span id="allowSignatureError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div> --%>
  					
  					 <%-- <div class="form-group col-lg-2" style="margin-left:-3%;">
  					 <label><spring:message code="format.supported.label" /> <span style="color:red; font-size:2"></span></label>
  					 <input type="hidden" id="format" value="">
  					 </div>
  					  <div class="form-group col-lg-2" style="margin-left:-3%;width:12%;">
  					<select class="form-control" name="formatSupported" id="formatSupported">
  					<option value="html" ${'html' == printSettings.formatSupported ? 'selected' : ''}>HTML</option>
  					<option value="pdf" ${'pdf' == printSettings.formatSupported ? 'selected' : ''}>PDF</option>
  					</select> --%>
  					
  					</div>
  					<div class="col-lg-12 col-sm-12 col-xs-12">
  					<c:forEach var="accessControl" items="${sessionScope.settings}">
      <c:if test="${accessControl.appDocument == 'PrintSettings' && accessControl.write == true}">
		
  					</div>
  					
  					<input type="hidden" id="allowDL" value="${printSettings.allowDownLoading}">
                <span id="allowDownloadingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  				 <input type="hidden" id="allowSign" value="${printSettings.allowSignature}">
                <span id="allowSignatureError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  				 <input type="hidden" id="rmtPrint" value="${printSettings.enableRemotePrinting}">
                <span id="remotePrintingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
  				<input type="hidden" id="formatSupported" value="${printSettings.formatSupported}">
  					
  					
            </div>
</div>
</div>
</div>

        	       <!--      <div class="row" style="text-align: right; margin-top: 5px;">
        
       
        <input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateAssetMasterForm('new')" value="&nbsp;&nbsp;&nbsp;&nbsp;Save&nbsp;&nbsp;&nbsp;&nbsp;">
<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewAssetMaster('assetMaster','0');" value="Cancel">	 
        	 
        	 
        	 </div>
        	  -->
        	 
        	 <div class="form-group col-lg-12 col-sm-12 col-xs-12">
        	 <div>
        	<%--   <input type="button" id="submit"  class="btnCls" data-toggle="modal" style="margin-right:4%;margin-left: 71%; margin-bottom:-43px;cursor: pointer;" data-target="#myModal" value="<spring:message code="submit.label" />"> --%>

	</c:if>
</c:forEach>
		<%-- <input type="button" class="btnCls"   onclick="showCustomerSettingsFlow();" style="margin-bottom:-43px;cursor: pointer;"  value="<spring:message code="cancel.label" />"> --%>
  					
        	      <div class="row" >
				                    <div class="form-group col-lg-12 col-sm-12 col-xs-12">
				                    <div class="col-lg-12 col-sm-12 col-xs-12">
				                    <div class="col-lg-10 col-sm-10 col-xs-10"></div>
				                   
				                     <input type="button" class="btnCls"   onclick="showCustomerSettingsFlow();" style="margin-bottom:-85px;cursor: pointer;"  value="<spring:message code="cancel.label" />">
				                    
				                      </div>
				                      <div class="col-lg-12 col-sm-12 col-xs-12"></div>
				                      <div class="col-lg-12 col-sm-12 col-xs-12">				                      
				                      <input type="button" id="submit"  class="btnCls" data-toggle="modal" style="margin-right:4%;margin-left: 71%; margin-bottom:-43px;cursor: pointer;" data-target="#myModal" value="<spring:message code="submit.label" />">
				                    </div>
				                    
				                    </div>
				                    <div class="form-group col-lg-2 col-sm-2 col-xs-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('priceList');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="business.template.label" /></span></div>
				                     <div class="form-group col-lg-10 col-sm-10 col-xs-10" style="margin-bottom: 4px;">
				                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('priceList');" id="priceListImg" alt="" <%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
				                     </div > 
				                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
				                    <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
				                    </div >
				                </div >
			<!-- templates start -->
             
             
             


									<div class="form-group col-lg-6 col-sm-12 col-xs-12"
										style="margin-left: -1%;">

										<div class="form-group col-lg-5 col-sm-5"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.orderManagement.label" /></span>
										</div>
										<div class="form-group col-lg-10" style="margin-bottom: 8px;">

										</div>


										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(salesOrderB2cdataUrl ne null and salesOrderB2cdataUrl ne '') || (salesOrderB2cuiUrl ne null and salesOrderB2cuiUrl ne '') }" > --%>
													        <c:when test="${(salesOrderB2cdataStatus == true ) || (salesOrderB2cuiStatus == true) }" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderB2c');" id="salesOrderB2c"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderB2c');" id="salesOrderB2c"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.orderManagement.salesOrder_B2C" />
												<!-- 	<input type="hidden" id="salesBillingdata_refId"> -->
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderB2cdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />" 
																disabled="disabled"
																style="font-size: 12px; padding-right: 0px;" value="${salesOrderB2cdata}">
														</div>
														
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															
															<c:choose>
													        <c:when test="${salesOrderB2cdataUrl ne null and salesOrderB2cdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderB2cdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('salesOrderB2cdata',this);"
																	class="upload">
																	<input type="hidden" id="salesOrderB2cdata_refId">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderB2cdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('salesOrderB2cdata',this);"
																	class="upload">
																	<input type="hidden" id="salesOrderB2cdata_refId">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderB2cdataUrl ne null and salesOrderB2cdataUrl ne '' }">
												
														<a href="${salesOrderB2cdataUrl}" style="cursor: pointer;" target="_blank">
									                   <i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>



                                          <div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="salesOrderB2cui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderB2cuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${salesOrderB2cui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderB2cuiUrl ne null and salesOrderB2cuiUrl ne '' }" >
																<div class="fileUpload btn btn-primary browsebutton"
																	style="margin-top: 0px; font-weight: bold;">
																	<span style="font-size: 15px;">Browse..</span> <input
																		id="salesOrderB2cuiBtn"  type="file"
																		accept=".xsl"
																		onchange="addNameToTextBox('salesOrderB2cui',this);"
																		class="upload">
																</div>
													        </c:when>
													        <c:otherwise>
																<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderB2cuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('salesOrderB2cui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderB2cuiUrl ne null and salesOrderB2cuiUrl ne '' }">
												
														<a href="${salesOrderB2cuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
														
											</div>
										</div>











										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(salesOrderDirectdataUrl ne null and salesOrderDirectdataUrl ne '') || (salesOrderDirectuiUrl ne null and salesOrderDirectuiUrl ne '')}" > --%>
													         <c:when test="${(salesOrderDirectdataStatus == true ) || (salesOrderDirectuiStatus == true) }" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderDirect');" id="salesOrderDirect"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderDirect');" id="salesOrderDirect"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.orderManagement.salesOrder_Direct" />
													<input type="hidden" id="salesBilling_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderDirectdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"  style="" value="${salesOrderDirectdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderDirectdataUrl ne null and salesOrderDirectdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderDirectdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('salesOrderDirectdata',this);"
																	class="upload">
																	<input type="hidden" id="salesOrderDirectdata_refId">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderDirectdataBtn"  type="file"
																	accept=".xml" disabled="disabled" 
																	onchange="addNameToTextBox('salesOrderDirectdata',this);"
																	class="upload">
																	<input type="hidden" id="salesOrderDirectdata_refId">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderDirectdataUrl ne null and salesOrderDirectdataUrl ne '' }">
												<a href="${salesOrderDirectdataUrl}" style="cursor: pointer;" target="_blank"><i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="salesOrderDirectui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderDirectuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${salesOrderDirectui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderDirectuiUrl ne null and salesOrderDirectuiUrl ne '' }" >
																<div class="fileUpload btn btn-primary browsebutton"
																	style="margin-top: 0px; font-weight: bold;">
																	<span style="font-size: 15px;">Browse..</span> <input
																		id="salesOrderDirectuiBtn"  type="file"
																		accept=".xsl"
																		onchange="addNameToTextBox('salesOrderDirectui',this);"
																		class="upload">
																</div>
													        </c:when>
													        <c:otherwise>
																<div class="fileUpload btn btn-primar browsebutton"
																	style="margin-top: 0px; font-weight: bold;">
																	<span style="font-size: 15px;">Browse..</span> <input
																		id="salesOrderDirectuiBtn"  type="file"
																		accept=".xsl" disabled="disabled"
																		onchange="addNameToTextBox('salesOrderDirectui',this);"
																		class="upload">
																</div>
													        </c:otherwise>
													      	</c:choose>
															

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderDirectuiUrl ne null and salesOrderDirectuiUrl ne '' }">
												<a href="${salesOrderDirectuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(salesOrderMobiledataUrl ne null and salesOrderMobiledataUrl ne '') || (salesOrderMobileuiUrl ne null and salesOrderMobileuiUrl ne '')}" > --%>
													         <c:when test="${(salesOrderMobiledataStatus == true) || (salesOrderMobileuiStatus == true)}" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderMobile');" id="salesOrderMobile"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderMobile');" id="salesOrderMobile"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.orderManagement.salesOrder_Mobile" />
													<input type="hidden" id="salesBilling_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderMobiledataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${salesOrderMobiledata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderMobiledataUrl ne null and salesOrderMobiledataUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderMobiledataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('salesOrderMobiledata',this);"
																	class="upload">
																	<input type="hidden" id="salesOrderMobiledata_refId">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderMobiledataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('salesOrderMobiledata',this);"
																	class="upload">
																	<input type="hidden" id="salesOrderMobiledata_refId">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderMobiledataUrl ne null and salesOrderMobiledataUrl ne '' }">
												<a href="${salesOrderMobiledataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="salesOrderMobileui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderMobileuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${salesOrderMobileui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderMobileuiUrl ne null and salesOrderMobileuiUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderMobileuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('salesOrderMobileui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderMobileuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('salesOrderMobileui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderMobileuiUrl ne null and salesOrderMobileuiUrl ne '' }">
												<a href="${salesOrderMobileuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class=" col-lg-4 col-sm-12" style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													       <%--  <c:when test="${(salesOrderTelephonicdataUrl ne null and salesOrderTelephonicdataUrl ne '') || (salesOrderTelephonicuiUrl ne null and salesOrderTelephonicuiUrl ne '')}" > --%>
													        <c:when test="${(salesOrderTelephonicdataStatus == true) || (salesOrderTelephonicuiStatus == true)}" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderTelephonic');" id="salesOrderTelephonic"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderTelephonic');" id="salesOrderTelephonic"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.orderManagement.salesOrder_Telephone" />
													<input type="hidden" id="salesOrderTelephonicdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderTelephonicdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${salesOrderTelephonicdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderTelephonicdataUrl ne null and salesOrderTelephonicdataUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderTelephonicdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('salesOrderTelephonicdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderTelephonicdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('salesOrderTelephonicdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderTelephonicdataUrl ne null and salesOrderTelephonicdataUrl ne '' }">
												<a href="${salesOrderTelephonicdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="salesOrderTelephonicui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderTelephonicuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${salesOrderTelephonicui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${salesOrderTelephonicuiUrl ne null and salesOrderTelephonicuiUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderTelephonicuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('salesOrderTelephonicui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderTelephonicuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('salesOrderTelephonicui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${salesOrderTelephonicuiUrl ne null and salesOrderTelephonicuiUrl ne '' }">
												<a href="${salesOrderTelephonicuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
											
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class=" col-lg-4 col-sm-12" style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(billingdataUrl ne null and billingdataUrl ne '') || (billinguiUrl ne null and billinguiUrl ne '')}" > --%>
													        <c:when test="${(billingdataStatus == true) || (billinguiStatus == true)}" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'billing');" id="billing"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'billing');" id="billing"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="bill.details.print.label" />
													<input type="hidden" id="billingdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="billingdataFile" class="form-control"
																placeholder="Data XML"  disabled="disabled" style="" value="${billingdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${billingdataUrl ne null and billingdataUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billingdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('billingdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billingdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('billingdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${billingdataUrl ne null and billingdataUrl ne '' }">
												<a href="${billingdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="billingui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="billinguiFile" class="form-control"
																placeholder="A4 Size XSL" disabled="disabled" multiple="multiple" style="" value="${billingui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${billinguiUrl ne null and billinguiUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billinguiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('billingui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billinguiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('billingui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${billinguiUrl ne null and billinguiUrl ne '' }">
												<a href="${billinguiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
											
											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="thermalpdfui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="thermalpdfuiFile" class="form-control"
																placeholder="Thermal Print XSL" disabled="disabled" multiple="multiple" style="" value="${thermalpdfui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${thermalpdfuiUrl ne null and thermalpdfuiUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="thermalpdfuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('thermalpdfui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="thermalpdfuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('thermalpdfui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${thermalpdfuiUrl ne null and thermalpdfuiUrl ne '' }">
												<a href="${thermalpdfuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
											
										</div>
										
										
										
										
										
								<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class=" col-lg-4 col-sm-12" style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(billingCCdataUrl ne null and billingCCdataUrl ne '') || (billinguiUrl ne null and billinguiUrl ne '')}" > --%>
													        <c:when test="${(billingCCdataStatus == true) || (billingCCuiStatus == true )}" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'billingCC');" id="billingCC"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'billingCC');" id="billingCC"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="bill.details.email.label" />
													<input type="hidden" id="billingCCdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="billingCCdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${billingCCdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${billingCCdataUrl ne null and billingCCdataUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billingCCdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('billingCCdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billingCCdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('billingCCdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${billingCCdataUrl ne null and billingCCdataUrl ne '' }">
												<a href="${billingCCdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>		
										
					<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="billingCCui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="billingCCuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${billingCCui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${billingCCuiUrl ne null and billingCCuiUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billingCCuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('billingCCui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billingCCuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('billingCCui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	
														</div>
													</div>

												</div>
												
												<c:if test="${billingCCuiUrl ne null and billingCCuiUrl ne '' }">
												<a href="${billingCCuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
											
											
											
										</div>
															
										
										
										
										
									<!-- outlet Stock managment -->
										<div class="form-group col-lg-5 col-sm-5"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; /* margin-right: 8px; */ font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.outlet_stock_management.label" /></span>
										</div>

										<div class="form-group col-lg-10" style="margin-bottom: 10px;">

										</div>
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													       <%--  <c:when test="${(stockReceiptdataUrl ne null and stockReceiptdataUrl ne '') || (stockReceiptuiUrl ne null and stockReceiptuiUrl ne '')}" > --%>
													        <c:when test="${(stockReceiptdataStatus == true) || (stockReceiptuiStatus == true)}" >
															<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReceipts');" id="stockReceipts"/>
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReceipts');" id="stockReceipts"/>
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_receipt" />
													<input type="hidden" id="stockReceiptdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 2px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReceiptdataFile" disabled="disabled" class="form-control"
																placeholder="<spring:message code="choose.xml" />" 
																style="padding-right: 0px;" value="${stockReceiptdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															
															<c:choose>
													        <c:when test="${(stockReceiptdataUrl ne null and stockReceiptdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('stockReceiptdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('stockReceiptdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${stockReceiptdataUrl ne null and stockReceiptdataUrl ne '' }">
												<a href="${stockReceiptdataUrl}" style="cursor: pointer;" target="_blank">		<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="stockReceiptui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReceiptuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${stockReceiptui}" >
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${ stockReceiptuiUrl ne null and stockReceiptuiUrl ne ''}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('stockReceiptui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('stockReceiptui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${stockReceiptuiUrl ne null and stockReceiptuiUrl ne '' }">
												<a href="${stockReceiptuiUrl}" style="cursor: pointer;" target="_blank">		<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(stockIssuedataUrl ne null and stockIssuedataUrl ne '') || (stockIssueuiUrl ne null and stockIssueuiUrl ne '')}" > --%>
													        <c:when test="${(stockIssuedataStatus == true) || (stockIssueuiStatus == true)}" >
															<input type="checkbox" id="stockIssues" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockIssues');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="stockIssues" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockIssues');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_issue" />
													<input type="hidden" id="stockIssuedata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockIssuedataFile" class="form-control"
															placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${stockIssuedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockIssuedataUrl ne null and stockIssuedataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssuedataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('stockIssuedata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssuedataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('stockIssuedata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												
												<c:if test="${stockIssuedataUrl ne null and stockIssuedataUrl ne '' }">
												<a href="${stockIssuedataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="stockIssueui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockIssueuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${stockIssueui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockIssueuiUrl ne null and stockIssueuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssueuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('stockIssueui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssueuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('stockIssueui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${stockIssueuiUrl ne null and stockIssueuiUrl ne '' }">
												<a href="${stockIssueuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(stockRequestdataUrl ne null and stockRequestdataUrl ne '') || (stockRequestuiUrl ne null and stockRequestuiUrl ne '')}" > --%>
													        <c:when test="${(stockRequestdataStatus == true) || (stockRequestuiStatus == true)}" >
															<input type="checkbox" id="stockRequest" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockRequest');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="stockRequest" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockRequest');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_request" />
													<input type="hidden" id="stockRequestdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockRequestdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${stockRequestdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockRequestdataUrl ne null and stockRequestdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockRequestdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('stockRequestdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockRequestdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('stockRequestdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${stockRequestdataUrl ne null and stockRequestdataUrl ne '' }">
												<a href="${stockRequestdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
									
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="stockRequestui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockRequestuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${stockRequestui }" >
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${ (stockRequestuiUrl ne null and stockRequestuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockRequestuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('stockRequestui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockRequestuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('stockRequestui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${stockRequestuiUrl ne null and stockRequestuiUrl ne '' }">
												<a href="${stockRequestuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(stockReturndataUrl ne null and stockReturndataUrl ne '') || (stockReturnuiUrl ne null and stockReturnuiUrl ne '')}" > --%>
													        <c:when test="${(stockReturndataStatus == true) || (stockReturnuiStatus == true)}" >
															<input type="checkbox" id="stockReturn" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReturn');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="stockReturn" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReturn');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_return" />
													<input type="hidden" id="stockReturndata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReturndataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${stockReturndata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockReturnuiUrl ne null and stockReturnuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturndataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('stockReturndata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturndataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('stockReturndata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${stockReturndataUrl ne null and stockReturndataUrl ne '' }">
												<a href="${stockReturndataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="stockReturnui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReturnuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${stockReturnui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockReturnuiUrl ne null and stockReturnuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturnuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('stockReturnui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturnuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('stockReturnui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${stockReturnuiUrl ne null and stockReturnuiUrl ne '' }">
												<a href="${stockReturnuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(inventoryAlertsdataUrl ne null and inventoryAlertsdataUrl ne '') || (inventoryAlertsuiUrl ne null and inventoryAlertsuiUrl ne '')}" > --%>
													        <c:when test="${(inventoryAlertsdataStatus == true) || (inventoryAlertsuiStatus == true)}" >
															<input type="checkbox" id="inventoryAlerts" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'inventoryAlerts');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="inventoryAlerts" style="vertical-align: -2px" onchange="enableFileBrowse(this,'inventoryAlerts');" />
													        </c:otherwise>
													      	</c:choose>
													<spring:message
														code="emailSettings.outlet_stock_management.inventory_alerts" />
													<input type="hidden" id="inventoryAlertsdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="inventoryAlertsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${inventoryAlertsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(inventoryAlertsdataUrl ne null and inventoryAlertsdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('inventoryAlertsdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('inventoryAlertsdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${inventoryAlertsdataUrl ne null and inventoryAlertsdataUrl ne '' }">
												<a href="${inventoryAlertsdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
																	
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="inventoryAlertsui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="inventoryAlertsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${inventoryAlertsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(inventoryAlertsuiUrl ne null and inventoryAlertsuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('inventoryAlertsui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('inventoryAlertsui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												
												<c:if test="${inventoryAlertsuiUrl ne null and inventoryAlertsuiUrl ne '' }">
												<a href="${inventoryAlertsuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12" style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(stockVerificationdataUrl ne null and stockVerificationdataUrl ne '') || (stockVerificationdataUrl ne null and stockVerificationdataUrl ne '')}" > --%>
													        <c:when test="${(stockVerificationdataStatus == true) || (stockVerificationuiStatus == true)}" >
															<input type="checkbox" id="stockVerification" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockVerification');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="stockVerification" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockVerification');" />
													        </c:otherwise>
													      	</c:choose>
													<spring:message
														code="emailSettings.outlet_stock_management.stock_verification" />
													<input type="hidden" id="stockVerificationdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockVerificationdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${stockVerificationdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockVerificationdataUrl ne null and stockVerificationdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('stockVerificationdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('stockVerificationdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${stockVerificationdataUrl ne null and stockVerificationdataUrl ne '' }">
												<a href="${stockVerificationdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
													
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="stockVerificationui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockVerificationuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${stockVerificationui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(stockVerificationuiUrl ne null and stockVerificationuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('stockVerificationui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('stockVerificationui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>
													</div>
													
													<c:if test="${stockVerificationuiUrl ne null and stockVerificationuiUrl ne '' }">
												<a href="${stockVerificationuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
													
													</div>
													</div>
										
										
										
										
										
										
										
										<div class="form-group col-lg-5 col-sm-5"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.B2C_Management.label" /></span>
										</div>
										<div class="form-group col-lg-10" style="margin-bottom: 5px;">

										</div>
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(customerRegistrationdataUrl ne null and customerRegistrationdataUrl ne '') || (customerRegistrationuiUrl ne null and customerRegistrationuiUrl ne '')}" > --%>
													        <c:when test="${(customerRegistrationdataStatus == true) || (customerRegistrationuiStatus == true)}" >
															<input type="checkbox" id="customerRegistration" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerRegistration');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="customerRegistration" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerRegistration');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.customerRegistration" />
													<input type="hidden" id="customerRegistrationdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerRegistrationdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${customerRegistrationdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerRegistrationdataUrl ne null and customerRegistrationdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('customerRegistrationdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('customerRegistrationdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${customerRegistrationdataUrl ne null and customerRegistrationdataUrl ne '' }">
												<a href="${customerRegistrationdataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
												
											</div>
										</div>
										
										
										
										
										
<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="customerRegistrationui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerRegistrationuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${customerRegistrationui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerRegistrationuiUrl ne null and customerRegistrationuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('customerRegistrationui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('customerRegistrationui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${customerRegistrationuiUrl ne null and customerRegistrationuiUrl ne '' }">
												<a href="${customerRegistrationuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
									<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(customerUpdatedataUrl ne null and customerUpdatedataUrl ne '') || (customerUpdateuiUrl ne null and customerUpdateuiUrl ne '')}" > --%>
													        <c:when test="${(customerUpdatedataStatus == true) || (customerUpdateuiStatus == true)}" >
															<input type="checkbox" id="customerUpdate" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerUpdate');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="customerUpdate" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerUpdate');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.customerProfile_update" />
													<input type="hidden" id="customerUpdatedata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerUpdatedataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${customerUpdatedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerUpdatedataUrl ne null and customerUpdatedataUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdatedataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('customerUpdatedata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdatedataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('customerUpdatedata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${customerUpdatedataUrl ne null and customerUpdatedataUrl ne '' }">
												<a href="${customerUpdatedataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
					<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="customerUpdateui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerUpdateuiFile" class="form-control"
																placeholder="choose file" disabled="disabled" multiple="multiple" style="" value="${customerUpdateui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerUpdateuiUrl ne null and customerUpdateuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdateuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('customerUpdateui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdateuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('customerUpdateui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${customerUpdateuiUrl ne null and customerUpdateuiUrl ne '' }">
												<a href="${customerUpdateuiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(loginPassworddataUrl ne null and loginPassworddataUrl ne '') || (loginPassworduiUrl ne null and loginPassworduiUrl ne '')}" > --%>
													        <c:when test="${(loginPassworddataStatus == true) || (loginPassworduiStatus == true)}" >
															<input type="checkbox" id="loginPassword" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'loginPassword');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="loginPassword" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loginPassword');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.login_password" />
													<input type="hidden" id="loginPassworddata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loginPassworddataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled"
																style="padding-right: 0px;" value="${loginPassworddata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(loginPassworddataUrl ne null and loginPassworddataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworddataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('loginPassworddata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworddataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('loginPassworddata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${loginPassworddataUrl ne null and loginPassworddataUrl ne '' }">
												<a href="${loginPassworddataUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>



<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="loginPasswordui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loginPassworduiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${loginPasswordui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(loginPassworduiUrl ne null and loginPassworduiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworduiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('loginPasswordui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworduiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('loginPasswordui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${loginPassworduiUrl ne null and loginPassworduiUrl ne '' }">
												<a href="${loginPassworduiUrl}" style="cursor: pointer;" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>


									</div>
									<div class="form-group col-lg-6 col-sm-12"
										style="margin-left: 1%;">
									<!-- <div class="col-lg-1"></div> -->
										<div class="form-group col-lg-3 col-sm-3"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd; margin-left: 0px;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.procurement.label" /></span>
										</div>
										<div class="form-group col-lg-10 col-sm-4"
											style="margin-bottom: 10px;"></div>

<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(purchaseRequestdataUrl ne null and purchaseRequestdataUrl ne '') || (purchaseRequestuiUrl ne null and purchaseRequestuiUrl ne '')}" > --%>
													        <c:when test="${(purchaseRequestdataStatus == true) || (purchaseRequestuiStatus == true)}" >
															<input type="checkbox" id="purchaseRequest" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseRequest');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="purchaseRequest" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseRequest');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.procurement.purchase_request_for_Quotation.label" />
													<input type="hidden" id="purchaseRequestdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseRequestdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${purchaseRequestdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(purchaseRequestdataUrl ne null and purchaseRequestdataUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('purchaseRequestdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('purchaseRequestdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${purchaseRequestdataUrl ne null and purchaseRequestdataUrl ne '' }">
												<a href="${purchaseRequestdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="purchaseRequestui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseRequestuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${purchaseRequestui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(purchaseRequestuiUrl ne null and purchaseRequestuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('purchaseRequestui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('purchaseRequestui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${purchaseRequestuiUrl ne null and purchaseRequestuiUrl ne '' }">
												<a href="${purchaseRequestuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(purchaseOrderdataUrl ne null and purchaseOrderdataUrl ne '') || (purchaseOrderuiUrl ne null and purchaseOrderuiUrl ne '')}" > --%>
													        <c:when test="${(purchaseOrderdataStatus == true) || (purchaseOrderuiStatus == true)}" >
															<input type="checkbox" id="purchaseOrder" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrder');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="purchaseOrder" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrder');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />
													<input type="hidden" id="purchaseOrderdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseOrderdataFile" class="form-control"
															placeholder="<spring:message code="choose.xml" />"  disabled="disabled" multiple="multiple" style="" value="${purchaseOrderdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(purchaseOrderdataUrl ne null and purchaseOrderdataUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('purchaseOrderdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('purchaseOrderdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${purchaseOrderdataUrl ne null and purchaseOrderdataUrl ne '' }">
												<a href="${purchaseOrderdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
									<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="purchaseOrderui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseOrderuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${purchaseOrderui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(purchaseOrderuiUrl ne null and purchaseOrderuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('purchaseOrderui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('purchaseOrderui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												<c:if test="${purchaseOrderuiUrl ne null and purchaseOrderuiUrl ne '' }">
												<a href="${purchaseOrderuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(shippmentNotedataUrl ne null and shippmentNotedataUrl ne '') || (shippmentNoteuiUrl ne null and shippmentNoteuiUrl ne '')}" > --%>
													        <c:when test="${(shippmentNotedataStatus == true) || (shippmentNoteuiStatus == true)}" >
															<input type="checkbox" id="shippmentNote" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentNote');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="shippmentNote" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentNote');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.procurement.shipmentNote" />
													<input type="hidden" id="shippmentNotedata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentNotedataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${shippmentNotedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(shippmentNotedataUrl ne null and shippmentNotedataUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNotedataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('shippmentNotedata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNotedataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('shippmentNotedata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
													<c:if test="${shippmentNotedataUrl ne null and shippmentNotedataUrl ne '' }">
												<a href="${shippmentNotedataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="shippmentNoteui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentNoteuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${shippmentNoteui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(shippmentNoteuiUrl ne null and shippmentNoteuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNoteuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('shippmentNoteui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNoteuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('shippmentNoteui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
													<c:if test="${shippmentNoteuiUrl ne null and shippmentNoteuiUrl ne '' }">
												<a href="${shippmentNoteuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													       <%--  <c:when test="${(shippmentReceiptdataUrl ne null and shippmentReceiptdataUrl ne '') || (shippmentReceiptuiUrl ne null and shippmentReceiptuiUrl ne '')}" > --%>
													        <c:when test="${(shippmentReceiptdataStatus == true) || (shippmentReceiptuiStatus == true)}" >
															<input type="checkbox" id="shippmentReceipt" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentReceipt');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="shippmentReceipt" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentReceipt');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.procurement.shipment_receipt" />
													<input type="hidden" id="shippmentReceiptdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentReceiptdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${shippmentReceiptdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(shippmentReceiptdataUrl ne null and shippmentReceiptdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('shippmentReceiptdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('shippmentReceiptdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${shippmentReceiptdataUrl ne null and shippmentReceiptdataUrl ne '' }">
												<a href="${shippmentReceiptdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
												
											</div>
										</div>
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
						<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="shippmentReceiptui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentReceiptuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${shippmentReceiptui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(shippmentReceiptuiUrl ne null and shippmentReceiptuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('shippmentReceiptui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('shippmentReceiptui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${shippmentReceiptuiUrl ne null and shippmentReceiptuiUrl ne '' }">
												<a href="${shippmentReceiptuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(shippmentInspectiondataUrl ne null and shippmentInspectiondataUrl ne '') || (shippmentInspectionuiUrl ne null and shippmentInspectionuiUrl ne '')}" > --%>
													        <c:when test="${(shippmentInspectiondataStatus == true) || (shippmentInspectionuiStatus == true)}" >
															<input type="checkbox" id="shippmentInspection" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentInspection');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="shippmentInspection" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentInspection');" />
													        </c:otherwise>
													      	</c:choose>
													<spring:message
														code="emailSettings.procurement.shipment_inspection" />
													<input type="hidden" id="shippmentInspectiondata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentInspectiondataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${shippmentInspectiondata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(shippmentInspectiondataUrl ne null and shippmentInspectiondataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectiondataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('shippmentInspectiondata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
																<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectiondataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('shippmentInspectiondata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
													<c:if test="${shippmentInspectiondataUrl ne null and shippmentInspectiondataUrl ne '' }">
												<a href="${shippmentInspectiondataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="shippmentInspectionui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentInspectionuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${shippmentInspectionui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(shippmentInspectionuiUrl ne null and shippmentInspectionuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectionuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('shippmentInspectionui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
																<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectionuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('shippmentInspectionui',this);"
																	class="upload">
																</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${shippmentInspectionuiUrl ne null and shippmentInspectionuiUrl ne '' }">
												<a href="${shippmentInspectionuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													       <%--  <c:when test="${(invoicingdataUrl ne null and invoicingdataUrl ne '') || (invoicinguiUrl ne null and invoicinguiUrl ne '')}" > --%>
													        <c:when test="${(invoicingdataStatus == true) || (invoicinguiStatus == true)}" >
															<input type="checkbox" id="invoicing" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'invoicing');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="invoicing" style="vertical-align: -2px" onchange="enableFileBrowse(this,'invoicing');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.procurement.invoicing" />
													<input type="hidden" id="invoicingdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="invoicingdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${invoicingdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(invoicingdataUrl ne null and invoicingdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicingdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('invoicingdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicingdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('invoicingdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
													<c:if test="${invoicingdataUrl ne null and invoicingdataUrl ne '' }">
												<a href="${invoicingdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="invoicingui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="invoicinguiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${invoicingui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(invoicinguiUrl ne null and invoicinguiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicinguiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('invoicingui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicinguiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('invoicingui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${invoicinguiUrl ne null and invoicinguiUrl ne '' }">
												<a href="${invoicinguiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
											<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(paymentsdataUrl ne null and paymentsdataUrl ne '') || (paymentsuiUrl ne null and paymentsuiUrl ne '')}" > --%>
													         <c:when test="${(paymentsdataStatus == true) || (paymentsuiStatus == true)}" >
															<input type="checkbox" id="payments" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'payments');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="payments" style="vertical-align: -2px" onchange="enableFileBrowse(this,'payments');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.procurement.payments" />
													<input type="hidden" id="paymentsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="paymentsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${paymentsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(paymentsdataUrl ne null and paymentsdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('paymentsdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('paymentsdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${paymentsdataUrl ne null and paymentsdataUrl ne '' }">
												<a href="${paymentsdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>





<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="paymentsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="paymentsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${paymentsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(paymentsuiUrl ne null and paymentsuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('paymentsui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('paymentsui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	
														</div>
													</div>

												</div>
												
												<c:if test="${paymentsuiUrl ne null and paymentsuiUrl ne '' }">
												<a href="${paymentsuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>

										<!-- <div class="col-lg-1"></div> -->
										<div onclick="activateHeader('priceList');"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd; margin-left: 0px;"
											class="form-group col-lg-1 col-sm-1">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.CRM.label" /></span>
										</div>

										<div class="form-group col-lg-10" style="margin-bottom: 5px;">

										</div>



										<div class="col-lg-12 col-sm-12"
											style="padding-right: 0px; margin-top: 12px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(customerComplaintsdataUrl ne null and customerComplaintsdataUrl ne '') || (customerComplaintsuiUrl ne null and customerComplaintsuiUrl ne '')}" > --%>
													        <c:when test="${(customerComplaintsdataStatus == true) || (customerComplaintsuiStatus == true)}" >
															<input type="checkbox" id="customerComplaintss" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerComplaintss');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="customerComplaintss" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerComplaintss');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.customer_complaints.label" />
													<input type="hidden" id="customerComplaintsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerComplaintsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${customerComplaintsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerComplaintsdataUrl ne null and customerComplaintsdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('customerComplaintsdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('customerComplaintsdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${customerComplaintsdataUrl ne null and customerComplaintsdataUrl ne '' }">
												<a href="${customerComplaintsdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
																
																		
<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="customerComplaintsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerComplaintsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${customerComplaintsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerComplaintsuiUrl ne null and customerComplaintsuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('customerComplaintsui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('customerComplaintsui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${customerComplaintsuiUrl ne null and customerComplaintsuiUrl ne '' }">
												<a href="${customerComplaintsuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(customerFeedbackdataUrl ne null and customerFeedbackdataUrl ne '') || (customerFeedbackuiUrl ne null and customerFeedbackuiUrl ne '')}" > --%>
													        <c:when test="${(customerFeedbackdataStatus == true) || (customerFeedbackuiStatus == true)}" >
															<input type="checkbox" id="customerFeedbacks" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerFeedbacks');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="customerFeedbacks" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerFeedbacks');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.customer_feedback.label" />
													<input type="hidden" id="customerFeedbackdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerFeedbackdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${customerFeedbackdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerFeedbackdataUrl ne null and customerFeedbackdataUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('customerFeedbackdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('customerFeedbackdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${customerFeedbackdataUrl ne null and customerFeedbackdataUrl ne '' }">
												<a href="${customerFeedbackdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>



<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="customerFeedbackui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerFeedbackuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${customerFeedbackui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(customerFeedbackuiUrl ne null and customerFeedbackuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('customerFeedbackui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('customerFeedbackui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
													<c:if test="${customerFeedbackuiUrl ne null and customerFeedbackuiUrl ne '' }">
												<a href="${customerFeedbackuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>








										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													       <%--  <c:when test="${(giftCouponsdataUrl ne null and giftCouponsdataUrl ne '') || (giftCouponsuiUrl ne null and giftCouponsuiUrl ne '')}" > --%>
													        <c:when test="${(giftCouponsdataStatus == true) || (giftCouponsuiStatus == true)}" >
															<input type="checkbox" id="giftCoupons" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftCoupons');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="giftCoupons" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftCoupons');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.discount_coupons.label" />
													<input type="hidden" id="giftCouponsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftCouponsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${giftCouponsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(giftCouponsdataUrl ne null and giftCouponsdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('giftCouponsdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('giftCouponsdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
													<c:if test="${giftCouponsdataUrl ne null and giftCouponsdataUrl ne '' }">
												<a href="${giftCouponsdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
																				
<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="giftCouponsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftCouponsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${giftCouponsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(giftCouponsuiUrl ne null and giftCouponsuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('giftCouponsui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('giftCouponsui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
													<c:if test="${giftCouponsuiUrl ne null and giftCouponsuiUrl ne '' }">
												<a href="${giftCouponsuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(giftVouchersdataUrl ne null and giftVouchersdataUrl ne '') || (giftVouchersuiUrl ne null and giftVouchersuiUrl ne '')}" > --%>
													        <c:when test="${(giftVouchersdataStatus == true) || (giftVouchersuiStatus == true)}" >
															<input type="checkbox" id="giftVouchers" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftVouchers');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="giftVouchers" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftVouchers');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.gift_vouchers.label" />
													<input type="hidden" id="giftVouchersdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftVouchersdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"  disabled="disabled" style="" value="${giftVouchersdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(giftVouchersdataUrl ne null and giftVouchersdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('giftVouchersdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('giftVouchersdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												
												<c:if test="${giftVouchersdataUrl ne null and giftVouchersdataUrl ne '' }">
												<a href="${giftVouchersdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
														
												
											</div>
										</div>
										
										
								<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="giftVouchersui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftVouchersuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${giftVouchersui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(giftVouchersuiUrl ne null and giftVouchersuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('giftVouchersui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('giftVouchersui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${giftVouchersuiUrl ne null and giftVouchersuiUrl ne '' }">
												<a href="${giftVouchersuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
										
										
										
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(loyalityRewardingdataUrl ne null and loyalityRewardingdataUrl ne '') || (loyalityRewardinguiUrl ne null and loyalityRewardinguiUrl ne '')}" > --%>
													        <c:when test="${(loyalityRewardingdataStatus == true) || (loyalityRewardinguiStatus == true)}" >
															<input type="checkbox" id="loyalityRewarding" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'loyalityRewarding');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="loyalityRewarding" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loyalityRewarding');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message
														code="emailSettings.loyalty_rewarding.label" />
													<input type="hidden" id="loyalityRewardingdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loyalityRewardingdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />" disabled="disabled" style="" value="${loyalityRewardingdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(loyalityRewardingdataUrl ne null and loyalityRewardingdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardingdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('loyalityRewardingdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardingdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('loyalityRewardingdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${loyalityRewardingdataUrl ne null and loyalityRewardingdataUrl ne '' }">
												<a href="${loyalityRewardingdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
														
<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="loyalityRewardingui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loyalityRewardinguiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${loyalityRewardingui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(loyalityRewardinguiUrl ne null and loyalityRewardinguiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardinguiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('loyalityRewardingui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardinguiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('loyalityRewardingui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${loyalityRewardinguiUrl ne null and loyalityRewardinguiUrl ne '' }">
												<a href="${loyalityRewardinguiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
																				
										
										
										
										
										
																
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(notificationGreetingsdataUrl ne null and notificationGreetingsdataUrl ne '') || (notificationGreetingsuiUrl ne null and notificationGreetingsuiUrl ne '')}" > --%>
													        <c:when test="${(notificationGreetingsdataStatus == true) || (notificationGreetingsuiStatus == true)}" >
															<input type="checkbox" id="notificationGreetings" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationGreetings');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="notificationGreetings" style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationGreetings');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.notification_greetings" />
													<input type="hidden" id="notificationGreetingsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationGreetingsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />" disabled="disabled" style="" value="${notificationGreetingsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(notificationGreetingsdataUrl ne null and notificationGreetingsdataUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('notificationGreetingsdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('notificationGreetingsdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${notificationGreetingsdataUrl ne null and notificationGreetingsdataUrl ne '' }">
												<a href="${notificationGreetingsdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>
										
										
							
<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="notificationGreetingsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationGreetingsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${notificationGreetingsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(notificationGreetingsuiUrl ne null and notificationGreetingsuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('notificationGreetingsui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('notificationGreetingsui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
												<c:if test="${notificationGreetingsuiUrl ne null and notificationGreetingsuiUrl ne '' }">
												<a href="${notificationGreetingsuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>				
										
										
										
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<c:choose>
													        <%-- <c:when test="${(notificationCampaignsdataUrl ne null and notificationCampaignsdataUrl ne '') || (notificationCampaignsuiUrl ne null and notificationCampaignsuiUrl ne '')}" > --%>
													        <c:when test="${(notificationCampaignsdataStatus == true) || (notificationCampaignsuiStatus == true)}" >
															<input type="checkbox" id="notificationCampaigns" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationCampaigns');" />
													        </c:when>
													        <c:otherwise>
															<input type="checkbox" id="notificationCampaigns" style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationCampaigns');" />
													        </c:otherwise>
													      	</c:choose>
													      	
													<spring:message code="emailSettings.notification_campaigns" />
													<input type="hidden" id="notificationCampaignsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationCampaignsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />" disabled="disabled" style="" value="${notificationCampaignsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(notificationCampaignsdataUrl ne null and notificationCampaignsdataUrl ne '') }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsdataBtn"  type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('notificationCampaignsdata',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsdataBtn"  type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('notificationCampaignsdata',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>

														</div>
													</div>

												</div>
												
													<c:if test="${notificationCampaignsdataUrl ne null and notificationCampaignsdataUrl ne '' }">
												<a href="${notificationCampaignsdataUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>




<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
											<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<%-- <spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI --%>
													<input type="hidden" id="notificationCampaignsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style=" padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationCampaignsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />" disabled="disabled" multiple="multiple" style="" value="${notificationCampaignsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
													        <c:when test="${(notificationCampaignsuiUrl ne null and notificationCampaignsuiUrl ne '')}" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsuiBtn"  type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('notificationCampaignsui',this);"
																	class="upload">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsuiBtn"  type="file"
																	accept=".xsl" disabled="disabled"
																	onchange="addNameToTextBox('notificationCampaignsui',this);"
																	class="upload">
															</div>
													        </c:otherwise>
													      	</c:choose>
													      	

														</div>
													</div>

												</div>
												
												<c:if test="${notificationCampaignsuiUrl ne null and notificationCampaignsuiUrl ne '' }">
												<a href="${notificationCampaignsuiUrl}" style="cursor: pointer;margin-left: 19px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true" style="width: 25px"></i>
														</a>
														</c:if>
												
											</div>
										</div>









									</div>

								
             
             
             
             
             
             
             
             
             
             
             
           <!--   templates end -->
<%-- 				                  <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.order.label" />
             	<input type="hidden" id="salesOrder_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7" >
  						<input id="salesOrderFile" class="form-control" value="${salesOrder}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesOrderBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesOrder',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesOrderUrl}">
								<a href="${salesOrderUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.billing.label" />
             	<input type="hidden" id="salesBilling_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="salesBillingFile" class="form-control" value="${salesBilling}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesBillingBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesBilling',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesBillingUrl}">
								<a href="${salesBillingUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="salesBillingImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.delivery.shipment.label" />
             	<input type="hidden" id="salesDerliveryShipment_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="salesDerliveryShipmentFile" class="form-control" value="${salesDerliveryShipment}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesDerliveryShipmentBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesDerliveryShipment',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesDerliveryShipmentUrl}">
								<a href="${salesDerliveryShipmentUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="salesDerliveryShipmentImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.invoice.label" />
             	<input type="hidden" id="salesInvoice_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="salesInvoiceFile" class="form-control" value="${salesInvoice}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesInvoiceBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesInvoice',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesInvoiceUrl}">
								<a href="${salesInvoiceUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="salesInvoiceImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					 <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="purchases.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.rfq.label" />
             	<input type="hidden" id="purchaseRFQ_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseRFQFile" class="form-control" value="${purchaseRFQ}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseRFQBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('purchaseRFQ',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseRFQUrl}">
								<a href="${purchaseRFQUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseRFQImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					 <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrder');" id="purchaseOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.order.label" />
             	<input type="hidden" id="purchaseOrder_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseOrderFile" class="form-control" value="${purchaseOrder}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseOrderBtn"  type="file" accept=".xml" onchange="addNameToTextBox('purchaseOrder',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseOrderUrl}">
								<a href="${purchaseOrderUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseOrderImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

					</div>
             	</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.shipment.receipt.label" />
             	<input type="hidden" id="purchaseShipmentReceipt_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseShipmentReceiptFile" class="form-control" value="${purchaseShipmentReceipt}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseShipmentReceiptBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('purchaseShipmentReceipt',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseShipmentReceiptUrl}">
								<a href="${purchaseShipmentReceiptUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseShipmentReceiptImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.shipment.Inspection.label" />
             	<input type="hidden" id="purchaseShipmentInspection_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseShipmentInspectionFile" class="form-control" value="${purchaseShipmentInspection}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseShipmentInspectionBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('purchaseShipmentInspection',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseShipmentInspectionUrl}">
								<a href="${purchaseShipmentInspectionUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseShipmentInspectionImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
				
					<div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="goods.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.stock.request.label" />
             	<input type="hidden" id="goodsStockRequest_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsStockRequestFile" class="form-control" value="${goodsStockRequest}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsStockRequestBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('goodsStockRequest',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsStockRequestUrl}">
								<a href="${goodsStockRequestUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsStockRequestImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					 <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'goodsIssue');" id="goodsIssue"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.issue.label" />
             	<input type="hidden" id="goodsIssue_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsIssueFile" class="form-control" value="${goodsIssue}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsIssueBtn"  type="file" value="${goodsIssue}" accept=".xml" onchange="addNameToTextBox('goodsIssue',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsIssueUrl}">
								<a href="${goodsIssueUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

					</div>
             	</div>
             	       <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'goodsReceipt');" id="goodsReceipt"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.receipt.label" />
             	<input type="hidden" id="goodsReceipt_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsReceiptFile" class="form-control" value="${goodsReceipt}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsReceiptBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('goodsReceipt',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsReceiptUrl}">
								<a href="${goodsReceiptUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsReceiptImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

					</div>
             	</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.stock.return.label" />
             	<input type="hidden" id="goodsStockReturn_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsStockReturnFile" class="form-control" value="${goodsStockReturn}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsStockReturnBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('goodsStockReturn',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsStockReturnUrl}">
								<a href="${goodsStockReturnUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsStockReturnImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="stocks.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="stock.verification.label" />
             	<input type="hidden" id="stocksVerification_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="stocksVerificationFile" class="form-control" value="${stocksVerification}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="stocksVerificationBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('stocksVerification',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty stocksVerificationUrl}">
								<a href="${stocksVerificationUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="stocksVerificationImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div> --%>
					</div>
					</div>
                        <div class="row" style="text-align: right; margin-top: 0px;">
                     <div class="row">  
  <div class="col-lg-12" >
<div class="row" style="margin-top:15px">
<c:forEach var="accessControl" items="${sessionScope.settings}">
      <c:if test="${accessControl.appDocument == 'PrintSettings' && accessControl.write == true}">
		
		 <input type="button" id="submit" style="margin-right: 28px;" class="btnCls" data-toggle="modal" data-target="#myModal" value="<spring:message code="submit.label" />">
	</c:if>
</c:forEach>
		<input type="button" class="btnCls" style="margin-right: 28px;" onclick="showCustomerSettingsFlow();" value="<spring:message code="cancel.label" />">
</div>
	</div>
	</div>
        	 </div>
                      </div>
                      
                      
                      
                      
                         
                      <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer Print Settings</h4>
      </div>
      <div class="modal-body">
        <p>Requested to make changes in Customer Print Settings, do you want to continue and apply?</p>
      </div>
      <div class="modal-footer">
      <div class = "col-lg-6" >
<!--               <button type="button" class="btnCls"  onclick=""  data-dismiss="modal">Cancel</button> -->
      </div>
         <c:if test="${status == 'new'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validatePrintSettingsForm('new')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      <c:if test="${status == 'edit'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validatePrintSettingsForm('edit')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      </div>
    </div>

  </div>
</div>
                      
                      
                      
                      
                       <div class="box-footer">
                                    
                    </div>
                     </form>
	</div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>