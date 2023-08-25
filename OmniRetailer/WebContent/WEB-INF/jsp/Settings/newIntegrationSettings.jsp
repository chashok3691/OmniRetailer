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
        <%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/hardwareAndsoftwareSetting.js"></script>
		<script type="text/javascript">
 
		var openslide =  false;
		function addItemIdOnLoad(Id,count)
		{
		debugger	
			  var container = $('#'+Id+"Add");
			   var inputs = container.find('input');
			   var idCount = inputs.length+1;
			var text = $("#"+Id+"Id"+count).val();
			
			var appendSettings = {manufacturer: $("#"+Id+"Manufacturer"+count).val(), type:$("#"+Id+"Type"+count).val(), id:$("#"+Id+"Id"+count).val()};
			
			if(Id === "printer")
				printerSettings.push(appendSettings);
		     if(Id === "barcode")
				barCodeSettings.push(appendSettings);
		     if(Id === "weighingMachine")
				weighingMachineSettings.push(appendSettings);
			
		  	$(container).append('<div class="row" style="padding-left:5px;cursor: pointer;" id="child'+text+'" class="child'+Id+idCount+'" onclick="return changeIds(this,\''+Id+'\');" > <div class="col-lg-1"><input type="checkbox" checked class="'+Id+idCount+'" id="'+Id+idCount+'" value="'+text+'" /></div> <div class="col-lg-9"> '+ text + '</div></div>');

			
			
		}
		
 function activateHeader(id,open){
	 debugger;
	 $(this).scrollTop(0);
		$(".subBlock").each(function() {
			$(this).slideUp("fast");
		});
		var headerImg = $("#"+id+"Img").attr("src");
		var subBlockOpened = false;
		 if(headerImg.indexOf('right')!= -1){
			 subBlockOpened = true; 
			 openslide = true;
		 }else{
			 openslide = false;
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
		 
// 		 printsettingsDevices('printer');
	}
 
 
/*  var slectedAndriod = $("#androidSelected").val().replace('[','').replace(']','').replace(/, /g,',');
	$("#printerAdd").html(slectedAndriod.split(',')); */
	/* debugger;
	$("#tab_2").click(function(){
		$("#two").css("display", "block");	
	});
	debugger;
	$("#tab_1").click(function(){
		$("#two").css("display", "none");
	});
  */
	debugger;
	$("#outletperipheralsImg").click(function(){
		debugger;
		if(openslide == true)
		$("#two").css("display", "block");	
		else
		$("#two").css("display", "none");
		});
	
	$("#warehouseperipheralsImg").click(function(){
		debugger;
		$("#two").css("display", "block");
		});
	$("#capillaryImg").click(function(){
		debugger;
		$("#two").css("display", "block");
		});
	$("#logisticsImg").click(function(){
		debugger;
		$("#two").css("display", "block");
		});
	$("#googleApiImg").click(function(){
		debugger;
		$("#two").css("display", "block");
		});
	$("#firebaseApiImg").click(function(){
		debugger;
		$("#two").css("display", "block");
		});
	 </script>
	
		
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
.slideupdown
{
width: 0;
height: 0;
border-style: solid;
border-width: 0 0 200px 200px;
border-color: transparent transparent gray transparent;

}

.labelpadding
{
padding-left:71px;
}
.dropgownbox
{
margin-top:13px;
}
.rowheight
{
margin-top:70px;

}
.form-group {
    margin-bottom: 2px;
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
@media  (min-width:1240px) and (max-width:1440px){
.daily{
width: 20%;
}

.fortnight{
width: 30%;
}
}

}

/* @media (min-width:768px) and (max-width:1440px) {
    /* For desktop: */
    .hrline {width: 100%;}
    
} */



.btn-primar {
	font-weight: bold;
	color: black;
    background-color: rgb(195,195,195);
    border-color: black;
}



.btnRemoveCls {
    width: 66px;
    font-size: 16px;
    display: inline-block;
    padding: 0px;
    padding-top: 10p;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    background: #777;
    color: #fff;
    border: none;
/*     margin-bottom: 10px; */
    
}

.addElements
{
	padding: 0px;
    height: 73px;
    width: 193px;
    overflow-y: auto;
    overflow-x: hidden;
    border: 1px solid #ccc;
}

</style></head>
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
<div class="col-xs-12">

				<div class="box box-primary " style="padding: ">
    <!-- <div class="box-header" style="text-align: left; height:25px;"> -->
    <div class="box-header" align="center">
               <h3  class="box-title" style="border:1px solid #ccc;padding:12px;font-weight: 600;"><spring:message code="integration.settings.label" /></h3>
           </div>
    <%-- <h3  style="text-align: center;font-weight:bold;"><spring:message code="integration.settings.label" /></h3> --%>
    <!-- </div> --><!-- /.box-header -->
    <!-- form start -->
    	<div class="col-lg-2"></div>
    <form>
    
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        
        <div id="Error" class="Error" style="text-align: center;margin-top: 20px;color: red;font-size: 2;font-weight: bold;">${err}</div>
        <div id="Success" class="Error" style="text-align: center;color: blue;margin-top: 20px;font-size: 2;font-weight: bold;">${success}</div>
        	 </div>
			 
		<br><br><br>	
			 
   <div class="nav-tabs-custom">
		  <ul class="nav nav-tabs">
                                
                                <li class="active"><a href="#tab_1" data-toggle="tab"><spring:message code="hardware.settings.label"/></a></li>
                                <li><a href="#tab_2" data-toggle="tab"><spring:message code="software.settings.label"/></a></li>
                              
                              
                                </ul>
                       
                         <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >       
                                    
                                    <br>
                                    <br> 
                                

