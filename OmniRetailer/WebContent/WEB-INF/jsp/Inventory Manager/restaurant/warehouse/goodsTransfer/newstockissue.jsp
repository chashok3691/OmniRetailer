<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/goodsTransfer/newstockissue.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
<script>
$(document).ready(function(){
	/* $('.dataTables_empty').remove(); */
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="new.stockissue.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    <div class="row">
                                    <div class="form-group col-lg-4">
                                            <label><spring:message code="shipped.from.label" /></label>
                                             <select class="form-control" name="shipped_from" id="fromlocation">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}">${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="date.label" /></label>
                                             <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" name="deliveryDate" id="date" required value="" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
	                                        </div> <!-- /.input group -->
                                           <!--  <input type="text" class="form-control" name="deliveryDate" id="date" readonly /> -->
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="issuelocation.label" /></label>
                                             <select class="form-control" name="receipt_location" id="tolocation">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}">${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                        </div>
                                        
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="delivered.by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="deliveredByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="inspected.label" /> <spring:message code="by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="InspectedBy" id="inspected" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="inspectedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /></label>
                                            <input type="text" class="form-control" id="received" name="Received_by" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                     </div>
                                        
                                   
                                        <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         	<label><spring:message code="search.items.here.label" /></label>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                            <%-- <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" placeholder="<spring:message code="good.label"/>" />
 												<datalist id="skuList">
												
												</datalist> --%>
  										 </div>
                                         <div class="col-lg-3"></div>
                                        </div>
                                        
                                        <br>
                                     
                                      <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="item.name.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="pack.label"/></th>
                                                <th><spring:message code="cost"/></th>
                                                <th><spring:message code="issued.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="rejected.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                          </tbody>
                                       </table>
                                    </div>
                                   <!--  </div> -->
                                    <br/> <br/>
                                    
                                     <div class="row">
                                         <!-- <div class="col-lg-3"></div> -->
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" style="resize: none;" rows="2" placeholder="<spring:message code="enter.remarks.label" />" ></textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                        <br/>
                                   
                                        
                                      <div class="row">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<div class="form-group col-lg-6">
										<label><spring:message code="totalquantity.label" />:
										</label> <label id="totalQty"></label>
									</div>
									<div class="form-group col-lg-6">
										<label><spring:message code="cost.label" />: </label> <label
											id="totalCost"></label>
									</div>
								</div>
								<div class="col-lg-4"></div>
							</div>
                                  
                                       
                                        
                                       
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="validateWarehouseStockIssue('stored','new','','');" value="Submit" />
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="validateWarehouseStockIssue('draft','new','','');" value="<spring:message code="save.label" />" />
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewAllWarehouseStockIssues('warehouseGoodstransfer','all');" value="<spring:message code="cancel.label" />" />
						</div>
						
					
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
<!-- DATA TABES SCRIPT -->
     	<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		});
	</script> 
        
</body>
</html>
		    		 