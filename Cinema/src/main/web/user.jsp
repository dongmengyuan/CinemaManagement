<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:15
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
    <script src="./view/system_manager/jquery/bootstrap.min.js"></script>
    <script src="./view/system_manager/javascript/employee.js"></script>
    <link rel="stylesheet" href="./view/system_manager/Bootstrap/bs.css">
    <link rel="stylesheet" href="./view/system_manager/css/manage.css">
    <link rel="stylesheet" href="./view/system_manager/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="display.css">

    <title>stdio</title>
</head>
<body onload="selectEmpno()">
<jsp:include page="head.jsp"></jsp:include>
<div id="center">
    <input type="text" placeholder="search" style="border-radius: 5px;height: 30px;">
    <!--<img src="./image/搜索.jpg" width="30px" height="30px">-->
    <button class="fa fa-search" style="width: 25px;height:25px;"></button>
</div>
<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float: right;margin: 5px;">添加
</button>
<div id="ww">
    <table class="table table-hover" id="stdio" onclick="find(this)">
        <thead>
        <tr>
            <th style='text-align: center;width:25%;'>用户编号</th>
            <th style='text-align: center;width:25%;'>用户类型</th>
            <th style='text-align: center;width:25%;'>用户头像</th>
            <th style='text-align: center;width:25%;'>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="user">
            <tr>
                <td  class="a">${user.emp_no }</td>

                <c:if test="${user.type==1 }">
                    <td  class="a">超级管理员</td>
                </c:if>

                <c:if test="${user.type==0 }">
                    <td  class="a">普通用户</td>
                </c:if>

                <c:if test="${user.head_path!=null}">
                    <td><img src="<%=basePath %>${user.head_path}" width=100 height=100 /></td>
                </c:if>

                <td>
                    <button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="editUser(${user.emp_no })"
                            style="float: right;margin: 5px;">编辑
                    </button>
                    <button class="btn btn-danger" onclick="deleteUser('${user.emp_no }')" style="float: right;margin: 5px;">删除</button>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" style="width:30%;padding:10px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4>添加用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="edit_user_form">
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户编号</label>
                            <div class="col-sm-9">
                                <select name="emp_no" lay-verify="" id="select">
                                    <option value="">请选择</option>

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户级别</label>
                            <div class="col-sm-9">
                                <select name="type" id="edit_user_type">
                                    <option value="1">超级管理员</option>
                                    <option value="0">普通用户</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="add"
                            onclick="addUser()">添加
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" style="width:30%;padding:10px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4>编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="add_user_form">
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户编号</label>
                            <div class="col-sm-9">
                                <label><input type="text" class="form-control" id="add_emp_no"
                                              required="required"  name="emp_name"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户级别</label>
                            <div class="col-sm-9">
                                <select name="type" id="add_user_type">
                                    <option value="1">超级管理员</option>
                                    <option value="0">普通用户</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"
                            onclick="save(this)">保存
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function selectEmpno() {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/selectEmpnoServlet",
            success:function(data) {
                for (var i = 0; i < data.length; i++) {
                    $("#select").append("<option value="+data[i].emp_no+">"+data[i].emp_no+"</option>");
                }
            }
        });
    }
    function addUser() {
        $.post("${pageContext.request.contextPath }/addUserServlet",$("#edit_user_form").serialize(),function(data){
            //alert("客户信息更新成功！");
            window.location.reload();
        });
    }

    function deleteUser(id) {
        if(confirm('确实要删除吗?')) {
            $.post("${pageContext.request.contextPath }/deleteUserServlet",{"id":id},function(data){
                //alert("客户信息更新成功！");
                window.location.reload();
            });
        }
    }
</script>
</html>
