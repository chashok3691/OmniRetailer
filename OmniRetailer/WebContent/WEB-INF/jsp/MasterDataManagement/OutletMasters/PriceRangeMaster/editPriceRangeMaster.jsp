<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : N.RaviTeja
 * file name		        : MasterDataManagement/Outlet master/PriceRangeMaster/editPriceRangeMaster.jsp
 * file type		        : JSP
 * description				: The PriceRangeMaster form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Omni Retailer</title>
 <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
 <style type="text/css">
 
 .addButton{
 cursor: pointer;
 }
/*  .padding_bottom{
 padding-bottom:50px;
 } */
 .multi_select_label{
   background-color: #DAD2D2;
     padding-left: 0px;
    padding-right: 0px; 
    font-size: 18px;
 }
 select{
 overflow-y: auto;
 }
 .padding_top{
 padding-top: 10px;
 }
 .field_bottom{
 padding-bottom: 10px;
 }
 h2 {
    font-size: 50px;
    margin-top: 40px;
    color:#9C9797;
}

/* .table-responsive{
display: none;
} */
 .fontSize{
 font-size: 50px;
 color:#9C9797;
 }
 .fontalign{
 color:#9C9797;
 margin-top: 45px;
 }
 
 .buttonspadding{
 padding-top: 50px;
 }
 a.run {
    margin-top: 0px;
    margin-bottom: 0px;
    height: 36px;
    padding-top: 7px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
    text-transform: uppercase;
}
 
 </style>
 
 <!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	
 
 
 <script type="text/javascript">
 $(document).on('input', 'input:text', function() {
	 $("#priceDescError").html('');
 });
$(document).ready(function(){
	/*$("option :selected").val()  */
	var PriceRange=$("#startPrice").val()+"-"+$("#endPrice").val(),catagoryItem;
	 $("#product_ShiftRight").click(function(){
		  $("#productCategories option:selected").each(function(){
			  catagoryItem=$(this).val();
			  $("#ProductCategoriesSelected").append(this);
			   if(PriceRange!=''){
				   getSkuList(catagoryItem,PriceRange,'');
			   }
			  $("#ProductCategoriesSelected option:selected").prop("selected",false);
		  })
	  })
	  
	  $("#startPrice").on('input',function(e){
			   $("#priceRangsError").html("");
			   $(".priceRangsError").html("");
		});
	 $("#product_ShiftLeft").click(function(){
		  $("#ProductCategoriesSelected option:selected").each(function(){
			  $("#productCategories").append(this);
			 
			  getSkuList($(this).val(),PriceRange,'remove');
			  $("#productCategories option:selected").prop("selected",false);
			
		  })
		  })
		
		  $("#sku_ShiftRight").click(function(){
		  $("#skuList option:selected").each(function(){
			  $("#skuListSelected").append(this);
			 
			
			  $("#skuListSelected option:selected").prop("selected",false);
		  })
	  })
		  $("#sku_ShiftLeft").click(function(){
		  $("#skuListSelected option:selected").each(function(){
			  $("#skuList").append(this);
			  $("#skuList option:selected").prop("selected",false);
		  })
		  })
		
	
	 $(".addButton").click(function(){
		 if($("#startPrice").val().trim()!=''&& $("#endPrice").val().trim()!=''){
			 $("#priceRangs").append("<option>"+$("#startPrice").val()+"&nbsp;&nbsp;&nbsp"+"-"+"&nbsp;&nbsp;&nbsp"+$("#endPrice").val()+"</option>");
			 PriceRange=$("#startPrice").val()+"-"+$("#endPrice").val();
			
			 $("#startPrice").val("");
			 $("#endPrice").val("");
		 }
			 else
			 $("#priceRangsError").html("Invalid Price");
		 
		/*  if(parseInt($("#startPrice").val())>=parseInt($("#startPrice").val()))
			 $("#priceRangsError").html("End Price must be greator than start price"); */
		 if($("#ProductCategoriesSelected option").val()!=undefined){
			/*  alert($("#ProductCategoriesSelected option").val()); */
			 
			 getSkuList($("#ProductCategoriesSelected option").val(),PriceRange,'');
		 }
		 
	 })
	 
}); 

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
 </script>
