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
	callCalender('DateEmp'+i);	
	}
	
	 var dateTime = getCurrentDate();
 	  var date = dateTime.split(' ');
 	  date = date[0].split('/');
 	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
	 var noOfDaysend = daydiff(parseDate($('#EventEnd').val()), parseDate(formatedDate));


	
	if($("#statusoftheevents").val() !="Approved" || noOfDaysstart < -1 || noOfDaysend > 0 ){
		$("#eventmanpowereditable").css("pointer-events","none");
		for(var i = 1; i<11;i++){
		$("#submitEventManpower"+i).css("display","none");
		
		}
		
	}
	
	  if(parseFloat($("#lengthofMenu").val()) == 0 ){
			for(var i = 1; i<11;i++){
			 $("#ErrorEmp"+i).html("Please Add Atleast One Item to Menu First ");
				$("#eventmanpowereditable").css("pointer-events","none");
			}
				
	  }
	
		for(var i = 1; i<11;i++){
	 if($("#eventManpower"+i+" tr").length == 1 ){   
		 $("#manpowerprint"+i).css("display","none");
		 
	 }
		}
	
		debugger;
	 
	 var length  = $("#lengthofMenu").val();
	 var lengthofManpwrval  = parseInt($("#lengthofInv").val());
	 
	 
	 for(var i = 1; i<11;i++){
	 if($("#eventManpower"+i+" tr").length != 1 || parseFloat(length) == 0 ){
		 
		 $("#searchManpower"+i).css("pointer-events","none");
		 $("#eventManpower"+i).css("pointer-events","none");
		 $("#submitEventManpower"+i).css("display","none");
		 $("#deleteEmp"+i).css("pointer-events","none");
		 
	 }
	 }
	
	 
	   var pageno = $("#SubmittionCountEmppage").val();
	   if(pageno == ""){
		   pageno = 1; 
	   }
	   
		 $("#emp"+pageno).trigger('click');	
	
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
			Man/Woman Power
		</h3>
		
		 
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive" id="eventmanpowereditable">
             <div class="row">
             
             <c:forEach var="manpowerPageCount" items="${eventMastersList.array}">
         
           <c:if test="${manpowerPageCount == 1}">
          <div class="row" style="padding: 15px;;padding-top: 0px;padding-bottom:0px">         
          </c:if>
           <c:if test="${manpowerPageCount != 1}">
          <div class="row" style="padding: 15px;;padding-top: 0px;padding-bottom:0px;">         
          </c:if>
             
                <%--  <div id="ErrorEmp1" style="text-align:center;color:red;font-weight:bold;">${errManpower}</div>
           <div id="SuccessEmp1" style="text-align:center;color:blue;font-weight:bold;">${successManpower}</div> --%>
                 
                 
            <div class="row" style="padding: 15px;padding-top: 0px;padding-bottom:0px">         
    <div class="row eventManpowerList" id="manPowermulSubmition${manpowerPageCount}" style="padding: 15px">  
        <div id="ErrorEmp${manpowerPageCount}" style="text-align:center;color:red;font-weight:bold;">${errManpower}</div>
           <div id="SuccessEmp${manpowerPageCount}" style="text-align:center;color:blue;font-weight:bold;">${successManpower}</div>   
             <div class="col-lg-12">
  <div class="col-lg-4">
  
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label>Event ID</label>
                       <input type="text" class="form-control"   value="${eventRef}" id="eventrefEmp" placeholder="Event Referance" readonly="readonly"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
                     <label>DPID</label>
                      <select class="form-control" id="outletEmp" disabled="disabled">
