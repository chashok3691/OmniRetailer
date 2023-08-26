<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <link href="${pageContext.request.contextPath}/css/montoring/demo.css?version=' + new Date().getTime() + '" rel='stylesheet' type="text/css" />




<body>
<div class="left">
    <div id="divPlugin" class="plugin"></div>
</div>
<div class="left">
    <fieldset class="login" style="margin-left: 10px">
        <legend>Login</legend>
        <table cellpadding="0" cellspacing="3" border="0" >
            <tr>
                <td class="tt">IP address</td>
                <td><input id="loginip" type="text" class="txt" value="10.10.0.111" /></td>
                <td class="tt">Port</td>
                <td><input id="port" type="text" class="txt" value="80" /></td>
            </tr>
            <tr>
                <td class="tt">User name</td>
                <td><input id="username" type="text" class="txt" value="admin" /></td>
                <td class="tt">Password</td>
                <td><input id="password" type="password" class="txt" value="admin@123" /></td>
            </tr>
            <tr>
                <td class="tt">Device port</td>
                <td colspan="2"><input id="deviceport" type="text" class="txt" value="8000" />（optional）</td>
                <td>
                    Split screen&nbsp;
                    <select class="sel2" onchange="changeWndNum(this.value);">
                        <option value="1" >1x1</option>
                        <option value="2" selected >2x2</option>
                        <option value="3">3x3</option>
                        <option value="4">4x4</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <input type="button" class="btn" value="Login" onclick="clickLogin();" />
                    <input type="button" class="btn" value="Logout" onclick="clickLogout();" />
                    <input type="button" class="btn2" value="Get basic info" onclick="clickGetDeviceInfo();" />
                </td>
            </tr>
            <tr>
                <td class="tt">Logined devices</td>
                <td>
                    <select id="ip" class="sel" onchange="getChannelInfo();"></select>
                </td>
                <td class="tt">Channel list</td>
                <td>
                    <select id="channels" class="sel"></select>
                </td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="preview">
        <legend>Browse</legend>
        <table cellpadding="0" cellspacing="3" border="0">
            <tr>
                <td class="tt">Stream type</td>
                <td>
                    <select id="streamtype" class="sel">
                        <option value="1">Main stream</option>
                        <option value="2">Sub stream</option>
                    </select>
                </td>
                <td>
                    <input type="button" class="btn" value="Start preview" onclick="changeWndNum(1); clickStartRealPlay();" />
                    <input type="button" class="btn" value="Stop preview" onclick="clickStopRealPlay();" />
                </td>
            </tr>
        </table>
    </fieldset>

</div>
<%--  <script src="${pageContext.request.contextPath}/js/monitoring/jquery-1.7.1.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/monitoring/webVideoCtrl.js"></script>
<script src="${pageContext.request.contextPath}/js/monitoring/demo.js"></script>
</body>
</html>