</head>
<body>
<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">

 <div class="row">
 
  <div class="col-xs-12">
 
    <div class="box box-primary">
     
        <div class="box-header">
        <div class="form-group col-lg-12" style="text-align: center;">
     <h3 class="box-title"><spring:message code="priceRangeMaster.editPriceRange.label" /></h3>
  </div>
        </div>
       
      <div class="box-body">
       <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
       <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
      <div class="row">
      <div class="col-lg-6 col-sm-8 col-xs-8 padding_bottom">
        <div class="col-lg-5 col-sm-8 col-xs-10 field_bottom">
         <label><spring:message code="priceRangeMaster.priceRangeRef.label"/></label>
        
          <input type="text"  onblur="criteria(this)" class="form-control" id="priceRangeRef" value="${priceRangeResponse.priceRangeId}" readonly="readonly">
      </div>
      
      <div class="col-lg-12 col-sm-8 col-xs-12 field_bottom">
      <label><spring:message code="priceRangeMaster.priceRangDescription.label"/></label>
       <span style="color:red; font-size:2">*</span>
      <input type="text"  onblur="criteria(this)" class="form-control" id="priceRangDescription" value="${priceRangeResponse.priceRangeDescription}">
     
     <span id="priceDescError" style="color: red"></span>
      </div>
      
      <div class="col-lg-5 col-sm-8 col-xs-10 ">
      <label><spring:message code="priceRangeMaster.priceRangCriteria.label"/></label>
      <select id="priceRangCriteria" class="form-control" id="priceRangCriteria" >
       <option>
      
       </option>
      </select>
      </div>
      </div>
      
      <div class="col-lg-6 col-sm-12 col-xs-12 padding_bottom">
      
   <div class="col-lg-5 col-sm-12 col-xs-12 field_bottom " style="padding-top: 30px">
   
        <div class="col-lg-12 col-sm-6 col-xs-12" style="padding-bottom: 30px;padding-left: 0px;">
     <input type="text" class="form-control" id="startPrice" placeholder="<spring:message code="priceRangeMaster.priceRanges.Startdesc.label"/>" onkeypress="return isNumberKey(event)">
        </div>
            <div class="col-lg-12 col-sm-6 col-xs-12" style="padding-left: 0px;">
     <input type="text" class="form-control" id="endPrice" placeholder="<spring:message code="priceRangeMaster.priceRanges.Enddesc.label"/>" onkeypress="return isNumberKey(event)">
        </div>
                <span id="priceRangsError" style="color: red"></span>    
      </div>       
       <div class="col-lg-2 col-sm-4 col-xs-4">
                 <a class="addButton">
                           <h2  style=" /* margin-bottom: 0px; */"><i class="fa fa-plus-circle" aria-hidden="true" ></i></h2>
                   </a>          
                   </div>
                                 
    <div class="col-lg-5 col-sm-6 col-xs-6" style=" text-align: center;">
  <div class="col-lg-12 col-sm-12 col-xs-12 multi_select_label">
<label><spring:message code="priceRangeMaster.priceRangeMaster.priceRanges.label"/></label>
  </div>
  
   <select id="priceRangs" class="form-control" multiple="multiple"  style="height: 150px;text-align: center;"  >
     <c:forEach  var="priceRangs" items="${priceRangeChilds}">
     
    <c:choose> 
    <c:when test="${priceRangs.startPrice ne null || ''}">
    <option>${priceRangs.startPrice}${" - "}${priceRangs.endPrice}</option>
    </c:when>
    </c:choose>
     
     </c:forEach>
    </select>
