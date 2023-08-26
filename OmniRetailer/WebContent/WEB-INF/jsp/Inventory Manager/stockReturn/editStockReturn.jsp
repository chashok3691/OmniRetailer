<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/stockReturn/editStockReturn.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
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
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/stockReturn.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script>
$(document).ready(function(){
	//$('.dataTables_empty').remove();
	callCalender('shippedOn');
	callCalender('dateOfReturn');
});
</script>
<style type="text/css">
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
</style>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.stockreturn.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <input type="hidden" id="flowUnder" value="${flowUnder}">  
                                    <div class="row">
                                    <div class="form-group col-lg-3">
                                    		<input type="hidden" id="retrunNoteRef" value="${stockReturnObj.returnNoteRef}">
                                            <label><spring:message code="fromlocation.label" /> <span class="requiredField">*</span></label>
                                             <select class="form-control" name="formLocation" id="formLocation">
                                             <c:forEach var="location" items="${locationsListAll}">
												<option value="${location}" ${location == stockReturnObj.fromLocation ? 'selected' : ''} >${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="tolocation.label" /> <span class="requiredField">*</span></label>
                                             <select class="form-control" name="toLocation" id="toLocation">
                                             <c:forEach var="location" items="${locationsListAll}">
												<option value="${location}" ${location == stockReturnObj.toLocation ? 'selected' : ''} >${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="date.label" /> <span class="requiredField">*</span></label>
                                             <!-- <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                             <input class="form-control" readonly="readonly" style="background-color: white;" name="dateOfReturn" id="dateOfReturn" size="20" type="text" onfocus="callCalender('dateOfReturn')" onclick="callCalender('dateOfReturn')" placeholder="DD/MM/YYYY"/>
	                                        </div> --> <!-- /.input group -->
	                                        <input class="form-control calendar_icon" readonly="readonly" value="${stockReturnObj.dateOfReturnStr}" style="background-color: white;" name="dateOfReturn" id="dateOfReturn" size="20" type="text" onfocus="callCalender('dateOfReturn')" onclick="callCalender('dateOfReturn')" placeholder="DD/MM/YYYY"/>
                                           <span id="dateOfReturnError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                        	<div class="bootstrap-timepicker">
                                            <label><spring:message code="time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" value="${stockReturnObj.timeOfReturnStr}" name="timeOfReturn" id="timeOfReturn"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="timeOfReturnError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                    <div class="row">
                                    	<div class="form-group col-lg-3">
                                    		<label><spring:message code="goodsissueref.label" /></label>
                                            <input type="text" class="form-control allField searchItems" name="searchIssue" value="${stockReturnObj.issueRef}"  id="searchIssue" placeholder="<spring:message code="goodsissueref.label" />" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchIssue" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<span id="searchIssueError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<input type="hidden" name="issueRef" id="issueRef" value="${stockReturnObj.issueRef}"  />
                                    	</div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="goodsreceiptref.label" /></label>
                                            <input type="text" class="form-control allField searchItems" name="searchReceipt" value="${stockReturnObj.receiptRef}"  id="searchReceipt" placeholder="<spring:message code="goodsreceiptref.label" />" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl searchReceipt" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>
                                            <span id="searchReceiptError" style="text-align:right;color:red;font-weight:bold;"></span>
                                            <input type="hidden" name="receiptRef" id="receiptRef" value="${stockReturnObj.receiptRef}"  />
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="returned.by.label" /></label>
                                            <input type="text" class="form-control" name="returnBy" value="${stockReturnObj.returnBy}"  id="returnBy" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="returnByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="shippedBy.label" /></label>
                                            <input type="text" class="form-control" id="shippedBy" value="${stockReturnObj.shippedBy}"  name="shippedBy" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="shippedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                     </div>
                                      <div class="row">
                                      	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <select class="form-control" name="shipmentMode" id="shipmentMode">
                                          		<option value="Pickup Van" ${'Pickup Van' == stockReturnObj.shipmentMode ? 'selected' : ''} >Pickup Van</option>
                                            	<option value="Personnel Carrying" ${'Personnel Carrying' == stockReturnObj.shipmentMode ? 'selected' : ''} >Personnel Carrying</option>
                                            	<option value="Courier" ${'Courier' == stockReturnObj.shipmentMode ? 'selected' : ''} >Courier</option>
                                            	<option value="Road Transport" ${'Road Transport' == stockReturnObj.shipmentMode ? 'selected' : ''} >Road Transport</option>
                                            	<option value="Rail Transport" ${'Rail Transport' == stockReturnObj.shipmentMode ? 'selected' : ''} >Rail Transport</option>	
                                            </select>
                                    	</div>
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipped.on.label" /> <span class="requiredField">*</span></label>
                                             <!-- <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                             <input class="form-control" readonly="readonly" style="background-color: white;" name="shippedOn" id="shippedOn" size="20" type="text" onfocus="callCalender('shippedOn')" onclick="callCalender('shippedOn')" placeholder="DD/MM/YYYY"/>
	                                        </div> --> <!-- /.input group -->
	                                        <input class="form-control calendar_icon" readonly="readonly" value="${stockReturnObj.shippedOnStr}" style="background-color: white;" name="shippedOn" id="shippedOn" size="20" type="text" onfocus="callCalender('shippedOn')" onclick="callCalender('shippedOn')" placeholder="DD/MM/YYYY"/>
                                           <span id="shippedOnError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="shipment.carrier.label" /></label>
                                            <input type="text"  class="form-control" value="${stockReturnObj.shipmentCarrier}" name="shipmentCarrier" id="shipmentCarrier">
                                    	</div>
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="status.label" /></label>
                                            <input type="text"  class="form-control" value="${stockReturnObj.status}" name="status" id="status">
                                    	</div>
                                      </div>  
                                   		
                                        <br>
                                        
                                        <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;    margin-bottom: 30px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockReturnObj.previousActivities}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									
      									<%-- <div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;margin-left: 52%;">
      									 <input type="hidden" value="${stockReturnObj.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty stockReturnObj.nextActivities}">
      									<label style="font-family: Calibri;color: gray;"><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockReturnObj.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                             
                                           </select>
      									</c:when>
      									<c:when test="${not empty stockReturnObj.nextActivities}">
      									<label style="font-family: Calibri;color: gray;"><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockRequestsObj.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                             
                                              <c:forEach var="nextWorkFlowStates" items="${stockReturnObj.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									</div>
      									
      									</div> --%>
      									
      									
      									
      						
      									
      									</div>
      									 <br>
      									  <br>
      									 
                                        	<c:if test="${flowUnder == 'outlet'}">
                                        <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         <input type="hidden" id="desc"/>
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                            <%-- <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" placeholder="<spring:message code="good.label"/>" />
 												<datalist id="skuList">
												
												</datalist> --%>
  										 </div>
                                         <div class="col-lg-3">
                                         	 <div id="triggerEvent"></div>
                                         </div>
                                        </div>
                                        </c:if>
                                        <div class="table-responsive">
                                      	<table id="productsList" class="table table-bordered table-hover">
						                  <thead style="background-color: #3c8dbc; color: #ffffff">
						                    <tr>
						                    	<th><spring:message code="s.no.label"/></th>
						                    	<th><spring:message code="item.name.label"/></th>
						                        <th><spring:message code="item.desc.label"/></th>
						                        <th><spring:message code="reason.for.return.label"/></th>
						                        <th><spring:message code="uom.label"/></th>
						                        <th><spring:message code="quantity.label"/></th>
						                        <th><spring:message code="price.label"/></th>
						                        <th><spring:message code="value.label"/></th>
						                        <th><spring:message code="comments.label"/></th>
						                        <th><spring:message code="action.label"/></th>
						                    </tr>
						                  </thead>
						                  <tbody style="text-align: center;">
						                  	 <c:forEach var="item" items="${stockReturnObj.stockList}" varStatus="theCount">
						                        <tr id=dynamicdiv${theCount.count}>
						                        	<td id="sno${theCount.count}">${theCount.count}</td>
													<td id="Name${theCount.count}" >${item.itemId}<input type="hidden" id="skuId${theCount.count}" value="${item.itemId}" /><input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}" /></td>
													<td id="Desc${theCount.count}" >${item.description}</td>
													<td id="Reason${theCount.count}"><textarea rows="1" style="resize:none;" id="ReturnReason${theCount.count}">${item.reasonForReturn}</textarea></td>
													<td id="UOM${theCount.count}" >${item.uOM}</td>
													<td class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Pack${theCount.count}" >${item.quantity}</td>
													<td class='Price' id="Price${theCount.count}" >${item.price}</td>
													<td id="Cost${theCount.count}" >${item.value}</td>
													<td id="Comments${theCount.count}"><textarea rows="1" style="resize:none;" id="CommentsText${theCount.count}">${item.comments}</textarea></td>
													<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.itemId}'/></td>
						   						</tr>
						 					</c:forEach> 
						                  </tbody>
						                 </table>
						                </div>
						                
						                
						                
						                <!--added by manasa  -->
    
    <input type="hidden" id="outletLocation" value="${skuObj.fromLocation}"> 
       <input type="hidden" id="from" value="${skuObj.startDate}">
        <input type="hidden" id="to" value="${skuObj.endDate}">    
         <input type="hidden" id="outletZone" value="${stockRequestObj.zone}">
            <!--//..added by manasa  -->  
						                
                                   <!--  </div> -->
                                    <br/> <br/>
                                     <div class="row">
                                         <!-- <div class="col-lg-3"></div> -->
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" style="resize: none;" id="remarks" rows="2" placeholder="<spring:message code="enter.remarks.label" />" >${stockReturnObj.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                        <br/>
		<!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                              <th>Batch Number</th>
                             <th>Expiry Date</th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->      		
                    </div><!-- /.box-body -->
                        <input type="hidden" id="whreturnflag" value="1">     
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="validateStockReturn('stored','edit');" value="Submit" />
						<%-- <input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;width:65px;" onclick="validateStockReturn('draft','new');" value="<spring:message code="save.label" />" /> --%>
					<c:if test="${sessionScope.role == 'super admin'}">
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewGoodsReturn('','0','${selectedLocation}');" value="<spring:message code="cancel.label" />" />
					</c:if>
					 <c:forEach var="accessControl" items="${sessionScope.inventoryManagement}">
		                <c:if test="${accessControl.appDocument == 'OutletGoodsReceipt' && accessControl.write == true && accessControl.read == true}">	
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="searchOutletStockReturn('','','0');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
						
					
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
  });
 </script>
 
  <!-- InputMask -->
       <%--  <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
      	<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		});
	</script> --%>
        
</body>
</html>
		    		 