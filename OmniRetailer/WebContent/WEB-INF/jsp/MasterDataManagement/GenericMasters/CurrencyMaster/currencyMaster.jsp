<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/currencyMaster.jsp
 * file type		        : JSP
 * description				: The currency details table is displayed using this jsp
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
      
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/currencyMaster.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin:3px 0px 2px;
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

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.searchbutton
{
    margin-right: 15px;
}
</style>       
<script type="text/javascript">
$(document).ready(function(){
/* var err = $("#err").val();
if(err != "")
  alert(err);
$("#searchCurrency").val($("#currency").val());
//if($("#searchCurrency").val().trim()!="")
	$("#searchCurrency").focus(); */
	$('#mySearch').click(function(){
	      var search = $('#searchCurrency').val();
	      return searchCurrencyMaster(search,'','0');
	  })
	  
	  
	  
	   $('#searchCurrency').keyup(function(e){
	  	 
	      if(e.which == 13){//Enter key pressed
	          $('#mySearch').click();//Trigger search button click event
	      }
	       else if(e.which == 8){ //backspace key pressed
	      	 if($('#searchCurrency').val()=="")
	      	 $('#mySearch').click();//Trigger search 
	      }
	     });


	});
	
</script> 
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="currency.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
           <div class="box-header">
               <h3  class="box-title"><spring:message code="allCurrency.label" /></h3>
           </div><!-- /.box-header -->
         <div class="box-body table-responsive">
          <div class="row">
            <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewCurrencyMaster('currencyMaster','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
           <div class="col-lg-9" style="padding-left: 11px">
      	 	<%-- <input type="text"  class="form-control searchItems searchBar" style="" value="" id="searchCurrency" placeholder="<spring:message code="search.currency.label" />" />
				<div class="services">
	    			<div class="items">
	     				<ul class="matchedStringUl currencyMaster" style=""></ul>
	   				</div>
				</div> --%>
				
					<input type="text"  class="form-control" value="${searchName}" id="searchCurrency" placeholder="<spring:message code="search.currency.label" />" />
                     <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
				
				<input type="hidden" id="currency" value="${searchName}">
      	 	</div>
         <%-- <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         <c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true}}"> --%>
	          <c:if test="${sessionScope.role == 'super admin'}"> 
	          	<!-- <div class="col-lg-2" style="margin-top: 3px;padding-left: 0px;">
					<div class="buttons" style=""> -->
					
					
					   <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newCurrency();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('currency');" value="<spring:message code="delete.label" />">
								           </div>
					  	<%-- <a onclick="return newCurrency();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
					    <a onclick="return validate('currency');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
					<!-- </div>
				</div> -->
	          </c:if>
	    <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
              <c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true}">  		
	               <%-- <div class="col-lg-2" style="margin-top: 3px;padding-left: 0px;">
					<div class="buttons" style="">
					  	<a onclick="return newCurrency();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
					    <a onclick="return validate('currency');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a>
					</div>
				</div> --%>
				<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newCurrency();" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return validate('currency');" value="<spring:message code="delete.label" />">
								           </div>
			</c:if>
		</c:forEach>
              	 <table id="example1" class="table table-bordered table-striped" style="margin-left: 10px; width: 98.2%;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                       <tr>
                       <c:if test="${sessionScope.role == 'super admin'}"> 
                       		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                       </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         				<c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true}"> 
                       	   		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                       	   	</c:if>
                       	</c:forEach>
                       	  <th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 98px;">
<div style="">SL No.</div></th>
                       	   <th><spring:message code="base.currency.label" /></th>
                           <th><spring:message code="country.name.label" /></th>
                           <th><spring:message code="currency.code.label" /></th>
                           <th><spring:message code="conversion.ratio.label" /></th>
                           <th><spring:message code="EmployeeForm.action" /></th>
                       </tr>
                   </thead>
                   <tbody style="text-align: center;">
                   	<c:forEach var="currency" items="${currencyDetails}" varStatus="theCount">
                       <tr>
                       <c:if test="${sessionScope.role == 'super admin'}"> 
                       		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${currency.countryName}' /></td>
                       </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         				<c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true}"> 
                       			<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${currency.countryName}' /></td>
                       		</c:if>
                       	</c:forEach>
                       		<td>${theCount.index + index}</td>
                       	   <td>${currency.baseCurrency}</td>
                           <td>${currency.countryName}</td>
                           <td>${currency.currencyCode}</td>
                           <td>${currency.conversionRatio}</td>
                           <td>
                           	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCurrency('${currency.countryName}','view')">View</a>&nbsp;&nbsp;&nbsp;
                           	<c:if test="${sessionScope.role == 'super admin'}"> 
                           		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCurrency('${currency.countryName}','edit')">Edit</a>
                           	</c:if>
                           	 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         					<c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true}"> 
                           			<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditCurrency('${currency.countryName}','edit')">Edit</a>
                           		</c:if>
                           	</c:forEach>
                           </td> 
						</tr>
                       </c:forEach> 
                   </tbody>
               </table>
         </div>
          <%--   <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCurrencyMaster('currencyMaster','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCurrencyMaster('currencyMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCurrencyMaster('currencyMaster','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCurrencyMaster('currencyMaster','${totalValue}')">
              	</div> 
              	</c:if>
              </div>
             --%>  
             
              <div class="row">
        
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} -  ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCurrencyMaster('currencyMaster','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCurrencyMaster('currencyMaster','${index - maxRecords+1}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCurrencyMaster('currencyMaster','${index - maxRecords-1}');"> ${index} -  ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCurrencyMaster('currencyMaster','${index+maxRecords-1}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewCurrencyMaster('currencyMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="currency.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>