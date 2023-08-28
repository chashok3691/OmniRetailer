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
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/productGroupMaster.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
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
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
    font-weight: normal; 
	color: white;
    background-color: rgb(128,128,128);
    /* border-color: black; */
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
	var deletedPlus =[];
	var totalRecords= $('#totalRecords').val();
	
// 	addNameToTextBox('fileUploadCSV');
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

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	

   
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
  <div class="col-xs-12" style="padding-top: 0px; padding-bottom: 0px;padding-right: 15px;padding-left: 15px;">
	<div class="box box-primary " style="padding: ">
     <div class="box-header" style="text-align: left">
    	<h3 align="center" style=" margin-top :10px; margin-bottom : 0px;"><spring:message code="new.product.group.label" /></h3>
     </div><!-- /.box-header -->
    <!-- form start -->
    <form>
      <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
        	<%-- <input type="button" id="submit" style="position: relative;margin-right: 1%" class="btn bg-olive btn-inline" onclick="validateProductGroupMasterForm('new')" value="<spring:message code="save.label" />">
			<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;position: relative;" onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />"> --%>	 
        </div>
        <div class="row">
</div>
		<div class="row" style="margin-right: 0px; padding :0px;">
        	 <div class="form-group col-lg-3 col-md-4" Style="padding:0px;">
        		 <div class="form-group col-lg-8 col-md-8">
        		         	<label style=""><spring:message code="newarrival.group" /> <span style="color:red; font-size:2">*</span></label>
        		 
	    		<%-- 	<label><spring:message code="group.name.label" /> <span style="color:red; font-size:2">*</span></label> --%>
	                <input type="text"  onblur="criteria(this)" class="form-control" id="groupId" value = "${productGroup.groupId}"placeholder="<spring:message code="newarrival.group" />"  oninput="this.value = this.value.replace(/[^a-zA-Z0-9\.\_]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
	                <span id="groupIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
        		 <div class="form-group col-lg-12 col-md-12">
	    			<label><spring:message code="group.name.label" /> <span style="color:red; font-size:2">*</span></label>
	                <input type="text"  onblur="criteria(this)" class="form-control" id="group_name" value = "${productGroup.groupDescription}"placeholder="<spring:message code="enter.group.name" />" />
	                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
            	 <div class="form-group col-lg-12 col-md-12">
                 <div class=" form-group col-lg-6 col-md-6 nopadding">
				<label><spring:message code="occasion.status.label" /></label>
	            <select class="form-control" name="status" id="status">
					<option value="1">Active</option>
					<option value="0">Inactive</option>
		        </select> 
		        </div>
          </div>
          		 <div class="form-group col-lg-12 col-md-12">
         	<label><spring:message code="comments.label" /></label>
          	<textarea rows="2"  onblur="criteriaSlashes2(this)" class="form-control" id="comments" style="resize: none;" value="${productGroup.groupComments}" placeholder="<spring:message code="enter.comments.label" />"></textarea>
          	<span id="commentsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
				 <div class="form-group col-lg-12 col-md-12">
          		<div class="col-lg-6 col-md-12" style="padding: 0px;">
          			<label><spring:message code="group.image.label" />&nbsp;&nbsp;</label><br>
	    			<div class="fileUpload btn btn-primar" style="font-weight: bold;height: 29px;width: 75px;border-color: ''">
		    			<span style="font-size: 15px;">Browse</span>
		    			<input id="groupImage" type="file" accept="image/x-png,image/gif,image/jpeg" onchange="loadImageFileAsURL('groupImage',this);" class="upload" />
					
					</div> <br>
										<span id="groupImageError" class="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					
				</div>
				<div class="col-lg-6 col-md-12" style="padding-left: 5px;padding-top:10px">
					<input id="groupImageFile" type="hidden"/>
					<input type='hidden' id='groupImage_refId'>
					<div id="groupImageimage" class="thumbnail companyimage" style="width:80px;height:59px; margin-bottom: 0px;">
						
					</div>
				</div>
				
            </div>
            </div>
             <div class="form-group col-lg-7 "style="background: #eee; padding: 17px 20px;">
	               <div class="row" style="    padding-left: 15px;">
	              <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="location.label"/></label>
	                          <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	                       <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                              <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == supplierid ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	                       <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="class.label"/></label>
	                           <select class="form-control" id="classId" >
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                        </select>
	                      </div>
	                       
	             </div>
	               <div class="row" style="    padding-left: 15px;">
	               <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="category.label"/></label>
	                           <select class="form-control" id="productCategory" onchange="searchSubCategories('productCategory','outletSubcategory')">
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                            <c:forEach var="categoryList" items="${categoryList}">
		                            <c:choose>
		                            <c:when test="${theCount.count == 1}">
		                            <option selected value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
		                            
		                            </c:when>
		                            
		                            
		                            <c:otherwise>
		                            <option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
		                            </c:otherwise>
		                            
		                            
		                            </c:choose>
		                            
							 		</c:forEach>
		                        </select>
	                      </div>
	                       <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="brand.label"/></label>
	                         
		                         <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
	                      </div>
	                      <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="subclass.label"/></label>
	                           <select class="form-control" id="subClassId" >
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                         
		                        </select>
	                      </div>
	                      
	              
	              
	              </div>
	               <div class="row" style="    padding-left: 15px;">
                     <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="subcategory.label"/></label>
	                           <select class="form-control" id="outletSubcategory" onchange="searchSectionsBasedOnSubCategory('productCategory','outletSubcategory', 'section');">
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
										<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
							 		</c:forEach>
		                        </select>
		                      
	                      </div>
	              <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
	                           <label><spring:message code="department.label"/></label>
	                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
	                           		 <option value=""><spring:message code="ALL.label"/></option>
		                            <c:forEach var="departmentList" items="${departmentList}">
										<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
							 		</c:forEach>
		                        </select>
	                      </div>
                       <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
                           <label><spring:message code="style.model.label"/></label>
                           <select class="form-control" id="styleId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          
	                        </select>
                      </div>
                      
               </div>
                <div class="row" style="    padding-left: 15px;">
                    <div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
                           <label><spring:message code="section.label"/></label>
                            <select class="form-control" id="classId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                        </select>
             		</div>
              		<div class="col-lg-4" style="padding-left:0px;padding-right: 30px;">
                           <label><spring:message code="subdepartment.label"/></label>
                        
                           		  <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${subDepartmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == subdepartment ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
	                       
                      </div>
                      
               </div>

             </div>
  	         <div class="form-group col-lg-2 "style="background: #eee; padding: 50px 50px;padding-left: 35px;">
                  <div class="row" >
                  <a onclick="standardProductGroupFilter('0','new','')" class="buttonsearch"><spring:message code="add.to.group.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="buttonsearch">CLEAR</a>
                  </div>
              </div>
              
             </div>
        
			
       
       

	
  		<div class="row">  
  		<br/>
  			<div class="form-group col-lg-8" style="text-align:center;  margin-bottom: 0.3%;">
                 <input type="hidden" id="groupId"/>
               	 <input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style=""  />
				<div class="services">
 					<div class="items">
  						<ul class="matchedStringUl productGroupMaster" style=""></ul>
					</div>
				</div>
               <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
          	</div>
          	
          	<div class="col-lg-3" style="">
						<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;  width: 233px;     padding: 3px !important;" id="fileUploadCSV"  onchange="addNameToTextBox('fileUploadCSV')"/>
					<span id="searchFilesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>
          	
          	
          	
          	<div class="form-group col-lg-1" style="padding-left:0px">
          	<input type="button" class="btn bg-olive btn-inline  addBtn"  onclick="importProductGroupExcelData(this)"  value="<spring:message code="import.label"  />">
         
  </div>
  </div>

                    
                          
   <div id="childs">                
     <input type="hidden" value="skuAdd" id="type" name="type"/> 
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
                
             
             <th><spring:message code="action.label"/><img id='Img' src="${pageContext.request.contextPath}/images/cancel.png" style="width:25px;cursor:pointer;" onclick="deleteAll();"/></th>
             
             
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 	
 			 
 			
 			 <c:forEach var="stockDetails" items="${itemsList}" varStatus="theCount">
 			 <tr id="dynamicdiv${theCount.count}">
 			 <td>${theCount.count + index}</td>
 			 <td>${stockDetails.skuId}</td>
 			 
 			 <c:choose>
 			 <c:when test="${empty stockDetails.skuDescription}"> 
 			 <td>${stockDetails.description}</td>
 			 </c:when>
 			 <c:otherwise>
 			 <td>${stockDetails.skuDescription}</td>
 			 </c:otherwise>
 			 </c:choose>
 			 <td>${stockDetails.ean}</td>
 			 <td>${stockDetails.color}</td>
 			 <td>${stockDetails.size}</td>
 			 <td>${stockDetails.measureRange}</td>
<%--  			 <td>${stockDetails.status}</td> --%>
 			  <c:set var = "skuStatus" value = "${fn:toUpperCase(stockDetails.status)}" />
 			 
 			 <c:choose>
 			 <c:when test="${stockDetails.status eq true}">
 			 <td>Active</td>
 			 </c:when>
 			   <c:when test="${stockDetails.status eq false}">
 			 <td>InActive</td>
 			 </c:when>
 			
 			 <c:when test="${skuStatus eq 'ACTIVE'}">
 			 <td>Active</td>
 			 </c:when>
 			 
 			 <c:when test="${skuStatus eq 'INACTIVE'}">
 			 <td>InActive</td>
 			 </c:when>
 			 
 			 
 			 <c:otherwise>
 			  <td>${stockDetails.status}</td>
 			 </c:otherwise>
 			 </c:choose>
 		
 			 
 			 <td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:25px;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
			
 			 <tr>
 			 
 			 </c:forEach> 

 			</tbody>
           </table>
           
     
           <br>
         </div>
         
         
      </div>   
         
         <div class="row" style="text-align: center; margin-top: 10px;">
        	<input type="button" id="submit"  class="btnCls" onclick="validateProductGroupMasterForm('new')" value="<spring:message code="submit.label" />">
        	<c:if test="${sessionScope.role == 'super admin'}">
			    	<input type="button" class="btnCls buttonMargin"  onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />">
			 </c:if>
		 	<c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
			    <c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true && accessControl.read == true}">
			  		<input type="button" class="btnCls buttonMargin" style="" onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />">
			  	</c:if>
		 	</c:forEach>
        </div>
        </div>
       
       
       
       
       
        <div class="box-footer"></div>
<!--          </div> -->
         
      <%--    <input type="hidden" id="maxRecords" value='${maxRecords}'/>
		<input type="hidden" id="searchProductGroup" value='${searchName}'/> --%>
         		 
         
      </form>
</div>
</div>
</div>

 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
        
  
        </script>


</section><!-- /.content -->


<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript">



</script>
<%-- <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.productGroupDataTables.js" type="text/javascript"></script> --%>

</body>
</html>