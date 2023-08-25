<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/billing.jsp
 * file type		        : JSP
 * description				: display total billings
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jspdf.min.js"></script>
         <script src="${pageContext.request.contextPath}/js/outletReports/reports.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
.col-lg1-2{
    width: 25% !important;
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
				                    <div class="row">
				                       <div class="col-lg-1">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="generateSalesReportCriteriaWise('tax','','0','','${flowLocation}');">
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
				                      <div class="col-lg-4" style="text-align: right;">
				                      	<!-- <div class="buttons" style="float: right;margin-top: -30px;"> -->
				                      	<%-- 
				   								<a href="${pageContext.request.contextPath}/pdf/taxReport.pdf?loc=${loc}" target="_blank"><img style="width: 40px;" src="${pageContext.request.contextPath}/images/pdf_downlaod.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   								<a href="${pageContext.request.contextPath}/excel/taxReport.xls" download="taxReport.xlsx" target="_blank"><img style="width: 40px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
				   								 --%><%-- <a onclick="generateTaxPdf();"><img style="width: 40px;" src="${pageContext.request.contextPath}/images/pdf_downlaod.jpg"></a> --%>
				   						<!-- </div> -->
				                      </div>
				                                         <div class="col-lg-1" style="text-align: center;margin-top: 17px;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div>
				      
				                    </div>
				                    <c:choose>
				                    <c:when test="${not empty salestax}">
				                     <div id="productstocksDiv" style="overflow-x:auto;width:100%">
				                  
				                    <input type="hidden" id="taxReport" name="taxReport" value='${reportStr}' >
                                    <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                                    
                                    <table id="productstocks" class="table table-bordered table-striped" >
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                     
                                            <tr>
                                             <th>SL No</th>
                                             <c:forEach var="salesReport" items="${salestax.taxWiseReport}" >
                                            	<%-- <th id="date" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;">Date</th>
                                            	<th id="gto" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;">G.T.O</th>
                                            	<th id="sales5" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;">5% Sales</th>
                                            	<th id="salesTax5" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;">Sales Tax 5%</th>
                                            	<th id="sales14.5" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;">14.5% Sales</th>
                                                <th id="salesTax14.5" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;">Sales Tax 14.5%</th>
                                                <th id="exempted" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;">Exempted Sales</th>
                                                <th id="taxAmount" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;">Tax Amount</th> --%>
                                                <th>${salesReport.key}</th>
                                                </c:forEach>
                                            	<!-- <th>G.T.O</th>
                                            	<th>5% Sales</th>
                                            	<th>Sales Tax 5%</th>
                                            	<th>14.5% Sales</th>
                                                <th>Sales Tax 14.5%</th>
                                                <th>Exempted Sales</th>
                                                <th>Tax Amount</th> -->
                                           
                                            </tr>
                                            
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>

                                            
	                                          <%--  <c:if test="${theCount.last}"> --%><c:set var="i" value="0"/>
	                                           <c:forEach begin="0" end="${totalValue-1}" varStatus="theCounts">
	                                           		<tr style="border-bottom: 2px solid #ccc;">
	                                           		 <td>${theCounts.index+index}</td> 
	                                           		 <c:forEach var="salesReport" items="${salestax.taxWiseReport}" varStatus="theCount">
	                                           		
	                                           		<c:forEach var="salesvalue" items="${salesReport.value[theCounts.index]}" >
	                                           		
	                                           			 <td>${salesvalue}</td> 
	                                           			
	                                           			 <%-- <td>${salesvalue}</td> 
	                                           			 <td>${salesvalue}</td> 
	                                           			 <td>${salesvalue}</td>  --%>
		                                               <%--  <td>${salesReport.gto}</td>
		                                            	<td>${salesReport.sales5}</td>
		                                                <td>${salesReport.salesTax5}</td>
		                                                <td>${salesReport.sales145}</td>
		                                                <td>${salesReport.salesTax145}</td>
		                                                <td>${salesReport.exempted}</td>
		                                                <td>${salesReport.todayTotal}</td>  --%>
		                                                <c:set var="dataExists" value="true"></c:set>  </c:forEach>
		                                                 
		                                          </c:forEach>
	                                            	</tr>
	                                         
	                                                  
	                                    </c:forEach>
	                                    
	                                    
	                                    
	                                  <!--added by manasa to display totals for individual pagewise  -->
	                                    
	                                    <tr style="border-bottom: 2px solid #ccc;">
	                                        
	                                         <td></td>
	                                         <td></td>
	                                         <td></td>  
	                                         	 <c:set var="taxreports" value="0"  />
	                                        		
	                                        		
	                                        		 <%-- <fmt:formatNumber  var="taxreports" type="number" value = "0"  /> --%> 
	                                        		
	                                        	 <c:set var="i" value="0" scope="page" />  
	                                    <c:forEach var="salesReport" begin="${i+2}" end="${salestaxLabelssize}"  items="${salestax.taxWiseReport}" varStatus="theCount">
 
	                              	 <c:forEach var="salesReportvalues"    items="${salesReport.value}"  varStatus="theCount"> 
	                                           	 <%--  <c:forTokens items="${salesReport.value}" delims="[,]"  var="valuesentry"> --%>  
	                                         
	                                          <fmt:formatNumber  var="taxreports"   type="number" minFractionDigits="2" maxFractionDigits="2" pattern="#####.##" value = "${taxreports+salesReportvalues}"  />      
	                                       
	                                            <%-- <c:set var="taxreports" value = "${taxreports+salesReportvalues}"    scope="page" >
	                                                	</c:set>   --%> 
	                                
	                                  	</c:forEach>
	                               
	                                         <td>  ${taxreports}</td>
	                                          
	                                          	 	<c:set var="taxreports" value="0"  />
	                               </c:forEach>  
	                                   
	                                         	                                        
	                                       	</tr>
	                                    
	                                    
	                                     <!--//...added by manasa to display totals for individual pagewise  -->
	                                    
	                                    
	                                    
	                                            	
	                                          <%--  </c:if> --%>
	                                            <%-- <c:if test="${!theCount.last}">
	                                           		<tr>
		                                                <td>${salesReport.date}</td>
		                                                <td>${salesReport.gto}</td>
		                                            	<td>${salesReport.sales5}</td>
		                                                <td>${salesReport.salesTax5}</td>
		                                                <td>${salesReport.sales145}</td>
		                                                <td>${salesReport.salesTax145}</td>
		                                                <td>${salesReport.exempted}</td>
		                                                <td>${salesReport.todayTotal}</td>
		                                            </tr>
	                                           </c:if> --%>
	                                           
	                                           
	                                           
	                                           
	                                           <%-- 
	                                           		 <c:forEach var="salesReport" begin="3" items="${salestax.taxWiseReport}" varStatus="theCount">
	             <c:forTokens var="salesReportvalues" delims="" items="${salesReport.value}" >
	                                           	<c:out value="${salesReportvalues}"></c:out>
	                                           		 <c:set var="itemUnitPrice" value = "${salesReportvalues+soldQty}" scope="page" />
	                                           		  
	                                           		  </c:forTokens>
	                                           		  </c:forEach>
	                                            --%>
	                                           
	                                           	
	                                    
	                                   
	                                 
	                                           
	                                           
	                                         
	                                 <%--       <c:forTokens items="${salestax.taxWiseReport}"  delims="," var="salesReport">
 <c:forEach var="salesvalue" items="${salesReport.value[theCounts.row+1]}" >
  <td> <c:out value="${salesvalue}"/></td></c:forEach>
</c:forTokens>    
	                                      
	                                   --%>         
	                                           
	                                           
	                                           
	                                           
                                       <%--     <c:if test="${dataExists == 'true'}">
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
	                                           <c:if test="${theCount.first}">
		                                           <tr>
		                                           		<td></td>
		                                                <td>${salesReport.grossGto}</td>
		                                            	<td>${salesReport.grossSales5}</td>
		                                                <td>${salesReport.grossSalesTax5}</td>
		                                                <td>${salesReport.grossSales145}</td>
		                                                <td>${salesReport.grossSalesTax145}</td>
		                                                <td>${salesReport.grossExempted}</td>
		                                                <td>${salesReport.grossTodayTotal}</td>
		                                           </tr>
                                           		</c:if>
                                           	</c:forEach>
                                          </c:if> --%>
                                        </tbody>
                                    </table>
                                    </div>
				                  </div>
				                    </c:when>
				                    <c:otherwise>
				                    <div class="col-lg-12" style="text-align: center;color:red; font-size:16px;   font-weight: 600;">
				                     No Records Found
				                    </div>
				                   
				                    </c:otherwise>
				                    
				                    </c:choose>
				                 
                                    
                                    <script type="text/javascript">
                                   
                                    
                                    </script>
                                                                            
                                      <%@ include file="savePopUp.jsp"%>
                                    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                                    		  <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="generateSalesReportCriteriaWise('${criteria}','save','0','','${flowLocation}');"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>      
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue+index-1} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue+index-1}','','${flowLocation}')">
	              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue+index-1} of ${totalRecords} 
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
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue+index-1} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue+index-1}','','${flowLocation}')">
	              	</div> 
              	</c:if>
              	
              	
              	
              	
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
              		  <input type="button" onclick="generateSalesReportCriteriaWise('${criteria}','',document.getElementById('pagination').value,'','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
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
        </script>
        <input type="hidden" id="billStatus" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>