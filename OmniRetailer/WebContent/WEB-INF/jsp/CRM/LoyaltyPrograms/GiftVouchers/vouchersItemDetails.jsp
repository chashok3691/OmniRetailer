<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>
</head>
<body>

<div class="row" >
<%-- <div class="col-lg-12" style="">
									
										<div class="row" style="margin-top: 1.5%"> 
								 			<div class="col-lg-1 col-xs-1" style="">
				                      			<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange = "searchGiftVouchers('',0,false)">
				                      				<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      				<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      				<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     				<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      			</select>
				                     		 </div>
								 
								   <div class="form-group col-lg-6" style="text-align:center;  margin-bottom: 0.3%;    ;">
										<input type="text"  class="form-control searchItems" value="${searchCriteria}" id="searchItems"  placeholder="Search Gift Vouchers here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchVoucherItems" style=""></ul>
						   						</div>
											</div>
									</div>
									
											<div class="col-lg-1 col-xs-1" style="width:12%">
				                      			<select class="form-control" id="maxRecords" style="padding: 3px 4px;" ><!-- onchange = "searchGiftVouchers('',0,false)" -->
				                      				<c:forEach var="locationfilter" items="${giftVouchersList[0].vouchersLocaionsList[0].validLocation}">
												<option value="${locationfilter}">${locationfilter}</option>
											</c:forEach>	
				                      			</select>
				                     		 </div>
				                     		 <div class="col-lg-1 col-xs-1" style="width:12%">
				                      			<select class="form-control" id="maxRecords" style="padding: 3px 4px;" ><!-- onchange = "searchGiftVouchers('',0,false)" -->
				                      				<option value="Active"${'Enable' ==voucher.claimStatus ? 'selected' : ''}>Active</option>
                                             <option value="InActive"${'Enable' == voucher.claimStatus ? 'selected' : ''}>InActive</option>
                                           	</select>
				                     		 </div>
				                     		  <div class="col-lg-1 col-xs-1" style="">
				    <input type="button" onclick="searchGiftVouchers('',0,false)" class="btn bg-olive btn-inline  addBtn" value="GO">

				                     		 </div>
									
									
									
									
									
									<div class="form-group col-lg-1" style="text-align:center;padding: 0px;margin-bottom: 0.3%;">
									 <input type="button" onclick="searchGiftVouchers('',0,true)" class="btn bg-olive btn-inline  addBtn" value="SAVE">
										
																				
									</div>
									
									</div>
									</div> --%>

