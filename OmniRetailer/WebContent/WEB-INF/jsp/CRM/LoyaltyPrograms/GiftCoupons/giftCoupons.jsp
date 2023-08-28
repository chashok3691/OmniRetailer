<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/GiftCoupons.jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>
         
<style type="text/css">

.col-lg1-2{
    width: 25% !important;
}

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

</style>     
<script type="text/javascript">
$(document).ready(function(){
	
	callCalender("couponStartDate");
	callCalender("couponEndDate");
	  $("#searchCoupons").val($("#searchname").val());
		$("#searchCoupons").focus();  
	$('#searchCoupons').on('input',function(e){
		if($(this).val().trim()==""){
			viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');
		}
	});
	
	
	 $('#mySearch').click(function(){
	        var search = $('#searchCoupons').val();
	        return viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');
	    })
	    $('#searchCoupons').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });	
	
	
var err = $("#err").val();
if(err != "")
  alert(err);
  
  
//	Added to fetch the locations based on zone 
/* var zone = $("#outletZone").val();
if( zone != null && zone !="")
	 {
	 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
	 }
	 */
  
});
</script>  
</head>
<body>
 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="loyaltyprogram.label" />
     <small><spring:message code="giftCoupons.label" /></small>
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
                                    <h3 class="box-title"><spring:message code="allGiftCoupons.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                
                                
                                 <div class="col-lg-11" style=" background: #f4f4f4;    padding: 4px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                     <div class="col-lg1-2 col-lg-3 form-group">
                       
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                     
                      </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="couponStartDate" size="20" type="text" onfocus="callCalender('couponStartDate')" onclick="callCalender('couponStartDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                             <c:forEach var="location" items="${locationsList}">
	                             <c:choose>
							                        <c:when test="${location.description == ''}">
							                          <option value="${location.locationId}" ${location.locationId == searchlocation ? 'selected' : ''}>${location.locationId}</option>
							                       </c:when>
							                        <c:otherwise>
							                          <option value="${location.locationId}" ${location.locationId == searchlocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                        </c:otherwise>
							                      </c:choose>
<%-- 							          <option value="${location}" ${location == storeLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					         </c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                 
                      </div>
                      
                       <div class="col-lg1-2 col-lg-3 form-group">
                     
                      </div>
                    
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="couponEndDate" size="20" type="text" onfocus="callCalender('couponEndDate')" onclick="callCalender('couponEndDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                    <div class="col-lg-12" style="    border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                     <div class="row">
                       <a onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');" class="btn bg-olive btn-inline" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;"><spring:message code="searchbutton.label"/></a>
                     </div>
                     <div class="row">
                       <a onclick="resetForm();" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                     </div>
                   </div>
                 </div>
                 
                  <div class="col-lg-12" style="">   
                 <br>
                 </div>
                 
                 <div class="row">
                    <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">           
                         
                          <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
                         
                         
                          <div class="col-lg-10 col-xs-10" style="padding-left:0px;padding-right:0px">
                           <div class="wrapper">	 
                               <input type="text"  class="form-control" style="" value="${searchName}" id="searchCoupons" placeholder="<spring:message code="searchByCoupon.label" />" />
							   <button id="mySearch" class="searchbutton"></button>
							</div>
						 <input type="hidden" id="searchname" value="${searchName}">
                    </div>
                              
                           <c:if test="${sessionScope.role == 'super admin'}"> 
                           <div class="col-lg-1" style="">
							<div class="buttons" style="">
		  				        <a onclick="return viewNewGiftCoupons('loyalitycoupons');" class="btn bg-olive btn-inline  addBtn"><spring:message code="addnew.label" /></a><%-- &nbsp;&nbsp;&nbsp;
		   			                   <a onclick="return validate('giftVouchers');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
									 </div>
									 </div>
                                 </c:if>
                                <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
	                            	<c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true}"> 
                                   <div class="col-lg-1" style="">
									 <div class="buttons" style="">
		  				               <a onclick="return viewNewGiftCoupons('loyalitycoupons');" class="btn bg-olive btn-inline  addBtn"><spring:message code="addnew.label" /></a><%-- &nbsp;&nbsp;&nbsp;
		   			                   <a onclick="return validate('giftVouchers');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
									 </div>
									 </div>
									 </c:if>
								</c:forEach>
						</div>		
					</div>			
								
                                    <table id="example1" class="table table-bordered table-striped" style="margin-top: 0px !important;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<!-- <th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> -->
                                               <th><div><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="promo.code.label" /></th>
                                                <th><spring:message code="promo.name.label" /></th>
                                               <%--  <th><spring:message code="voucher.type.label" /></th> --%>
                                                <th><spring:message code="created.date.label" /></th>
                                                 <th>Coupon Type</th>
                                                 <th><spring:message code="coupon.value.label" /></th>
                                                  <th><spring:message code="no.of.coupons.label" /></th>
                                                <th><spring:message code="loyalty.status.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="giftCoupon" items="${giftCouponsList}" varStatus="theCount">
                                            <tr>
                                            	<!-- <td><input type="checkbox" name="selectall" 
                                            	class="selectableCheckbox" id="selectall" value=${giftCoupon.couponProgramCode} /></td> -->
                                                <td>${theCount.count+index-1}</td>
                                                <td>${giftCoupon.couponProgramCode}</td>
                                                <td>${giftCoupon.promoName}</td>
                                                <td>${giftCoupon.createdOnStr}</td>
                                                <td>${giftCoupon.discountType}</td>
                                                <td>${giftCoupon.unitCashValue}</td>
                                                <td>${giftCoupon.quantity}</td>
                                                <td>${giftCoupon.status}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewGiftCouponDetails('${giftCoupon.couponProgramCode}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewGiftCouponDetails('${giftCoupon.couponProgramCode}','edit')">Edit</a></td>
                                                 
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                      <br>
             <div class="row">
              	<%-- <div class="form-group col-lg-4">
              		<spring:message code="totalRecords.label" /> : <span id="totalRecords">${totalRecords}</span>
              	</div> --%>
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewGiftCoupons('giftCoupons','GiftCoupons','${totalValue}','menu')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGiftCoupons('giftCoupons','GiftCoupons','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewGiftCoupons('giftCoupons','GiftCoupons','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewGiftCoupons('giftCoupons','GiftCoupons','${totalValue}','menu')">
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
              		  <input type="button" onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons',document.getElementById('pagination').value,'menu')" class="btn bg-olive btn-inline  addBtn" value="GO">
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
             //   $("#example1").dataTable();
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