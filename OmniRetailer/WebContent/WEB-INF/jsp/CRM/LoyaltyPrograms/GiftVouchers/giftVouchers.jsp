<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/loyaltyCards.jsp
 * file type		        : JSP
 * description				: The loyalty card details table is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%; */
	margin-top:1%;
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
.box-header {
	text-align: center;
}
.box-title {
	border: 1px solid #cccc;
    padding: 4px 12px;
}
</style>     
<script type="text/javascript">
$(document).ready(function(){
var err = $("#err").val();
if(err != "")
  alert(err);
});
</script>  
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="loyaltyprogram.label" />
     <small><spring:message code="giftvouchers.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showLoyaltyFlow();"><spring:message code="loyaltyprogram.label" /></a></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
          <div class="box-header" >
              <h3 class="box-title"><spring:message code="giftVouchers.summary.label" /></h3>
          </div><!-- /.box-header -->
                               <div class="box-body table-responsive">
                                <c:if test="${sessionScope.role == 'super admin'}"> 
                                <div class="col-lg-1 col-xs-2" style="padding-left:0px;">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
                                <div class="col-lg-10 col-xs-9"></div>
                                <div class="col-lg-1" style="padding-right: 3px;">
								 <div class="buttons" style="">
	  				               <input type="button" onclick="return viewNewGiftVoucher();" class="btn bg-olive btn-inline addBtn" value="<spring:message code="addnew.label" />"><%-- &nbsp;&nbsp;&nbsp;
	   			                   <a onclick="return validate('giftVouchers');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
								 </div>
                               	</div>
                                </c:if>
							<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                            	<c:if test="${accessControl.appDocument == 'GiftVoucher' && accessControl.write == true}"> 
                                 <div class="col-lg-1 col-xs-2" style="padding-left:0px;">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewGiftVouchers('giftvoucher','GiftVoucher','0','menu');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
                                <div class="col-lg-10 col-xs-9"></div>
                                <div class="col-lg-1" style="padding-right: 3px;">
								 <div class="buttons" style="">
	  				               <input type="button" onclick="return viewNewGiftVoucher();" class="btn bg-olive btn-inline addBtn" value="<spring:message code="addnew.label" />"><%-- &nbsp;&nbsp;&nbsp;
	   			                   <a onclick="return validate('giftVouchers');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
								 </div>
                               	</div>
                               	</c:if>
                               </c:forEach>
                                    <table id="example1" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<!-- <th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> -->
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="promo.code.label" /></th>
                                                <th><spring:message code="promo.name.label" /></th>
                                                 <th><spring:message code="unit.cash.value.label" /></th>
                                                <th><spring:message code="no.of.vouchers.label" /></th>
                                                 <th><spring:message code="created.date.label" /></th>
                                                 <th><spring:message code="grn.expiredDateStr.label" /></th>
                                                <th><spring:message code="loyalty.status.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="giftVoucher" items="${giftVouchersList}" varStatus = "theCount">
                                            <tr>
                                            	<!-- <td><input type="checkbox" name="selectall" 
                                            	class="selectableCheckbox" id="selectall" value=${giftVoucher.voucherProgramCode} /></td> -->
                                                 <td>${theCount.count+index-1}</td>
                                                <td>${giftVoucher.voucherProgramCode}</td>
                                                <td>${giftVoucher.promoName}</td>
                                                <td>${giftVoucher.unitCashValue}</td>
                                                <td>${giftVoucher.quantity}</td>
                                                <td>${giftVoucher.createdOnStr}</td>
                                                <td>${giftVoucher.expiryDateStr}</td>
                                                <td>${giftVoucher.status}</td>
                                                <td>
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewGiftVoucherDetails('${giftVoucher.voucherProgramCode}','view')">View</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewGiftVoucherDetails('${giftVoucher.voucherProgramCode}','edit')">Edit</a>
                     
                                                </td> 
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
        <%--        <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','${totalValue}','menu')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGiftVouchers('giftVouchers','GiftVoucher','${index - 11}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGiftVouchers('giftVouchers','GiftVoucher','${index - 11}','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','${totalValue}','menu')">
              	</div> 
              	</c:if>
              </div>
         --%>     
         
         
          <div class="row">
              	<%-- <div class="form-group col-lg-4">
              		<spring:message code="totalRecords.label" /> : <span id="totalRecords">${totalRecords}</span>
              	</div> --%>
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','${totalValue}','menu')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGiftVouchers('giftVouchers','GiftVoucher','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGiftVouchers('giftVouchers','GiftVoucher','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','${totalValue}','menu')">
              	</div> 
              	</c:if>
              	
              	<div class="form-group col-lg-4"></div>
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
              		  <input type="button" onclick="viewGiftVouchers('giftVouchers','GiftVoucher',document.getElementById('pagination').value,'menu')" class="btn bg-olive btn-inline  addBtn" value="GO">
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
              //  $("#example1").dataTable();
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
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="product.label" />"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>