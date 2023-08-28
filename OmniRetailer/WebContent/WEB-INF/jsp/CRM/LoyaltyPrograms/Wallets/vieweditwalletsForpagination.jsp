<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body>

<table class="table table-striped table-bordered">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-1" style="text-align: left"><spring:message code="wallet.id.label"/></th>
				                        	<th class="col-sm-2"><spring:message code="userName.label"/></th>
				                            <th class="col-sm-1"><spring:message code="mobile.num"/></th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                        	<th class="col-sm-1">Action</th>
				                         </tr>      	
				                             </thead>
				                             <tbody>
				                            <c:if test="${not empty customerWallets}"> 
											<c:forEach var="wallet" items="${customerWallets}" varStatus="theCount">
				                             <tr>
				                             <td>${theCount.count+index-1}</td>
				                             <td>${wallet.walletId}</td>
				                             <td>${wallet.customerName}</td>
				                             <td>${wallet.phoneNumber}</td>
				                             <td>${wallet.startdate}</td>
				                             <td>${wallet.enddate}</td>
				                             <c:if test="${wallet.status == 'true'}"> 
                                             <td>Active</td>
                                             </c:if>
                                             <c:if test="${wallet.status == 'false'}"> 
                                             <td>InActive</td>
                                             </c:if>
				                             <td> 	
				                             			                          
				                                <a style="color:#2e7ea7 !important;cursor: pointer;pointer-events:auto;" onclick="viewWalletsLedgers('${operation}','${walletId}','','${wallet.phoneNumber}','0')">View</a>
				                           <c:if test="${not empty  wallet.phoneNumber}">
                                            <a style="color:#2e7ea7" id="wallet" onclick="walletPopUp('${operation}','${walletId}','${wallet.phoneNumber}','${wallet.customerName}','${wallet.status}','0','');">Edit</a>				               
                                                        </c:if>
				                                                    
                               </td>
				                              </tr> 
				                             </c:forEach>
				                            </c:if> 
				                             </tbody>
                                    	</table>
                                    	
                                    	
                          <div class="row" style="pointer-events: auto;">
              	
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-4" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="editWalletForPagination('${walletId}','${totalValue}','${operation}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-4" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editWalletForPagination('${walletId}','${index - (maxRecords+1)}','${operation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-4" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-4" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return editWalletForPagination('${walletId}','${index - (maxRecords+1)}','${operation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="editWalletForPagination('${walletId}','${totalValue}','${operation}');">
              	</div> 
              	</c:if>
              	
              	<div class="form-group col-lg-2"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
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
              		  <input type="button" onclick="editWalletForPagination('${walletId}',document.getElementById('pagination').value,'${operation}');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>
                                    	

</body>
</html>