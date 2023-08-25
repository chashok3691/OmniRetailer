<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/viewDepartmentReport.jsp
 * file type		        : JSP
 * description				: display total billings
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
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lineGraphs.js"></script>
        
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
.col-lg1-2{
    width: 20% !important;
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
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
}
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 4px 10px 28px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 19.5px;
    height: 25px;
    text-align: center;
    margin-bottom: 19px;
    width: 100%;
}
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
	.iospopupp {
   	width: 29%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}

</style>  
<script type="text/javascript">
$(document).ready(function(){
	//$("#billDate").trigger("click");
});

function sortColumn(ele){
	var backgroundCss = $(ele).css("background");
	var order = null;
	var orderBy = null;
	if(backgroundCss.indexOf('both') != -1){
		backgroundCss = backgroundCss.replace('both','asc');
		order = "ASC";
		orderBy = $(ele).attr("id");
	}
	else if(backgroundCss.indexOf('asc') != -1){
		backgroundCss = backgroundCss.replace('asc','desc');
		order = "DESC";
		orderBy = $(ele).attr("id");
	}
	else if(backgroundCss.indexOf('desc') != -1){
		backgroundCss = backgroundCss.replace('desc','asc');
		order = "ASC";
		orderBy = $(ele).attr("id");
	}
	var location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var maxRecords = 10;
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	var index = "0";
	if(endDate !="" && startDate == ""){
		$("#startDateError").html("Date is required for generating report");
		return;
	}
		var criteria = $("#criteria").val();
		var URL = contextPath + "/reports/generateSalesReportCriteriaWise.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				startDate : startDate,
				endDate : endDate,
				maxRecords : maxRecords,
				criteria : criteria,
				index : index,
				order : order,
		   		orderBy : orderBy
			},
   	beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
   	success : function(result){
   		$("#xReportsDisplay").html(result);
   		columnReset();
		$("#"+orderBy).css("background",backgroundCss);
   		$("#loading").css("display","none");
   		$("#mainDiv").removeClass('disabled');
   	},
   	error : function(){
   		alert("Something went wrong");
   		$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
   	}
    });
}
</script>
</head>
<body>
<%-- 	<section class="content-header">
		<h1><spring:message code="outlet.management.label" />
  			<small><spring:message code="billing.payment.label" /></small>
 		</h1>
	<ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="outlet.management.label"/></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showBillsFlows();"><spring:message code="billing.payment.label"/></a></li>
    </ol>
   </section> --%>
<!-- Main content -->
<section class="">
<div class="row">
  <div class="col-lg-12">
  <div class="">
                                <div class="box-body table-responsive">
                                
                                <div class="nav-tabs-custom">
 <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home" style="text-transform: capitalize;">Department Wise Report</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Graphical Report</a></li>
