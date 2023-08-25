<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/employeeMaster.jsp
 * file type		        : JSP
 * description				: The employee details table is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/B2BPartner.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
</style>       
<script type="text/javascript">
$(document).ready(function(){

	$('#mySearch').click(function(){
	      var search = $('#searchB2BPartners').val();
	      return viewb2bPartners('b2bPartners','0');
	  });
	   $('#searchB2BPartners').keyup(function(e){
	  	 
	      if(e.which == 13){//Enter key pressed
	          $('#mySearch').click();//Trigger search button click event
	      }
	       else if(e.which == 8){ //backspace key pressed
	      	 if($('#searchB2BPartners').val()=="")
	      	 $('#mySearch').click();//Trigger search 
	      }
	     });
});
</script>
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
                        <div class="box-header" style="text-align: center;">
                            <h3 class="box-title" style="border:1px solid #937c7c;padding:7px;font-weight: 600;"><spring:message code="b2b.Partners.label" /></h3>
                        </div><!-- /.box-header -->
                        <div class="box-body table-responsive">
                   <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                   <div id="Success" class="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${Success}</div>
                        	<div class="row">
                        		<div class="col-lg-6">
		                            <div class="col-lg-2 col-xs-2" style="padding-left: 0px;margin-bottom: 3px;">
		                           	 <label><spring:message code="customer.newfeedback.emptyspace"/></label>
		                            <span style="visibility: hidden;" id="suppliersImgspan">
									<img style="width: 30px;margin-top:20px" id="suppliersImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	       </span>
						  	       </div>
		                          </div>
		                          <div class="col-lg-3"></div>
		                      </div>
		                     
                          <div class="row">
                           <div class="col-lg-1 col-xs-1">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewb2bPartners('b2bPartners','0');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
		                      <div class="col-lg-9 nopadding">
		                      	<input type="text"  class="form-control" value="${searchName}" id="searchB2BPartners" placeholder="Search Partners" />
                   				  <button id="mySearch" class="searchbutton"></button>
								  <input type="hidden" id="searchName" value="${searchName}">
							
		                      </div>
		                    
		                    
                              
		   			                  	   <div class="col-lg-1" style="padding-left: 8px;padding-right: 8px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return viewNewB2BPartner('b2bPartners');" value="<spring:message code="addnew.label" />">
								           </div>
								           <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return  validate('b2bPartners');" value="<spring:message code="delete.label" />">
								           </div>
		   			                  
		                   
		                     
							</div>
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th> 
                                     		    <th><spring:message code="sl.no.label" /></th>
                                            	<th><spring:message code="b2b.Partner_ID.label" /></th>
                                                <th><spring:message code="b2b.Partner_Name.label" /></th>
                                                <th><spring:message code="b2b.mail_ID.label" /></th>
                                                <th><spring:message code="b2b.phone.label" /></th>
                                                <th><spring:message code="b2b.city.label" /></th>
                                                <th><spring:message code="b2b.location.label" /></th>
                                                <th><spring:message code="b2b.created_date.label" /></th>
                                                <th><spring:message code="b2b.action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                            <c:forEach var="b2bList" items="${b2bPartnersList}" varStatus="thecount">
                                            <tr>
                                                <c:if test="${sessionScope.role == 'super admin'}"> 
                                              	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${b2bList.partnerId}" /></td>
                                                </c:if>
                                                <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             					<c:if test="${accessControl.appDocument == 'B2BPartners' && accessControl.write == true && accessControl.read == true}">
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${b2bList.partnerId}" /></td>
                                            	</c:if>
                                                </c:forEach>
                                             	<td>${thecount.count+index-1}</td>
                                                <td>${b2bList.partnerId}</td>
                                                <td>${b2bList.partnerName}</td>
                                                <td>${b2bList.email}</td>
                                                <td>${b2bList.phone}</td>
                                                <td>${b2bList.city}</td>
                                                <td>${b2bList.address}</td>
                                                <td>${b2bList.createdDateStr}</td>
                                                <td>
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditB2BPartners('${b2bList.partnerId}','view')">View</a>&nbsp;&nbsp;&nbsp;
                                                <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewEditB2BPartners('${b2bList.partnerId}','edit')">Edit</a>
                                                </td>
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                       
                                    </table>
                
           <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewb2bPartners('b2bPartners','${index+maxRecords-1}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewb2bPartners('b2bPartners','${index - maxRecords-1}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewb2bPartners('b2bPartners','${index - maxRecords-1}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewb2bPartners('b2bPartners','${index+maxRecords-1}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              		
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewb2bPartners('b2bPartners',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>  
               </div><!-- /.box-body -->
               </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
                //$("#example1").dataTable();
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
        <input type="hidden" id="deleteActionLabel" value="B2BPartners"/>
        <input type="hidden" id="err" value="${err}" />
</body>
</html>