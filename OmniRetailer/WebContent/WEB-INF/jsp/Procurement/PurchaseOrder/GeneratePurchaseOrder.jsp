<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : koti bommineni
 * file name		        : Procurement/purchase order/generatePurchaseorder.jsp
 * file type		        : JSP
 * description				: display Auto generate PO
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
    
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
        
  
       
       
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
.iosclosebutton {
    width: 25%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 3px 0 4px 0;
    height: 30px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.iospopup {
    width: 22%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
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
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 50%;
    float: right;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}

 .wrapper_1:after {
  content: "";
  background-color: #ccc;
  position: absolute;
  width: 1px;
  height: 400%;
  top: 10px;
  left: 0%;
  display: block;
  margin-left:35%;
  margin-top:4px
} 


</style>  
<script type="text/javascript">
$(document).ready(function(){
	debugger;
	
/*var err = $("#err").val();
if(err != "")
  */
  //alert(err);
$("#searchPurchaseOrders").val($("#purchaseOrdersSearch").val());
	$("#searchPurchaseOrders").focus();
	
	var operation = $("#operation").val();
	$('#searchPurchaseOrders').on('input',function(e){
		if($(this).val().trim()==""){
			viewPurchaseOrder(operation,'','0');
		}
	});
	
	
	
	
});
</script>
</head>
<body>
	
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
           <div class="box-header" style="text-align:center;">
				      <h3 class="box-title" style="padding :5px; border:1px solid  #808080;"><spring:message code="allPurchaseOrder.autogen.label" /></h3>
			</div><!-- /.box-header -->
			
			  <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 0px">${err}</div>
			  <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 0px; margin-top: -10px">${success}</div>
			  
			
			                    <div class="box-body table-responsive" >
                                
								<div class="row">
                                	
				                      
						      
                                     
                       				<br>
								<br>
								<br>
								
							<div class="row">
                                <div></div>
								<div class="form-group col-lg-6" style=" margin-right: -30px;    height: 147px; margin-top: 2px; margin-left: 52px;">
									<div></div>
									<div class="row">

										<div class="form-group col-lg-3  " style="margin-top: 13px;">



											<div class="wrapper_1">
                                          <hr style="border-top: 1px solid #ccc;margin-top: 13px;width: 136%;margin-left:31%">
                                           <input type="radio"  name="selectb" style="margin-left: 58%;position: absolute;margin-top: -26px;" value="warehouse" checked>
											</div>


										</div>

										<div class="form-group col-lg-4" style="margin-top: -7px;">

											<div></div>
											<label><spring:message code="warehouse.label" /></label> 
											<select class="form-control" id="warehouseLocation" style="width: 100%;">
                                            <c:forEach var="location" items="${warehouses}">
												 <option value="${location.warehouseLocation}" ${location == warehouse.warehouseLocation ? 'selected' : ''}>${location.warehouseLocation}</option>
											 </c:forEach>

					                        </select>

											<div>
												<input type="checkBox" id="outletindentbased"> <label>Outlet Indent
													Based</label>


											</div>


											<div>
												<input type="checkBox" id="directoutletdelivery"> <label> Direct
													Outlet Delivery</label>
											</div>

										</div>

										<div class="form-group col-lg-1"></div>

										<div class="form-group col-lg-2">
										
										
										<div class="buttons"  style="margin-left: 4px;">
					<a onclick="generateAutoPO('all','0');" class="btn bg-olive btn-inline" style="font-size: 14px; border-radius: 3px; float: left;width: 89px;"><font size="2px";><spring:message code="generate.label" /></font></a>
				</div>

											

										</div>

									</div>


									<div class="row">

										<div class="form-group col-lg-3 " style="margin-top: 49px;">
											<div></div>

											<div class="wrapper_2">
											 <hr  style="border-top: 1px solid #ccc;margin-top: 13px;width: 136%;margin-left:31%">
											 <input type="radio" name="selectb" style="margin-left: 58%;position: absolute;margin-top: -26px;" value="outlet">
											</div>
										</div>
										<div class="form-group col-lg-4" style="margin-top: 30px;">
											<label><spring:message code="outlet.label" /></label> 
											
											<select class="form-control" id="outletLocation" style="width: 100%;">
                         <c:forEach var="location" items="${locationsList}">
												 <option value="${location}" ${location == warehouse.warehouseLocation ? 'selected' : ''}>${location}</option>
											 </c:forEach>
											 </select>

										</div>

										<div class="form-group col-lg-1"></div>

										<div class="form-group col-lg-2">


<div class="buttons"  style="margin-left: 4px; margin-top: 39px;">
					<a onclick="resetForm();" style="font-size: 14px; border-radius: 3px; float: left;width: 89px;"
													class="btn bg-olive btn-inline"><spring:message code="storage_systems_clear.label" /></font></a>
				</div>

										<%-- 	<div class="col-lg-2"
												style="margin-left: 0px; margin-top: 39px;">
												<a data-toggle="modals" data-target="#myModalIoss"> <input
													type="button"
													style="font-size: 14px; border-radius: 3px; float: left;width: 89px;"
													class="btn bg-olive btn-inline"
													onclick="return dispatchPo(this,'false')"
													value="<spring:message code="storage_systems_clear.label" />" /></a>
											</div> --%>

										</div>

									</div>
								</div>

								<div class="form-group col-lg-6" style="margin-right: -67px;">
							
							 <textarea rows="9" cols="80" style="resize: none;width: 93%;" disabled="disabled"></textarea>
							 
							 
							 
							 
							 </div>
							
							
							
							
							
							</div>         
                         
							<br>   
	       <div class="form-group col-lg-12">
	       	<input type="hidden" id="operation" value="${operation}">
	    
       	 	 <div class="form-group col-lg-12" style="padding:0px;margin-bottom: 0px;">
       	 		 <input type="text"  class="form-control searchItems"  value="" id="searchPurchaseOrders" placeholder="<spring:message code="search.purchase.orders.label" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchPurchaseOrders" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="purchaseOrdersSearch" value="${searchName}">
       	 	</div>
       	 	
       	 	
       	 	
       	 	
       	 	
       	 	
       	 	
       	 
                                    <table id="productstocks" class="table table-bordered table-striped" style="margin-top: 42px !important;">
                                     	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
        
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="purchase.order.receipt.ref.label" /></th>
			               						<th><spring:message code="order.date.label" /></th>
			               						
			               						<th><spring:message code="delivery_date.label" /></th>
			                 					<th style="width: 32%"><spring:message code="supplier.name.label" /></th>
			                 					<th><spring:message code="Reqqty.label" /></th>
			                 					<th><spring:message code="poqty.label" /></th>
			                 					
			                 					<th><spring:message code="total.purchase.order.value.label" /></th>
			                 					
			                 					<th><div><spring:message code="shipment_cost.label" /></div></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
		               						                                     
		               						                                     
		               						                                     
		               						                                     
		               					 <tbody style="text-align: center;">
		               						<c:forEach var="po" items="${purchaseOrderBeansList}">
		             		 				<tr>
	
		             		 					<td>${po.slNo}</td>
		                 						<td>${po.PO_Ref}</td>
		                  						<td>
		                  						<c:choose>
		                  						<c:when test="${not empty po.updatedDateStr}">
		                  						${po.updatedDateStr}
		                  						</c:when>
		                  						<c:otherwise>
		                  						${po.ordereDate}
		                  						</c:otherwise>
		                  						</c:choose>
		                  						
		                  						</td>
		                  						
		                  						<td>${po.deliveryDate}</td>
						                 	 	<td>${po.supplier_name}</td>
						                 	 		<td>
 					<c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${po.itemsList}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+summaryList.requestedQty}" scope="page" />
				</c:forEach>
				<fmt:formatNumber var="qtyissuedAutoPO" type="number" minFractionDigits="2" maxFractionDigits="2" value="${qtyissued}" />
				
				${qtyissuedAutoPO}</td>
						                  		<td>
						                  		<c:set var="qty" value="0"  />
	              <c:forEach var="summaryList" items="${po.itemsList}" varStatus="thecount">
				<c:set var="qty" value="${qty+summaryList.quantity}" scope="page" />
				</c:forEach>
				<fmt:formatNumber var="qtyAutoPO" type="number" minFractionDigits="2" maxFractionDigits="2" value="${qty}" />
				
						                  		${qtyAutoPO}</td>
						                 	 	
						                  	<td><fmt:formatNumber value="${po.total_po_value}" type="number"/></td>
						                  		
						                  		<td>
						                  		<c:if test="${po.shipping_cost != '' && po.shipping_cost != undefined && po.shipping_cost != null }">
						                  	     ${po.shipping_cost}
						                  		</c:if>
						                  		<c:if test="${po.shipping_cost == '' || po.shipping_cost == undefined || po.shipping_cost == null }">
						                  			0.0
						                  		</c:if>
						                  		
						                  		</td> 
											</tr>
											
              <%--       			        <tr class="collapse rowone${po.slNo}">
                                             <td></td>
                                             <td></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="itemneme.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="grade.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="size.label" /></div></td>
                                               <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="Reqqty.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="poqty.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="price.label" /></div></td>
                                                 <c:choose>
                                                 	<c:when test="${ not empty po.nextWorkFlowStates}">
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="EmployeeForm.action" /></div></td>
                                               </c:when>
                                               <c:otherwise>
                                               <td></td>
                                               </c:otherwise>
                                               </c:choose>
                                                <td></td></tr>
                                              <c:forEach var="itemDetails" items="${po.itemsList}" varStatus="theCount">
                                              <tr  class="collapse rowone${po.slNo}" >
                                            	<td></td>
                                            	<td></td>
                                            	<td>${theCount.count}</td>
                                            	<td>${itemDetails.itemDesc}</td>
                                            	<input type="hidden" id="skuId${po.PO_Ref}${theCount.count}" value="${itemDetails.skuId}"/>
                                                <td>-</td>
                                                <td>${itemDetails.size}</td>
                                                 <td>${itemDetails.requestedQty}</td>
                                                <td  class="${po.PO_Ref}" id="quantity${po.PO_Ref}${theCount.count}" contenteditable="true">${itemDetails.quantity}</td>
                                                <td   id="itemPrice${po.PO_Ref}${theCount.count}" contenteditable="true">${itemDetails.itemPrice}</td>
                                                 <c:choose>
                                                 	<c:when test="${ not empty po.nextWorkFlowStates}">
                                                <td style="padding: 0px;"><img src="${pageContext.request.contextPath}/images/save.png" style="width:25%;cursor:pointer;" onclick="validatePurchaseOrder('gridupdate','${po.PO_Ref}')"/></td>
        							</c:when>
        							<c:otherwise>
        							<td></td>
        							</c:otherwise>
        							</c:choose>
        							
        							<td></td>
        							</tr>
        							</c:forEach> --%>
                                             
                                        
						             	   </c:forEach> 
                                        </tbody>
		               						
                                        </tbody>
                                    </table>
                                                        
                                <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','${index+maxRecords-1}','menu');">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','${index - maxRecords-1}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<div class="form-group col-lg-2" style="padding-right: 0px;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','${index - maxRecords-1}','menu');"> ${index} - ${index+maxRecords-1} of ${totalRecords}<input type="button" class='paginationButton' value="&#62;" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','${index+maxRecords-1}','menu');">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
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
              		  <input type="button" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder',document.getElementById('pagination').value,'menu');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>       
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>


</section>
        <script type="text/javascript">
           /*  $(function() {
              //  $("#productstocks").dataTable();
            	  $("#productstocks").dataTable({
           			  "bPaginate": false,
                        "bLengthChange": false,
                        "bFilter": false,
                        "bSort": false,
                        "bInfo": false,
                        "bAutoWidth": false,
                        "scrollX": true
          			});
                 }); */
        </script>
        <input type="hidden" id="status" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>