<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home | OmniRetailer</title>

        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        
        <!-- DATA TABLES -->
      
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/State.js"></script>
        <script>     
                 $(document).ready(function(){
                        debugger;
        		   $('#searchState').keyup(function(e){
        			   var searchkey =  $('#searchState').val(); 
        		      if(searchkey.trim().length>=2 || searchkey.trim().length == 0){
        		    	  viewStateMaster('stateMaster','0','');   
        		      }
        		      
        	}); 
                 }); 

        </script>	
        

        
</head>
<body>
	<section class="content">
	<div class="row">
		<div class="col-lg-12 col-sm-12 col-xs-12">
			<div class="box box-primary" >
				<div class="row" style="padding:30px 20px">
				<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px; margin-top: -20px">${err}</div>
             	<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
					<div class="col-lg-12">
						<div class="col-lg-10"
							style="background: #F0F8FF; padding: 10px 20px;">
							<div class="col-lg-12">
							<div class="col-lg-3">
								<label>State Code <span style="color:red; font-size:2">*</span></label> <input type="text" name="statecode" id="statecode"
								value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="statecodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>Country Code <span style="color:red; font-size:2">*</span></label> <input type="text" name="countryCode"
									id="countryCode" value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="countrycodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>State Name <span style="color:red; font-size:2">*</span></label> <input type="text" name="stateName"
									id="stateName" value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="stateNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							<div class="col-lg-3">
								<label>GST State Code <span style="color:red; font-size:2">*</span></label> <input type="text" name="GSTCode" id="GSTCode"
									value="" placeholder="" onblur="criteriaSlashes(this)" class="form-control"  style="width:80%">
									 <span id="GSTCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							</div>
					
						</div>
						<div class="col-lg-2"
							style="padding: 10px 20px; background-color: #DCDCDC" id="createState" >
							<div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom: 8px; width: 100%; margin-top: 16px;" onclick="validateStateMaster('stateMaster','new');">Add
									New</a>
							</div>
							
							<!-- <div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom:8px; width: 100%; margin-top: 0px;" onclick="clearAll();">Clear</a>
							</div> -->
							
						</div>
						
							<div class="col-lg-2"
							style="padding: 10px 20px; background-color: #DCDCDC;display:none;" id="updateState" >
							<div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom: 8px; width: 100%; margin-top: 16px;" onclick="validateStateMaster('stateMaster','edit');">
									Update</a>
							</div>
							
							<!-- <div class="col-lg-12">
								<a class="btn bg-olive btn-inline"
									style="padding: 4px 8px; margin-bottom:8px; width: 100%; margin-top: 0px;">Clear</a>
							</div> -->
							
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12" style=" ">
						<%-- <div class="col-lg-1">
						<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewStateMaster('stateMaster','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>

							
						</div> --%>
						<div class="col-lg-11 ">

							 <input type="text" class="form-control searchItems searchBar" value="" style=""
								id="searchState" placeholder="search State..." />
							<!-- <button id="mySearch" class="searchbutton"></button> -->
                 
                 <div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl mySearch" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="sku" value=""> 
					</div> 
						
						  
						
						<input type="hidden" id="updatebtn" value="">
						<div class="col-lg-1">
							<input type="button" style=""
								class="btn bg-olive btn-inline  addBtn" onclick="deleteStateMaster('stateMaster')"
								value="Delete">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12" style="padding-right:35px;padding-left:35px">
						<table id="example1" class="table table-bordered table-striped" >
							<thead style="background-color: #3c8dbc; color: #ffffff">
								<tr>


									<th style="" align="center"><input type='checkbox'
										name='selectall' onClick='selectAll(this)'></th>

									<th>SL No.</th>

									<th>State Code</th>

									<th>Country Code</th>

									<th>State Name</th>
									
									<th>GST StateCode</th>

									
									<c:if test="${sessionScope.role == 'super admin'}"> 
									<th>Action</th>
									</c:if>
									 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         					<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true}"> 
									<th>Action</th>
									</c:if>
									</c:forEach>
								</tr>
															
							</thead>
							
							<tbody style="text-align: center;">
                   	<c:forEach var="stateListdetails" items="${stateList}" varStatus="theCount">
                       <tr>
                       <c:if test="${sessionScope.role == 'super admin'}"> 
                       		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${stateListdetails.stateCode}' /></td>
                       </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         				<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true}"> 
                       			<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${stateListdetails.stateCode}' /></td>
                       		</c:if>
                       	</c:forEach>
                       	
                       	
                       		<td>${theCount.index + index}</td>
                       		<td>${stateListdetails.stateCode}</td>
                       		<td>${stateListdetails.countryCode}</td>
                        	<td>${stateListdetails.stateName}</td>
                       		<td>${stateListdetails.gststatecode}</td>
                       		
                       		<td>
                       			<c:if test="${sessionScope.role == 'super admin'}"> 
                           		<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return EditStateDetails('${stateListdetails.stateCode}','${stateListdetails.countryCode}','${stateListdetails.stateName}','${stateListdetails.gststatecode}')">Edit</a>
                           	</c:if>
                           	 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	         					<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true}"> 
                           			<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return EditStateDetails('${stateListdetails.stateCode}','${stateListdetails.countryCode}','${stateListdetails.stateName}','${stateListdetails.gststatecode}')">Edit</a>
                           		</c:if>
                           	</c:forEach>
                       		
                       		
                       		</td>
							
							</tr>
							</c:forEach>
							
							
							</tbody>
						</table>
					</div>
				</div>
				          
			</div>
		</div>
	</div>
	
	<input type="hidden" id="deleteActionLabel" value="State Master"/>
	
	</section>
</body>
</html>