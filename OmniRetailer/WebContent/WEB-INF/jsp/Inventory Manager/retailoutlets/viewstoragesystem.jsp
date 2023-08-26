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
	<script src="${pageContext.request.contextPath}/js/storagesystem.js"></script>
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
	var layoutDetails =$('#layoutDetails').val();
	$.each($.parseJSON(layoutDetails), function(idx, obj) {
	  viewTables(obj.layoutID,obj.tableNumber,obj.level,obj.noOfChairs);
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
                                <h3><spring:message code="viewlayout.label" /></h3>
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
                                            <label><spring:message code="layoutname.label" /></label>
                                            <input name="layoutName" type="text" class="form-control number" readonly required id="layoutName" value="${layoutDetails.layoutName}"  />
                                            
                                        </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="layoutdesc.label" /></label>
                                            <input name="layoutDescription" type="text" class="form-control number" readonly required id="layoutDesc" value="${layoutDetails.layoutDescription}"   />
                                            
                                        </div>
                                        </div>
                                        <%--  </c:forEach> --%>
                                        <div class="form-group" style="height: 370px;width: 100%;margin-top: 0px;border-radius: 5px;box-shadow: 0px 0px 13px #6666669;border-color: #CCCCCC;">
		                                 
	                                        
	
	<!-- for displa cart start  -->
	<div style="height: 329px;width: 90%;margin-left: 36px;border-radius: 5px;border: 1px Solid #CCCCCC;box-shadow: 0px 0px 13px #6666669;overflow:auto;
	" id="storageLocation" style=""> 
	<!-- right menu -->
	
	<!-- right menu  -->
	
	<!-- main menu -->
	
	<div id="startArea" style="overflow:auto;">
	
	
	</div>
	<!-- main menu -->
	
	  </div>
	 
	

	<br>
	<div id="result" style="color:red;margin-left:44px;"> </span></div>
	<!-- for displa cart end  -->
	
	
	</div>
                                        <div id="layoutError" style="text-align:center;color:red;font-weight:bold;"></div>
                                        
                                       
                                    </div><!-- /.box-body -->
									
						<div class="row" style="margin:0px 0px 0px 35%;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="editLayout();" value="<spring:message code="edit.label" />" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="return viewConfigurations('configurations');" value="<spring:message code="cancel.label" />" />
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