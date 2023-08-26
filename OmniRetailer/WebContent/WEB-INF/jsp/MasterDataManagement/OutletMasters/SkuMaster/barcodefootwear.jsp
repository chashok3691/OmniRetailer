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

   <script type="text/javascript" src="${pageContext.request.contextPath}/js/JsBarcode.ean-upc.min.js"></script>
<title>Insert title here</title>


 <script>
          /*   function PrintElem(elem)
            {
                Popup($("#displayOrders").html());
                console.info($("#displayOrders").html())
            }

            function Popup(data) 
            {
                var mywindow = window.open('', 'my div', 'height=400,width=600');
                mywindow.document.write('<html><head><title>ORDER DETAILS</title>');
             // mywindow.document.write('<link rel="stylesheet" href="GoodSeeds/css/home.css" type="text/css" />');
                mywindow.document.write('</head><body >');
                mywindow.document.write($(".orderViews").html());
                mywindow.document.write('</body></html>');

                mywindow.document.close(); // necessary for IE >= 10
                mywindow.focus(); // necessary for IE >= 10

                mywindow.print();
                mywindow.close();

                return true;
            } */
            
            </script>
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
			"height" : 18,
			 "width" : 1.4, 
			"textMargin" : 0,
			"marginLeft" :-1,
			"marginTop" :0,
			"marginBottom" :0,
			"marginRight" :0,
			"textAlign" : "left",
			"fontOptions" : "italic",
			"displayValue" : "true",
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
          // mywindow.document.write('<html><head><title>ORDER DETAILS</title>');
        // mywindow.document.write('<link rel="stylesheet" href="GoodSeeds/css/home.css" type="text/css" />');
           mywindow.document.write('</head><body >');
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
		if($("#outletCategory").val()== ''){
			$("#Errorid").text("Please select a category before printing.");
			return;
		}
		else{
		debugger
		var defaultValues = {

				EAN13 : "1234567890128",
				EAN8 : "12345670",
				UPC : "123456789999",

			};
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
	   	          // mywindow.document.write('<html><head><title>ORDER DETAILS</title>');
	   	        // mywindow.document.write('<link rel="stylesheet" href="GoodSeeds/css/home.css" type="text/css" />');
	   	           mywindow.document.write('</head><body >');
		   		    $(selectedLength).each(function(){
		   		    	if($(this).attr("onClick") != "selectAll(this)")
		   		    		{
		   		    		selected = $(this).val();
		   		    		//alert($("#"+selected).val());
			   				var num = $(this).val()+"no";
			   				var numid = $(this).val()+"no";
			   				num =$("#"+num).val() ;
			   				var id= $(this).val()+"allign";
			   				//alert(num);
			   				/* var sku = "";
			   				sku =${skulist.skuId};
			   				alert(sku) */
			   				var check = num;
			   	           for(var i=0;i<num;i++){
			   	        	   if(check>1){
			   	        		   if(check%2=='0')
			   	        			   {
			   	        			 $("#"+id).css("float","right");
			   	        			$("#"+id).css("margin-right","25px");
			   	        			$("#"+id).css("margin-left","0px");
			   	        			$("#allignment").val('0');
			   	        			   }
				   	        	   else{
				   	        		 $("#"+id).css("float","left");  
				   	        		$("#"+id).css("margin-right","5px");
			   	        			$("#"+id).css("margin-left","5px");
			   	        			$("#allignment").val('1');
				   	        	   }
			   	        		check = check-1;
			   	        	   }
			   	        	   else{
			   	        		   if($("#allignment").val()=='1'){
			   	        			$("#"+id).css("float","right");
			   	        			$("#"+id).css("margin-right","25px");
			   	        			$("#"+id).css("margin-left","0px");
			   	        			$("#allignment").val('0');
			   	        		   }
			   	        			 else{
			   	        				 $("#"+id).css("float","left"); 
			   	        				$("#"+id).css("margin-right","5px");
				   	        			$("#"+id).css("margin-left","5px");
			   	        				$("#allignment").val('1');
			   	        			 }
			   	        			
			   	        			   
			   	        	   }
			   	        /* 	   alert(i); */
			   	       if(id.length>12)
			   	        	 mywindow.document.write($('.'+selected).html());  
			   	           }
			   	        $("#"+numid).val('0') ;
		   		    		}
		   		    	/*	selected += $(this).val()+",";*/
		   		    	//selected += $(this).val().replace(/\//g, '')+",";
		   			});
		   		  mywindow.document.write('</body></html>');

	   	           mywindow.document.close(); // necessary for IE >= 10
	   	           mywindow.focus(); // necessary for IE >= 10

	   	           mywindow.print();
	   	           mywindow.close();
		   		 return true;
		   			/*selected = selected.slice(0,-1);// Remove last comma
		   			if(atLeastOneIsChecked){
		   				
		   				var newBarcode = function() {
		   					//Convert to boolean
		   					$("#barcode").JsBarcode($("#mfid").val(), {
		   						"format" : "EAN13",
		   						"background" : "#fff",
		   						"lineColor" : "#000",
		   						"height" : 25,
		   						"width" : 2,
		   						"margin" : 10,
		   						"displayValue" : "false",
		   						"valid" : function(valid) {
		   							if (valid) {
		   								$("#barcode").show();
		   								$("#invalid").hide();
		   							} else {
		   								$("#barcode").show();
		   								$("#invalid").hide();
		   							}
		   						}
		   					});

		   				};
		   			}*/
		   			
		   		
		}
		
		 
	}

	
	</script>
