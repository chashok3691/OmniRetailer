(function($){
	$.fn.advancedtable = function(custom) {
	
		// Default configuration
		var defaults = {
		  	rowsPerPage: 18,
			currentPage: 1,
			loadElement: "",
			searchField: "",
			searchColumn: 0,
			searchCaseSensitive: false,
			navigationLabel: "",
			delay: 300,
			
			
			csv: '',
			csvSeperator: ',',
			evenColor: '',
			oddColor: ''
		};
		  
		// Combine user and default configuration
		var settings = $.extend({}, defaults, custom);
		
		// Decrement currentPage setting
		settings.currentPage--;
		
		// Variable declarations
		var table = this;
		var currentPage = 0;
		
		// If csv file table
		if(settings.csv != ''){
			
			// Show loader box
			showLoad();	

			$.get(settings.csv, function(data){				   
				var rows = data.split('\n');
				var rowNumber = rows.length;
				var colNumber = rows[0].split(settings.csvSeperator).length;
				var htmlData = "";
				for(var i=0 ; i < rowNumber ; i++){
					cols = rows[i].split(settings.csvSeperator);
					htmlData += '<tr class="" style="display: table-row;">';
					for(var j=0; j < colNumber ; j++){
						htmlData += "<td>" + cols[j] + "</td>";
					}
					htmlData += "</tr>";
				}
				
				// Fill table
				table.find("tbody").html(htmlData);
				
				// Redraw table
				redrawTable();
				
			});
		}
			
		// Define searchfield if needed
		if(settings.searchField != ""){	
			$(settings.searchField).show();
			$(settings.searchField).keyup(redrawTable);
		}
			
		// Redraw table
		//redrawTable();

		// START REDRAWTABLE
		function redrawTable() {

			// Show loader box
			showLoad();	
		
			// Case sensitive option string format
			var strsearch = "";
			if(typeof(this.value) != "undefined"){
				if(settings.searchCaseSensitive){
					strsearch = this.value;
				}else{
					strsearch = this.value.toLowerCase();	
				}
			}

			// Define counter
			var i = 0;
		 
			// START TR LOOP
		  	table.find('tbody tr').each(function () { 

				// Set found to false
				var found = false;
				
				// Define counter
				var i = 1;
				
				// START TD LOOP
				$(this).find('td').each(function () { 		  
					
					// If search all columns or search in this column
					if((settings.searchColumn==0) || (settings.searchColumn==i)){
						
						// Case sensitive string format
						if(settings.searchCaseSensitive){
							var strcell = stripHtml(this.innerHTML);
						}else{
							var strcell = stripHtml(this.innerHTML.toLowerCase());
						}

						// If string is found in this cell
						if((strcell.indexOf(strsearch) > -1)){
							found = true;  
						}
					}
					
					// Increment column number
					i++;
					
				});
				// END TD LOOP
				
				// Mark hide or show row
				if(found){
					$(this).removeClass("searchhide");
				}else{
					$(this).addClass("searchhide");
				}

			}); 
				
			// Count table rows that match the search term
			
			
	
			
	
			
			// Get current page number
			currentPage = getCurrentPage();
					
			// Set active page
			setActivePage(currentPage);
			
			// Hide loader box
			hideLoad();	
			
			// Add Table stripes
			stripeRows();
						
		} 
		// END REDRAWTABLE
		
		// START SETACTIVEPAGE
		function setActivePage(number){
		
			// Make the correct page selected
			table.find('.tableNavigation li').removeClass("active");
			table.find('.tableNavigation li:eq(' + number + ')').addClass("active");
				
			// Get current rows per page
		    var rowsPerPage = settings.rowsPerPage;
		        
		    // Show rows
		    var from 		= number * rowsPerPage;
		    var to 			= (number + 1) * rowsPerPage;
			var tableRows 	= table.find('tbody tr:not(.searchhide)').length;
			
	        table.find('tbody tr').hide();
			table.find('tbody tr:not(.searchhide)').slice(from, to).show();
			
			// Change information text
			table.find('.tableInfo').html("Showing " + (from + 1) + " - " + ((tableRows < to) ? tableRows : to) + " of " + tableRows);
			
		}
		// END SETACTIVEPAGE
		
		// START GETCURRENTPAGE
		function getCurrentPage(){
			var currentPage = (parseInt(table.find('.tableNavigation li.active').find("a").html())) - 1;
			if(isNaN(currentPage)){
				return 0;
			}
			return currentPage;
		}
		// END GETCURRENTPAGE
		
		// START SHOWLOAD
		function showLoad(){
			if(settings.loadElement != ""){
				$(settings.loadElement).show();
			}
		}
		//END SHOWLOAD
		
		// START HIDELOAD
		function hideLoad(){
			if(settings.loadElement != ""){
				if(settings.delay > 0){
					setTimeout( function () { 
							$(settings.loadElement).hide();
					}, settings.delay);
				}else{
					$(settings.loadElement).hide();
				}
			}
		}
		//END HIDELOAD
		
		// START STRIPHTML
		function stripHtml(oldString) {

		   var newString = "";
		   var inTag = false;
		   for(var i = 0; i < oldString.length; i++) {
		   
				if(oldString.charAt(i) == '<') inTag = true;
				if(oldString.charAt(i) == '>') {
					  if(oldString.charAt(i+1)=="<")
					  {
							//dont do anything
			}
			else
			{
				inTag = false;
				i++;
			}
				}
		   
				if(!inTag) newString += oldString.charAt(i);

		   }

		   return newString;
		}
		// END STRIPHTML
		
		// START TRIM
		function trimString(str){
			return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
		}
		// END TRIM
		
		
	
		function stripeRows(){
			table.find("tbody tr").removeClass("oddRow");
			table.find("tbody tr").removeClass("evenRow");
			table.find("tbody tr:visible:even").addClass("evenRow");
			table.find("tbody tr:visible:odd").addClass("oddRow");
		}

		// Return the jQuery object to allow for chainability.
		return this;
		
	}
	
})(jQuery);
