 <!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/complaintsAndFeedback/CustomerComplaints.jsp
 * file type		        : JSP
 * description				: The CustomerComplaints form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/crm/customer.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 7px 5px 7px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

</style>     
<script type="text/javascript">
$(document).ready(function(){

	  
	/* $("#searchCustomers").val($("#customersSearch").val());
	$("#searchCustomers").focus();
	$('#searchCustomers').on('input',function(e){
		if($(this).val().trim()==""){
			getCustomers('0');
		}
	});

	$('#mySearch').click(function(){
	    var search = $('#searchCustomers').val();
	    return getCustomers('0');
	})
	$('#searchCustomers').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }
	}); */
	
	
	$("#searchCustomers").val($("#searchname").val());
	$("#searchCustomers").focus();  
$('#searchCustomers').on('input',function(e){
	if($(this).val().trim()==""){
		viewCustomerOTP('customerOTP','0','menu');
	}
});


 $('#mySearch').click(function(){
        var search = $('#searchCustomers').val();
       
        return viewCustomerOTP('customerOTP','0','menu');
    });
    $('#searchCustomers').keypress(function(e){
    
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });	
	
	
});
</script>  
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
       <div class="box-header" style="text-align:center;">
           <h3 class="box-title">Customer OTP</h3>
       </div><!-- /.box-header -->
      
       <div class="box-body table-responsive">
   					<div class="row">
				        <div class="col-lg-3">
			              
			            
			                  <label><spring:message code="location.label"/></label>
			                 <select class="form-control form-group" id="toLocation">
 		                           <option value=""><spring:message code="ALL.label"/></option> 
 		                           
		                             <c:forEach var="location" items="${workLocationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
								
							       <%--  <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
							      --%>
								 </c:forEach>
                                        </select>
                                        
	
				        </div>
				        <div class="col-lg-4"></div>
				        <div class="col-lg-4"></div>
				        
					          
				           <div class="col-lg-1" style="margin-top:16px">
				                <input type="button" style="padding: 4px 8px;float: right;" class="btn bg-olive btn-inline" onclick="viewCustomerOTP('customerOTP','0','menu');" value="<spring:message code="search" />" />
				           </div>
				</div>
				<div class="row">
			   
		            <div class="col-lg-1 col-xs-1" style="margin-top: 10px;">
               <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewCustomerOTP('customerOTP','0','menu');">
              		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
              		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
              		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
             		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
              	</select>
          </div>
		     
		       	 	
		       	 	<%-- <div class="col-lg-11 col-xs-11" style="margin-left:-12px; margin-top:10px">
                    
                      <div class="wrapper">	 
                     	<input type="text"  class="form-control " value="" id="searchCustomers" placeholder="<spring:message code="search.customers.label" />"   />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
					<input type="hidden" id="customersSearch" value="${searchName}">
                    </div> --%>
		       	 	
		       	 	<div class="col-lg-11 col-xs-11" style="margin-left:-12px; margin-top:10px">
                           <div class="wrapper">	 
                               <input type="text"  class="form-control" style="" value="${searchName}" id="searchCustomers" placeholder="<spring:message code="search.customers.label" />"   />
							   <button id="mySearch" class="searchbutton"></button>
							</div>
						 <input type="hidden" id="searchname" value="${searchName}">
                    </div>
		       	 	
		       	 	
		       	 	
		       	 	</div>
			              
            <table id="example1" class="table table-bordered table-striped">
           <thead style="background-color: #3c8dbc; color: #ffffff">
               <tr>
                   <th><div ><spring:message code="s.no.label" /></div></th>
                   <th><spring:message code="name.label" /></th>
                   <th><div ><spring:message code="contact.number.label" /></div></th>
                   <th> OTP</th>
               </tr>
           </thead>
           
           <tbody style="text-align: center;">
            <c:forEach var="customerDetails" items="${customerDetailsList}" varStatus="theCount">
             <tr>
                 <td>${customerDetails.slNo}</td>
                 <td>${customerDetails.name}</td>
                 <td>${customerDetails.primaryContactNumber}</td>
                 <td>${customerDetails.otpCode}</td>
			</tr>
            </c:forEach>
           </tbody>
       </table>
                                    
                         
                           
               <div class="row">
              
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;"> 
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerOTP('customerOTP','${totalValue}','menu');">
              	</div>									
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">  
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerOTP('customerOTP','${index - (maxRecords + 1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			
              			 <c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if> 
              	</c:if>
              	
              	
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;"> 
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerOTP('customerOTP','${index - (maxRecords + 1)}','menu');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerOTP('customerOTP','${totalValue}','menu');">
              	</div> 
              	</c:if>
              	
              </div>
           </div>
           </div><!-- /.box-body -->
       </div><!-- /.box -->
  
</div>
</section><!-- /.content -->
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
		<!-- DATA TABES SCRIPT -->
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
               // $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
       
         <input type="hidden" id="err" value="${err}" />
         
</body>
</html> 






























