 <!-- * Project Name 	    : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : CRM/LoyaltyPrograms/Wallets/newwallets.jsp
 * file type		        : JSP
 * description				: To display the Wallets details by using this jsp. -->

 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                  <script type="text/javascript" src="${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
         
         
         <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/wallets.js"></script>  --%>
<style type="text/css">


</style> 

 <script type="text/javascript"> 
 
 $(document).ready(function(){
	debugger;
	callCalender("createdDate");
	//callCalender("date");
	
	
	
	/* if($("#Error").html() != ""){
			
			$("#transaction").css("pointer-events","none");
		}
	else{
		$("#transaction").css("pointer-events","all");
	} */
 
}); 
 

 
</script> 
</head>
<body>


<div class="modal fade popup-display" id="selected-items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 125%;margin-top: -25%;">
                 <div class="modal-header">  
               
                    <div class="col-lg-12" style="background-color: #3c8dbc; color: #ffffff;margin-top: -15px; padding-top: 8px;  
                      margin-top: -15px;padding-bottom: 8px; padding-right: 27px; width: 104%;margin-left: -15px;">
        Wallet Edit
       <!--   <div class="col-lg-11" style="padding-bottom:5px;" > Wallet Edit </div>
                   <div class="col-lg-1"> -->
                        <button type="button" class="close" style="background-color: #3c8dbc; color: #ffffff;" data-dismiss="modal" aria-hidden="true">&times;</button>
                     
                      <!-- </div>-->
                      
                   </div> 
                   
              </div>
                
             <form action="#" method="post">
                 <div class="modal-body">
		<div class="err" id="error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${error}</div>
                  <div class="box-body table-responsive" style=" margin-top: 0%;">
		<div id="success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${Success}</div>
                 
            <div></div>
               	<input type='hidden' id='selectedLocationId' > 
                 <div>
                   <div class="col-lg-12" style="margin-left: -7%; width:112%">
                  <div class="col-lg-4" style="padding-left: 12px; padding-right: 0px;">
						<div class="col-lg-4" style="padding-left: 21px;">	<label>Name</label>	</div>
						<div class="col-lg-8"> <input type="text" name="name" id="name" readonly="readonly" class="form-control" <%-- value="${WalletDataObj.walletProgram.wallets[0].customerName}"  --%> 
						          value="${walletName}" style="white-space: nowrap;"><br>
							</div>
								</div>
								
								<div class="col-lg-4" style="padding-left: 0px; padding-right: 0px;">
							<div class="col-lg-4" style="padding-left:0px;"><label>WalletID</label></div>
							<div class="col-lg-8"style=" padding-right: 0px;"> <input type="text" name="walletId" id="walletId" readonly="readonly" value="${WalletDataObj.walletId}" class="form-control">
							</div>
							</div>
							
							<div class="col-lg-4">
							<div class="col-lg-4"style="padding-left: 0px; padding-right: 0px;">	<label>Status</label></div>
                                       <div class="col-lg-8"  readonly="readonly" style="padding-left: 28px;">
                                       <!-- <select class="form-control" id="status">
                                             <option value="Active">Active</option>
                                              <option value="InActive">Suspended</option>
                                              </select>  -->
                                              
                                              <select class="form-control" name="" onchange="multipleCheckValidation()" id="status" disabled style="width: 115%;">
	                                            
	                                            <c:if test="${walletStatus == 'true'}"> 
	                                            <option value="Active" selected>Active</option>
	                                            <option value="Suspended">Suspended</option>
	                                            </c:if>
	                                             <c:if test="${walletStatus == 'false'}"> 
    	                                        <option value="Suspended" selected >Suspended</option>
    	                                        
    	                                        <option value="Active">Active</option>
	                                            </c:if>
	                                            
                                            </select>
                                              
                                              
                                              </div>
                                              </div>	
                                             </div> 
                                              
                       <div class="col-lg-12" style="margin-left: -7%; width: 112%;">
                  <div class="col-lg-4"  style="padding-left:29px;">
                  <div class="col-lg-4 nopadding">
							<label>Mobile</label>
								</div>
							<div class="col-lg-8" style="padding-left: 8px; padding-right: 0px;"> 
							<input type="number" name="mobile" id="mobile" readonly="readonly" value="${walletPhoneNo}" class="form-control" >
							</div>
							</div>
							 
								
								<div class="col-lg-4" style="padding-left: 0px; padding-right: 0px;">
								<div class="col-lg-5" disabled style="padding-left: 0px; padding-right: 0px;">
							<label>Created_On</label>
							</div>
			                 <div class="col-lg-7"  readonly="readonly" disabled style="padding-left: 0px; padding-right: 0px;">
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" disabled value="${WalletDataObj.walletProgram.createdDateStr}" style="background-color: white;" id="createdDate" size="20" type="text" onfocus="callCalender('createdDate')" onclick="callCalender('createdDate')"  readonly="readonly" placeholder="DD/MM/YYYY" />
							</div>
							</div>
							
							<div class="col-lg-4" style="padding-left: 0px; padding-right: 0px;">
								<div class="col-lg-5">
								<label>Bal_Amount</label>
								</div>
								<div class="col-lg-7">
								<c:choose>
								   
								  <c:when test="${not empty WalletDataObj.amountBalance}">
								     <input type="number" name="balance" id="balAmount" readonly="readonly" value="${WalletDataObj.amountBalance}" class="form-control">
								  </c:when>
								  <c:otherwise>
								    <input type="number" name="balance" id="balAmount" readonly="readonly" value="0.0" class="form-control">
								   </c:otherwise>
								</c:choose>
								
							</div>
                                              </div>	
                                             </div> 
                                             </div>
                                      
                                      
                                       <div class="row" >
                                       
                                       <div id="txnRefError" style="text-align:center;color: red;font-size: 2;font-weight: bold;margin-left: 10%;"></div>
                                       
                                       
                                       </div>

							<div class="row" id="transaction" style=" margin: 4px -15px 2px -15px;">

								 <div class="col-lg-3" style="padding-left: 14px;padding-right:0px; ">
									<label>Txn Ref</label> <input type="text" name="txnRef"id="txnRef" class="form-control">

								 </div>
								 <div class="col-lg-3" style="padding-left: 10px;padding-right:0px; ">
		                                 <label>Tender Code</label>
		                                 
		                                   <select class="form-control"  id="tenderCode">
											 <c:forEach var="tender" items="${tenderDetails}" >
												 <option value="${tender.tenderName}" ${tender.tenderName.toUpperCase()==tender.tenderName.toUpperCase() ? 'selected' : ''}>${tender.tenderName}</option>
										    </c:forEach>
                  						  </select>
                                 </div>
                                 <div class="col-lg-2" style="padding-left: 10px;padding-right:0px;">
		                               <label>Amount</label>
					                   <input type="number" name="amount" id="amount" class="form-control">
					                   <span id="amountError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 </div>
                                 <div class="col-lg-2" style="padding-left: 15px;padding-right:0px;">
                                 <label></label>
		                               <a onclick="walletPopUp('new','${WalletDataObj.walletId}','${walletPhoneNo}','${walletName}','${walletStatus}','0','credit');" class="btn bg-olive btn-inline  addBtn">Credit</a>
                                 </div>
								 <div class="col-lg-2" style="padding-left: 4px;">
								 <label></label>
		                               <a onclick="walletPopUp('new','${WalletDataObj.walletId}','${walletPhoneNo}','${walletName}','${walletStatus}','0','debit');" class="btn bg-olive btn-inline  addBtn">Debit</a>
                                 </div>
 
							</div>

						<%-- 	<div class="row" id="transaction" style="margin-top: 4%;">
                              
              
                              
                                 <div class="col-lg-3" style="padding-left: 14px; padding-right: 0px;">
                                <label>Txn Ref</label>
                                <input type="text" name="txnRef" id="txnRef" class="form-control">
                                 
                                 </div>
                                 
                                 <div class="col-lg-9" style="">
                                 <div class="col-lg-12 nopadding">
                                <div class="col-lg-4" style="padding-left: 0px;">
                    <label>Tender Code</label>
                     
                         <select class="form-control"  id="tenderCode">
						 <c:forEach var="tender" items="${tenderDetails}" >
						 
					 <option value="${tender.tenderName}" ${tender.tenderName.toUpperCase()==tender.tenderName.toUpperCase() ? 'selected' : ''}>${tender.tenderName}</option>
				    </c:forEach>
                    </select>
						
                    </div>
                    
                    <div class="col-lg-3" style="padding-left: 0px; padding-right: 0px;">
                    <label>Date</label>
                      <input class="form-control calendar_icon" readonly="readonly" value="${date}" style="background-color: white;" id="date" size="20" type="text" text-align:"" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY" />
              <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                    </div>
                    
                    <div class="col-lg-3"style="padding-left: 0px; padding-right: 0px;">
                    <label>Amount</label>
                      <input type="number" name="amount" id="amount" class="form-control">
                     <span id="amountError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                    </div>
                    
                    <div class="col-lg-2">
                   
                    
                    </div>
                    
                    
                    <div class="col-lg-3" style="padding-right: 1px;">
                    <label></label>
                      <a onclick="walletPopUp('new','${WalletDataObj.walletId}','${walletPhoneNo}','${walletName}','${walletStatus}','0');" class="btn bg-olive btn-inline  addBtn">Add</a>

                    </div>
                    </div>
                               </div> 
                                </div> --%>
                   
          <div class="row">
          <div class="col-lg-12 none" style="display:inline-block; overflow: auto;">
                     <table id="selectedItemsList" class="table table-bordered table-striped" >
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                             <th><div><spring:message code="sl.no.label" /></div></th>
							 <th>Tnx Ref</th>
                             <th>User Name</th>
							 <th>TXN Date</th>
							 <th>Credit</th>
							 <th>Debit</th>
							 <th>Tender</th>
							 <th>Amount</th>
							 <th>Balance</th>
                                             
                                            </tr>
                                        </thead>
                      <tbody style="text-align: center;">
                               <c:forEach var="wallet" items="${walletTransList}" varStatus="theCount">	
                                            <tr>
                                            	<td>${theCount.count+index}</td>
                                                <td>${wallet.txnRef}</td>
                                                <td>${wallet.userName}</td>
                                                <td>${wallet.createdDateStr}</td>
                                                <td>${wallet.amountCredited}</td>
                                                <td>${wallet.amountDebited}</td>
                                                <td>${wallet.tenderKey}</td>
                                                <td></td>
                                                <td>${wallet.amountBalance}</td>
                                                
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                    </div></div>
                    <!--  <table id="selectedItemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th>S NO</th>
							 <th>TXN Date</th>
							 <th>Credit</th>
							 <th>Debit</th>
							 <th>Tender</th>
							 <th>Amount</th>
							 <th>Balance</th>
                         </tr>
                       </thead>
                       
                    </table> -->
                 </div>
               
                <%--  <div class="row" style="text-align: center;">
                 		<input type="button" id="saveSelection"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;" onclick="saveSelectedSkus();" value="<spring:message code="save.label" />" />
						<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
						<input type="button" id="cancelSelection" class="btn bg-olive btn-inline" style="margin-right: 1%;" data-dismiss="modal" aria-hidden="true" value="<spring:message code="cancel.label" />" />
                 </div> --%>
                 
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->




</body>
</html>