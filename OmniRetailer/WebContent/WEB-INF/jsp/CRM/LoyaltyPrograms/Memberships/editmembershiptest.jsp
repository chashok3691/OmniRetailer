
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
             	
                
               <div  id="childsearchMembership">
                                   <div class="table-responsive" role="grid"
											style="overflow-x: auto; width: 100%; position: relative; white-space: nowrap;">
										
                                    	
                                    	<%-- <label><strong><spring:message code="Memberships.Generated.label" /></strong></label> --%>
                                    	<table class="table table-striped table-bordered">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1"><spring:message
																	code="slno.label" /></th>
															<th class="col-sm-3"
																style="padding-left: 22px; padding-right: 35px;"><spring:message
																code="Membership.id.label" /></th>
															<th class="col-sm-2"
																style="padding-left: 55px; padding-right: 17px;">Name</th>
																	<th class="col-sm-2"
																style="padding-left: 22px; padding-right: 17px;">Phone No</th>
															<th class="col-sm-1"
																style="padding-left: 21px; padding-right: 15px;"><spring:message
																	code="start.date.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 22px; padding-right: 22px;"><spring:message
																	code="end.date.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 8px; padding-right: 5px;">Renewal Date</th>
															<th class="col-sm-1"
																style="padding-left: 25px; padding-right: 2px;">Assigned</th>
															<th class="col-sm-1"
																style="padding-left: 25px; padding-right: 27px;"><spring:message
																	code="status.label" /></th>
															
													
				                        	<c:if test="${type == 'edit'}">
													<th class="col-sm-1">Action</th>
				                        	</c:if>
				                        </tr>      	
				                        </thead>
				                         <c:forEach var="MemberList" items="${membership}" varStatus="theCount">	
				                           <tr style="text-align: center;">
                                               	<td id="membershipchild${theCount.count}">${theCount.count+index-1}</td>

                                                <%-- <td>${theCount.count}</td> --%>
                                                <td style="text-align: left;">
                                                <input type="text" class="form-control"
															id="membershipCode${theCount.count}"
															value="${MemberList.membershipCode}"
															style="background-color: #eee;" disabled="disabled" "/>
                                               </td>
                                                <td>
                                                <input type="text" class="form-control name${theCount.count}"
															id="name${theCount.count}" disabled="disabled"
															value="${MemberList.name}" />
                                                </td>
                                                <td>
                                                <input type="text" class="form-control phone_num${theCount.count}"
															id="phone_num${theCount.count}" disabled="disabled"
															value="${MemberList.phone_num}"  />
                                                
                                                </td>
                                                <td>
                                                <input
																class="form-control startDateStr${theCount.count}"
																type="text" value="${MemberList.startDateStr}"
																readonly="readonly" id="startDateStr${theCount.count}"  placeholder="DD/MM/YYYY" 
																onfocus="callCalender('startDateStr${theCount.count}')"
												                 onclick="callCalender('startDateStr${theCount.count}')"/>
                                                
                                                </td>
                                                <td>
                                                <input
																class="form-control expiryateStr${theCount.count}"
																type="text" value="${MemberList.endDateStr}"
																readonly="readonly" id="expirydateStr${theCount.count}"   placeholder="DD/MM/YYYY" 
																onfocus="callCalender('expirydateStr${theCount.count}')"
												                 onclick="callCalender('expirydateStr${theCount.count}')"
																 />
                                                
                                               </td>
                                                <td>
                                                <input type="text"  class="form-control renewaldate${theCount.count}"
															id="renewaldate${theCount.count}" disabled="disabled"
															value="${MemberList.renewalDateStr}" placeholder="DD/MM/YYYY" 
																onfocus="callCalender('renewaldate${theCount.count}')"
												                 onclick="callCalender('renewaldate${theCount.count}')" />
                                               </td>
                                                
                                               <td>

                                                                   <select
																		class="form-control assignrdstatus${theCount.count}"
																		disabled="disabled" id="assignrdstatus${theCount.count}">
																			<option value="Yes"
																				${MemberList.assignedStatus==true ? 'selected' : ''}>YES</option>
																			<option value="No"
																				${MemberList.assignedStatus==false ? 'selected' : ''}>NO</option>
																	</select>
