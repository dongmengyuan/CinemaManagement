<%@ page pageEncoding="UTF-8" isErrorPage="false" errorPage="error.jsp"%>
<%--<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>--%>

<html>
<head>
    <%--<base href="<%=basePath%>">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" href="./view/system_manager/Bootstrap/bs.css">
    <link rel="stylesheet" href="./view/system_manager/css/login.css">
    <script src="js/jquery-2.1.3.min.js"></script>

    <%--<script>--%>
        <%--//页面初始化加载--%>
        <%--function check() {--%>
            <%--var name=document.getElementById("name").value;--%>
<%--//            var pass=document.getElementById("pass").value;--%>
            <%--var reg=/^[a-zA-Z0-9]{4,20}$/;--%>
            <%--if(!reg.test(name)){--%>
                <%--document.getElementById("alert").innerHTML="wrong format";--%>
                <%--document.getElementById("name").value="";--%>
                <%--document.getElementById("name").focus();--%>
            <%--}--%>
            <%--else{--%>
                <%--//alert("开始检查用户名是否存在.....!");--%>
                <%--var url = "Login?name="--%>
                    <%--+ document.getElementById("name").value;--%>
                <%--if (window.XMLHttpRequest)--%>
                    <%--req = new XMLHttpRequest();--%>
                <%--else if (window.ActiveXObject)--%>
                    <%--req = new ActiveXObject("Microsoft.XMLHTTP");--%>
                <%--if (req) {--%>
                    <%--req.open("get", url, true);--%>
                    <%--//get方式可不加如下语句--%>
                    <%--req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");--%>
                    <%--req.onreadystatechange = complete;--%>
                    <%--req.send(null);--%>
                    <%--document.getElementById("flag").innerText = "请稍后，正在检查用户名!";--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>
        <%--function check1(){--%>
            <%--var pass=document.getElementById("pass").value;--%>
            <%--var reg=/^[0-9]{6,10}$/;--%>
            <%--if(!reg.test(pass)){--%>
                <%--document.getElementById("alert").innerHTML="wrong format";--%>
                <%--document.getElementById("pass").value="";--%>
            <%--}--%>
        <%--}--%>
        <%--/*分析返回的XML文档*/--%>
        <%--function complete() {--%>
            <%--if (req.readyState == 4) {--%>
                <%--if (req.status == 200) {--%>
                    <%--var result = req.responseText;--%>
                    <%--if (result == "useryes")--%>
                        <%--infoStr = "用户名正确！请继续!";--%>
                    <%--else--%>
                        <%--infoStr = "用户名不存在！";--%>
                    <%--document.getElementById("desc").innerText = infoStr;--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>
    <%--</script>--%>

</head>

<body>
<div class="container">
    <h1>欢迎使用FZN影院管理系统</h1>
    <div id="login">
        <%--<div id="alert">${desc}</div>--%>
        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
            <%--<div id="alert">${desc}</div>--%>
            <div class="form-group">
                <p align="center">帐名</p>
                <input type="text" class="form-control" id="name" name = "name" placeholder="请输入账号"   required="required" pattern="[a-zA-Z0-9_]{4,20}" title="账号4~20位(仅可由数字，字母，下划线组成)" onblur="checkUser(this)">
            </div>
            <div class="form-group">
                <p align="center">密码</p>
                <input type="password" class="form-control" id="pass" name = "pass" placeholder="请输入密码" required="required" pattern="[0-9]{6,10}" title="密码6~9个数字">
            </div>
            <div id="but">
                <button type="submit" class="btn btn-primary  btn-block" >登陆</button>
            </div>
            <div id = "desc">

            </div>
        </form>
    </div>
</div>

<%--<script src="./view/system_manager/javascript/login.images"></script>--%>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/system_manager/jquery/jquery.min.js"></script>
<script type="text/javascript">
    function checkUser(obj) {
        $.post("${pageContext.request.contextPath }/checkUserServlet",{"username":obj.value},function(data){
            $("#desc").empty();
            $("#desc").append(data);
        });
    }
</script>
</html>