<div class="row">


             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="outlet.peripherals.label" /></label>
                <div class=" col-lg-12" style="margin-bottom: 4px;">
							             <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
							                 </div> 
							                
							               <hr style="margin-top:-4px;" /> 
            
            
             </div></div> 
			 
			 
			 <div class="outletperipherals subBlock">
			 
			 <div class="col-lg-1"></div>
			 <div class="form-group col-lg-11" style="padding: 3px;padding-left: 0px;padding-right: 0px; background:  #eee	;width:90%;margin-bottom:12px;">
			 <label style=" font-weight: bold; padding-left:10px; " ><spring:message code="cash.counter.label.pos" /></label>
			 </div>
			 
			 
			 
			 	 <div class="row">
			  <div class="col-lg-1"></div> 
			  <div class="col-lg-11 col-xs-11 col-sm-11" Style="padding: 0px;   width: 952px;" >
			  
			  <div class="col-lg-3 col-xs-3 col-sm-3" >
			 
			  <div class="col-lg-12" id="iosMenu"style=" overflow-y: auto;overflow-x: hidden; padding:5px;border:1px solid #ccc; margin-bottom:5px;height: 71px;">
<%-- 			    <c:forEach var="iosMenu" items="${ios}" varStatus="theCount"> --%>
			  
			  			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="IPadStandard" name="IPadStandard" value="IPadStandard"></div><div class="col-lg-10">IPad Standard</div></div>
			  			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="IPadMini" name="IPadMini" value="IPadMini"></div><div class="col-lg-10">IPad Mini</div></div>
			  
			  
<%-- 			 </c:forEach> --%>
			  </div>
			  
			    <div class="col-lg-12"id="androidTabMenu" style=" overflow-y: auto;overflow-x: hidden; padding:5px;border:1px solid #ccc;margin-bottom:5px;height: 102px;">
<%-- 			    <c:forEach var="androidTabMenu" items="${androidTab}" varStatus="theCount"> --%>
			  
			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="Samsung" name="Samsung" value="Samsung"></div><div class="col-lg-10">SamSung</div></div>
			  <div class="row"> <div class="col-lg-1"><input type="checkBox" id="HP" name="HP" value="HP"></div><div class="col-lg-10">HP</div></div>
			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="Lenovo" name="Lenovo" value="Lenovo"></div><div class="col-lg-10">Lenovo</div></div>
			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="others" name="others" value="others"></div><div class="col-lg-10">others</div></div>
			 
			
			  </div>
			  
			  
			   <div class="col-lg-12" id="windowsMenu" style=" overflow-y: auto;overflow-x: hidden; padding:5px;border:1px solid #ccc;height: 71px;">
			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="deskTop" name="deskTop" value="deskTop"></div><div class="col-lg-10">Desk Top</div></div>
			 <div class="row"> <div class="col-lg-1"><input type="checkBox" id="Note" name="Note" value="Note"></div><div class="col-lg-10">Note</div></div>

			  
			  

			  </div>
			  
			  
			  </div>
			  <div class="col-lg-3 col-xs-3 col-sm-3">
			    <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                  <select class="form-control" name="printerManufacturer" id="printerManufacturer"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="printer.manufacturer.label" /></option>
                  	 
<%--                   	  <c:forEach var="printerManu" items="${printerManufacturer}"> --%>
									<option value="Epson" id="Epson" >Epson</option>
									<option value="Hewlett-Packard" id="Hewlett-Packard" >Hewlett-Packard</option>
									<option value="Star" id="Star" >Star</option>
									<option value="others" id="others" >others</option>
									
									
<%-- 						 		</c:forEach>     --%>
                   </select>
                       </div>
                     <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                     <img src="${pageContext.request.contextPath}/images/downIcon.png" style="width: 24px; margin-left:85px;"/>
                     </div>
                           
                        <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="printerType" id="printerType"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="printer.type.label" /></option>


							<option value="InkJetPrinters" id="InkJetPrinters" >Ink-jet printers</option>
							<option value="LaserPrinters" id="LaserPrinters" >Laser printers</option>


                   </select>
                       </div>
                          <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                     <img src="${pageContext.request.contextPath}/images/downIcon.png" style="width: 24px; margin-left:85px;"/>
                     </div>
                        <div class="form-group col-lg-12 col-sm-12 col-xs-12" style="padding-left:0px;"> 
               
                   			<input type="text" style="width:100%" class="form-control" id="printerId" value="" placeholder="<spring:message code="Printer.id.label" />"/>
                       </div>
                       
                        <div class="form-group col-lg-12 col-sm-12 col-xs-12" style="padding-left:0px;    padding-top: 10px;"> 
                        <div class="form-group col-lg-6 col-sm-6 col-xs-6" style="    padding-left: 0px;">
                       		 <input type="button" class="btnRemoveCls" style="" onclick="RemoveItemId('printer')" value="Remove" />
                        </div>
                        <div class="form-group col-lg-6 col-sm-6 col-xs-6"style="text-align: right;    padding-right: 0px;" >
                       		 <input type="button" class="btnRemoveCls" style="" onclick="addItemId('printer')" value="Add" />
                        </div>
                        </div>
                         <div class="form-group col-lg-12 col-sm-12 col-xs-12 addElements" id="printerAdd" style="padding-left:0px;    padding-top: 10px;"> 
                     
                         </div>
                        
			  </div>
			  <div class="col-lg-3 col-xs-3 col-sm-3">
			    <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                  <select class="form-control" name="barcodeManufacturer" id="barcodeManufacturer"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="barcode.manufacturer.label" /></option>

						 		
						 		<option value="LaserDot" id="LaserDot" >Handheld Barcode Scanner</option>
								<option value="LaserBarcodeScanners" id="LaserBarcodeScanners" >Laser Barcode Scanners</option>
								<option value="ShopBarcodeScanners" id="ShopBarcodeScanners">Shop Barcode Scanners</option>
						 		<option value="Xenon1900gBarcodeScanners" id="Xenon1900gBarcodeScanners">Xenon 1900g Barcode Scanners</option>      
                   </select>
                       </div>
                       <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                     <img src="${pageContext.request.contextPath}/images/downIcon.png" style="width: 24px; margin-left:85px;"/>
                     </div>
                           
                        <div class=" form-group col-lg-12 col-sm-12 col-xs-12 " style="padding-left:0px;"> 
                  <select class="form-control" name="barcodeType" id="barcodeType"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="barcode.type.model" /></option>
