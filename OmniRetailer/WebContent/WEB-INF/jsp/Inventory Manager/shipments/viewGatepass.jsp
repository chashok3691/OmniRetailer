<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vamsi V
 * file name		        : inventorymanager/shipments/viewGatepass.jsp
 * file type		        : JSP
 * description				: The viewGatePass form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentReturn.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if($('#returnDateStr').val() == ""){
		var dateTime = getCurrentDate();
		  var date = dateTime.split(' ');
		  date = date[0].split('/');
		  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
		  $('#returnDateStr').val(formatedDate);
	}else{
		var returnDateStr = $('#returnDateStr').val();
		returnDateStr = returnDateStr.split(' ');
		$('#returnDateStr').val(returnDateStr[0]);
	}
	/* callCalender("returnDateStr"); */
	focusDiv('Error');
	var returnReason = $("#returnReason").val();
	if(returnReason != ""){
		var id = $("input[name=returnReason][value='"+returnReason+"']").attr("id");
		$("#overStock").removeAttr("checked");
		$("#"+id).prop("checked",true);
		if($("#"+id+"Txt").length > 0){
			var returnComments = $("#returnComments").val();
			$("#"+id+"Txt").removeAttr("readonly");
			$("#"+id+"Txt").val(returnComments);
		}
	}
	var actionRequired = $("#actionRequired").val();
	if(actionRequired != ""){
		var id = $("input[name=actionRequired][value='"+actionRequired+"']").attr("id");
		if(id != undefined){
			$("#repairAndReturn").removeAttr("checked");
			$("#"+id).prop("checked",true);
		}else{
			$("#other").prop("checked",true);
			$("#otherTxt").removeAttr("readonly");
			$("#otherTxt").val(actionRequired)
		}
	}
});
</script>
	<style type="text/css">
	@media (min-width:1200px) and (max-width:1600px)
{
	.lbl{
		text-align:right;
		padding-right: 0px;
	}
}
@media only screen and (max-width:1200px)
{
.lbl{
		text-align:left;
	}
}
 /*  .odd{display:none!important;} */
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
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.text-class{
   padding:10px;
   border:none;
   border-bottom:1px solid black;
   height:7px;
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
                                <div class="box-header" style="text-align: center;">
                                 <c:if test="${type == 'new'}">
						             <h3><spring:message code="new.shipment.return" /></h3>
						         </c:if>
						         <h3> <spring:message code="gatepass.label" /></h3><br>
						       <p><b><spring:message code="gatepass.description.label" /></b></p> <br> 
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 0px;margin-top: -25px">${err}</div>
	        						 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                 <div class="row">
	                 <div class="form-group col-lg-5" style="margin-bottom:6px;">
	                 <div class="row">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="feedback.location.label"/> <span style="color:red; font-size:2"></span></label>
							</div>
		                                    
		                <div class="form-group col-lg-7 col-xs-8" style="">
							<select class="form-control form-group" id="from" disabled="disabled">
	             	
	                <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == warehouseGatepassobj.locationId ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
							
						</div>        
	                 </div>
	                 <div class="row">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="po.gatepass.carriercompany.label"/> <span style="color:red; font-size:2"></span></label>
							</div>
		                    <input type="hidden" id="outletLocation">
		                    <input type="hidden" id="desc">
		                    <input type="hidden" id="purchaseStockReturnRef" value="${shipmentReturn.purchaseStockReturnRef}">
		                <div class="form-group col-lg-7 col-xs-8" style="">
		                   <input type="text" class="form-control" name="carreircompany" id="carreircompany" value="${warehouseGatepassobj.destination}" readonly/>
							<span id="carreirCompanyError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>        
	                 </div>
	                 <div class="row">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="po.gatepass.personname.label"/> <span style="color:red; font-size:2"></span></label>
							</div>
		                                    
		                <div class="form-group col-lg-7 col-xs-8" style="">
							<input type="text" class="form-control" name="personName" id="personName" value="${warehouseGatepassobj.checkedBy}" placeholder="" readonly/>
							<span id="returnByPersonName" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>        
	                 </div>
	                 <div class="row">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="date.label"/> <span style="color:red; font-size:2"></span></label>
						</div>
		                                    
		                <div class="form-group col-lg-7 col-xs-8" style="">
							 <input class="form-control calendar_icon"  style="background-color: white;width:50%;" name="returnDateStr" id="returnDateStr" size="20" type="text" value="${warehouseGatepassobj.startDateStr}" placeholder="DD/MM/YYYY"/ readonly="readonly">
						<span id="returnDateStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>						</div>   
	                 </div>
	                 <div class="row">
						<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
							<label><spring:message code="time.label"/></label>
						</div>
		                <div class="form-group col-lg-7 col-xs-8" style="">
							<div class="bootstrap-timepicker1" style="width:50%;">
	                                            <div class="input-group">                                            
	                                                <input type="text" class="form-control timepicker" name="contactTime" id="contactTime" value="${businessEnquiry.contactTimeStr}" readonly="readonly" />
	                                                <div class="input-group-addon">
	                                                    <i class="fa fa-clock-o"></i>
	                                                </div>
	                                            </div><!-- /.input group -->
	                                        </div>
						<span id="returnTimeStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>   
	                 </div>
                </div>     
                <div class="form-group col-lg-1"></div> 
                <div class="form-group col-lg-5">
                <div class="row">
	                <div class="form-group col-lg-4 col-xs-4 lbl"  style="">
                         <label><spring:message code="vehicle.number.label"/><span style="color:red; font-size:2"></span></label>
                   </div>
                    <div class="form-group col-lg-7 col-xs-8" style="">
                    	<input type="text" class="form-control" name="vehicleNumber" id="vehicleNumber" value="${warehouseGatepassobj.salesOrderRef}" placeholder="" readonly/>
							<span id="vehicleNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                   </div>
                </div>
                <div class="row">
	                <div class="form-group col-lg-4 col-xs-4 lbl"  style="">
                         <label><spring:message code="loadedby.label"/> <span style="color:red; font-size:2"></span></label>
                   </div>
                    <div class="form-group col-lg-7 col-xs-8" style="">
					<input type="text" class="form-control" name="loadedBy" id="loadedBy" value="${warehouseGatepassobj.issuedBy}" placeholder="" readonly/>
							<span id="loadedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						 <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${shipmentReturn.supplierId}"/>
                   </div>
                </div>
                <div class="row">
					<div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
						<label><spring:message code="gateno.label"/><span style="color:red; font-size:2"></span></label>
					</div>
	                                    
	                <div class="form-group col-lg-7 col-xs-8" style="">
						<input type="text" class="form-control" name="gateNo" id="gateNo" value="${warehouseGatepassobj.shipmentOrderRef}" placeholder="" style="width:40%;" readonly/>
							<span id="gateNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>        
                </div>
				  <div class="row">
					 <div class="form-group col-lg-4 col-xs-4 lbl" style="">                   
						
					</div>
	                <div class="form-group col-lg-7 col-xs-8" style="">
						
					</div>  
				</div>  
                </div>                     
                </div>   
              <br>
              
			<div class="row">
			
			<div class="form-group col-lg-8" style="text-align:center;margin-bottom: 0.5%;margin-top: 1.5%;">
                                          <%-- <input type="hidden" id="desc"/>
                                         	<label><spring:message code="search.items.here.label" /></label>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl shipmentgatepass" style=""></ul>
								   				</div>
											</div> --%>
			
                                        </div> 
			 <div class="form-group col-lg-2 col-xs-10 lbl " style="text-align:right;  margin-bottom: 0.3%;">
				<br><label><spring:message code="signature.label"/>.....</label>
				</div>
				<div class="form-group col-lg-11 col-xs-12" style="float:right;width:15%;">
				<label><spring:message code="actionrecquired.label"/></label><select class="form-control form-group" id="actionRequired" >
	             	<option value=""></option>
						<option value="" id="" ></option>
	            </select>
				<%-- <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
					<!-- <datalist id="skuList"></datalist> -->
					<div class="services">
			    		<div class="items">
			     			<ul class="matchedStringUl apparel" style=""></ul>
			   			</div>
					</div> --%>
			</div>
			
		</div>
		<div class="row">  
		<%-- <div class="form-group col-lg-11" style="text-align:center;margin-bottom: 0.5%;margin-top: 1.5%;">
                                         <input type="hidden" id="desc"/>
                                         	<label><spring:message code="search.items.here.label" /></label>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl shipmentgatepass" style=""></ul>
								   				</div>
											</div>
			
                                        </div>  --%>
                                        </div>                
             <div class="row">
         <div class="form-group col-lg-12" style="margin-top: -0.2%;">
          <div class="table-responsive" style="">
            <table id="productsList" class="table table-bordered table-hover">
              <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                	<th><spring:message code="itemcode.label" /></th>
                    <th><spring:message code="itemdesc.label" /></th>
                    <th><spring:message code="uom.label" /></th>
                    <th><spring:message code="qty.label" /></th>
                    <th><spring:message code="shiporder.label" /></th>
                    <th><spring:message code="customer.mobile.label" /></th>
                    <th><spring:message code="business.enquiry.address.label" /></th>
                   
                     
               </tr>
              </thead>
                  <tbody style="text-align: center;">
                       <c:forEach var="itemList" items="${warehouseGatepassobj.gatePassItems}" varStatus="theCount">
	                       <tr id='dynamicdiv${theCount.count}' style='margin-top:5px;'>
    	                    	<td class='slno'>${theCount.count}</td>
    	                    	<td id='itemCode${theCount.count}'>${itemList.itemCode}</td>
	  	 						<td id='itemDesc${theCount.count}'>${itemList.itemDesc}</td>
	  	 						<td id='uom${theCount.count}'>${itemList.uom}</td>
	  	 						<td class='Qty' id='Qty${theCount.count}'  >${itemList.quantity}</td>
	  	 						<td id='shiporder${theCount.count}'  >${itemList.shipmentOrderRef}</td>
	  	 						<td id='custmobile${theCount.count}'>${itemList.salesOrderRef}</td>
	  	 						
	  	 						<td id='address${theCount.count}' >${itemList.shipmentOrderRef}</td>
	  	 						
	  	 				  </tr>
              		   </c:forEach> 
		 </tbody>
      </table>
   </div>
   </div>
   </div>
             <br>
             <div class="row">
             <div class="form-group col-lg-7"></div>
             	<div class="form-group col-lg-5">
             	<div class="row">
	                 <div class="form-group col-lg-8 col-xs-6 lbl" style="">                   
						<label><spring:message code="totalpacks.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-4 col-xs-6" style="">
	                <c:set var="qtyissued" value="0" scope="page" />
	                 <c:set var="packs" value="0" scope="page" />
	              <c:forEach var="summaryList" items="${warehouseGatepassobj.gatePassItems}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+(summaryList.quantity)}" scope="page" />
				<c:set var="packs" value="${packs+1}" scope="page" />
					</c:forEach>
						<input type="text" class="form-control" style="width:70%;" name="totalPacks" id="totalPacks" readonly="readonly" value="${packs}" placeholder=""/>
						<span id="subTotalError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>         
             	</div>
             	<div class="row">
					<div class="form-group col-lg-8 col-xs-6 lbl" style="text-align:right;">                   
						<label><spring:message code="tquantity.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
	                                    
	                <div class="form-group col-lg-4 col-xs-6" style="">
						<input type="text" class="form-control" style="width:70%;" name="totalQuantity" readonly="readonly" id="totalQuantity" value="${qtyissued}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
						<span id="totalQuantity" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>        
             	</div>
             	<div class="row">
					<%-- <div class="form-group col-lg-6 col-xs-6 lbl" style="">                   
						<label><spring:message code="shipment_charges.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
	                                    
	                <div class="form-group col-lg-6 col-xs-6" style="">
						<input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" value="${shipmentReturn.shipmentCharges}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
						<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>  --%>                      
             	</div>
                </div>
           </div>                          
			<br><br><br>
			<div class="table-responsive" style="width:25%;float: left;">
               <table id="returnAndAction" class="table table-bordered" style="margin-top: -2.07%;border:1px solid #857979;">
                 <thead style="background-color: #D3D3D3; color: #454242;">
                  <tr>
                    <th style="width:15%;">Shipment Type </th><th> Yes | No</th>
                    
                 </tr>
                </thead>
                <tbody style="text-align: left;">
                  <tr>
                  <td style="height:100px;width: 75%;">
                  	   <div>Returnable &nbsp;&nbsp;&nbsp;</div>
                  	   <div>Non-Returnable &nbsp;&nbsp;&nbsp;</div>
                       <div>Personal Belonging &nbsp;&nbsp;&nbsp;</div>
                       <div>Waste &nbsp;&nbsp;&nbsp;</div>
                   </td>
                   <td>
                   <div><input type="radio" name="returnable" id="returnable"  value="returnableYes" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="returnable" id="returnable"  value="returnableNo" ></div>
                   <div><input type="radio" name="nonReturnable" id="nonReturnable"  value="nonReturnableYes" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nonReturnable" id="nonReturnable"  value="nonReturnableNo" ></div>
                   <div><input type="radio" name="personalBelonging" id="personalBelonging"  value="personalBelongingyes" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="personalBelonging" id="personalBelonging"  value="personalBelongingno" ></div>   
                   <div><input type="radio" name="waste" id="waste"  value="wasteYes" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="waste" id="waste"  value="wasteNo" > </div>  
                      </td>
                      </tr>
               </tbody>
              </table>
            <div>
          </div>
          </div>
          <input type="hidden" id="returnReason" value="${shipmentReturn.returnReason}">	
          <input type="hidden" id="returnComments" value="${shipmentReturn.returnComments}">	
          <input type="hidden" id="actionRequired" value="${shipmentReturn.actionRequired}">			                                    
		<br>
		</div><!-- /.box-body -->
				<div class="row" style="text-align: right;">
					<div class="form-group col-lg-11 col-xs-6" style="">
					<input type="hidden" id="flowUnder" value="${flowUnder}">
					<c:if test="${type == 'new'}">
				       <input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="return createShipmentGatePass('','','');" value="<spring:message code="submit.label" />" />
				    </c:if>
				    <c:if test="${type != 'new'}">
				       <%-- <input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="return createShipmentGatePass('','','');" value="<spring:message code="submit.label" />" /> --%>
				    </c:if>
				    <c:if test="${sessionScope.role == 'super admin'}">
				    	<input type="button" class="btn bg-olive btn-inline" onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" />
				    </c:if>
				    <c:if test="${sessionScope.role != 'super admin'}">
	        			<c:if test="${flowUnder == 'procurement'}">
		        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                           <c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btn bg-olive btn-inline" onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if>
	        			<%-- <c:if test="${flowUnder == 'warehouse'}">
		        			<c:forEach var="accessControl" items="${sessionScope.warehouseProcurement}">
	                           <c:if test="${accessControl.appDocument == 'WarehouseShipmentReturn' && accessControl.read == true}">
									<input type="button" class="btn bg-olive btn-inline" onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" />
							  </c:if>
							</c:forEach>
	        			</c:if> --%>
	        		</c:if>
	        		<%-- <input type="button" class="btn bg-olive btn-inline" onclick="viewShipmentReturn('','0')" value="<spring:message code="cancel.label" />" /> --%>
				<input type="button" class="btnCls" style="margin-left:15px; margin-right: 15px;" onclick="viewShipmentGatePass('shipmentgatepass','0');" value="Back">
				
				</div>
				</div>
			<div class="box-footer"></div>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
	  showInputs: false,
      showMeridian:false,
      showSeconds:true,
  });
  </script>
</body>
</html>
		    		 