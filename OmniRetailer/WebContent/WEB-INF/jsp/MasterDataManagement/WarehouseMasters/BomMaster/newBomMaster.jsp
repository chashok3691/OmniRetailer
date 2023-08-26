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
	
 	
 		<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script> --%>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/bomMaster.js"></script>
	       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
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
<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

<script type="text/javascript">
function criteria(str) {


    var x = $(str).val();
    if (x.includes("'") || x.includes("/") || x.includes("(")  || x.includes(")") || x.includes("|") || x.includes("$") || x.includes("\n") || x.includes("~") || x.includes("`") || x.includes("!") || x.includes("%") || x.includes('"') ||   x.includes("<") || x.includes(">")  || x.includes("*") || x.includes("#") || x.includes(":") ||  x.includes(";")  || x.includes("{") || x.includes("}") || x.includes("[") ||  x.includes("]") || x.includes("=") || x.includes("+") || x.includes("^") || x.includes("?")|| x.includes("@") ){
    
            alert("Special characters are not allowed!");
            x=$(str).val().replace(/['&~%/\\#!]/g,' ');
    /*   x=$(str).val(""); */

    }
     $(str).val(x.trim());
}
</script>
	
	
	


<script>
$(document).ready(function(){
	
 	  $(".itemwise").keyup(function(){
 		   $("#leadTimeError").html("");
		   $(".Error").html("");
 	 });
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
                       <c:choose>
                       <c:when test="${not empty bomresponse.bomRef}">
                       <h3><spring:message code="edit.bom.header.label" /></h3>
                       </c:when>
                       <c:otherwise>
                       <h3><spring:message code="new.bom.header.label" /></h3>
                       </c:otherwise>
                       </c:choose>
                       
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
								 <spring:message code="bom.skuid.label" /><span style="color:red; font-size:2">*</span>
								</div>
								<div class=" col-lg-4" style="padding-left: 0px;">
                                     
						                  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;;padding-right:0px">
						                    <input type="text"  onblur="criteria(this)" value="${bomresponse.productId}"  class="form-control searchItems itemwise" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
												<span id="leadTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										<div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl itemname" style=""></ul>
						   					</div>
										</div>
						                  </div>
						              
								</div></div>
                             <div class=" col-lg-6">
                               <div class=" col-lg-3" style="text-align: right;white-space:nowrap">
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
                                <input type="number" class="form-control" value="${bomresponse.costPrice}" name="city" id="costprice"  />
                                </div>
                               </div></div>
                            <div class="row form-group">
                              <div class=" col-lg-6">
                               <div class=" col-lg-3" style="text-align: right;">
                               <spring:message code="material.category.label" /></div>
                               <div class=" col-lg-3" style="padding-left: 0px">
                                     <select class="form-control" id="materialcategory" value="${bomresponse.materialCategory}">
								                       <option value=""><spring:message code="ALL.label"/></option></select>
                               </div>
                              </div>
                               <div class=" col-lg-6">
                                <div class=" col-lg-3" style="text-align: right;">
                                <spring:message code="saleprice.label" /></div>
                                <div class=" col-lg-2" style="padding-left: 0px">
                                <input type="number" class="form-control" value="${bomresponse.salePrice}" step="0.01" name="city" id="saleprice"  />
                                </div>
                               </div></div>
                             <div class="row">
                              <div class="form-group col-lg-6">
                               <div class="form-group col-lg-3" style="text-align: right;">
                               <spring:message code="description.label" /></div>
                               <div class="form-group col-lg-6" style="padding-left: 0px">
                                <input type="text"  onblur="criteria(this)" class="form-control" value="${bomresponse.description}" name="city" id="description"  />
                                   <input type="hidden" class="form-control" value="${bomresponse.bomRef}" name="city" id="bomRef"  />
                               </div>
                              </div>
                               <div class="form-group col-lg-6">
                                <div class="form-group col-lg-3" style="text-align: right;">
                                <spring:message code="expiryperiod.label" /></div>
                                <div class="form-group col-lg-2" style="padding-left: 0px">
                                <input type="number" class="form-control" name="city" value="${bomresponse.productExpiryPeriodDays}" id="days" placeholder="days" />
                                </div>
                                <div class="form-group col-lg-2" style="padding-left: 0px">
                                <input type="number" class="form-control" name="city" value="${bomresponse.productExpiryPeriodHours}" id="hours" placeholder="hours" />
                                </div>
                               </div></div>
                            
                                
                                                           <br>
                                          <div class="row"> 
  <br/> 
  			<%-- <div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;">
                <input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl request" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	  </div> --%>
         	  
         	  <div class="form-group col-lg-6" style="text-align:center;  margin-bottom: 0.3%;">
                <input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="Search Sku's Here" style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl bomRequest2" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	</div>
         	<div class="form-group col-lg-6" style="text-align:center;  margin-bottom: 0.3%;">
                <input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems" id="searchItems2" placeholder="<spring:message code="search.items.here.label" />" style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl request" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError2" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	</div>
         	
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
                     <th style="border-left: 4px solid #fff;"><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach var="productGroup" items="${bomresponse.boMaterialChilds}" varStatus="theCount">
				<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
				<td id="itemno${theCount.count}">${productGroup.itemSeqNumber}</td>
					<input type="hidden" id="skuId${theCount.count}" value="${productGroup.itemId}"/>
	 				<input type="hidden" id="pluCode${theCount.count}" value="${productGroup.pluCode}"/>
	 				<input type="hidden" id="itemprice${theCount.count}" value="${productGroup.itemPrice}"/>
					<td id="Name${theCount.count}">${productGroup.itemId}</td>
				    <td id="Desc${theCount.count}">${productGroup.itemDescription}</td>
				  <td class='Price' id="Price${theCount.count}">${productGroup.uom}</td>
					<td class='Pack' id="Pack${theCount.count}" onblur="changePack(this);" contenteditable="true"contenteditable="true" >${productGroup.quantity}</td>
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
					<td id="Make${theCount.count}" contenteditable="true">${productGroup.variance}</td>
					<td  contenteditable="true">
					<input id="ltime${theCount.count}" type="text" class="form-control" style="width:100px" value="${productGroup.leadTimeStr}">
					</td>
					<td   contenteditable="true">
					<input id="ptime${theCount.count}" type="text" class="form-control" style="width:100px" value="${productGroup.processTimeStr}">
					</td>
					<td id="Cost${theCount.count}"  contenteditable="true">
					<fmt:formatNumber var="formattedBillableTime" type="number" minFractionDigits="2" maxFractionDigits="2" value="${productGroup.itemPrice*productGroup.quantity}" />
					${formattedBillableTime}</td>
					<td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style=''  class="delImage" onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
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
          <textarea  onblur="criteria(this)" class="form-control" name="city" id="processdescription" rows="2" value="" style=""  >${bomresponse.processInstructions}</textarea>
          </div>
         </div>
                           </div><!-- /.box-body -->
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
 </div><!-- /.modal --> <div class="col-lg-3">
                                         	 <div id="triggerEvent"></div>
                                         </div>
						<div class="row" style="">
						 <input type="button"  class=" btnCls" onclick="validateWHBomForm('new')" value="<spring:message code="submit.label" />" />
						 <input type="button" class=" btnCls" style="margin-left:25%;" onclick="viewBomMasterWarehouse('BomMasterWH','0');" value="<spring:message code="cancel.label" />" />
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
                        <input type="hidden" value="warehouse" id="flowUnder">
                   </div>

</div>
</div>
</section><!-- /.content -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
<!--  <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
     
  });
 </script> -->
</body>
</html>