</div>
<div class="col-lg-12" style="padding:0px;">
									
	    <div class="table-responsive" style="overflow-x:overlay;">
                                        <table id="cardsDetails" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff;">
                                            <tr>
                                                 <th><div style="min-width: 40px;"><spring:message code="slno.label"/></div></th>
                                            	<th><div style="min-width: 90px;"><spring:message code="gift.voucher.code.label"/></div></th>
                                            	<th><div style="min-width: 70px;"><spring:message code="gift.voucher.id.label"/></div></th> 
                                                <th><div style="min-width: 65px;"><spring:message code="issue.date.label"/></div></th>
                                                <th><div style="min-width: 80px;"><spring:message code="issued.at.label"/></div></th>
                                                <th><div style="min-width: 100px;"><spring:message code="customer.name.label"/></div></th>
                                                <th><div style="min-width: 100px;"><spring:message code="customer.mail.label"/></div></th>
                                                <th><div style="min-width: 105px;"><spring:message code="customer.mobile.label"/></div></th>
                                                <th><div style="min-width: 85px;"><spring:message code="status.label"/></div></th>
                                                <th><div style="min-width: 70px;"><spring:message code="claim.status.label"/></div></th>  
                                                <th><div style="min-width: 70px;"><spring:message code="claimed.at.label"/></div></th>       
                                                <th><div style="min-width: 45px;"><spring:message code="bill.ref.label"/></div></th>
                                                <th><div style="min-width: 90px;"><spring:message code="value.label"/></div></th>
                                                <th><div style="min-width: 80px;"><spring:message code="valid.dates.label"/></div></th>
                                                <c:if test="${actionTest == 'true'}"> 
                                                <th><div style="min-width: 80px;"><spring:message code="EmployeeForm.action"/></div></th>
                                                </c:if>
                                           </tr>
                                          </thead>
                            			<tbody style="text-align: center;">
                                           <c:forEach var="voucher" items="${giftVoucher.giftVouchersChildList}" varStatus="theCount">
                                        	 <tr style='margin-top:5px;'>
                                        	 <td>${theCount.count+index-1}</td>
                                        	 
                                        	 
                                        	 
                                        	 	<td id="voucherCode${theCount.count}">${voucher.voucherCode}</td>
                                            	<td id="voucherId${theCount.count}" >${voucher.voucherId}</td>
                                            	
                                            	
                                            	 
                                            	
                                            
                                                <td id="issueDate${theCount.count}">${voucher.issuedAtStr}</td>
                                               <td ><input class="form-control issuedAt${theCount.count}" type="text"  id="issuedAt${theCount.count}"  readonly="readonly" value="${voucher.issuedAt}"></td>
                                                <td><input class="form-control customerName${theCount.count}" type="text"  readonly="readonly" id="customerName${theCount.count}" value="${voucher.customerName}"></td>
                                              	<td><input class="form-control customerEmail${theCount.count}" type="text"  readonly="readonly" id="customerEmail${theCount.count}" value="${voucher.customerEmail}"></td>
                                                <td><input class="form-control customerMobile${theCount.count}" type="text"   readonly="readonly" id="customerMobile${theCount.count}" value="${voucher.customerMobile}"></td>
                                               
                                             
                                               
                                               <input type="hidden" id="assignedStatus${theCount.count}" value="${voucher.assignedStatus}">
                                
                                 
                                                <td>
                                                <select class="form-control voucherStatus${theCount.count}" style="width:100%"  id="voucherStatus${theCount.count}"  disabled="disabled" >
                                             <option value="1"${voucher.voucherStatus == 1?'selected':''}>Active</option>
    	                                        <option value="0"${voucher.voucherStatus == 0?'selected':''}>InActive</option>
                                                </select>
                                                </td>
                                                
                                              
                                              
                                                <td><select class="form-control claimStatus${theCount.count}" style="width:100%"  id="claimStatus${theCount.count}"  disabled="disabled" >
                                            <option value="1"${voucher.claimStatus == 1?'selected':''}>Yes</option>
    	                                        <option value="0"${voucher.claimStatus == 0?'selected':''}>No</option>
                                                </select>
                                                </td>
                                                <td id="claimedAt${theCount.count}">${voucher.claimedAt}</td>
                                                <td id="billRef${theCount.count}">${voucher.billRef}</td>
                                                <td id="voucherValue${theCount.count}">${voucher.voucherValue}</td>
                                                <td id="validityDate${theCount.count}">${voucher.validityDateStr}</td>
                                                 <c:set var="inside2" value="1"></c:set> 
                                               
                                                
                                                   <c:if test="${actionTest == 'true'}"> 
                                                
                                            <td id="Edit${theCount.count}"> <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return voucherEdit('${theCount.count}')">Edit</a></td>
                                               </c:if> 
                                            </tr>
                                           </c:forEach>
                                             </tbody>
                                        </table>
                                        <br/>
                                    </div>
                                             
                     
                     </div>

			 <div class="col-lg-12" style="padding:0px;">
                
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;padding:0px;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGiftVouchers('','${totalValue}',false)">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;padding:0px;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGiftVouchers('','${index - (maxRecords + 1)}',false)"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;padding:0px;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;padding:0px;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGiftVouchers('','${index - (maxRecords + 1)}',false) ;"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGiftVouchers('','${totalValue}',false)">
              	</div> 
              	</c:if>
              	
              	
                  
                  
                  <div class="col-lg-6" style="text-align: right;">
                  <div class="col-lg-6" style="text-align: right;"></div>
              	<div class="col-lg-2" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
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
              		  <input type="button" onclick="searchGiftVouchers('',document.getElementById('pagination').value,false);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div> 
									
					 <input type="hidden" id="fileDownloadurl" value="${giftVoucher.filePath}">
					 
			               
                                     <input type = "hidden" name = "zone"  id ="zone" value = ""/>
									    <input type="hidden" id="selectedLocation"  name="locations" value="${locationList}">
									
												   
                 
</body>
</html>