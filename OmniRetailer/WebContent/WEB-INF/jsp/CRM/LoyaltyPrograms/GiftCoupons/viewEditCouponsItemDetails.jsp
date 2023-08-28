<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>





	<div id="generatedGiftCoupons">
                               <div class="col-lg-6" style="">
<!--                              <div class="table-responsive" style=""> -->
								 <label><strong>Discount Coupons Generated</strong></label>
								<table id="cardsDetails" class="table table-striped table-bordered" style="margin-bottom: -8px;">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-3" ><spring:message code="gift.coupon.id.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="no.of.claims.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                              </tr>      	
				                             </thead>
				                           
				                             
				                               <tbody style="text-align:center">
				                              <c:forEach var="coupon" items="${giftCoupon.giftCoupons}" varStatus="theCount">
                                        	 <tr style='margin-top:5px;'>
				                             <td>${theCount.count}</td>
				                             <td>${coupon.couponCode}</td>
				                             <td>${coupon.startDateStr}</td>
				                             <td>${coupon.endDateStr}</td>
				                             <td>${coupon.noOfCliams}</td>
				                             
				                              <c:set var="statusofCard" value="${coupon.couponStatus}"/>
                                          <c:choose>
                                        <c:when test="${statusofCard == false}">
                                        <td>InActive</td>
                                      </c:when>
                                      <c:otherwise>
                                     <td> Active</td>
                                     </c:otherwise>
                                       </c:choose>
				                             
				                          
				                             </tr>
				                             </c:forEach>
				                             </tbody>
				                             
				                             
                                    	</table>
								
							</div>
							
							
							
							
							
							 <div class="col-lg-12">
                  
                  
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="editGiftCoupnsForPagination('${giftCoupon.couponProgramCode}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editGiftCoupnsForPagination('${giftCoupon.couponProgramCode}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editGiftCoupnsForPagination('${giftCoupon.couponProgramCode}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="editGiftCoupnsForPagination('${giftCoupon.couponProgramCode}','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
                  
                  
                  <div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="editGiftCoupnsForPagination('${giftCoupon.couponProgramCode}',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div> 
									
									
									
							
							
							
							</div>
                             
<!--                                     	</div> -->
<!-- 									  </div> -->
<%-- 									<input type="hidden" id="selectedStateList"   value="${statesList}">   --%>
									   <input type="hidden" id="outletLocation" value="">
                                <input type="hidden" id="outletZone" value="">
                                  <input type="hidden" id="couponStartDate" value="">
                                   <input type="hidden" id="couponEndDate" value="">
                                    <input type="hidden" id="searchCoupons" value="">
									  
                                     <input type="hidden" id="selectedZone" name="selectdZones" value="${zones}">
                                     <input type="hidden" id="selectedLocation"  name="locations" value="${locationList}">
                                   <%--    <input type="hidden" id="selectedAllLocation"   value="${locationList}"> --%>
                                    </div><!-- /.box-body -->
									

</body>
</html>