   
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                          
                <input type="hidden" value="${mode}" id="type" name="type"/>
  <div class="table-responsive">
             <table id="skusList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
					 <th><spring:message code="report.sno.label" /></th>               
                 	 <th><spring:message code="skuid.label" /></th>
                     <th><spring:message code="product.description.label" /></th>
                     <th><spring:message code="ean.label"/></th>
                     <th><spring:message code="colour.label"/></th>
                     <th><spring:message code="size.label"/></th>
                     <th><spring:message code="range.label"/></th>
                     <th><spring:message code="newarrival.product.status"/></th>
                	 <c:choose>
                	<c:when test="${isProductGroup == true}"></c:when>
                	
                
                	
                <c:otherwise>
             </c:otherwise>
             </c:choose>
             
             <th id="skuAdd" style="display:none;"><spring:message code="action.label"/><img id='Img' src="${pageContext.request.contextPath}/images/cancel.png" style="width:25px;cursor:pointer;" onclick="deleteAll();"/></th>
             
             
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 	
 			 
 			
 			 <c:forEach var="stockDetails" items="${itemsList}" varStatus="theCount">
 			 <tr id="dynamicdiv${theCount.count}">
 			 <td>${theCount.count + index-1}</td>
 			 <td>${stockDetails.skuId}</td>
 			 
 			 <c:choose>
 			 <c:when test="${empty stockDetails.skuDescription}"> 
 			 <td>${stockDetails.description}</td>
 			 </c:when>
 			 <c:otherwise>
 			 <td>${stockDetails.skuDescription}</td>
 			 </c:otherwise>
 			 </c:choose>
 			 <td>${stockDetails.ean}</td>
 			 <td>${stockDetails.color}</td>
 			 <td>${stockDetails.size}</td>
 			 <td>${stockDetails.measureRange}</td>
<%--  			 <td>${stockDetails.status}</td> --%>
 			  <c:set var = "skuStatus" value = "${fn:toUpperCase(stockDetails.status)}" />
 			 
 			 <c:choose>
 			 <c:when test="${stockDetails.status eq 'true'}">
 			 <td>Active</td>
 			 </c:when>
 			 <c:when test="${stockDetails.status eq 'false'}">
 			 <td>InActive</td>
 			 </c:when>
 			
 			 <c:when test="${skuStatus eq 'ACTIVE'}">
 			 <td>Active</td>
 			 </c:when>
 			 
 			 <c:when test="${skuStatus eq 'INACTIVE'}">
 			 <td>InActive</td>
 			 </c:when>
 			 
 			 
 			 <c:otherwise>
 			  <td>${stockDetails.status}</td>
 			 </c:otherwise>
 			 </c:choose>
 			
 			 <tr>
 			 
 			 </c:forEach> 

 			</tbody>
           </table>
           
<%--            <c:set var ="index" value="${index+1}"/> --%>
           
<%--            index ${index}  totalRecords ${totalRecords} totalValue ${totalRecords} maxRecords ${maxRecords}  --%>
            
             <div class="row" id="paginationForList" >
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-3">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index-1 + maxRecords} of ${totalRecords}
              		<input type="button" class='paginationButton' value="&#62;" onclick="standardProductGroupFilter('${index-1+maxRecords}','new','${mode}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-3">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return standardProductGroupFilter('${index-1- maxRecords}','new','${mode}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-3" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              
              	</c:if>
              	
              	
              	<c:if test="${index-1 != 0 &&  totalValue < totalRecords}">
              		<div class="form-group col-lg-3">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return standardProductGroupFilter('${index-1 - maxRecords}','new','${mode}');"> ${index} - ${index-1+maxRecords} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="standardProductGroupFilter('${index-1+maxRecords}','new','${mode}')">
              	</div> 
              	</c:if>
              	
              	
              	
              	
              	
              	<div class="form-group col-lg-3"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
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
              		  <input type="button" onclick="standardProductGroupFilter(document.getElementById('pagination').value,'new','${mode}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>    
        
           
           <br>
         </div>
         
         
       
         
      
       
       
       
       
       



</body>
</html>