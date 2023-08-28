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
<div class="table-responsive">
                <table id="productsList" class="table table-bordered table-hover">
                  <thead style="background-color: #3c8dbc; color: #ffffff">
                    <tr>
                    	<th><spring:message code="s.no.label"/></th>
                    	<th><spring:message code="item.name.label"/></th>
                        <th><spring:message code="item.desc.label"/></th>
                        <th><spring:message code="reason.for.return.label"/></th>
                        <th><spring:message code="uom.label"/></th>
                        <th><spring:message code="quantity.label"/></th>
                        <th><spring:message code="price.label"/></th>
                        <th><spring:message code="value.label"/></th>
                        <th><spring:message code="comments.label"/></th>
                        <th><spring:message code="action.label"/></th>
                    </tr>
                  </thead>
                  <tbody style="text-align: center;">
                  	 <c:forEach var="item" items="${stockIssueDetails.itemDetails}" varStatus="theCount">
                        <tr id=dynamicdiv${theCount.count}>
                        	<td id="sno${theCount.count}">${theCount.count}</td>
							<td id="Name${theCount.count}" >${item.item}<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" /></td>
							<td id="Desc${theCount.count}" >${item.description}</td>
							<td id="Reason${theCount.count}"><textarea rows="1" id="ReturnReason${theCount.count}"></textarea></td>
							<td id="UOM${theCount.count}" >${item.uOM}</td>
							<td class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Pack${theCount.count}" >${item.recieved}</td>
							<td class='Price' id="Price${theCount.count}" >${item.price}</td>
							<td id="Cost${theCount.count}" >${item.cost}</td>
							<td id="Comments${theCount.count}"><textarea rows="1" id="CommentsText${theCount.count}"></textarea></td>
							<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
   						</tr>
						  
 						</c:forEach> 
                  </tbody>
               </table>
            </div>
</body>
</html>