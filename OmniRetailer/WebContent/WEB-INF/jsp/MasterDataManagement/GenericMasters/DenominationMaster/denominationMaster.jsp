<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/denominationMaster.jsp
 * file type		        : JSP
 * description				: The  denomination details table is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/denominationMaster.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
    margin-right:2px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

</style> 
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchZone").val($("#zone").val());
//if($("#searchSKU").val().trim()!="")
	$("#searchZone").focus();
});
</script>     
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="masters.label" />
     <small><spring:message code="sku.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="masters.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
   		  <div class="box-header" align="center">
              <h3 class="box-title"><spring:message code="all.denomination.label" /></h3>
          </div><!-- /.box-header -->
                      <div class="box-body table-responsive">
                          <div class="row">
		                <div class="col-lg-10">
	        	 		<%--  <input type="text"  class="form-control searchItems" style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="" id="searchDenomination" placeholder="<spring:message code="search.denomination.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl DenominationMaster" style=""></ul>
				   				</div>
							</div> --%>
							<input type="hidden" id="denomination" value="${searchName}">
	        	 		</div>
		               <c:if test="${sessionScope.role == 'super admin'}">
		               
		               		
		               	
		               		 <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newDenomination('denomination');" value="<spring:message code="addnew.label" />">
								           </div>
								          <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('denomination');" value="<spring:message code="delete.label" />">
								           </div> 
		               		
		               		
							       <%--  <a onclick="return newDenomination('denomination');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('denomination');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
							
					
		               </c:if>
                     <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          <c:if test="${accessControl.appDocument == 'DenominationMaster' && accessControl.write == true}"> 
                         
						
							  	 <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newDenomination('denominationMaster');" value="<spring:message code="addnew.label" />">
								           </div>
								            <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('denomination');" value="<spring:message code="delete.label" />">
								           </div>
							  
							<%--
							        <a onclick="return newDenomination('denomination')" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
							        <a onclick="return validate('denomination');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
						
						 </div> --%>
						 </c:if>
					</c:forEach>
					</div>
                          <table id="example1" class="table table-bordered table-striped" style="">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                              </c:if>
                              <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          		<c:if test="${accessControl.appDocument == 'DenominationMaster' && accessControl.write == true}"> 
                             		<th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	</c:if>
                             </c:forEach>
                             	 <th style="border-left: 4px solid #fff"><div style=""><spring:message code="sl.no.label" /></div></th>
                                 <th style="border-left: 4px solid #fff"><spring:message code="denomination.name.label" /></th>
                                 <th style=" border-left: 4px solid #fff"><spring:message code="denomination.value.label" /></th>
                                 <th style="border-left: 4px solid #fff"><spring:message code="denomination.type.label" /></th>
                                  <th style="border-left: 4px solid #fff"><spring:message code="status.label" /></th>
                                 <th style=" border-left: 4px solid #fff"><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                          <c:forEach var="denomination" items="${denominationMasterList}" varStatus="loop">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${denomination.denominationName}' /></td>
                              </c:if>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                          		<c:if test="${accessControl.appDocument == 'DenominationMaster' && accessControl.write == true}"> 
                             		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${denomination.denominationName}' /></td>
                             	</c:if>
                            </c:forEach>
                            	 <td>${loop.count-1+index}</td>
                                 <td>${denomination.denominationName}</td>
                                 <td>${denomination.denominationValue}</td>
                                 
                                  <td>
                                
                                 <c:choose>
                                 <c:when test="${denomination.denominationType=='1'}">
                                  <spring:message code="denomination.note.label" />
                                 </c:when>
                                  
                                  <c:when test="${denomination.denominationType=='0'}">
                                  <spring:message code="denomination.coin.label" />
                                 </c:when>
                                 
                                 </c:choose>
                                  </td>
                                  
                                  <td>
                                  <c:choose>
                                   <c:when test="${denomination.denominationStatus==true}">
                                   <spring:message code="active.label" />
                                   </c:when>
                                  <c:when test="${denomination.denominationStatus==false}">
                                   <spring:message code="inActive.label" />
                                  </c:when>
                                  </c:choose>
                                   </td>
                                  
                                 
                                 <td>
                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditDenomination('${denomination.denominationValue}','${denomination.denominationType}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                  	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditDenomination('${denomination.denominationValue}','${denomination.denominationType}','edit')">Edit</a>
                                  </c:if>
                                   <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                         			 <c:if test="${accessControl.appDocument == 'DenominationMaster' && accessControl.write == true}"> 
                                 		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditDenomination('${denomination.denominationValue}','${denomination.denominationType}','edit')">Edit</a>
                                 	</c:if>
                                 </c:forEach>
                                 </td> 
 							</tr>
                             </c:forEach>
                         </tbody>
                     </table>
                       <br>
                <div class="row" id="pagination">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewDenominationMaster('denominationMaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewDenominationMaster('denominationMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewDenominationMaster('denominationMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewDenominationMaster('denominationMaster','${totalValue}')">
              	</div> 
              	</c:if>
              </div>
                 </div><!-- /.box-body -->
             </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="Denomination"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>