<%--                                     <c:forEach var="barCodeType" items="${barCodeType}"> --%>
<%-- 									<option value="${barCodeType}" ${barCodeType == "" ? 'selected' : ''} id="${barCodeType}" >${barCodeType}</option> --%>
<%-- 						 		</c:forEach> --%>

						 		<option value="Laser" id="Laser" >Laser</option>
								<option value="ChargeCoupledDevice" id="ChargeCoupledDevice" >Charge coupled device</option>
								<option value="Pen" id="Pen" >Pen</option>
                   </select>
                       </div>
                          <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                     <img src="${pageContext.request.contextPath}/images/downIcon.png" style="width: 24px; margin-left:85px;"/>
                     </div>
                        <div class="form-group col-lg-12 col-sm-12 col-xs-12" style="padding-left:0px;"> 
               
                   			<input type="text" class="form-control" id="barcodeId" value="" placeholder="<spring:message code="barcode.scanner.id.label" />"/>
                       </div>
			      <div class="form-group col-lg-12 col-sm-12 col-xs-12" style="padding-left:0px;    padding-top: 10px;"> 
                        <div class="form-group col-lg-6 col-sm-6 col-xs-6" style="    padding-left: 0px;">
                       		 <input type="button" class="btnRemoveCls" style="" onclick="RemoveItemId('barcode')" value="Remove" />
                        </div>
                        <div class="form-group col-lg-6 col-sm-6 col-xs-6" style="text-align: right;    padding-right: 0px;">
                       		 <input type="button" class="btnRemoveCls" style="" onclick="addItemId('barcode');" value="Add" />
                        </div>
                        </div>
                        
                        
                        <div class="form-group col-lg-12 col-sm-12 col-xs-12 addElements" id="barcodeAdd" style="padding-left:0px;    padding-top: 10px;"> 
                         
                         </div>
			  
			  </div>
			  
			  
			  
			  
			  <div class="col-lg-3 col-xs-3 col-sm-3">
			  	    <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                  <select class="form-control" name="weighingMachineManufacturer" id="weighingMachineManufacturer"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="weighing.machine.label" /></option>
                  	<option value="WeitechWeighing" id="WeitechWeighing">Weitech Weighing</option>
                  	<option value="ATOMAliston" id="ATOMAliston">ATOM Aliston</option>
                  	 <option value="SliscoLabInstruments" id="SliscoLabInstruments">Slisco Lab Instruments</option>
<%--                            <c:forEach var="weighingMachine" items="${weighingMachine}"> --%>
<%-- 									<option value="${weighingMachine}" ${weighingMachine == "" ? 'selected' : ''} id="${weighingMachine}" >${weighingMachine}</option> --%>
<%-- 						 		</c:forEach>         --%>



                   </select>
                       </div>
                       <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                     <img src="${pageContext.request.contextPath}/images/downIcon.png" style="width: 24px; margin-left:85px;"/>
                     </div>
                           
                        <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="weighingMachineType" id="weighingMachineType"  >
                  	
                  	 <option class="form-control"  value="" disabled selected><spring:message code="weighing.machine.type" /></option>
                                 
						 		<option value="Floorscales" id="Floorscales">Floor Scales</option>
						 		<option value="kiloGrams" id="kiloGrams">Kilo Grams</option>
						 		<option value="grams" id="Grams">Grams</option>	 		
                   </select>
                       </div>
                          <div class=" form-group col-lg-12" style="padding-left:0px;"> 
                     <img src="${pageContext.request.contextPath}/images/downIcon.png" style="width: 24px; margin-left:85px;"/>
                     </div>
                        <div class="form-group col-lg-12 col-sm-12 col-xs-12" style="padding-left:0px;"> 
               
                   			<input type="text" class="form-control" id="weighingMachineId" value="" placeholder="<spring:message code="weighing.machine.id" />"/>
                       </div>
			      <div class="form-group col-lg-12 col-sm-12 col-xs-12" style="padding-left:0px;    padding-top: 10px;"> 
                        <div class="form-group col-lg-6 col-sm-6 col-xs-6" style="    padding-left: 0px;">
                       		 <input type="button" class="btnRemoveCls" style="" onclick="RemoveItemId('weighingMachine')" value="Remove" />
                        </div>
                        <div class="form-group col-lg-6 col-sm-6 col-xs-6" style="text-align: right;    padding-right: 0px;" >
                       		 <input type="button" class="btnRemoveCls" style="" onclick="addItemId('weighingMachine')" value="Add" />
                        </div>
                        </div>
                        
                         <div class="form-group col-lg-12 col-sm-12 col-xs-12 addElements" id="weighingMachineAdd" style=""> 
                         
                         </div>
			  </div>
			  
			</div>
			  </div>
			  
			  
