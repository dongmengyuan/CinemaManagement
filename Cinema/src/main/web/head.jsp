
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<a href="${pageContext.request.contextPath}/LoginOutServlet" style="float: right">&nbsp;<span class="fa fa-sign-out" aria-hidden="true"> </span> 退出</a>
<a href="${pageContext.request.contextPath }/findEmployeeByNo?emp_no=${user.emp_no }" style="float: right"><span class="fa fa-user" aria-hidden="true"> </span> 你好,${user.emp_no} </a>


<p style="font-size: 40px;text-align: center;margin: 20px;font-family: 'AR PL UKai TW MBE'">FZN影院管理系统</p>

<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <ul class="nav navbar-nav navbar-left">
                <div class="navbar-header" id="too">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a href="${pageContext.request.contextPath}/findAllEmployeeServlet?currPage=1">员工管理</a></li>
                    </ul>
                </div>
            </ul>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath }/findStudioAllServlet">演出厅管理</a></li>
                <li><a href="./seat.jsp">座位管理</a></li>
                <li><a href="${pageContext.request.contextPath }/findUserAllServlet">用户管理</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
