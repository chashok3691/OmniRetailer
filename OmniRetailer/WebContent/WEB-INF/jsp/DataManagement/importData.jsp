<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Import Data | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
                <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        
        <%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dataManagement/import.js"></script>
<style type="text/css">
.input-group-addon {
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: center;
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.form-group {
    margin-bottom: 5px;
}

.slidedown
{
float:right;
width: 0;
height: 0;
border-style: solid;
margin-top:-28px;
cursor: pointer;
border-width: 23px 0 0 31px;
border-color: transparent transparent transparent gray;
}
.slideup
{
	float:right;
	width: 0;
    height: 0;
    text-indent: -9999px;
    border-bottom: 23px solid gray;
    border-left: 32px solid transparent;

}

.fileUpload {
    position: relative;
    overflow: transparent;
 	padding: 2px 12px;
 	margin-top: -3px;
}
.rightPadding {
	padding-left: 15px !important;
    padding-right: 5px !important;
}
.leftPadding {
    padding-left: 5px !important;
    padding-right: 15px !important;
}
.rightPaddingZero {
    padding-left: 15px !important;
    padding-right: 0px !important;
}
.alignImgtoTop {
	margin-top: -6px;
}
.hrlineStright {
	margin-top: 0px;
    margin-bottom: 0px;
    border: 0;
    border-top: 1px solid #ccc;
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
@media  (min-width:1240px) and (max-width:1440px){
.daily{
width: 20%;
}
.fortnight{
width: 30%;
}
}
.btn-primar {
	font-weight: bold;
	color: black;
    background-color: rgb(195,195,195);
    border-color: black;
}

.reset-button
{
        margin-left: 0%;
    margin-right: 15%;
    margin-top: 5px;
    width: 100%;
    padding: 3px;
    position: relative;
    float: right;
}
.start-button
{
       margin-left: 0%;
    margin-right: 40%;
    margin-top: 5px;
    width: 100%;
    padding: 3px;
    position: relative;
    float: right;

}
</style>
<script type="text/javascript">
$(document).ready(function(){
	debugger
	$("#Error").html("");
	callCalender("date");
	callCalender("edate")
	var result = $("#right-side").height();
// 	$("#main-menu").css("height",result+"px");
	
	//$("#main-menu").css("height","100%");
	$(".subBlock").hide();
		
});
/* var subBlockOpened = false;
function activateHeader(id,open){
	debugger
	if(subBlockOpened == true)
		{
	
		$("."+id).slideUp("fast");
		
		subBlockOpened=false;
		return false;
		}
	
	else if(subBlockOpened==false)
		{
		$("."+id).slideDown("fast");
	subBlockOpened=true;
	
		}
	$("."+id).slideDown("fast");
	//$('div.slideupAndDown').addClass('slideup').removeClass('slidedown');
}  */
function activateHeader(id,open){
	
	focusDiv("Error");
	$(".subBlock").each(function() {
		$(this).slideUp("fast");
	});
	var headerImg = $("#"+id+"Img").attr("src");
	var subBlockOpened = false;
	 if(headerImg.indexOf('right')!= -1){
		 subBlockOpened = true; 
	 }
	 var contextPath = $("#contextPath").val();
	 var img = contextPath+"/images/leftHeaderIconGreen.png";
	 $(".headerImg").each(function() {
		$(this).attr("src",img); 
	 });
	 if(subBlockOpened == true){
		 return;
	 }
	 $("#"+id+"Img").attr("src",contextPath+"/images/rightHeaderIconGreen.png");
	 $("."+id).slideDown("fast");
}


/* function downloadErrorLog()
{
	debugger;
	var anchor = document.createElement('a');
	anchor.href = errorUrl;
	anchor.target = '_blank';
	anchor.download = '';
	if(errorUrl != null && errorUrl != '')
		anchor.click();
	
} */


</script>
</head>
<body>
<%-- <section class="content-header">
   <h1><spring:message code="data.management.label" />
     <small><spring:message code="import.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="data.management.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">

  <div class="box box-primary">
  
  <div class="box-header" style="text-align: center;">
                                <h3 class="box-title"><spring:message code="import.data.label" /></h3>
                                </div>
  <br>
    <div class="box-body">
    						 	<div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;"></div>
    						 	<div id="SuccessMsg" class="Error" style="text-align:center;color:blue;font-weight:bold;">
    						 	 
    						 	</div>
    						 	<div id="url" style="text-align: center; display:none;">
    						 		To get the file Log details <a id = "errorUrl" style="color: #0000EE" target="_blank">click here </a>
    						 	</div>
    						 	<div id="Success" class="Error" style="text-align:center;color:blue;">
    						 	
    						 	</div>
    		
		<br>
		<!-- 	batches start -->
		
		 <div id="Errorid" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
		 <div id="Errorid" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
		
			
			 <div class="row form-group" style="">
	
			<!-- batches end -->
		
			
			<!-- <div class="col-lg-2">
			<div id="Error" name="Error" style="white-space:nowrap;float:right;color:red;font-weight:bold;margin-right:-117%;margin-top:27px;"></div>
		
			</div> -->
		
			<div class="row"style="    padding-bottom: 1.5%;">
               <div class="col-lg-4"></div>
			<div class="col-lg-4 col-sm-12">
			
		
			</div>
		<!-- <div class="col-lg-9 col-sm-12"></div>
			<div class="col-lg-2 clo-sm-12 col-xs-12" style="padding-left: 0px;padding-top:-15px;float:left">
			 <div class="row" style="text-align: center;">
    		 	<div id="Error" style="/* text-align:center; */color:red;font-weight:bold;"></div>
				<input type="button" id="submitnew" class="btn bg-olive btn-inline" style="margin-right:15%;" onclick="importFiles();" value="Submit">
				<input type="button" id="edit" class="btn bg-olive btn-inline" style="margin-left:-10%;width: 68px;margin-right: 23%;" onclick="resetFiles();" value="Reset">
			</div>
			</div> -->
			
			<div class="col-lg-4" style="margin:0px;padding-bottom:0px; text-align:center">
			</div>
								
								  	<input type="button" class="btn bg-olive btn-inline" style="    margin-right: 2.5%; position: relative;    float: right;    width: 17%;" onclick=" validateImportPackage('new');" value="SAVE AS PACKAGE" />
								
			</div>
				<div class="row">
	 
		
			

             <c:if test="${flow == 'generic'}">
<!-- 	Generic Master start -->
             <div class="row ">
             <div class="form-group col-lg-10 " style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;">Generic Master</label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                  <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('GenericMaster');" id="GenericMasterImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
              <!-- <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetFiles();" value="Reset"/>
				</div> -->
				<div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('genericMasterreset');" value="Reset"/>
				</div> 
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>				 
             
             </div>
             
           
             
             
             
             
             
             
            <div class="GenericMaster subBlock">
             	 
	            
	             
	          
               <div class="row">
               	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3 rightPaddingZero" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="genericMasterreset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'suppliers');" id="suppliers"/>&nbsp;&nbsp;&nbsp;<spring:message code="product.secondary.supplier.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control" name="dealStatus" class="genericMasterreset" disabled="disabled"  id="suppliersFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="suppliersFile" class="form-control" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="suppliersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('suppliers');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('suppliers','${sessionScope.customerId}')"><img title="Data Format" class="alignImgtoTop" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
									<img style="width: 30px;" id="suppliersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
           
               <div class="row">
               	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="genericMasterreset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'taxMasterImport');" id="taxMasterImport"/>&nbsp;&nbsp;&nbsp;<spring:message code="data.export.Stockreceipt" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control genericMasterreset" name="dealStatus" id="taxMasterImportFileType" disabled>
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="taxMasterImportFile" class="form-control genericMasterreset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="taxMasterImportBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('taxMasterImport');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('taxMasterImport','${sessionScope.customerId}')"><img title="Data Format" class="alignImgtoTop" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
									<img style="width: 30px" id="taxMasterImportImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
		
            
                <div class="row">
                <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="genericMasterreset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'importbrandMaster');" id="importbrandMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="data.export.brandmaster" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control genericMasterreset" name="dealStatus" id="importbrandMasterFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="importbrandMasterFile" class="form-control genericMasterreset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="importbrandMasterBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('importbrandMaster');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('importbrandMaster','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
									<img style="width: 30px" id="taxMasterImportImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
	  					
	  					<%-- <div class="form-group col-lg-4">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="importbrandMasterBtn" disabled="disabled" class="productCatelog" type="file"  onchange="addNameToTextBox('importbrandMaster');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="importbrandMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div> --%>
					</div>
             </div>
             <div class="row">
                <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="genericMasterreset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'departments');" id="departments"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.departments.master.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control genericMasterreset" name="departmentsFileType" id="departmentsFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="departmentsFile" class="form-control genericMasterreset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="departmentsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('departments');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('departments','${sessionScope.customerId}')"><img title="Data Format" alt="" class="alignImgtoTop" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="stockReceiptImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
             </div>
            
               <div class="row">
               	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox"  class="genericMasterreset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'employeeMasterImport');" id="employeeMasterImport"/>&nbsp;&nbsp;&nbsp;<spring:message code="data.import.employeemaster" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control genericMasterreset" name="dealStatus" id="employeeMasterImportFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="employeeMasterImportFile" class="form-control genericMasterreset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="employeeMasterImportBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('employeeMasterImport');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('employeeMasterImport','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
									<img style="width: 30px" id="employeeMasterImportImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
		
          
                </div>
               <!-- 	Generic Master End -->
                
           <!-- 	Outlet Master start -->
           
         <div class="row ">
             <div class="form-group col-lg-10 " style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;">Outlet Master</label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                  <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletMaster');" id="outletMasterImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
              <!-- <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetFiles();" value="Reset"/>
				</div> -->
				<div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('OutletMasterReset');" value="Reset"/>
				</div> 
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>				 
             
             </div>
             
             
            
            <div class="outletMaster subBlock">
             	
             <div class="row ">
	             <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'skuMaster');" class="OutletMasterReset" id="skuMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.sku.master.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control OutletMasterReset"  name="dealStatus" disabled="disabled" id="skuMasterFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="skuMasterFile" class="OutletMasterReset form-control" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;" >
				    			<span style="font-size: 15px;">Browse</span> <input id="skuMasterBtn"  disabled="disabled" type="file"
															onchange="addNameToTextBox('skuMaster');"
															class="OutletMasterReset upload" />
													</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('skumaster','${sessionScope.customerId}')" type="application/octet-stream"><img title="Data Format" alt="" style="width: 35px" class="alignImgtoTop" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="skuMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
	            </div>
	            
	            
	            
	          
	            
	            
	            
	            
	            
	            <!-- <group master start -->
	            
	          
	              <div class="row">
	             <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" style="vertical-align: -2px" class="OutletMasterReset"  onchange="enableFileBrowse(this,'groupMaster');" id="groupMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.group.master.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control OutletMasterReset" name="dealStatus" disabled="disabled"  id="groupMasterFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="groupMasterFile" class="form-control OutletMasterReset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="groupMasterBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('groupMaster');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('groupMaster','${sessionScope.customerId}')" type="application/octet-stream"><img title="Data Format" alt="" class="alignImgtoTop" style="width: 35px" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="groupMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
	            </div>
	         
             
             
                          <div class="row">
                <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="OutletMasterReset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'skuEans');" id="skuEans"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.sku.eans.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control OutletMasterReset" name="dealStatus" id="skuEansFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="skuEansFile" class="form-control OutletMasterReset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar OutletMasterReset" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="skuEansBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('skuEans');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('skuEans','${sessionScope.customerId}')"><img title="Data Format" alt="" class="alignImgtoTop" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="skuEansImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
             </div>
            
             
                </div>
           
             <!-- 	Outlet Master start -->
             
              <div class="row ">
             <div class="form-group col-lg-10 " style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;">Warehouse Master</label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                  <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('warehouseMaster');" id="warehouseMasterImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
              <!-- <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetFiles();" value="Reset"/>
				</div> -->
				<div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('warehouseMasterReset');" value="Reset"/>
				</div> 
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>				 
             
             </div>
             
             <!-- 	Warehouse Master start --> 
            <div class="warehouseMaster subBlock">
             	
	            
	             <div class="row">
	             <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="warehouseMasterReset"  style="vertical-align: -2px" onchange="enableFileBrowse(this,'warehouseskuMaster');" id="warehouseskuMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="warehouse.sku.master" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control warehouseMasterReset" name="dealStatus" disabled="disabled"  id="warehouseskuMasterFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="warehouseskuMasterFile" class="form-control" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="warehouseskuMasterBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('warehouseskuMaster');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('warehouseskuMaster','${sessionScope.customerId}')" type="application/octet-stream"><img title="Data Format" alt="" class="alignImgtoTop" style="width: 35px" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="warehouseskuMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
	            </div>
	            
	           
	              <div class="row">
	             <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" style="vertical-align: -2px" class="warehouseMasterReset"  onchange="enableFileBrowse(this,'WhgroupMaster');" id="WhgroupMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.group.master.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control warehouseMasterReset" name="dealStatus" disabled="disabled"  id="WhgroupMasterFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="WhgroupMasterFile" class="form-control warehouseMasterReset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="WhgroupMasterBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('WhgroupMaster');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('WhgroupMaster','${sessionScope.customerId}')" type="application/octet-stream"><img title="Data Format" class="alignImgtoTop" alt="" style="width: 35px" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="WhgroupMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
	            </div>
	           
                          <div class="row">
                <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox"  class="warehouseMasterReset" style="vertical-align: -2px" onchange="enableFileBrowse(this,'WhskuEans');" id="WhskuEans"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.sku.eans.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control warehouseMasterReset" name="dealStatus" id="WhskuEansFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="WhskuEansFile" class="form-control warehouseMasterReset" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar warehouseMasterReset" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="WhskuEansBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('WhskuEans');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('WhskuEans','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="WhskuEansImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
					</div>
             </div>
            
             
                </div>
           
             <!-- 	Warehouse Master start -->
           
           </c:if>
           
           
           
             <!-- added by kalyan above  -->
           <!--   product catalogue end -->
           <!-- inventory managment start -->
           <c:if test="${flow != 'generic'}" >
                        <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;"><spring:message code="inventory_managements.label" /></label>
               <!--   <hr style="margin-top: -5px;width: 99%;" /> -->
                <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('inventoryManagement');" id="inventoryManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
                 <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('inventoryMan');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
             
             </div>
             
             <div class="inventoryManagement subBlock">
             
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="inventoryMan" style="vertical-align: -2px" onchange="enableFileBrowse(this,'goodsReceipts');" id="goodsReceipts"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.stock.receipts.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control inventoryMan" name="dealStatus" disabled="disabled" id="goodsReceiptsFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="goodsReceiptsFile" class="form-control inventoryMan" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="goodsReceiptsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('goodsReceipts');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('goodsReceipts','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;">
								<img style="width: 30px" id="goodsReceiptsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="inventoryMan" style="vertical-align: -2px" onchange="enableFileBrowse(this,'goodsIssue');" id="goodsIssue"/>&nbsp;&nbsp;&nbsp;<spring:message code="goodsindent.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control inventoryMan" name="dealStatus" disabled="disabled"  id="goodsIssueFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="goodsIssueFile" class="form-control inventoryMan" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="goodsIssueBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('goodsIssue');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('goodsIssue','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
              <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox"  class="inventoryMan" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockreturn');" id="stockreturn"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.stock.return.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control inventoryMan" name="dealStatus" disabled="disabled"  id="stockreturnFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="stockreturnFile" class="form-control inventoryMan" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="stockreturnBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('stockreturn');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('stockreturn','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
              <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="inventoryMan" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockrequest');" id="stockrequest"/>&nbsp;&nbsp;&nbsp;<spring:message code="warehouse.stockrequests.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control inventoryMan" name="dealStatus" disabled="disabled"  id="stockrequestFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="stockrequestFile" class="form-control inventoryMan" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="stockrequestBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('stockrequest');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('stockrequest','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="inventoryMan" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockVerification');" id="stockVerification"/>&nbsp;&nbsp;&nbsp;<spring:message code="stock.verification.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control inventoryMan" name="dealStatus" disabled="disabled"  id="stockVerificationFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="stockVerificationFile" class="form-control inventoryMan" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="stockVerificationBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('stockVerification');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('stockVerification','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;">
								<img style="width: 30px" id="stockVerificationImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
					</div>
             </div>
            
              </div>
           
           <!-- inventory managment end -->
          <!--  order managment start  -->
              <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;"><spring:message code="import.order.managment.label" /></label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                 <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('orderManagement');" id="orderManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
                <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('orderManagement');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
             </div>
             <div class="orderManagement subBlock">
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="orderManagement" style="vertical-align: -2px" onchange="enableFileBrowse(this,'newOrders');" id="newOrders"/>&nbsp;&nbsp;&nbsp;<spring:message code="new.order" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control orderManagement" name="dealStatus" disabled="disabled"  id="newOrdersFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="newOrdersFile" class="form-control orderManagement"  placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="newOrdersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('newOrders');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('newOrders','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;;">
								<img style="width: 30px" id="newOrdersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="orderManagement" style="vertical-align: -2px" onchange="enableFileBrowse(this,'pendingOrders');" id="pendingOrders"/>&nbsp;&nbsp;&nbsp;<spring:message code="pending.orders" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control orderManagement" name="dealStatus" disabled="disabled"  id="pendingOrdersFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="pendingOrdersFile" class="form-control orderManagement" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="pendingOrdersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('pendingOrders');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('pendingOrders','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="pendingOrdersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
                 <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" style="vertical-align: -2px" class="orderManagement" onchange="enableFileBrowse(this,'cancelledOrders');" id="cancelledOrders"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.cancelled.orders" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control orderManagement" name="dealStatus" disabled="disabled"  id="cancelledOrdersFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="cancelledOrdersFile" class="form-control orderManagement" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="cancelledOrdersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('cancelledOrders');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('cancelledOrders','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="pendingOrdersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="orderManagement"style="vertical-align: -2px" onchange="enableFileBrowse(this,'fulfilledOrders');" id="fulfilledOrders"/>&nbsp;&nbsp;&nbsp;<spring:message code="fullfilled.orders.label" /> <spring:message code="orders.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control orderManagement" name="dealStatus" disabled="disabled" id="fulfilledOrdersFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="fulfilledOrdersFile" class="form-control orderManagement" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="fulfilledOrdersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('fulfilledOrders');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('fulfilledOrders','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="fulfilledOrdersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
             </div>
          <!-- order managment end -->
          <!--  Billing Start -->
          <c:if test="${flow != 'warehouse'}">
             <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;"><spring:message code="billing.label" /></label>
               <!--   <hr style="margin-top: -5px;width: 99%;" /> -->
                <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('billing');" id="billingImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
             <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('billing');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
             </div>
             
             <div class="billing subBlock">
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="billing" style="vertical-align: -2px" onchange="enableFileBrowse(this,'bills');" id="bills"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.billing.completed_bills.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control billing" name="dealStatus" disabled="disabled"  id="billsFileType">
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="billsFile" class="form-control billing" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="billsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('bills');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('bills','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="completedBillsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="billing" style="vertical-align: -2px" onchange="enableFileBrowse(this,'returns');" id="returns"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.billing.returned_bills.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control billing" name="dealStatus" id="returnsFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="returnsFile" class="form-control billing" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="returnsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('returns');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('returns','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="completedBillsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             
               <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="billing" style="vertical-align: -2px" onchange="enableFileBrowse(this,'exchangedBills');" id="exchangedBills"/>&nbsp;&nbsp;&nbsp;<spring:message code="all.exchanged.bills.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control billing" name="dealStatus" id="exchangedBillsFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="exchangedBillsFile" class="form-control billing" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="exchangedBillsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('exchangedBills');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('exchangedBills','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;">
							<img style="width: 30px" id="exchangedBillsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="billing"style="vertical-align: -2px" onchange="enableFileBrowse(this,'canceledbills');" id="canceledbills"/>&nbsp;&nbsp;&nbsp;<spring:message code="all.canceled.bills.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control billing" name="dealStatus" id="canceledbillsFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="canceledbillsFile" class="form-control billing" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="canceledbillsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('canceledbills');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('canceledbills','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
							<img style="width: 30px" id="cancelledBillsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div></div>
           </c:if>
           
             <!-- billing end -->
        
        <!--    shippment start -->
             
             <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-top:10px;padding-right: 9px;">
             	<label style="font-size: 18px;"><spring:message code="deliveries.label" /></label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                 <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('shipments');" id="shipmentsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
              <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('shipment');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
             </div>
             <div class="shipments subBlock">
             <c:if test="${flow == 'generic'}">
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'pendingShipments');" id="pendingShipments"/>&nbsp;&nbsp;&nbsp;<spring:message code="pending.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="pendingShipmentsFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="pendingShipmentsFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="pendingShipmentsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('pendingShipments');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('pendingShipments','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="pendingShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox"  class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentOrders');" id="shipmentOrders"/>&nbsp;&nbsp;&nbsp;<spring:message code="shipped.orders.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control" name="shipment" id="shipmentOrdersFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="shippedFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="shipmentOrdersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('shipmentOrders');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('shipmentOrders','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;;">
								<img style="width: 30px" id="shippedImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'completedShipments');" id="completedShipments"/>&nbsp;&nbsp;&nbsp;<spring:message code="completed.bills.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control" name="dealStatus" id="completedShipmentsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="completedShipmentsFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="completedShipmentsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('completedShipments');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('completedShipments','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="completedShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
             
                <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentcancelBills');" id="shipmentcancelBills"/>&nbsp;&nbsp;&nbsp;<spring:message code="import.shippment.cancelled.bills" />
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="shipmentcancelBillsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="completedShipmentsFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="shipmentcancelBillsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('shipmentcancelBills');" class="upload" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('shipmentcancelBills','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="completedShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
             </c:if>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentNote');" id="shipmentNote"/>&nbsp;&nbsp;&nbsp;<spring:message code="shipment.notes.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="shipmentNoteFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="shipmentNoteFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="shipmentNoteBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('shipmentNote');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('shipmentNote','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="completedShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentOrder');" id="shipmentOrder"/>&nbsp;&nbsp;&nbsp;<spring:message code="warehouse.shipmentirders.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="shipmentOrderFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="shipmentOrderFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="shipmentOrderBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('shipmentOrder');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="completedShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
              <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'gatepass');" id="gatepass"/>&nbsp;&nbsp;&nbsp;<spring:message code="warehouse.shipmentgatepass.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="gatepassFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="gatepassFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="gatepassBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('gatepass');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="completedShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'invoices');" id="invoices"/>&nbsp;&nbsp;&nbsp;<spring:message code="warehouse.invoices.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="invoicesFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="invoicesFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="invoicesBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('invoices');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="completedShipmentsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>							
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> 
              <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentReturns');" id="shipmentReturns"/>&nbsp;&nbsp;&nbsp;<spring:message code="emailSettings.procurement.shipment_returns" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="shipmentReturnsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="shipmentReturnsFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="shipmentReturnsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('shipmentReturns');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="shipment" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentReceipt');" id="shipmentReceipt"/>&nbsp;&nbsp;&nbsp;<spring:message code="goods.receipts.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control shipment" name="dealStatus" id="shipmentReceiptFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="shipmentReceiptFile" class="form-control shipment" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="shipmentReceiptBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('shipmentReceipt');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;;">
								<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
            
             </div>
            <!-- 		shippment end -->
	<c:if test="${flow != 'warehouse'}">
           <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-right: 10px">
             	<label style="font-size: 18px;"><spring:message code="deals.and.offers" /></label>
                 <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('deals');" id="dealsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            </div>
             </div>
              <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('dealsAndOffers');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
           </div>
           
           
            <div class="deals subBlock">
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="dealsAndOffers" style="vertical-align: -2px" onchange="enableFileBrowse(this,'currentDeals');" id="currentDeals"/>&nbsp;&nbsp;&nbsp;<spring:message code="current.deals.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control dealsAndOffers" name="dealStatus" id="currentDealsFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                            <option value="2">FTP</option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="currentDealsFile" class="form-control dealsAndOffers" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="currentDealsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('currentDeals');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="currentDealsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
           <%--   <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="dealsAndOffers" style="vertical-align: -2px" onchange="enableFileBrowse(this,'pastDeals');" id="pastDeals"/>&nbsp;&nbsp;&nbsp;<spring:message code="past.deals.label" />
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control dealsAndOffers" name="dealStatus" id="pastDealsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5">
	  						<input id="pastDealsFile" class="form-control dealsAndOffers" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="pastDealsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('pastDeals');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;;">
								<img style="width: 30px" id="pastDealsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> --%>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="dealsAndOffers" style="vertical-align: -2px" onchange="enableFileBrowse(this,'currentOffers');" id="currentOffers"/>&nbsp;&nbsp;&nbsp;<spring:message code="current.offers.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control dealsAndOffers" name="dealStatus" id="currentOffersFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
			                	 <option value="2">FTP</option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="currentOffersFile" class="form-control dealsAndOffers" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="currentOffersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('currentOffers');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;;">
								<img style="width: 30px" id="currentOffersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
         <%--      <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="dealsAndOffers" style="vertical-align: -2px" onchange="enableFileBrowse(this,'pastOffers');" id="pastOffers"/>&nbsp;&nbsp;&nbsp;<spring:message code="past.offers.label" />
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control dealsAndOffers" name="dealStatus" id="pastOffersFileType" disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5">
	  						<input id="pastOffersFile" class="form-control dealsAndOffers" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="pastOffersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('pastOffers');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="pastOffersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> --%>
             
             
             </div>
           <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-right: 10px;">
             	<label style="font-size: 18px;"><spring:message code="customer.loyalty.label" /></label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                 <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('loyality');" id="loyalityImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
              <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('loyalityCrm');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
           </div>
           
           <div class="loyality subBlock">
           
             <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="loyalityCrm" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftVouchers');" id="giftVouchers"/>&nbsp;&nbsp;&nbsp;<spring:message code="giftvouchers.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control loyalityCrm" name="dealStatus" id="giftVouchersFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="giftVouchersFile" class="form-control loyalityCrm" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="giftVouchersBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('giftVouchers');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('giftVouchers','${sessionScope.customerId}')"> <img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	<span style="visibility: hidden;">
								<img style="width: 30px" id="giftVouchersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	</span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="loyalityCrm" style="vertical-align: -2px" onchange="enableFileBrowse(this,'coupons');" id="coupons"/>&nbsp;&nbsp;&nbsp;<spring:message code="coupons.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control loyalityCrm" name="dealStatus" id="couponsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="couponsFile" class="form-control loyalityCrm" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="couponsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('coupons');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('coupons','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;;">
								<img style="width:30px" id="couponsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="loyalityCrm" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loaltyCards');" id="loaltyCards"/>&nbsp;&nbsp;&nbsp;<spring:message code="loyaltycards.label" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control loyalityCrm" name="dealStatus" id="loaltyCardsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="loaltyCardsFile" class="form-control loyalityCrm" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="loaltyCardsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('loaltyCards');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('loyaltyCards','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <span style="visibility: hidden;">
								<img style="width: 30px" id="loaltyCardsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
							 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div></div>
             <div class="row">
             <div class="form-group col-lg-10" style="padding-left: 7.3%;padding-right: 10px;">
             	<label style="font-size: 18px;"><spring:message code="customer.relationship.management" /></label>
                <!--  <hr style="margin-top: -5px;width: 99%;" /> -->
                 <div class="form-group col-lg-12 slideupAndDown" style="">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							           <!--    <a class="headerImg slidedown" style="" onclick="activateHeader('productsCatalogue');" id="productsCatalogueImg"></a> 						                </div> --> 
							              	<img class="headerImg" style="float: right;cursor: pointer;margin-right:-16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('customerRelationshipManagement');" id="customerRelationshipManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">  
							               <hr style="margin-top:-4px;" /> 
            
            
             </div>
             </div>
              <div class="form-group col-lg-1 ">
             <input type="button" id="edit"  class="btn bg-olive btn-inline reset-button" onclick="resetOnId('CRM');" value="Reset"/>
				</div>
			<div class="form-group col-lg-1 ">
				<input type="button" id="edit"  class="btn bg-olive btn-inline start-button" style="" onclick="importFiles();" value="Start" />
				</div>	
             
           </div>
           
           
           <div class="customerRelationshipManagement subBlock">
            
           
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="CRM" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerImport');" id="customerImport"/>&nbsp;&nbsp;&nbsp;<spring:message code="customer.newfeedback.customer" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control CRM"  name="dealStatus" id="customerImportFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="customerImportFile" class="form-control CRM" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="customerImportBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('customerImport');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a onclick="downloadImportFiles('customerImport','${sessionScope.customerId}')"><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="customerImportImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						
						
					</div>
             </div>
            
            
           <%--   <div class="row">
             	 <div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="CRM" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customersProfile');" id="customersProfile"/>&nbsp;&nbsp;&nbsp;<spring:message code="customers.profile" />
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control CRM" name="dealStatus" id="customersProfileFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5">
	  						<input id="customersProfileFile" class="form-control CRM" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="customersProfileBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('customersProfile');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;;">
								<img style="width: 30px" id="customersProfileImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div> --%>
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class = "CRM" style="vertical-align: -2px" onchange="enableFileBrowse(this,'complaints');" id="complaints"/>&nbsp;&nbsp;&nbsp;<spring:message code="customer.complaints" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control CRM" name="dealStatus" id="complaintsFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="complaintsFile" class="form-control CRM" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="complaintsBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('complaints');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
							<img style="width: 30px" id="customerComplaintsImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						<!-- <div class="col-lg-2">
						</div>
						<div class="col-lg-2" style="display: none;">
						</div> -->
					</div>
             </div>
             
             
             
             
            
             
             
             
             
             
             
             <div class="row">
             	<div class="col-lg-1"></div>
	             	<div class="form-group col-lg-3" style="font-size: 16px;white-space: nowrap;">
	             		<input type="checkbox" class="CRM" style="vertical-align: -2px" onchange="enableFileBrowse(this,'feedback');" id="feedback"/>&nbsp;&nbsp;&nbsp;<spring:message code="customer.feedback" /><span style="color: #ccc;">&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;--</span>
	             	</div>
	             	<div class="form-group col-lg-8">
	             		<div class="form-group col-lg-3 col-sm-2 rightPadding" >
			                <select class="form-control CRM"  name="dealStatus" id="feedbackFileType"disabled="disabled" >
			                	 <option value=""><spring:message code="import.select.file.type.label"/></option>
	                             <option value="1">JDA</option>
	                             <option value="0">XLSX</option>
	                         </select>
						</div> 
	             		<div class="form-group col-lg-5 nopadding">
	  						<input id="feedbackFile" class="form-control CRM" placeholder="Choose File" disabled="disabled" />
	  					</div>
	  					<div class="form-group col-lg-4 leftPadding">
							<div class="fileUpload btn btn-primar" style="font-weight: bold;">
				    			<span style="font-size: 15px;">Browse</span>
				    			<input id="feedbackBtn" disabled="disabled" type="file"  onchange="addNameToTextBox('feedback');" class="upload" />
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
						  	<a><img title="Data Format" alt="" style="width: 35px;" class="alignImgtoTop"  src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
						  	 &nbsp;&nbsp;&nbsp;&nbsp;
						  	 <span style="visibility: hidden;">
								<img style="width: 30px" id="customerFeedbackImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 </span>
						</div>
						
						
					</div>
             </div>
             
             
             
             
            </div>
             </c:if> 
             </c:if>
   				<div class="row">
               <div class="col-lg-4"></div>
			<div class="col-lg-4 col-sm-12">
			
		
			</div>
		<!-- <div class="col-lg-9 col-sm-12"></div>
			<div class="col-lg-2 clo-sm-12 col-xs-12" style="padding-left: 0px;padding-top:-15px;float:left">
			 <div class="row" style="text-align: center;">
    		 	<div id="Error" style="/* text-align:center; */color:red;font-weight:bold;"></div>
				<input type="button" id="submitnew" class="btn bg-olive btn-inline" style="margin-right:15%;" onclick="importFiles();" value="Submit">
				<input type="button" id="edit" class="btn bg-olive btn-inline" style="margin-left:-10%;width: 68px;margin-right: 23%;" onclick="resetFiles();" value="Reset">
			</div>
			</div> -->
			
			<div class="col-lg-4" style="margin:0px;padding-bottom:0px; text-align:center">
			</div>
								
								  	<input type="button" class="btn bg-olive btn-inline" style="    margin-right: 3.5%; position: relative;    float: right;    width: 17%;" onclick="validateImportPackage('new');" value="SAVE AS PACKAGE" />
								
			</div>
             
             
       <hr style="margin-top: 8px; margin-left: 3.9%;margin-right: 2%; border: 1px solid #eee;" /> 
             
             
             
             <div class=" form-group col-lg-3 col-sm-4 col-xs-12" style="padding-left: 5%;padding-right: 0px;">
			 <div class="row" >
			 
			  <div class="form-group col-lg-10 col-sm-12 col-xs-12" style=" padding-right: 0px;margin-bottom: -3px">
			 
			  <div class="form-group col-lg-10 col-sm-12 col-xs-11" style=" padding-left: 0px;">
			   <label for=""><spring:message code="import.Package_Name.label" /></label>
			   <input type="text" class="form-control" id="packageName">
			   </div>
			  </div>
			  <span id="packageError" style="text-align: right;padding-left: 15px; color: red; font-size: 2; font-weight: bold;"></span>
			 </div>
		
			
			
			   <div class="row" >
			  
			  <div class=" col-lg-12 col-sm-12 col-xs-12" style=" padding-right: 0px;margin-bottom: -3px">
			 
			  <div class=" col-lg-12 col-sm-12 col-xs-11" style=" padding-left: 0px;">
			   <label for=""><spring:message code="import.Package_Title.label" /></label>
			   <input type="text" class="form-control" id="packageTittle">
			   </div>
			  </div>
			 </div>
			 </div>
			   
			
		
			
			         <div class="col-lg-1"></div>
			            <div class=" col-lg-2 form-group">
                                     <div class="row ">
                                   
                                        <div class="address-group col-lg-11 col-xs-9">
                                       <label for=""><spring:message code="import.Start_Date.label" /></label>
                                            <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" name="dueDateStr" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                            <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                        </div>
                                       
                                    <div class="row form-group">
                                    
                                   <div class="address-group col-lg-11 col-xs-9">
                                         <label><spring:message code="import.End_Date.label" /></label>
                                            <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" name="dueDateStr" id="edate" size="20" type="text" onfocus="callCalender('edate')" onclick="callCalender('edate')" placeholder="DD/MM/YYYY"/>
                                            <span id="lastDateForQuoteStrError" style="text-align: right; color: red; font-size: 2;width:70px; font-weight: bold;"></span>
                                        </div>
                             </div>
                          </div>
			
	
			
				<div class="col-lg-1"></div>
			
		        	<div class=" col-lg-5">
				      <div class=" col-lg-12 ">
				
			             <div class="row ">
                                   
                                        <div class="address-group col-lg-4 col-xs-9">
                                          <div class="bootstrap-timepicker">
                                         <label for=""><spring:message code="import.Start_Time.label" /></label>
                                            <input type="text" class=" form-control timepicker" value="00:00:00" name="startTime" id="startTime">
                                            <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                        </div></div>
			 
			<div class="row">
			
			  <div class="col-lg-3 col-sm-3 col-xs-3" style=" /*padding-left: 0px;*/padding-right: 0px;margin-top: 2px">
			   <label style="font-size: 16px"><spring:message code="import.Recursive.label" /></label>
			  <!--  <input type="checkbox" style="vertical-align: -3px"> -->
			  </div>
          <div class="col-lg-7 col-sm-6 col-xs-2" style="border: 1px solid rgba(0, 0, 0, 0.1); margin-top: 4px; width: 70%;padding-left: 25px">
             <div class="row">
                 <div class="col-lg-2  col-sm-6 daily" style="  padding-left: 0px;  padding-right: 0px;">
                  <input type="radio" style="vertical-align: -1px;margin-right: 2px" name="x"><label><spring:message code="import.Daily.label" /></label>
                </div>
             <div class="col-lg-3 col-sm-6" style="padding-left: 0px; padding-right: 0px;">
                <input type="radio" style="vertical-align: -1px;margin-right: 2px" name="x"><label><spring:message code="import.Weekly.label" /></label>
             </div>
         <div class="col-lg-3 col-sm-6 fortnight" style="  padding-right: 0px;   padding-left: 0px;">
                <input type="radio" style="vertical-align: -1px;margin-right: 2px ;white-space:nowrap" name="x"><label><spring:message code="import.Fortnight.label" /></label>
         </div>
         <div class="col-lg-3 col-sm-6" style=" padding-left: 0px;  padding-right: 0px;">
             <input type="radio" style="vertical-align: -1px;margin-right: 2px" name="x"><label><spring:message code="import.Monthly.label" /></label>
          </div>
  
