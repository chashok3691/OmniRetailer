<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/packagingandprocessing/packagingandprocessingsummary.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
       <script src="${pageContext.request.contextPath}/js/storagesystem.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
      <script type="text/javascript">
function criteria(str) {


    var x = $(str).val();
    if (x.includes("'") || x.includes("/") || x.includes("(")  || x.includes(")") || x.includes("|") || x.includes("$") || x.includes("\n") || x.includes("~") || x.includes("`") || x.includes("!") || x.includes("%") || x.includes('"') ||   x.includes("<") || x.includes(">")  || x.includes("*") || x.includes("#") || x.includes(":") ||  x.includes(";")  || x.includes("{") || x.includes("}") || x.includes("[") ||  x.includes("]") || x.includes("=") || x.includes("+") || x.includes("^") || x.includes("?")|| x.includes("@") ){
    
            alert("Special characters are not allowed!");
            x=$(str).val().replace(/['&~%/\\#!]/g,' ');
    /*   x=$(str).val(""); */

    }
     $(str).val(x.trim());
}
</script>
	  
        
</head>
<style>
.allignment{
   /*   width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}

a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
   /*  height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	//callCalender('from');
	//callCalender('to');
	
	/* $("#searchStocks").val($("#stock").val());
		$("#searchStocks").focus();  
	$('#searchStocks').on('input',function(e){
		if($(this).val().trim()==""){
			viewOutletStocks('','','0');
		}
	});
	


	/*added by manasa to search stocks when trigger search button  */
/*
		 $('#mySearch').click(function(){
		        var search = $('#searchStocks').val();
		        return searchStocks(search,'','0');
		    })
		    $('#searchStocks').keypress(function(e){
		        if(e.which == 13){//Enter key pressed
		            $('#mySearch').click();//Trigger search button click event
		        }
		    });
	

			 var packTotal = [];
			   var totalPack=0.0;
			   $('.packQty').each( function(){
				   if($(this).text()=="")
					   packTotal.push("0");
				   else
					   {
					   packTotal.push( $(this).text() );  
					   } 
			   	     });
				
				for (var i = 0; i < packTotal.length; i++) {
					totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
				}
				if(totalPack < 0)
					totalPack = totalPack * (-1);
					
				$('#totalPackQty').text(parseFloat(totalPack+0.00).toFixed(2));
				
				 var StockTotal = [];
				   var totalStock=0.0;
				   $('.stockQty').each( function(){
					   if($(this).text()=="")
						   StockTotal.push("0");
					   else
						   {
						   StockTotal.push( $(this).text() );  
						   }
				   	     });
					
					for (var i = 0; i < StockTotal.length; i++) {
						totalStock  = parseFloat(totalStock ) + parseFloat(StockTotal[i]);
					}
					if(totalStock < 0)
						totalStock = totalStock * (-1);
					
					$('#totalStockQty').text(parseFloat(totalStock+0.00).toFixed(2));
				
					

							var StockTotal = [];
						   var totalStock=0.0;
						   $('.stockVal').each( function(){
							   if($(this).text()=="")
								   StockTotal.push("0");
							   else
								   {
								   StockTotal.push( $(this).text() );  
								   }
						   	     });
							
							for (var i = 0; i < StockTotal.length; i++) {
								totalStock  = parseFloat(totalStock ) + parseFloat(StockTotal[i]);
							}
							if(totalStock < 0)
								totalStock = totalStock * (-1);
							$('#totalStockValue').text(parseFloat(totalStock+0.00).toFixed(2));
						
				 
							// added to fetch locations based on zone 
						/* 	var zone = $("#outletZone").val();
					var flowUnder = $("#flowUnder").val();
					 var location = $("#outletLocation").val();
					 if( zone != null && zone !="" && location!= null && location == "")
						 {
						searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation',flowUnder);
					} */
			 
		});
</script>
<body>

<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stocks.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Storage Systems Master
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
             
             
                           <div class="row">
             <div class=" col-lg-12" style="">
             <div class=" col-lg-10" style="">
             </div>
             <div class=" col-lg-2" style="">
                           <div class="row">
                  <div class="col-lg-6" style="    padding-right: 0px;">
                  </div>
                  <div class="col-lg-6">
                  
             <a onclick="addStorageMasterNew();" class="button" style="margin-top:0px;margin-bottom:0px;padding: 2px 2px 28px 0px;">New</a>
                  
                  </div>
                  
                   
                  </div>
                        </div>
                        </div>
                        </div>
                
                     <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="productstocks" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	<th>Storage System ID</th>
                             	<th>Storage System Name</th>
                             	<th>Storage Type</th>
                             	<th>Manufacturer</th>
                             	<th ><spring:message code="noofitems.label" /></th>
                                <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="storageSystem" items="${storageSystemMaster}"  varStatus="theCount">
                         	 <tr>
								 <td>${theCount.count +index -1}</td>
                         	 	<td>${storageSystem.storageSystemId}</td>
                         	 	<td>${storageSystem.storageSystemName}</td>
                             	<td>${storageSystem.storageSystemType}</td>
                             	<td>${storageSystem.manufacturer}</td>
                             	<td >${storageSystem.noOfLevels}</td>
                                
                                <td><a style="color:#2e7ea7 !important;" href="#" onclick="viewEditStorageMaster('${storageSystem.storageSystemId}','view');" >View
                                               
                                 </a> &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;" href="#" onclick="viewEditStorageMaster('${storageSystem.storageSystemId}','edit');">Edit</a>
                                               
                                 </td>
                             </tr>
                            </c:forEach>
                           
                         </tbody>
                     </table>
                    </div>
                     </div>


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','${totalValue}','');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">  
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','${totalValue}','');">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">  
              		  <input type="button" onclick="viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster',document.getElementById('pagination').value,'');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>    


                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>