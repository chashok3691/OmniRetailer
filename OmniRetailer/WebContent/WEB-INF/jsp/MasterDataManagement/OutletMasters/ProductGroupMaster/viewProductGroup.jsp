<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * Updated By				: Vinay M
 * file name		        : admin/genericData/newProductGroupMaster.jsp
 * file type		        : JSP
 * description				: The newProductGroupMaster form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/productGroupMaster.js"></script>
	
<style type="text/css">
	.col-xs-12 {
	 padding: 5%; 
	 }
	 .form-group {
    margin-bottom: 5px;
}
	 a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 23px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px ;
    height: 23px;
    text-align: center;
    margin-bottom: 15px ;
    width: 100% !important;
}
a.buttonsearch{
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 26px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
/* 	$("#brand_name").focus();
var subCategories = $("#subCategories").val();
var parsedJson = jQuery.parseJSON(subCategories);     
var category = $("#category").val();
var subcategoryArray = new Array();
subcategoryArray = parsedJson[category];
if(subcategoryArray != undefined){
	var op = '';
	for(var i=0;i<subcategoryArray.length;i++){
		op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
	}
	$("#sub_category").html(op);
}

$('#category').change(function () {
	 var category = $("#category").val();
	 subcategoryArray = parsedJson[category];
	 	var op = '';
		for(var i=0;i<subcategoryArray.length;i++){
			op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
		}
		$("#sub_category").html(op);
   });
	$("#searchProduct").val($("#product").val()); */
	//if($("#searchProduct").val().trim()!="")
		<!-- $("#searchProduct").focus(); -->
});


</script>      
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">

  
  <div class="col-xs-12">

				<div class="box box-primary " style="padding: ">
    <div class="box-header" style="text-align: left">
   
    <h3 align="center" style=" margin-top :10px; margin-bottom : 0px;"><spring:message code="view.product.group.label" /></h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <form>
    
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
       	
						<!-- <input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;" onclick="viewProductGroupMaster('productGroupMaster','0');" value="Cancel"> -->
					 	 
        	 
        	 </div>
        	 	<c:set var="productGroupobj" value="${productGroup.groupObj}" scope="page" /> 
			<input type="hidden" id="groupIDforsearch" value='${productGroup.groupId}'/>
        	         <div class="row">
        	<label style="padding-left: 30px;"><spring:message code="group.name.label" /> <span style="color:red; font-size:2">*</span></label>
