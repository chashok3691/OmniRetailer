<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/JsBarcode.ean-upc.min.js"></script>
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
	var barcode = $("#mfid").val();
	 /* var lastDigit = Number(barcode.substring(barcode.length - 1));
	  var checkSum = 0;
	  if (isNaN(lastDigit)) { return false; } // not a valid upc/ean */

	  var arr = barcode.substring(0,barcode.length).split("").reverse();
	  var oddTotal = 0, evenTotal = 0;

	  for (var i=0; i<arr.length; i++) {
	   // if (isNaN(arr[i])) { return false; } // can't be a valid upc/ean we're checking for

	    if (i % 2 == 0) { 
	    	
	    	oddTotal += Number(arr[i]) * 3; }
	    else {
	    	
	    	evenTotal += Number(arr[i]); }
	  }
	
	  checkSum = (10 - ((evenTotal + oddTotal) % 10)) % 10;

	/*   // true if they are equal
	  return checkSum == lastDigit; */
	  barcode = barcode.concat(checkSum);
	  $("#mfid").val(barcode);
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
		
		var defaultValues = {

				EAN13 : "1234567890128",
				EAN8 : "12345670",
				UPC : "123456789999",

			};
			 var selectedLabel = 'Please Select Atleast One Indent to generate PO for ';
			 	var name=$('#deleteActionLabel').val();
		   		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
		   		var selectedLength = $('input[name="selectall"]:checked').length;
		   		var selectedID = $("#selectall").length;
		   		if(selectedLength == 1 && selectedID == 0)
		   			atLeastOneIsChecked = false;
		   		var yes = false;
		   			var selectedLength = $('input[name="selectall"]:checked');
		   		    $(selectedLength).each(function(){
		   		     var selected = "";
		   		    	if($(this).attr("onClick") != "selectAll(this)")
		   		    		{
		   		    		selected = $(this).val()+"ean";
		   		    		alert($("#"+selected).val());
		   		    		var newBarcode = function() {
			   					//Convert to boolean
			   					$("#barcode").JsBarcode($("#"+selected).val(), {
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
			   				/*var num = $(this).val()+"no";
			   				num =$("#"+num).val() ;
			   				alert(num);
			   			  var mywindow = window.open('', 'my div', 'height=400,width=600');
			   	          // mywindow.document.write('<html><head><title>ORDER DETAILS</title>');
			   	        // mywindow.document.write('<link rel="stylesheet" href="GoodSeeds/css/home.css" type="text/css" />');
			   	           mywindow.document.write('</head><body >');
			   	           for(var i=0;i<num+1;i++)
			   	           mywindow.document.write($(".barcode-container").html());
			   	           mywindow.document.write('</body></html>');

			   	           mywindow.document.close(); // necessary for IE >= 10
			   	           mywindow.focus(); // necessary for IE >= 10

			   	           mywindow.print();
			   	           mywindow.close();

			   	           return true;*/
		   		    		}
		   		    	/*	selected += $(this).val()+",";*/
		   		    	//selected += $(this).val().replace(/\//g, '')+",";
		   			});
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
	
	
	
	</script>
</head>
<body>
	<div class="barcode-container">
	
		<svg id="barcode" style="float:right" ></svg>
		<%-- <br><br>
		<br><br>
		Product Id:${sku.skuId}
		<br>
		Size      :
		<br>
		Colour    :
		<br>
		Brand     :${sku.brandCode}
		<br> --%>
		
		<span id="invalid">Not valid data for this barcode type!</span>
	</div>

</body>
</html>