</ul>
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
  
                                
				                    <div class="row">
				                     <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                       <div class="col-lg-1" style="padding-left: 5px;padding-right: 5px;">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="generateSalesReportCriteriaWise('department','','0','','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-6">
				                       <%-- <div class="row">
				                         <div class="col-lg-4" style="text-align:right;top:5px;">
				                           <label><spring:message code="outletlocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                           <select class="form-control" id="outletLocation" onchange="viewBills('','0');">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div> --%>
				                      </div>
				                      <div class="col-lg-4"></div>
				                       <div class="col-lg-1" style="text-align: right;margin-top: 17px;padding-left: 0px;padding-right: 5px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="fontsize:16px;" value="<spring:message code="save.label" />" />
		 </div>
				                    </div>
				                  <c:set var="totalSaleQty" value="0"/>
				                   <c:set var="totalReturnQty" value="0"/>
				                    <c:set var="totalReturnValue" value="0"/>
				                     <c:set var="totalSaleValue" value="0"/>
				                     <c:set var="totalCostValue" value="0"/>
				                    <div class="row" style="padding-left: 5px;padding-right: 5px;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<%-- <th id="date" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;"><spring:message code="date.label" /></th>
                                            	<th id="category" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="category.label" /></th>
                                            	<th id="categoryName" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="category.description.label" /></th>
                                                <th id="quantity" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="order_quantity.label" /></th>
                                                <th id="price" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="item_price.label" /></th> --%>
                                                <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="date.label" /></th>
                                                <th><spring:message code="location.label" /></th>
                                            	<th ><spring:message code="department.label" /></th>
                                            	<th ><spring:message code="department.label" /> &nbsp Desc</th>
                                              
                                                <th><spring:message code="returnQty.label" /></th>
                                                 <th><spring:message code="returnValue.label" /></th>
                                                  <th><spring:message code="saleqty.label" /></th>
                                                  <th><spring:message code="sale.value" /></th>
                                                 <%-- <th><spring:message code="order_quantity.label" /></th>
                                                <th><spring:message code="totalsale.label" /></th> --%>
                                                 <th><spring:message code="total.price.label" /></th>
                                            </tr>
                                        </thead>
                                        
                                        <c:set var="totalItemDiscountValue" value="0"/>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                           <c:if test="${theCount.last}">
                                           
                                        	 <tr style="border-bottom: 2px solid #ccc;">
                                        	 <td>${theCount.count+index-1}</td>
                                                <td>${salesReport.date}</td>
                                                <td>${salesReport.location}</td>
                                                <td>${salesReport.department}</td>
                                                <td>${salesReport.itemDesc}</td>
                                                <td>${salesReport.returnQty}</td>
                                                <td>${salesReport.returnAmt}</td>
                                                <td>${salesReport.quantity}</td>
                                                <td>${salesReport.price}</td>
                                               <%--  <td>${salesReport.quantity}</td>
                                                <td>${salesReport.price}</td> --%>
                                                <td>${salesReport.totalCost}</td>
                                            </tr>
                                            </c:if>
                                              <c:if test="${!theCount.last}">
                                              	<tr>
                                              	<td>${theCount.count+index-1}</td>
                                                <td>${salesReport.date}</td>
                                                 <td>${salesReport.location}</td>
                                                <td>${salesReport.department}</td>
                                                <td>${salesReport.itemDesc}</td>
                                                <td>${salesReport.returnQty}</td>
                                                <td>${salesReport.returnAmt}</td>
                                                <td>${salesReport.quantity}</td>
                                                <td>${salesReport.price}</td>
                                               <%--  <td>${salesReport.quantity}</td>
                                                <td>${salesReport.price}</td> --%>
                                                <td>${salesReport.totalCost}</td>
                                            </tr>
                                              </c:if>
                                            <c:set var="dataExists" value="true"></c:set>
                                            
                                            
                                             <fmt:formatNumber var="totalSaleQty"  groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalSaleQty+salesReport.quantity}" />
                                              <fmt:formatNumber var="totalSaleValue"  groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalSaleValue+salesReport.price}" />
                                               <fmt:formatNumber var="totalReturnQty"  groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalReturnQty+salesReport.returnQty}" />
                                                <fmt:formatNumber var="totalReturnValue"  groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalReturnValue+salesReport.returnAmt}" />
                                                <fmt:formatNumber var="totalCostValue"  groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalCostValue+salesReport.totalCost}" />
                                           </c:forEach>
                                           <c:if test="${dataExists == 'true'}">
                                           <tr>
                                           		<td></td><td></td><td></td><td></td>
                             <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                             <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalReturnQty}</div></td>
                             <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalReturnValue}</div></td>
                             <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalSaleQty}</div></td>
                             <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalSaleValue}</div></td>
                              <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalCostValue}</div></td>
                                               <%--  <td style="padding:3px;width: 140px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${categorySummery.totalQuantity}</div></td>
                                                
                                                <td style="padding:3px;width: 140px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${categorySummery.totalPrice}</div></td> --%>
                                          
                                           </tr>
                                          </c:if>
                                        </tbody>
                                    </table>
         </div>
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue}','','${flowLocation}')">
	              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
			              		<input type="button" class='paginationButton' value="&#62;" >
			              	</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
		              		<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
			              		<input type="button" class='paginationButton' value="&#62;" >
			              	</div>
		              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue}','','${flowLocation}')">
	              	</div> 
              	</c:if>
              	
              	
              	
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="generateSalesReportCriteriaWise('${criteria}','',document.getElementById('pagination').value,'','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		</div>
              	
              	
              	
              </div>    
                                  </div>
                                    <div id="menu1" class="tab-pane fade in ">
                              <h3 style="text-transform: capitalize;">Department Wise Graphical Report</h3>
                        <div class="row">
                        <div class="col-lg-12">
                               <canvas id="pricevar" height="450 !important;" width="1020  !important;"></canvas>
                             </div>
                             </div>
                              </div>
                
                
                <c:if test="${totalValue > 0}">
                 <input type="hidden" id="graphRecords" value="${(totalValue+1)-index}"/>
             </c:if>
           
             </div>
                                
                               </div> 
                                
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
       <!--  <script type="text/javascript">
   	 debugger;
	 var graphRecords;
	
       	if($("#graphRecords").length > 0)
		{
		graphRecords = $("#graphRecords").val();
		var count=0;

	 		var tempLabels = [], tempValues = [],locationCheck = [],/* finalLabels = [] ,*/ dateValueComparison=[], locationArray = [], label = [],labels = [];
			// below function is used get all the labels existing in the data table
	 		$('#productstocks tbody tr td:nth-child(2)').each( function(){
					count++;
				var lvalue = $(this).text();
							
				 if(count<=graphRecords)
				 	{ 
					 tempLabels.push(lvalue); 
					 }
			});
			
				count=0; 
			// below function is used to eliminate duplicate locations existing in the data table
				$('#productstocks tbody tr td:nth-child(3)').each( function(){
	    			count++;
	    			var addNew = true;
	    			var temp = $(this).text();
	    			if(count<=graphRecords)
	    				for( var i = 0 ; i <= locationCheck.length ;i++ )
	    				if(temp === locationCheck[i])
	    					addNew = false;
	    			
	    			if(addNew)
	    				locationCheck.push($(this).text());  
	    			});
				
				count=0;
				// below function is used to all the locations existing in the data table
				$('#productstocks tbody tr td:nth-child(3)').each( function(){
	    			count++;
	    			if(count<=graphRecords)
	    	   		locationArray.push($(this).text());       
	    			});
			count=0;

			// below function is used to all the y-axis values existing in the data table

			$('#productstocks tbody tr td:nth-child(6)').each( function(){
		count++;
		if(count<=graphRecords)
   		tempValues.push($(this).text());       
		});
			
			// below loop is used to eliminate duplicate labels existing in the data table
			for(var i=0;i<graphRecords;i++)
				{
					var addNew = true;
					var temp = tempLabels[i];
					for(var j=0; j<labels.length;j++)
						{
							if(temp === labels[j])
								{
									addNew = false;	
								}
						}
					if(addNew)
						labels.push(tempLabels[i]);   
				}
			var j=1;
			// below loop is used to generate the missing dates as labels for x-axis
		/* 	for(i=0;i<labels.length;i++)
		{
				var newLabel=true;
				if(i>0)
					while(finalLabels[j-1] !== labels[i])
				{
					finalLabels.push(decr_Date(finalLabels[j-1],'/'));
					j++;
					newLabel=false;
				}
				if(newLabel)
					finalLabels.push(labels[i]);
		} */
			
			var dynamicArrays = [];
			// below loop is used to generate the dynamic arrays based on each unique locations
			for (i=0;i<locationCheck.length;i++)
				{
					dynamicArrays[locationCheck[i]] = [];
			  	}
			 debugger;
			var j=1;	
			// below loop is used to store the values of y-Axis into dynamic arrays based on each unique locations

		for(var i=0; i<graphRecords;i++)
		{
			count=0;
			var addNew = true;
			var temp = locationArray[i] +" "+ tempLabels[i];
			for(var l=0;l<label.length;l++)
			{
					var temp2 = label[l];
					if(temp === temp2)
						{
							addNew = false;
						}
				}
			if(!addNew)
				{
				for(var l=0;l<locationCheck.length;l++)
				{
						if(locationArray[i] === [locationCheck[l]][0])
						{
							var sum = (parseFloat(dynamicArrays[locationCheck[l]])+ parseFloat(tempValues[i])).toFixed(2);;
							dynamicArrays[locationCheck[l]].pop();
							dynamicArrays[locationCheck[l]].push(sum);
						}
				}
				}
			if(addNew)
									for(var l=0;l<locationCheck.length;l++)
										{
												if(locationArray[i] === [locationCheck[l]][0])
												{
													
													dateValueComparison.push(locationArray[i] + " " + tempLabels[i]);
		
												var t;
													for(var v=0;v<dateValueComparison.length;v++)
													{
														var s= dateValueComparison[v].split(" ");
														t=locationArray[i] + " " + s[s.length-1];
														var lcount=0;
														for(var w=0;w<dateValueComparison.length;w++)
														{
														if(t===dateValueComparison[w])
															{
																lcount = 1;
															}
														}
														if(lcount===0){
														dynamicArrays[locationCheck[l]].push("0");
														dateValueComparison.push(t);
														}
													}
												dynamicArrays[locationCheck[l]].push(tempValues[i]);
												label.push(locationArray[i] +" "+ tempLabels[i]);

												}
										}
							}
			// Based on Locations, below loop is used to store the values of y-Axis as zero if the values does not exist for the labels of x-axis 

		for (var k=0;k<locationArray.length;k++)
			{
			for(var v=0;v<dateValueComparison.length;v++)
			{
				var s= dateValueComparison[v].split(" ");
				var t=locationArray[k] + " " + s[s.length-1];
				var lcount=0;
				for(var w=0;w<dateValueComparison.length;w++)
					{
						if(t===dateValueComparison[w])
							{
								lcount = 1;
							}
					}
				if(lcount===0){
					for(var l=0;l<locationCheck.length;l++)
					{
							if(locationArray[k] === [locationCheck[l]][0])
							{
								dynamicArrays[locationCheck[l]].push("0");
								dateValueComparison.push(t);
							}
					}
				}
			}
			}
			
			new Chart(document.getElementById("pricevar").getContext("2d")).Line(getlinegraph([locationCheck[0]][0],[locationCheck[1]][0],[locationCheck[2]][0],[locationCheck[3]][0], 
			[locationCheck[4]][0],[locationCheck[5]][0],[locationCheck[6]][0],[locationCheck[7]][0],[locationCheck[8]][0],[locationCheck[9]][0],labels, dynamicArrays[locationCheck[0]],
			dynamicArrays[locationCheck[1]],dynamicArrays[locationCheck[2]],dynamicArrays[locationCheck[3]],dynamicArrays[locationCheck[4]],dynamicArrays[locationCheck[5]]
			,dynamicArrays[locationCheck[6]],dynamicArrays[locationCheck[7]],dynamicArrays[locationCheck[8]],dynamicArrays[locationCheck[9]]),newOpts('','Total Sale'));

	}
       
        
        
            $(function() {
                $("#productstocks").dataTable(
             		{
             			  "bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script> -->
       
       <input type="hidden" id="billStatus" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>