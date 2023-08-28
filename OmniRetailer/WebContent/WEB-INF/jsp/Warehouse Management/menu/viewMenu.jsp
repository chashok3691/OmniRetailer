<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/menu/viewMenu.jsp
 * file type		        : JSP
 * description				: The view Menu is displayed using this jsp
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
	
<style type="text/css">
	.modal-dialog{
	width: 80%;
	}
</style>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 3%;
	margin-top:1%;
}
a.button, .list a.button {
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
}


/* table {
        width: 100%;
    } */

/* thead, tbody, tr, td, th { display: block; }

 tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
} 

thead th {
    height: 40px;
 */
    /*text-align: left;*/
/* }

tbody {
    height: 220px;
    overflow-y: auto;
}

thead { */
    /* fallback */
/* }


 tbody td, thead th {
   /*  width: 25px; */
   /* float: left;
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
             <h3><spring:message code="view.menu.label" /></h3>
             </div><!-- /.box-header -->
             <!-- form start -->
             <form id="newMenu" method="post" >
                 <div class="box-body">
                	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                      <div class="row">
<!--                         <div class="col-lg-3"></div> -->
						<div class="form-group col-lg-4">
                                  <label><spring:message code="outlet.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                 <%--  <input type="text" class="form-control" name=outlet_name id="outlet_name" readonly="readonly" value="${menuDetailsList.outlet_name}" /> --%>
                                 <select class="form-control" disabled="disabled" name="outlet_name" id="outlet_name" >
<!--                                        <option value="all">ALL</option> -->
                                     
									
								
											<c:forEach var="locaton" items="${storesList}">
												<option value="${locaton}" ${locaton == menuDetailsList.outlet_name ? 'selected' : ''} id="${locaton}" >${locaton}</option>
											</c:forEach>
											
									
									
                                 </select> 
                        </div>
                           <input type="hidden" id="selectedLocations" value="${menuDetailsList.locationsList}">
                         <input type="hidden" id="outletname" value='${outletLocationname}'> 
                         <input type="hidden" id="outlet_name" value='${outletLocationname}'> 
						<div class="form-group col-lg-4">
                         	<label><spring:message code="menu.name.label" /> <span style="color:red; font-size:2">*</span></label>
                         	<input type="text" class="form-control" name=menu_name id="menu_name" readonly="readonly" value="${menuDetailsList.menu_name}" />
                      		<span id="menuNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="col-lg-4">
							 <label><spring:message code="status.label" /></label>
							 <%-- <input type="text"  value="${menuDetailsList.status}"> --%>
                                  <select class="form-control" name="status" id="status" disabled="disabled">
                                   		<option value="true" ${'true' == menuDetailsList.status ? 'selected' : ''}>Active</option>
                                    	<option value="false" ${'false' == menuDetailsList.status ? 'selected' : ''}>InActive</option>
									</select> 
							</div>
						
<!-- 						<div class="col-lg-3"></div> -->
                       </div>
                   <div class="box-body table-responsive"  style="max-height: 450px;min-height: 150px;overflow:auto;">
                     <table id="categoriesList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff;">
                         <tr >
                         <th style="width:75px;"><spring:message code="sl.no.label"/></th>
                         	<th style="width:325px;"><spring:message code="category.name.label"/></th>
                             <th style="width:245px;"><spring:message code="category.description.label"/></th>
                             <th style="width:245px;"><spring:message code="category.icon.label"/>&nbsp;</th>
                         </tr>
                       </thead>
                       <tbody style="text-align:center;">
                       
                     <c:forEach var="menu" items="${menuDetailsList.menuCategories}">
                     <tr>
                     <td style="width:75px;">${menu.slNo}</td>
                     	<td style="width:325px;">${menu.category_name}</td>
                     	<td style="width:245px;">${menu.category_desc}</td>
                     	<td style="width:245px;"><img style="width:40px;height:40px;" src="${menu.category_icon}" alt="No Image"/></td>
                     	<%-- <td style="width:245px;"><img style="width:40px;height:40px;" src="data:image/jpeg;base64,${menu.categoryIcons}" /></td> --%>
                   </tr>
                     </c:forEach>
                 	</tbody>
                    </table>
                 </div>
                 
                 <div class="row" style="padding-left: 1%;padding-right: 1%">
                     <div class="form-group  col-lg-12">
                     	<label><spring:message code="remarks.label" /></label>
                        <textarea class="form-control" style="resize:none" name="remarks" id="remarks" readonly="readonly" rows="2" placeholder="<spring:message code="enter.remarks.label" />" >${menuDetailsList.remarks}</textarea>
					</div>
                    </div>
                 
                 </div><!-- /.box-body -->
   
									
						<div class="row" style="text-align: center;">
						<input type="button" class="btnCls" style="" onclick="getMenuCategories();" value="<spring:message code="cancel.label" />" />
						</div>
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                </form>
                            </div>
                         
</div>
</div>
</section><!-- /.content -->

</body>
</html>