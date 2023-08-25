$(document).ready( function() {
	var localeVal;
	var URL;
	
	//var defaultLocale = $("#defaultLocale").val();
	//$("#selectLocale").val(defaultLocale.trim());
	 
	
	$("#selectLocale").change( function() {
			localeVal = $("#selectLocale").val();
			var contextPath = $("#contextPath").val();
			//alert(contextPath);
			//alert(document.URL);
		if (localeVal == "english") {
			
			URL = contextPath + "/Locale/english.do";
//			window.location.href=URL;

		} else if (localeVal == "chinese") {
			URL = contextPath + "/Locale/chinese.do";
//			window.location.href=URL;

		} else if (localeVal == "german") {
			URL = contextPath + "/Locale/german.do";
		
//			window.location.href=URL;
			//$("select option[value='german']").attr("selected","selected");
			    
			

		} else if (localeVal == "french") {
			URL = contextPath + "/Locale/french.do";
//			window.location.href=URL;

		} else if (localeVal == "italian") {
			URL = contextPath + "/Locale/italian.do";
//			window.location.href=URL;

		} else {
			URL = "";

		}
		$.ajax({
			type: "GET",
			url : URL,
			success : function(result) {
				 location.reload();
		},
		error : function() {
			 alert("something went wrong");
		}
	});	
		});
});