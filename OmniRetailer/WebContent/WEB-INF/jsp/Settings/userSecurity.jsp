<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/settings/editUserSecurity.jsp
 * file type		        : JSP
 * description				: The editUserSecurity form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/cusomerSettings/userSecurity.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 --%>
<style type="text/css">
	
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
	font-weight: bold;
	color: black;
    background-color: rgb(195,195,195);
    border-color: black;
}
	 
</style>

<script type="text/javascript">
$(document).ready(function(){
	/* $("#hidePassword").change(function(e){
		if(!$(this).prop("checked")){
			$("#password").attr("type","text");
		}
		else{
			$("#password").attr("type","password");
		}
	}); */
	
	
	$("#changePassword").change(function(e){
		if(!$(this).prop("checked")){
			$("#cpdll").val(false);
		}
		else{
			$("#cpdll").val(true);
		}
		return;
	});
	
	$("#enforceUserToChange").change(function(e){
		if(!$(this).prop("checked")){
			$("#eutc").val(false);
		}
		else{
			$("#eutc").val(true);
		}
		return;
	});
	
	$("#offlineLogin").change(function(e){
		if(!$(this).prop("checked")){
			$("#offLogin").val(false);
		}
		else{
			$("#offLogin").val(true);
		}
		return;
	});
	
	
});
</script>        
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">

  
  <div class="col-xs-12">

				<div class="box box-primary " style="padding: ">
    <div class="box-header" style="text-align: left; height:25px;">
   
    <h3 align="center"><spring:message code="secutiry.policies.label" /></h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <form>
    
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
        
        <div id="Error" class="Error" style="text-align: center;margin-top:20px;color: red;font-size: 2;font-weight: bold;">${err}</div>
        <div id="Success" class="Error" style="text-align: center;color: blue;margin-top:20px;font-size: 2;font-weight: bold;">${success}</div>
        	 </div>
			<br><br>

<div class="row">
<div class="form-group col-lg-12">
        	      <div class="row" >
                   <div class="form-group col-lg-12" style="height:15px;" >
                   <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('priceList');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="password.policies.label" /></span></div>
                    <div class="form-group col-lg-10" style="margin-bottom: 4px;">
                   	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('priceList');" id="priceListImg" alt="" <%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
                    </div> 
                   <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                   <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                   </div>
               </div>
             	</div>
             	</div>
        	 <div class="row">
        <!-- 	 <div class="form-group col-lg-1"  >
        	 </div> -->
        	 <div class="form-group col-lg-4" style="margin-left:5%" >
             <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 16px;"><spring:message code="password.strength.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             <div class="col-lg-12" style=" height: 34px;margin-top: -7%;">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="min.length.of.password.label" /> <span style="color:red; font-size:2;"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="passwordLength" value="${securitySettings.minPasswordLength}" placeholder="" />
                <span id="passwordLengthError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="capital.letters.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="capitalLetters" value="${securitySettings.capitalLetters}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="capitalLettersError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12" style=" height: 34px;margin-top: -3%;">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="small.letters.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="smallLetters" placeholder="" value="${securitySettings.smallLetters}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="smallLettersError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12" style=" height: 34px;margin-top: 0%;">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="special.characters.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="specialCharacters" placeholder="" value="${securitySettings.specialLetters}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="specialCharactersError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 16px;"><spring:message code="password.age.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             <div class="col-lg-12" style=" height: 34px;margin-top: -7%;">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="expiry.in.days.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="expiryInDays" placeholder="" value="${securitySettings.passwordExpiryInDays}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="expiryInDaysError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="enforce.the.user.to.change.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <c:choose>
             	<c:when test="${securitySettings.enforceUserToChange}">
               	<input style="width: 43px; height: 17px;" type="checkbox" id="enforceUserToChange"  checked> 
               <!-- 	<input type="checkbox" id="offlineLogin"  disabled="disabled" checked> -->
            	</c:when>
             	<c:otherwise>
               	<input style="width: 43px; height: 17px;" type="checkbox" id="enforceUserToChange" >
             	</c:otherwise>
             </c:choose>
                <!-- <input type="checkbox" class="form-control" id="enforceUserToChange" placeholder="" /> -->
               <!--  <input style="width: 43px; height: 17px;" type="checkbox" id="enforceUserToChange" checked="checked"> -->
                <input type="hidden" id="eutc" value="${securitySettings.enforceUserToChange}" >
                <span id="enforceUserToChangeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
             </div>
             <div class="form-group col-lg-1">
             </div>
             <div class="form-group col-lg-4">
              <div class="form-group col-lg-12" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 16px;"><spring:message code="password.history.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             <div class="col-lg-12" style=" height: 34px;margin-top: -7%;">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="password.history.count.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="passwordHistoryCount" placeholder="" value="${securitySettings.passwordHistoryCount}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="passwordHistoryCountError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="enforce.password.history.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <input type="text" class="form-control" id="enforcePasswordHistory" placeholder="" value="${securitySettings.enforcePasswordHistory}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="enforcePasswordHistoryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
             