<c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>	                        </select>
                         </div>
             </div>
             </div>
             
             
             <c:set var = "fmanpowertab" scope = "session" value = "1"/>
              <c:set var = "smanpowertab" scope = "session" value = "1"/>
             <c:set var = "tmanpowertab" scope = "session" value = "1"/>
             <c:set var = "ftmanpowertab" scope = "session" value = "1"/>
             
         
             
     
             
              <div class="col-lg-12">
  <div class="col-lg-4" style="padding:0px">
  <div class="col-lg-6" style="padding-left:0px">
  <label><spring:message code="customer.newfeedback.emptyspace"/></label>
  <c:set var = "dateunique" scope = "session" value = "1"/>
     		                <c:set var = "dateuniqueforempty" scope = "session" value = "1"/>
                            <c:forEach var="manpower" items="${eventMastersManpower}"  varStatus="theCount">
                             <c:if test="${manpower.submissionCount == manpowerPageCount && dateunique == 1 }">
                           <c:set var = "dateunique" scope = "session" value = "${dateunique+1}"/>
                           	<c:set var = "dateuniqueforempty" scope = "session" value = "${dateuniqueforempty+1}"/>
                       <input class="form-control" readonly="readonly"
											style="background-color: white;" name="DateEmp${manpowerPageCount}"
											id="DateEmp${manpowerPageCount}" size="20" type="text"
											
											onfocus="callCalender('DateEmp${manpowerPageCount}')"
											onclick="callCalender('DateEmp${manpowerPageCount}')" placeholder="DD/MM/YYYY"  value="${manpower.createdDateStr}"/>
                          </c:if>
                          </c:forEach>
                          <c:if test="${dateuniqueforempty == 1}">
                           <c:set var = "dateuniqueforempty" scope = "session" value = "${dateuniqueforempty+1}"/>
                            <input class="form-control" readonly="readonly"
											style="background-color: white;" name="DateEmp${manpowerPageCount}"
											id="DateEmp${manpowerPageCount}" size="20" type="text"
											
											onfocus="callCalender('DateEmp${manpowerPageCount}')"
											onclick="callCalender('DateEmp${manpowerPageCount}')" placeholder="DD/MM/YYYY"  value="${manpower.createdDateStr}"/>
							</c:if>	
                         </div>
                                        <input type="hidden" id="DateEmp${manpowerPageCount}${manpowerPageCount}" value="">
  
  </div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             
             </div>
             
             
             
           <div class="col-lg-12" style="padding:0px">
                       
				                      <div class="col-lg-11 col-xs-11" style="margin-top:10px;padding-left: 0px">
                      	 
                   
                    <input type="text" class="form-control " value="" id="searchManpower${manpowerPageCount}"  onkeyup="ManpowerMulSearch('${manpowerPageCount}');" placeholder="Search Man power" style="height:30PX;margin-bottom: 0px;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;">
                   
                     <div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl eventmanPower${manpowerPageCount}" style=""></ul>
						   					</div>
										</div>
                    </div>
				                      
                   
                  
                 
								            <div class="col-lg-1" style="padding: 0px;margin-top:10px">
		  				             <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="deleteAllManpower('${manpowerPageCount}');" value="Delete All" id="deleteEmp${manpowerPageCount}">
								</div> 
		              
                    </div>
  
  <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap; ">
                   
                     <table id="eventManpower${manpowerPageCount}" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	                <th><spring:message code="s.no.label" /></th>
                             	                <th><spring:message code="emp.id.label" /></th>
                                                <th><spring:message code="Delivery_Person.Name" /></th>
                                                <th style="width: 32%;"><spring:message code="role.label" /></th>
                                                <th style="width: 15%;">DOJ</th>
                                                <th><spring:message code="EmployeeForm.location" /></th>
                                                <th><spring:message code="contact.no.label" /></th>
                                                <th>Action</th>
                                               

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                             <c:forEach var="manpower" items="${eventMastersManpower}"  varStatus="theCount">
                             <c:if test="${manpower.submissionCount == manpowerPageCount}">
                         	 <tr id="dynamicdiv${fmanpowertab}" class="dynamicdiv${fmanpowertab}${manpowerPageCount}">
                         	 	<td class="slnomanPower${manpowerPageCount}" id="itemno${fmanpowertab}">${fmanpowertab}</td>
                         	 	<td id="empID${manpowerPageCount}${fmanpowertab}">${manpower.employeeId}</td>
                             	<td id="empName${manpowerPageCount}${fmanpowertab}">${manpower.employeeName}</td>
                             	<td id="empRole${manpowerPageCount}${fmanpowertab}">${manpower.employeeRole}</td>
                             	<td id="empDOJ${manpowerPageCount}${fmanpowertab}">${manpower.dateOfJoiningStr}</td>
                             	<input type="hidden" id="empEmail${manpowerPageCount}${fmanpowertab}" value="${manpower.employerEmail}">
                             	<td id="empLocation${manpowerPageCount}${fmanpowertab}">${manpower.storeLocation}</td>
                             	 <td id="empphone${manpowerPageCount}${fmanpowertab}">${manpower.employerContactNumber}</td>
                             	<td id="Del${fmanpowertab}${manpowerPageCount}"><img id="Img${fmanpowertab}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:20%;cursor:pointer;" onclick="deleteItemManpower(this,'${manpowerPageCount}');" title="Delete ${manpower.employeeId}"/></td>
                             	 <c:set var = "fmanpowertab" scope = "session" value = "${fmanpowertab+1}"/>
                             	 <c:set var = "fmanpowertab1" scope = "session" value = "${manpower.createdDateStr}"/>
                            
                             </tr>
                             </c:if>
                            </c:forEach>
                           
                         </tbody>
                     </table>
                    </div>
  
  
  
  </div>
  
   <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
                    
                                          <c:if test="${not empty eventMastersList.userActivitiesForManPower}">
                    
							<input type="button" class="btnCls" style="padding: 4px 12px; !important" id="submitEventManpower${manpowerPageCount}" onclick="createEventManpower('edit','${manpowerPageCount}');" value="<spring:message code="submit.label" />" />
   </c:if>
								
