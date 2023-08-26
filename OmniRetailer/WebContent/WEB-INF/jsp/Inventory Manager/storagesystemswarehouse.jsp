<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/storagesystem.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/outlet.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/packagingAndProcessing.js"></script>
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
</head>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
      
      
               <h3  class="box-title" style="border:1px solid #3d3838;;font-weight: bold;width:20%;padding:5px">Storage Systems</h3>
           </div>
           <div align="center">
		
               <span id="StorageidError" style="text-align:right;color:red;font-weight:bold;"></span>
               </div>
               
		<div class="box-body table-responsive">
          <div class="row">
              <div class="col-lg1-12 col-lg-12" style="margin-top:5%;margin-bottom:5%">
              
              <div class="col-lg1-6 col-lg-6" >
               <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Storage System ID</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="Storageid" class="form-control" style="width:75%">
                       
                       </div>
                     </div>  
                     <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Storage System Name</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="storagename" class="form-control">
                       
                       </div>
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Storage Type</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <select class="form-control" id="storagetype" style="width:80%">
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
                     
                     <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Material Type</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <select class="form-control" id="materialtype" style="width:80%">
                           		 <option value="">ALL</option>
	                            
									
						 		
	                        </select>
                       
                       </div>
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Height</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="height" class="form-control" style="width:50%">
                       
                       </div>
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Length</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="length" class="form-control" style="width:50%">
                       
                       </div>
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
                <label>Width</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="width" class="form-control" style="width:50%">
                       
                       </div>
                     </div>  
                     
               
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6">
               <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Storage Icon</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
              
              
              
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
                       <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                
                       
                       </div>
                     </div>  
               
               <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Manufacturer</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="manufacturer" class="form-control">
                       
                       </div>
                       <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                       </div>
                     </div>  
               
               <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">No of Levels</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="nooflevels" class="form-control" style="width:50%">
                       
                       </div>
                       <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                       </div>
                     </div>  
               
               <div class="col-lg1-12 col-lg-12">
              
              <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                <label style="white-space: nowrap;">Level Partitions</label>
                       
                       </div>
                       
                       <div class="col-lg1-6 col-lg-6" style="text-align: right;margin-bottom:10px">
               <input type="text" id="levelofPartions" class="form-control" style="width:50%">
                       
                       </div>
                       <div class="col-lg1-3 col-lg-3" style="text-align: right;margin-bottom:10px">
                       </div>
                     </div>  
               
                       
                       </div>
                     </div> 
                     
                   <div class="col-lg1-12 col-lg-12" style="margin-bottom: 5px">
                   
                   <input type="text"  class="form-control searchItems" id="searchItems"    style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
				<div class="services">
		 			<div class="items">
		  				<ul class="matchedStringUl StorageMasterWarehouse" style=""></ul>
					</div>
				</div>
                <span id="searchItemsError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                   
                   
                   </div>
                   <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;min-height: 250px;">
                   <table id="packagingList" class="table table-bordered table-striped" style="   margin-top: 1px !important;margin-left: 0px;border-collapse: separate; border-spacing: 14px 1px;border:none">
                      <thead style="background-color: #41b9fe !important; color: white">
                       <tr>
                       <th style="text-align:left;padding: 5px !important">S No</th>
                       <th style="text-align:left;padding: 5px !important">SKU ID</th>
                       <th style="text-align:left;padding: 5px !important">SKU Description</th>
                        <th style="text-align:left;padding: 5px !important">Level</th>
                       <th style="text-align:left;padding: 5px !important">Capacity</th>
                       <th style="text-align:left;padding: 5px !important">Comments</th>
                      
                       </tr>
                       </thead>
                       
                       <tbody>
                       <tr>
                       <td></td>
                        <td></td>
                         <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                       </tr>
                       </tbody>
                       </table>
                       </div>
                     
                     
                      <div class="col-lg1-12 col-lg-12">
                      
                      <input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="validateStorageSystemMaster('new')" style="margin-left:35%;width: 80px;" value="Submit" />
				<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:14%;width: 80px;" onclick="" value="Cancel" />
							
                      
                      </div>
                     
                      </div>
                      
                     
                      
                      
                      
                      
                      </div>
                     </div>
              
              </div>    
              </div>
              

</section>
 




</body>
</html>