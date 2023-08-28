<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockTransfer/stockRequest.js"></script>
<style>
/* .columnpadding{
padding-left: 0px;
padding-right: 0px;
}
.netamount{
border-bottom: 1px solid grey;
    border-top: 1px solid grey;
    padding-bottom: 25px;
    padding-top: 5px;
    /* margin-left: 23px; */
    /* margin-right: 35px; */
    
}
#talkbubble {
   width: 30px;
    height: 20px;
   position: relative;
   -moz-border-radius:    10px;
   -webkit-border-radius: 10px;
   border-radius:         10px;
}
#dateLable{
    display: inline-block;
    float: right;
    /* right: 99px; */
    margin-right: 47px;
}
#locationLable{
    display: inline-block;
}
#talkbubble:before {
   content:"";
   position: absolute;
   right: 100%;
   top: 26px;
   width: 0;
   height: 0;
   border-top: 13px solid transparent;
   border-right: 26px solid red;
   border-bottom: 13px solid transparent;
}
@media only screen and (max-width:479px)
{
.columnpadding{
padding-left: 15px;
padding-right: 15px;
}

} */
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

.modal {
z-index: 1010;

}

.scroll{
overflow-x: scroll;
overflow-y: scroll;
height: 421px;
}
.calendars-popup {
  	top: 370.062px !important;
}

.modal-open .modal {
	overflow-x: hidden;
	overflow-y: auto;
}
.spacebottom{
margin-bottom:10px;
}

.error-msg {
  color: red;
    text-align: center;
    width: 342px;
    margin-left: 20%;
    white-space: pre;
    font-size:large;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	debugger;
	callCalenderstockindent('indentfromDate');
	callCalenderstockindent('indentto');
});
</script>  
</head>
<body>
<c:choose>
<c:when test="${not empty stockRequestsList.pendingOutlets}">
<%-- <center><div style="margin-top: -14px;font-size: 18px; border: 1px solid black;width: fit-content;"><spring:message code="summary.generateindents" /></div></center> --%>
<div class="row" style="text-align: right; margin-top: 0px;">
<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
</div>
<div id='divError'></div>
<div class="col-lg-5">
<h4 class="box-title" style="padding :2px;  border:1px solid  #808080;background:#E0E0E0">
<input type="checkbox" style="vertical-align: -3px;" id="checkalloutlets" name="checkalloutlets" onclick="modalselectAll(this);">
<label style="font-family: Calibri;font-size: 20px;">Select  Outlets</label>
</h4>
<div class="scroll">
<c:forEach var="pendingOutlets" items="${stockRequestsList.pendingOutlets}">
<input type="checkbox" name="checkalloutlets" class="selectableCheckbox" id="selectall" value='${pendingOutlets}' />
<span style="padding-left: 15px">${pendingOutlets}</span>
<br>
</c:forEach>
</div>
</div>
<div class="col-lg-1" style=""></div>
<div class="col-lg-1" style=""></div>
<div class="col-lg-5 nopadding spacebottom" style="">
<h4 class="box-title " style="padding :2px;  border:1px solid  #808080;background:#E0E0E0;margin-bottom: 5px !important;" >						
<label style="font-family: Calibri;font-size: 20px;">Select  Category</label>
</h4>
				
   <input type="radio" class="" checked="checked" name="autoIndent" value="brandWise" ${stockRequestsList.indentCategory=='brandWise'?'checked':''}>&nbsp&nbsp<label><spring:message code="brandwise.reports.label" /></label><br>
   <input type="radio" name="autoIndent" value="categoryWise" ${stockRequestsList.indentCategory=='categoryWise'?'checked':''}>&nbsp&nbsp<label><spring:message code="category.wise.label" /></label><br>

   <input type="radio" name="autoIndent" value="departmentWise" ${stockRequestsList.indentCategory=='departmentWise'?'checked':''}>&nbsp&nbsp<label><spring:message code="department.wise" /></label><br>

   <input type="radio" name="autoIndent" value="sectionWise" ${stockRequestsList.indentCategory=='sectionWise'?'checked':''}>&nbsp&nbsp<label><spring:message code="sectionwise.reports.label" /></label><br>
	
   <input type="radio" name="autoIndent" value="none" ${stockRequestsList.indentCategory=='none'?'checked':''}>&nbsp&nbspNone

</div>

