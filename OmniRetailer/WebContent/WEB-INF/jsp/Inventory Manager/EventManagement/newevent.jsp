<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/Orders/orders.jsp
 * file type		        : JSP
 * description				: display order information
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
         	<script type="text/javascript" src="${pageContext.request.contextPath}/js/eventManagement.js"></script>   
        
  
  
  
    </head>
    <style>
pre {
    display: block;
    padding: 0px 30px;
    margin: 0 0 0px;
    font-size: 14px;
    line-height: 1.428571;
    color: #333;
    word-break: break-all;
    word-wrap: break-word;
    background-color: #f4f4f4;
    border: 0px solid #ccc;
    border-radius: 0px;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th{
    padding: 8px !important;
    }
    
    .table>thead>tr>td, .table>thead>tr>th {
      padding: 3px !important;
    }


.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
background:#ccc !important;
}
.nav-tabs>li {
border-top: 3px solid #3c8dbc;
}
    </style>
<body>
				
                <section class="content" style="background: none !important;">
                	
                            <div class="nav-tabs-custom" >
                            
                            <div class="col-lg-6" id="EventCreation">
                            <label style="font-weight: 700;font-size: 19px;">Event Open Procedure</label>
                                <ul class="nav nav-tabs" >
                                
                                <li><a href="#tab_1"  data-toggle="tab" id="tab_1_Event" >Event</a></li>
                                <li><a href="#tab_2" data-toggle="tab" target="_self" id="tab_2_Menu"><spring:message code="menu.label"/></a></li>
                                  <li><a href="#tab_3" data-toggle="tab" id="tab_3_Iventory" >Inventory</a></li>
                                 <li><a href="#tab_5" data-toggle="tab"  id="tab_4_Eqipment"  ><spring:message code="event.equipment.label"/></a></li>
                                  <li><a href="#tab_4" data-toggle="tab" id="tab_5_Manpower"><spring:message code="event.manpower.label"/></a></li>
                                 
                                 
                                </ul>
                                </div>
                                
                                <div class="tab-content">
                                    <div class="tab-pane" id="tab_1" >
                                    <div class="row">
                        			<%@include file="neweventconfigure.jsp"%>
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                    <div class="tab-pane" id="tab_2" >
                                    <div class="row">
                        			<%@include file="neweventMenu.jsp"%>
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                    <div class="tab-pane" id="tab_3" >
                                    <div class="row">
                        			  <%@include file="newEventInventory.jsp"%> 
                                    </div>
                                    </div><!-- /.tab-pane -->	
                                      <div class="tab-pane" id="tab_5" >
                                    <div class="row">
                        			 <%@include file="newEventEquipment.jsp" %>
                                    </div>
                                    </div>
                                    <div class="tab-pane" id="tab_4">
                                    <div class="row">
                        			 <%@include file="newEventManpower.jsp"%>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                   <!-- /.tab-pane -->
                                    
                                  </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->   
                               <input type="hidden" id="flow" value="${flow}" />
                              
                        </section>
                          
</body>
</html>