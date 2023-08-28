<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Soumya Vatte
 * file name		        : CRM/complaintsAndFeedback/viewFeedback.jsp
 * file type		        : JSP
 * description				: The CustomerFeedback form is displayed using this jsp
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
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/customerFeedback.js"></script>



        
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
.form-group{
	margin-bottom: 5px;	
}
.fa-star {
    font-size: 18px;
    display: block;
    color: #FFA500;
    padding: 0px 0px;
}
a:hover
{
	color:#45372D;
	text-decoration: none !important;
}
div.stars {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}
div.starss {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}

input.star { display: none; }
input.stars { display: none; }

label.star {
  float: right;
  padding: 3.25px;
  font-size: 20px;
  color: #FFA500;
  transition: all .2s;
  padding-top:0px;
  margin-left:5px;
}

label.stars {
  float: right;
  padding: 7.25px;
  font-size: 17px;
  color: #FFA500;
  transition: all .2s;
  padding-top:0px;
  margin-left:-14px;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FFA500;
  transition: all .25s;
}
input.stars:checked ~ label.stars:before {
  content: '\f005';
  color: #FFA500;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FFA500;
  /* text-shadow: 0 0 20px #952; */
}
input.stars-5:checked ~ label.star:before {
  color: #FFA500;
  /* text-shadow: 0 0 20px #952; */
}

