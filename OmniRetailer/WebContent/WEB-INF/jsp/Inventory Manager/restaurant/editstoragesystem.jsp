<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/editstoragesystem.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
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
	<script src="${pageContext.request.contextPath}/js/restaurent_storagesystem.js"></script>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
	 #Rows , #Columns{
color: #666666;
box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
padding: 5px;
border: 1px solid #E5E5E5;
outline: 0px none;
background: none repeat scroll 0% 0% #FFF;
}
#type{
color: #666666;
box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
padding: 5px;
border: 1px solid #E5E5E5;
outline: 0px none;
background: none repeat scroll 0% 0% #FFF;
width: 170px;
}
user agent stylesheetkeygen, select, select[size="0"], select[size="1"] {
border-radius: 0px;
border-color: rgb(169, 169, 169);}
.selected{
background: #CCCCCC;
}
.unselected{
background: #FFFFFF;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#Error").html("");
    $("#layoutNameError").html("");
    $("#layoutDescError").html("");
     
    $("#layoutName").keydown(function(){
		   $("#layoutNameError").html("");
		   $("#Error").html("");
	 });
    
    $("#layoutDesc").keydown(function(){
		   $("#layoutDescError").html("");
		   $("#Error").html("");
	 });
 
    var layoutDetails =$('#layoutDetails').val();
	$.each($.parseJSON(layoutDetails), function(idx, obj) {
		viewTablesForEdit(obj.layoutID,obj.tableNumber,obj.level,obj.noOfChairs);
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
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="editlayout.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                   <%--   <c:forEach var="layoutInfo" items="${layoutDetails}"> --%>
                                     <div class="row">
                                         <div class="form-group col-lg-4">
                                           <label><spring:message code="storecode.label" /></label>
                                           <input name="storeCode" type="text" class="form-control number" readonly required id="workLocation" value="${layoutDetails.outletId}" />
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="layoutname.label" /> <span class="requiredField">*</span></label>
                                            <input name="layoutName" type="text" class="form-control number" required id="layoutName" value="${layoutDetails.layoutName}"  />
                                            <span id="layoutNameError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="layoutdesc.label" /> <span class="requiredField">*</span></label>
                                            <input name="layoutDescription" type="text" class="form-control number" required id="layoutDesc" value="${layoutDetails.layoutDescription}"   />
                                            <span id="layoutDescError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        <%--  </c:forEach>   need to know about new and delete button --%>
                                        <div class="form-group" style="height: 370px;width: 100%;margin-top: 0px;border-radius: 5px;box-shadow: 0px 0px 13px #6666669;border-color: #CCCCCC;">
		                                 	<input type="button" value="New" style="height: 27px;width: 50px;cursor:pointer;font-weight: bold;background: #666666;color: #FFFFFF;border: 1px solid #CCCCCC;border-radius: 5px;opacity: 0.9;margin-top: 10px;margin-bottom: 10px;margin-left: 38px;" onclick="addNewLevel()"> 
	                                        <!-- <input type="button" value="Save" style="height: 27px;width: 50px;font-weight: bold;cursor:pointer;background: #666666;color: #FFFFFF;border: 1px solid #CCCCCC;border-radius: 5px;opacity: 0.9;margin-top: 10px;margin-bottom: 10px;" onclick="SaveOutlet()"> --> 
	                                        <input type="button" value="Delete" style="height: 27px;width: 50px;font-weight: bold;background: #666666;cursor:pointer;color: #FFFFFF;border: 1px solid #CCCCCC;border-radius: 5px;opacity: 0.9;margin-top: 10px;margin-bottom: 10px;" onclick="deleteOutLet()"> 
	
	<!-- for displa cart start  -->
	<div style="height: 329px;margin-top: -8px;width: 90%;margin-left: 36px;border-radius: 5px;border: 1px Solid #CCCCCC;box-shadow: 0px 0px 13px #6666669;overflow:auto;
	" id="storageLocation" style=""> 
	<!-- right menu -->
	<div style="float:right;border-left: 1px solid #CCCCCC;height: 328px;width: 61px;" >
	<center ><img src="${pageContext.request.contextPath}/images/add.png;" style="margin-top:10px;cursor: pointer;" title="Add New Table" onclick="addNewTable()" ><br>
	<span style="font-weight: bold;color:#666666;">Add</span></center>
	<center id="deleteEle" style=";"><img src="${pageContext.request.contextPath}/images/del.png;" style="margin-top:10px;cursor: pointer;" title="Delete Table" onclick="deleteTable()"><br>
	<span style="font-weight: bold;color:#666666;">Delete</span></center>
	</div>
	<!-- right menu  -->
	
	<!-- main menu -->
	
	<div id="startArea" style="overflow:auto;">
	
	
	</div>
	<!-- main menu -->
	
	  </div>
	 
	
	 <!-- for popup gui -->
	<div id="popUp" style="border:1px solid #CCCCCC;width:150px;border-radius:5px;position: absolute;display: none;background: #FFFFFF;">
	<span style="float:right;cursor:pointer;" title="Close Popup" onclick="closePopUp()"><img src="${pageContext.request.contextPath}/images/delete.png"></span>
		<!-- <center id="deleteEle" style="cursor: pointer;" title="Remove Table" onclick="deleteTable()"><img src="images/del.png;" style="margin-top:10px;cursor: pointer;vertical-align: -4px;" title="Add New Table" onclick="deleteTable()">
	<span style="font-weight: bold;color:#666666;">Remove</span></center><hr>
	 --><center>
	<span style="font-weight: bold;color:#666666;margin-left:-30px;">Table Id <br>
	<input type="text" name="seatsNum" id="tableId" style="color: #666666;box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);padding: 5px;border: 1px solid #E5E5E5;outline: 0px none;background: none repeat scroll 0% 0% #FFF;width: 82px;margin-left: -7px;"></span>
	</center>
	<span style="font-weight: bold;color:#666666;margin-left:22px;">Seats <br>
	<input type="number" name="seatsNum" id="seatsNumber" style="color: #666666;box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);padding: 5px;border: 1px solid #E5E5E5;outline: 0px none;background: none repeat scroll 0% 0% #FFF;width: 82px;margin-left: 22px;"></span>
	</center>
	<center><input type="button" value="Ok" style="height: 27px;width: 50px;font-weight: bold;background: #666666;color: #FFFFFF;border: 1px solid #CCCCCC;border-radius: 5px;opacity: 0.9;margin-top: 10px;margin-bottom: 10px;" onclick="addSeatsInfo()"> </center>
	
	</div>
		<!-- for popup gui -->

	<br>
	<div id="result" style="color:red;margin-left:44px;"> </span></div>
	<!-- for displa cart end  -->
	
	
	</div>
                                        <div id="layoutError" style="text-align:center;color:red;font-weight:bold;"></div>
                                        
                                       
                                    </div><!-- /.box-body -->
									
						<div class="row" style="margin:0px 0px 0px 35%;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="validateRestaurantLayout('edit');" value="<spring:message code="save.label" />" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="return viewRestaurantConfigurations('restaurantConfig');" value="<spring:message code="cancel.label" />" />
						</div>
										<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    <input type="hidden" id="layoutDetails" value='${tablesList}'/>
                                   <input type="hidden" id="layoutInfo" />
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
</body>
</html>