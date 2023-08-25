<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : inventorymanager/retailoutlets/procurement/viewWarehouseShipment.jsp
 * file type		        : JSP
 * description				: The viewRequestForQuotation form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<style type="text/css">
  .odd{display:none!important;}
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:0%;
}
.form-group {
    margin-bottom: 4px;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 3.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
</style>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: left;">
                                <h3><spring:message code="invoice.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                 <div class="row">
                 <div class="form-group col-lg-5" style="margin-bottom:6px;">
                 <%-- <div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="product.secondary.supplier.label" /> <span style="color:red; font-size:2"></span></label>
					</div> --%>
                          <%-- <div class="form-group col-lg-8">
									<label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
									<input type="text" class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" placeholder="<spring:message code="enter.supplierName.label" />" />
									<div class=services>
								    		<div class="items">
								     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
								   			</div>
										</div>
									<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" name="supplier_Id" id="supplier_Id" value=""  />
								</div>    --%>       
                <!-- <div class="form-group col-lg-8">
					<input type="text" class="form-control" name="soldTo" id="soldTo" value="" placeholder=""/>
					<span id="soldToError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>   -->     
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="from.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-bottom:4%;margin-left: -5%;">
	                       <input type="text" class="form-control" name="fromLoc" id="fromLoc" value="" placeholder=""/>
					<span id="fromLocError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>                     
				</div>       
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="address.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-8" style="margin-left: -5%;">
					<input type="text" class="form-control" name="address" id="address" value="" placeholder=""/>
					<span id="addressError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>    <div class="form-group col-lg-4" style="text-align:right;">                   
					<%-- <label><spring:message code="address.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
                                    
                <div class="form-group col-lg-8"style="margin-left: -5%;">
					<input type="text" class="form-control" name="location" id="location" value="" placeholder=""/>
					<span id="locationError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<%-- <label><spring:message code="address.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
                                    
                <div class="form-group col-lg-8" style="margin-left: -5%;">
					<input type="text" class="form-control" name="street" id="street" value="" placeholder=""/>
					<span id="streetError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>      
				                       
                </div>     
                <div class="form-group col-lg-1"></div> 
                <div class="form-group col-lg-5">
                 <div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="order.ref.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-left: -5%;">
                 <input type="text" class="form-control" name="orderRef" id="orderRef" value="" placeholder=""/>
					<span id="orderRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="order.date.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7" style="margin-bottom:4%;margin-left: -5%;">
					<input type="text" class="form-control" name="orderDate" id="orderDate" value="" placeholder=""/>
					<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="bill.to.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-8" style="margin-left: -5%;">
					<input type="text" class="form-control" name="billTo" id="billTo" value="" placeholder=""/>
					<span id="billToError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>   
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<%-- <label><spring:message code="contact.number.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
                                    
                <div class="form-group col-lg-8" style="margin-left: -5%;">
					<input type="text" class="form-control" name="billTo1" id="billTo1" value="" placeholder=""/>
					<span id="billTo1Error" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>      
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<%-- <label><spring:message code="contact.number.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
                                    
                <div class="form-group col-lg-8" style="margin-left: -5%;">
					<input type="text" class="form-control" name="billTo2" id="billTo2" value="" placeholder=""/>
					<span id="billTo2Error" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                   
                </div>                     
                </div>   
                  <br>                    
          <%-- <div class="row">
          <div class="form-group col-lg-6">
      <!--  <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2"></span></label>-->
      <input type="hidden" id="desc"/>
      <label><spring:message code="search.items.here.label" /><span style="color:red; font-size:2">*</span></label>
      <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
		<div class="services">
 			<div class="items">
  				<ul class="matchedStringUl " style=""></ul>
			</div>
		</div>
          <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
   </div>
          <div class="form-group col-lg-3" style="    width: 26%;">
					<input type="text" class="form-control" name="contactNumber" id="contactNumber" value="" placeholder=""/>
					<span id="contactNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>
				<div class="form-group col-lg-2">
				<div class="buttons" style="    margin-left: -14%;">
					<a onclick="appendLocationsDiv()" class="button"><font size="2px"><spring:message code="sales.orders.label" /> +</font></a>
				</div>
             </div>
             </div> --%>
             <div class="row">
                                     <div class="form-group col-lg-10" style="margin-top: -0.2%;">
                                      <div class="table-responsive" style="width:115.5%">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.code.label"/></th>
                                                <th><spring:message code="description1.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="qty.label"/></th>
                                                <th><spring:message code="packets.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="denomination_amount.label"/></th>
                                                <th><%-- <spring:message code="comments.label"/> --%></th>
                                           </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                              <!-- <tbody style="text-align: center;"> -->
                       <c:forEach var="itemList" items="${quoteObj.itemsList}" varStatus="theCount">
             		   <tr>
             		   	<td>-</td>
              			<td>-</td>
                  		<td>-</td>
                  		<td>-</td>
                  		<td>-</td>
                  		<td>-</td>
                  		<td></td>
                  		<td></td>
                  	   </tr>
              		   </c:forEach> 
                  	  
		 </tbody>
                                        <!--   </tbody> -->
                                       </table>

                                    </div>
                                    <div class="table-responsive" style="width:115.5%">
                                        <table id="productsList" class="table table-bordered">
                                        <thead></thead>
                                        <tbody style="text-align: left;">
                                         <tr style=""><td style="height:100px;"><spring:message code="total.amount.in.words.label"/></td>
                  	   <td  style="border:1px solid #EBEBEB;"><spring:message code="sub.total.label"/><br>
                  	   <spring:message code="tax.label"/><br>
                  	   <spring:message code="shipment_charges.label"/><br>
                   	  <spring:message code="total.invoice.label"/></td>
                  	   </tr>
                  	   <%-- <tr>
                  	   <td colspan="9" rowspan="1" style="height:100px;"><spring:message code="terms.and.conditions.label"/></td>
                  	   <td></td>
                  	   </tr> --%>
                                        </tbody>
                                        </table>
                                    </div>
                                    <div class="table-responsive" style="width:115.5%">
                                        <table id="productsList" class="table table-bordered" style="margin-top: -2.07%;">
                                        <thead></thead>
                                        <tbody style="text-align: left;">
                  	   <tr>
                  	   <td style="height:100px;"><spring:message code="terms.and.conditions.label"/></td>
                  	   </tr>
                                        </tbody>
                                        </table>
                                    </div>
                                    </div>
             <br>
             
              <div class="form-group col-lg-4" style="text-align:left;margin-left:3%;">                   
					<label><spring:message code="date.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
					<div class="form-group col-lg-4" style="text-align:right;margin-left:12%;">                   
					<label><spring:message code="signature.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
					 
					    <div class="form-group col-lg-9" style="text-align:center;margin-left:12%;margin-top: 4%;margin-bottom:4%;">                   
					<label><spring:message code="thankyou.msg.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
             <%-- <div class="row">
             <div class="form-group col-lg-5"></div>
             	<div class="form-group col-lg-6">
                 <div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="sub.total.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6">
					<input type="text" class="form-control" name="subTotal" id="subTotal" value="" placeholder=""/>
					<span id="subTotalError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="total.tax.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6">
					<input type="text" class="form-control" name="totalTax" id="totalTax" value="" placeholder=""/>
					<span id="totalTaxError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4" style="text-align:right;">                   
					<label><spring:message code="shipment_charges.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6">
					<input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" value="" placeholder=""/>
					<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>
           </div>  --%>                         
				<%-- <div class="row">
	    	      		<div class="row" style="    width: 87%; margin-left: 0%;">
	                    <div class="form-group col-lg-12" style="height:15px;    margin-top: -4.5%;" >
	                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="shipment.details.label" /></span></div>
	                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
	                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px;" onclick="" id="priceListImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
	                     </div> 
	                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(192,192,192);" />
	                    <!-- <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" /> -->
	                    </div>
	                     
             </div>
             <div class="form-group col-lg-6"></div>
	                    <div class="form-group col-lg-6" style="    margin-left: -4.2%;">
	                    <label><spring:message code="total.order.value.label" /> <span style="color:red; text-align:right;font-size:2"></span></label>
	                </div>
	                <br>
	                <div class="row" style="    width: 87%; margin-left: 0%;">
	                    <div class="form-group col-lg-12" style="height:15px;    margin-top: -3.2%;" >
	                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="shipment.details.label" /></span></div>
	                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
	                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="" id="priceListImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
	                     </div> 
	                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(192,192,192);" />
	                    <!-- <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" /> -->
	                    </div>
	                     
             </div>
	                </div> --%>	<br>				                                    

						</div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
							<input type="button" class="btn bg-olive btn-inline"
								onclick="viewInvoicing('winvoice','0')"
								value="<spring:message code="cancel.label" />" />
						</div>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    </div>
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 