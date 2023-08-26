<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
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

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	 

<script type="text/javascript">
$(document).ready(function(){
	var deletedPlus =[];
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
<%-- 	    <c:if test="${type == 'edit'}"> --%>
	    	<h3 align="center"><spring:message code="edit.product.group.label" /></h3>
<%-- 	    </c:if> --%>
	    
	    </div><!-- /.box-header -->
    <!-- form start -->
    <form>
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	         <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
        	
       </div>
       	<c:set var="productGroupobj" value="${productGroup.groupObj}" scope="page" /> 
	 <div class="row">
       <div class="form-group col-lg-2 col-md-2">
     			<%-- <label><spring:message code="group.name.label" /> <span style="color:red; font-size:2">*</span></label>
                <input type="text" onblur="criteria(this)" class="form-control" id="group_name" value="${productGroupobj.groupDescription}" readonly="readonly" placeholder="<spring:message code="enter.group.name" />" />
                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                
        		   <label style=""><spring:message code="newarrival.group" /> <span style="color:red; font-size:2">*</span></label>
	                <input type="text"  onblur="criteria(this)" class="form-control" id="groupId" value = "${productGroup.groupId}" readonly="readonly" placeholder="<spring:message code="newarrival.group" />"  oninput="this.value = this.value.replace(/[^a-zA-Z0-9\.\_]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
	                <span id="groupIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
        </div>
         <div class="form-group col-lg-3 col-md-3"></div>
          <div class="form-group col-lg-2 col-md-2">
				<label><spring:message code="occasion.status.label" /></label>
				<input type="hidden" id="sds" value="${productGroupobj.groupStatus}">
	            <select class="form-control" name="status" id="status">
					<option value="1" ${'1' == productGroupobj.groupStatus ? 'selected' : ''} >Active</option>
		            <option value="0" ${'0' == productGroupobj.groupStatus ? 'selected' : ''} >Inactive</option>
	            </select> 
          </div>
          <div class="form-group col-lg-1 col-md-1"></div>
          <div class="form-group col-lg-4 col-md-4">
          		<div class="col-lg-9 col-md-9" style="text-align: right;margin-top: 20px;padding: 0px;">
          			<label><spring:message code="group.image.label" />&nbsp;&nbsp;</label>
	    			<div class="fileUpload btn btn-primar" style="font-weight: bold;height: 29px;width: 75px;border-color: ''">
		    			<span style="font-size: 15px;">Browse</span>
		    			<input id="groupImage" type="file" accept="image/x-png, image/gif, image/jpeg" onchange="loadImageFileAsURL('groupImage',this);" class="upload" />
					</div> 
				</div>
				<div class="col-lg-3 col-md-3" style="padding-left: 5px;">
					<input id="groupImageFile" type="hidden"/>
					<input type='hidden' id='groupImage_refId'>
					<div id="groupImageimage" class="" style="width:65px;height:50px;">
						<c:if test="${not empty productGroupobj.image}">
							<img style="width:65px;height:60px;" id="groupImage_thumbnail" src="${productGroupobj.image}">
						</c:if>
					</div>
				</div>
            </div>
     </div>
	<div class="row">
	<div class="form-group col-lg-3 col-md-3">
     			<label><spring:message code="group.name.label" /> <span style="color:red; font-size:2">*</span></label>
                <input type="text" onblur="criteria(this)" class="form-control" id="group_name" value="${productGroupobj.groupDescription}" readonly="readonly" placeholder="<spring:message code="enter.group.name" />" />
                <span id="groupNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
        </div>
        <div class="form-group col-lg-2 col-md-2"></div>
		<div class="form-group col-lg-4 col-md-4">
			<label><spring:message code="comments.label" /></label>
			<textarea class="form-control" onblur="criteria(this)" id="comments" style="resize: none;" placeholder="<spring:message code="enter.comments.label" />">${productGroupobj.groupComments}</textarea>
			<span id="commentsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		</div>
	</div>
	<br/>
  <div class="row"> 
  <br/> 
     <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchGroupChilds('','edit','0')">   
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
  
  			<div class="form-group col-lg-11" style="text-align:center;  margin-bottom: 0%;">
                <input type="hidden" id="groupId"/>
              	<input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style=""  />
				 <button id="mySearch" class="searchbutton" style="margin-right: 14px;"></button>
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl productGroupMaster" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
         	  </div>
  </div>
  
 
  	<div class="table-responsive">
             <table id="skusList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                    
                 <%--   <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
									<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true}"> 
                                  		<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                  	</c:if>
                                  </c:forEach>  --%>
                                  
                 	 <th><spring:message code="report.sno.label" /></th>               
                 	 <th><spring:message code="skuid.label" /></th>
                     <th><spring:message code="product.description.label" /></th>
                     <th><spring:message code="ean.label"/></th>
                     <th><spring:message code="colour.label"/></th>
                     <th><spring:message code="size.label"/></th>
                     <th><spring:message code="range.label"/></th>
                     <th><spring:message code="newarrival.product.status"/></th>
                     <th><spring:message code="action.label"/></th>
                     
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach var="productGroup" items="${productGroup.groupChildLists}" varStatus="theCount">
 			
				<tr class="update" id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
				<input type="hidden" id="pluCode${theCount.count}" value= "${productGroup.pluCode}"/>
					<input type="hidden" id="sNo${theCount.count}" value= "${productGroup.sNo}"/>
					
					<%-- <c:if test="${sessionScope.role == 'super admin'}"> 
                                   	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${productGroup.groupId}' /></td>
                                   </c:if>
                                  <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
									<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true}"> 
                                  		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${productGroup.groupId}' /></td>
                                  	</c:if>
                                  </c:forEach> --%>	
                                  
                                  
                                  
     				 <td class="slno">${theCount.count + index-1}</td>
					<td id="skuId${theCount.count}">${productGroup.skuId}</td>
 					 <td id="desc${theCount.count}">${productGroup.description}</td>
 			 		<td id="ean${theCount.count}">${productGroup.ean}</td>
 			 		<td id="color${theCount.count}">${productGroup.color}</td>
 			 		<td id="size${theCount.count}">${productGroup.size}</td>
 			 		<td id="range${theCount.count}">${productGroup.measureRange}</td>
