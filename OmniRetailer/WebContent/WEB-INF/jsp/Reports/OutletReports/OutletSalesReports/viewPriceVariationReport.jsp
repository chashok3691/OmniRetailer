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
</style>  
<script type="text/javascript">
$(document).ready(function(){
	//$("#billDate").trigger("click");
	
	$('#priceVariationSearch').click(function(){
        var search = $('#pricevariation').val();
        return generateSalesPriceVariationReport('salesReportPriceVariation','0','NOPOP');
    })
    $('#pricevariation').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#priceVariationSearch').click();//Trigger search button click event
        }
    });
});
/* 
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
} */
</script>
</head>
<body>

<section class="">
<div class="row">
  <div class="col-lg-12">
  <div class="">
                                <div class="box-body table-responsive">
				                    <div class="row">
				                     <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                   <!--    <input type="hidden" id="skuSales" value=""> -->
				                       <div class="col-lg-1">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="generateSalesPriceVariationReport('salesReportPriceVariation','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-10" style="margin-top: 17px;    padding-left: 0px;">
				                       <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="pricevariation" placeholder="<spring:message code="search.sku.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="priceVariationSearch" class="searchbutton" style=" margin-right: 17px;"></button>
						
							<input type="hidden" id="pricewise" value="${searchName}"></div>
	        	 		</div>
	        	 		   <div class="col-lg-1" style="text-align: right;margin-top: 17px;    padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" onclick="PrintSalesPriceVariationReport('salesReportPriceVariation','0','','','true');" style="fontsize:16px;" value="<spring:message code="save.label" />" />
		 </div>
				                      
				                      
				                     <%--   <div class="col-lg-1" style="text-align: right;margin-top: 17px;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="fontsize:16px;" value="<spring:message code="save.label" />" />
		 </div> --%>
				            </div>      
				                   <div style="overflow: auto;white-space: nowrap;">
				                    
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<%-- <th id="date" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;"><spring:message code="date.label" /></th>
                                            	<th id="category" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="category.label" /></th>
                                            	<th id="categoryName" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="category.description.label" /></th>
                                                <th id="quantity" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="order_quantity.label" /></th>
                                                <th id="price" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="item_price.label" /></th> --%>
                                                <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="skuid.label" /></th>
                                            	<th><spring:message code="itemdesc.label" /></th>
                                            	<th><spring:message code="colour.label" /></th>
                                            	<th><spring:message code="size.label" /></th>
                                            	<th><spring:message code="grade.label" /></th>
                                            	<th><spring:message code="model.label" /></th>
                                            	<th><spring:message code="category.label" /></th>
                                            	<th><spring:message code="subcategory.label" /></th>
                                            	<th><spring:message code="section.label" /></th>
												<th><spring:message code="brand.label" /></th>
												<th>Graph</th>
                                            	<th><spring:message code="action.label" /></th>
                                             
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                              	<tr>
                                              	<td>${theCount.count+index-1}</td>
                                                <td>${salesReport.skuId}</td>
                                                <td>${salesReport.itemDescription}</td>
                                                <td>${salesReport.color}</td>
                                                <td>${salesReport.size}</td>
                                                <td>${salesReport.productRange}</td>
                                                <td>${salesReport.model}</td>
                                                <td>${salesReport.category}</td>
                                                <td>${salesReport.subCategory}</td>
                                                <td>${salesReport.section}</td>
                                                <td>${salesReport.brand}</td>
                                            	<td>
                                            	<a onclick="viewVariationGraph('${salesReport.itemDescription}','class${theCount.count}','date','sale','date')">Graph</a>
                                            	</td>
                                            	<td>
                                            	 <a  class="clickable" data-toggle="collapse" id="row${theCount.count}" data-target=".row${theCount.count}"> <span style="float:right" onclick="expand(${theCount.count})" id="categoryExpand${theCount.count}"><i class="fa fa1 fa-sort-desc"></i></span></a>
                                            	</td>
                                            	      </tr>
                                              <tr  class="collapse rowone${theCount.count}">
                                                 <td style="padding:3px;"></td>
                                            	        <td style="padding:3px;"></td>
                                             <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="description.label" /></div></td>
                                            	  <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="date.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="price.label" /></div></td>
                                            	  <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="report.pricediff.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="report.pricevar.label" /></div></td>
                                            	  <td style="padding:3px;"></td>
                                            	   <td style="padding:3px;"></td>
                                            	    <td style="padding:3px;"></td>
                                            	     <td style="padding:3px;"></td>
                                            	      <td style="padding:3px;"></td>
                                            	    
                                        </tr>
                                         <c:forEach var="itemDetails" items="${salesReport.itemDetails}" varStatus="serialnum">
                                              <tr  class="collapse rowone${theCount.count}" >
                                              <td></td>
                                              <td></td>
                                              <td>${serialnum.count}</td>
                                                   <td>${itemDetails.itemDescription}</td>
                                                 <td class="class${theCount.count}" id="date${theCount.count}${serialnum.count}">${itemDetails.dateStr}</td>
                                                      <td id="sale${theCount.count}${serialnum.count}">${itemDetails.itemUnitPrice}</td>
                                                 <td>${itemDetails.priceDiff}</td>
                                                  <td>${itemDetails.priceVar}</td>
                                                 <td></td>
                                                <td></td>
                                                 <td></td>
                                                  <td></td>
                                                   <td></td>
                                              
                                                  
                                              </tr>
                                              </c:forEach>
                                          <c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                              </tbody>
                                    </table>
                                    </div>

		 <div id="triggerEvent"></div>
   <div class="modal fade" id="GraphPopup" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup" style="    width: 100%!important;">
        <div class="modal-header" style="    padding: 10px;font-size: 20px;">
       <div id="productNmae"></div>
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="    padding: 10px;font-size: 20px;">
        <canvas id="pricevar" height="400 !important;" width="600  !important;"></canvas>
        </div>
        <br/>
     
      </div>
      
		</div>
		</div>

  <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesPriceVariationReport('salesReportPriceVariation','${totalValue}','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesPriceVariationReport('salesReportPriceVariation','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesPriceVariationReport('salesReportPriceVariation','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesPriceVariationReport('salesReportPriceVariation','${totalValue}','')">
              	</div> 
              	</c:if>
              	
              	
              	 
                   	<div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="generateSalesPriceVariationReport('salesReportPriceVariation',document.getElementById('pagination').value,'')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
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


</body>
</html>