</td>
														
														<td>
														
														
														 <select
																		class="form-control membershipstatus${theCount.count}"
																		disabled="disabled" id="membershipstatus${theCount.count}">
																			<option value="Active"
																				${MemberList.membershipStatus==true ? 'selected' : ''}>Active</option>
																			<option value="InActive"
																				${MemberList.membershipStatus==false ? 'selected' : ''}>InActive</option>
																	</select>
														
														
														
														</td>
														
                                               <c:if test="${type == 'edit'}">
                                                
                                                <td id="Edit${theCount.count}"><a
															style="color: #2e7ea7 !important; cursor: pointer;"
															onclick="return membershipEdit('${theCount.count}')">Update</a></td>
                							
                							</c:if>
                							</tr>  
                							
                							<input type="hidden" id="membershipId${theCount.count}"
														value="${MemberList.membershipId}">
                							
                							<input type="hidden" id="status${theCount.count}"
														value="${MemberList.status}">
													<input type="hidden" id="isAutoRenewal${theCount.count}"
														value="${MemberList.isAutoRenewal}">
													<input type="hidden" id="isOnline${theCount.count}"
														value="${MemberList.isOnline}">
														
														
														
														
										    <input type="hidden" id="member_ship_id${theCount.count}"
													value="${MemberList.membershipCode}">
												<input type="hidden"
													id="membershipProgramCodecus${theCount.count}"
													value="${MemberList.membershipProgramCode}">
												
												<input type="hidden" id="customer_category${theCount.count}"
													value="${MemberList.customer_category}">
												<input type="hidden" id="statuscus${theCount.count}"
													value="${MemberList.status}">
												

												<input type="hidden" id="membershipFeecus${theCount.count}"
													value="${MemberList.membershipFee}">
												<input type="hidden" id="activationPoints${theCount.count}"
													value="${MemberList.activationPoints}">
												<input type="hidden" id="creditAmount${theCount.count}"
													value="${MemberList.creditAmount}">
												<input type="hidden" id="isAutoRenewalcus${theCount.count}"
													value="${MemberList.isAutoRenewal}">
												<input type="hidden" id="isOnlinecus${theCount.count}"
													value="${MemberList.isOnline}">
												<input type="hidden" id="saveReportcus${theCount.count}"
													value="${MemberList.saveReport}">
														
                							
                							
				                        </c:forEach>     
                                    	</table>
                                    	
                                    	</div>
                                    	<!-- pagination -->
                                   <div class="col-lg-12"
												style="margin-left: -4%; margin-top: 0px">


												<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
													<div class="form-group col-lg-6" style="text-align: left;">
														<input type="button" class='paginationButton'
															value="&#60;" onclick=""> ${index} -
														${totalValue} of ${totalRecords} <input type="button"
															class='paginationButton' value="&#62;"
															onclick="viewMembershipDetails('${membership[0].membershipProgramCode}','edit','${totalValue}','true')">
													</div>
												</c:if>

												<c:if test="${totalValue == totalRecords}">
													<c:if test="${totalValue-maxRecords >0}">
														<div class="form-group col-lg-6" style="text-align: left;">
															<input type="button" class='paginationButton'
																value="&#60;"
																onclick="return viewMembershipDetails('${membership[0].membershipProgramCode}','edit','${index - (maxRecords + 1)}','true');">
															${index} - ${totalValue} of ${totalRecords} <input
																type="button" class='paginationButton' value="&#62;">
														</div>
													</c:if>
													<c:if test="${totalValue-maxRecords <= 0}">
														<div class="form-group col-lg-6" style="text-align: left;">
															<input type="button" class='paginationButton'
																value="&#60;"> ${index} - ${totalValue} of
															${totalRecords} <input type="button"
																class='paginationButton' value="&#62;">
														</div>
													</c:if>
												</c:if>
												<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
													<div class="form-group col-lg-6" style="text-align: left;">
														<input type="button" class='paginationButton'
															value="&#60;"
															onclick="return viewMembershipDetails('${membership[0].membershipProgramCode}','edit','${index - (maxRecords + 1)}','true');">
														${index} - ${totalValue} of ${totalRecords} . <input
															type="button" class='paginationButton' value="&#62;"
															onclick="viewMembershipDetails('${membership[0].membershipProgramCode}','edit','${totalValue}','true')">
													</div>
												</c:if>


												<div class="form-group col-lg-6"
													style="float: right; margin-right: -15%;">
													<div class="col-lg-4"
														style="text-align: right; padding-right: 0px; margin-top: 4px; font-size: 16px;">
														<spring:message code="pages.label" />
													</div>
													<div class="col-lg-3" style="padding-right: 0px;">
														<select class="form-control" id="pagination">
															<c:set var="totalRecords" value="${totalRecords}"></c:set>
															<c:forEach var="i" begin="0" end="${totalRecords}">
																<c:if test="${(totalRecords)>0}">
																	<option value="${(i*maxRecords)}"
																		${index-1 == i*maxRecords ? 'selected' : ''}>
																		${i+1}</option>
																	<c:set var="totalRecords"
																		value="${totalRecords-maxRecords}"></c:set>
																</c:if>
															</c:forEach>
														</select>

													</div>
													<div class="col-lg-3" style="padding-right: 0px;">
														<input type="button"
															onclick="viewMembershipDetails('${membership[0].membershipProgramCode}','edit',document.getElementById('pagination').value,'true');"
															class="btn bg-olive btn-inline  addBtn" value="GO">
													</div>

												</div>
											</div>
                                   
                                   <!--pagination  -->
                                    	
                                    	
                                   </div>
					   
</body>

</html>