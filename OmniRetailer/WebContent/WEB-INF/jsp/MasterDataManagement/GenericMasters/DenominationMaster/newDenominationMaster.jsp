
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : RaviTeja.N
 * file name		        : admin/genericData/newDenominationMaster.jsp
 * file type		        : JSP
 * description				: The new DenominationMaster form is displayed using this jsp
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
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/denominationMaster.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<script type="text/javascript">
$(document).ready(function(){
	 $("#denominationName").keydown(function(){
		   $("#denominationNameError").html("");
		   $("#Error").html("");
	 });
	 $("#denominationValue").keydown(function(){
		   $("#denominationValueError").html("");
		   $("#Error").html("");
	 });
	 
});
	</script>
	
	<style type="text/css">
	.col-xs-12{
	padding: 2% 15%
	}
	
	.col-lg-3{
	padding-right: 0px;
	}
	
	.col-lg-2{
	padding-left: 0px;
	}
	
	.col-lg-4{
	padding-left: 0px;
	}
	.col-lg-6{
	padding-left: 0px;
	}
	.col-lg-8{
	padding-left: 0px;
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
    }
   .browsebutton:hover {
    background: grey !important;
}
.browsebutton {
    font-weight: bold;
    height: 28px;
    border-radius: 0px;
    padding: 2px 17px;
    background: grey;
    border: none;
}
.fileUpload {
    position: relative;
    overflow: hidden;
    /* margin: 10px; */
}

