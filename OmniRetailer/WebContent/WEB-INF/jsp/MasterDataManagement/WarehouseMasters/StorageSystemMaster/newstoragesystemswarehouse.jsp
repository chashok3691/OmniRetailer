<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  

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
    padding: 2px 5px;
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
      
      
               <h3  class="box-title" style="border:1px solid #3d3838;;font-weight: bold;width:20%;padding:5px">Storage Systems-New</h3>
           </div>
           <div align="center">
		
               <span id="StorageidError" style="text-align:right;color:red;font-weight:bold;"></span>
               </div>
               
		<div class="box-body table-responsive">
          <div class="row">
              <div class=" col-lg-12" style="margin-top:2%;margin-bottom:2%">
              
              <div class=" col-lg-4" >
               
                <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Locations</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="location" style="">
                <c:forEach var="warehouse" items="${warehouses}" varStatus="theCount">
                           		 <option value="${warehouse.warehouseLocation}-${warehouse.warehouseId}">${warehouse.warehouseLocation}</option>
	                            </c:forEach>
						 		
	                        </select>
                       
                       </div>
                      
                     </div>  
                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Storage area Code</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="storageAreacode" style="">
                           		 <option value=""></option>
						 		
	                        </select>
                       
                       </div>
                     </div>  
                     
                    
                     
                     
                     
                    
                     
                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Length</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="length" class="form-control" style="width:50%">
                       
                       </div>
                     </div>  
                     
                     <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Width</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="width" class="form-control" style="width:50%">
                       
                       </div>
                     </div>  
                     
               
                       
                       </div>
                       
                       <div class=" col-lg-4">
             <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Storage System Name <span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="storagename" class="form-control">
                       
                       </div>
                     </div>  
               
                <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Storage Type <span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="storagetype" style="">
                           		 <option value="">ALL</option>
	                            
									<option value="Shelf" >Shelf</option>
									<option value="Racks" >Racks</option>
									<option value="Bins" >Bins</option>
									<option value="Fridge" >Fridge</option>
									<option value="Empty area" >Empty area</option>
									<option value="Bin Array" >Bin Array</option>
						 		
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
               <input type="text" id="manufacturer" class="form-control">
                       
                       </div>
                      
                     </div>  
                
                       
                       </div>
                       
                        <div class=" col-lg-4">
              
               
               <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">No of Levels</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="nooflevels" class="form-control" style="width:50%">
                       
                       </div>
                       
                     </div>  
               
               <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Level Partitions</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="levelofPartions" class="form-control" style="width:50%">
                       
                       </div>
                     
                     </div>  
                
                 <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Total Capacity<span
										style="color: red; font-size: 2">*</span></label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="sscapacity" class="form-control" style="">
                       
                       </div>
                       
                     </div> 
                      <div class=" col-lg-12">
              
              <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Material Type</label>
                       
                       </div>
                       
                       <div class=" col-lg-6" style="text-align: right;margin-bottom:10px">
               <select class="form-control" id="materialtype" style="">
                           		 <option value="">ALL</option>
	                            
									
						 		
	                        </select>
                       
                       </div>
                     </div>   
                
                       
                       </div>
                     </div> 
                     
                   <div class=" col-lg-11" style="margin-bottom: 1px;margin-top: 18px;">
                   
                   <input type="text"  class="form-control searchItems" id="searchItems"    placeholder="Search and Add the SKU" style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl StorageMasterWarehouse" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                   
                   
                   </div>
                      <div class="col-lg-1" style="padding-left: 0px;margin-top:18px">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="deleteAll();" value="Delete All">
								</div> 
                   <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:97%;position: relative;white-space: nowrap;min-height: 250px; margin-left: 1.5%;">
                   <table id="packagingList" class="table table-bordered table-striped" style="">
                      <thead style="">
                       <tr>
                       <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                       <th style="text-align:left;padding: 5px !important">S No</th>
                       <th style="text-align:left;padding: 5px !important">SKU ID</th>
                       <th style="text-align:left;padding: 5px !important">SKU Description</th>
                        <th style="text-align:left;padding: 5px !important">Level</th>
                       <th style="text-align:left;padding: 5px !important">Capacity</th>
                       <th style="text-align:left;padding: 5px !important;width: 40%;">Comments</th>
                       <th style="text-align:left;padding: 5px !important">Action</th>
                      
                       </tr>
                       </thead>
                       
                       <tbody>
                      
                       </tbody>
                       </table>
                       </div>
                     
                     
                      <div class=" col-lg-12">
                      
                      <input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="validateStorageSystemMaster('new')" style="margin-left:35%;width: 80px; " value="Submit" />
				<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:14%;width: 80px;   " onclick="viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','0','');" value="Cancel" />
							
                      
                      </div>
                     
                      </div>
                      
                     
                      
                      
                      
                      
                      </div>
                     </div>
              
              </div>    
              </div>
              

</section>
 




</body>
</html>