<%-- 								<input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" id="manpowerprint${manpowerPageCount}" onclick="PrintEventDetails('${eventRef}','${eventMastersList.eventStatus}','edit','');" value="Print" /> 
 --%>								
							 <input type="button" class="btnCls" style="padding: 4px 12px; !important;pointer-events:all;cursor:pointer" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
						</div>  
  
  </div>
  </div>
  </c:forEach>
  
    
  
  
  
  </div>
  
  
                   
						
						
		  <div class="row" style="margin-left: 15px;pointer-events:all">
  
 <c:forEach var="manpowerPageCount" items="${eventMastersList.array}">
   <c:if test="${manpowerPageCount <= 4}">
<div class="col-lg-4 numberCircle activeBlock" id="${manpowerPageCount}Emp" style="background:#ccc;"><a style="color:white;" id="emp${manpowerPageCount}" onclick="appendEventManpower('${manpowerPageCount}');">${manpowerPageCount}</a></div>
</c:if>
 <c:if test="${manpowerPageCount > 4}">
 <c:if test="${manpowerPageCount == 5}">
 <a onclick="loadmoreEmp()" id="loadmores" style="color: #099ff7;  max-height: fit-content;padding-top: 2px;cursor:pointer;">Show more..</a>
 </c:if>
 
<div class="col-lg-4 numberCircle activeBlock" id="${manpowerPageCount}Emp" style="background:#ccc;display: none;"><a style="color:white;" id="emp${manpowerPageCount}" onclick="appendEventManpower('${manpowerPageCount}');">${manpowerPageCount}</a></div>
<c:if test="${manpowerPageCount == 10}">
 <a onclick="loadlessEmp()" id="loadlesss" style="color: #099ff7;display: none; max-height: fit-content;padding-top: 2px;cursor:pointer;">Show less..</a>
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
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
           
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
        <input type="hidden" id="SubmittionCountEmp" value="1"/>
         <input type="hidden" id="SubmittionCountEmppage" value="${SubmittionCountvalEmp}"/>
</body>
</html>