</div>
   
       
           
                    
  
     </div>
   
   <div class="form-group col-lg-12"></div>
   <div class="form-group col-lg-12"></div>
   <div class="form-group col-lg-12"></div>
     <div class="col-lg-6 col-sm-12 col-xs-12" style=" text-align: center;">
      
            <div class="col-lg-5 col-sm-5  col-xs-5">
            <div class="col-lg-12 col-sm-12 col-xs-12 multi_select_label">
     <label><spring:message code="priceRangeMaster.productCatagory.label"/></label>
        </div>
            <select id="productCategories" class="form-control" multiple="multiple" style="height: 200px" >
       <c:forEach var="categoryList" items="${categoryList}">
       <option value="${categoryList.categoryName}">${categoryList.categoryName}</option>
       
       </c:forEach>
         
       </select>
            </div>
        <div class="col-lg-2 col-sm-2 col-xs-2">
           <div class="fontalign">
            <a  class="btn" id="product_ShiftRight"><i class="fa fa-angle-double-right fontSize"></i></a>
            
             
             
            <a  class="btn" id="product_ShiftLeft"><i class="fa fa-angle-double-left fontSize"></i></i></a>
            
           </div>
           </div>
          <div class="col-lg-5 col-sm-5  col-xs-5">
            <div class="col-lg-12 col-sm-12 col-xs-12 multi_select_label">
     <label><spring:message code="priceRangeMaster.priceRangeMaster.priceRangeMaster.selected.label"/></label>
        </div>
            <select id="ProductCategoriesSelected" class="form-control" multiple="multiple" style="height: 200px">
         <c:forEach var="productList" items="${priceRangeChilds}">
       <option value="${productList.productCategory}">${productList.productCategory}</option>
       
       </c:forEach>
       </select>
            </div>
           </div>
           
           <div class="col-lg-6 col-sm-12 col-xs-12" style=" text-align: center;">
            <div class="col-lg-5 col-sm-5  col-xs-5">
            <div class="col-lg-12 col-sm-12 col-xs-12 multi_select_label">
     <label><spring:message code="priceRangeMaster.priceRangeMaster.SKUList.label"/></label>
        </div>
            <select id="skuList" class="form-control" multiple="multiple" style="height: 200px" >
            
      
       
       </select>
            </div>
        <div class="col-lg-2 col-sm-2 col-xs-2">
           <div class="fontalign">
            <a  class="btn" id="sku_ShiftRight"><i class="fa fa-angle-double-right fontSize"></i></a>
            
           
            <a  class="btn" id="sku_ShiftLeft"><i class="fa fa-angle-double-left fontSize"></i></a>
            
           </div>
           </div>
           <div class="col-lg-5 col-sm-5  col-xs-5">
            <div class="col-lg-12 col-sm-12 col-xs-12 multi_select_label">
     <label><spring:message code="priceRangeMaster.priceRangeMaster.priceRangeMaster.selected.label"/></label></label>
        </div>
            <select id="skuListSelected" class="form-control" multiple="multiple" style="height: 200px">
         <c:forEach var="skuList" items="${priceRangeChilds}">
            <option value="${skuList.sno}">${skuList.skuId}</option>
            </c:forEach>
       </select>
            </div>
          
        
      </div>
      <%-- <div class="form-group col-lg-12 col-sm-12 col-xs-12"></div>
     <div class="table-responsive">
             <table id="priceRangeList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th><spring:message code="sno.label" /></th>
                     <th><spring:message code="priceRangeMaster.productCatagory.label" /></th>
                     <th><spring:message code="priceRangeMaster.priceRangeMaster.SKUList.label" /></th>
                    
                    
                     <th><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody   style="text-align: center;">
 			<c:forEach var="priceRangeList" items="${priceRangeChilds}" varStatus="theCount">
			<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
			<td id="sno${theCount.count}">${theCount.count}
			<input id="itemno${theCount.count}" type="hidden" value="${priceRangeList.sno}"/>
			</td>
			<td id="productCatagoryDescription${theCount.count}">
  			 ${priceRangeList.productCategory}</td> 
			<td id="skuId${theCount.count}">${priceRangeList.skuId}</td>
  			 
    		 
				

				<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style='width:25px;cursor:pointer;' onclick="deleteItem(this);" title="Delete ${productList.productDescription}" />
				</td>
			</tr>
     </c:forEach> 
 			</tbody>
           </table>
            <div id="resultsearch"></div>
           <br/>
         </div> --%>
      
      
      <div class=" col-lg-12 buttonspadding">
                           <div class="row">
                  <div class="col-lg-6" style="    padding-right: 0px;">
                   <div class="col-lg-6" style="padding-right: 0px;"></div>
                    <div class="col-lg-3" style=" padding-right: 0px;">
                    <a onclick="validatepriceRangeform(priceRangeMaster,'edit');" class="btnCls"><spring:message code="submit.label" /></a>
                    </div>
                  
                  </div>
                  <div class="col-lg-6">
  <div class="col-lg-2"></div>
               
                   <div class="col-lg-3" style="    padding-right: 0px;">
                    <c:if test="${sessionScope.role == 'super admin'}">
                     <a class="btnCls" onclick="viewpriceRangeMaster('priceRangeMaster','0');"><spring:message code="cancel.label" /></a>
                    </c:if>
                    <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
										<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true&& accessControl.read == true}"> 
                    <a class="btnCls" onclick="viewpriceRangeMaster('priceRangeMaster','0');"><spring:message code="cancel.label" /></a>
                   </c:if>
                   </c:forEach>
                   </div>
                    
                   
                  </div>
                   
                  </div>
                        </div>
</div>
        </div>
      
        
         
   </div>
   </div>
   </div>
 <input type="hidden" value="${searchName}" id="searchPriceRange"/>
        <input type="hidden" value="${maxRecords}" id="maxRecords"/>


 </section>

</body>
</html>