</head>
<body>
<input type="hidden" id="allignment" value="1"/>
	<div class="barcode-container ${plu.pluCode}" style="">
	<div id="${plu.pluCode}allign" style="padding:3px;margin-left:5px;margin-right:5px;margin-top:10px;margin-bottom:10px;/* border-top: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000;border-right: 1px solid #000; */width:140px;">
		
		<svg id="barcode${distictvalue}" style=""></svg>
	<%-- 	
		<div><span class="col-lg-4" style="font-size:8px;width: 30%;">Product ID</span>
		<span class="col-lg-4" style="font-size:8px;width: 70%;">:${skulist.skuId}</span></div>
		<div><span class="col-lg-4" style="font-size:8px;width: 30%;">Product </span>
		<span class="col-lg-4" style="font-size:8px;width: 70%;">:${skulist.ean}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Size</span>
		<span class="col-lg-4" style="font-size:8px;width: 70%;">:${plu.size}</span></div>
		<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Artical No</span>
		<span class="col-lg-4" style="font-size:11px;width: 70%;">:${plu.productBatchNo}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Colour</span>
		<span class="col-lg-4" style="font-size:8px;width: 70%;">:${plu.color}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Mrp</span>
		<span class="col-lg-4" style="font-size:8px;width: 70%;">:${plu.salePrice}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Brand</span>
		<span class="col-lg-4" style="font-size:8px;width: 70%;">:${skulist.brandCode}</span></div> --%>
		<div class="col-lg-12" style="font-size:11px;">Product ID:${skulist.skuId}</div>
		<div class="col-lg-12" style="font-size:11px;">Size:${plu.size}</div>
		<div class="col-lg-12" style="font-size:11px;">Colour:${plu.color}</div>
		<div class="col-lg-12" style="font-size:11px;">MRP:${plu.price}</div>
		<div class="col-lg-12" style="font-size:11px;">Brand:${skulist.brandCode}</div>
		
		
<%-- 		<div class="col-lg-4" style="font-size:10px;width: 50px;">Size</div>
		<div class="col-lg-4" style="font-size:10px;width: 90px;">:${plu.size}</div>
		<div class="col-lg-4" style="font-size:10px;">Colour:${plu.color}</div>
		<div class="col-lg-4" style="font-size:10px;">Mrp:${plu.salePrice}</div>
		<div class="col-lg-4" style="font-size:10px;">Brand:${skulist.brandCode}</div> --%>
		<div class="col-lg-4" style="border-bottom: 1px solid #000;width:140px;"></div>
	
		<div class="col-lg-12" style="font-size:11px;">Head office:</div>
		<div class="col-lg-12" style="font-size:9px;">Sahyadri Agro Retails Ltd.</div>
		<div class="col-lg-12" style="font-size:9px;">Survey No-314/2.A/P Mohadi,</div>
		<div class="col-lg-12" style="font-size:9px;">Tal:Dindori Nashik-422206</div>
		<div class="col-lg-12" style="font-size:9px;">Maharashtra,India.</div>
		<div class="col-lg-12" style="font-size:9px;">For Customer queries:</div>
		<div class="col-lg-12" style="font-size:9px;">E-mail:caresarl@sahyadrifarms.com</div>
		<div class="col-lg-12" style="font-size:9px;">Toll Free Number:180030005080</div>
	
	
		</div>
		
		
		<%-- <span id="invalid${skulist.skuId}">Not valid data for this barcode type!</span> --%>
	</div>



</body>
</html>