<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
 * file name		        : CRM/LoyaltyPrograms/Memberships/memberships.jsp
 * file type		        : JSP
 * description				: The Membership details table is displayed using this jsp.
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
         	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/subscription.js"></script>
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
	debugger
	callCalender("promoStartDate");
	callCalender("promoEndDate");
	
	 // $("#searchSubscriptions").val($("#searchname").val());
		$("#searchSubscriptions").focus();  
	$('#searchSubscriptions').on('input',function(e){
		if($(this).val().trim()=="" || $(this).val().trim().length>=3){
			viewSubscriptions('subscriptions','subscription','0','menu');
		}
	});
	
	

	
	
var err = $("#err").val();
if(err != "")
  alert(err);  
});
</script>  
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                                <div class="box-header" >
                                    <h3 class="box-title"><spring:message code="loyality.subscription.label" /></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                
                                
                                 <div class="col-lg-11" style=" background: #f4f4f4;    padding: 4px 20px;    width: 88%;">
                  <div class="row">
                  
                        <%--  <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div> --%>
                      
                     <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                  		<label><spring:message code="subscription.status.label"/></label>
                  		<select class="form-control" id="subscriptionStatusList">
                  				<option value="" ${'' == status ? 'selected' : ''}><spring:message code="ALL.label"/></option>
                           		<option value=Subscribed ${'Subscribed' == status ? 'selected' : ''}>Subscribed</option>
                           		<option value="Unubscribed" ${'Unubscribed' == status ? 'selected' : ''}>Unubscribed</option>
						     	<option value="Paused" ${'Paused' == status ? 'selected' : ''}>Paused</option>
						 	
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                      </div>
                  	
                  		 <div class="col-lg1-2 col-lg-2">
                      </div>
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="promoStartDate" size="20" type="text" onfocus="callCalender('promoStartDate')" onclick="callCalender('promoStartDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                 
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                  		<label><spring:message code="subscription.type.label"/></label>
                  						<select class="form-control" name="subscriptionType"  id="subscriptionType" >
                  		 						<option value=""><spring:message code="ALL.label"/></option>
                  		 						 <option value="Daily" ${'Daily' == subscriptionTypeFilter ? 'selected' : ''}>Daily</option>
	                                            <option value="AlternateDay" ${'AlternateDay' == subscriptionTypeFilter ? 'selected' : ''}>Alternate Day</option>
    	                                        <option value="Weekly" ${'Weekly' == subscriptionTypeFilter ? 'selected' : ''}>Weekly</option>
    	                                         <option value="Monthly" ${'Monthly' == subscriptionTypeFilter ? 'selected' : ''}>Monthly</option>
                                         </select>
                      </div>
                      </div>
                      
                       <div class="col-lg1-2 col-lg-3 form-group">
                      </div>
                      
                      
                        <div class="col-lg1-2 col-lg-3 form-group">
                      </div>
                    
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="promoEndDate" size="20" type="text" onfocus="callCalender('promoEndDate')" onclick="callCalender('promoEndDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                    <div class="col-lg-12" style="    border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                     <div class="row">
                       <a onclick="viewSubscriptions('subscriptions','subscription','0','menu');" class="btn bg-olive btn-inline" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;"><spring:message code="searchbutton.label"/></a>
                     </div>
                     <div class="row">
                       <a onclick="resetSubForm();" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                     </div>
                   </div>
                 </div>
                 
                  <div class="col-lg-12" style="">   
                 <br>
                 </div>
                 
                 <div class="row">
                    <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">           
                         
                          <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewSubscriptions('subscriptions','subscription','0','menu');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                     		<option value="-1" ${maxRecords == '-1' ? 'selected' : ''}>All</option>
				                      	</select>
				                      </div>
                         
                         
                          
                          <div class="col-lg-11 col-xs-11" >
										<input type="text"  class="form-control searchSubscriptions" value="${searchName}" id="searchSubscriptions"  placeholder="Search Subscription here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											
									</div>
                    
                    <!--Add new -->
                    
                 <%--     <div class="col-lg-1" style="">
							<div class="buttons" style="">
		  				        <a onclick="return viewNewSubscriptions('subscription');" class="btn bg-olive btn-inline  addBtn" disabled ><spring:message code="addnew.label" /></a>
									 </div>
									 </div>  --%>
								
								
						</div>		
					</div>			
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                               <th><div><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="subscription.id.label" /></th>
                                                 <th><spring:message code="mobile.numbers.label" /></th>
                                                 <th><spring:message code="subscription.type.label" /></th>
                                                  <th><spring:message code="start.date.label" /></th>
                                                  <th><spring:message code="end.date.label" /></th>
                                                  <th><spring:message code="total.nos.label" /></th>
                                                  <th><spring:message code="created.date.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        	<c:forEach var="subscription" items="${subscriptionlist}" varStatus="theCount">
                                            <tr>
                                            	
                                                <td>${theCount.count+index-1}</td>
                                                <td>${subscription.subscriptionId}</td>
                                                <td>${subscription.mobileNum}</td>
                                                <td>${subscription.period}</td>
                                               
                                                <td>${subscription.startDateStr}</td>
                                                 <td>${subscription.endDateStr}</td>
                                                <td></td>
                                                 
                                                <td>${subscription.createdDateStr}</td>
                                                  
                                                <td>${subscription.status}</td>
                                                <td style="white-space: nowrap;"><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSubscriptionDetails('${subscription.subscriptionId}','${subscription.period}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewSubscriptionDetails('${subscription.subscriptionId}','${subscription.period}','edit')">Edit</a></td>
                                                 
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                      <br>
             <div class="row">
              	
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSubscriptions('subscriptions','subscription','${totalValue}','menu')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSubscriptions('subscriptions','subscription','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSubscriptions('subscriptions','subscription','${index - (maxRecords+1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSubscriptions('subscriptions','subscription','${totalValue}','menu')">
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
              		  <input type="button" onclick="viewSubscriptions('subscriptions','subscription',document.getElementById('pagination').value,'menu')" class="btn bg-olive btn-inline  addBtn" value="GO">
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