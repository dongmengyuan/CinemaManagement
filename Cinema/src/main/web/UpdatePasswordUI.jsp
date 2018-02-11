<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="./view/system_manager/jquery/jq.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/view/system_manager/jquery/jquery.min.js"></script>
    <script src="./view/system_manager/jquery/bootstrap.min.js"></script>
    <script src="./view/system_manager/javascript/stdio.js"></script>
    <link rel="stylesheet" href="./view/system_manager/Bootstrap/bs.css">
    <link rel="stylesheet" href="./view/system_manager/css/manage.css">
    <link rel="stylesheet" href="./view/system_manager/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="display.css">

    <title>stdio</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div id="ww">
    <div class="modelname">
        <label class="title">修改密码</label>

    </div>
    <div align="center">
        <form name="myform" class="form-horizontal" id="edit_Password_form" action="${pageContext.request.contextPath }/updatePasswordServlet" method="post">
            <div class="form-group">
                <label  class="col-sm-3 control-label"></label>

                <div class="col-sm-4">
                    <input type="hidden" id="flag" >
                    <div id="msg"></div>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">原密码</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control"  onblur="checkPassword(this)" id="edit_employee_no" placeholder="" name="emp_pass"
                           pattern="[\u4e00-\u9fa5A-Aa-z0-9]*[-·]{0,1}[\u4e00-\u9fa5A-Aa-z0-9]*" required="required"
                           oninvalid="setCustomValidity('请重新输入!')"
                           oninput="setCustomValidity('')">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-3 control-label">新密码</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="edit_employee_tel_num" placeholder="" name="emp_newpass"
                           pattern="[1-9]*" required="required"
                           oninvalid="setCustomValidity('请输入20以内的数字!')"
                           oninput="setCustomValidity('')">
                </div>
            </div>

            <!--  <input type="submit" value="修改" class="layui-btn"> -->
            <button type="submit" class="btn btn-primary"  onclick="return fflag()">提交</button>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    function checkPassword(obj) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/checkPasswordServlet",
            data:{"password":obj.value},
            success:function(data) {
                $("#msg").empty();
                $("#msg").append(data);
                if(data.length==10){
                    $("#flag").append(1);
                    //alert($("#flag").text());
                }
            }
        });
        return false;
    }

    function fflag() {
        var flag = $("#flag").text();
        if(flag==1)
            return true;
        else
            return false;
    }

    function updatePassword() {
        $.post("${pageContext.request.contextPath }/updatePasswordServlet",$("#edit_Password_form").serialize(),function(data){
            //alert("客户信息更新成功！");
            window.location.reload();
        });
    }
</script>
</html>
