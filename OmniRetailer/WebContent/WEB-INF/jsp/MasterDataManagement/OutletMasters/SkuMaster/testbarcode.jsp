<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->

   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-barcode.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-barcode.min.js"></script>
<title>Insert title here</title>
</head>
<style>
* {

}



</style>



<script type="text/javascript">
/* $(document).ready(function() {
		generateBarcode();
});
      function generateBarcode(){
    	  alert("in");
        var value = $("#barcodeValue").val();
        var btype = 'ean13';
        var renderer = 'svg';
        var skuid = $("#barcodeno").val();
		var quietZone = false;
        if ($("#quietzone").is(':checked') || $("#quietzone").attr('checked')){
          quietZone = true;
        }
		
        var settings = {
          output:renderer,
          bgColor: '#fff',
          color: '#000',
          barWidth: '1.8',
          barHeight: '25',
        };
          value = {code:value, rect: true};
          $("#barcodeTarget"+skuid).html("").show().barcode(value, btype, settings);
       
      } */
    
  
  	function printbarcodes(id){
  		alert("Please check the Eans ")
		
		 
	}
      
      
      </script>
<title>jQuery Barcode Plugin Examples</title>
</head>
<body>


<input type="hidden" id="barcodeValue" value="${skulist.ean}">
<input type="hidden" id="barcodeno" value="${skulist.slNo}">
<div id="config">

<div class="config">

<input type="hidden" id="bgColor" value="#FFFFFF" size="7">


<input type="hidden" id="color" value="#000000" size="7">

<input type="hidden" id="barWidth" value="1" size="3">

<input type="hidden" id="barHeight" value="50" size="3">

<input type="hidden" id="moduleSize" value="5" size="3">

<input type="hidden" id="quietZoneSize" value="1" size="3">


<input type="hidden" id="posX" value="10" size="3">

<input type="hidden" id="posY" value="20" size="3">
<br />
</div>
</div>
<!-- <div class="config">
<div class="title">Format</div>
<input type="radio" id="css" name="renderer" value="css" checked="checked">
<label for="css">CSS</label>
<br />
<input type="radio" id="bmp" name="renderer" value="bmp">
<label for="bmp">BMP (not usable in IE)</label>
<br />
<input type="radio" id="svg" name="renderer" value="svg">
<label for="svg">SVG (not usable in IE)</label>
<br />
<input type="radio" id="canvas" name="renderer" value="canvas">
<label for="canvas">Canvas (not usable in IE)</label>
<br />
</div> -->





	<div class="barcode-container ${skulist.skuId}" style="">
	<div style="padding:3px;margin-left:4px;margin-right:20px;margin-top:3px;margin-bottom:3px;float:left;/* border-top: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000;border-right: 1px solid #000; */width:162px;">
		<br>
		<div id="barcodeTarget${skulist.slNo}" class="barcodeTarget${skulist.slNo}"></div>
		<br>
		<div><span class="col-lg-4" style="font-size:12px;width: 30%;">Product ID</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${skulist.skuId}</span></div>
		<div><span class="col-lg-4" style="font-size:12px;width: 30%;">Product </span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${skulist.ean}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Brand</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${skulist.brandCode}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Size</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${plu.size}</span></div>
		<%-- <div><span class="col-lg-4" style="font-size:11px;width: 30%;">Artical No</span>
		<span class="col-lg-4" style="font-size:11px;width: 70%;">:${plu.productBatchNo}</span></div> --%>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Colour</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${plu.color}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Mrp</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${plu.salePrice}</span></div>
		<br>
<%-- 		<div class="col-lg-4" style="font-size:10px;width: 50px;">Size</div>
		<div class="col-lg-4" style="font-size:10px;width: 90px;">:${plu.size}</div>
		<div class="col-lg-4" style="font-size:10px;">Colour:${plu.color}</div>
		<div class="col-lg-4" style="font-size:10px;">Mrp:${plu.salePrice}</div>
		<div class="col-lg-4" style="font-size:10px;">Brand:${skulist.brandCode}</div> --%>
		<div class="col-lg-4" style="border-bottom: 1px solid #000;width:165px;"></div>
		<br>
		<div class="col-lg-12" style="font-size:12px;">Head office:</div>
		<div class="col-lg-12" style="font-size:10px;">Sahyadri Agro Retails Ltd.</div>
		<div class="col-lg-12" style="font-size:10px;">Survey No-314/2.A/P Mohadi,</div>
		<div class="col-lg-12" style="font-size:10px;">Tal:Dindori Nashik-422206</div>
		<div class="col-lg-12" style="font-size:10px;">Maharashtra,India.</div>
		<br>
		<div class="col-lg-12" style="font-size:10px;">For Customer queries:</div>
		<div class="col-lg-12" style="font-size:10px;">E-mail:caresarl@sahyadrifarms.com</div>
		<div class="col-lg-12" style="font-size:10px;">Toll Free Number:7030915409</div>
		<br>
		<div class="col-lg-4" style="width:165px;"></div>
		</div>
		
		
		<%-- <span id="invalid${skulist.skuId}">Not valid data for this barcode type!</span> --%>
	</div>

</body>
</html>