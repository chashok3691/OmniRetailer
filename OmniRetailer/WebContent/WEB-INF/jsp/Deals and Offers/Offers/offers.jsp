<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/Deals and Offers/deals.jsp
 * file type		        : JSP
 * description				: display deals
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/dealsAndOffers/offers.js"></script>
    <!--  <script>
    $(document).ready(function(){
    	$("#outletLocation").val($("#hidloc").val());
    	 $("#searchOffers").val($("#offers").val());
 			$("#searchOffers").focus();
	});  
    </script> -->
    <script>
    $(document).ready(function(){
    	callCalenderYYYYMMDD('from');
    	callCalenderYYYYMMDD('to');
    	$("#outletLocation").val($("#hidloc").val());
    	/* $("#searchOffers").val($("#offers").val());
			$("#searchOffers").focus(); */
    		var sDate=$("#sd").val();
    		var s=sDate.split(' ');
    		s = s[0].replace(/-/g,'/');
    		$("#from").val(s);
    		var eDate=$("#ed").val();
    		var e=eDate.split(' ');
    		e = e[0].replace(/-/g,'/');
    		$("#to").val(e);
    		
    		
    		  $("#searchOffers").val($("#offers").val());
    			$("#searchOffers").focus();  
    		$('#searchOffers').on('input',function(e){
    			if($(this).val().trim()==""){
    				searchOffers('','offersConfigurations','0');
    			}
    		});
    		
    		
    		 $('#mySearch').click(function(){
    		        var search = $('#searchOffers').val();
    		        return searchOffers('','offersConfigurations','0');
    		    })
    		    $('#searchOffers').keypress(function(e){
    		    
    		        if(e.which == 13){//Enter key pressed
    		            $('#mySearch').click();//Trigger search button click event
    		        }
    		    });
    		 
//    		 	Added to fetch the locations based on zone 
    		 var zone = $("#outletZone").val();
    		 if( zone != null && zone !="")
    			 {
    			 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
    			 }
    			
    		
    		
	});  
    </script>
        
<style type="text/css">
.col-lg1-2{
    width: 20% !important;
}

.searchbutton{
background-image: url(../images/search.png);
    background-position: right;
    text-align: left;
    height: 30PX;
    background-repeat: no-repeat;
    margin-bottom: 2px;
    background-origin: content-box;
    width: 41px;
    padding: 4px 10px;
    border-left: 1px solid #ccc;
    /* background: #3c8dbc; */
    z-index: 999;
    position: absolute;
    background-color: #3c8dbc;
        right: 0;
    top: 0;
}
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}

.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 7%;
	margin-top:1%;
}
/* a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
} */
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
</style>  