<!-- &nbsp; -->
  
      </div>
			</div>
			</div>
			
			<div class="row" style="padding-top:2px;">
			
			  <!-- <div class="col-lg-8 col-sm-6 col-xs-8" style="margin-bottom: -15px;">
  <br> -->
       <div class="col-lg-4 col-sm-3 col-xs-3" style=" /*padding-left: 0px;*/padding-right: 0px;margin-top: -2px">
         <label><spring:message code="week.days.label" /></label>
 <!-- <hr style="margin-top: -1px;width: 99%;">			   
			  -->
  <!-- </div> -->
			 </div></div>
         <div class="row" >
			 <div class="col-lg-2 col-sm-2 col-xs-2"></div>
			  <div class="col-lg-10 col-sm-8 col-xs-10" style=" margin-top: -20px; padding-left: 8%;white-space:nowrap">
			  <div class="col-lg-2 col-sm-4" style="padding-right: 0px;padding-left: 0px">
                  <input type="checkbox" style=" vertical-align: -3px;width: 25px;height: 15px;"><label><spring:message code="import.Select_Week_Days.Mon.label" /></label>&nbsp;	
               </div>		   
         <div class="col-lg-2 col-sm-4" style="padding-left: 0px;padding-right: 0px;margin-top:0px;">
                <input type="checkbox" style=" width: 25px;  height: 15px; vertical-align: -3px;"><label><spring:message code="import.Select_Week_Days.Tue.label" /></label>
          </div>
            <div class="col-lg-2 col-sm-4" style="padding-right: 0px;padding-left: 0px">
                <input type="checkbox" style="vertical-align: -3px; width: 25px; height: 15px;"><label><spring:message code="import.Select_Week_Days.Wed.label" /></label>
            </div>
           <div class="col-lg-2 col-sm-4" style="padding-right: 0px;padding-left: 0px">
               <input type="checkbox" style=" vertical-align: -3px;width: 25px; height: 15px;"><label style="width: 25px; height: 15px;"><spring:message code="import.Select_Week_Days.Thu.label" /></label>
            </div>
           <div class="col-lg-2 col-sm-4" style="padding-right: 0px;padding-left: 0px">
               <input type="checkbox" style="vertical-align: -3px;width: 25px; height: 15px;"><label style=" width: 25px; height: 15px;"><spring:message code="import.Select_Week_Days.Fri.label" /></label>
           </div>
          <div class="col-lg-2 col-sm-4" style="padding-right: 0px;padding-left: 0px">
              <input type="checkbox" style=" width: 25px; height: 15px; vertical-align: -3px;"><label><spring:message code="import.Select_Week_Days.Sat.label" /></label>
          </div>	
			  
			</div>
			</div>
			</div>
			
			</div> 
							 	<div id="Error" style="text-align:center;color:red;font-weight:bold;"></div>
			
                <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid">
				         <table id="example1" class="table table-bordered table-striped" style=" margin-left: 3.6%;margin-right:3.6%; width: 94.3%">
                            <thead style="background-color: #ccc !important; color: #ffffff">
                               <tr>
                                	<th style="border: 1px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                	  <th style="border: 1px solid #444 !important;"><spring:message code="import.Package_Name.label" /></th>
                                    <th style="border: 1px solid #444 !important;"><spring:message code="created.on.label" /></th>
                                    <th style="border: 1px solid #444 !important;"><spring:message code="created.by.label" /></th>
                                    <th style="border: 1px solid #444 !important;"><spring:message code="status.label" /></th>
                                    <th style="border: 1px solid #444 !important;"><spring:message code="EmployeeForm.action" /></th>
                                </tr>
                            </thead>
                            
                           
                            
                             <tbody style="text-align: center;">
                                 <c:forEach var="item" items="${batchOperationsResponse}" varStatus="theCount">
             		              <tr id="dynamicdiv${theCount.count}">
             		                            <td>${theCount.count}</td>
              									<td>${item.batch_title}</td>
                  								<td >${item.created_onStr}</td>
                  								<td></td>
                  								<td></td>
                  								<td id="Del${theCount.count}" >
                  								<a href="#" style="text-decoration:underline;color:blue" onclick="">Open Log</a>&nbsp;
                  								<img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:8%;cursor:pointer;' onclick='deleteItem(this,"${item.batch_id}");' /></td>
                  	   				
                  	               </tr>
                  	               
                  	               
              		             </c:forEach> 
	                       	 </tbody>
                            
                            
                            </table>
                            </div>
