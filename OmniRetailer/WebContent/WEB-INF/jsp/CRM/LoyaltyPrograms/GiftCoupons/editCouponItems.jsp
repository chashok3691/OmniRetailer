
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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
 	  <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>


</head>
<body>
	<div id="generatedCoupons">
	
	
	
								<table id="cardsDetails" class="table table-striped table-bordered" style="margin-bottom: -8px;">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-3" ><spring:message code="gift.coupon.id.label"/></th>
				                        	<th class="col-sm-3" ><spring:message code="customer.mobile.no.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="claim.status.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="no.of.claims.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                              </tr>      	
				                             </thead>
				                           
				                             
				                               <tbody style="text-align:center">
				                              <c:forEach var="coupon" items="${giftCoupons}" varStatus="theCount">
				                               
                                        	 <tr style='margin-top:5px;'>
				                             <td>${theCount.count}</td>
				                             <td>${coupon.couponCode}</td>
				                              <td>${coupon.customerMobile}</td>
				                             <td>${coupon.startDateStr}</td>
				                             <td>${coupon.endDateStr}</td>
				                             <c:choose>
				                             <c:when test="${noofClaims-coupon.noOfCliams == '0'}">
				                              <td>NO</td>
				                             </c:when>
				                             <c:otherwise>
				                              <td>YES</td>
				                             </c:otherwise>
				                             </c:choose>
				                            
				                             <td>${noofClaims-coupon.noOfCliams}</td>
				                             
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
              	
              	
                    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                  
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
<%--           <input type="hidden" id="stockdownloadurl" value="${downloadurl}"> --%>
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-3 col-sm-6 col-xs-6" style="margin-left: 29%;">
 <input type="button" class="iosclosebutton1" onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','0','${searchCriteria}','true');"  value="Ok">
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
<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
  
</html>