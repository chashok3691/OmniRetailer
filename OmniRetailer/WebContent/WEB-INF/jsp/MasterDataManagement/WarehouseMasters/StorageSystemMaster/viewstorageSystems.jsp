<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/storagesystem.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/outlet.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/stockUpload.js"></script>
<style type="text/css">
table {
  border-spacing: 10px;
}
 .buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.labelheading{
    background: #ccc;
    padding: 2px 15px 2px 15px;
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

</style>

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
	
</head>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
      
      
               <h3  class="box-title" style="border:1px solid #3d3838;;font-weight: bold;width:20%;padding:5px">${warehouseStorage.storageSystemId} - View</h3>
           </div>
           <div align="center">
		
               <span id="StorageidError" style="text-align:right;color:red;font-weight:bold;"></span>
               </div>
               
		<div class="box-body table-responsive" style="pointer-events: none;">
          <div class="row">
              <div class=" col-lg-12" style="margin-top:5%;margin-bottom:5%">
              
              <div class=" col-lg-4" >
               <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Locations</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="location" style="width:80%">
                <c:forEach var="warehouse" items="${warehouses}" varStatus="theCount">
	                           <option value="${warehouse.warehouseLocation}-${warehouse.warehouseId}"  ${warehouse.warehouseId == warehouseStorage.warehouseId ? 'selected' : ''}>${warehouse.warehouseLocation}</option>
	                            </c:forEach>
						 		
	                        </select>
                       
                       </div>
                     
                     </div>  
                     <input type="hidden" id="Storageid" value="${warehouseStorage.storageSystemId}">
       
                      <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Storage area Code<span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="storageAreacode" style="">
                           		 <option value="">All</option>
	                           
						 		
	                        </select>
                       
                       </div>
                     </div>  
                     
                   
                     
                     
                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Length</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="length" class="form-control" style="width:50%" value="${warehouseStorage.length}">
                       
                       </div>
                     </div>  
                     
                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Width</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="width" class="form-control" style="width:50%" value="${warehouseStorage.width}">
                       
                       </div>
                     </div>  
                     
               
                       
                       </div>
                       
                       <div class=" col-lg-4">
                       
                                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Storage System Name<span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="storagename" class="form-control" value="${warehouseStorage.storageSystemName}">
                       
                       </div>
                     </div>  
                     
                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Storage Type<span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="storagetype" style="width:80%">
                           		 <option value="">ALL</option>
	                            <option value="Shelf" ${'Shelf' == warehouseStorage.storageSystemType ? 'selected' : ''} >Shelf</option>
		                        <option value="Racks" ${'Racks' == warehouseStorage.storageSystemType ? 'selected' : ''} >Racks</option>
		                        <option value="Bins" ${'Bins' == warehouseStorage.storageSystemType ? 'selected' : ''} >Bins</option>
		                        <option value="Fridge" ${'Fridge' == warehouseStorage.storageSystemType ? 'selected' : ''} >Fridge</option>
		                        <option value="Empty area" ${'Empty area' == warehouseStorage.storageSystemType ? 'selected' : ''} >Empty area</option>
		                        <option value="Bin Array" ${'Bin Array' == warehouseStorage.storageSystemType ? 'selected' : ''} >Bin Array</option>
		                        
	                        </select>
                       </div>
                     </div>  
                       
               <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Storage Icon</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
              
              
              
                    <div class="col-lg-4">
                        		       <input type="hidden" id="signature_refId">
                        		          <input type="hidden" id="signatureFile">
                        		           <input type="hidden" id="storageIconr" value="${warehouseStorage.storageIcon}">
                        		          <input type="hidden" id="currentStockr" value="${warehouseStorage.currentStock}">
                        		           <input type="hidden" id="rowsr" value="${warehouseStorage.rows}">
                        		          <input type="hidden" id="columnss" value="${warehouseStorage.columns}">
                        		           <input type="hidden" id="sscapacity" value="${warehouseStorage.storageSystemCapacity}">
                        		          
                        		          
                        		      <div class="row">
                        		        <div class="col-lg-2" style="padding-left: 0px;">
                        		        <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Storage icon...</span>
			    			         <input id="signatureBtn" type="file" accept=".jpg, .png, .PNG, .gif" onchange="addNameToTextBox('signature',this);" class="upload">
						                </div>
						              </div>
                        		      
                        		        </div>
								   </div>
								   
								 
                       
                       </div>
                       
                     </div>  
               
               <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Manufacturer</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="manufacturer" class="form-control" value="${warehouseStorage.manufacturer}">
                       
                       </div>
                      
                     </div>  
               
          
                     
               
                       
                       </div>
                       
                       
                       <div class="col-lg-4">
                       
                       
                       
                            <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">No of Levels</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="nooflevels" class="form-control" style="width:50%" value="${warehouseStorage.noOfLevels}">
                       
                       </div>
                      
                     </div>  
               
               <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Level Partitions</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="levelofPartions" class="form-control" style="width:50%" value="${warehouseStorage.levelPartition}">
                       
                       </div>
                       
                     </div> 
                     
                        <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Total Capacity<span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="sscapacity" class="form-control" style="width:80%" value="${warehouseStorage.storageSystemCapacity}">
                       
                       </div>
                       
                     </div> 
                       <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Material Type</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <select class="form-control" id="materialtype" style="width:80%">
                           		 <option value="">ALL</option>
	                            
									
						 		
	                        </select>
                       
                       </div>
                     </div>  
                       
                       
                       
                       
                       </div>
                       
                     </div> 
                     
                   <div class=" col-lg-12" style="margin-bottom: 1px">
                   
                   <input type="text"  class="form-control searchItems" id="searchItems"    style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl StorageMasterWarehouse" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                   
                   
                   </div>
                   <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:97%;position: relative;white-space: nowrap;min-height: 250px; margin-left: 1.5%">
                   <table id="packagingList" class="table table-bordered table-striped" style=" ">
                      <thead style="">
                       <tr>
                        <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                       <th style="text-align:left;padding: 5px !important">S No</th>
                       <th style="text-align:left;padding: 5px !important">SKU ID</th>
                       <th style="text-align:left;padding: 5px !important">SKU Description</th>
                        <th style="text-align:left;padding: 5px !important">Level</th>
                       <th style="text-align:left;padding: 5px !important">Capacity</th>
                       <th style="text-align:left;padding: 5px !important;width: 40%;">Comments</th>
                      <th>Action</th>
                       </tr>
                       </thead>
                       
                       <tbody>
                        <c:forEach var="storageSystem" items="${warehouseStorageDetails}"  varStatus="theCount">
                         	
                       <tr id="dynamicdiv${theCount.count}">
                        <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${theCount.count}" /></td>
                        <td  class="slno" id="itemno${theCount.count}">${theCount.count}</td>
                        <td id="skuID${theCount.count}">${storageSystem.skuId}</td>
                         <td id="Desc${theCount.count}">${storageSystem.description}</td>
                          <td id="level${theCount.count}">${storageSystem.level}</td>
                          <td id="capacity${theCount.count}">${storageSystem.quantityFl}</td>
                          <td id="comments${theCount.count}">${storageSystem.remarks}</td>
                        <td id="Del${theCount.count}"><img id="Img${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItem(this);" title="Delete ${equipments.equipmentId}"/></td>
                      
                       </tr>
                       </c:forEach>
                       </tbody>
                       </table>
                       </div>
                     
                     
                      <div class=" col-lg-12" style="text-align:center">
                      
				<input type="button" id="edit"  class="btn bg-olive btn-inline" style="width: 80px;pointer-events: all;    " onclick="viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','0','');" value="Cancel" />
							
                      
                      </div>
                     
                      </div>
                      
                     
                      
                      
                      
                      
                      </div>
                     </div>
              
              </div>    
              </div>
              

</section>
 




</body>
</html>