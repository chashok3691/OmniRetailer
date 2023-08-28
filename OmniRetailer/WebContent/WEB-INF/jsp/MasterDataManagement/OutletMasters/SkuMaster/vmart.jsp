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
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/JsBarcode.ean-upc.min.js"></script>
<title>VMart Barcode Format</title>
<style media="print" type="text/css">
    .page {
        background-color: #333 !important;
        font-family: sans-serif;
    }
</style>
<script type="text/javascript">
	var defaultValues = {

		EAN13 : "1234567890128",
		EAN8 : "12345670",
		UPC : "123456789999",

	};
	var barcode = ${ean};
	var skuid = ${distictvalue};
/* 	var product = ${skulist.skuId};
	var n = product.includes("APM"); */
	  //$("#mfid").val(barcode);
	var newBarcode = function() {
		//Convert to boolean
		$("#barcode"+skuid).JsBarcode(barcode, {
			"format" : "EAN13",
			"background" : "#fff",
			"lineColor" : "#000",
			"height" : 15,
			 "width" : 1.5, 
			"textMargin" : 1,
			"marginLeft" :-1,
			"marginTop" :-2,
			"marginBottom" :-2,
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
		newBarcode();
	});
	   function PrintElem(elem)
       {
           Popup($(".barcode-container").html());
           console.info($(".barcode-container").html())
       }

       function Popup(data) 
       {
           var mywindow = window.open('', 'my div', 'height=400,width=600');
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
			   		  var mywindow = window.open('', 'my div', 'height=400,width=200');
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
				   	       /* if(id.length>12) */
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
	<div class="barcode-container  ${plu.pluCode}"
		style="font-family: sans-serif;">
		<div id="${plu.pluCode}allign"
			style="padding: 1px; margin-left: 1px;; margin-top: 0px; margin-bottom: 1px; /* border-top: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000;border-right: 1px solid #000; */ width: 4.70cm;">
			<span class=" page"
				style="padding: 0px 5px;; margin-left: 35%; width: 50%; font-size: 11px; text-align: center; -webkit-print-color-adjust: exact; background-color: black; color: #fff; border-radius: 2px;">${skulist.brandCode}</span>
				<div>
					<span
						style="font-size: 8px; padding-left: 0px; padding-right: 10px; white-space: nowrap;">${skulist.description}</span>
				</div>
			<span class="col-lg-5"
				style="padding-left: 0px; margin-top: -5px; float: left; padding-right: 0px; overflow: hidden;white-space: nowrap; width: 48%;">

				<div>
					<span class="col-lg-4"
						style="font-size: 10px;margin-top: -5px; width: 30%; padding-left: 0px; padding-right: 0px;">Style</span>
					<span class="col-lg-4"
						style="font-size: 8px;margin-top: -5px; width: 70%; padding-left: 0px; padding-right: 0px;">:${plu.styleRange}</span>
				</div>
				<div style="margin-top: -5px;">
					<span class="col-lg-4"
						style="font-size: 10px;margin-top: -35px; width: 30%; padding-left: 0px; padding-right: 0px;">MRP :</span>
					<span class="col-lg-4"
						style="font-size: 10px;margin-top: -35px; width: 70%; padding-left: 0px; padding-right: 0px;letter-spacing: 1px;font-weight: 600;">${plu.price}</span>
						<p style="font-size: 5px;margin-top: -1px;">
						(incl of all taxes)</p>
				</div>
			</span> 
			<span class="col-lg-5"
				style="padding-right: 5px; margin-top: -5px; float: right; padding-right: 0px; overflow: hidden;white-space: nowrap; width: 48%;">

				<div>
					<span class="col-lg-4"
						style="font-size: 10px;;margin-top: -5px; width: 30%; padding-left: 0px; padding-right: 0px;">Size</span>
					<span class="col-lg-4"
						style="font-size: 8px;margin-top: -5px; width: 70%; padding-left: 0px; padding-right: 0px;">:${plu.size}</span>
				</div>
				<div style="margin-top: -5px;">
					<span class="col-lg-4"
						style="font-size: 10px;letter-spacing:1px;font-weight: 400; width: 30%; padding-left: 0px; padding-right: 0px;">Colour</span>
					<span class="col-lg-4"
						style="font-size: 8px;letter-spacing:1px;font-weight: 400; width: 70%; padding-left: 0px; padding-right: 0px;">:${plu.color}</span>
					<!-- 	<p style="font-size: 5px;margin-top: -1px;">Packaging Date</p> -->
				</div>
				
			</span> 
				<%-- <span class="col-lg-5"
				style="padding-right: 5px; margin-top: -5px; float: right; padding-right: 0px; overflow: hidden;white-space: nowrap; width: 60%;">
				<div style="margin-top: -5px;">
					<span class="col-lg-4"
						style="font-size: 8px;letter-spacing:1px;font-weight: 400; width: 30%; padding-left: 0px; padding-right: 0px;">Packaging Date</span>
					<span class="col-lg-4"
						style="font-size: 7px;letter-spacing:1px;font-weight: 400; width: 70%; padding-left: 0px; padding-right: 0px;">:${plu.color}</span>
				</div>
				
				</span> --%>
			<span class="col-lg-7"
				style="padding-left: 0px; padding-right: 0px;margin-top: -5px;width:70%;"> <svg
					id="barcode${distictvalue}" style="margin-top: -5px;width:70%;" ></svg>
				<%-- <div>
					<span class="col-lg-4"
						style="font-size: 11px; width: 30%; padding-left: 0px; padding-right: 0px;">M.R.P
						Rs.</span> <span class="col-lg-4"
						style="font-size: 10px;letter-spacing:1px;    font-weight: 800; width: 50%; padding-left: 0px; padding-right: 0px;">${plu.price}</span><span
						style="width: 20%; font-size: 6px;">(incl of all taxes)</span>
				</div> --%>
			</span> 
			
			<div style="font-size: 8px;letter-spacing:1px; margin-top: 0px;font-weight: 600;">Packaging Date:
				01-01-2017</div>
				<span style="font-size: 7px;">
				Santusthi Enterprises Pvt. Ltd.
				<br>
				229,Kartik Complex, New Link Road.
				<br>
				
				Andheri(w) Mumbai 53.</br>
				</span>
			<span class="col-lg-6"
				style="font-size: 6px; padding-left: 0px; padding-right: 0px;">Email:info@redchilliesfashion.com</span>
			<span class="col-lg-6"
				style=" font-size: 6px; padding-left: 0px; padding-right: 0px;float: right;">Toll
				Free No:02228062626</span>
		</div>




	</div>





</body>
</html>