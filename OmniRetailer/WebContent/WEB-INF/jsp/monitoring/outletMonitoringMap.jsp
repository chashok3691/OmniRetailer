<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${pageContext.request.contextPath}/js/monitoring/outletTrackingMap.js"></script>
<script>


//var currentGpslongitude = "";


</script>
<!-- <script src="http://maps.google.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8"></script> -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKsmG81ZDYxkAJHU1Xc2Pyh3ohhpofNX8&callback=myMap"></script>
 --><script  async defer src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=myMap"></script>

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


<div class = "col-lg-10" id="map"  style="height:610px;">
 
</div>

<div class = "col-lg-2"  style="height:610px;overflow-y:  auto;background-color:#2d3b41;    text-align: center;    padding: 0px;">



 <c:forEach var="outlet" items="${outletSettings}" varStatus = "count">
  <div class = "col-lg-12 gps enable${count.index} " onclick="myMap(${count.index})" style=" border-bottom-width: 1px;   border-bottom-style: ridge;
    border-bottom-color: white; color: white; cursor:pointer ;	padding-top: 5px;
	padding-bottom: 5px;">
${outlet.location}

 </div>
 	

  

 
 	<input type="hidden" class ="gpsLatitude" value= '${outlet.gpsLatitude}' />
 	<input type="hidden" class ="gpsLongitude" value= '${outlet.gpsLongitude}' />
 	<input type="hidden" class ="location" value= '${outlet.location}' />
 	 <input type="hidden" class ="outletType" value= '${outlet.outletType}' />
 	 <input type="hidden" class ="email" value= '${outlet.email}' />
 	  <input type="hidden" class ="locality" value= '${outlet.locality}' />
<%--  	   <input type="hidden" class ="street" value= '${outlet.street}' /> --%>
 	   <input type="hidden" class ="phone" value= '${outlet.phone}' />
 	   <input type="hidden" class ="zoneId" value= '${outlet.zoneId}' />
 	 <input type="hidden" class ="storeName" value= '${outlet.storeName}' />
 	<input type="hidden" class ="activeStatus" value= '${outlet.activeStatus}' />
 	
 	
 </c:forEach>
 </div>
 
 
 <div class="box box-primary mapPopDiv" id="mapPopup" >
 </div>

 <div class="modal fade" id="mapModal" role="dialog" 
 style=" 
    top: -249px !important;
    right: -693px !important;
    bottom: -227px !important;
    left: -17px !important;">
    
    
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          <p></p>
        </div>
<!--         <div class="modal-footer"> -->
<!--           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--         </div> -->
      </div>
    </div>
  </div>

</body>
</html>