<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/goodsTransfer/viewstockissue.jsp
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
<style>
  .odd{display:none!important;}
</style>
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
                                <h3><spring:message code="view.stockissue.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    
                                    <div class="row">
                                    <div class="form-group col-lg-4">
                                            <label><spring:message code="shipped.from.label" /></label>
                                            <input type="text" class="form-control" readonly id="fromlocation" value="${stockIssueDetails.shipped_from}"/>
                                     </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="date.label" /></label>
                                            <input type="text" class="form-control" readonly value="${stockIssueDetails.delivery_date}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="issuelocation.label" /></label>
                                            <input type="text" class="form-control" readonly id="issue_to" value="${stockIssueDetails.issue_to}"/>
                                        </div>
                                        </div>
                                        
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="delivered.by.label" /></label>
                                            <input type="text" class="form-control" readonly value="${stockIssueDetails.delivered_by}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="inspected.label" /> <spring:message code="by.label" /></label>
                                            <input type="text" class="form-control" readonly value="${stockIssueDetails.inspectedBy}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${stockIssueDetails.received_by}"/>
                                        </div>
                                     </div>
                                     
                                     
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
                                                <th><spring:message code="supplied.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="rejected.label"/></th>
                                           </tr>
                                          </thead>
                                          <tbody>
                                              <tbody>
                       <c:forEach var="itemList" items="${stockIssueDetails.itemDetails}">
             		   <tr>
              			<td>${itemList.item}</td>
                  		<td>${itemList.description}</td>
                  		<td>${itemList.uOM}</td>
                  		<td>${itemList.price}</td>
                  		<td>${itemList.quantity}</td>
                  		<td>${itemList.cost}</td>
                  		<td>${itemList.issued}</td>
                  		<td>${itemList.recieved}</td>
                  		<td>${itemList.rejected}</td>
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                                          </tbody>
                                       </table>
                                    </div>
                                   <!--  </div> -->
                                    <br/> <br/>
                                    
                                     <div class="row">
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" style="resize: none;" readonly>${stockIssueDetails.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                        <br/>



							<div class="row">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<div class="form-group col-lg-6">
										<label><spring:message code="totalquantity.label" />:
										</label> <label id="totalQty">${stockIssueDetails.issue_total_qty}</label>
									</div>
									<div class="form-group col-lg-6">
										<label><spring:message code="cost.label" />: </label> <label
											id="totalCost">${stockIssueDetails.issue_total}</label>
									</div>
								</div>
								<div class="col-lg-4"></div>
							</div>




						</div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
							<input type="button" class="btn bg-olive btn-inline"
								onclick="getWarehouseStockIssuessByLocation('all');"
								value="<spring:message code="cancel.label" />" />
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

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 