<!-- 		<br> -->
<!--            <div class="col-lg-4"></div> -->
<!-- 			<div class="col-lg-4 col-sm-12"> -->
			
		
			</div>
		<!-- <div class="col-lg-9 col-sm-12"></div>
			<div class="col-lg-2 clo-sm-12 col-xs-12" style="padding-left: 0px;padding-top:-15px;float:left">
			 <div class="row" style="text-align: center;">
    		 	<div id="Error" style="/* text-align:center; */color:red;font-weight:bold;"></div>
				<input type="button" id="submitnew" class="btn bg-olive btn-inline" style="margin-right:15%;" onclick="importFiles();" value="Submit">
				<input type="button" id="edit" class="btn bg-olive btn-inline" style="margin-left:-10%;width: 68px;margin-right: 23%;" onclick="resetFiles();" value="Reset">
			</div>
			</div> -->
			
<!-- 			<div style="margin-top:35px;text-align:center"> -->
<!-- 				<input type="button" id="edit" style="position: relative;float:right;margin-right: 3.8%;" class="btn bg-olive btn-inline" onclick="resetFiles();" value="Reset"/> -->
<!-- 								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;position: relative;float:right" onclick="importFiles();" value="Start" /> -->
								 
								
<!-- 								  	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 0%;position: relative;float:right" onclick="importFiles();" value="SAVE AS PACKAGE" /> -->
								
<!-- 			</div> -->
			</div>
			
			<br/>
            <div class="box-footer"></div>
            </div>
         </div>
         </div><!-- /.box -->
  

</section><!-- /.content -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
     
  });
        </script>
</body>
</html>