</head>
<body>


 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
  <div class="box-header">
		<h3 class="box-title">
			<spring:message code="offers.label" />
		</h3>
  </div>
    <div class="box-body table-responsive">
    
		<div style="">
		<div class="col-lg-12" style="margin-top: -19px;padding-left: 0px; padding-right: 0px;">
         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 7px 20px;    width: 88%;">
                <%--   <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
      <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div> --%>
                  <div class="row">
                  
                  
                  
 <div class=" col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                      
                       <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                      
                    
                         </div>
                      </div>
                  
                  
                       <div class=" col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                         <label>Offer Type</label>
              <select class="form-control" id="offerType" >
                 <option value="">ALL</option>
               <option value="item_specific"${offerType == "item_specific" ? 'selected' : ''}>Item Specific Offer</option>
				<option value="turn_over"${offerType == "turn_over" ? 'selected' : ''}>Total Bill(Turn Over) Offer</option>
		     <option value="group_turn_over" ${offerType == "group_turn_over" ? 'selected' : ''}>Group (Turn Over) Offer</option>
	           </select>
                      </div>
                      </div>
                  
                     
                  <div class="col-lg-4"></div>
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                 	<input type="hidden" id="sd" value="${startDate}">
                   	<input type="hidden" id="ed" value="${endDate}">
                   	<input type="hidden" id="type" value="${type}">
                  	<label><spring:message code="offer_start_date.label"/></label>
	                    <input class="form-control form-group calendar_icon" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalenderYYYYMMDD('from')" onclick="callCalenderYYYYMMDD('from')" placeholder="YYYY/MM/DD" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                     
                     
                         <div class=" col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <label><spring:message code="location.label"/></label>
	            <select class="form-control form-group" id="outletLocation" >
	            	<option value=""><spring:message code="ALL.label"/></option>
                    <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
               </select>
                         </div>
                      </div>
                     
                     
                     
                       <div class=" col-lg-3">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                         <label><spring:message code="featured.product.status"/></label>
              <select class="form-control" id="offerStatusValue" >
                   <option value=""><spring:message code="ALL.label"/></option>
				   <option value="ACTIVE" ${offerStatusValue == 'ACTIVE' ? 'selected' : ''}  >ACTIVE</option>
				   <option value="INACTIVE" ${offerStatusValue == 'INACTIVE' ? 'selected' : ''}  >INACTIVE</option>
	           </select>
                      </div>
                      </div>
                    <div class="col-lg-4"></div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 <input class="form-control form-group calendar_icon" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalenderYYYYMMDD('to')" onclick="callCalenderYYYYMMDD('to')" placeholder="YYYY/MM/DD" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchOffers('','','0')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
       </div>  
		
         <%-- <div class="row">
	        <div class="col-lg-2">
                   <label><spring:message code="location.label"/></label>
	            <select class="form-control form-group" id="outletLocation" >
	            	<option value=""><spring:message code="ALL.label"/></option>
                    <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
               </select>
           </div>
           
            <div class="col-lg-2">
            <label><spring:message code="featured.product.status"/></label>
              <select class="form-control" id="offerStatusValue" >
                   <option value="all"><spring:message code="ALL.label"/></option>
				   <option value="ACTIVE" ${offerStatusValue == 'ACTIVE' ? 'selected' : ''}  >ACTIVE</option>
				   <option value="INACTIVE" ${offerStatusValue == 'INACTIVE' ? 'selected' : ''}  >INACTIVE</option>
	           </select>
            
            </div>
           
         <div class="col-lg-4"></div>
	        <div class="col-lg-3">
                <div class="col-lg-6 col-xs-12 col-sm-6 " style="text-align:left;padding-right: 0px;">
                	<input type="hidden" id="sd" value="${startDate}">
                   	<input type="hidden" id="ed" value="${endDate}">
                   	<input type="hidden" id="type" value="${type}">
                  	<label><spring:message code="offer_start_date.label"/></label>
	                    <input class="form-control form-group calendar_icon" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalenderYYYYMMDD('from')" onclick="callCalenderYYYYMMDD('from')" placeholder="YYYY/MM/DD" />
              </div>
                 <div class="col-lg-6 col-xs-12 col-sm-6" style="text-align:left;padding-right: 0px;">
                   <label><spring:message code="offer_end_date.label"/></label>
	                 <input class="form-control form-group calendar_icon" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalenderYYYYMMDD('to')" onclick="callCalenderYYYYMMDD('to')" placeholder="YYYY/MM/DD" />
	        	</div>
           </div>
           <div class="col-lg-1" style="margin-top: 18px;padding-left:0px">
               <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="searchOffers('','','0')" value="<spring:message code="search" />" />
           </div>
        </div> --%>
        
        <div class="col-lg-12">
        <br>
        </div>
	      <div class="row">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchOffers('','','0');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
           
           
           <div class="col-lg-8" style="padding-left: 11px;margin-top: 10px;    margin-left: -14px;">
      	 	<%-- <input type="text"  class="form-control searchItems searchBar" style="" value="" id="searchCurrency" placeholder="<spring:message code="search.currency.label" />" />
				<div class="services">
	    			<div class="items">
	     				<ul class="matchedStringUl currencyMaster" style=""></ul>
	   				</div>
				</div> --%>
				
					 <input type="text"  class="form-control" style="" value="" id="searchOffers" placeholder="<spring:message code="search.offers.label" />" />
                     <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
				
				 <input type="hidden" id="offers" value="${searchName}">
      	 	</div>
           
	       <%--  <div class="col-lg-9 col-xs-10" style="margin-top: 10px;">
       	 		 <input type="text"  class="form-control searchItems searchBar" style="" value="" id="searchOffers" placeholder="<spring:message code="search.offers.label" />" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchOffers" style=""></ul>
		   				</div>
					</div>
				 <input type="hidden" id="offers" value="${searchName}">
       	 	</div> --%>
	        <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;     margin-left: 13px;">
	        	<c:if test="${sessionScope.role == 'super admin'}">
                		<input onclick="createNewOffer()" class="btn bg-olive btn-inline addBtn" type="button" value="<spring:message code="addnew.label" />"/>
                </c:if>
                <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}">
	              <c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">  
             
							<input onclick="createNewOffer()" class="btn bg-olive btn-inline addBtn" type="button" value="<spring:message code="addnew.label" />"/>
						
				</c:if>
		   </c:forEach>
	        </div>
	        
	        <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        	
            <input onclick="searchOffers('','true','0')" class="btn bg-olive btn-inline addBtn" type="button" value="Save"/>
