<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/menu/editMenuItems.jsp
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
 	<script src="${pageContext.request.contextPath}/js/menuWarehouse.js"></script>   
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery.stickyheader.js"></script> --%>
<style type="text/css">
.col-lg-12 {
    margin-right: -2%;
    margin-left: 1%;
    width: 99%;
}




/*  thead, tbody, tr, td, th #itemsList{ display: block; }

 tr:after #itemsList{
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
} 

thead th #itemsList{
    height: 45px;

}
    /*text-align: left;*/
/*
tbody{
    height: 220px;
    overflow-y: auto;
}

thead #itemsList{
    /*  fallback  */
/*}

 tbody td, thead th #itemsList{
      width: 16%; 
    float: left;
}  

 tbody #itemsList{
    height: 220px;
}

thead th #itemsList{
    height: 40px;
}   */

/*  .sticky-wrap {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    margin: 3em 0;
    width: 100%;
}

.sticky-wrap.overflow-y {
    overflow-y: auto;
    max-height: 50vh;
}

.sticky-wrap .sticky-thead {
    opacity: 0;
    position: absolute;
    top: 0;
    left: 0;
    transition: all .125s ease-in-out;
    z-index: 50;
    width: auto;
}

.sticky-wrap .sticky-thead {
    box-shadow: 0 0.25em 0.1em -0.1em rgba(0,0,0,.125);
    z-index: 100;
    width: 100%;
}
.sticky-enabled{
 margin: 0px;
  width: 100%;
}

.sticky-thead{
width: 1828px;
 opacity: 0;
  top: 0px;
  }

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
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
             <h3><spring:message code="edit.menu.item.label" /></h3>
             </div><!-- /.box-header -->
             <!-- form start -->
             <form id="newMenu" method="post">
                 <div class="box-body">
                	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                     <div id="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                      <div class="row">
                   
						<div class="form-group col-lg-4">
                                  <label><spring:message code="outlet.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                  <select class="form-control" name="outlet_name" disabled="disabled" id="outlet_name" onchange="getMenuNames();" >
<!--                                      <option value="all">ALL</option> -->
                                  
											<c:forEach var="locaton" items="${storesList}">
												<option value="${locaton}" >${locaton}</option>
											</c:forEach>
											
									
                                 </select>
                         </div>
                           <input type="hidden" id="outletname" value='${outletLocationname}'>
                        <div class="form-group col-lg-4">
                         	<label><spring:message code="menu.name.label" /> <span style="color:red; font-size:2">*</span></label>
                         	<input type="text" class="form-control" name=menu_name id="menuName" readonly="readonly" value="${menuDetailsList.menu_name}" />
                        	<input type="hidden" id="desc" />
                        	</div>
                      	
                      	<div class="form-group col-lg-4" style="">
                        <label><spring:message code="category.name.label" /></label>
                   			<select class="form-control" name="category_name" id="category_name" onchange="getCategoryDetailsBasedOnCategory('category_name','menuName')">
                   			   <option value="">ALL</option>
                   			     <c:forEach var="category" items="${menuCategoryNamesList}">
									<option value="${category}">${category}</option>
								</c:forEach>
                            </select>
                   		</div>
                       </div>
                           <input type="hidden" id="selectedLocations" value="${menuDetailsList.locationsList}">
                       
                    <div class="row">
                            <!-- <div class="col-lg-3"></div> -->
                               <div class="form-group col-lg-12" style="    margin-bottom: -3px;">
                                  <%--  <label><spring:message code="search.items.here.label" /></label> --%>
                                    <input type="text"  class="form-control searchItems" id="menuItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl menuItems" style=""></ul>
								   				</div>
											</div> 
                                    <!--  <input type="text" list="items" class="form-control"  name="searchCriteria" id="searchCriteria" />
 										<datalist id="items">
													
										</datalist> -->
  								</div>
  								
  								<%-- <div class="col-lg-1" style="">
    					   <a  onclick="clearTableData();" style="padding: 6px 8px;width: 100%;" class="btn bg-olive btn-inline  addBtn" ><spring:message code="clearbutton.label"/></a>
						</div> --%>
                               
                         </div> 
                         
                         
<!--                          <div class="sticky-wrap overflow-y">
<table class="sticky-enabled" style="margin: 0px; width: 100%;">
<table class="sticky-thead" style="width: 1828px; opacity: 0; top: 0px;"> -->
                         
                         
                        <!--  <div class="sticky-wrap overflow-y"> -->
                    <div class="box-body table-responsive" style="max-height: 450px;min-height: 150px;overflow:auto;">
                     <table id="itemsList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                         	<th style="">SNo.<%-- <spring:message code="sl.no.label"/> --%></th>
                         	<th><div style="width:100px;"><spring:message code="category.name.label"/></div></th>
                         	<th><div style="width:72px;"><spring:message code="item.name.label"/></div></th>
                             <th><div style="width:65px;"><spring:message code="item.desc.label"/></div></th>
                             <th><spring:message code="item.type.label"/></th>
                             <th><spring:message code="uom.label"/></th>
                             <th><spring:message code="qty.label"/></th>
                             <th><div style="width:65px;"><spring:message code="unit.price.label"/></div></th>
                             <th><div style="width: 110px;"><spring:message code="item.availabity.label"/></div></th>
                             <th><spring:message code="item.icon.label"/></th>
                             <th><spring:message code="item.picture1.label"/></th>
                             <th><spring:message code="item.picture2.label"/></th>
                             <th><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody>
<%--                       <c:forEach var="menuDetailsList" items="${menuDetailsList.menuCategories}" varStatus="theCount">  --%>
                     <c:forEach var="menu" items="${menuItemsDetailsList}" varStatus="theCount">
                     <tr id="div${theCount.count}" style='margin-top:5px;' class="tbodyItems">
                     <td class="slno" style="">${theCount.count}</td>
                       <input type="hidden" id="pluCode${theCount.count}" value="${menu.pluCode}"/>
                     	<td id="categoryName${theCount.count}">${menu.category_name}</td>
                     	<td id="itemName${theCount.count}">${menu.sku_id}</td>
                     	<td id="itemDesc${theCount.count}">${menu.item_desc}</td>
                     	<td><select class='form-control' style='width: 100px' name='item_type' id="item_type${theCount.count}"><option value='Normal' ${'Normal' == menu.item_type ? 'selected' : ''}>Normal</option><option value='Radiology' ${'Radiology' == menu.item_type ? 'selected' : ''}>Radiology</option><option value='Specility' ${'Specility' == menu.item_type ? 'selected' : ''}>Specility</option><option value='Package' ${'Package' == menu.item_type ? 'selected' : ''}>Package</option></select></td>
                     	<td  id="uom${theCount.count}">${menu.unit_of_measurement}	</td>
                     	<%-- <select class='form-control' style='width: 100px' name='item_type' id="uom${theCount.count}"><option value='PAX' ${'PAX' == menu.unit_of_measurement ? 'selected' : ''}>PAX</option><option value='NOS' ${'NOS' == menu.unit_of_measurement ? 'selected' : ''}>NOS</option><option value='GLASS' ${'GLASS' == menu.unit_of_measurement ? 'selected' : ''}>GLASS</option><option value='PEG' ${'PEG' == menu.unit_of_measurement ? 'selected' : ''}>PEG</option><option value='BOTTLE' ${'BOTTLE' == menu.unit_of_measurement ? 'selected' : ''}>BOTTLE</option><option value='ML' ${'ML' == menu.unit_of_measurement ? 'selected' : ''}>ML</option><option value='BTL ML' ${'BTL ML' == menu.unit_of_measurement ? 'selected' : ''}>BTL ML</option><option value='GLS ML' ${'GLS ML' == menu.unit_of_measurement ? 'selected' : ''}>GLS ML</option><option value='PITCHER' ${'PITCHER' == menu.unit_of_measurement ? 'selected' : ''}>PITCHER</option></select> --%>
                     
                     	<td><input style='width: 50px' class='form-control' type='text' onblur='textBoxColor(this)' name='qty' id="qty${theCount.count}" value="${menu.qty}"/></td>
                     	<td><input class='form-control' style='width: 50px' type='text' onblur='textBoxColor(this)' name='unitPrice' id="unitPrice${theCount.count}" value="${menu.unit_price}"/></td>
                     	<td><select class='form-control' style='width: 100px' name='item_available' id="item_available${theCount.count}"><option value='true' ${'true' == menu.item_availability ? 'selected' : ''}>Active</option><option value='false' ${'false' == menu.item_availability ? 'selected' : ''}>Inactive</option></select></td>
                     	<td><div class='row'><div class='form-group col-lg-9'><input id="item_icon${theCount.count}" style="width:232px;" type="file" onchange="loadImageFileAsURL('item_icon',this)"><span id="item_iconError${theCount.count}" style="color: red;"></span></div><div id="item_icon_image${theCount.count}" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="${menu.item_icon}" alt="No Image" /></div></div><input type="hidden" id="item_icon_byte${theCount.count}" value="${menu.item_icon}"><input type="hidden" id="item_icon_refId${theCount.count}"><input type="hidden" id="item_icon_name${theCount.count}"></td>
                     	<td><div class='row'><div class='form-group col-lg-9'><input id="item_pic1${theCount.count}" style="width:232px;" type="file" onchange="loadImageFileAsURL('item_pic1',this)"><span id="item_pic1Error${theCount.count}" style="color: red;"></span></div><div id="item_pic1_image${theCount.count}" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="${menu.item_picture1}" alt="No Image"/></div></div><input type="hidden" id="item_pic1_byte${theCount.count}" value="${menu.item_picture1}"><input type="hidden" id="item_pic1_refId${theCount.count}"><input type="hidden" id="item_pic1_name${theCount.count}"></td>
                     	<td><div class='row'><div class='form-group col-lg-9'><input id="item_pic2${theCount.count}" style="width:232px;" type="file" onchange="loadImageFileAsURL('item_pic2',this)"><span id="item_pic2Error${theCount.count}" style="color: red;"></span></div><div id="item_pic2_image${theCount.count}" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="${menu.item_picture2}" alt="No Image"/></div></div><input type="hidden" id="item_pic2_byte${theCount.count}" value="${menu.item_picture2}"><input type="hidden" id="item_pic2_refId${theCount.count}"><input type="hidden" id="item_pic2_name${theCount.count}">
                     	<input type="hidden" id="menu_item_id${theCount.count}" value="${menu.sno}"></td>
                     	<td id="Del${theCount.count}"><img id="action${theCount.count} "alt="" style="width:24px;cursor:pointer;" onclick='deleteProduct(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                   </tr>
                     </c:forEach>
<%--                      </c:forEach> --%>
			 	</tbody>
              </table>
           </div>
          <!--  </div> -->
    <div class="row" style="text-align: center;">
	 	<input type="button" class="btnCls" style="" onClick="validateMenuItems('edit','${flowUnder}');" value="<spring:message code="submit.label" />" />
		<input type="button" class="btnCls buttonMargin" style="" onclick="return getMenuItems('cancel''${flowUnder}');" value="<spring:message code="cancel.label" />" />
	</div>
	<br/>
	</div>
 <div class="box-footer">
  
 </div>
    </form>

</div>
  <input type="hidden" id="subCategories" value='${subCategories}'> 
  <%-- <input type="hidden" id="outlet_name" value='${outletLocationname}'> --%> 
</div>
</div>
</section><!-- /.content -->

</body>
</html>