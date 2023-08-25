<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/menu/viewMenuItems.jsp
 * file type		        : JSP
 * description				: The new Menu is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
 <script src="${pageContext.request.contextPath}/js/menu.js"></script>   
	
<style type="text/css">
/* 	thead, tbody, tr, td, th { display: block; }

 tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
} 

thead th {
    height: 48px;

  
}

tbody {
    height: 220px;
    overflow-y: auto;
}

thead {
     fallback 
}


 tbody td, thead th {
    width: 8.3%;
    float: left;
}  */
</style>

<script>
$(document).ready(function(){
var slectedLocations = $("#selectedLocations").val().replace('[','').replace(']','').replace(/, /g,',');
$("#outlet_name").val(slectedLocations.split(','));
});
</script>

</head>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
             <div class="box-header" style="text-align: center">
             <br/>
             <h3><spring:message code="view.menu.item.label" /></h3>
             </div><!-- /.box-header -->
             <!-- form start -->
             <form id="newMenu" method="post" >
                 <div class="box-body">
                	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                      <div class="row">
<!--                       <div class="form-group col-lg-3"></div> -->
						<div class="form-group col-lg-4">
                                  <label><spring:message code="outlet.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                  <select class="form-control" disabled="disabled" name="outlet_name" id="outlet_name">
                                      <c:forEach var="store" items="${storesList}">
											<option value="${store.location}" ${store.location == menuDetailsList.outlet_location ? 'selected' : ''}>${store.location}</option>
									</c:forEach>
                                 </select>
                     </div>
                       <%-- <input type="hidden" id="outlet_name" value='${outletLocationname}'>  --%>
                        <div class="form-group col-lg-4">
                         	<label><spring:message code="menu.name.label" /> <span style="color:red; font-size:2">*</span></label>
                         	<input type="text" class="form-control" name=menu_name id="menu_name" readonly="readonly" value="${menuDetailsList.menu_name}" />
                       	<input type="hidden" id="desc" />
                      	</div>
                      	  <input type="hidden" id="outletname" value='${outletLocationname}'>
                      	<div class="form-group col-lg-4" style="">
                        <label><spring:message code="category.name.label" /></label>
                   			<select class="form-control" name="category_name" id="category_name" disabled="disabled">
                   			       <option value="">ALL</option>
                   			     <c:forEach var="category" items="${menuCategoryNamesList}">
									<option value="${category}">${category}</option>
								</c:forEach>
                            </select>
                   		</div>
					   </div>
                <input type="hidden" id="selectedLocations" value="${menuDetailsList.locationsList}">
                    <div class="box-body table-responsive" style="max-height: 450px;min-height: 150px;overflow:auto;padding-left: 0px;
    padding-right: 0px;">
                     <table id="itemsList" class="table table-bordered table-hover">
                     
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                         	<th>SNo</th>
                         		<th><div style="width:100px;"><spring:message code="category.name.label"/></div></th>
                         	<th><div style="width:72px;"><spring:message code="item.name.label"/></div></th>
                             <th><div style="width:65px;"><spring:message code="item.desc.label"/></div></th>
                             <th><spring:message code="item.type.label"/></th>
                             <th><spring:message code="uom.label"/></th>
                             <th><spring:message code="qty.label"/></th>
                             <th><spring:message code="unit.price.label"/></th>
                             <th><spring:message code="item.availabity.label"/></th>
                             <th><spring:message code="item.icon.label"/></th>
                             <th><spring:message code="item.picture1.label"/></th>
                             <th><spring:message code="item.picture2.label"/></th>
                         </tr>
                       </thead>
                       <tbody>
                       
                           
<%--                      <c:forEach var="menuDetailsList" items="${menuDetailsList.menuCategories}" varStatus="theCount">  --%>
                     <c:forEach var="menu" items="${menuitemsList}" varStatus="theCount">
                     <tr>
                     	<td style="text-align: center;">${theCount.count}</td>
                     	<td style="text-align: center;">${menu.category_name}</td>
                     	<td style="text-align: center;">${menu.item_name}</td>
                     	<td style="text-align: center;">${menu.item_desc}</td>
                     	<td style="text-align: center;">${menu.item_type}</td>
                     	<td style="text-align: center;">${menu.unit_of_measurement}</td>
                     	<td style="text-align: center;">${menu.qty}</td>
                     	<td style="text-align: center;">${menu.unit_price}</td>
                     	<td style="text-align: center;">${menu.item_availability}</td>
                     	<td style="text-align: center;"><img style="width:40px;height:40px;" src="${menu.item_icon}" alt="No Image" /></td>
                     	<td style="text-align: center;"><img style="width:40px;height:40px;" src="${menu.item_picture1}" alt="No Image" /></td>
                     	<td style="text-align: center;"><img style="width:40px;height:40px;" src="${menu.item_picture2}" alt="No Image" /></td>
                    </tr>
                     </c:forEach>
<%--                      </c:forEach> --%>
			 	</tbody>
              </table>
           </div>
         </div><!-- /.box-body -->
    <div class="row" style="text-align: center;">
		<input type="button" class="btnCls" style="" onclick="getMenuItems('cancel');" value="<spring:message code="cancel.label" />" />
	</div>
	<br/>
 <div class="box-footer">
  
 </div>
    </form>
</div>
  <input type="hidden" id="subCategories" value='${subCategories}'>
  
   
</div>
</div>
</section><!-- /.content -->

</body>
</html>