<br>			 
			 
			 
			 <div class="col-lg-1"></div>
			 <div class="form-group col-lg-11" style="padding: 3px;padding-left: 0px;padding-right: 0px; background:  #eee	;width:90%;margin-bottom:12px;">
			 <label style=" font-weight: bold; padding-left:10px; "><spring:message code="outletmonitoring.label" />   <spring:message code="self.checkouts.label"/></label> 
			 
			 
			 </div>
			 	 <div class="row">
			    <div class="col-lg-1 col-sm-1 col-xs-1"></div>
			    <div class="col-lg-11 col-sm-11 col-xs-11"  style=" padding: 0px;   width: 952px;">
			    
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="videoStreaming" id="videoStreaming"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="video.streaming.label" /></option>
                                   <%--  <c:forEach var="videoStreamings" items="${videoStreaming}">
									<option value="${videoStreamings}" ${videoStreamings == "" ? 'selected' : ''} id="${videoStreamings}" >${videoStreamings}</option>
						 		</c:forEach> --%>  
						 		
						 		 <option value="Acquisition" ${'Acquisition' == integrationSettings.videoStreaming ? 'selected' : ''}>Acquisition</option>
						 		 <option value="others" ${'others' == integrationSettings.videoStreaming ? 'selected' : ''}>others</option>
						 		
						 	
						 	
