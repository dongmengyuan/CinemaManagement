<%--
  Created by IntelliJ IDEA.
  User: 样晗
  Date: 2017/12/17
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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
    <style>
        .btn-hollow{
            font-size:14px;
            border:1px solid rgba(59,194,29,.7);
            color:#42c02e!important;
            padding:4px 12px;
            font-weight: 400;
            line-height: normal;
            border-radius: 40px;
            background: none;
        }
        .hide{
            position: absolute;
            display: block!important;
            width: 82px;
            opacity: 0;
        }
    </style>
</head>
<body>
    <jsp:include page="head.jsp"></jsp:include>
    <div id="ww">
    <div align="center">
    <form action="${pageContext.request.contextPath }/updateUserInfo" method="post" enctype="multipart/form-data">

    <input type="hidden" value="${employee.emp_no }" name="emp_no">

    <c:if test="${user.head_path!=null}">
    <img src="<%=basePath %>${user.head_path}" width=100 height=100 />
    <br>
    </c:if>

    <%--<input type="file"  name="head_path" class="file"/>--%>
    <br>

        <a class="btn btn-hollow">
            <input type="file" name="head_path" class="hide">更换头像
        </a>
        <input type="submit" value="修改">
    </form>
    </div>
    </div>
    <div align="center">
    <%--您的安全服务--%>

    <table lay-filter="parse-table-demo">
    <thead>
    </thead>
    <tbody>
    <tr>
    <%--<td>修改密码</td>--%>
    <%--<td>您已设置密码服务</td>--%>
    <td><a href="${pageContext.request.contextPath }/updatePasswordUI" style="color: orange">修改密码</a><td>
    </tr>

    <%--<tr>--%>
    <%--<td>登录邮箱</td>--%>
    <%--<c:if test="${empty employee.emp_email }">--%>
    <%--<td>您未设置邮箱服务</td>--%>
    <%--<td><a href="${pageContext.request.contextPath }/" style="color: red">设置邮箱</a><td>--%>
    <%--</c:if>--%>
    <%--<c:if test="${not empty employee.emp_email }">--%>
    <%--<td>您已设置邮箱服务</td>--%>
    <%--<td><a href="${pageContext.request.contextPath }/" style="color: orange">更换邮箱</a><td>--%>
    <%--</c:if>--%>
    <%--</tr>--%>
    </tbody>
    </table>
    </div>
</body>
</html>
