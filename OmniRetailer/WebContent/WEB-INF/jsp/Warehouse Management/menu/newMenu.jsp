<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/menu/newMenu.jsp
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
 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <script src="${pageContext.request.contextPath}/js/menuWarehouse.js"></script>
	
<style type="text/css">
	.modal-dialog{
	width: 80%;
	}
</style>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2.5%;
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

</style>


<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	

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
             <h3><spring:message code="new.menu.label" /></h3>
             </div><!-- /.box-header -->
             <!-- form start -->
             <form id="newMenu" method="post" >
                 <div class="box-body">
                	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                	<div id="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                      <div class="row">
<!--                         <div class="col-lg-2"></div> -->
                        
                        	<%-- <div class="form-group span2">
                                   	  	   <label><spring:message code="location.label" /></label>
		                                       <select class="form-control" style="height:98px;" name="location" id="offerLocation" multiple="multiple">
		                                          <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											   </c:forEach>
									 		</select>
                                   	  </div> --%>
                        
                         <input type="hidden" id="selectedLocations" value="${menuDetailsList.locationsList}">
						<div class="form-group col-lg-4">
                                  <label>Warehouse Location<span style="color:red; font-size:2">*</span></label>
                                  <select class="form-control" name="outlet_name" id="outlet_name" >
