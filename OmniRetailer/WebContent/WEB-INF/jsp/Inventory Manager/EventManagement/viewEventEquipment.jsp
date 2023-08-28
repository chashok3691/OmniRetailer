<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/packagingandprocessing/packagingandprocessingsummary.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
</head>
<style>
.allignment{
   /*   width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}

a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
   /*  height: 24px; */
    padding: 0px 6px;
    margin-bottom:4px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	for(var i = 1; i<11;i++){
		callCalender('EventstartEquipment'+i);	
	}
	
	 var dateTime = getCurrentDate();
 	  var date = dateTime.split(' ');
 	  date = date[0].split('/');
 	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
	 var noOfDaysend = daydiff(parseDate($('#EventEnd').val()), parseDate(formatedDate));
	 
	if($("#statusoftheevents").val() !="Approved" || noOfDaysstart < -1 || noOfDaysend > 0 ){
		$("#eventequipmenteditable").css("pointer-events","none");
		
		for(var i = 1; i<11;i++){
			$("#submitEventEquipment"+i).css("display","none");
			}
	}
	
	for(var i = 1; i<11;i++){
	  if($("#EventEquipment"+i+" tr").length == 1 ){   
		 $("#equipmentprint"+i).css("display","none");
	 } 
	}  
	 
		
	  if(parseFloat($("#lengthofMenu").val()) == 0 ){
		  for(var i = 1; i<11;i++){
			 $("#ErrorEquipment"+i).html("Please Add Atleast One Item to Menu First ");
				$("#eventequipmenteditable").css("pointer-events","none");
		  }	 
	  }
	 
	  
	  debugger;
		 
		 var length  = $("#lengthofMenu").val();
		 var lengthofEquval  = parseInt($("#lengthofEqu").val());
	  
		 for(var i = 1; i<11;i++){
 if($("#EventEquipment"+i+" tr").length != 1 || parseFloat(length) == 0){
		 $("#searchEquipment"+i).css("pointer-events","none");
		 $("#EventEquipment"+i).css("pointer-events","none");
		 $("#submitEventEquipment"+i).css("display","none");
		 $("#deleteEqp"+i).css("pointer-events","none");
		 
 		}	 
	 }

	
 
 	var pageno = $("#SubmittionCountEquippage").val();
 	if(pageno == ""){
	   pageno = 1; 
 	}
 
	 $("#eqip"+pageno).trigger('click');	
	 
	 
	 
	
		});
