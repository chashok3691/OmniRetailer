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
	debugger
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
			"height" : 25,
			 "width" : 1.5, 
			"textMargin" : 1,
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
				   				var id= $(this).val()+"ean";
				   				id =$("#"+id).val() ;
				   				//alert(num);
				   				/* var sku = "";
				   				sku =${skulist.skuId};
				   				alert(sku) */
				   	           for(var i=0;i<num;i++){
				   	        /* 	   alert(i); */
				   	       if(id.length>12)
				   	        	 mywindow.document.write($('.'+selected).html());  
				   	           }
			   		    		}
			   		     $("#"+numid).val('0') ;
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
<input type="hidden" value="${ean}"/>
	<div class="barcode-container ${plu.pluCode}" style="">
	<div style="padding:3px;margin-left:6px;margin-right:24px;margin-top:3px;margin-bottom:3px;float:left;/* border-top: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000;border-right: 1px solid #000; */width:163px;">
		<br>
		<svg id="barcode${distictvalue}"  style="margin-right:-10px;"></svg>
		<br>
		<div><span class="col-lg-4" style="font-size:12px;width: 30%;">Product ID</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${skulist.skuId}</span></div>
		<div><span class="col-lg-4" style="font-size:12px;width: 30%;">Product </span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${skulist.description}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Brand</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${skulist.brandCode}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Size</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${plu.size}</span></div>
		<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Artical No</span>
		<span class="col-lg-4" style="font-size:11px;width: 70%;">:${plu.productBatchNo}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">Colour</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${plu.color}</span></div>
			<div><span class="col-lg-4" style="font-size:11px;width: 30%;">MRP</span>
		<span class="col-lg-4" style="font-size:12px;width: 70%;">:${plu.price}</span></div>
		
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
		<div class="col-lg-12" style="font-size:10px;">Toll Free Number:180030005080</div>
		<br>
		<div class="col-lg-4" style="width:165px;"></div>
		</div>
		
		
		<%-- <span id="invalid${skulist.skuId}">Not valid data for this barcode type!</span> --%>
	</div>


</body>
</html>