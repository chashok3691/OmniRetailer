/**
 * 
 */
function caluclateProfitability(rowNo){
	debugger
	
	
	  var newPrice = parseFloat($("#newPrice"+rowNo).text());
	  var costPrice = parseFloat($("#newcostPrice"+rowNo).text());
//	var  profitabilityValue = newPrice-costPrice;
	/*$('.newPrice').each(function(){
	  var rowNo = $(this).attr("id").replace('newPrice','');
	  var newPrice = $("#newPrice"+rowNo).text();
	  var costPrice = $("#costPrice"+rowNo).text();
	  profitabilityValue = newPrice-costPrice;
	 });*/
	 
	  var totalProfit=(parseFloat((newPrice-costPrice)).toFixed(2));
	  var totalProfitPercentage = parseFloat((totalProfit/newPrice)*100).toFixed(2);
	  if(costPrice == "0.0" && newPrice == "0.0")
	$('#profitabilitynew'+rowNo).text("0"+"%");
	  else if(costPrice == "0.0" && newPrice > "0.0")
	$('#profitabilitynew'+rowNo).text("100"+"%")
	else if(newPrice == "0.0" && costPrice > "0.0")
	$('#profitabilitynew'+rowNo).text("-100"+"%");
	  else
	$('#profitabilitynew'+rowNo).text(totalProfitPercentage+"%");
	  //('%').appendTo('#perCentageValue');
}