<!-- 					<td></td> -->
					
				    <%--<td id="pluCode${theCount.count}">${productGroup.pluCode}</td>
				    <td id="comments${theCount.count}"><textarea id="textComments${theCount.count}" onblur="plusList(this);" class="form-control" style="resize:none;">${productGroup.comments}</textarea></td>
					 <input type="hidden" id="itemStatus${theCount.count}" value="${productGroup.itemStatus}"/> --%>
					
					<c:choose>
		<c:when test="${productGroup.itemStatus==true}">
		<td id="status${theCount.count}">Active</td>
		</c:when>
		
		<c:otherwise>
		<td id="status${theCount.count}">In Active</td>
		</c:otherwise>
		</c:choose>
					
					<%-- <td>${productGroup.itemStatus}
					<select class="form-control" style="resize:none;" id="status${theCount.count}">
					<option value="true" ${'true' == productGroup.itemStatus ? 'selected' : ''}>Active</option>
					<option value="false" ${'false' == productGroup.itemStatus ? 'selected' : ''}>In Active</option>
					</select> 
					</td>
					--%>
					<td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:30px;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
				
				</tr>
				
           </c:forEach>    
 			</tbody>
           </table>
           <br/>
         </div>

  <input type="hidden" value="${totalValue}" id="totalValue"/>
                  <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">        <!--  10 -->
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGroupChilds('','edit','${totalValue}');">    
              	</div>
              	</c:if>
              	
           <c:if test="${totalValue == totalRecords}"> 
              			<c:if test="${totalValue-maxRecords >0}">
              			<div class="form-group col-lg-6" style="text-align: left;"> <!--  11 -->
              		 <input type="button" class='paginationButton' value="&#60;" onclick="return searchGroupChilds('','edit','${index - (10+1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div> 
              			</c:if>
              			
              			 <c:if test="${totalValue-maxRecords <= 0}">	              
              		<div class="form-group col-lg-6" style="text-align: left;"> <!--  12 -->
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	 </c:if>  
              	</c:if> 
              	
                   <c:if test="${index-1 != 0 &&  totalValue != totalRecords}">          
              		<div class="form-group col-lg-6" style="text-align: left;"> <!--  13 -->
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGroupChilds('','edit','${index - (10+1)}'); "> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGroupChilds('','edit','${totalValue}'); ">
              	</div> 
              	</c:if> 
              	    
              	  	<div class="col-lg-6" style="text-align: right;"> 
              	    <div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              		
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maximumRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	</div>
              	
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="searchGroupChilds('','edit',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
              
        
  
  
             <div class="row">  
  				<div class="col-lg-12" >
					<div class="row" style="text-align: center;margin-top:15px">
			        	<c:if test="${type == 'new'}">
				       	 	<input type="button" id="submit" style="" class="btnCls" onclick="validateProductGroupMasterForm('new')" value="<spring:message code="submit.label" />">
				       	 	<c:if test="${sessionScope.role == 'super admin'}">
							    	<input type="button" class="btnCls buttonMargin" style="" onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />">
							 </c:if>
						 	<c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
							    <c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true && accessControl.read == true}">
							  		<input type="button" class="btnCls buttonMargin" style="" onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />">
							  	</c:if>
						 	</c:forEach>
							
			        	</c:if>
						 <c:if test="${type == 'edit'}">
				       	 	<input type="button" id="submit" style="" class="btnCls" onclick="validateProductGroupMasterForm('edit',${index-1})" value="<spring:message code="submit.label" />">
							<input type="button" class="btnCls buttonMargin"  onclick="viewProductGroupMaster('productGroupMaster','0');" value="<spring:message code="cancel.label" />">
			        	</c:if>
				    </div>
				</div>
			 </div>
        </div>
        <div class="box-footer"></div>
   </form>
</div>
<%--  <input type="hidden" id="subCategories" value='${subCategories}'>  --%>

<input type="hidden" id="maxRecords" value='${maxRecords}'/>
<input type="hidden" id="searchProductGroup" value='${searchName}'/>
 <c:if test="${type == 'edit'}">
	 <input type="hidden" id="groupId" value='${productGroup.groupId}'/> 
	<input type="hidden" id="operation" value='${type}'/>
	
	
</c:if>
</div>
</div>
</section><!-- /.content -->
</body>
</html>