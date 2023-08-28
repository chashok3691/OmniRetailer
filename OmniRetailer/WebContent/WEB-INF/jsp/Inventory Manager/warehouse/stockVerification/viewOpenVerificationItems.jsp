<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="row" style="text-align: right; margin-top: 0px;">
 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-top:-59px">${err}</div>
 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;margin-top:-59px;font-weight: bold;">${success}</div>
      </div>   
				                    <div class="col-lg-12" style="padding: 10px 0px 10px 0px;margin-bottom: 10px">
                                         <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
				         			<table id="verifiedStocks" class="table table-bordered table-striped"> 
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="s.no.label" /></th>
                                            	<th><spring:message code="skuid.label" /></th>
                                            	<th><spring:message code="sku.desc.label" /></th>
                                                <th><spring:message code="openstock.label" /></th>
                                                
                                                <th><spring:message code="stock.in.label" /></th>
                                            	<th><spring:message code="stock.out.label" /></th>
                                                
<%--                                                 <th><spring:message code="saleqty.label" /></th> --%>
                                                <th><spring:message code="bookstock.label" /></th>
                                                <th><spring:message code="actualstock.label" /> </th>
                                               
                                                
                                                <th><spring:message code="dump.label" /></th>
                                                 <th>Stock Loss </th>
<%--                                                 <th><spring:message code="diff.label" /> </th> --%>
                                                <th><spring:message code="closestock.label" /></th>
                                                  <th><spring:message code="closestockcost.label" /></th>
                                                <th><spring:message code="losstype.label" /></th>
                                                
                                            </tr>
                                        </thead>
                                      
								<tbody style="text-align: center;">
                                         
                                        
                                           <c:forEach var="itemList" items="${productStockOpenVerificationDetailsList.itemsList}"  varStatus="theCount">
                                            <tr>
                                           	<td>${theCount.count+index-1}</td>
                                           	
                                           	<td>
                                           		${itemList.sku_id}
											
                                            </td>
                                            	<td>
                                           	${itemList.skuDescription}
                                            </td>
                                            
                                            	<td>${itemList.openStock}
											
                                            </td>
                                            
                                            <td>${itemList.stock_in_qty}</td>
                                            <td>
                                           ${itemList.saleQty}
                                            </td>
                                           <td>
                                           ${itemList.sku_book_stock} 
											</td>
											
											<td>${itemList.sku_physical_stock}
                                            </td>
											   
											 <%--   <td>
                                           	${itemList.declaredQty}
											</td> --%>
											<td>
                                           	${itemList.dumpQty}
											</td>
											<td>
                                           	${itemList.stockLossQty}
											</td>
											
											
<%--                                            <c:if test="${not empty itemList.stockLossQty }"> --%>
<%--                                             <td>${itemList.stockLossQty} </td> --%>
                                           <%--  </c:if>
                                            <c:if test="${empty itemList.stockLossQty }">
                                            <td >0.0</td>
                                            </c:if> --%>
                                              <td>
                                           	${itemList.closedStock} 
											</td>
                                          <td>
                                           	${itemList.closedStockCost} 
											</td>
                                            
                                            <td>
                                           ${itemList.loss_type}  
                                            </td>

                                   </tr>
                                            </c:forEach>
                                           
                                            </tbody>
                                         
                                           </table>  
                                             </div>
                                             </div>
                                             
                                             </div><!-- verificationchilds -->


  <div class="row">
                  
                 <div class="row" style="padding-left:12px;padding-right:12px">
                  
                  
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockVerificationOpenForPagination('outletStockVerificationReport','${totalValue}','outlet','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','${verifiedUptoStr}','${zone}','${location}','view','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockVerificationOpenForPagination('outletStockVerificationReport','${index - (maxRecords + 1)}','outlet','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','${verifiedUptoStr}','${zone}','${location}','view','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockVerificationOpenForPagination('outletStockVerificationReport','${index - (maxRecords + 1)}','outlet','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','${verifiedUptoStr}','${zone}','${location}','view','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockVerificationOpenForPagination('','${totalValue}','outlet','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','${verifiedUptoStr}','${zone}','${location}','view','')">
              	</div> 
              	</c:if>
              	
              	
                  
                  
                  <div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
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
              		  <input type="button" onclick="viewStockVerificationOpenForPagination('outletStockVerificationReport',document.getElementById('pagination').value,'outlet','','${verificationCode}','${status}','${verified_by}','${startTimeStr}','${endTimeStr}','${verifiedOnStr}','${verifiedUptoStr}','${zone}','${location}','view','');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div>
            </div>
                 
                  
</body>
</html>