.companyimage{
width: 152px;
    /* margin-left: -100%; */
    margin-top: -7%;
    margin-bottom:0px;
    object-fit: contain;
    height: 46px;
}
	</style>
	
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
				<div class="box-header" style="text-align: center">
                                <br/>
                                
                              
                        		          <c:if test="${type =='new'}">
                        		         
                        		           <h3><spring:message code="new.denomination.header.label" /></h3>
                        		          
                        		         </c:if>
                        		         
                        		          <c:if test="${type =='edit'}">
                        		         
                        		         
                        		           
                        		           <h3><spring:message code="edit.denomination.header.label" /></h3>
                        		        
                        		           </c:if>
                        		        
                        		        <c:if test="${type =='view'}">
                        		        <h3><spring:message code="view.denomination.header.label" /></h3>
                        		        
                        		        </c:if>
                        		      
                                
                                
                                </div><!-- /.box-header -->
                                 <!-- form start -->
                                  <form id="newEmployee" method="post">
                                  <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
                        			<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                        		        <div class="row">
                        		        <div class="form-group col-lg-10">
                        		        <div class="col-lg-3">
                        		        <label>
                        		         <spring:message code="denomination.name.label" />
                        		         <span style="color:red; font-size:2">*</span>
                        		        </label>
                        		        </div>
                        		        <div class="col-lg-4">
                        		        <c:if test="${type=='new' || type=='edit'}">
                        		        <input type="text" onblur="criteria(this)" id="denominationName" class="form-control" value="${denominationMasterResponse.denominationName}">
                        		        </c:if>
                        		         <c:if test="${type=='view'}">
                        		        <input type="text" onblur="criteria(this)" id="denominationName" readonly="readonly" class="form-control" value="${denominationMasterResponse.denominationName}">
                        		        </c:if>
                        		        <span id="denominationNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        		        </div>
                        		        
                        		        </div>
                        		        <div class="form-group col-lg-10">
                        		        <div class="col-lg-3">
                        		        <label>
                        		         <spring:message code="denomination.value.label" />
                        		         <span style="color:red; font-size:2">*</span> 
                        		        </label>
                        		        </div>
                        		        <div class="col-lg-4">
                        		        <div class="col-lg-8">
                        		         <c:if test="${type=='new' }">
                        		        <input type="text" onblur="criteria(this)"  id="denominationValue" class="form-control" value="${denominationMasterResponse.denominationValue}">
                        		        </c:if>
                        		        <c:if test="${type=='view' || type=='edit'}">
                        		        <input type="text" onblur="criteria(this)" id="denominationValue" readonly="readonly" class="form-control" value="${denominationMasterResponse.denominationValue}">
                        		        </c:if>
                        		        </div>
                        		        <div class="col-lg-12" style=" padding-left: 0px;">
                        		        <span id="denominationValueError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        		        </div>
                        		        </div>
                        		        </div>
                        		        <div class="form-group col-lg-10">
                        		        <div class="col-lg-3">
                        		        <label>
                        		        <spring:message code="denomination.type.label" />
                        		        <span style="color:red; font-size:2">*</span>
                        		        </label>
                        		        </div>
                        		        <div class="col-lg-4">
                        		         <div class="col-lg-8">
                        		           <c:if test="${type=='new' || type=='edit'}">
                        		        <select  id="denominationType" class="form-control">
                        		       <%--  <option value="${location}" ${location == quoteObj.fromLocation ? 'selected' : ''} >${location}</option> --%>
                        		        <option value="1" ${denominationMasterResponse.denominationType == "1" ? 'selected' : ''} ><spring:message code="denomination.note.label" /></option>
                        		        <option value="0" ${denominationMasterResponse.denominationType == "0" ? 'selected' : ''} ><spring:message code="denomination.coin.label" /></option>
                        		        </select>
                        		        </c:if>
                        		         <c:if test="${type=='view'}">
                        		        <select  id="denominationType" class="form-control" disabled="disabled">
                        		       <%--  <option value="${location}" ${location == quoteObj.fromLocation ? 'selected' : ''} >${location}</option> --%>
                        		        <option value="1" ${denominationMasterResponse.denominationType == "1" ? 'selected' : ''} ><spring:message code="denomination.note.label" /></option>
                        		        <option value="0" ${denominationMasterResponse.denominationType == "0" ? 'selected' : ''} ><spring:message code="denomination.coin.label" /></option>
                        		        </select>
                        		        </c:if>
                        		        </div>
                        		        
                        		        <span id="denominationTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        		       
                        		        </div>
                        		        </div>
                        		         
                        		         
                        		         
                        		        <div class="form-group col-lg-10">
                        		        <div class="col-lg-3">
                        		        <label>
                        		        <spring:message code="currency.code.label" />
                        		        <span style="color:red; font-size:2">*</span>
                        		        </label>
                        		        </div>
                        		        <div class="col-lg-4">
                        		         <div class="col-lg-8">
                        		           <c:if test="${type=='new' || type=='edit'}">
                        		        <select  id="denominationCode" class="form-control">
                        		        <c:forEach var="currencyCodesList" items="${currencyCodes}">
										<option value="${currencyCodesList}" ${currencyCodesList == currencyCode ? 'selected' : ''} id="${currencyCodesList}" >${currencyCodesList}</option>
						 					</c:forEach>
                        		        </select>
                        		        </c:if>
                        		         <c:if test="${type=='view'}">
                        		        <select  id="denominationCode" class="form-control" disabled="disabled">
                        		        <c:forEach var="currencyCodesList" items="${currencyCodes}">
										<option value="${currencyCodesList}" ${currencyCodesList == currencyCode ? 'selected' : ''} id="${currencyCodesList}" >${currencyCodesList}</option>
						 					</c:forEach>
                        		        </select>
                        		        </c:if>
                        		     </div>
                        		        
                        		        <span id="denominationCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        		       
                        		        </div>
                        		        </div>
                        		      
                        		         
                        		         
                        		         
                        		         
                        		         
                        		         <div class="form-group col-lg-10">
                        		         <div class="col-lg-3">
                        		        <label><spring:message code="denomination.status.label" /></label>
                        		         </div>
                        		         <div class="col-lg-4">
                        		         
                        		          <div class="col-lg-8">
                        		           <c:if test="${type=='new' || type=='edit'}">
                        		        <select  id="denominationStatus" class="form-control">
                        		       <%--  <option value="${location}" ${location == quoteObj.fromLocation ? 'selected' : ''} >${location}</option> --%>
                        		        <option value="true" ${denominationMasterResponse.denominationStatus == "true" ? 'selected' : ''} ><spring:message code="active.label" /></option>
                        		        <option value="false" ${denominationMasterResponse.denominationStatus == "false" ? 'selected' : ''} ><spring:message code="inActive.label" /></option>
                        		        </select>
                        		        </c:if>
                        		         <c:if test="${type=='view'}">
                        		        <select  id="denominationType" class="form-control" disabled="disabled">
                        		       <%--  <option value="${location}" ${location == quoteObj.fromLocation ? 'selected' : ''} >${location}</option> --%>
                        		        <option value="true" ${denominationMasterResponse.denominationStatus == "true" ? 'selected' : ''} ><spring:message code="active.label" /></option>
                        		        <option value="false" ${denominationMasterResponse.denominationStatus == "false" ? 'selected' : ''} ><spring:message code="inActive.label" /></option>
                        		        </select>
                        		        </c:if>
                        		        </div>
                        		         </div>
                        		        </div>
                        		        <div class="form-group col-lg-10">
                        		        <div class="col-lg-3">
                        		        <label><spring:message code="denomination.image.label" /></label>
                        		        </div>
                        		        <div class="col-lg-4">
                        		       <input id="denominationFile" class="form-control" value="" placeholder="Choose File" disabled="disabled">
                        		       <input type="hidden" id="denomination_refId">
                        		        </div>
                        		        <div class="col-lg-2">
                        		        <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Browse...</span>
			    			         <c:if test="${type=='new' || type=='edit'}">
			    			         <input id="denominationBtn" type="file" accept=".jpg, .png, .PNG, .gif" onchange="addNameToTextBox('denomination',this);" class="upload">
						                </c:if>
						                 <c:if test="${type=='view'}">
			    			         <input id="denominationBtn" type="file" disabled="disabled" accept=".jpg, .png, .PNG, .gif" onchange="" class="upload">
						                </c:if>
						                </div>
						              </div>
                        		<div class=" col-lg-3 col-sm-3 col-xs-3">
            <div class="" title="Denomination Image" id="denomination_image" style="text-align: center;width:150px;;">
            <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
            <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="${denominationMasterResponse.denominationImage}">
            
											<label class="myFile" id="logo1_label"></label>
											</div>
            </div>        
                        		        </div>
                        		        <div class="form-group col-lg-10">
                        		        <div class="col-lg-3" style="padding-top: 15px">
                        		        <label> <spring:message code="description.label" /></label>
                        		        </div>
                        		          <div class="col-lg-6">
                        		          <c:if test="${type=='new' || type=='edit'}">
                        		          <textarea class="form-control" onblur="criteria(this)" style="resize:none;" rows="3" name="denominationDescription"  id="denominationDescription"  placeholder="<spring:message code="enter.description.label" />">${denominationMasterResponse.description}</textarea>
                        		         </c:if>
                        		          <c:if test="${type=='view'}">
                        		          <textarea class="form-control" readonly="readonly" style="resize:none;" rows="3" name="denominationDescription"  id="denominationDescription"  placeholder="<spring:message code="enter.description.label" />">${denominationMasterResponse.description}</textarea>
                        		         </c:if>
                        		          </div>
                        		        </div>
                        		        </div>
                        		        <br/>
                        		        <br/>
                        		        
                        		        
                        		        <div class="row" style="text-align: center;">
                        		        <div class="col-lg-12">
                        		        
                        		       
                        		       
                        		           <c:if test="${type =='new'}">
                        		           <div class="col-lg-2"></div>
                        		        <div class="col-lg-4">
                        		         
                        		           <input type="button" style="" class="btn bg-olive btn-inline btnCls" onclick="validateDenomination('new')" value="<spring:message code="submit.label" />" />
                        		         </div>
                        		          </c:if>
                        		         
                        		            <c:if test="${type =='edit'}">
                        		          <div class="col-lg-2"></div>  
                        		        <div class="col-lg-4">
                        		           
                        		           <input type="button" style="" class="btn bg-olive btn-inline btnCls" onclick="validateDenomination('edit')" value="<spring:message code="submit.label" />" />
                        		        </div>
                        		           </c:if>
                        		        
                        		       
                        		        
						                
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						    <c:if test="${type !='view'}">
						  
                        		        <div class="col-lg-4">
						  	<input type="button" class="btn bg-olive btn-inline btnCls" style="margin-left:5%;" onclick="viewDenomination('denominationMaster','0');" value="<spring:message code="cancel.label" />" />
						 </div>
						 <div class="col-lg-2"></div>
						 </c:if>
						 <c:if test="${type =='view'}">
							<%-- <input type="button" style="" class="btn bg-olive btn-inline btnCls" style="margin-left:5%;" onclick="viewDenominationMaster('denominationMaster','0');" value="<spring:message code="cancel.label" />" /> --%>
							<div class="row" style="text-align: center;">
		
		                  <input type="button" class="btn bg-olive btn-inline btnCls" onclick="viewDenominationMaster('denominationMaster','0');" style="margin-left: 25px;" value="<spring:message code="cancel.label" />">
	                           </div>
							
							</c:if>
						  </c:if>
						  
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'DenominationMaster' && accessControl.write == true && accessControl.read == true}">
                            <c:if test="${type !='view'}">
                            
                        		        <div class="col-lg-4">
								<input type="button" style="" class="btn bg-olive btn-inline btnCls" style="margin-left:5%;" onclick="viewDenominationMaster('denominationMaster','0');" value="<spring:message code="cancel.label" />" />
							 </div><div class="col-lg-2"></div>
							</c:if>
							<c:if test="${type =='view'}">
							<%-- <input type="button" style="" class="btn bg-olive btn-inline btnCls" style="margin-left:5%;" onclick="viewDenominationMaster('denominationMaster','0');" value="<spring:message code="cancel.label" />" /> --%>
							<div class="row" style="text-align: center;">
		
		                  <input type="button" class="btn bg-olive btn-inline btnCls" onclick="viewDenominationMaster('denominationMaster','0');" style="margin-left: 25px;" value="<spring:message code="cancel.label" />">
	                           </div>
							
							</c:if>
							</c:if>
						</c:forEach>
						</div>
						 </div>
									<br/>
                                    <div class="box-footer"></div>
                                    </div>
                        		  	  </form>
                        		  </div>
                        		
				</div>
   </div>
  				
</section>

</body>
</html>