</script>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Equipment Issue
		</h3>
		
		
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive"  id="eventequipmenteditable" style="pointer-events:none">
         <div class="row">
         
         
         <c:forEach var="equPageCount" items="${eventMastersList.array}">
         
           <c:if test="${equPageCount == 1}">
          <div class="row" style="padding: 15px;;padding-top: 0px;padding-bottom:0px">         
          </c:if>
           <c:if test="${equPageCount != 1}">
          <div class="row" style="padding: 15px;;padding-top: 0px;padding-bottom:0px;">         
          </c:if>
         
    <div class="row eventEquipmentList" id="EquipmentmulSubmition${equPageCount}" style="padding: 15px;"> 
    
    
    
     <div id="ErrorEquipment${equPageCount}" style="text-align:center;color:red;font-weight:bold;">${errEquipment}</div>
     <div id="SuccessEquipment${equPageCount}" style="text-align:center;color:blue;font-weight:bold;">${successEquipment}</div>
         
         <div class="col-lg-12">
  <div class="col-lg-4"></div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control"   value="${eventRef}" placeholder="Event ref" id="eventrefEquipment" readonly="readonly"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                       <input type="text" class="form-control" disabled="disabled" id="dpid" value="${eventMastersList.outletStoreLocation }"/>
                       
                     <%--  <select class="form-control" id="outletEquipment" disabled="disabled">
							<c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>	                           
	                        </select> --%>
                         </div>
             </div>
             </div>
             
                 
             <c:set var = "feqtab" scope = "session" value = "1"/>
             <%-- <c:set var = "seqtab" scope = "session" value = "1"/>
             <c:set var = "teqtab" scope = "session" value = "1"/>
             <c:set var = "feqttab" scope = "session" value = "1"/> --%>
             
             
             
             
     
             
             <div class="col-lg-12">
  <div class="col-lg-4" style="padding-left:0px">
  <div class="col-lg-6" style="padding-left:0px">
  <label><spring:message code="customer.newfeedback.emptyspace"/></label>
  
  							<c:set var = "dateunique" scope = "session" value = "1"/>
     		                <c:set var = "dateuniqueforempty" scope = "session" value = "1"/>
                      		<c:forEach var="equipments" items="${eventMastersList.eventEquipmentDetails}"  varStatus="theCount">
                       
                       <c:if test="${equipments.submissionCount == equPageCount && dateunique == 1 }">
                           <c:set var = "dateunique" scope = "session" value = "${dateunique+1}"/>
                           	<c:set var = "dateuniqueforempty" scope = "session" value = "${dateuniqueforempty+1}"/>
                       
                       <input class="form-control" readonly="readonly"
											style="background-color: white;" name="EventstartEquipment${equPageCount}"
											id="EventstartEquipment${equPageCount}" size="20" type="text"
											
											onfocus="callCalender('EventstartEquipment${equPageCount}')"
											onclick="callCalender('EventstartEquipment${equPageCount}')" placeholder="DD/MM/YYYY" value="${equipments.createDateStr}" />
                          					</c:if>
                          </c:forEach>
                          
                          <c:if test="${dateuniqueforempty == 1}">
                          <c:set var = "dateuniqueforempty" scope = "session" value = "${dateuniqueforempty+1}"/>
                          <input class="form-control" readonly="readonly"
											style="background-color: white;" name="EventstartEquipment${equPageCount}"
											id="EventstartEquipment${equPageCount}" size="20" type="text"
											
											onfocus="callCalender('EventstartEquipment${equPageCount}')"
											onclick="callCalender('EventstartEquipment${equPageCount}')" placeholder="DD/MM/YYYY" value="${equipments.createDateStr}" />
                          </c:if>
                          
                         </div>
                         <input type="hidden" id="EventstartEquipment${equPageCount}${equPageCount}" >
                         
  
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
            
             </div>
             </div>
             
             
              <div class="col-lg-12" >
                       
				                      <div class="col-lg-11 col-xs-11" style="margin-top:10px;padding-left: 0px">
                      	 
                   
                    <input type="text" class="form-control"  id="searchEquipment${equPageCount}"  onkeyup="EquipmentMulSearch('${equPageCount}')" placeholder="Search Equipment" style="height:30PX;margin-bottom: 0px;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;">
                   
                   <div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl eventEquipment${equPageCount}" style=""></ul>
						   					</div>
										</div>
                    </div>
				                      
                   
                  
                 
								            <div class="col-lg-1" style="padding: 0px;margin-top:10px">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="deleteAllEquipment('${equPageCount}');" value="Delete All" id="deleteEqp${equPageCount}">
								</div> 
		                    
                  
                    </div> 
         <div class="col-lg-12">
          <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="EventEquipment${equPageCount}" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	                <th><spring:message code="s.no.label" /></th>
                                                <th style="width:35%">Equipment ID</th>
                                                <th style="width:35%">Description</th>
                                                <th>Qty</th>
                                                <th style="width:15%">Action</th>

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="equipments" items="${eventMastersList.eventEquipmentDetails}"  varStatus="theCount">
                         	<c:if test="${equipments.submissionCount == equPageCount}">
                         	 <tr id="dynamicdiv${feqtab}" class="dynamicdiv${feqtab}${equPageCount}">
                         	 	<td class="slnoEquipment${equPageCount}" id="itemno${feqtab}">${feqtab}</td>
                         	 	<td id="EqipID${equPageCount}${feqtab}">${equipments.equipmentId}</td>
                             	<td id="descEqip${equPageCount}${feqtab}">${equipments.equipmentName}</td>
                             	<td id="qtyEqip${equPageCount}${feqtab}" contenteditable="true">${equipments.equipmentQuantity}</td>
                             	<td id="Del${equPageCount}${feqtab}"><img id="Img${feqtab}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItemEquipment(this,'${equPageCount}');" title="Delete ${equipments.equipmentId}"/></td>
                             </tr>
                             <c:set var = "feqtab" scope = "session" value = "${feqtab+1}"/>
                             
                             <input type="hidden" id="dateforEquipment${equPageCount}" value="${equipments.createDateStr}">
                             <%-- <c:set var = "feqtab1" scope = "session" value = "${equipments.createDateStr}"/> --%>
                             </c:if>
                            </c:forEach>
                            
                         </tbody>
                     </table>
                    </div>
  
         
         
         </div>
          <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
                   
							 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" id="equipmentprint${equPageCount}" onclick="PrintEventDetails('${eventRef}','${eventMastersList.eventStatus}','edit','Equipmemt');" value="Print" /> 
 													 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
						</div>  
         
         </div>
         </c:forEach>
         </div>
         
         
         
         
         </div>
      
  
                   
  
  
  <div class="row" style="margin-left: 15px;pointer-events:all">
  
 <c:forEach var="equPageCount" items="${eventMastersList.array}">
   <c:if test="${equPageCount <= 4}">
<div class="col-lg-4 numberCircle activeBlock" id="${equPageCount}Eqip" style="background:#ccc;"><a style="color:white;" id="eqip${equPageCount}" onclick="appendEventEquipment('${equPageCount}');">${equPageCount}</a></div>
</c:if>
 <c:if test="${equPageCount > 4}">
 <c:if test="${equPageCount == 5}">
 <a onclick="loadmoreEqip()" id="loadmoreEqu" style="color: #099ff7;  max-height: fit-content;padding-top: 2px;cursor:pointer;">Show more..</a>
 </c:if>
 
<div class="col-lg-4 numberCircle activeBlock" id="${equPageCount}Eqip" style="background:#ccc;display: none;"><a style="color:white;" id="eqip${equPageCount}" onclick="appendEventEquipment('${equPageCount}');">${equPageCount}</a></div>
<c:if test="${equPageCount == 10}">
 <a onclick="loadlessEqip()" id="loadlessEqu" style="color: #099ff7;display: none; max-height: fit-content;padding-top: 2px;cursor:pointer;">Show less..</a>
 </c:if>

</c:if>
</c:forEach>

 </div>
						
						
						  
                    </div>
                     </div>
                     
                     
                     
                     
                    


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
             
              	


  
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
           
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
        
         <input type="hidden" id="SubmittionCountEquip" value="1"/>
         <input type="hidden" id="SubmittionCountEquippage" value="${SubmittionCountvalEquip}"/>
</body>
</html>