<!-- 						 		<option value="grams" id="Grams">Grams</option>	 		 -->
                   </select>
                       </div>
			    </div>
			    
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="FootFalls" id="FootFalls"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="foot.falls.label" /></option>
                              <%--    <c:forEach var="footFall" items="${footFalls}">
									<option value="${footFall}" ${footFall == "" ? 'selected' : ''} id="${footFall}" >${footFall}</option>
						 		</c:forEach>   --%>
						 		 		
						 	 <option value="Acquisition" ${'Acquisition' == integrationSettings.footFalls ? 'selected' : ''}>Acquisition</option>
						 		 <option value="others" ${'others' == integrationSettings.footFalls ? 'selected' : ''}>others</option>
						 		
						 	
						 		
                   </select>
                       </div>
			    </div>
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="WiFiCarts" id="WiFiCarts"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="wifi.charts.label" /></option>
                                   <%-- <c:forEach var="wifiCart" items="${wifiCarts}">
									<option value="${wifiCart}" ${wifiCart == "" ? 'selected' : ''} id="${wifiCart}" >${wifiCart}</option>
						 		</c:forEach> --%>  
						 		 	 <option value="Acquisition" ${'Acquisition' == integrationSettings.wiFiCarts ? 'selected' : ''}>Acquisition</option>
						 		 <option value="others" ${'others' == integrationSettings.wiFiCarts ? 'selected' : ''}>others</option>
						 		
						 		
                   </select>
                       </div>
			    </div>
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="RFIDTagging" id="RFIDTagging"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="rfid.tagging.label" /></option>
                              <%--     <c:forEach var="RFIDTaggings" items="${RFIDTagging}">
									<option value="${RFIDTaggings}" ${RFIDTaggings == "" ? 'RFIDTaggings' : ''} id="${RFIDTaggings}" >${RFIDTaggings}</option>
						 		</c:forEach>   --%>
						 			
						 		 <option value="Acquisition" ${'Acquisition' == integrationSettings.rfidTagging ? 'selected' : ''}>Acquisition</option>
						 		 <option value="others" ${'others' == integrationSettings.rfidTagging ? 'selected' : ''}>others</option>
						 		
                   </select>
                       </div>
			    </div>
			 
			 
			 </div>
		
		 
			 </div>
			 
			 <br>
			 	 
			 <div class="col-lg-1"></div>
			 <div class="form-group col-lg-11" style="padding: 3px;padding-left: 0px;padding-right: 0px; background:  #eee	;width:90%;margin-bottom:12px;">
			 <label style=" font-weight: bold; padding-left:10px; "><spring:message code="stockmanagement.label" /></label> 
			 
			 
			 </div>
			 	 <div class="row">
			    <div class="col-lg-1 col-sm-1 col-xs-1"></div>
			    <div class="col-lg-11 col-sm-11 col-xs-11"  style=" padding: 0px;   width: 952px;">
			    
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="barcode_Scanner_A" id="barcode_Scanner_A"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="barcode.scanner.label" /></option>
                                 <%--   <c:forEach var="barCodeScanners" items="${barCodeScanner}">
									<option value="${barCodeScanners}" ${barCodeScanners == "" ? '' : ''} id="${barCodeScanners}" >${barCodeScanners}</option>
						 		</c:forEach>  --%>
						 		 <option value="Laser" ${'Laser' == integrationSettings.barcode_Scanner_A ? 'selected' : ''}>Laser</option>
						 		 <option value="Charge coupled device" ${'Charge coupled device' == integrationSettings.barcode_Scanner_A ? 'selected' : ''}>Laser</option>
						 		 <option value="Pen" ${'Pen' == integrationSettings.barcode_Scanner_A ? 'selected' : ''}>Pen</option>

						 	
						 		 
                   </select>
                       </div>
			    </div>
			    
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="BarcodeLabelPrinter" id="BarcodeLabelPrinter"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="barcode.label.printer.label" /></option>
                                 
						 		 <option value="postech" ${'postech' == integrationSettings.barcodeLabelPrinter ? 'selected' : ''}>postech</option>
						 		 <option value="others" ${'others' == integrationSettings.barcodeLabelPrinter ? 'selected' : ''}>others</option>

						 	
                   </select>
                       </div>
			    </div>
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="SelfLabelling" id="SelfLabelling"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="self.labeling.label" /></option>
                                <%--   <c:forEach var="SelfLabellings" items="${SelfLabelling}">
									<option value="${SelfLabellings}" ${SelfLabellings == "" ? '' : ''} id="${SelfLabellings}" >${SelfLabellings}</option>
						 		</c:forEach>  --%> 
						 		
						 		 <option value="Acquisition" ${'Acquisition' == integrationSettings.selfLabelling ? 'selected' : ''}>Acquisition</option>
						 		 <option value="others" ${'others' == integrationSettings.selfLabelling ? 'selected' : ''}>others</option>
						 	 </select>
                       </div>
			    </div>
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="selfLabelling" id="selfLabelling"  >
                  	
                  	 <option   value="" disabled selected><spring:message code="self.labeling.label" /></option>
                                 
                   </select>
                       </div>
			    </div>
			 
			 
			 </div>
		
			
			 
			 
			 </div>
			 
			 
			 <!--  -->
			 <div class="col-lg-1"></div>
			 <div class="form-group col-lg-11" style="padding: 3px;padding-left: 0px;padding-right: 0px; background:  #eee	;width:90%;margin-bottom:12px;">
			 <label style=" font-weight: bold; padding-left:10px; ">Payment Gateway</label> 
			 
			 
			 </div>
			 	 <div class="row">
			    <div class="col-lg-1 col-sm-1 col-xs-1"></div>
			    <div class="col-lg-11 col-sm-11 col-xs-11"  style=" padding: 0px;   width: 952px;">
			    
			     <div class="col-lg-3 col-sm-3 col-xs-3">
			     <div class=" form-group col-lg-12 col-sm-12 col-xe-12" style="padding-left:0px;"> 
                  <select class="form-control" name="paymentDevice" id="paymentDevice"  >
                  	
                  	 <option   value="" disabled selected>Payment Device</option>
                                
						 		 <option value="Innoviti" ${'Innoviti' == integrationSettings.paymentDevice ? 'selected' : ''}>Innoviti</option>
						 		 <option value="PineLabs" ${'PineLabs' == integrationSettings.paymentDevice ? 'selected' : ''}>PineLabs</option>

						 	
						 		 
                   </select>
                       </div>
			    </div>
			    
			     
			     
			     
			 
			 
			 </div>
		
			
			 
			 
			 </div>
			 
			 
			 <!--  -->
			 </div>
			<br>
			 <div class="row">
			 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="warehouse.peripherals.label" /></label>
          <input type="hidden" id="warehouseperipheralsId">
            <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							                <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('warehouseperipherals');" id="warehouseperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							              <!--   <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('capillary');" id="capillaryImg"></a> -->
							                </div> 
							               <hr style="margin-top:-4px;" /> 
                 
             </div>
            
             </div> 
			 
			 
			  
			 <div class="warehouseperipherals subBlock">
			 
			 <div class="col-lg-1"></div>
			 <div class="form-group col-lg-11" style="padding: 3px;padding-left: 0px;padding-right: 0px; background:  #eee	;width:90%">
			 <label><spring:message code="stockmanagement.label" /></label>
			 </div>
			 
			 
			 
			 
			 
			  <div class="row ">
        	 	   <div class="col-lg-1"></div>
        	     <div class=" form-group col-lg-3">
                           <div class=" form-group col-lg-10" style="padding-left:0px;">  
                  <select class="form-control" name="countryCode" id="wandriodtab"  >
                  	 <option  value="Android Tab">Android Tab</option>
                                  	
                   </select>
                            </div>
                   </div>
                   
                   
                    <div class=" form-group col-lg-3">
                          <div class=" form-group col-lg-10" style="padding-left:0px;">    
                  <select class="form-control" name="countryCode" id="wpaymentprovider"  >
                  	 <option  value="Payment Provider" >Payment Provider</option>
                                  	
                   </select>
                           </div>
                       </div>
                  
            </div>
			
			 
			 
			   <div class="row ">
        	 	   <div class="col-lg-1"></div>
        	     <div class=" form-group col-lg-3 ">
                     <div class=" form-group col-lg-9" style="padding-left:0px;"> 
                  <select class="form-control" name="wipad" id="wipad"  >
                  	 <option  value="IPAD">IPAD</option>
                                 
                   </select>
                     </div>
                </div>
                
                 <div class=" form-group col-lg-2 ">
                          
                  <select class="form-control" name="wwallet" id="wwallet"  >
                  	 <option  value="IN"  ${'IN'==regionalSettings.countryCode ? 'selected' : ''}><spring:message code="wallet.label" /></option>
                                  	
                   </select>
                
                   </div>
                
          </div>
			 
			
			 	 <div class="row ">
        	 	   <div class="col-lg-1"></div>
        	 	 
        	 	 
        	 	 
        	     <div class=" form-group col-lg-3 ">
                        <div class=" form-group col-lg-10" style="padding-left:0px;"> 
                  <select class="form-control" name="wbarcodescanners" id="wbarcodescanners"  >
                  	 <option  value="Barcode Scanners">Barcode Scanners</option>
                                
                   </select>
                       </div>
                   </div>
                   
                   </div>
			 
			 
			  
			  <div class="row ">
        	 	   <div class="col-lg-1"></div>
        	 	 
        	 	 
        	 	 
        	     <div class=" form-group col-lg-3">
                          <div class=" form-group col-lg-10" style="padding-left:0px;"> 
                  <select class="form-control" name="wweighingmachine" id="wweighingmachine"  >
                  	 <option  value="Weighing Machine">Weighing Machine</option>
                                  	
                   </select>
                
                   </div>
                   </div>
			 </div>
			 
			 
			 
			 
			 <br>
		 <div class="col-lg-1"></div>
			 <div class="form-group col-lg-11" style="padding: 3px;padding-left: 0px;padding-right: 0px; background:  #eee	;width:90%">
			 <label><spring:message code="order.management.label" /></label>
			 </div>
			 
			 	 
			 
			 
			 <br><br>
			 
			 </div>
			 
			
			<br>
			
			
			</div>
			
			
 <br><br>
  <div class="tab-pane" id="tab_2" >
 <div class="row">
 <div class="col-lg-12">
 <div class="col-lg-6"> 
