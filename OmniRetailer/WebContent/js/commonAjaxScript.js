function submitAjaxRequest(URL){
	var responseText;
 if (window.ActiveXObject) {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); // code for IE6,IE5
 } else if (window.XMLHttpRequest) {
	xmlhttp = new XMLHttpRequest(); // code for non IE
 }
 
  xmlhttp.onreadystatechange = function(){
	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			responseText = xmlhttp.responseText;
			
		}
  };
  xmlhttp.open("POST", URL, false); 
  xmlhttp.send();
  return responseText;
}

	
