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
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/loyaltyCards.js"></script>
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
 	
 	</head>
<body>

<div class="col-lg-12" style="    padding: 0px;">
		<%-- 	<div class="col-lg-12" style="padding-left:0px;">
										<label style="font-size: 16px;"><spring:message code="crm.loyality.cards.generated.label" /></label>
									</div>
								<div class="col-lg-12" style="padding-left:0px;">
									
										<div class="row" style="margin-top: 1.5%"> 
								 			<div class="col-lg-2 col-xs-2" style="">
				                      			<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange = "searchLoyaltyCards('',0,'',false)">
				                      				<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      				<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      				<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     				<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      			</select>
				                     		 </div>
								 
								   <div class="form-group col-lg-9" style="text-align:center;  margin-bottom: 0.3%;    ;">
										<input type="text"  class="form-control searchItems" value="${searchCriteria}" id="searchItems"  placeholder="Search Loyalty cards here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchLoyaltyItems" style=""></ul>
						   						</div>
											</div>
									</div>
									<div class="form-group col-lg-1" style="padding: 0px;text-align:center;  margin-bottom: 0.3%;">
									 <input type="button" onclick="searchLoyaltyCards('',0,true)" class="btn bg-olive btn-inline  addBtn" value="SAVE">
										
																				
									</div>
									
									</div>
									</div> --%>
									
									
 			<div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="cardDetails" class="table table-bordered table-striped">
                      <thead style="background-color: #eeeeee !important;border-top: hidden; border-left: hidden;border-right: hidden;">
                             <tr>
                             
                                <th><div><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="loyalty.card.no.label" /></th>
                             	 <th ><div style="width: 100px;">Number</div></th>
                             <th ><div style="width: 100px;">Name</div></th>
                             <th >Avail Pts</th>
                             	<th ><spring:message code="crm.start.date" /></th>
                             	<th ><spring:message code="crm.end.date" /></th>
                             	<th ><spring:message code="status.label" /></th>
                             	<th><spring:message code="claim.status.label" /></th>
                             	 <th><div style="width: 100px;">Action</div></th>
                             
                              
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                          <c:forEach var="loyalityCardInfo" items="${loyaltyCard.loyaltyCards}" varStatus="theCount">
                         <tr>
                         <td>${theCount.count+index-1}</td>
                         <td id="loyaltyCardNumber${theCount.count}">${loyalityCardInfo.loyaltyCardNumber}</td>
                         
                                         
                         						<input type="hidden"  id="email${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].email}">	
                         						<input type="hidden"  id="idCardNumber${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].idCardNumber}">	
                         						<input type="hidden" id="idCardType${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].idCardType}">	
                         						<input type="hidden"  id="cash${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].cash}">	
                         						<input type="hidden"  id="pointsUsed${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].pointsUsed}">	
                         						<input type="hidden"  id="pointsEarned${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].pointsEarned}">	
                         						<input type="hidden"  id="statuscustomer${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].status}">	
                         						<input type="hidden"  id="issuedOnStr${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].issuedOnStr}">
                         						<input type="hidden"  id="issuedToStr${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].issueToStr}">	
                         						 <input type="hidden"  id="cardId${theCount.count}" value="${loyalityCardInfo.customerLoyaltyCardsList[0].cardId}">	
                         							
                         					                          
								
                                                  
                          <td ><input class="form-control Number${theCount.count}"
																		type="text" value="${loyalityCardInfo.customerLoyaltyCardsList[0].phoneNum}"
																		readonly="readonly" id="Number${theCount.count}" /></td>
																		 
								
							<input type="hidden" id="assignedCustId${theCount.count}" value="${loyalityCardInfo.assignedCustId}">	
																		
														
																		
                          				<td><input class="form-control Name${theCount.count}"
																		type="text" value="${loyalityCardInfo.customerLoyaltyCardsList[0].customerName}"
																		readonly="readonly" id="Name${theCount.count}" /></td>
																		
																
																		
																		
																		
																		
																		
                          <td><input class="form-control AvailPoints${theCount.count}"
																		type="text" value="${loyalityCardInfo.customerLoyaltyCardsList[0].pointsRemaining}"
								
																		readonly="readonly" id="AvailPoints${theCount.count}" /></td>
							
																		
                         <td  id="loyaltyCreatedDate${theCount.count}">${loyalityCardInfo.startDateStr}</td>
                         <td  id="loyaltyUpdatedDate${theCount.count}">${loyalityCardInfo.endDateStr}</td>
                       
                             <td >  
                                     <select class="form-control"  id="assignedStatus${theCount.count}" disabled="disabled" >
	                                            <option value="false" ${'false' == loyalityCardInfo.assignedStatus? 'selected' : ''}>InActive</option>
	                                            <option value="true" ${'true' == loyalityCardInfo.assignedStatus? 'selected' : ''}>Active</option>
                                            </select>
                           
                            </td>
                            <td>
                             <select class="form-control"  id="statusofCard${theCount.count}" disabled="disabled" >
	                                            <option value="false" ${'false' == loyalityCardInfo.cardStatus? 'selected' : ''}>InActive</option>
	                                            <option value="true" ${'true' == loyalityCardInfo.cardStatus? 'selected' : ''}>Active</option>
                                            </select>
                            
                            
                            
                            
                            </td>
                       
                       
                  							                   <td id="Edit${theCount.count}"><a
																	style="color: #2e7ea7 !important; cursor: pointer;"
																	onclick="return editLoyaltyCard('${theCount.count}')">Edit</a>

                                                                 <%-- <a style="color: #2e7ea7 !important; cursor: pointer;margin-left :15px"
																	onclick="return editLoyaltyCard('${theCount.count}')">Convert</a> --%>

																</td>

															</tr>
                         </c:forEach>
                         </tbody>
                     </table>
                     
         
									
						 
         </div>
                      				 <div class="col-lg-12">
                  
                  
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchLoyaltyCards('','${totalValue}',false)">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchLoyaltyCards('','${index - (maxRecords + 1)}',false)"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchLoyaltyCards('','${index - (maxRecords + 1)}',false) ;"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchLoyaltyCards('','${totalValue}',false)">
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
              		  <input type="button" onclick="searchLoyaltyCards('',document.getElementById('pagination').value,false);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div> 
                     
                     
                      	  <input type="hidden" id="loyaltydownloadurl" value="${loyaltyCard.filePath}">
                     </div>

					   
                
</body>
</html>