</div>
		<div class="row" style="margin-right: 0px;">
        	 <div class="form-group col-lg-3 col-md-4">
        		 <div class="form-group col-lg-12 col-md-12">
	    	   <input type="text" class="form-control" id="group_name" value="${productGroupobj.groupDescription}" readonly="readonly" placeholder="<spring:message code="enter.group.name" />" />
	                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
            	 <div class="form-group col-lg-12 col-md-12">
                 <div class=" form-group col-lg-6 col-md-6 nopadding">
	           <label><spring:message code="occasion.status.label" /></label>
				<input type="hidden" id="sds" value="${productGroupobj.groupStatus}">
	            <select class="form-control" name="status" disabled id="status">
					<option value="1" ${'1' == productGroupobj.groupStatus ? 'selected' : ''} >Active</option>
		            <option value="0" ${'0' == productGroupobj.groupStatus ? 'selected' : ''} >Inactive</option>
	            </select> 
		        </div>
          </div>
          		 <div class="form-group col-lg-12 col-md-12">
          <label><spring:message code="comments.label" /></label>
          <textarea rows="3" class="form-control" id="comments" readonly="readonly" style="resize: none;" placeholder="<spring:message code="enter.comments.label" />">${productGroupobj.groupComments}</textarea>
          </div>
				 <div class="form-group col-lg-12 col-md-12">
          		<div class="col-lg-6 col-md-12" style="padding: 0px;">
          			<label><spring:message code="group.image.label" />&nbsp;&nbsp;</label><br>
	    			
				</div>
				<div class="col-lg-6 col-md-12" style="padding-left: 5px;padding-top:10px">
					<input id="groupImageFile" type="hidden"/>
					<input type='hidden' id='groupImage_refId'>
					<div id="groupImageimage" class="thumbnail companyimage" style="width:80px;height:59px;margin-bottom: 0px;">
					<%-- 	<c:if test="${not empty productGroupobj.image}"> --%>
							<img style="width:65px;height:60px;" id="groupImage_thumbnail" src="${productGroupobj.image}">
					<%-- 	</c:if> --%>
					</div>
				</div>
				
            </div>
            </div>
             <div class="form-group col-lg-9"style="background: #eee; padding: 17px 20px;">
	               <div class="row" style="    padding-left: 15px;">
	                <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="location.label"/></label>
	                          <select class="form-control" id="outletLocation" disabled>
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location ==  productGroupobj.storeLocation? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	                       
	                      
	                       <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="department.label"/></label>
	                         
		                          <select class="form-control" id="outletDepartmentId" disabled onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == productGroupobj.productDepartment ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	             
	              <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="brand.label"/></label>
		                         <select class="form-control" id="outletBrandId" disabled>
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == productGroupobj.productBrand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	             
	                       <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="class.label"/></label>
	                           <select class="form-control" id="classId" disabled>
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                            
		                        </select>
	                      </div>
	                       
	             </div>
	               <div class="row" style="    padding-left: 15px;">
	                <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="category.label"/></label>
	                         
		                          <select class="form-control" id="productCategory" disabled onchange="searchSubCategories('productCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == productGroupobj.groupProductCategory ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	                      <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" disabled>
                                                       <option value=""><spring:message code="ALL.label"/></option>
                           
                           		 <option value="">${productGroupobj.productSubDepartment}</option>
	                          
	                        </select>
                      </div>
	                      
	            <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                              <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId"  disabled>
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == productGroupobj.supplier ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
                    
	                      <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="subclass.label"/></label>
	                           <select class="form-control" id="subClassId" disabled >
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                           
		                        </select>
	                      </div>
	                      
	              
	              
	              </div>
	               <div class="row" style="    padding-left: 15px;">
	              
	                  <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="subcategory.label"/></label>
	                           <select class="form-control" id="outletSubcategory" disabled onchange="searchSectionsBasedOnSubCategory('productCategory','outletSubcategory', 'section');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == productGroupobj.groupProductSubCategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	            
	              
	               <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
                           <label><spring:message code="section.label"/></label>
                           
                              <select class="form-control" id="section" disabled>
                               <option value=""><spring:message code="ALL.label"/></option>
                               
                           		 <option value=""> <option value="">${productGroupobj.section}</option>
	                            
	                        </select>
             		</div>
              		

                       <div class="col-lg-3" style="padding-left:0px;padding-right: 30px;">
                           <label><spring:message code="style.model.label"/></label>
                          
                           <select class="form-control" id="styleOrModel" disabled>
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          
	                        </select>
                      </div>
                      
               </div>
             
             </div>
  	     <%--     <div class="form-group col-lg-2 "style="background: #eee; padding: 50px 50px;padding-left: 35px;">
                  <div class="row" >
                  <a onclick="standardfilteritems('')"  class="buttonsearch"><spring:message code="add.to.group.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="buttonsearch">CLEAR</a>
                  </div>
              </div>
               --%>
             </div>
           
 <div class="row">  
  		<br/>
  			<div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;">
                <input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems searchBar" id="searchcriteriachilds" value="${searchCriteria}" placeholder="<spring:message code="search.childs.label" />"  style=""  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl productGroupMasterSearch" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	  </div>
         <%--  	<div class="form-group col-lg-1" style="padding-left:0px">
          	<input type="button" class="btn bg-olive btn-inline  addBtn"  onclick="" value="<spring:message code="import.label" />">
          	</div> --%>
  </div> 
  
    
  <div class="table-responsive">
             <table id="skusList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                    <th><spring:message code="report.sno.label" /></th>               
                 	<th><spring:message code="skuid.label" /></th>
                    <th><spring:message code="product.description.label" /></th>
                    <th><spring:message code="ean.label"/></th>
                    <th><spring:message code="colour.label"/></th>
                    <th><spring:message code="size.label"/></th>
                    <th><spring:message code="range.label"/></th>
                    <th><spring:message code="newarrival.product.status"/></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach var="productGroup" items="${productGroup.groupChildLists}" varStatus="theCount">
<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>

	<td >${theCount.count+index-1}</td>
	<td id="skuId${theCount.count}">${productGroup.skuId}</td>
   <td id="description${theCount.count}">${productGroup.description}</td>
   <td id="ean${theCount.count}">${productGroup.ean}</td>
   <td id="color${theCount.count}">${productGroup.color}</td>
   <td id="size${theCount.count}">${productGroup.size}</td>
   <td id="measure_range${theCount.count}">${productGroup.measure_range}</td>
		<c:choose>
		<c:when test="${productGroup.itemStatus=='true'}">
		<td id="pluCode${theCount.count}">Active</td>
		</c:when>
		<c:otherwise>
		<td id="pluCode${theCount.count}">In Active</td>
		</c:otherwise>
		</c:choose>
</tr>
     </c:forEach>    
 			
 			
 			</tbody>
           </table>
           <br/>
         </div>
    <c:set  var="maximumRecords" value="10"/>
  
                  <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGroupChilds('','view','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGroupChilds('','view','${index - (10+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGroupChilds('','view','${index - (10+1)}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGroupChilds('','view','${totalValue}'); ">
              	</div> 
              	</c:if>
              	
              	
              	
              	
              		<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maximumRecords)}" ${index-1 == i*maximumRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maximumRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              		
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="searchGroupChilds('','view',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              	
              </div>
  
  
              <div class="row">  
  <div class="col-lg-12" >
				<div class="row" style="text-align: center;margin-top:15px">
						
						<input type="button" class="btnCls" style="" onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />">
						</div>
	</div>
	</div>
	
        </div>
        <div class="box-footer">
                                    
                    </div>
        	 </form>
            	 <input type="hidden" id="maxRecords" value="${maxRecords}">
        	 <input type="hidden" id="searchProductGroup" value="${searchName}">

</div>
<%--  <input type="hidden" id="subCategories" value='${subCategories}'>  --%>
<input type="hidden" id="groupID" value='${productGroup.groupId}'/>
</div>
</div>
</section><!-- /.content -->
</body>
</html>