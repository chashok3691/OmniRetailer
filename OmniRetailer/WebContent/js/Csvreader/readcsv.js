 $(function () {
     var csv = $("#fileUploadCSV").val();
     $("#btnUpload").bind("click", function () {
      
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.txt)$/;//regex for Checking valid files csv of txt
        if (regex.test($("#fileUploadCSV").val().toLowerCase())) {
            if (typeof (FileReader) != "undefined") {
                var reader = new FileReader();
                reader.onload = function (e) {
                      var rows = e.target.result.split("\r\n");

                      if (rows.length > 0) {
                           var first_Row_Cells = splitCSVtoCells(rows[0], ","); //Taking Headings

                   /* if (first_Row_Cells.length != 3 ) {
                        alert('Please upload a valid csv ,Colums count not matching ');
                        return;
                    }*/
                  /*  if (first_Row_Cells[0] != "Name") {
                        alert('Please upload a valid csv, Check Heading Name');
                        return;
                    }
                    if (first_Row_Cells[1] != "Email") {
                        alert('Please upload a valid csv, Check Heading Email');
                        return;
                     
}
                      if (first_Row_Cells[2] != "Phone_Number") {
                         
                    	  alert('Please upload a valid csv, Check heading Phone Number');
                         return;
                      }*/
                      
                          
                      var sku = new Array();
                      for (var i = 1; i < rows.length; i++) {
                           var cells = splitCSVtoCells(rows[i], ",");


                            var obj = {};
                            for (var j = 0; j < cells.length; j++) {
                                 obj[first_Row_Cells[j]] = cells[j];
                                 
                                 
                               
                               
                            }
                       
                       /*  if (first_Row_Cells[4] == "costPrice") {
                              if(isNaN(obj[first_Row_Cells[4]])){
                             	  alert('enter valid cost price');
                                  return;
                              }
                            
                           }*/
                            sku.push(obj); 
                       }
                       
                      
                      
                      console.log(sku);
                       var html = "";
                       var contextPath = $("#contextPath").val();
                      
                       $("#Error").html("");
                       for (i = 0; i <sku.length; i++) {
                           //debugger;
                          
                           /*if ($("#skuId" + i).val() == sku[i].skuId && $("#itemPrice"+i).text() == sku[i].costPrice && $("#pluCode" + i).val() == sku[i].pluCode ) {
             					var pack =  parseInt($("#quantity"+i).text())+1;
             	    			 $("#quantity"+i).text(pack);
             	    			 var cost =  parseFloat($("#itemPrice"+i).text());
             	    			 $("#totalCost"+i).text(pack*cost);
             	    			 changeTotalOrderCost();
             	        		 return;
             				}*/
                           
                           
                           var ok=true;
                           var model = sku[i].availableQty;
               			if(model == null)
               				model = "0";
               		  var count = 1;   
                           if (sku[i].skuId != "" && sku[i].skuId != undefined) {
                        	  var ean = "";
                        	  ean = sku[i].ean;
                        	  if(ean==null)
                        		  sku[i].ean = "";
                        	 /* if(!isNaN(ean))
                        		  sku[i].ean = toFix(ean);*/
                        	  
                        	   if((!isNaN(sku[i].costPrice)) && (!isNaN(sku[i].Quantity)) && (!isNaN(sku[i].Tax))){
                        	   var len = parseInt($("#productsList tr").length);
                        			if (len != 1)
                        				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
                          	var row	/* html+*/= "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+len+"</td>" +
           					"<td id='itemId"+len+"'>"+sku[i].skuId+"</td>" +
           					"<td id='ean"+len+"'>"+sku[i].ean+"</td>" +
           	 		"<input type='hidden' id='skuId"+len+"' value='"+sku[i].skuId+"'/>" +
           	 		"<input type='hidden' id='pluCode"+len+"' value='"+sku[i].skuId+"'/>" +
           	 		"<input type='hidden' id='category"+len+"' value='"+sku[i].category+"'/>" +
           			"<input type='hidden' id='brandCode"+len+"' value='"+sku[i].Brand+"'/>" +
           			"<input type='hidden' id='productRange"+len+"' value='"+sku[i].Grade+"'/>" +
           			"<input type='hidden' id='measureRange"+len+"' value='"+sku[i].Range+"'/>" +
           			//"<input type='hidden' id='tax"+len+"' value='"+taxamount+"'/>" +
           			"<td id='itemDesc"+len+"'>"+sku[i].description+"</td>"+
           			"<td class='Price' id='itemPrice"+len+"'  type='number'  onBlur='changeOrderedPrice(this);' contenteditable='true' >"+parseFloat(sku[i].costPrice).toFixed(2)+"</td>" +
           	 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+sku[i].Quantity+"</td>" +
           	 		"<td  id='tax"+len+"' onBlur='changeTax(this);' contenteditable='true'>"+sku[i].Tax+"</td>" +
           	 		"<td class='cost' id='totalCost"+len+"'>"+parseFloat(sku[i].costPrice*sku[i].Quantity).toFixed(2)+"</td>" +
           	 		"<td id='make"+len+"'>"+sku[i].UOM+"</td><td id='model"+len+"'>"+model+"</td><td id='color"+len+"'>"+sku[i].Colour+"</td>" +
           	 		"<td id='size"+len+"'>"+sku[i].Size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku[i].skuId+"'/>" +
           	 		"</td></tr>";
                            $("#productsList tbody").append(row);
                          	//document.getElementById('tbodyLeads').innerHTML = html;
                            changeTotalOrderCost();
                        	   }
                        	  
                        	   else
                        		   {
                        		  
                        		 // alert("upload valid data "+ sku[i].skuId);
                        		  $("#Error").html("upload valid data");
                        		   
                        	   }
                                    }
                         
                                }
                      //document.getElementById('tbodyLeads').innerHTML = html;
                    //  $("#productsList tbody").append(row);
                      
                      }
                     
                        }
                        reader.readAsText($("#fileUploadCSV")[0].files[0]);
                    }
                    else {
                        alert("This browser does not support HTML5.");
                    }
                } else {
                    alert("Select a valid CSV File.");
                }
            });
        });
        function splitCSVtoCells(row, separator) {
            return row.split(separator);
        }
        
    
        
      
        
        
        
       