<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah
 * file name		        : inventorymanager/Billing/itemdetails.jsp
 * file type		        : JSP
 * description				: display specific bill items
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<!-- <meta charset="UTF-8"> -->
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/outletmanagment/mcndetails.js"></script>
<style>
  .odd{display:none!important;}
  /* .labelgrn
{
margin-right: 10px;
} */

.modal-dialogwidth {
    width: auto;
    margin: 30px auto;
}
.modal-dialogwidth
{
 margin-top: 14.5%;
 }

.col-lg-1
{
padding-left:0px ! important;
}
.input-group {
    position: relative;
    width: 100%;    // --> this line
    display: table; 
    border-collapse: separate;
}
.form-control {
    display:initial !important;
    margin-bottom: 4px;
}
.form-group {
    margin-bottom: 5px;
}
 @media (min-width: 1200px){
 .marginleft{
 margin-left:-1px;
 }
}


.netAmountStyle
{
    text-align: center;
    font-size: 19px;
    height: 43px;
    padding-top: 4px;
    /* font-stretch: extra-expanded; */
    
    font-size: 22px;
    font-weight: bold !important;
}
.netAmount
{
    padding-top: 5px;
    padding-right: 0px;
    font-weight: bold;
    font-size: 20px;
    text-align: right;
     font-weight: bold;
}


</style>

<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
	
	callCalender('expiryDate');
	
	
});

$(document).ready(function() {
	

});
/* function loadImageFileAsURL(id,ele) {
 $("."+id+"Error").text("");
 $("#"+id+"Error").text("");
 var filesSelected = document.getElementById(id).files;
 if (filesSelected.length > 0) {
 var fileToLoad = filesSelected[0];
 var fsize = fileToLoad.size;
 if (fileToLoad.type.match("image.*")) {
 if((fsize <= 70000 && id == "bannerThumbnail") || id == "bannerImage" ){
 var name = fileToLoad['name'];
 $("#"+id+"File").val(name);
 var fileReader = new FileReader();
 fileReader.onload = function(fileLoadedEvent) {
 var byteVal = fileLoadedEvent.target.result;
 var index = byteVal.indexOf(',');
 byteVal = byteVal.substring(index + 1);
 $("#" + id + "byte").val(byteVal);
 $("#" + id + "image").html(
 '<img style="width:65px;height:50px;" src=' + fileLoadedEvent.target.result + '>');

 };
 fileReader.readAsDataURL(fileToLoad);
 var oMyForm = new FormData();
 oMyForm.append("file",  ele.files[0]);
 if($("#"+id+"_refId").val() != "")
 oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
 else
 oMyForm.append("refId", "");
 var contextPath = $("#contextPath").val();
 var URL = contextPath + "/inventorymanager/addToAttachementList.do";
 $.ajax({
 //					dataType : 'json',
 url : URL,
 data : oMyForm,
 type : "POST",
 enctype : 'multipart/form-data',
 processData : false,
 contentType : false,
 beforeSend : function(xhr) {
 },
 success : function(result) {
 $("#"+id+"_refId").val(result);
 },
 error : function() {
 alert("something went wrong");
 }
 });
 }else{
 $("#"+id+"Error").text("Select Image < 70kb");
 return;
 } 
 }
 }
 } */
/* function getFont(ele) {
	var font = $(ele).attr("data-value").replace(/\+/g, ' ');
	$(".font-select").removeClass("font-select-active");
	$(".fs-drop").css("display", "none");
	$(ele).parents(".font-select").children("a").children("span")
			.text(font);
	var selectId = $(ele).parents(".font-select").siblings("select").attr(
			"id");
	$("#" + selectId + "Hidden").val(font);
	// $(ele).parents(".font-select").siblings("select").val(font);
	$(".font-select").trigger("click");
} */
</script> 

</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                               <div class="box-header">
						<div class="box-header" style="text-align: center">
                              <c:forEach items="${warehouseReportObj.reportsList}" var="warehouseReportObjBill">    
                                <h3>${warehouseReportObjBill.creditNoteRef} - Details</h3>
                                </c:forEach>
                                </div>
