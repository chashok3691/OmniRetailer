<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%-- <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> --%>
    <%@ taglib prefix="ln" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders | Menu Items</title>
<!--    <script>
        $(document).keypress(function (event) {
  debugger;
        	 if (event.keyCode === 96) {
            	 getOrdersMenuDetails('','','');
    		    }
        });
    </script> -->
<style type="text/css">

.modal-dialog2 {
    margin: 100px 210px;
}
.table-responsive {
	height: 300px;
    overflow-x: hidden;
    overflow-y: auto;
    padding: 0px 10px;
}
ul#menu li {
  display: inline-block;
  padding: 10px;
  /* border-right: 1px solid white; */
}
.header-Menu {
	margin: 10px 0px 10px 10px;
	background-color: #a1dbf1;
	color: #000;
	font-weight: 700;
}
.liMenuActive {
	background: green;
    color: white;
}
.stickyheader {
  position: sticky !important;
  top: 0;
 z-index: 10 !important;
}

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 2;
}

</style>
</head>
<body>

<section class="content">
<div class="row">
<c:set var="menuAllCats" value="${ln:length(menuCategoriesList)}" />
<input type="hidden" id="menuAllCats" value="${ln:length(menuCategoriesList)}">	
   
       <div class="modal fade popup-display" id="menuItemsModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" style="margin: 6% 24%;width: 70%;">
                <div class="modal-content" style="">
                    <div class="modal-header" style="padding: 0px 10px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <%-- <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4> --%>
                    </div>
                 <div class="modal-body" style="padding: 20px; padding-top: 0px;">
                 <div id="ErrorforMenu" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                 <div id="SuccessforMenu" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                 
                 
                 <div class="header-Menu">
                 <ul id="menu" style="padding-inline-start: 0px;">
                 <li class="MClist liMenuActive" style="border-right: 1px solid white !important" onclick="getOrdersMenuDetailspagination('ALL','');">ALL</li>
                 <c:forEach var="menuCategories" items="${menuCategoriesList}" varStatus="theCount">
				 <li class="MClist${theCount.count}" style="border-right: 1px solid white !important" id="${menuCategories.category_name}" onclick="getOrdersMenuDetailspagination('${menuCategories.category_name}','${theCount.count}');">${menuCategories.category_name}</li>
                 </c:forEach>
				 </ul> 
                 </div>
                  <div class="box-body table-responsive">
                  	<input type='hidden' id='selectedLocationId' >
                     <table id="selectedItemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff;" class="stickyheader">
                         <tr>
                             <th>S.No</th>
							 <th><spring:message code="item.code.label" /></th>
							 <th><spring:message code="item.desc.label" /></th>
							 <th><spring:message code="uom.label"/></th>
							 <%-- <th><spring:message code="mrp.label"/></th> --%>
							 <th><spring:message code="mrp.label"/></th>
							 <th><spring:message code="pack.label" /></th>
							
                         </tr>
                       </thead>
                       
                       <tbody style="text-align: center;" id="ALL">
                     <c:forEach var="menu" items="${menuItemsList}" varStatus="theCount">
                     <tr id="div${theCount.count}" style='margin-top:5px;' class="tbodyItems" onclick="getSkuDetailsNewOrder('${menu.pluCode}','${menu.item_desc}');">
                     <td class="menuslno" style="">${theCount.count}</td>
                       <input type="hidden" id="pluCode${theCount.count}" value="${menu.pluCode}"/>
                     	<td id="itemName${theCount.count}">${menu.sku_id}</td>
                     	<td id="itemDesc${theCount.count}">${menu.item_desc}</td>
                     	<td id="measureRange${theCount.count}">${menu.unit_of_measurement}</td>
                     	<%-- <td name='mrp' id="mrp${theCount.count}">${menu.mrp}</td> --%>
                     	<td name='unitPrice' id="unitPrice${theCount.count}">${menu.unit_price}</td>
                     	<td name='qty' id="qty${theCount.count}">${menu.qty}</td>
                     	<%-- <td><input class='form-control' style='width: 50px' type='text' onblur='textBoxColor(this)' name='unitPrice' id="unitPrice${theCount.count}" value="${menu.unit_price}"/></td> --%>
                     	<%-- <td><input style='width: 50px' class='form-control' type='text' onblur='textBoxColor(this)' name='qty' id="qty${theCount.count}" value="${menu.qty}"/></td> --%>
                     	<%-- <td id="Del${theCount.count}"><img id="action${theCount.count} "alt="" style="width:24px;cursor:pointer;" onclick='deleteProduct(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td> --%>
                   	 </tr>
                   </c:forEach>
			       	</tbody>
			       	 <c:forEach var="menuCat" items="${menuCategoriesList}" varStatus="categoryCount">
			       	  <tbody style="text-align: center;display: none" id="cat${categoryCount.count}">
                     <c:forEach var="menu" items="${menuCat.menuItemsList}" varStatus="theCount">
                      <tr id="div${theCount.count}" style='margin-top:5px;' class="tbodyItems" onclick="getSkuDetailsNewOrder('${menu.pluCode}','${menu.item_desc}');">
                     <td class="menuslno" style="">${theCount.count}</td>
                       <input type="hidden" id="pluCode${theCount.count}" value="${menu.pluCode}"/>
                     	<td id="itemName${theCount.count}">${menu.sku_id}</td>
                     	<td id="itemDesc${theCount.count}">${menu.item_desc}</td>
                     	<td id="measureRange${theCount.count}">${menu.unit_of_measurement}</td>
                     	<%-- <td name='mrp' id="mrp${theCount.count}">${menu.mrp}</td> --%>
                     	<td name='unitPrice' id="unitPrice${theCount.count}">${menu.unit_price}</td>
                     	<td name='qty' id="qty${theCount.count}">${menu.qty}</td>
                     	<%-- <td><input class='form-control' style='width: 50px' type='text' onblur='textBoxColor(this)' name='unitPrice' id="unitPrice${theCount.count}" value="${menu.unit_price}"/></td> --%>
                     	<%-- <td><input style='width: 50px' class='form-control' type='text' onblur='textBoxColor(this)' name='qty' id="qty${theCount.count}" value="${menu.qty}"/></td> --%>
                     	<%-- <td id="Del${theCount.count}"><img id="action${theCount.count} "alt="" style="width:24px;cursor:pointer;" onclick='deleteProduct(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td> --%>
                   	 </tr>
                   </c:forEach>
			       	</tbody>
			       
			       	 </c:forEach>
			       	
			       	
			       		
                </table>
                 </div>
                 <br>
                 <div class="row" style="text-align: center;">
						<input type="button" id="cancelSelection" class="btn bg-olive btn-inline" style="margin-right: 1%;padding: 6px 35px;" data-dismiss="modal" aria-hidden="true" value="<spring:message code="cancel.label" />" />
                 </div>
              </div>
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 
</div>
</section>
<script type="text/javascript">
            $(function() {
            	
             $('#selectedItemsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                });
             });
        </script>
</body>
</html>