<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Swathi
 * file name		        : CRM/LoyaltyPrograms/Wallets/wallets.jsp
 * file type		        : JSP
 * description				: To display the Wallets details by using this jsp.
 * */ -->
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
          	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/wallets.js"></script>
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
	debugger;
	
	callCalender("startDate");
	callCalender("endDate");
	 debugger
	$("#searchWallets").val($("#searchname").val());
		$("#searchWallets").focus();  
	$('#searchWallet').on('input',function(e){
		if($(this).val().trim()==""){
			viewWallets('wallet','Wallet','0','menu');
		}
	});
	
	 $('#mySearch').click(function(){
	        var search = $('#searchWallets').val();
	        return viewWallets('wallet','Wallet','0','menu');
	    });
	 
	    $('#searchWallets').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });	
	
});
</script>  
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                                <div class="box-header" align="center">
                                    <h3 class="box-title"><spring:message code="loyalty.wallets.label" /></h3>
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
                      
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                  		<label><spring:message code="wallets.status.label"/></label>
                  		<select class="form-control" id="WalletStatusList">
                  					<option value="" ${WalletStatusList == '' ? 'selected' : ''}><spring:message code="ALL.label"/></option>
                           		 <option value="ACTIVE"${WalletStatusList == 'ACTIVE' ? 'selected' : ''}><spring:message code="active.label"/></option>
                           		  <option value="INACTIVE"${WalletStatusList == 'INACTIVE' ? 'selected' : ''}><spring:message code="disable.label"/></option>
						 	
	                        </select>
                      </div>
                      </div>
                      
                     <div class="col-lg1-2 col-lg-2">
                     
                      </div>
                  	
                  		
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="Wallets.startdate.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
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
							                        <c:when test="${location.description == '' || location.description == null}">
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
                      
                       <div class="col-lg1-2 col-lg-3 form-group">
                     
                      </div>
                       <div class="col-lg1-2 col-lg-3 form-group">
                     
                      </div>
                      
                        <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="Wallets.enddate.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                    <div class="col-lg-12" style="    border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                     <div class="row">
                       <a onclick="viewWallets('wallet','Wallet','0','menu');" class="btn bg-olive btn-inline" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;"><spring:message code="searchbutton.label"/></a>
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
                    <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;margin-bottom: 2px;">           
                         
                          <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewWallets('wallet','Wallet','0','menu');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
				                      
				
                              
				         <div class="col-lg-10 col-xs-10" style="padding-left:0px;padding-right:0px">
										<input type="text"  class="form-control searchItems" value="${searchCriteria}" id="searchWallet"  placeholder="Search Wallets here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchWalletItems" style=""></ul>
						   						</div>
											</div>
									</div>
								   	
                              
                              
                              
                              
                              
                           <c:if test="${sessionScope.role == 'super admin'}"> 
                           <div class="col-lg-1" style="">
							
		  				        <a onclick="return newWallets('wallet','Wallet','0','menu');" class="btn bg-olive btn-inline  addBtn"><spring:message code="new.label" /></a><%-- &nbsp;&nbsp;&nbsp;
		   			                   <a onclick="return validate('giftVouchers');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
		   			                
		   			                  
									 </div>
                                 </c:if>
                         
                          <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
	                            	<c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true}"> 
                                   <div class="col-lg-1" style="">
									
		  				               <a onclick="return newWallets('wallet','Wallet','0','menu');" class="btn bg-olive btn-inline  addBtn"><spring:message code="new.label" /></a><%-- &nbsp;&nbsp;&nbsp;
		   			                   <a onclick="return validate('giftVouchers');" class="button"><font size="2px"><spring:message code="delete.label" /></font></a> --%>
									
									
									
									 </div>
									 </c:if>
								</c:forEach>
						</div>		
					</div>	
					
					 <table id="example1" class="table table-bordered table-striped" style="">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            
                                              <th><div><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="program.name" /></th>
                                                <th style="text-align: left;"><spring:message code="noof.wallets" /></th>
                                               <%--  <th><spring:message code="voucher.type.label" /></th> --%>
                                                 <th><spring:message code="signup.cash" /></th>
                                                <th><spring:message code="created.date.label" /></th>
                                                 <th><spring:message code="startdate.label" /></th>
                                                 <th><spring:message code="expirydate.label" /></th>
                                                  <th><spring:message code="opening.bal.label" /></th>
                                                  <th><spring:message code="closing.bal.label" /></th>
                                                  <%-- <th><spring:message code="total.nos.label" /></th> --%>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                      <tbody style="text-align: center;">
                              <c:forEach var="wallet" items="${walletList}" varStatus="theCount">	
                                            <tr>
                                           
                                            	<td>${theCount.count}</td>
                                                <td>${wallet.walletProgramName}</td>
                                                <td>${wallet.totalWallets}</td>
                                                <td>${wallet.signupCash}</td> 
                                                <td>${wallet.createdDateStr}</td>
                                               <td>${wallet.startDateStr}</td>
                                               <td>${wallet.endDateStr}</td>
                                                <td>${wallet.minBillAmount}</td>
                                                <td>${wallet.maxBillAmt}</td>
                                               
                                       			<c:if test="${wallet.status == 'true'}"> 
                                                <td>Active</td>
                                                </c:if>
                                                <c:if test="${wallet.status == 'false'}"> 
                                                <td>Suspended</td>
                                                </c:if>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWallet('${wallet.walletProgramId}','view','0')">View</a>&nbsp;&nbsp;&nbsp;
                                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditWallet('${wallet.walletProgramId}','edit','0')">Edit</a>
                                                                    
                                                </td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    <br>
                                    
                                    <input type="hidden" value="${totalRecords}">
                                     <input type="hidden" value="${totalValue}">
                                    
                                    
                                    
                                            <div class="row">
              	<%-- <div class="form-group col-lg-4">
              		<spring:message code="totalRecords.label" /> : <span id="totalRecords">${totalRecords}</span>
              	</div> --%>
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;"    	onclick="viewWallets('Wallets','Wallet','${totalValue}','menu');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"     onclick=" return viewWallets('Wallets','Wallet','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		
              		
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWallets('Wallets','Wallet','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWallets('Wallets','Wallet','${totalValue}','menu');">
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
              		  <input type="button" onclick="viewWallets('Wallets','Wallet',document.getElementById('pagination').value,'menu');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              	
              </div>
					
</div>
</section>
</body>
</html>