function getprocurementconsumptiongraph(){
var stocksObj = $("#stocksObj").val();
/*stocksObj = stocksObj.replace(/ /g,'').replace('[','').replace(']','');
stocksObj = stocksObj.split(',');*/
var skuId = [], PQty = [] ,CQty = [];
$('.graph').each(function(){
		var id= $(this).attr("id").replace('skuid','');
		skuId.push($("#skuid"+id).text());
		PQty.push($("#Pqty"+id).text());
		CQty.push($("#Cqty"+id).text());
	});

stocksObj = PQty;
//stocksObj = JSON.parse(stocksObj);
var label = [];
var searchCriteria = $("#searchCriteria").val();
if(searchCriteria == "month"){
	for(var i=1;i<=stocksObj.length;i++){
		label.push('');
	}
}
else
	label = skuId;

var stocksLineChartData = {
		labels : label,
		datasets : [
			{
				/*fillColor : "#00a65a",*/
				fill: false,
				strokeColor : "#00a65a",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				/*data : [0.65,0.59,0.90,0.81,0.56,0.55,0.40],*/
				data : CQty,
	            title : "Consumption",
	            label : "Quantity"
			},
			{
				/*fillColor : "#337ab7",*/
				fill: true,
				strokeColor : "#337ab7",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				/*data : [0.65,0.59,0.90,0.81,0.56,0.55,0.40],*/
				data : stocksObj,
	            title : "Procurement",
	            label : "Quantity"
			}
		]

	}
 return stocksLineChartData;
}



function getpricevariationgraph(){
	var stocksObj = $("#stocksObj").val();
	/*stocksObj = stocksObj.replace(/ /g,'').replace('[','').replace(']','');
	stocksObj = stocksObj.split(',');*/
	var skuId = [], PQty = [] ,CQty = [];
	$('.graph').each(function(){
			var id= $(this).attr("id").replace('skuid','');
			skuId.push($("#date"+id).text());
			PQty.push($("#Pqty"+id).text());
			CQty.push($("#Cqty"+id).text());
		});

	stocksObj = PQty;
	//stocksObj = JSON.parse(stocksObj);
	var label = [];
	var searchCriteria = $("#searchCriteria").val();
	if(searchCriteria == "month"){
		for(var i=1;i<=stocksObj.length;i++){
			label.push('');
		}
	}
	else
		label = skuId;

	var stocksLineChartData = {
			labels : label,
			datasets : [
				
				{
					/*fillColor : "#337ab7",*/
					fill: true,
					strokeColor : "#337ab7",
					pointColor : "#ccc",
					pointStrokeColor : "#fff",
					/*data : [0.65,0.59,0.90,0.81,0.56,0.55,0.40],*/
					data : CQty,
		            title : "Price Variation",
		            label : "Quantity"
				}
			]

		}
	 return stocksLineChartData;
	}




function changeqty(ele,td,price){
	debugger
	//var price = $('option:selected',this).text();
	//var price = $(this).find('option:selected').text();
	$("#warehouse_location option:selected").text();
	var index = $("#qty"+ele).val();
	var price = $("#cosrcol"+ele).val();
	//$("#quantity"+td).text('');
	$("#quantity"+td).text(index);
	$("#cost"+td).text(parseFloat(index*price).toFixed(2));
}