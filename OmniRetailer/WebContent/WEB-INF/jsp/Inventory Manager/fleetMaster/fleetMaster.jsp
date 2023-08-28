<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fleet Master</title>
 <script  async defer src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=myMap"></script>


<script>
function myMap() {
var mapProp= {
  center:new google.maps.LatLng(17.387140,78.491684),
  zoom:5,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>

<style>
.gps:hover {
	background-color: black;
	padding-top: 5px;
	padding-bottom: 5px;
}

.activeMapSel{
 	 background-color:GREY;
  
}
.modal-backdrop {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: #000;
}
.modal-backdrop.in {
    filter: alpha(opacity=50);
    opacity: 0 !important;
}
.mapPopDiv
{
    float: right;
    z-index: 100;
    position: absolute;
    right: 15%;
    top: 50px;
    width: 18%;
    padding: 15px;
    display:none;
}

.divClose
{
    width: 24px;
    height: 24px;
    cursor: pointer;
    float: right;
    z-index: 100;
    position: absolute;
        right: -6%;
    top: -30%;
}

</style>

</head>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
      
      
               <h3  class="box-title" style="border:1px solid #3d3838;;font-weight: bold;width:20%;padding:5px">Fleet Master</h3>
           </div>
		
		<div class="box-body table-responsive">
          <div class="row">
              <div class="col-lg1-12 col-lg-12" style="margin-top:5%">
              
              <div class="col-lg1-3 col-lg-3" >
               <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Vehicle No</label>
                       
               <input type="text" id="Storageid" class="form-control" style="width:75%">
                       
                     </div>  
                     <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Vehicle Description</label>
                       
               <input type="text" id="storagename" class="form-control">
                       
                       </div>
                     
                     <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Date of Purchase</label>
                       
               <input type="text" id="storagename" class="form-control" style="width:60%">
                       
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Outlet/Warehouse</label>
                       
               <select class="form-control" id="materialtype" style="width:60%">
                           		 <option value="">ALL</option>
	                            
									<option value="1" >1</option>
									<option value="2" >2</option>
						 		
	                        </select>
                       
                     </div>  
                     
                    
                     </div>  
                     
               
                       
                      
                       
                           <div class="col-lg1-3 col-lg-3" >
               <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Vehicle Type</label>
                       
               <input type="text" id="Storageid" class="form-control" style="width:75%">
                       
                       
                     </div>  
                     <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Carry Capacity</label>
                       
               <input type="text" id="storagename" class="form-control" style="width:75%">
                       
                      
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
                <label>Vehicle Owner/Driver</label>
                       
                <input type="text" id="storagename" class="form-control" style="width:75%">
                     </div>  
                     
                     <div class="col-lg1-12 col-lg-12" style="    margin-bottom: 10px;">
              
              
                <label>Status</label>
                       
               <select class="form-control" id="materialtype" style="width:75%">
                           		 <option value="">ALL</option>
	                            
									<option value="1" >1</option>
									<option value="2" >2</option>
						 		
	                        </select>
                       
                       
                     </div>  
                     
                    
                     </div>  
                     
               
                       
                      
            
                       <div class="col-lg1-6 col-lg-6" id="googleMap" style="height:250px;">
              
                       
                       </div>
                     </div> 
                     <div class="col-lg1-12 col-lg-12" style="margin-bottom:5%">
                     <div class="col-lg1-3 col-lg-3">
                      
                      <input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="" style="margin-left:7%;width: 150px;background-color: #41b9fe !important;;font-weight: bold;padding: 8px;" value="Submit" />
                      
                      </div>
                      <div class="col-lg1-3 col-lg-3">
				<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:8%;width: 150px;background-color: #41b9fe !important;font-weight: bold;padding: 8px;" onclick="" value="Cancel" />
							
                      
                      </div>
                     
                     
                     </div>
                     
                   
                     <table id="example1" class="table table-bordered table-striped" style="margin-left: 0px;border-collapse: separate; border-spacing: 14px 1px;min-height: 300px; max-height: 500px;overflow: auto;border:none">
                      <thead style="background-color: #41b9fe !important;color: white !important;">
                       <tr>
                       <th style="text-align:left;padding: 5px !important"><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${currency.countryName}' /></th>
                       <th style="text-align:left;padding: 5px !important">S No</th>
                       <th style="text-align:left;padding: 5px !important">Vehicle No</th>
                       <th style="text-align:left;padding: 5px !important">Description</th>
                        <th style="text-align:left;padding: 5px !important">Vehicle Type</th>
                       <th style="text-align:left;padding: 5px !important">Carry Capacity</th>
                       <th style="text-align:left;padding: 5px !important">Status</th>
                       <th style="text-align:left;padding: 5px !important">Action
                       </th>
                      
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
                          <td></td>
                          <td></td>
                       </tr>
                       </tbody>
                       </table>
                     
                     
                      
                     
                      </div>
                      
                     
                      
                      
                      
                      
                      </div>
                     </div>
              
              </div>    
              </div>
              

</section>
 




</body>

</html>