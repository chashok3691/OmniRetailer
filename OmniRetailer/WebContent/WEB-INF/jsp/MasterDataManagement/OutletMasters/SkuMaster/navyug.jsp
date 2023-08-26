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
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/JsBarcode.all.min.js"></script>
<title>VMart Barcode Format</title>
<style media="print" type="text/css">
    .page {
        background-color: #333 !important;
        font-family: sans-serif;
    }
   /*  div.test2 {
  writing-mode: vertical-rl; 
  transform-origin: 0 0; 
  transform: rotate(180deg);
  margin-top:0px;
  margin-left:88%
} */



</style>



<script type="text/javascript">
	var defaultValues = {

		EAN13 : "1234567890128",
		EAN8 : "12345670",
		UPC : "123456789999",
		CODE39 : "FD1008690" ,

	};
	debugger;
	var barcode = ${ean};
	var skuid = ${distictvalue};
	var skuidbarcode = "${skuidbarcode}";
	console.log(skuidbarcode);
/* 	var product = ${skulist.skuId};
	var n = product.includes("APM"); */
	  //$("#mfid").val(barcode);
	var newBarcode = function() {
		//Convert to boolean
		debugger;
		$("#barcode"+skuid).JsBarcode(skuidbarcode, {
			"format" : "CODE39",
			"background" : "#fff",
			"lineColor" : "#000",
			"height" : 20,
			 "width" : 1.0, 
			"textMargin" : 1,
			"marginLeft" :-1,
			"marginTop" :-2,
			"marginBottom" :1,
			"marginRight" :-2,
			"textAlign" : "left",
			"fontOptions" : "italic",
			"displayValue" : "false",
			"prefix" :"false",
			"valid" : function(valid) {
				if (valid) {
					$("#barcode"+skuid).show();
					$("#invalid"+skuid).hide();
				} else {
					$("#barcode"+skuid).show();
					$("#invalid"+skuid).hide();
				}
			}
		});

	};
	$(document).ready(function() {
		debugger;
	
		newBarcode();
	});
	   function PrintElem(elem)
       {
		   debugger;
           Popup($(".barcode-container").html());
           console.info($(".barcode-container").html())
       }

       function Popup(data) 
       {
    	   debugger;
           var mywindow = window.open('', 'my div', 'width: 47%;height:25mm;');
           mywindow.document.write($(".barcode-container").html());
           mywindow.document.write($(".barcode-container").html());
           mywindow.document.write('</body></html>');
           mywindow.document.close(); // necessary for IE >= 10
           mywindow.focus(); // necessary for IE >= 10
           mywindow.print();
           mywindow.close();

           return true;
       }
	function Print(ele){
		debugger;
		 var printSVG = function()
		    {
		        var popUpAndPrint = function()
		        {
		            var container = $('#barcode');
		            var width = parseFloat(container.getAttribute("width"))
		            var height = parseFloat(container.getAttribute("height"))
		            var printWindow = window.open('', 'PrintMap',
		            'width=' + width + ',height=' + height);
		            printWindow.document.writeln(container.innerHTML);
		            printWindow.document.close();
		            printWindow.print();
		            printWindow.close();
		        };
		        setTimeout(popUpAndPrint, 500);
		    };
	}
	function printbarcodes(id){
		debugger;
				 var selectedLabel = 'Please Select Atleast One Skuid to Print Barcodes ';
				 	var name=$('#deleteActionLabel').val();
			   		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
			   		var selectedLength = $('input[name="selectall"]:checked').length;
			   		var selectedID = $("#selectall").length;
			   		if(selectedLength == 1 && selectedID == 0)
			   			atLeastOneIsChecked = false;
			   		var yes = false;
			   			var selectedLength = $('input[name="selectall"]:checked');
			   	     var selected = "";
			   		  var mywindow = window.open('', 'my div', 'width: 47%;height:25mm;');
			   		    $(selectedLength).each(function(){
			   		    	if($(this).attr("onClick") != "selectAll(this)")
			   		    		{
			   		    		selected = $(this).val();
			   		    		var num = $(this).val()+"no";
			   		    		var numid = $(this).val()+"no";
				   				num =$("#"+num).val() ;
				   				var id= $(this).val()+"allign";
				   				/* var sku = "";
				   				sku =${skulist.skuId};
				   				alert(sku) */
				   				
				   				var check = num;
				   				var newCheck = check; 
				   				var count = 0; 
				   				
				   			   for(var i=0;i<num;i++){
				   	        	   if(check>1){
				   	        		   if(check%2=='0')
				   	        			   {
				   	        			 $("#"+id).css("float","right");
				   	        			$("#"+id).css("margin-right","5px");
				   	        			$("#"+id).css("margin-left","0px");
				   	        			$("#allignment").val('0');
				   	        			   }
					   	        	   else{
					   	        		 $("#"+id).css("float","left");  
					   	        		$("#"+id).css("margin-right","5px");
				   	        			$("#"+id).css("margin-left","0px");
				   	        			$("#allignment").val('1');
					   	        	   }
				   	        		check = check-1;
				   	        	   }
				   	        	   else{
				   	        		   if($("#allignment").val()=='1'){
				   	        			$("#"+id).css("float","right");
				   	        			$("#"+id).css("margin-right","5px");
				   	        			$("#"+id).css("margin-left","0px");
				   	        			$("#allignment").val('0');
				   	        		   }
				   	        			 else{
				   	        				 $("#"+id).css("float","left"); 
				   	        				$("#"+id).css("margin-right","0px");
					   	        			$("#"+id).css("margin-left","5px");
				   	        				$("#allignment").val('1');
				   	        			 }
				   	        	   }
				   	     		   	       
				   	        	        mywindow.document.write($('.'+selected).html());  
				   	        	   
				   	           }
			   		    		}
			   		    	$("#"+numid).val('0') ;
			   			});
			   		   mywindow.document.write('</body></html>');

		   	           mywindow.document.close(); // necessary for IE >= 10
		   	           mywindow.focus(); // necessary for IE >= 10

		   	           mywindow.print();
		   	           mywindow.close(); 
			   		 return true;
		
		
		   		
		
		
		 
	}
	
	
	</script>