<%--                                  <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div> --%>
<%-- 	        		            <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div> --%>
                                
					</div><!-- /.box-header -->
					
                                <!-- form start -->
                                <form class="">
                               
                                    <div class="box-body">
                                            <div class="row" style="text-align: right; margin-top: -65px;">
                                            
	                                    		<div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return viewMCNBills('mcnBills','0','menu','false','')" value="<spring:message code="back.label" />" />
                                    		</div>
                                    		
                                    		   	 <c:if test="${operation == 'edit'}"> 
                                    		   	 <%-- <div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return updateMcnDetails()" value="<spring:message code="submit.label" />" />
                                    		</div>	 --%>
                       	<div class="col-lg-1" style="float:right">
                        		<input type="button"   class=" addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalcancel" style="margin-left:1%;margin-right: 1.4%;position: relative;" <%-- onclick="CancelBillid('${billId }','','');" --%> value="<spring:message code="cancel.label" />" />
                       		</div>
                      <%-- </c:if> 
                      <c:if test="${operation == 'edit'}">  --%>
                                    		   	 <div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return updateMcnDetails()" value="<spring:message code="submit.label" />" />
                                    		</div>	</c:if>
                                    		<hr style="margin-top: 4px;width: 99%;" />
                                    	</div>
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                   <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                                  <%--     <c:forEach var="billing" items="${billDetails.billing}"> --%>
                  <c:forEach items="${warehouseReportObj.reportsList}" var="warehouseReportObj">    
                  <input type="hidden" id = "billId" value="${warehouseReportObj.billRef}">   
                  <input type="hidden" id ="creditNoteRef" value="${warehouseReportObj.creditNoteRef}">   
                  <input type="hidden" id = "creditNoteNo" value="${warehouseReportObj.creditNoteNo}"> 
                                    <div class="row">
                                    <div class="form-group col-lg-2" style="width: 18.5%;">
                                            <label>Credit Note Ref Number</label>
                                           <%--  <input type="text" id="outletLocation" class="form-control" readonly value="${billDetails.store_location}"/> --%>
                                            <input type="text" class="form-control" id="location" readonly value="${warehouseReportObj.creditNoteRef}"/>
                                     </div>
                                      <div class="col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="bill.date.label" /> </label>
                                            <input type="text" class="form-control" readonly id="billDate" value="${warehouseReportObj.date}"/>
                                     
                                        </div>
                                        
                                        <div class="col-lg-1"></div>
                                        
                                        <div class="form-group col-lg-2">
                                        	<label><spring:message code="bill.done.by.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${warehouseReportObj.cashierName}"/>
                                      
                                        </div>
                                        <div class="col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                        <label><spring:message code="billing_status.label" /> </label>

										<c:choose>
											<c:when test="${operation == 'edit'}">
												
												<select class="form-control allField req"
																	style="width: 80%" id="statusFlag">
																	<option value="Active"
																		${'Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>Active</option>
																	<option value="In Active"
																		${'In Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>InActive</option>

																</select>
												
												<%--   <c:choose>
													<c:when test="${billDetails.status == 'DD-CB-Open' || billDetails.status =='TA-CB-Open'}">
														
														<c:choose>
															<c:when test="${fn:length(billDetails.billingTransactions) == 0}">
																<select class="form-control allField req"
																	style="width: 80%" id="statusFlag">
																	<option value="Active"
																		${'Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>Active</option>
																	<option value="In Active"
																		${'In Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>InActive</option>

																</select>
															</c:when>
															<c:otherwise>
														       <select class="form-control allField req" style="width: 80%" id="statusFlag" disabled>
																	<option value="Active"
																		${'Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>Active</option>
																	<option value="In Active"
																		${'In Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>InActive</option>

																</select>
														  </c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<textarea style="resize:none;" disabled>${warehouseReportObj.creditNoteReason}</textarea>
														<select class="form-control allField req"
															style="width: 80%" id="statusFlag" disabled>
															<option value="Active"
																${'Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>Active</option>
															<option value="In Active"
																${'In Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>InActive</option>

														</select>
													</c:otherwise>
												</c:choose> --%>
												
												
												
												
												
											</c:when>
											<c:otherwise>
												<select class="form-control allField req" style="width: 80%"
													id="statusFlag" disabled>
													<option value="Active"
														${'Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>Active</option>
													<option value="In Active"
														${'In Active' == warehouseReportObj.statusFlag ? 'selected' : ''}>InActive</option>

												</select>

											</c:otherwise>
										</c:choose>
										<%--  <input type="text" class="form-control" readonly value="${warehouseReportObj.statusFlag}"/> --%>
                                        <%--  <label><spring:message code="billing_counter_id.label" /></label>
                                            <input type="text" class="form-control" id="counterId" readonly value="${billDetails.counterId}"/>
                                     
                                      <label><spring:message code="billing_status.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${warehouseReportObj.statusFlag}"/> --%>
                                        </div>
                                        
                                   
                                 
                                    <br/> 
                                    
            </div>    
            
            
            
            
            
                              <div class="row">
                                    <div class="form-group col-lg-2" style="width: 18.5%;" >
                                      <label><spring:message code="bill.id.label" /></label>
                                      <input type="text" class="form-control" readonly value="${warehouseReportObj.billRef}"/>
                                     </div>
                               <div class="col-lg-1"></div>
                              <div class="form-group col-lg-2">
                                   <%-- <label><spring:message code="customerName.label" /></label>
                                    <input type="text" class="form-control" readonly value="${warehouseReportObj.customerName}"/> --%>
                                    <label>Expiry Date</label>
                                    <c:choose>
											<c:when test="${operation == 'edit'}">
											<input class="form-control" readonly="readonly" style="background-color: white;" name="expiryDate" id="expiryDate" size="20" type="text" onclick="callCalender('expiryDate')"onfocus="callCalender('expiryDate')" placeholder="DD/MM/YYYY" value="${warehouseReportObj.expiryDate}"/>
											
											<%-- <c:choose>
													<c:when test="${billDetails.status == 'DD-CB-Open' || billDetails.status =='TA-CB-Open'}">
														
														<c:choose>
															<c:when test="${fn:length(billDetails.billingTransactions) == 0}">
																<input class="form-control" readonly="readonly" style="background-color: white;" name="expiryDate" id="expiryDate" size="20" type="text" onclick="callCalender('expiryDate')"onfocus="callCalender('expiryDate')" placeholder="DD/MM/YYYY" value="${warehouseReportObj.expiryDate}"/>
															</c:when>
															<c:otherwise>
														       <input type="text" class="form-control" readonly value="${warehouseReportObj.expiryDate}"/>
														  </c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<input type="text" class="form-control" readonly value="${warehouseReportObj.expiryDate}"/>
													</c:otherwise>
												</c:choose> --%>
											
											
											
											
												
											</c:when>
											<c:otherwise>
												<input type="text" class="form-control"  readonly value="${warehouseReportObj.expiryDate}"/>
												<input type="hidden" class="form-control"  id="expiryDate" readonly value="${warehouseReportObj.expiryDate}"/>
                                                 
											</c:otherwise>
										</c:choose>
                                    
                              </div>
                                      <div class="col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                          
                                       <label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly value="${warehouseReportObj.customerMobileNo}"/>
                                        </div>
                                        
                                         <div class="col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                        	<%-- <label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly value="${warehouseReportObj.customerMobileNo}"/> --%>
                                    <%--     <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.deliveryType} "/> --%>
                                        </div>
                                        
                                        <div class="form-group col-lg-2">
                                        <%--  <label><spring:message code="billing_counter_id.label" /></label>
                                            <input type="text" class="form-control" id="counterId" readonly value="${billDetails.counterId}"/>
                                      --%>
                                      
                                        </div>
                                        
                                   
                                 
                                    <br/> 
                                    
            </div>

								<div class="row">
									<div class="form-group col-lg-2" style="width: 18.5%;">
										<label>Original Bill ID</label> <input type="text"
											class="form-control" readonly
											value="${warehouseReportObj.originalBillId}" />
									</div>
									<div class="col-lg-1"></div>
									<div class="form-group col-lg-2">
										<%-- <label><spring:message code="customerName.label" /></label>
                                    <input type="text" class="form-control" readonly value="${warehouseReportObj.customerName}"/> --%>
										<label>Balance</label> <input type="text" class="form-control"
											readonly value="${warehouseReportObj.billAmount}" />

									</div>
									<div class="col-lg-1"></div>
									<div class="form-group col-lg-2">

										<label><spring:message code="customerName.label" /></label> <input
											type="text" class="form-control" readonly
											value="${warehouseReportObj.customerName}" />
									</div>

									<div class="col-lg-1"></div>

									<div class="form-group col-lg-2">
										<label>Comments</label>
										<c:choose>
											<c:when test="${operation == 'edit'}">
                                                 <input type="text" class="form-control" id="comments" value="${warehouseReportObj.creditNoteReason}" />
												<%-- <c:choose>
													<c:when test="${billDetails.status == 'DD-CB-Open' || billDetails.status =='TA-CB-Open'}">
														
														<c:choose>
														  <c:when test="${fn:length(billDetails.billingTransactions) == 0}">
														      <input type="text" class="form-control" id="comments" value="${warehouseReportObj.creditNoteReason}" />
														  </c:when>
														  <c:otherwise>
														      <input type="text" class="form-control" id="comments" readonly value="${warehouseReportObj.creditNoteReason}" />
														  </c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<textarea style="resize:none;" disabled>${warehouseReportObj.creditNoteReason}</textarea>
														<input type="text" class="form-control" id="comments" readonly value="${warehouseReportObj.creditNoteReason}" />
													</c:otherwise>
												</c:choose> --%>
												
												<%--  <textarea style="resize:none;">${warehouseReportObj.creditNoteReason}</textarea> --%>
											</c:when>
											<c:otherwise>
											    <%-- <textarea style="resize:none;" disabled>${warehouseReportObj.creditNoteReason}</textarea> --%>
												<input type="text" class="form-control" id="comments" value="${warehouseReportObj.creditNoteReason}" readonly />
											</c:otherwise>
										</c:choose>
										 

									</div>

									<br />

								</div>
                          <div class="row">
                              <div class="form-group col-lg-2" style="width: 18.5%;">
										<label>Redeem Bill ID</label> <textarea 
											class="form-control" readonly style="width: 174px; height: 64px;resize:none;"
											 >${warehouseReportObj.redeemBillId}</textarea>
									</div>
                           </div>

								<div>
                          
                           
                          </div>

                    
        		 <div id="triggerEvent"></div>
    <div class="modal fade" id="myModalcancel" role="dialog" tabindex="-1">
    <div class="modal-dialogwidth iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Do you want to cancel the  creditNote,this operation can not be reverted back ?
       
          <!-- <div class="col-lg-1"> -->
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="cancelMCNDetails('${warehouseReportObj.billRef}','${warehouseReportObj.creditNoteRef}','edit');"  value="Ok">
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
   
   
            
    </c:forEach>                          
                       
               <input type="hidden" id="outletLocation" value="${location}">
               <input type="hidden" id="outletZone" value="${zone}">       
               <input type="hidden" id="from" value="${startDate}">
               <input type="hidden" id="to" value="${endDate}"> 
               <input type="hidden" id="maxRecords" value="${maxRecords}">         
				<input type="hidden" id="searchCredit" value="${searchName}">    	
						<br>
						<%-- <div class="row" style="text-align: right;">
							

                        	<div class="col-lg-1" style="float:right">
                        		<input type="button" class="addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1.4%;position: relative;margin-top:7px" onclick="return viewMCNBills('mcnBills','0','menu','false','')" value="<spring:message code="back.label" />" />
                       		</div>
                      <c:if test="${operation == 'edit'}"> 	
                       	<div class="col-lg-1" style="float:right">
                        		<input type="button"   class=" addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalcancel" style="margin-left:1%;margin-right: 1.4%;position: relative;margin-top:7px" onclick="CancelBillid('${billId }','','');" value="<spring:message code="submit.label" />" />
                       		</div>
                      </c:if> 	
						</div> --%>
						<div class="row" style="text-align: right; margin-top: -65px;">
                                            
	                                    		<div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return viewMCNBills('mcnBills','0','menu','false','')" value="<spring:message code="back.label" />" />
                                    		</div>
                                    		
                                    		   	 <c:if test="${operation == 'edit'}"> 
                                    		   	 <%-- <div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return updateMcnDetails()" value="<spring:message code="submit.label" />" />
                                    		</div>	 --%>
                       	<div class="col-lg-1" style="float:right">
                        		<input type="button"   class=" addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalcancel" style="margin-left:1%;margin-right: 1.4%;position: relative;" <%-- onclick="CancelBillid('${billId }','','');" --%> value="<spring:message code="cancel.label" />" />
                       		</div>
                      <%-- </c:if> 
                      <c:if test="${operation == 'edit'}">  --%>
                                    		   	 <div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return updateMcnDetails()" value="<spring:message code="submit.label" />" />
                                    		</div>	</c:if>
                                    		<hr style="margin-top: 4px;width: 99%;" />
                                    	</div>
						<%-- </c:forEach> --%>
						</div><!-- /.box-body -->
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                  
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->

    
</body>
</html>
		    		 