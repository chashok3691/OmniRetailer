<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<title></title>
</head>
<body>

           <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;min-height: 200px;">
                     <table id="productStoragestocks" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                     <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                                <th>Storage ref</th>
                                <th>SKU ID</th>
                             	<th>Description</th>
                             	<th >EAN/Scan Code</th>
                             	<th >Open Qty</th>
                             	<th >Required Qty</th>
                             	<th >Picked Qty</th>
                             	<th >Dif Qty</th>
                               <th >Closed Qty</th> 
                                <th>Damaged Qty</th>
                                <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="genaratedPicklist" items="${updateDtos}"  varStatus="theCount">
                         <tr id="dynamicdiv${theCount.count}">
                         <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${theCount.count}" /></td>
                         
                          <td class="slNo" id="itemno${theCount.count}">${theCount.count}</td>
                          
                           <td><select autofocus style='width:180px' class='storageRefence'  id='storageRef${theCount.count}' onchange="assignquantity('${theCount.count}')">
                  								   <c:forEach var="StorageRefNumber" items="${genaratedPicklist.storageSystemDetails}" >
                  									<option value="${StorageRefNumber.storageSystemId}-${StorageRefNumber.quantityFl}">${StorageRefNumber.storageSystemId}</option>
                  								</c:forEach>
                  								</select></td>
                           
                            <td id="skuID${theCount.count}">${genaratedPicklist.skuID}</td>
                             <td id="itemName${theCount.count}">${genaratedPicklist.itemname}</td>
                              <td id="scanCode${theCount.count}" contenteditable="true" ></td>
                               <td > <select autofocus style='width:180px' class='storageRefence'  id='storageRefQty${theCount.count}' disabled="disabled">
                  								   <c:forEach var="StorageRefNumber" items="${genaratedPicklist.storageSystemDetails}">
                  									<option value="${StorageRefNumber.quantityFl}">${StorageRefNumber.quantityFl}</option>
                  								</c:forEach>
                  								</select>
                               
                                </td>
                                <td id="requiredQty${theCount.count}" >${genaratedPicklist.pickListQty}</td>
                                 <td id="picklistQty${theCount.count}" contenteditable="true" onblur="changeQuantities('${theCount.count}')">${genaratedPicklist.pickListQty}</td>
                                  <td id="diffQty${theCount.count}">0</td>
                                   <td id="closedQty${theCount.count}">0</td>
                                    <td id="damagedQty${theCount.count}" contenteditable="true" onblur="changeQuantities('${theCount.count}')">0</td>
                                    <input type="hidden" id="plucode${theCount.count}" value="${genaratedPicklist.pluCode}">
                                     <td id="Del${theCount.count}"><img id="Img${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20%;cursor:pointer;" onclick="deleteItem(this);" title="Delete ${genaratedPicklist.skuID}"/></td>

                           </tr>
                           </c:forEach>
                         </tbody>
                     </table>
                     </div>

</body>
</html>