<div class="row">
			 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left;"><spring:message code="capillary.label" /></label>
              <!--  <hr style="margin-top:0px;width:100%;"> -->
              <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							              <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('capillary');" id="capillaryImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							               <!--  <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('capillary');" id="capillaryImg"></a> --> 						              
							                </div> 
							               <hr style="margin-top:-4px;" /> 
                 
             </div>
              </div> 
        
        <div class="capillary subBlock"> 
     <div class="row labelpadding">

                     <div class="form-group col-lg-4">
                              <label><spring:message code="url.label" />  <span  style="text-align:left;color:red;font-weight:bold;">*</span></label>
                               <input type="text" class="form-control" name="url" id="url" value="${integrationSettings.url}" placeholder="<spring:message code="enter.url.label" />"/>
                               <span id="urlError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                       
                    
                       
                     <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                              <label><spring:message code="authorization.label" /> <span  style="text-align:left;color:red;font-weight:bold;">*</span> </label>
                               <input type="text" class="form-control" name="authrization" value="${integrationSettings.authorization}" id="authrization" placeholder="<spring:message code="authorization.label" />"/>
                               <span id="authrizationError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                          
                       
                       </div>
                       
                       
                       
         </div>
         
         
        
         <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                              <label><spring:message code="Content-Type.label" /> </label>
                               <input type="text" class="form-control" name="contentType" id="contentType"  value="${integrationSettings.contentType}" placeholder="<spring:message code="Content-Type.label" />">
                               <span id="contentTypeError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                       
                       
                       
                       
                       <div class="col-lg-1"></div>
                       
                        
        	     <div class=" form-group col-lg-4 ">
                          <div class=" form-group col-lg-7" style="padding-left:0px;">    
                  <select class="form-control" name="autheizationType" id="autheizationType"  >
                  	 <option  value="HTTP Basic"  ${'HTTP Basic'==integrationSettings.authorizationType ? 'selected' : ''}>HTTP Basic</option>
                         <option  value="MD5"  ${'MD5'==integrationSettings.authorizationType ? 'selected' : ''}>MD5</option>          
                   </select>
                </div>
                   </div>
                       
                       
                       
                       
         </div>
         
        
        



         <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                              <label><spring:message code="userName.label" /><span  style="text-align:left;color:red;font-weight:bold;">*</span>  </label>
                               <input type="text" class="form-control" name="userName" id="userName" value="${integrationSettings.username}" placeholder="<spring:message code="enter.userName" />"/>
                               <span id="usernameError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
         </div>
         
            
     
         <div class="row labelpadding">

                       <div class="form-group col-lg-3">
                                 <label><spring:message code="password.label" /><span  style="text-align:left;color:red;font-weight:bold;">*</span>  </label>
                                 <input type="password" class="form-control" name="password" id="password" value="${integrationSettings.password}" placeholder="<spring:message code="enter.password.label" />">
                                 <span id="passwordError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>

         </div>
         
			 </div>
	
			
		<br>	
<div class="row">
			 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="rxl.label" /></label>
              <!--  <hr style="margin-top:0px;width:100%;"> -->
              <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							              <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('rxl');" id="rxlImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							               <!--  <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('rxl');" id="capillaryImg"></a> -->
							                </div> 
							               <hr style="margin-top:-4px;" /> 
                 
             </div>
              </div> 
			
			
	
             
           
            <br>
        <div class="row">
			 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="jda.label" /></label>
             <!--   <hr style="margin-top:0px;width:100%;"> -->
                <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							               		 <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('jda');" id="jdaImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							               <!--   <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('');" id="capillaryImg"></a> -->
							                </div> 
							               <hr style="margin-top:-4px;" /> 
             </div>
			 
			 </div>
			
			 <br>
		
			 <div class="row">
			 	 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="sap.label" /></label>
             <!--   <hr style="margin-top:0px;width:100%;"> -->
             
                <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							               	 <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('sap');" id="sapImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							                 <!-- <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('');" id="capillaryImg"></a> -->
							                </div> 
							               
							               <hr style="margin-top:-4px;" /> 
             </div>
            
             </div> 
            
         
           <br>	
<div class="row">
			 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="tally.label" /></label>
              <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							               	 <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('tally');" id="tallyImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							                </div> 
							               <hr style="margin-top:-4px;" /> 
                 
             </div>
              </div> 
            
                <br>
           <div class="row">
			 	 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="logistics.label" /></label>
             <!--   <hr style="margin-top:0px;width:100%;"> -->
             
                <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							               	 <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('logistics');" id="logisticsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							                 <!-- <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('');" id="capillaryImg"></a> -->
							                </div> 
							               
							               <hr style="margin-top:-4px;" /> 
             </div>
            
             </div> 
             
             
             
        <div class="logistics subBlock"> 
     <div class="row labelpadding">