input.star-1:checked ~ label.star:before { color: #FFA500; }
input.stars-1:checked ~ label.star:before { color: #FFA500; }

/* label.star:hover { transform: rotate(-15deg) scale(1.3); } */

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
label.stars:before {
  content: '\f006';
  font-family: FontAwesome;
}
.close {
    float: right;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    color: #45372D !important;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 1 !important;
}
.framestyle
{
	width: 90%;
    height: 250px;
    border: 1px solid #45372D;
    margin-left: 0%;
}
#map {
        height: 100%;
            position: initial !important;
    overflow: visible !important;
    transform: initial !important;
    background-color: rgb(229, 227, 223) !important;
        
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
/*       background-color: #fff;
    font-family: Roboto;
    font-size: 15px;
    font-weight: 300;
    margin-left: 0px;
    padding: 0 3px 0 9px;
    text-overflow: ellipsis;
    width: 100%;
    z-index: 999 !important;
    position: relative !important;
    border: 1px solid grey;
    margin-top: 0px;
    overflow: visible;
    border-radius: 3px;
    height: 32px !important;
    margin-bottom: 20px !important; */
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
      .gm-style{
      height: 137% !important;
      }

</style>     
<script type="text/javascript">

 
$(document).ready(function(){
	var customerName=$("#customerName").val();
	var index = customerName.lastIndexOf(" ");
	var firstname = customerName.substr(0, index);
	$("#firstName").val(firstname);
	var lastname = customerName.substr(index + 1);
	$("#lastName").val(lastname);
		  var dateTime = getCurrentDate();
		  var date = dateTime.split(' ');
		  date = date[0].split('/');
		  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
		  $('#date').val(formatedDate);
		  callCalender('date');
	var phoneNo = $("#mobileNo").val();
	phoneNo = phoneNo.split('-');

	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}

	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	
	/* var number=$("#customer_rating").val(); 
	var n=number.split('.');
	var num= n[0];
	
 if(num=="0"){
    	$('#stars_group').find('input:radio').prop('checked', false);
 }
else if(num == "1"){	 
	 $(".star-1").trigger("click");
}else if(num == "2"){
	$(".star-2").trigger("click");
}else if(num == "3"){
	$(".star-3").trigger("click");
}else if(num == "4"){
	$(".star-4").trigger("click");
}else if(num == "5"){
	$(".star-5").trigger("click");
} 	
 */
	
	$("#customerEmail").blur(function(){
		  var email = $("#customerEmail").val();
		  if(email==""){
			 return false;
		  }
		  if(!emailValidation(email)){
		   	$("#customerEmailError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
		  else{
			$("#customerEmailError").html("");
		    return true;
		  }
		});
 
 
	     
	    AverageRating();
	    summaryRating();
 
});
 
 function AverageRating(){ 
	 debugger;
	 
	 
	 var num =${feedbackObj.customer_rating}; 
	 
    if(num=="0"){
    	$('#starss_group').find('input:radio').prop('checked', false);
   }
    else if(num == "1"){	 
		 $(".stars-1").trigger("click");
	}else if(num == "2"){
		$(".stars-2").trigger("click");
	}else if(num == "3"){
		$(".stars-3").trigger("click");
	}else if(num == "4"){
		$(".stars-4").trigger("click");
	}else if(num == "5"){
		$(".stars-5").trigger("click");
	}	
   }
  
   
   
 function summaryRating(){ 
	 debugger;
	 
	 var num =${feedbackObj.avarageRating};
  
	 
    if(num=="0"){
    	$('#stars_group').find('input:radio').prop('checked', false);
   }
    else if(num == "1"){	 
		 $(".star-1").trigger("click");
	}else if(num == "2"){
		$(".star-2").trigger("click");
	}else if(num == "3"){
		$(".star-3").trigger("click");
	}else if(num == "4"){
		$(".star-4").trigger("click");
	}else if(num == "5"){
		$(".star-5").trigger("click");
	}	
 }
  
  


</script>      
</head>
<body  >
<!-- Content Header (Page header) -->
<!-- Main content -->

<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
  
                                <div class="box-header">
                              <center> <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;"><spring:message code="crm.customer.Feedback.label" /></h3></center>
                                </div><!-- /.box-header -->
                     <div class="box-body table-responsive">
                       <input type="hidden" id="type">
                             <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        				 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>

<br>
<br>
<br>

 <div class="row">
 <div class="col-lg-1"></div>
   <div class="form-group col-lg-3">
        	 <div class="row">
        	 <input type="hidden" id="feedbackId" value="${feedbackObj.feedback_id}">
        	<!--  <div class="col-lg-2"></div> -->
        	
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="customer.newfeedback.location" /> <span style="color:red; font-size:2"></span></label>
	        	 	<span style="color:red; font-size:2">*</span>
	                <input type="hidden"  id="location1"  value="${feedbackObj.storeLocation}" />
	                 <select class="form-control" id="location" style="padding3: 3px 4px;" >
	               		          <option value=""><spring:message code="ALL.label"/></option>
	               		         <c:forEach var="location" items="${locationsList}">
							          <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
	 					         </c:forEach>
	                   	 </select>
	                <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 <%--  <div class="col-lg-12">
	        	 	<label><spring:message code="customer.newfeedback.location" /> <span style="color:red; font-size:2"></span></label>
	                <input type="hidden"  id="location1"  value="${feedbackObj.storeLocation}" />
	                 <select class="form-control" id="location" style="padding: 3px 4px;" >
	               		          <option value=""><spring:message code="ALL.label"/></option>
	               		         <c:forEach var="location" items="${locationsList}">
							          <option value="${feedbackObj.storeLocation}" ${location == selectedLocation ? 'selected' : ''} id="${feedbackObj.storeLocation}" >${feedbackObj.storeLocation}</option>
	 					         </c:forEach>
	                   	 </select>
	                <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div> --%>
	              
        	 </div>
   </div>
    <div class="form-group col-lg-3"></div>
     <div class="form-group col-lg-4">
        	 <div class="row">
        	
        	 <div class="col-lg-5">
	        	 	<label><spring:message code="customer.newfeedback.date" /> <span style="color:red; font-size:2"></span></label>
	                <input class="form-control calendar_icon"  value="${feedbackObj.feedback_date}" style="background-color: white;" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY" readonly="readonly" >
	                <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             <div class="col-lg-7">
	        	 	<label><spring:message code="order_id.label" /> <span style="color:red; font-size:2"></span></label>
	                <input class="form-control"  value="${feedbackObj.order_ref}"  name="orderId" id="orderId" size="20" type="text" placeholder="order Id"  />
	                <span id="orderIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             
	             
        	 </div>
   </div>
   <div class="form-group col-lg-1"></div>
   </div>
   
   
   
    <div class="row">
     <div class="col-lg-1"></div>
   <div class="form-group col-lg-3">
        	 <div class="row">
        	
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="customer.newfeedback.channel" /> <span style="color:red; font-size:2"></span></label>
	                <input type="hidden" class="form-control" id="channel1"  value="${feedbackObj.feedbackChannel}"  />
	                <select class="form-control" name="FeedbackChannel" id="feedbackChannel" >
                                            <option value="Online" ${feedbackObj.feedbackChannel == 'Online' ? 'selected' : ''}>Online</option>
                                            <option value="Phone" ${feedbackObj.feedbackChannel == 'Phone' ? 'selected' : ''}>Phone</option>
                                            <option value="Sales Executive" ${feedbackObj.feedbackChannel == 'Sales Executive' ? 'selected' : ''}>Sales Executive</option>
                                            <option value="Direct" ${feedbackObj.feedbackChannel == 'Direct' ? 'selected' : ''}>Direct</option>
                                            </select>
	                <span id="channelError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             
        	 </div>
   </div>
   <div class="form-group col-lg-3"></div>
   <div class="form-group col-lg-4">
        	 <div class="row">
        	  <div class="col-lg-6">
	 <label><spring:message code="customer.newfeedback.emptyspace" /> <span style="color:red; font-size:2"></span></label>
	        
                    <input type="text" id="summaryFeedback"class="form-control" value="Summary Feedback" readonly="readonly" name="summaryFeedback"  size="20"     style="padding-right:16px" />
	             </div>
	             
	 <div class="col-lg-6">   
	 <label ><spring:message code="customer.newfeedback.emptyspace" /> <span style="color:red; font-size:2" ></span></label>
	      
	<div class="stars" id="stars_group"  > 
    <input class="star star-5" id="star-5" value="5" type="radio" name="star" />
    <label class="star star-5" for="star-5"></label>
    <input class="star star-4" id="star-4" value="4" type="radio" name="star" />
    <label class="star star-4" for="star-4"></label>
    <input class="star star-3" id="star-3" value="3" type="radio" name="star" />
    <label class="star star-3" for="star-3"></label>
    <input class="star star-2" id="star-2" value="2" type="radio" name="star" />
    <label class="star star-2" for="star-2"></label>
    <input class="star star-1" id="star-1" value="1" type="radio" name="star" />
    <label class="star star-1" for="star-1"></label>
    </div>
    </div>
	             
	             
	             
        	 </div>
   </div>
                    
   <div class="form-group col-lg-2"></div>                
    </div>    
    
    
    
    
    
    
    
        
                  
         <div class="row">
         <div class="col-lg-1"></div>
   			<div class="form-group col-lg-2">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="customer.newfeedback.customer" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="firstName"  placeholder="<spring:message code="customer.newfeedback.firstName" />"  />
	                <span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	              <input type="hidden" class="form-control" name="customerName" id="customerName" value="${feedbackObj.customerName}"/>
        	 </div>
   </div>
    
     <div class="form-group col-lg-2">
        	 <div class="row">
        	
        	  <div class="col-lg-12">
        	  <label><spring:message code="customer.newfeedback.emptyspace" /> <span style="color:red; font-size:2"></span></label>
        	  <label> <span style="color:red; font-size:2"></span><spring:message code="customer.newfeedback.lastName" /></label>
	               <span style="color:red; font-size:2">*</span>
	                <input type="text" class="form-control" id="lastName" placeholder="<spring:message code="customer.newfeedback.lastName" />"  />
	                <span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             
        	 </div>
   </div>
 
   <div class="form-group col-lg-2"></div>
   </div>         
                  
   <div class="row">
   <div class="col-lg-1"></div>
   <div class="form-group col-lg-3">
        	 <div class="row">
        	
        	  <div class="col-lg-12">
        	  <label><spring:message code="customer.newfeedback.contact" /> <span style="color:red; font-size:2">*</span></label>
        	  <div class="row">
        	
                                  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                  	<select class="form-control" style="padding: 2px 0px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU" >
                                  	<option selected="selected">IN</option>
                                  	<option>US</option>
                                  	<option>GB</option>
                                  	<option>AU</option>
                                  	</select>
                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
                                  </div>
                                  <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px">
                                  	<input type="text" class="form-control" value="" placeholder="<spring:message code="customer.newfeedback.phone" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                  </div>
                                  <input type="hidden" class="form-control" name="phone" id="mobileNo"  value="${feedbackObj.customer_mobileNo}"/>
                                   <input type="hidden" id="output" />
                             </div>
        	 			 <span id="customerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
	        	 	<%-- 
	                <input type="text" class="form-control" id="phone"  value="${feedbackObj.customer_mobileNo}" placeholder="<spring:message code="customer.newfeedback.phone" />"  />--%>
	                
	             </div>
	              
        	 </div>
   </div>
    
     <!--added by manasa  -->
			<input type="hidden" id="gridlocation" value="${dealObj.storeLocation}"> 
		 <input type="hidden" id="From" value="${dealObj.startDate}">
        <input type="hidden" id="To" value="${dealObj.endDate}">
      <!--    <input type="hidden" id="searchBusinessEnquiry" value="">  -->
				<!--added by manasa  -->
   
        	
        	   <div class="form-group col-lg-3">
        	 <div class="row">
        	
        	  <div class="col-lg-10">
        	  <label> <span style="color:red; font-size:2; margin-left:-92px"></span><spring:message code="customer.newfeedback.email" /></label>
	               <span style="color:red; font-size:2; margin-left:-57px">*</span>
	                <input type="text" class="form-control" id="customerEmail"  value="${feedbackObj.customer_emailId}"  placeholder="<spring:message code="customer.newfeedback.email" />"   style="margin-left:-92px"/>
	                <span id="customerEmailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             </div>
	              <div class="col-lg-2"></div>
	             </div>
        
   
     <div class="form-group col-lg-2"></div>
     
         <div class="form-group col-lg-4">
         <div style="border:1px solid #808080;;margin-top: -36px">
        	<div class="row">
        	
        	  <div class="col-lg-8" style="padding-right:0px">
	                <input class="form-control "  value="Feedback Category" readonly="readonly" name="feedbackcategeory" id="feedbackcategeory" size="20" type="text"    style="border-right-color:grey "/>
	                <span id="fbcError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             <div class="col-lg-4"  style="padding-right:0px" >
	                <input class="form-control"  value="Rating" readonly="readonly" name="Rating" id="Rating" size="20" type="text"    style="margin-left:-15px" />
	                <span id="RatingError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
	             
	             
        	 </div>
        	 
        	 <div class="row">
        	 
        	 
        	
        	  <div class="col-lg-8" >
	                <textarea class="form-control"   style="resize:none;border:hidden" rows="4" name="feedbackcategeory" id="feedbackcategeory"  ></textarea>
	             </div>
	             <div class="col-lg-4" >
	                
	                
	                
	                <div class='starss' id='starss_group' > 
    <input class='stars stars-5' id='stars-5' value="5" type='radio' name='stars' />
    <label class="stars stars-5" for="stars-5"></label>
    <input class='stars stars-4' id='stars-4'value="4"  type='radio' name='stars' />
    <label class='stars stars-4' for='stars-4'></label>
    <input class='stars stars-3' id='stars-3' value="3" type='radio' name='stars' />
    <label class='stars stars-3' for='stars-3'></label>
    <input class='stars stars-2' id='stars-2' value="2" type='radio' name='stars' />
    <label class='stars stars-2' for='stars-2'></label>
    <input class='stars stars-1' id='stars-1' value="1" type='radio' name='stars' />
    <label class='stars stars-1' for='stars-1'></label>
    </div>
	             </div> 
	             
   </div>
   </div>


   </div>  
     <div class="col-lg-1"></div>
  </div>       
  <div class="row">
      <div class="col-lg-1"></div>
  <div class="col-lg-5" style="margin-top:-35px">
  <label>Address</label>
  <input type="text" class="form-control" id="customerAddress1"    placeholder="Address 1" value="${feedbackObj.street}"  />
  <br>
  <input type="text" class="form-control" id="customerAddress2"    placeholder="Address 2"   value="${feedbackObj.locality}" style="margin-top:-17px" />
  <br>
    
  <br>
  
  
 </div>
 
   <div class="col-lg-1"></div>
 
   <div class="col-lg-2">
        <div class="row">
      
              	  <div class="col-lg-8">
      
      
      <label><spring:message code="feedback.status.label" /><span style="color:red; font-size:2"></span></label>
	                <input class="form-control" id="feedBackStatus" value="" type="hidden">
	                <select id="statusType" class="form-control" >
															<option value="Opened" ${'Opened' == feedbackObj.status ? 'selected' : ''}>Opened</option>
															<option value="Pending" ${'Pending' == feedbackObj.status ? 'selected' : ''}>Pending </option>
															<option value="Closed" ${'Closed' == feedbackObj.status ? 'selected' : ''}>Closed</option>
														
														  </select>

   <br>   
   </div>    
   </div>
   </div>
 
 
 <div class="col-lg-1"></div>
  </div>       
  <div class="row">
      <div class="col-lg-1"></div>
  <div class="col-lg-5">
  <div class="row">
    <div class="col-lg-7">
  
   <input type="text" class="form-control" id="Area"   placeholder="Area"   value="${feedbackObj.area}" style="margin-top:-37px"/>
   </div>
       <div class="col-lg-5">
   
    <input type="text" class="form-control" id="City"    placeholder="City"   value="${feedbackObj.city}" style="margin-top:-37px"/>
 </div>
 </div>
 <div class="col-lg-1"></div>
  </div>    
     
      <div class="col-lg-1"></div>
      
     
   </div>
                           
     <div class="row">
      <div class="col-lg-1"></div>
  <div class="col-lg-10">
  <label><spring:message code="feedback.customer.comments" /></label>
  <textarea class="form-control" id="customerComments" style="resize:none;" rows="4" placeholder="<spring:message code="enter.customer.comments.label" />" >${feedbackObj.customerComments}</textarea> 
 </div>
 <div class="col-lg-1"></div>
  </div>       
     
     <br>     
                  
      <div class="row" style="text-align: center;">
   
	                       		<input type="button" class="btn bg-olive btn-inline" style="width: 65px;margin-right: 180px;" onclick="validateCustomerFeedbackForm('new')" value="Submit" />
	                      
	                     
	                      
			 					<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewCustomerFeedback('customerFeedback','0','menu')" value="<spring:message code="cancel.label" />" />
						 	 
 <%-- <input type="button" id="submit" style="width: 70px;" class="btn bg-olive btn-inline" onclick="validateCustomerFeedbackForm('new')" value="<spring:message code="save.label" />">
<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;width: 70px;" onclick="viewCustomerFeedback('customerFeedback','0','menu')" value="<spring:message code="cancel.label" />">	 --%> 
        	</div>            

                  
   <%--    <div class="row">
 <div class="form-group col-lg-7">
        	 <div class="row">
        	 <div class="col-lg-1"></div>
	        	 <div class="col-lg-11">
	        	  <label><spring:message code="customer.newfeedback.customer" /> <span style="color:red; font-size:2"></span></label>
                           	 <div class="row">
                                  <div class="col-lg-5 col-md-4 col-sm-4 col-xs-4">
                                  	  <input type="text" class="form-control" id="firstName"   placeholder="<spring:message code="customer.newfeedback.firstName" />"  />
	                <span id="customerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                  
                                  </div>
                                  <div class="col-lg-5 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	 <input type="text" class="form-control" id="lastName" placeholder="<spring:message code="customer.newfeedback.lastName" />"  />
	                <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                  </div>
                             </div>
                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                    </div>
     <!--          <div class="col-lg-1"></div> -->
             </div>
         </div>   --%>          
                  
 
                    
                  
		          </div>
		         
                
               
                            
               
                           
                </div>
           </div><!-- /.box-body -->
       </div><!-- /.box -->

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