<input type="hidden" id="downloadUrl" value="${filePath}">
	        </div>
	        
	         <!--      added by Vinay.M to perform delete -->
	        <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
		    	<c:if test="${sessionScope.role == 'super admin'}">
                		<input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return  validateOffers('offers');" value="<spring:message code="delete.label" />">
                </c:if>
                <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}">
	            <c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">  
						<input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return  validateOffers('offers');" value="<spring:message code="delete.label" />">
						
				</c:if>
		   </c:forEach>
		    </div>
	        
	        </div>
	        </div>
				               <div style="overflow: auto;white-space: nowrap;">       
                                    <table id="offerstable" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                             <%--  <c:if test="${sessionScope.role == 'super admin'}">
                                              	 <th style="width: 40px"  align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                              </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}">
	                            			 <c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">
                                              <th style="width: 40px"  align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                            </c:forEach> --%>
                                             <c:if test="${sessionScope.role == 'super admin'}">
                                              	 <th style="width: 40px"  align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                              </c:if>
                                            <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}">
	                            			 <c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">
                                              <th style="width: 40px"  align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                            </c:forEach>
                                            
                                            <th><spring:message code="sl.no.label" /></th>
                                              <th><spring:message code="created.date.label" /></th>
                                              <th><spring:message code="updated.date.label" /></th>
                                            	<th><spring:message code="offer_id.label" /></th>
                                            	<th><spring:message code="offer_name.label" /></th>
                                                <th><spring:message code="offer_category_name.label" /></th>
                                                 <th><spring:message code="offer_reward_type.label" /></th>
                                                <th><spring:message code="offer_start_date.label" /></th>
                                                <th><spring:message code="offer_end_date.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="offerDetails" items="${offerDetails}" varStatus="thecount"> 
                                        	  <tr>
                                         
                                         <c:if test="${sessionScope.role == 'super admin'}">
                                           		 <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${offerDetails.offerStatus}$${offerDetails.offerID}'/></td>
                                          	
                                           </c:if>
                                         <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}">
	                           			<c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">
                                        	 <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${offerDetails.offerStatus}$${offerDetails.offerID}'/></td>
                                        
                                            </c:if>
                                         </c:forEach> 
                                          <input type="hidden" id="deleteActionLabel" value="<spring:message code="offer.label" />"/>
                                          <%--  <c:if test="${sessionScope.role == 'super admin'}">
                                           		 <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${offerDetails.offerID }'/></td>
                                           </c:if>
                                         <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}">
	                            			<c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true}">
                                        	 <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${offerDetails.offerID }'/></td>
                                            </c:if>
                                         </c:forEach>  --%>
                                         <td>${thecount.count+index-1}</td>
                                               <td>${offerDetails.createdOnStr}</td>
                                               <td>${offerDetails.updated_date}</td>
                                            	<td>${offerDetails.offerID}</td>
                                                <td>${offerDetails.offerName }</td>
                                                <td>${offerDetails.offerCategory }</td>
                                                 <td>${offerDetails.rewardType }</td>
                                                <td>${offerDetails.offerStartDate }</td>
                                                <td>${offerDetails.offerEndDate }</td>
                                                 <td>${offerDetails.offerStatus }</td>
                                              <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOfferDetails('${offerDetails.offerID }');"><spring:message code="view.label"/></a>
                                              	<a style="color:#2e7ea7 !important;cursor: pointer;margin-left: 15px;" onclick="editoffer('${offerDetails.offerID }');"><spring:message code="edit.label"/></a></td>
                                            </tr>
                                            </c:forEach>  
                                        </tbody>
                                    </table>
                                    </div>
				<div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchOffers('','offersConfigurations','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchOffers('','offersConfigurations','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchOffers('offers','offersConfigurations','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchOffers('','offersConfigurations','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
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
              		  <input type="button" onclick="searchOffers('','offersConfigurations',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              </div>    
             <input type="hidden" value="${location}" id="hidloc">
      </div><!-- /.box-body -->
  </div><!-- /.box -->
  
</div>
</div>
</section>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#offerstable").dataTable({
        			  "bPaginate": false,
                      "bLengthChange": false,
                      "bFilter": false,
                      "bSort": false,
                      "bInfo": false,
                      "bAutoWidth": false
        		});
                 });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>		    		 