<div class="row labelpadding">
                     <div class="form-group col-lg-12">
                     		
							<input type="radio" id="logisticsProvider" name="logisticsProvider" value="Grabs"  style="font-size: 18px;float:left">
							<label  style="font-size: 18px;float:left;margin-left: 15px;"><spring:message code="Grabs" /></label>
                       </div>
                       
                    </div>
                    <div class="row labelpadding">

                     <div class="form-group col-lg-12">
                     		
                             <input type="radio" id="logisticsProvider" name="logisticsProvider" value="LalaMoves"  style="font-size: 18px;float:left">
                             <label  style="font-size: 18px;float:left;margin-left: 15px;"><spring:message code="LalaMoves" /></label>
                       </div>
                          
                       </div>
                       
                       <div class="row labelpadding">

                     <div class="form-group col-lg-12">
                     		
                             <input type="radio" id="logisticsProvider" name="logisticsProvider" value="Dunzo"  style="font-size: 18px;float:left">
                             <label  style="font-size: 18px;float:left;margin-left: 15px;">DUNZO</label>
                       </div>
                          
                       </div>
                     
                       
                       
                       
         </div>
         
         
        
         
        
        



         
         
			 </div>
	
             <br>
             
             
             <div class="row">
			 	 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="google.api.label" /></label>
             <!--   <hr style="margin-top:0px;width:100%;"> -->
             
                <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							               	 <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('googleApi');" id="googleApiImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							                 <!-- <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('');" id="capillaryImg"></a> -->
							                </div> 
							               
							               <hr style="margin-top:-4px;" /> 
             </div>
            
             </div> 
           
                 
        <div class="googleApi subBlock"> 
        
        
        
        <div class="row labelpadding">

                     <div class="form-group col-lg-4">
                          <label style="font-size: 18px;float:left"><spring:message code="places.api.label" /></label>
                      </div>
                       
                    
                       
                     <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                          <label style="font-size: 18px;float:left"><spring:message code="assets.api.label" /></label>
                       </div>
                          
                       
                       </div>
                       
                       
                       
         </div>
     <div class="row labelpadding">

                     <div class="form-group col-lg-4">
                              <label><spring:message code="url.label" />  <span  style="text-align:left;color:red;font-weight:bold;"></span></label>
                               <input type="text" class="form-control" name="placesApiURL" id="placesApiURL" value="${integrationSettings.placesApiAccess.url}" placeholder="<spring:message code="enter.url.label" />"/>
                               <span id="urlError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                       
                    
                       
                     <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                              <label> <spring:message code="url.label" /> <span  style="text-align:left;color:red;font-weight:bold;"></span> </label>
                               <input type="text" class="form-control" name="assetApiURL" value="${integrationSettings.placesApiAccess.accessKey}" id="assetApiURL" placeholder="<spring:message code="url.label" />"/>
                               <span id="authrizationError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                          
                       
                       </div>
                       
                       
                       
         </div>
         
         <div class="row labelpadding">

                     <div class="form-group col-lg-4">
                              <label><spring:message code="access.key.label" />  <span  style="text-align:left;color:red;font-weight:bold;"></span></label>
                               <input type="text" class="form-control" name="placesApiAccessKeys" id="placesApiAccessKeys" value="${integrationSettings.assetApiAccess.url}" placeholder="<spring:message code="access.key.label" />"/>
                               <span id="urlError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                       
                    
                       
                     <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                              <label><spring:message code="access.key.label" /> <span  style="text-align:left;color:red;font-weight:bold;"></span> </label>
                               <input type="text" class="form-control" name="assetApiAccessKeys" value="${integrationSettings.assetApiAccess.accessKey}" id="assetApiAccessKeys" placeholder="<spring:message code="access.key.label" />"/>
                               <span id="authrizationError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                          
                       
                       </div>
                       
                       
                       
         </div>
         
         
			 </div>
	
           
           <!--  -->
            <br>
             
             
             <div class="row">
			 	 
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 3%;margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left"><spring:message code="firebase.api.label" /></label>
             <!--   <hr style="margin-top:0px;width:100%;"> -->
             
                <div class="form-group col-lg-12" style="margin-bottom: 4px;">
							               	 <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('firebaseApi');" id="firebaseApiImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> 
							                 <!-- <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('');" id="capillaryImg"></a> -->
							                </div> 
							               
							               <hr style="margin-top:-4px;" /> 
             </div>
            
             </div> 
           
                 
        <div class="firebaseApi subBlock"> 
        
        
        
        
     <div class="row labelpadding">

                     <div class="form-group col-lg-4">
                              <label><spring:message code="url.label" />  <span  style="text-align:left;color:red;font-weight:bold;"></span></label>
                               <input type="text" class="form-control" name="firebaseApiURL" id="firebaseApiURL" value="${integrationSettings.fireBaseSettings.url}" placeholder="<spring:message code="enter.url.label" />"/>
                               <span id="urlError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                       
                    
                       
                     <div class="row labelpadding">

                     <div class="form-group col-lg-3">
                              <label> <spring:message code="access.key.label" /> <span  style="text-align:left;color:red;font-weight:bold;"></span> </label>
                               <input type="text" class="form-control" name="firebaseApiKey" value="${integrationSettings.fireBaseSettings.authenticationKey}" id="firebaseApiKey" placeholder="<spring:message code="url.label" />"/>
                               <span id="authrizationError" style="text-align:right;color:red;font-weight:bold;"></span>
                       </div>
                          
                       
                       </div>
                       
                       
                       
         </div>
         
         
         
         
			 </div>
	
           
           
          
           </div>
           <div class="col-lg-6">
           <div class="row helpBox" style="margin-top:-34px;" id="two">
<h4 style="text-align: right; margin-right: 15px; color:blue;">Help</h4>
<div class="form-group col-lg-12" style="border: 2px solid #ccc;border-radius: 15px; zoom:100%;">
<p style="">
Technolabs Retail Clouds can work within your existing IT Landscape. You may be using and habituated to Software Like SAP,Oracle or other Enterprise Softwares.For Example,
You may be using SAP for inventory management.Tally for accounting.You may use Technolabs Retails clouds for Outlet Management including POS.
Technolabs can connect to Sap for inventory,and Tally for sales push.
<br>
<br>
As we keep going to other markets,we will be able to support less known softwares as well.At the moment we are integrated with the following
softwares.
<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)&nbsp;&nbsp; Capillary-CRM
<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)&nbsp;&nbsp; JDA-ERP/Inventory Management
<br>
&nbsp;&nbsp;&nbsp;&nbsp;3)&nbsp;&nbsp; SAP-ERP/Inventory Management
<br>
&nbsp;&nbsp;&nbsp;&nbsp;4)&nbsp;&nbsp; Tally-Acounting Software
<br>
&nbsp;&nbsp;&nbsp;&nbsp;5)&nbsp;&nbsp; Logistic Providers
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a)&nbsp;&nbsp; Grabs
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b)&nbsp;&nbsp; Lalamoves
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c)&nbsp;&nbsp; Dunzo
<br>
&nbsp;&nbsp;&nbsp;&nbsp;6)&nbsp;&nbsp; Google API-for Geofencing and Routing
<br>
&nbsp;&nbsp;&nbsp;&nbsp;7)&nbsp;&nbsp; Firebase API-for Vehicle tracking
</p>
</div>

