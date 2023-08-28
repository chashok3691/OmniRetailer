
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	</head>
<body>

<%-- <input type="hidden" id="downloadurl" value="${downloadurl}"> --%>					   
             	
                
                <div id="generatedCoupons">
	
	
	<div class="table-responsive" 
														role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
								 <table id="cardsDetails" class="table table-striped table-bordered" style="margin-bottom: -8px;">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-3" style="padding-left: 35px;padding-right: 35px;"><spring:message code="gift.coupon.id.label"/></th>
				                        	<th class="col-sm-3"style="padding-left: 50px; padding-right: 35px;">Coupon ID</th>
				                        	<th class="col-sm-2" style="padding-left: 17px;padding-right: 17px;"><spring:message code="customer.mobile.no.label"/></th>
				                        	<th class="col-sm-1" style="padding-left: 21px;padding-right: 15px;"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1" style="padding-left: 21px;padding-right: 22px;"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1" style="padding-left: 5px;padding-right: 5px;"><spring:message code="claim.status.label"/></th>
				                        	<th class="col-sm-1" style="padding-left: 2px;padding-right: 2px;"><spring:message code="pending.claims.label"/></th>
				                        	<th class="col-sm-1" style="padding-left: 25px;padding-right: 27px;"><spring:message code="status.label"/></th>
				                               <c:if test="${actionTest == 'true'}">                                     
				                        	
				                        	<th class="col-sm-1"><spring:message code="action.label" /></th>
				                             </c:if>
				                              </tr>      	
				                             </thead>
				                           
				                             
				                               <tbody style="text-align: center;">


														<c:if test="${giftCoupon.totolGiftCoupons != 0}">

															<c:forEach var="coupon" items="${giftCoupon.giftCoupons}"
																varStatus="theCount">
																<tr style='margin-top: 5px;' id="productrange1">
																	<!-- <tr id="range1">
													<td style="display: none;"><span id="1rangename">range1</span></td> -->
																	<%-- <td>${theCount.count}</td> --%>
																	<td id="productcoupon1">${theCount.count+index-1}</td>
																	<td><input class="form-control couponCode${theCount.count}" type="text" value="${coupon.couponCode}" readonly="readonly" id="couponCodes${theCount.count}" /></td>
																	<td><input class="form-control couponCode${theCount.count}" type="text" value="${coupon.couponId}" readonly="readonly" id="couponCodes${theCount.count}" /></td>
																	
																	<input class="form-control couponID${theCount.count}" type="hidden" value="${coupon.couponId}"  id="couponIDs${theCount.count}" />
																	<input type="hidden"  id="couponProgramCode${theCount.count}" value="${coupon.couponProgramCode}" />		 
																    <input type="hidden"  id="assignedStatus${theCount.count}" value="${coupon.assignedStatus}" />		 
																    <input type="hidden"  id="couponStatus${theCount.count}" value="${coupon.couponStatus}" />
																	<input type="hidden"  id="noOfClaims${theCount.count}" value="${coupon.noOfClaims}" />		 
																 
																		 
																		 
																		<td><input
																		class="form-control customerMobile${theCount.count}"
																		type="text" value="${coupon.customerMobile}"
																		readonly="readonly"
																		id="customerMobile${theCount.count}" /></td>

																<input type="hidden"  id="sNo${theCount.count}" value="${coupon.sNo}" />	
															
																<input type="hidden"  id="issuedAt${theCount.count}" value="${coupon.issuedAt}" />		 

																<input type="hidden"  id="customerName${theCount.count}" value="${coupon.customerName}" />		 

																<input type="hidden"  id="customerEmail${theCount.count}" value="${coupon.customerEmail}" />	
																

																<input type="hidden"  id="claimedAt${theCount.count}" value="${coupon.claimedAt}" />		 

																<input type="hidden"  id="billRef${theCount.count}" value="${coupon.billRef}" />		 
																<input type="hidden"  id="couponValue${theCount.count}" value="${coupon.couponValue}" />		 

																<input type="hidden"  id="totalRecords${theCount.count}" value="${coupon.totalRecords}" />		 

																<input type="hidden"  id="couponId${theCount.count}" value="${coupon.couponId}" />		 

																<input type="hidden"  id="issuedAtStr${theCount.count}" value="${coupon.issuedAtStr}" />
																<input type="hidden"  id="validityDateStr${theCount.count}" value="${coupon.validityDateStr}" />		 	 
                                                                     
                                                                  

																
																
													
																		 
																
																	
																	<td><input
																		class="form-control startDateStr${theCount.count}"
																		type="text" value="${giftCoupon.createdOnStr}"
																		readonly="readonly" id="startDateStr${theCount.count}" /></td>
																	<td><input
																		class="form-control endDateStr${theCount.count}"
																		type="text" value="${giftCoupon.expiryDateStr}"
																		readonly="readonly" id="endDateStr${theCount.count}" /></td>
																	<input type="hidden" value="${giftCoupon.noOfCliams}" />
																	<input type="hidden" value="${coupon.noOfCliams}" />
																	<input type="hidden"
																		value="${giftCoupon.noOfCliams-coupon.noOfCliams}" />
																	<%-- <c:choose>
				                             <c:when test="${giftCoupon.noOfCliams-coupon.noOfCliams == '0'}"> --%>
																
																
																
																
																<c:set var="inside2" value="0"></c:set> 
                              
																
																
																	<td>
																		
                                                           <select
																		class="form-control claimStatus${theCount.count}"
																		disabled="disabled" id="claimStatus${theCount.count}">
																			<option value="1"
																				${giftCoupon.noOfCliams-coupon.noOfClaims != '0' ? 'selected' : ''}>YES</option>
																			<option value="0"
																				${giftCoupon.noOfCliams-coupon.noOfClaims == '0' ? 'selected' : ''}>NO</option>
																	</select>
																	
																	</td>
																	
														
																	

																	<input type="hidden" value="${coupon.noOfClaims}" />
																	<td><input
																		class="form-control noOfCliams${theCount.count}"
																		type="text" value="${coupon.noOfClaims}"
																		readonly="readonly" id="noOfCliams${theCount.count}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>


												 <select
																		class="form-control couponState${theCount.count}"
																		disabled="disabled" id="couponState${theCount.count}">
																			<option value="Active"
																				${true == coupon.couponStatus ? 'selected' : ''}>Active</option>
																			<option value="InActive"
																				${false == coupon.couponStatus ? 'selected' : ''}>InActive</option>
																	</select>
																	</td>
																	
																	<td id="Edit${theCount.count}"><a
																		style="color: #2e7ea7 !important; cursor: pointer;"
																		onclick="return couponEdit('${theCount.count}')">Edit</a></td>

																</tr>
															</c:forEach>
														</c:if>




														<c:if test="${giftCoupon.totolGiftCoupons == 0}">


															<tr id="productrange1">
																<td style="display: none;"><span id="1rangename">productrange1</span></td>
																<td id="productcoupon1">1</td>
																<%-- <td>${theCount.count}</td>  --%>
																<!-- <td id="productoffer1">1</td> -->
																<td style="width: 12%"><input
																	class="form-control couponCode" type="text"
																	id="couponCodes1" /></td>
																	
																	<input
																	class="form-control couponID" type="hidden"
																	id="couponIDs1" />
																	
																<td style="width: 12%"><input
																	class="form-control customerMobile" type="text"
																	id="customerMobile1"
																	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>


																<td style="width: 12%"><input
																	class="form-control startDate"
																	value="${giftCoupon.createdOnStr}" readonly="readonly"
																	type="text" id="1startDate" /></td>

																<td style="width: 12%"><input
																	class="form-control endDate" type="text"
																	value="${giftCoupon.expiryDateStr}" readonly="readonly"
																	id="endDate1" name="1endDate" /></td>
																<c:choose>
																	<c:when
																		test="${giftCoupon.noOfCliams-coupon.noOfCliams == '0'}">
																		<td style="width: 12%"><input
																			class="form-control claimStatus" value="NO"
																			readonly="readonly" type="text" id="claimStatus1" /></td>
																	</c:when>
																	<c:otherwise>
																		<td style="width: 12%"><input
																			class="form-control claimStatus" value="YES"
																			readonly="readonly" type="text" id="claimStatus1" /></td>
																	</c:otherwise>
																</c:choose>
																<!-- <td style="width: 12%"><input class="form-control 1claimStatus" 
														type="text" id="1claimStatus"/></td>  -->
																<td style="width: 12%"><input
																	class="form-control noOfCliams"
																	value="${giftCoupon.noOfCliams}" readonly="readonly"
																	type="text" id="noOfCliams1"
																	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>

																<!--  <td style="width: 12%"><input class="form-control 1couponStatus"  
														type="text" id="1couponStatus"/></td> -->

																<c:set var="statusofCard" value="${coupon.couponStatus}" />
																<c:choose>
																	<c:when test="${statusofCard == false}">
																		<td style="width: 12%"><input
																			class="form-control couponStatus" value="InActive"
																			readonly="readonly" type="text" id="1couponState" /></td>
																	</c:when>
																	<c:otherwise>
																		<td style="width: 12%"><input
																			class="form-control couponStatus" value="Active"
																			readonly="readonly" type="text" id="couponState1" /></td>
																	</c:otherwise>
																</c:choose>

																<td style="width: 7%"><div style="width: 60px;">
																		<a style="color: #2e7ea7 !important; cursor: pointer;"
																			onclick="return couponEdit()">Edit</a>
																	</div></td>


															</tr>

														</c:if>


													</tbody>
				                               
				                             
				                             
                                    	</table> 
                                    </div>
							
						 
				                             
							
							<input type="hidden" id="promoCode" value="${loyaltyCouponNumber}">
							 <div class="col-lg-12" style="margin-top: 20px;margin-left: -5%;">
                  
                  
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="editLoyaltyGiftCouponForPagination('${loyaltyCouponNumber}','${totalValue}','${searchCriteria}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editLoyaltyGiftCouponForPagination('${loyaltyCouponNumber}','${index - (maxRecords + 1)}','${searchCriteria }','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editLoyaltyGiftCouponForPagination('${loyaltyCouponNumber}','${index - (maxRecords + 1)}','${searchCriteria}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="editLoyaltyGiftCouponForPagination('${loyaltyCouponNumber}','${totalValue}','${searchCriteria}','false')">
              	</div> 
              	</c:if>
              	
              	
