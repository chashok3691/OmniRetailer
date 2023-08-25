<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : admin/genericData/newBrandMaster.jsp
 * file type		        : JSP
 * description				: The newBrandMaster form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/brandMaster.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">
	.col-xs-12 {
	 padding: 5%; 
	 }
</style>

<script type="text/javascript">
$(document).ready(function(){
	print_country("country");
	$("#country").val("India");
	$("#brand_name").focus();
	$("#Success").focus();
/* var subCategories = $("#subCategories").val();
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
} */

/* $('#category').change(function () {
	 var category = $("#category").val();
	 subcategoryArray = parsedJson[category];
	 	var op = '';
		for(var i=0;i<subcategoryArray.length;i++){
			op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
		}
		$("#sub_category").html(op);
   }); */
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
	    <h3 align="center"><spring:message code="new.brand.label" /></h3>
    	</div><!-- /.box-header -->
    <!-- form start -->
    <form>
    
   <div class="box-body">
   		<div class="row" style="text-align: right; margin-top: 0px;">
    	 	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
    		<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
    	 	<input type="button" id="submit" style="position: relative;margin-right: 1%" class="btnCls" onclick="validateBrandMasterForm('new')" value="<spring:message code="submit.label" />">
    	 <input type="button" class="btnCls" style="margin-right: 15px"  onclick="viewBrandMaster('brandMaster','0');" value="<spring:message code="cancel.label" />">
    	 	<%-- <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    				<c:if test="${accessControl.appDocument == 'BrandMaster' && accessControl.write == true && accessControl.read == true}"> 
	   					<input type="button" class="btnCls" style="margin-right: 15px"  onclick="viewBrandMaster('brandMaster','0');" value="<spring:message code="cancel.label" />">
	   				</c:if>
	   			</c:forEach> --%>	 
       </div>

    <div class="row">
        <div class="form-group col-lg-4">
           	 <div class="row">
        		 <div class="col-lg-12">
        			 <label><spring:message code="brand.name.label" /> <span style="color:red; font-size:2">*</span></label>
           			 <input type="text" onblur="criteria(this)" class="form-control" id="brand_name" placeholder="<spring:message code="enter.brand.name" />" />
               		 <span id="brandNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
           		 </div>
           	 </div>
		    <div class="row">
		        <div class="col-lg-12">
		            <label><spring:message code="description1.label" /></label>
		            <textarea onblur="criteria(this)" class="form-control" style="resize:none;" id="description1" placeholder="<spring:message code="enter.description1" />"></textarea>
		        </div>   
		     </div>
		     <div class="row">
		         <div class="col-lg-12">
		            <label><spring:message code="brand.category.label" /> <span style="color:red; font-size:2">*</span></label>
		            <input type="text" onblur="criteria(this)" class="form-control" id="brandCategory" placeholder="<spring:message code="enter.brand.category" />" />
		            <span id="brandCategoryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
		         </div>
		     </div>
       </div>
       
       <div class="form-group col-lg-2"></div>
                           
 	<div class="form-group col-lg-4">
         <div class="row">
             <div class="col-lg-12">
                <label><spring:message code="manufacturer.label" /><span style="color:red; font-size:2">*</span></label>
                <input type="text" onblur="criteria(this)" class="form-control" id="manufacturer" placeholder="<spring:message code="enter.manufacturer" />" />
	            <span id="manufacturerError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             </div>
         </div>
		 <div class="row">
             <div class="col-lg-12">
                 <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                 <input type="text"  class="form-control allField searchItems searchBar" value="${supplierName}" name="supplier_name" id="searchSupplier" placeholder="<spring:message code="search.supplier.label" />" />
				<div class=services>
   					<div class="items">
    					<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
  					</div>
			    </div>
					<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					<input type="hidden" class="allField" name="supplier_Id" id="supplier_Id" value=""  />
             </div>
        </div>
              <div class="row">
              	  <br>
              	  <div class="col-lg-12">
              	  <div class="col-lg-6">
                 	 <label><spring:message code="customer.group.label" /></label>
             	  	<select id="customerGroup" name="customerType" class="form-control">
				  	<!--  	  	<option value="-- Select --">-- Select --</option>-->
						<option value="PREMIUM">PREMIUM</option>
						<option value="PLUS">PLUS</option>
						<option value="BASIC">BASIC</option>
						<option value="GENERIC">GENERIC</option>
						<!-- <option >Select Country</option> -->
				    </select>
				    </div>
				    
				     <div class="form-group col-lg-6">
                            <label>B2C Visibility</label>
                           <select class="form-control"  id="b2cvisibility">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
                            
                         </div>
				    
                 </div>
             </div>
    </div>
    
    <div class="row">  
  		<div class="col-lg-12" style="text-align: center;margin-top: 25px;">
	         <div style="font-weight: bold;font-size: 16px;color:#666;margin-bottom: -42px;">
	              <span style="background-color: white;">&nbsp;Product Range&nbsp;</span>
	         </div>
	         <div class="col-lg-12"></div>
	             <hr style="margin-top: 31px;width: 97%;border-top: 1px solid rgb(181,230,29);">
	             <hr style="margin-top: -18px;width: 97%;border-top: 1px solid rgb(181,230,29);">
	     </div>  
    </div>
    
 </div>
	<div class="row">           
  			<div class="form-group col-lg-3">
               	 <div class="row">
                   	 <div class="col-lg-12">
						  <label><spring:message code="product.category.label" /></label>
                          <select class="form-control" onchange="searchSubCategoriesBasedOnCategory('category')" name="category" id="category">
                             <c:forEach var="category" items="${categories}">
                             	<%-- <option value="${category.categoryName}">${category.categoryDescription}</option> --%>
                             	<option value="${category.categoryName}" ${category.categoryName == product.category ? 'selected' : ''}>${category.categoryName}</option>
						 		<%-- <option value="${category}">${category}</option> --%>
							 </c:forEach>
                          </select> 
                    </div>
                 </div>
            </div>
              <div class="form-group col-lg-3"></div>
	   <div class="form-group col-lg-3">
        	 <div class="row">
            	 <div class="form-group col-lg-12">
                   	 <div class="row">
                       	 <div class="col-lg-12">
							  <label><spring:message code="product.subcategory.label" /></label>
                              <select class="form-control" name="sub_category" id="sub_category">
                               <option value="Select" >-- Select --</option>
                              	<c:forEach var="subCategory" items="${subCategoryList}">
                                      <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == product.sub_category ? 'selected' : ''}>${subCategory.subcategoryName}</option>
								</c:forEach>
                              </select>
                         </div>
                     </div>
  			     </div>
  			</div>
  		</div>
    </div>             
        <div class="row">  
 <!--  <div class="col-lg-12" >
  <div class="col-lg-3" >
</div>  --> 
  <div class="col-lg-12">
      <!--  <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2"></span></label>-->
      <input type="hidden" id="desc"/>
    <%--   <label><spring:message code="search.items.here.label" /><span style="color:red; font-size:2">*</span></label> --%>
      <input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"/>
		<div class="services">
 			<div class="items">
  				<ul class="matchedStringUl brandMasterProduct" style=""></ul>
			</div>
		</div>
          <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
   </div>
  <!-- </div> -->
 </div>
  
  <div class="table-responsive">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th><spring:message code="product.name.table.label" /></th>
                     <th><spring:message code="product.description.table.label" /></th>
                     <th><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;"></tbody>
           </table>
           <br/>
         </div>

	<div class="row">
   		<div class="row">  
  			<div class="col-lg-12" style="text-align: center;margin-top: 25px;">
			    <div style="font-weight: bold;font-size: 16px;color:#666;margin-bottom: -42px;">
			        <span style="background-color: white;">&nbsp;Price Range&nbsp;</span>
			    </div>
			    <div class="col-lg-12"></div>
			    <hr style="margin-top: 31px;width: 97%;border-top: 1px solid rgb(181,230,29);">
			    <hr style="margin-top: -18px;width: 97%;border-top: 1px solid rgb(181,230,29);">
			</div>  
		</div>
	  <div class="form-group col-lg-4">
         <div class="row">
            <div class="col-lg-6">
                <label><spring:message code="start.price.label" /> <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control" id="startPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.start.price" />" />
                <span id="startPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
         </div>
         <div class="row">
         	 <div class="col-lg-8">
                <label><spring:message code="country.label" /></label>
                    <select id="country" name="country" class="form-control"></select>
	<!-- 						<option  value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d'Ivoire">Cote d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select> -->
             </div>
        </div>
     </div> 
       <div class="form-group col-lg-2"></div>
     <div class="form-group col-lg-4">
         <div class="row">
             <div class="col-lg-6">
                 <label><spring:message code="end.price.label" /> <span style="color:red; font-size:2">*</span></label>
                 <input type="text" class="form-control" id="endPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"placeholder="<spring:message code="enter.end.price" />" />
                 <span id="endPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
             </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <label><spring:message code="location.label" /> <span style="color:red; font-size:2"></span></label>
               	<select class="form-control" id="location">
                    <c:forEach var="location" items="${workLocationsList}">
         	    	<option value="${location}">${location}</option>
					</c:forEach>
                </select>
                    <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            </div>
        </div>
     </div>
  </div>
  	<div class="row">  
 		 <div class="col-lg-12" >
			<label><spring:message code="description2.label" /></label>
            <textarea class="form-control" onblur="criteria(this)" style="resize:none;" id="description2" placeholder="<spring:message code="enter.description2" />"></textarea>
		</div>
	</div>
	<div class="row">  
  		<div class="col-lg-12" >
			<div class="row" style="text-align: right;margin-top:15px">
				 <input type="button" id="submit" style="margin-right: 1%" class="btnCls" onclick="validateBrandMasterForm('new')" value="<spring:message code="submit.label" />">
				 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
    				<c:if test="${accessControl.appDocument == 'BrandMaster' && accessControl.write == true && accessControl.read == true}"> 
	   					<input type="button" class="btnCls" style="margin-right: 15px"  onclick="viewBrandMaster('brandMaster','0');" value="<spring:message code="cancel.label" />">
	   				</c:if>
	   			</c:forEach>
			</div>
		</div>
	</div>
</div>
        <div class="box-footer">
        </div>
       </form>
      </div>
 <input type="hidden" id="subCategories" value='${subCategoryList}'> 
 <input type="hidden" id="maxRecords" value="${maxRecords}"/>
 			<input type="hidden" id="searchBrand" value="${searchName}"/>
</div>
</div>
</section><!-- /.content -->
</body>
</html>