<!--                                      <option value="all">ALL</option> -->
                                      
											<c:forEach var="locaton" items="${workLocationsList}">
												<option value="${locaton}" ${locaton == selectedStore ? 'selected' : ''} id="${locaton}" >${locaton}</option>
											</c:forEach>
											
                                 </select>
                        </div>
                  
						<div class="form-group col-lg-4">
                         	<label><spring:message code="menu.name.label" /> <span style="color:red; font-size:2">*</span></label>
                         	<input type="text"  onblur="criteria(this)"  class="form-control" name=menu_name id="menu_name" value="${menuDetailsList.menu_name}" required placeholder="<spring:message code="enter.menu.name.label" />" />
                      		<span id="menuNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						
						
						<div class="col-lg-4">
							 <label><spring:message code="status.label" /></label>
							 <%-- <input type="text"  value="${menuDetailsList.status}"> --%>
                                  <select class="form-control" name="status" id="status">
                                   		<option value="true" ${'true' == menuDetailsList.menu_status ? 'selected' : ''}>Active</option>
                                    	<option value="false" ${'false' == menuDetailsList.menu_status ? 'selected' : ''}>InActive</option>
									</select> 
							</div>
						
						
						
						
                       </div>
                       <div class="row">
                        <div class="buttons" style="margin-bottom: -5px;">
		  				     <a onclick="addCategory();" class="btnCls"><font size="2px"><spring:message code="addCategory.label" /></font></a>
		   			    </div>
                   		</div>
                  	<div class="box-body table-responsive"  style="max-height: 450px;overflow: auto;min-height: 150px;">
                     <table id="categoriesList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                          <th ><spring:message code="sl.no.label"/></th>
                         	<th style="width: 250px"><spring:message code="category.name.label"/></th>
                             <th ><spring:message code="category.description.label"/></th>
                             <th style="width: 50px"><spring:message code="category.icon.label"/></th>
                             <th style="width: 50px"><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align:center;">
                       
                       <c:choose>
                       <c:when test="${empty menuDetailsList.menu_category_details }">
                         <tr id='dynamicdiv1'>
                        <td class="slno" style="width: 75px">1</td>
                         	<td style="width: 248px"><input type="hidden"    id="category_name_hidden1" value=""><input class="form-control" onblur='textBoxColor(this);criteria(this);' type="text" name="category_name" id="category_name1"  /></td>
                             <td style="width: 180px"><textarea class="form-control"  onblur="criteria(this)"  name="category_desc" id="category_desc1" rows="1" ></textarea></td>
                             <td style="width: 325px">
                             <div class="row">
                             <div class="form-group col-lg-9">
                             <input id="category_icon1" name="category_icon1" type="file" onchange="loadImageFileAsURL('category_icon1',this);">
                             <span id="category_iconError1" style="color: red;"></span>
                             </div>
                             <div id="category_icon1_image1" class="form-group col-lg-3" style="width:65px;height:20px;">
                             </div>
                             </div>
                             <input type='hidden' id='category_icon_byte1'>
                             <input type="hidden" id="category_icon1_refId1" name="category_icon1_refId" />
                             <input type="hidden" id="category_icon1_name1"></td>
                             <td style="width: 56px" id="Del1"><!-- <a data-toggle="modal" data-target="#items-modal">Add Items&nbsp;&nbsp;&nbsp;</a><a>View Items &nbsp;&nbsp;&nbsp; </a> --><img id="action1" alt="" style="width:24px;height:24px;cursor:pointer;" onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png">
                             <!-- <input type="hidden" id=""> --> </td>
                         </tr> 
                         </c:when>
                         
                       <c:otherwise>        
                     <c:forEach var="menu" items="${menuDetailsList.menu_category_details}" varStatus="theCount">
                     
                     <tr id="dynamicdiv${theCount.count}" style="margin-top:5px;text-align:center;">
                     <td class="slno" style="width: 73px;">${theCount.count}</td>
                     	<td style="width: 250px;"><input type="hidden"    id="category_name_hidden${theCount.count}" value="${menu.category_name}"><input class='form-control' onblur='textBoxColor(this);criteria(this);' type='text' name='category_name' id="category_name${theCount.count}" value="${menu.category_name}" /></td>
                     	<td style="width: 250px;"><textarea class='form-control'  onblur="criteria(this)"  name='category_desc' id="category_desc${theCount.count}" rows='1' >${menu.category_desc}</textarea></td>
                     	 <td style="width: 325px;"><div class='row'><div class='form-group col-lg-9'><input id="category_icon${theCount.count}" type="file" onchange="loadImageFileAsURL('category_icon1',this)"><span id="category_iconError${theCount.count}" style="color: red;"></span></div><div id="category_icon1_image${theCount.count}" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="${menu.category_icon}" alt="No Image"/></div></div><input type="hidden" id="category_icon_byte${theCount.count}" value="${menu.categoryIcons}">
                     	 <input type="hidden" id="category_icon1_refId${theCount.count}" name="category_icon1_refId" />
                             <input type="hidden" id="category_icon1_name${theCount.count}"><!--  value="${menu.imgName}" -->
                             <input type="hidden" id="category_icon1_id${theCount.count}" value="${menu.sno}">
                             </td> 
                     	<td style="width:102px;" id="Del${theCount.count}"><img id="action${theCount.count} "alt="" style="width:24px;height:24px;cursor:pointer;" onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                   </tr>
                     </c:forEach>
                     </c:otherwise>
                     </c:choose>
                         
			 	</tbody>
                    </table>
                 </div>
                 
                 <div class="row" style="padding-left: 1%;padding-right: 1%">
                     <div class="form-group  col-lg-12">
                     	<label><spring:message code="remarks.label" /></label>
                        <textarea class="form-control"  onblur="criteria(this)" name="remarks" id="remarks" rows="2" style="resize:none" placeholder="<spring:message code="enter.remarks.label" />" >${menuDetailsList.remarks}</textarea>
					</div>
                    </div>
                 
                 </div><!-- /.box-body -->
                                        <!-- COMPOSE MESSAGE MODAL -->
       <%--  <div class="modal fade" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;">Menu Items</h4>
                    </div>
                    <form action="#" method="post">
                        <div class="modal-body">
                        
                        <div class="row">
                            <div class="col-lg-3"></div>
                               <div class="form-group col-lg-6">
                                   <label><spring:message code="search.items.here.label" /></label>
                                     <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" />
 										<datalist id="skuList">
													
										</datalist>
  								</div>
                                <div class="col-lg-3"></div>
                         </div>
                        
                              	<div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                         	<th><spring:message code="item.name.label"/></th>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="item.type.label"/></th>
                             <th><spring:message code="uom.label"/></th>
                             <th><spring:message code="unit.price.label"/></th>
                             <th><spring:message code="item.availabity.label"/></th>
                             <th><spring:message code="item.icon.label"/></th>
                             <th><spring:message code="item.picture1.label"/></th>
                             <th><spring:message code="item.picture2.label"/></th>
                             <th><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody>
                     
			 	</tbody>
                    </table>
                 </div>
                        
                     

                        </div>
                        <div class="modal-footer clearfix">
								
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" data-dismiss="modal" onclick="" value="<spring:message code="save.label" />" />
						<input type="button" class="btn bg-olive btn-inline" data-dismiss="modal" style="margin-left:5%;" onclick="" value="<spring:message code="cancel.label" />" />
						</div>
                          
                        </div>
                    </form> --%>
               <!--  </div> --><!-- /.modal-content -->
            <!-- </div> --><!-- /.modal-dialog -->
        <!-- </div> --><!-- /.modal -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" style=" " onclick="validateMenuCategory('new')" value="<spring:message code="submit.label" />" />
						<input type="button" class="btnCls buttonMargin" style="" onclick="getMenuCategories();" value="<spring:message code="cancel.label" />" />
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