<%--                     <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
 --%>                  
                  <div class="col-lg-6" style="float:right;margin-right: -10%; ">
              	<div class="col-lg-4" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-4" style="padding-right: 0px;">
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
              		<div class="col-lg-4" style="padding-right: 0px;">
              		  <input type="button" onclick="editLoyaltyGiftCouponForPagination('${loyaltyCouponNumber}',document.getElementById('pagination').value,'${searchCriteria}','false');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div> 
								
								
								
								
								<div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup" style="width:58% !important">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
          <input type="hidden" id="downloadurl" value="${downloadurl}">
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-3 col-sm-6 col-xs-6" style="margin-left: 29%;">
 <%-- <input type="button" class="iosclosebutton1" onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','0','${searchCriteria}','true');"  value="Ok"> --%>
<c:choose>
<c:when test="${giftCoupon.quantity == giftCoupon.noOfCoupons}">
<input type="button" class="iosclosebutton1" onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','0','${searchCriteria}','true');"  value="Ok">
</c:when>
<c:otherwise>
<input type="button" class="iosclosebutton1" onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','0','${searchCriteria}','true');"  value="Ok">
</c:otherwise>
</c:choose>
</div>
<!-- <div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div> --></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
    
    	
									
									
						</div>	
					   
</body>

</html>