</div>
                     </div>
                     <div class="row">
<div class="form-group col-lg-12">
        	      <div class="row" >
				                    <div class="form-group col-lg-12" style="height:15px;    margin-top: -2%;" >
				                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('priceList');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="login.policies.label" /></span></div>
				                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
				                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('priceList');" id="priceListImg" alt="" <%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
				                     </div> 
				                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
				                    <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
				                    </div>
				                </div>
             	</div>
             	</div>
             	 <div class="row" style="margin:4%;">
               <div class="form-group col-lg-6" style="margin-top:-3%;">
              
             <div class="col-lg-12">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="change.password.during.login.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <c:choose>
             	<c:when test="${securitySettings.firstTimeLogin}">
               	<input style="width: 43px; height: 17px;" type="checkbox" id="changePassword"  checked> 
               <!-- 	<input type="checkbox" id="offlineLogin"  disabled="disabled" checked> -->
            	</c:when>
             	<c:otherwise>
               	<input style="width: 43px; height: 17px;" type="checkbox" id="changePassword" >
             	</c:otherwise>
             </c:choose>
                <!-- <input type="text" style="width:53px;" class="form-control" id="changePassword" placeholder="" /> -->
                <!--  <input style="width: 43px; height: 17px;" type="checkbox" id="changePassword" checked="checked"> -->
                 <input type="hidden" id="cpdll" value="${securitySettings.firstTimeLogin}">
                <span id="changePasswordError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12" style="margin-top:-1%;">
             <div class="form-group col-lg-9">
        	 <label><spring:message code="allow.offline.login.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-3">
                <!-- <input type="text" style="width:53px;" class="form-control" id="offlineLogin" placeholder="" /> -->
                <c:choose>
             	<c:when test="${securitySettings.allowOfflineLogin}">
               	<input style="width: 43px; height: 17px;" type="checkbox" id="offlineLogin"  checked> 
               <!-- 	<input type="checkbox" id="offlineLogin"  disabled="disabled" checked> -->
            	</c:when>
             	<c:otherwise>
               	<input style="width: 43px; height: 17px;" type="checkbox" id="offlineLogin" >
             	</c:otherwise>
             </c:choose>
                 <!-- <input style="width: 43px; height: 17px;" type="checkbox" id="offlineLogin" > -->
                 <input type="hidden" id="offLogin" value="${securitySettings.allowOfflineLogin}">
                <span id="offlineLoginError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12" style="margin-top:-1%;">
             <div class="form-group col-lg-10">
        	 <label><spring:message code="lock.the.account.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-2" style="margin-left:-8%;">
                <input type="text" style="width:40px;" class="form-control" id="lockTheAccount" value="${securitySettings.noOfAttempts}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="lockTheAccountError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
            <div class="col-lg-12" style="margin-top:-1%;">
             <div class="form-group col-lg-6">
        	 <label><spring:message code="restricted.area.label" /> <span style="color:red; font-size:2"></span></label>
                </div>
                <div class="form-group col-lg-2" style="margin-left:10%;">
                <input type="text" style="width:41px;margin-left: ;margin-right:;" class="form-control" value="${securitySettings.restrictedAreaLongitude}" id="restrictedAreaLongitude" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="restrictedAreaLongitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
                <div class="form-group col-lg-2" style="margin-left:-1.5%;">
                <input type="text"  style="width:41px;margin-left:" class="form-control" value="${securitySettings.restrictedAreaLatitude}" id="restrictedAreaLatitude" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                <span id="restrictedAreaLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  					</div>
            </div>
             
</div>
</div>
                        <div class="row" style="text-align: right; margin-top: 0px;">
                     <div class="row">  
  <div class="col-lg-12" >
  <br>
<div class="row" style="text-align: center;margin-top:-51px">
<c:forEach var="accessControl" items="${sessionScope.settings}">
      <c:if test="${accessControl.appDocument == 'UserSecuritySettings' && accessControl.write == true}">
	
		 <input type="button" id="submit" style="margin-right: 25%;" class="btnCls" data-toggle="modal" data-target="#myModal"  value="<spring:message code="submit.label" />">
	</c:if>
</c:forEach>
		<input type="button" class="btnCls" style="" onclick="showCustomerSettingsFlow();" value="<spring:message code="cancel.label" />">
</div>
	</div>
	</div>
        	 </div>
                      </div>
                      
                      
                      
                      
                      
                      
                      
			    <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer Security Settings</h4>
      </div>
      <div class="modal-body">
        <p>Requested to make changes in Customer Security Settings, do you want to continue and apply?</p>
      </div>
      <div class="modal-footer">
      <div class = "col-lg-6" >
              <button type="button" class="btnCls"  onclick=""  data-dismiss="modal">Cancel</button>
      </div>
         <c:if test="${status == 'new'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validateUserSecurityForm('new');"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      <c:if test="${status == 'edit'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validateUserSecurityForm('edit');"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      </div>
    </div>

  </div>
</div>
                      
                      
                      
                      
                      
                      <div class="box-footer">
                                    
                    </div>
                     </form>
	</div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>