<div class="col-lg-2" style=""></div>
<div class="col-lg-5 spacebottom" style="padding-left:0px;padding-right: 0px;">
<h4 class="box-title" style="padding :2px;  border:1px solid  #808080;background:#E0E0E0;margin-bottom: 5px !important;" >
<label style="font-family: Calibri;font-size: 20px">To Location</label>
</h4>
                          			<%-- <input type="hidden" id="Wlocation" name="W_location" value="${selectedLocation}"> --%>
                          			<%-- <input type="hidden" id="Wlocation" name="W_location" value="${Tolocation}"> --%>
							        <select class="form-control" id="Wlocation" style=""><!-- searchStockRequests('','','0'); -->
									<option value=""><spring:message code="ALL.label"/></option>
									<c:forEach var="WarehouselocationsList" items="${warehouseList}">
									<option value="${WarehouselocationsList}" ${WarehouselocationsList == selectedLocation ? 'selected' : ''} id="${WarehouselocationsList}">${WarehouselocationsList}</option> 
									</c:forEach>
						</select>
                      </div>
                      <div class="col-lg-2" style=""></div>
                          <div class="col-lg-5 spacebottom" style="padding-left:0px;padding-right: 0px;">
                           <h4 class="box-title" style="padding :2px;  border:1px solid  #808080;background:#E0E0E0; margin-bottom: 5px !important;">
							<label style="font-family: Calibri;font-size: 20px;">Indent Period</label>
							</h4>
                           <select class="form-control" id="selectindent" onchange="replaceselectindent();" style="">
                           		 <option selected disabled value="Inventory Average Period">Inventory Average Period</option>
                           		<!--  <option value="15 Days">15 Days</option> -->
                           		 <option value="Weekly">Weekly</option>
                           		 <option value="Custom">Custom</option>
	                           <%--  <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach> --%>
	                        </select>
                      </div>
                      
                      <div class="col-lg-6"></div>
                  <div class="col-lg-2" style=""></div>   
<div class="col-lg-5 nopadding spacebottom" id="dates">
<h4 class="box-title" id="h4s"  style="padding :2px;  border:1px solid  #808080;background:#E0E0E0;margin-bottom: 5px !important;">
<label id="inv" style="font-family: Calibri;font-size: 20px;">Inventory Period</label>
</h4>
 <div class="col-lg-12" style="padding-left:4px;padding-right: 0px;">
                 		<label id="start"><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group "  value="${startDate}" style="background-color: white; /* width:108%; */" id="indentfromDate" size="20" type="text" onfocus="callCalenderstockindent('indentfromDate')" onclick="callCalenderstockindent('indentfromDate');" placeholder="DD/MM/YYYY">
                	 <!-- 	 <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
	              </div>
	              <div class="col-lg-12" style="padding-left:4px;padding-right: 0px;">
	              <label id="end"><spring:message code="offer_end_date.label"/></label>
	              <input class="form-control calendar_icon  form-group"  value="${endDate}" style="background-color: white; /* width:108%; */" id="indentto" size="20" type="text" onfocus="callCalenderstockindent('indentto')" onclick="callCalenderstockindent('indentto');" placeholder="DD/MM/YYYY">
	             <!--   <span id="EndDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
		           </div>
</div>
                      <br><br>
                    
<br>
<br>
<br>
<div class="col-lg-12 col-xs-12" style="margin-bottom: 10px;margin-top: 20px;">
<div class="col-lg-1"></div>
<div class="col-lg-3 col-xs-6">
 <input type="button" class="btn btn-primary btn-lg" onclick="generateIndents(this);" value="Submit"/ style="padding: 2px 41px 9px 35px;">
</div>
<div class="col-lg-4"></div>
<div class="col-lg-3 col-xs-6">
<input type="button" class="btn btn-primary btn-lg" data-dismiss="modal" value="Cancel" style="padding: 2px 41px 9px 35px;"/>
</div>
<div class="col-lg-1"></div>
</div>
<!-- iosclosebutton1 -->
<br>
</c:when>
<c:when test="${not empty stockRequestsList.responseMessage}">
<p style="font-weight:700;">${stockRequestsList.responseMessage}</p>
<%-- <span style="text-align: center;color: blue;font-size: 2;font-weight: 600;margin-bottom: 10px; margin-top: -20px">${stockRequestsList.responseMessage}</span> --%>
<br>
<c:choose>
<c:when test="${stockRequestsList.responseCode == '2'}">
<spring:message code="summarymessage.label" /><br>
<br>
<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="createprovisionalPo(this,'true')" value="Yes"/>
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="No"/>
</div>
</div>
<br></c:when>
<c:when test="${stockRequestsList.responseCode == '3'}">
<c:forEach var="noSupplierSkuList" items="${stockRequestsList.noSupplierSkuList}">
<span>${noSupplierSkuList},</span>
</c:forEach>
</c:when>
</c:choose> 
</c:when>
<c:otherwise>
<p>Internal error, Please contact TechnoLabs support.</p>
<br>

 </c:otherwise>

</c:choose>
</body>
</html>