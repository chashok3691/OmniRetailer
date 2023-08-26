<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : chaithanya.v
 * file name		        : B2C/viewHomePageDeal.jsp
 * file type		        : JSP
 * description				: The editHomePageDeal form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/homePageDeals.js"></script>
	<style type="text/css">
	
	
	
	
	.col-xs-12 {
	 padding: 2% 25%;
	 }
	 .fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    }
   .browsebutton:hover {
    background: grey !important;
}
.browsebutton {
    font-weight: bold;
    height: 28px;
    border-radius: 0px;
    padding: 2px 17px;
    background: grey;
    border: none;
}
.fileUpload {
    position: relative;
    overflow: hidden;
    /* margin: 10px; */
}

.companyimage{
width: 152px;
  margin-left: 15px;
    /* margin-left: -100%; */
   /*  margin-top: -10%; */
    margin-bottom:0px;
    object-fit: contain;
    height: 46px;
}
	 

	
	
	
	
	
	
  .odd{display:none!important;}
.buttons {
	float: right;
    padding-top: 0px;
    margin-right: 0%;
    margin-top: 3%;
}
.dealborder{
      border-left: 1px solid gainsboro;
    border-bottom: 1px solid gainsboro;
    border-right: 1px solid gainsboro;
    text-align: left;
    background: gainsboro;
    margin-left: -15px;
    font-weight: 600 !important;
    }
    .bordermargin{
    margin-left:30px;
    margin-right:30px;
     border-top: 1px solid gainsboro;
    }
    
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 3.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
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
</style>
<script>
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	$("#title").on('input',function(e){
		   $("#titleError").html("");
		   $(".titleError").html("");
	});
	$("#preparedBy").on('input',function(e){
		   $("#preparedByError").html("");
		   $(".Error").html("");
	});
	$("#targetUrl").on('input',function(e){
		   $("#preparedByError").html("");
		   $(".Error").html("");
	});
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: left;">
                                <h3 style="text-align: center;"><label style="text-align: center;padding: 5px;padding-left: 20px;padding-right: 20px;border: 1px solid gray;border-radius:5px;"><spring:message code="home.page.offers.label" />-New</label></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
            <form role="form">
            <div class="box-body">
            <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -25px">${err}</div>
    		<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -25px">${success}</div>
            <div class="row" style="margin-top: 20px;margin-left: 0px;margin-right: 0px;margin-bottom: 20px;">
                 <input type="hidden" value="${hotdealRef}" id="hotdealRef"/>
                 
                 <div class="col-lg-12 col-sm-12" >
                 
                 <div class="col-lg-3 col-sm-3" style="padding-left: 0px;">
                  <div class="form-group col-lg-12" >
                	<label><spring:message code="title.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" class="form-control" name="title" id="title" value="${hotDealsList.dealsDisplayTitle}" placeholder=""/>
					<span id="titleError" style="text-align: right; color: red; font-size: 2; position: absolute;;font-weight: bold;"></span>
				</div>  
				
				 <div class="form-group col-lg-12" >
                <label><spring:message code="prepared.by.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" class="form-control" name="preparedBy" id="preparedBy" value="${hotDealsList.preparedBy}" placeholder=""/>
					<span id="preparedByError" style="text-align: right; color: red; font-size: 2; position: absolute;;font-weight: bold;"></span>
				</div> 
				 
               </div>
                 
               <div class="col-lg-2 col-sm-2">
               <div class="form-group col-lg-12" >
                <label><spring:message code="deals.priority.label" /> <span style="color:red; font-size:2"></span></label>
                                            <select class="form-control" name="priority" id="dealPriority">
                                            <option value="1" ${'1' == hotDealsList.dealPriorityStr ? 'selected' : ''}>1</option>
                                            <option value="2" ${'2' == hotDealsList.dealPriorityStr ? 'selected' : ''}>2</option>
                                            <option value="3" ${'3' == hotDealsList.dealPriorityStr ? 'selected' : ''}>3</option>
                                            <option value="4" ${'4' == hotDealsList.dealPriorityStr ? 'selected' : ''}>4</option>
                                            <option value="5" ${'5' == hotDealsList.dealPriorityStr ? 'selected' : ''}>5</option>
                                            <option value="6" ${'6' == hotDealsList.dealPriorityStr ? 'selected' : ''}>6</option>
                                            <option value="7" ${'7' == hotDealsList.dealPriorityStr ? 'selected' : ''}>7</option>
                                            <option value="8" ${'8' == hotDealsList.dealPriorityStr ? 'selected' : ''}>8</option>
                                            <option value="9" ${'9' == hotDealsList.dealPriorityStr ? 'selected' : ''}>9</option>
                                            <option value="10" ${'10' == hotDealsList.dealPriorityStr ? 'selected' : ''}>10</option>
                                            </select>
                                          <span id="dealPriorityError" style="text-align:right;color:red;font-weight:bold;"></span>
					<!-- <input type="text" class="form-control" name="dealPriority" id="dealPriority" value="" placeholder=""/>
					<span id="dealPriorityError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
				</div>  
				
				<div class="form-group col-lg-12" >
                	<label><spring:message code="deal_status.label" /> <span style="color:red; font-size:2"></span></label>
                <select class="form-control" name="dealStatus" id="dealStatus">
                                            <option value="1" ${'1' == hotDealsList.statusStr ? 'selected' : ''}>Active</option>
                                            <option value="0" ${'0' == hotDealsList.statusStr ? 'selected' : ''}>In-Active</option>
                                            </select>
					<!-- <input type="text" class="form-control" name="dealStatus" id="dealStatus" value="" placeholder=""/> -->
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  
				        
              </div>
              
                <div class="col-lg-2 col-sm-2">
                <div class="form-group col-lg-12">
                	<label><spring:message code="deal_start_date.label" /> <span style="color:red; font-size:2">*</span></label>
                <input class="form-control calendar_icon startDateHotdeal" readonly="readonly" value="${hotDealsList.effectiveFromDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Start Date" />
					<!-- <input type="text" class="form-control" name="dealStartDate" id="dealStartDate" value="" placeholder=""/> -->
					<span id="dealStartDateError" style="text-align: right; color: red; font-size: 2; position: absolute;;font-weight: bold;"></span>
				</div>         
                <div class="form-group col-lg-12" >
                	<label><spring:message code="reports_enddate.label" /> <span style="color:red; font-size:2">*</span></label>
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<!-- <input type="text" class="form-control" name="dealEndDate" id="dealEndDate" value="" placeholder=""/>-->
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;font-weight: bold;"></span> 
				</div> 
                 </div>
                 <div class="col-lg-5 col-sm-5" style="padding-right: 0px;">
                 <div class="form-group col-lg-12" >
	                             <label><spring:message code="description.label" /></label>
	                            <textarea rows="4" id="description" name="description" style="resize: none;" class="form-control allField" placeholder="<spring:message code="enter.description.label" />" >${hotDealsList.dealDescription}</textarea>
	                            <span id="remarksError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                           </div>
                 </div>
                 
                 </div>
                 <div class="col-lg-12 col-sm-12" style="margin-bottom:20px">
                 <div class="col-lg-3 col-sm-3" style="padding-left: 0px;">
                  <div class="form-group col-lg-12" >
                	<label>Display Page</label>
                	<select class="form-control" id="displaypage">
                	<option value="homepage">home page</option>
                	<option  value="offerpage">offer page</option>
                	
                	</select>
				</div>  
                 
                 </div>
                 
                 
                 
                 
                   
                </div>                    
          <div class="row">
				<div class=" col-lg-12">
	    	      		<div class="row bordermargin" >
	                    <div class="form-group col-lg-12" >
	                    <div class=" col-lg-2 dealborder"  ><span style="font-size: 16px;color:#666;cursor: pointer;"><spring:message code="offers.list.label" /></span></div>
	                     <div class=" col-lg-10" >
	                    	
	                     </div> 
	                 
	                    </div>
	                </div>
             	</div>
             </div>
             <div class="row" style="margin-top: 0px;margin-left: 0px;margin-right: 0px;margin-bottom: 0px;">
             <div class="col-lg-12 col-sm-12" >
              <div class="col-lg-3 col-sm-3"  style="padding: 0px;">
             	<div class="form-group col-lg-12" >
             	<label><spring:message code="product.category.label" /> <span style="color:red; font-size:2"></span></label>
                <select class="form-control" id="offerProductCategory" onchange="searchOffersBasedOnCategory('offerProductCategory','dontAdd');" ><!-- onchange="searchOffersBasedOnCategory('offerProductCategory','dontAdd');" -->
				                           	<option value="">-- Select --</option>
 				                             <c:forEach var="category" items="${categoryList}">
												<option value="${category.categoryName}">${category.categoryDescription}</option>
											 </c:forEach>
                                         </select>
				</div> 
             </div>
             <div class="col-lg-3 col-sm-3" style="padding: 0px;">
             	<div class="form-group col-lg-12" >
             	<label><spring:message code="group_id.label" /> <span style="color:red; font-size:2"></span></label>
                <select class="form-control" id="offerGroups" onchange="searchOffersBasedOnCategory('offerProductCategory','dontAdd');"><!-- onchange="searchOffersBasedOnCategory('offerProductCategory','dontAdd');" -->
				                           	<option value="">-- Select --</option>
 				                             <c:forEach var="offerGroup" items="${groupsList}">
												<option value="${offerGroup.groupId}">${offerGroup.groupId}</option>
											 </c:forEach>
                                         </select>
					
				</div> 
             </div>
             <div class="col-lg-6 col-sm-6" style="padding: 0px;margin-top: 20px;">
             <div class="form-group col-lg-10" style="padding: 0px;margin: 0px;">
                <select class="form-control" id="offerIds" >
                <option value="select">-- Select --</option>
                  <c:forEach var="offerGroup" items="${offersList}">
												<option value="${offerGroup.offerID}">${offerGroup.offerDescription}</option>
											 </c:forEach>
                
		         </select>
				</div>  
				<div class="form-group col-lg-2" style="padding: 0px;"> 
                  <div class="buttons" style="">
					<a onclick="searchOffersBasedOnCategory('offerIds','add');" style="margin-top:-3px;margin-left:-8%;" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="add..label" />&nbsp;&nbsp;&nbsp;</font></a>
				</div>
                </div>
             </div>
             </div>
             	</div>
             	
             	
         
                <div class="table-responsive col-lg-12" style="padding-left: 30px;margin-bottom: 40px;">
                    <table id="offersList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="offer_id.label"/></th>
                            <th><spring:message code="offer_name.label"/></th>
                            <th><spring:message code="deal_start_date.label"/></th>
                            <th><spring:message code="offer_end_date.label"/></th>
                            <th><spring:message code="group.label"/></th>
                            <th><spring:message code="product.category.label"/></th>
                            <th><spring:message code="status.label"/></th>
                            <th><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
             		   	<c:forEach var="item" items="${selectedOffersList}" varStatus="theCount">
		             		   <tr id="dynamicdiv${theCount.count}">
		             		   <td class="slno">${theCount.count}</td>
			              			<td id="offerId${theCount.count}">${item.campaignId}</td>
			                  		<td id="offerName${theCount.count}">${item.campaignName}</td>
			                  		<td id="startDate${theCount.count}" class="Price">${item.startDateStr}</td>
			                  		<td id="endDate${theCount.count}" class="Pack">${item.endDateStr }</td>
			                  		<td id="group${theCount.count}" class="cost" >${item.productGroup}</td>
			                  		<td id="category${theCount.count}">${item.productCategory}</td>
			                  		<td id="offerStatus${theCount.count}">${item.statusStr }</td>
			                  		<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/></td>
		                  	   </tr>
	              		   </c:forEach> 
					 </tbody>
                   </table>
                </div> 
               
				<div class="row">
				<div class="form-group col-lg-12">
	    	      		<div class="row bordermargin" >
	                    <div class="form-group col-lg-12" >
	                    <div class=" col-lg-2 dealborder"  ><span style="font-size: 16px;color:#666;cursor: pointer;"><spring:message code="deals.list.label" /></span></div>
	                     <div class="form-group col-lg-10" >
	                    	
	                     </div> 
	                
	                    </div>
	                </div>
             	</div>
             </div>
             <div class="row" style="margin-top: 0px;margin-left: 0px;margin-right: 0px;margin-bottom: 0px;">
              <div class="col-lg-12 col-sm-12" >
              <div class="col-lg-3 col-sm-3"  style="padding: 0px;">
              <div class="form-group col-lg-12" >
             		<label><spring:message code="product.category.label" /> <span style="color:red; font-size:2"></span></label>
                <select class="form-control" id="dealProductCategory" onchange="searchDealsBasedOnCategory('dealProductCategory','dontAdd');"> 
 				                          <option value="">-- Select --</option>
 				                             <c:forEach var="category" items="${categoryList}">
												<option value="${category.categoryName}">${category.categoryDescription}</option>
											 </c:forEach>
                                         </select>
				</div> 
              </div>
              <div class="col-lg-3 col-sm-3"  style="padding: 0px;">
              <div class="form-group col-lg-12" >
             	<label><spring:message code="group_id.label" /> <span style="color:red; font-size:2"></span></label>
                <select class="form-control" id="dealGroup" onchange="searchDealsBasedOnCategory('dealProductCategory','dontAdd');"> <!-- onchange="searchDealsBasedOnCategory('dealProductCategory','dontAdd');" -->
				                           	<option value="select">-- Select --</option>
 				                             <c:forEach var="dealGroup" items="${groupsList}">
												<option value="${dealGroup.groupId}">${dealGroup.groupId}</option>
											 </c:forEach>
                                         </select>
				</div> 
              </div>
              <div class="col-lg-6 col-sm-6"  style="padding: 0px;margin-top: 20px;">
               <div class="form-group col-lg-10" style="padding: 0px;margin: 0px;">
                <select class="form-control" id="dealIds" onchange="">
                <option value="select">-- Select --</option>
                 <c:forEach var="dealGroup" items="${dealsList}">
												<option value="${dealGroup.dealID}">${dealGroup.dealDescription}</option>
											 </c:forEach> 
                
                  </select>
                 </div> 
                  <div class="form-group col-lg-2" style="padding: 0px;"> 
                      <div class="buttons" style="">
					<a onclick="searchDealsBasedOnCategory('dealIds','add');" style="margin-top: -3px;margin-left:-8%;" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="add..label" />&nbsp;&nbsp;&nbsp;</font></a>
				</div></div>
              </div>
              </div>
            	
             	</div>	
             
                       
                          <div class="table-responsive col-lg-12" style="padding-left: 30px;margin-bottom: 40px;">
                    <table id="dealsList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="deal_id.label"/></th>
                            <th><spring:message code="deal_name.label"/></th>
                            <th><spring:message code="deal_start_date.label"/></th>
                            <th><spring:message code="offer_end_date.label"/></th>
                            <th><spring:message code="group.label"/></th>
                            <th><spring:message code="product.category.label"/></th>
                            <th><spring:message code="status.label"/></th>
                             <th><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
                       <c:forEach var="item" items="${selectedDealsList}" varStatus="theCount">
             		   <tr id="dynamicdiv${theCount.count}">
             		   <td class="slno">${theCount.count}</td>
			              			<td id="dealId${theCount.count}">${item.campaignId}</td>
			                  		<td id="dealName${theCount.count}">${item.campaignName}</td>
			                  		<td id="dealStartDate${theCount.count}" class="Price">${item.startDateStr}</td>
			                  		<td id="dealEndDate${theCount.count}" class="Pack">${item.endDateStr }</td>
			                  		<td id="dealGroup${theCount.count}" class="cost" >${item.productGroup}</td>
			                  		<td id="dealCategory${theCount.count}">${item.productCategory}</td>
			                  		<td id="dealStatus${theCount.count}">${item.statusStr }</td>
			                  		<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/></td>
		                  	   </tr>
              		   </c:forEach> 
					 </tbody>
                   </table>
                </div>    <div class="form-group col-lg-1"></div>
           
							<div class="row" style="text-align: center;">
							<div class="form-group col-lg-12">
						 <input type="button" style="width: 65px;" class="btn bg-olive btn-inline" onclick="validateHotDealForm('homePageDeals','new');" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewAllHomePageDeals('homePageDeals','0');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						<c:forEach var="accessControl" items="${sessionScope.b2cManagement}">
                            <c:if test="${accessControl.appDocument == 'HomePageDeals' && accessControl.write == true && accessControl.read == true}">
						 		<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewAllHomePageDeals('homePageDeals','0');" value="<spring:message code="cancel.label" />" />
						 	</c:if>
						 </c:forEach> 
						 </div>
                            </div></div>
</form>
</div>
</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 