</head>
<body>
<input type="hidden" id="allignment" value="1"/>
<input type="hidden" id="allignmenttester" value="koti"/>
	<div class="barcode-container  ${plu.pluCode}"
	
		style="font-family: sans-serif;">
		 <div  class="row" id="${plu.pluCode}allign"
			style="padding: 1px; margin-top: -2mm; margin-bottom: 2.2mm; /* border-top: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000;border-right: 1px solid #000; */ width: 47%;height:25mm;margin-left:2%;"> 
			 <div  class="col-lg-11" > 
			
			<div>
			<span class="col-lg-4" style="font-size:12px;margin-top:0px;margin-left:50px;font-weight:bold;font-family:Arial Black">Navyug</span></div>
			<div>
			
<%--           	<c:set var = "string2" value = "${fn:substring(skulist.description, 0,25)}" />
 --%>		<span class="col-lg-4" style="font-size:9px;width: 65%;margin-top:1px;;margin-left:0px;font-family:Arial Black">${skulist.description}</span></div>
		<svg id="barcode${distictvalue}"  style="margin-top:0px;margin-left:5px;margin-right:13px;"></svg>
		<div>
		 <span class="col-lg-4" style="font-size:9px;font-family:Arial Black;">${skuidbarcode}</span></div>
		 <div>
		<span class="col-lg-3" style="font-size:9px;font-weight:bold;font-family:Arial Black">MRP :</span>
		<span class="col-lg-3" style="font-size:8px;font-weight:bold;font-family:Arial Black">${plu.price}</span>
		<span class="col-lg-3" style="font-size:9px;margin-left:5px;white-space: nowrap;font-weight:bold;font-family:Arial Black">N Price :</span>
		<span class="col-lg-3" style="font-size:8px;font-weight:bold;font-family:Arial Black">${plu.salePrice}</span></div>
		
	 </div> 

			
		 </div> 
		

	</div>
	
	
<%-- 	<div class="barcode-container  new${plu.pluCode}  ${plu.pluCode}"
		style="font-family: sans-serif;">
		 <div  class="row" id="${plu.pluCode}allign"
			style="padding: 1px; margin-top: -2mm; margin-bottom: 5mm; /* border-top: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000;border-right: 1px solid #000; */ width: 47%;height:25mm;margin-left:2%;"> 
			 <div  class="col-lg-11" > 
			
			<div>
			<span class="col-lg-4" style="font-size:12px;margin-top:0px;margin-left:50px;font-weight:bold;font-family:Arial Black">Navyug</span></div>
			<div>
			
          	<c:set var = "string2" value = "${fn:substring(skulist.description, 0,25)}" />
		<span class="col-lg-4" style="font-size:9px;width: 65%;margin-top:1px;;margin-left:0px;font-family:Arial Black">${string2}</span></div>
		<svg id="barcode${distictvalue}"  style="margin-top:0px;margin-left:5px;margin-right:13px;"></svg>
		<div>
		 <span class="col-lg-4" style="font-size:9px;font-family:Arial Black;">${skuidbarcode}</span></div>
		 <div>
		<span class="col-lg-3" style="font-size:9px;font-weight:bold;font-family:Arial Black">MRP :</span>
		<span class="col-lg-3" style="font-size:8px;font-weight:bold;font-family:Arial Black">${plu.price}</span>
		<span class="col-lg-3" style="font-size:9px;margin-left:5px;white-space: nowrap;font-weight:bold;font-family:Arial Black">N Price :</span>
		<span class="col-lg-3" style="font-size:8px;font-weight:bold;font-family:Arial Black">${plu.salePrice}</span></div>
		
	 </div> 

			
		 </div> 
		

	</div> --%>





</body>
</html>