</div>
</div>
           </div>
           </div>
           </div>
           </div>
           </div>
           </div>
           
           
           
          <!--  </div> --> <!--  end of nav -->
           
           
         
           
           
           
                	<div class="row" style="text-align: center;">
                	
                	
                	<%--  <c:if test="${sessionScope.role == 'super admin'}">
                	
						 <input type="button" class="btnCls " style="" onclick="validateIntegrationSettingsForm('new');" value="Submit" />
					
						 <c:if test="${status == 'edit'}">
						 <input type="button" class="btnCls " style="" onclick="validateIntegrationSettingsForm('edit');" value="Submit" />
						</c:if>
                	  
                	 </c:if>
                	 
                	<c:forEach var="accessControl" items="${sessionScope.settings}">
                	<c:if test="${accessControl.appDocument == 'IntegrationSettings' && accessControl.write == true}">
	                	<c:if test="${status == 'new'}">
						 <input type="button" class="btnCls " style="" onclick="validateIntegrationSettingsForm('new');" value="Submit" />
						 </c:if>
						 <c:if test="${status == 'edit'}">
						 <input type="button" class="btnCls " style="" onclick="validateIntegrationSettingsForm('edit');" value="Submit" />
						</c:if>
						</c:if> 
						</c:forEach> --%>
						<input type="button" class="btnCls " style="" onclick="validateIntegrationSettingsForm('new');" value="Submit" />
						 <input type="button" class="btnCls buttonMargin" style="margin-left:25%;" onclick="showCustomerSettingsFlow('');" value="<spring:message code="cancel.label" />" />
			</div>
			<br><br>
				 
          <!--  </div> --> 
             <c:forEach var="androidTab" items="${integrationSettings.androidTab}">
             
             			<input type="hidden" class="androidSelected" value="${androidTab}"/>
             
            </c:forEach> 
             <c:forEach var="windowsTab" items="${integrationSettings.windows}">
             		  <input type="hidden" class="windowsSelected" value="${windowsTab}"/>
            </c:forEach> 
            <c:forEach var="iosTab" items="${integrationSettings.ipad}">
              <input type="hidden" class="ios" value="${iosTab}"/>
            </c:forEach> 
            
            
           <script type="text/javascript">
           			var count= 1;
           var barcodeCount = 1;
           var weighingCount= 1;
           </script>
             
             <c:forEach var="printingDevices" items="${integrationSettings.printerSettings}" varStatus="theCount">
             	<input type="hidden" id="printerType${theCount.count}" value="${printingDevices.type}"/>
             	<input type="hidden" id="printerManufacturer${theCount.count}" value="${printingDevices.manufacturer}"/>
              	<input type="hidden" id="printerId${theCount.count}" value="${printingDevices.id}"/>
<%--               	<input type="hidden" id="id" value="${theCount.count}"/> --%>
              
              <script type="text/javascript">
              					addItemIdOnLoad('printer',count);
              					count++;
                        </script>
              
            </c:forEach> 
           
           
           
           
           <c:forEach var="barcodeDevices" items="${integrationSettings.barcodeSettings}" varStatus="theCount">
             	<input type="hidden" id="barcodeType${theCount.count}" value="${barcodeDevices.type}"/>
             	<input type="hidden" id="barcodeManufacturer${theCount.count}" value="${barcodeDevices.manufacturer}"/>
              	<input type="hidden" id="barcodeId${theCount.count}" value="${barcodeDevices.id}"/>
<%--               	<input type="hidden" id="id" value="${theCount.count}"/> --%>
              
              <script type="text/javascript">
              addItemIdOnLoad('barcode',barcodeCount);
              barcodeCount++;
             </script>
              
            </c:forEach>
            
            
            
             <c:forEach var="weighingMachineDevices" items="${integrationSettings.weighingMachineSettings}" varStatus="theCount">
             	<input type="hidden" id="weighingMachineType${theCount.count}" value="${weighingMachineDevices.type}"/>
             	<input type="hidden" id="weighingMachineManufacturer${theCount.count}" value="${weighingMachineDevices.manufacturer}"/>
              	<input type="hidden" id="weighingMachineId${theCount.count}" value="${weighingMachineDevices.id}"/>
<%--               	<input type="hidden" id="id" value="${theCount.count}"/> --%>
              
              <script type="text/javascript">
              addItemIdOnLoad('weighingMachine',weighingCount);
              weighingCount++;
                        </script>
              
            </c:forEach>
            
           <%--   <input type="hidden" id="androidSelected" value="${integrationSettings.androidTab}"/> --%>
           
           
             <%-- <input type="hidden" id="barcode_Scanner_A" value="${barcode_Scanner_A}"/>
             <input type="hidden" id="BarcodeLabelPrinter" value="${BarcodeLabelPrinter}"/>
             <input type="hidden" id="SelfLabelling" value="${SelfLabelling}"/>
             <input type="hidden" id="WiFiCarts" value="${WiFiCarts}"/>
             <input type="hidden" id="RFIDTagging" value="${RFIDTagging}"/>
             <input type="hidden" id="FootFalls" value="${FootFalls}"/>
             <input type="hidden" id="videoStreaming" value="${videoStreaming}"/> --%>
             
             </form>
			 </div>
			 
</div>
</section>
