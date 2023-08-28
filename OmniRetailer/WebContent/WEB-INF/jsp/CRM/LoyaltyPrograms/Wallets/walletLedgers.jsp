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
	
	//callCalender("startDate");
	//callCalender("endDate");
	 /*  $("#searchWallets").val($("#searchname").val());
		$("#searchWallets").focus();  
	$('#searchWallets').on('input',function(e){
		if($(this).val().trim()==""){
			viewWallets('wallet','Wallet','0','menu');
		}
	});
	
	
	 $('#mySearch').click(function(){
	        var search = $('#searchWallets').val();
	        return viewWallets('wallet','Wallet','0','menu');
	    })
	    $('#searchWallets').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });	
	 */
	
/* var err = $("#err").val();
if(err != "")
  alert(err);   */
});
</script>  
</head>
<body>
<div id="generatedWallets">
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                                <div class="box-header" align="center">
                                    <h3 class="box-title" style="font-size: 20px;border: 1px solid gray;
    padding: 10px;padding-bottom: 5px;padding-top: 5px;border-radius: 5px;">Transactions</h3>
                                </div><!-- /.box-header -->
                                
                                 <div id="error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                 <div id="success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                        <div class="box-body table-responsive">
                                
                                
              
                  
                 
                 
               <!--   <div class="col-lg-12" style="">   
                 <br>
                 </div> -->
                 <div class="row" style="">
                   <div class="col-lg-12" style="padding-left: 0px;margin-bottom: 2px;z-index: 999999;">
                   <input type="button" style="float:right;width: 10%;margin-bottom: -32px;margin-top: 3px;" class="btn bg-olive btn-inline addBtn" onclick="return viewEditWallet('${programCode}','${operation }','0');" value="Back">
                   
                   </div>
                 </div>
                  <div class="row" style="">
                    <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;margin-bottom: 2px;">           
                         
                          <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewWalletsLedgers('${operation}','${programCode}','${phone}','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
				                      
				         <div class="col-lg-5 col-xs-9" style="padding-left:0px;padding-right:0px">
				         <label style="font-size: 16px;font-weight: bold;padding-top: 5px;">Phone Number : <span style="font-weight: normal;">${phone} <%-- ${walletList[0].phoneNumber} --%></span></label>
                          <input type="hidden" id="walletId" value=""/>
                    	</div>
                        <div class="col-lg-5 col-xs-9" style="padding-left:0px;padding-right:0px">
				          <input type="button"
												class="addBtn btn bg-olive btn-inline addBtn"
												data-toggle="modal" data-target="#myModalIos"
												style="margin-left: 315px;width: 23%;"
												value="<spring:message code="save.label" />" />
						<%-- <input type="button" style="width: 24%;margin-left: 7px;" class="btn bg-olive btn-inline addBtn" onclick="return viewEditWallet('${programCode}','${operation }','0');" value="Back"> --%>
                         
                    	</div>                          
                          
						</div>		
					</div>	
					<div class="modal fade" id="myModalIos" role="dialog"
												tabindex="-1" style="pointer-events: auto;">
												<div class="modal-dialog iosmodeldialog">

													<!-- Modal content-->
													<div class="modal-content iospopup"
														style="width: 58% !important;height: 150px !important;">
														<div class="modal-header">

															<button type="button" class="close" onclick=""
																data-dismiss="modal">&times;</button>
														</div>
														<div class="modal-body">
															<div class="form-group col-lg-12"
																style="padding: 0px; font-size: 15px">
																Are you sure,you want to save the file

																<!-- <div class="col-lg-1"> -->
																<div id="generatedCoupons">
																	<input type="hidden" id="downloadurl"
																		value="${downloadurl}">
																</div>

																<!--  </div> -->
															</div>
															<div class="form-group col-lg-12"></div>
															<div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
															<div class="form-group col-lg-8 col-sm-8 col-xs-8"
																style="padding-left: 0px; padding-right: 0px;">
																<div class="col-lg-3 col-sm-4 col-xs-6"
																	style="margin-left: 29%;">
																	<input type="hidden" value="${giftCoupon.quantity}" />
																	<input type="hidden" value="${giftCoupon.noOfCoupons}" />
                                       
											
											            	<input type="button" class="iosclosebutton1" style="width:75px"
																		onclick="ExportTransactionsDataxls('view','${programCode}','${phone}','0','true')"
																		value="Ok">
                                           
										
																	


																</div>




																<!-- <div class="col-lg-1 col-sm-4 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div> -->
															</div>
															<br />
														</div>
														<br />
														<div class="modal-footer" style="padding: 0px;">
															<!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
														</div>
													</div>

												</div>
											</div>
					 <table id="example1" class="table table-bordered table-striped" style="">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                              <th><div><spring:message code="sl.no.label" /></div></th>
                                                <th>Tnx Ref</th>
                                                 <th>User Name</th>
                                                 <th>Create Date</th>
                                                 <th>Update Date</th>
                                                <th>Credit</th>
                                                 <th>Debit</th>
                                                 <th>Balance Amt</th>
                                                 <%--  <th><spring:message code="opening.bal.label" /></th>
                                                  <th><spring:message code="closing.bal.label" /></th>
                                                  <th><spring:message code="total.nos.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="action.label" /></th> --%>
                                            </tr>
                                        </thead>
                      <tbody style="text-align: center;">
                               <c:forEach var="wallet" items="${walletList}" varStatus="theCount">	
                                            <tr>
                                            	<td>${theCount.count+index-1}</td>
                                                <td>${wallet.txnRef}</td>
                                                <td>${wallet.userName}</td>
                                                <td>${wallet.createdDateStr}</td>
                                                <td>${wallet.updatedDateStr}</td>
                                                 <td>${wallet.amountCredited}</td>
                                                <td>${wallet.amountDebited}</td>
                                                <td>${wallet.amountBalance}</td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    <br>
                                    
                                    <input type="hidden" value="${totalRecords}">
                                     <input type="hidden" value="${totalValue}">
                                     
                 <div class="row" style="">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;"    	onclick="viewWalletsLedgers('${operation}','${programCode}','','${phone}','${totalValue}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"     onclick=" return viewWalletsLedgers('${operation}','${programCode}','','${phone}','${index - (maxRecords+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		
              		
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWalletsLedgers('${operation}','${programCode}','${phone}','${index - (maxRecords+1)}'); "> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWalletsLedgers('${operation}','${programCode}','${phone}','${totalValue}');">
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
              		  <input type="button" onclick="viewWalletsLedgers('${operation}','${programCode}','${phone}',document.getElementById('pagination').value); " class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              	
              </div>
				 <div class="row" style="">
                   <div class="col-lg-12" style="padding-left: 0px;margin-bottom: 2px;">
                   <input type="button" style="float:right;width: 10%;" class="btn bg-olive btn-inline addBtn" onclick="return viewEditWallet('${programCode}','${operation }','0');" value="Back">
                   </div>
                 </div>	
</div>
</section></div>
</body>
</html>