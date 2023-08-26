<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newSupplier.jsp
 * file type		        : JSP
 * description				: The new supplier form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>
 --%>
 	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script> --%>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/bomMaster.js"></script>
<style type="text/css">
		.labelheading{
	    background: #3c8dbc;
    color: #fff;
    padding: 5px 60px 5px 5px;
    font-size: 16px;
    }
	/*  .error{
	 border-color:red !important;
	 } */
	  .fa-star {
    font-size: 18px;
    display: block;
    color: #FFA500;
    padding: 2px 0px;
}
a:hover
{
	color:#45372D;
	text-decoration: none !important;
}
div.stars {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 5px;
  font-size: 20px;
  color: #FFA500;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FFA500;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FFA500;
  /* text-shadow: 0 0 20px #952; */
}

input.star-1:checked ~ label.star:before { color: #FFA500; }

/* label.star:hover { transform: rotate(-15deg) scale(1.3); } */

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
.close {
    float: right;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    color: #45372D !important;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 1 !important;
}
.framestyle
{
	width: 90%;
    height: 250px;
    border: 1px solid #45372D;
    margin-left: 0%;
}
</style>


</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                       <div class="box-header" style="text-align: center">
                       <h3><spring:message code="view.bom.header.label" /></h3>
                       </div><!-- /.box-header -->
                       
                       <!-- form start -->
                       
                       <div class="row">
	        			<div class="col-lg-3"></div>
                       	<div class="col-lg-6">
                       		<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                       	</div>
                      
                       </div>
                       <form id="newSupplier" method="post">
                           <div class="box-body">
                          	<div class="row form-group">
                          	 <div class=" col-lg-6">
								 <div class=" col-lg-3" style="text-align: right;">
								 <spring:message code="bom.skuid.label" />
								</div>
								<div class=" col-lg-4" style="padding-left: 0px;">
                                     
						                  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;;padding-right:0px">
						                    <input type="text" readonly value="${bomresponse.productId}"  class="form-control searchItems itemwise" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
										<div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl itemname" style=""></ul>
						   					</div>
										</div>
						                  </div>
						              
								</div></div>
                             <div class=" col-lg-6">
                               <div class=" col-lg-3" style="text-align: right;">
                                   <spring:message code="product.category.label" />
                                
	 						   </div>
                                <div class=" col-lg-4" style="padding-left: 0px;">
                                   <input type="text" class="form-control" value="${bomresponse.productCategory}" name="city" id="category" required readonly  />
                               		<span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								 </div></div>
								</div>
                               <div class="row">
                              <div class=" col-lg-6">
                               <div class=" col-lg-3" style="text-align: right;">
                               <spring:message code="uom.label" /></div>
                               <div class=" col-lg-2" style="padding-left: 0px">
                                <input type="text" class="form-control" value="${bomresponse.productUom}"  readonly name="city" id="uom"  />
                               </div>
                              </div>
                               <div class=" col-lg-6">
                                <div class=" col-lg-3" style="text-align: right;">
                                <spring:message code="costprice.label" /></div>
                                <div class="form-group col-lg-2" style="padding-left: 0px">
                                <input type="text" class="form-control" readonly value="${bomresponse.costPrice}" name="city" id="city"  />
                                </div>
                               </div></div>
                            <div class="row form-group">
                              <div class=" col-lg-6">
                               <div class=" col-lg-3" style="text-align: right;">
                               <spring:message code="material.category.label" /></div>
                               <div class=" col-lg-3" style="padding-left: 0px">
                                     <select class="form-control" readonly id="materialcategory" value="${bomresponse.materialCategory}" >
								                       <option value=""><spring:message code="ALL.label"/></option></select>
                               </div>
                              </div>
                               <div class=" col-lg-6">
                                <div class=" col-lg-3" style="text-align: right;">
                                <spring:message code="saleprice.label" /></div>
                                <div class=" col-lg-2" style="padding-left: 0px">
                                <input type="text" class="form-control" readonly value="${bomresponse.salePrice}" name="city" id="saleprice"  />
                                </div>
                               </div></div>
                             <div class="row">
                              <div class="form-group col-lg-6">
                               <div class="form-group col-lg-3" style="text-align: right;">
                               <spring:message code="description.label" /></div>
                               <div class="form-group col-lg-6" style="padding-left: 0px">
                                <input type="text" class="form-control" readonly value="${bomresponse.description}" name="city" id="description"  />
                               </div>
                              </div>
                               <div class="form-group col-lg-6">
                                <div class="form-group col-lg-3" style="text-align: right;">
                                <spring:message code="expiryperiod.label" /></div>
                                <div class="form-group col-lg-2" style="padding-left: 0px">
                                <input type="text" class="form-control" name="city" readonly value="${bomresponse.productExpiryPeriodDays}" id="days" placeholder="days" />
                                </div>
                                <div class="form-group col-lg-2" style="padding-left: 0px">
                                <input type="text" class="form-control" name="city" readonly value="${bomresponse.productExpiryPeriodHours}" id="hours" placeholder="hours" />
                                </div>
                               </div></div>
                               
                                
                                                           <br>
                                          <div class="row"> 
  <br/> 
  			
  </div>
  	<div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 <th><spring:message code="seq.no" /></th>
                 	<th style="border-left: 4px solid #fff;"><spring:message code="itemcode.label" /></th>
                     <th style="border-left: 4px solid #fff;"><spring:message code="itemdesc.label" /></th>
                     <th style="border-left: 4px solid #fff;"><spring:message code="uom.label"/></th>
                      <th style="border-left: 4px solid #fff;"><spring:message code="qty.label"/></th>
                      <th style="border-left: 4px solid #fff;"><spring:message code="optional.label"/></th>
                       <th style="border-left: 4px solid #fff;"><spring:message code="variance.label"/></th>
                       <th style="border-left: 4px solid #fff;"><spring:message code="leadtime.label"/></th>
                       <th style="border-left: 4px solid #fff;"><spring:message code="processtime.label"/></th>
                      <th style="border-left: 4px solid #fff;"><spring:message code="cost.label"/></th>
                    
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach var="productGroup" items="${bomresponse.boMaterialChilds}" varStatus="theCount">
				<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
				<td id="Name${theCount.count}">${productGroup.itemSeqNumber}</td>
					<input type="hidden" id="skuId${theCount.count}" value="${productGroup.itemId}"/>
	 				<input type="hidden" id="pluCode${theCount.count}" value="${productGroup.itemId}"/>
					<td id="Name${theCount.count}">${productGroup.itemId}</td>
				    <td id="Desc${theCount.count}">${productGroup.itemDescription}</td>
				    <td id="UOM${theCount.count}" >${productGroup.uom}</td>
					<td class='Price' id="Price${theCount.count}">${productGroup.quantity}</td>
					<td id="size${theCount.count}">
					
					 <c:choose>
         <c:when test="${productGroup.optionalFlag=='true'}">
         <input id="checkbox"  type="checkbox" checked value="" style="  width: 43px;  height: 17px;">
         </c:when>
         <c:otherwise>
          <input id="checkbox"  type="checkbox"  value="" style="  width: 43px;  height: 17px;">
         </c:otherwise>
         </c:choose>
					</td>
					<td id="Cost${theCount.count}">${productGroup.variance}</td>
					<td id="colour${theCount.count}">${productGroup.leadTimeStr}</td>
					<td id="Pack${theCount.count}" onkeypress="return (this.innerText.length < 10)" contenteditable="true">
					
					${productGroup.processTimeStr}</td>
					<td id="lead${theCount.count}" onkeypress="return (this.innerText.length < 10)" contenteditable="true">
					
					<fmt:formatNumber var="formattedBillableTime" type="number" minFractionDigits="2" maxFractionDigits="2" value="${productGroup.itemPrice*productGroup.quantity}" />
					${formattedBillableTime}</td>
					
				</tr>
           </c:forEach>    
 			</tbody>
           </table>
           <br/>
           <br>
           <br>
          <div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;padding-right: 0px;
          ">
           <div class="form-group col-lg-6" ></div>
            <div class="form-group col-lg-5" style="text-align: right"><spring:message code="materialcost.label"/></div>
             <div class="form-group col-lg-1" id="" style="padding-right: 5px;">
             <input type="text" class="form-control" name="city" readonly id="totalCost" value="${bomresponse.totalBomCost}" style=""  />
             </div>
          </div>
           <div class="form-group col-lg-12" style="  margin-bottom: 3%;    padding-left: 0px;padding-right: 0px;">
          <label><spring:message code="process.desc.label"/></label>
          <input type="text" class="form-control" name="city" id="processdescription" readonly value="${bomresponse.processInstructions}" style="height: 60px"  />
          </div>
         </div>
                           </div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
						
						 <input type="button" class=" btnCls" style="margin-left:25%;" onclick="viewBomMaster('BomMaster','0');" value="<spring:message code="cancel.label" />" />
					<%--  <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class=" btnCls" style="margin-left:5%" onclick="viewBomMaster('BomMaster','0');" value="<spring:message code="cancel.label" />" />
					 </c:if> --%>
					
						</div>
							<br/>
                           <div class="box-footer"></div>
                       </form>
                       <input type="hidden" value="${searchName}" id="searchBOM" >
                       <input type="hidden" value="${maxRecords}" id="maxRecords" >
                       <input type="hidden" value="${type}" id="type">
                   </div>

</div>
</div>
</section><!-- /.content -->
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/currency_plugin.js"></script>
<script type="text/javascript">

</script>
</body>
</html>