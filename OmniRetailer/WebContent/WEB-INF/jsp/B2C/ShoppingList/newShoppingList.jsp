<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
         <script type="text/javascript" src="/OmniRetailer/js/controller.js"></script>
                 <script type="text/javascript" src="${pageContext.request.contextPath}/js/b2c/shoppingList.js"></script>
          <link rel="stylesheet" type="text/css" href="/OmniRetailer/css/jquery.calendars.picker.css">
	
<style type="text/css">

</style>

<script type="text/javascript">

</script>        

</head>
<body>

<section class="content">
<div class="col-lg-12">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                               		 <h3><spring:message code="createshoppinglist.heading.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newProduct" method="post" >
                                    <div class="box-body">
                                    	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        							<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                        
                                   		
                                      <div class="row">
                                      <div class="col-lg-12">
                                      <div class="form-group col-lg-3">
                                            <label><spring:message code="createshoppinglist.shopppinglistType.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="hidden" id="list_id" value="${shoppinglistresponse.listId}">
                                            <input type="text" class="form-control" name="list_type" id="list_type"  value="${shoppinglistresponse.listName}" required  />
                                        	<span id="listtypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										<div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="createshoppinglist.shopppinglist.customercategery.label" /></label>
                                         <select id="category"  name ="productCategory" class="form-control" >
									                	  	<option value="" >-- Select --</option>
									                	  		<option value="NORMAL" ${customerObj.category == 'NORMAL' ? 'selected' : ''}>NORMAL</option>
		                	  	<option value="BASIC" ${customerObj.category == 'BASIC' ? 'selected' : ''}>BASIC</option>
		                	  	<option value="GENERIC" ${customerObj.category == 'GENERIC' ? 'selected' : ''}>GENERIC</option>
		                	  	<option value="PLUS" ${customerObj.category == 'PLUS' ? 'selected' : ''}>PLUS</option>
		                	  	<option value="PREMIUM" ${customerObj.category == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
														  </select>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="createshoppinglist.shopppinglist.country.label" /></label>
                                            <select class="form-control" name="country" id="country">
                                            <option value="Select" >-- Select --</option>
                                             <option value="INDIA"${'INDIA'==shoppinglistresponse.country ? 'selected' : ''} >INDIA</option>
                                              <option value="USA"${'USA'==shoppinglistresponse.country ? 'selected' : ''} >USA</option>
                                           
                                            </select>
                                         </div>
                                       
                                         <div class="form-group col-lg-2">
                                           <label><spring:message code="createshoppinglist.shopppinglist.status.label" /></label>
							            <select class="form-control" name="status" id="status">
											<option value="1"${'1' == shoppinglistresponse.status ? 'selected' : ''}>Active</option>
											<option value="0"${'0' == shoppinglistresponse.status ? 'selected' : ''}>Inactive</option>
								        </select>
                            			 </div>            </div>
                                         </div>
                                         <div class="row" >
                                         <div class="col-lg-12">
                                         <div class="form-group col-lg-4">
                                            <label ><spring:message code="createshoppinglist.shopppinglist.listdescription.label" /></label>
                                            <input type="text" class="form-control" name="list_description" id="list_description" value="${product.productName}" required placeholder="<spring:message code="description.label" />" />
                                        	<span id="listDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="createshoppinglist.shopppinglist.selectchannel.label" /></label>
                                            <select id="purchaseChannel" class="form-control" >
									                	  	 <option value="-- Select --" >-- Select --</option>
									                	  	 <option value="Direct Shopping"${'Direct Shopping'==shoppinglistresponse.channel ? 'selected' : ''} >Direct Shopping</option>
									                	  	 <option value="Telephone"${'Telephone'==shoppinglistresponse.channel ? 'selected' : ''} >Telephone</option>
									                	  	 <option value="Online"${'Online'==shoppinglistresponse.channel ? 'selected' : ''} >Online</option>
									                	  	  <option value="Mobile" ${'Mobile'==shoppinglistresponse.channel ? 'selected' : ''}>Mobile</option>
									                	  	 <option value="Sales Personnel"${'Sales Personnel'==shoppinglistresponse.channel ? 'selected' : ''} >Sales Personnel</option>
										    </select>
                                         </div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="createshoppinglist.shopppinglist.zone.label" /></label>
                                            <select id="salesZone" class="form-control">
									        	 		 	<option value="-- Select --" >-- Select --</option>
									                	  	 <c:forEach var="zone" items="${zones}">
																<option value="${zone}">${zone}</option>
															 </c:forEach>
									         </select>
                                        </div>
                                        </div>
                                        </div>
                                       <div style="margin-top:10px;">
								<div class="col-lg-12" style="margin-bottom:0px;padding-top:16px;">
						   		<div class="form-group col-lg-12" style="padding-left: 0px;padding-right: 0px" >
						   		<div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;border-bottom: 1px solid rgb(181,230,29);">
                                     <div class=" col-lg-2" style="padding-left: 0px; cursor: pointer"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="createshoppinglist.Subheading.label"/></span></div>
				               <!-- <hr style="margin-top:19px;margin-left:11px;margin-right:10px;width:1150px;border-bottom: 1px solid rgb(181,230,29)"> -->  
				                  <div class=" col-lg-10" style="background-color: rgb(195,195,195);height: 20px;">
				                   
				                    </div>
                                   </div>
                                   </div>
                                   </div>
                                   </div>
                                  
								 <!-- <div  id="itemSpecificDeals"> -->
						   <div class="row">
							   <div class="form-group col-lg-12" >
							   <div class="col-lg-12" >
							   <div class="col-lg-12" style="padding-right: 0px">
                               	 <input type="checkbox" checked="checked" onchange="toggleBased('basedOnProduct')" style="vertical-align: -2px" id="basedOnProduct"/>&nbsp; <spring:message code="configure.based.on.product.label" />
                               	 <hr style="margin-top: 2px;">
                               </div>
                               </div>
                               </div>
                            </div> 
                            <div class="row">
                            <div class="col-lg-12" >
                            <div class="col-lg-12" style="padding-right: 0px">
									<div class="form-group col-lg-3" style="margin-top: -25px;">
					        	 		 <label><spring:message code="sale_product_category.label" /></label>
					        	 		 <input type="text"  class="form-control searchItems basedOnProduct " id="searchItems" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="margin-left:20px;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;margin-left:1px;"/>
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl categoryMaster" style="width: 240px;"></ul>
						   				</div>
									</div>
                                          <span id="dealSaleProducts" style="text-align:right;color:red;font-weight:bold;"></span>
                                          <div style="overflow-x : auto;margin-bottom: 15px;">
                                          <table id="categoryMasterIds" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                       <thead style="background-color:rgb(128,128,128); color: #ffffff">
                                          <tr>
                                          	<th><spring:message code="sale_product_category.label"/></th>
                                          	
                                              <th><spring:message code="action.label"/></th>
                                              
                                              </tr>
                                              </thead>
                                              <tbody style="text-align: center;">
                                              </tbody>
                                              
                                        </table>
                                        </div>
                                          <span id="lanaguageError" style="text-align:right;color:red;font-weight:bold;"></span>
									</div>	
									 <div class="form-group col-lg-3" style="margin-top: -25px;">
                                           <label><spring:message code="sale_product_sub_category.label" /></label>
                                           <!-- <select class="form-control basedOnProduct saleGroups" style="background: white;" name="sub_category" id="sale_sub_category">
                                           </select> -->
                                           
                                           <input type="text"  class="form-control searchItems basedOnProduct " id="searchItems" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;margin-left:1px;"/>
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl subcategoryMaster" style="width: 260px;"></ul>
						   				</div>
									</div>
                                          <span id="dealSaleProducts" style="text-align:right;color:red;font-weight:bold;"></span>
                                          <div style="overflow-x : auto;margin-bottom: 15px;">
                                          <table id="subcategoryMasterIds" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                       <thead style="background-color:rgb(128,128,128); color: #ffffff">
                                          <tr>
                                          	<th><spring:message code="sale_product_sub_category.label"/></th>
                                              <th><spring:message code="action.label"/></th>
                                              
                                              </tr>
                                              </thead>
                                              <tbody style="text-align: center;">
                                              </tbody>
                                              
                                        </table>
                                        </div>
                                           
                                        </div>	
                                        
                                    	  <div class="form-group col-lg-6" style="margin-top: -25px;">
							     <label><spring:message code="product_id.label" /></label>
							   
							    <input type="text"  class="form-control searchItems basedOnProduct saleGroups" id="searchItems" placeholder="<spring:message code="deal_enter_product_name.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;margin-left:1px"/>
									<div class="services">
						    			<div class="items">
						     				<ul class="matchedStringUl offersellproducts" style="width: 300px;"></ul>
						   				</div>
									</div>
                                          <span id="dealSaleProducts" style="text-align:right;color:red;font-weight:bold;"></span>
                                          <div style="overflow-x : auto;margin-bottom: 15px;">
                                          <table id="offerSaleProductsIds" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;margin-rightL">
                                       <thead style="background-color:rgb(128,128,128); color: #ffffff">
                                          <tr>
                                          	<th><spring:message code="product_id.label"/></th>
                                          		<th><spring:message code="description.label"/></th>
                                          		
                                          	<th><spring:message code="quantity.label"/></th>
                                          	
                                          
                                              <th><spring:message code="action.label"/></th>
                                              </tr>
                                              </thead>
                                              <tbody style="text-align: center;">
                                              </tbody>
                                              
                                        </table>
                                        </div>
							  </div>
							  </div>
							  </div> 
							  </div>
							  <div class="row">
			   						<div class="form-group col-lg-12" >
			   						<div class=" col-lg-12" >
			   						<div class=" col-lg-12" style="padding-right: 0px">
                                   	<input type="checkbox" onchange="toggleBased('basedOnGroup')" style="vertical-align: -2px" id="basedOnGroup"/>&nbsp;&nbsp;&nbsp; <spring:message code="configure.based.on.group.label" />
                                   	 <hr style="margin-top: 1px;">
                                   </div>
                                   </div>
                                   </div>
                                </div>       
						    <div class="row">
						    <div class=" col-lg-12" >
						    <div class=" col-lg-12" style="padding-right: 0px" >
									  	<div class="form-group col-lg-3" style="margin-top: -25px;">
									     <label><spring:message code="sale_group_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroup" placeholder="<spring:message code="enter.group.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;margin-left:1px;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroup" style="width: 230px;"></ul>
								   				</div>
											</div>
									      <div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupProductsId" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color:rgb(128,128,128); color: #ffffff">
                                            <tr>
                                            	<th style="width:100px;"><spring:message code="sale_group_id.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                                <tbody style="text-align: center;">
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
									  <div class="form-group col-lg-6" style="margin-top: -25px;">
									     <label><spring:message code="buy_sku_id.label" /></label>
									        <input type="text"  class="form-control searchItems basedOnGroup saleGroups" readonly="readonly" id="saleGroupSkuSearch" placeholder="<spring:message code="deal_enter_sale_sku_Id.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;margin-left:1px;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl saleGroupSku" style="width: 230px;"></ul>
								   				</div>
											</div>
											<div style="overflow-x : auto;margin-bottom: 15px;">
                                           <table id="saleGroupSku" class="table table-bordered table-hover" style="margin-top: 10px;margin-bottom: 5px;">
                                          <thead style="background-color:rgb(128,128,128); color: #ffffff">
                                            <tr>
                                          	<th><spring:message code="product_id.label"/></th>
                                          		<th><spring:message code="description.label"/></th>
                                          		
                                          	<th><spring:message code="quantity.label"/></th>
                                          	
                                          	
                                              <th><spring:message code="action.label"/></th>
                                             
                                              
                                              </tr>
                                                </thead>
                                                <tbody style="text-align: center;">
                                                </tbody>
                                          </table>
                                          </div>
									  </div>
								</div> 
								</div>
								 </div>
								<!-- </div>   -->
								<br>
								<br>
							<div class="row" style="text-align: center;">
			  <input id="submit" style="width:80px;margin-top:-50px;margin-right:60px;"  class="btn bg-olive btn-inline" onclick="createShoppingList('new')" value="<spring:message code="submit.label" />" type="button">
				<input class="btn bg-olive btn-inline buttonMargin" style="width:80px;margin-top:-50px;"  onclick="viewShoppingList('shoppinglist','')" value="Cancel" type="button">
				<br><br>
						</div></div></form></div></div></div></div></section>

  <div id="triggerEvent"></div>

 <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
                       
                       
                       
			 			</tbody>
                    </table>
                 </div>
              </div>
             </form> 
             
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->







</body>
</html>