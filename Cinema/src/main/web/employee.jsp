<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>employee</title>
</head>
<body >
<jsp:include page="head.jsp"></jsp:include>
<div id="center">
    <form action="${pageContext.request.contextPath}/findAllEmployeeServlet?currPage=1" method="post">
        <input type="text" placeholder="search" style="border-radius: 5px;height: 30px;" name="keywords" value="${keywords}">
        <!--<img src="./image/搜索.jpg" width="30px" height="30px">-->
       <input type="submit">
    </form>
</div>
<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float: right;margin: 5px;">添加
</button>
<div id="ww">
    <table class="table table-hover" id="ss" onclick="find(this)">
        <thead>
        <tr>
            <th style='text-align: center;width: 12%;'>id</th>
            <th style='text-align: center;width: 12%;'>编号</th>
            <th style='text-align: center;width: 12%;'>姓名</th>
            <th style='text-align: center;width: 17%;'>电话</th>
            <th style="text-align: center;width: 15%;">住址</th>
            <th style="text-align: center;width: 21%;">邮箱</th>
            <th style="text-align: center;width: 21%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.list }" var="employee" >
            <tr>
                <td>${employee.emp_id}</td>
                <td>${employee.emp_no}</td>
                <td>${employee.emp_name}</td>
                <td>${employee.emp_tel_num}</td>
                <td>${employee.emp_addr}</td>
                <td>${employee.emp_email}</td>
                <td>
                    <button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="editEmployee(${employee.emp_id})"
                            style="float: right;margin: 5px;">编辑
                    </button>
                    <button class="btn btn-danger" onclick="deleteEmployee(${employee.emp_id})" style="float: right;margin: 5px;">删除</button>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--<button class="btn btn-danger" onclick="del(this)" style="float: right;margin: 5px;">删除</button>--%>

    <%--<button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="model(this)"
            style="float: right;margin: 5px;">编辑
    </button>--%>
    <div style="width:380px;margin:0 auto;margin-top:50px;">
        <ul class="pagination" style="text-align:center; margin-top:10px;">
            <!-- 判断当前是否为首页 -->
            <c:if test="${pageBean.currPage==1 }">
                <li class="disabled"><a href="javascript:void(0)">首页</a></li>
                <li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                </li>
            </c:if>

            <c:if test="${pageBean.currPage!=1 }">
                <li><a href="${pageContext.request.contextPath }/findAllEmployeeServlet?currPage=1&keywords=${keywords}">首页</a></li>
                <li ><a href="${pageContext.request.contextPath }/findAllEmployeeServlet?currPage=${pageBean.currPage-1 }&keywords=${keywords}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                </li>
            </c:if>


            <!-- 判断是否为当前页 -->
            <c:forEach begin="${pageBean.currPage-5>0?pageBean.currPage-5:1 }" end="${pageBean.currPage+4>pageBean.totalPage?pageBean.totalPage:pageBean.currPage+4 }" var="n">
                <c:if test="${pageBean.currPage==n }">
                    <li class="active"><a href="javascript:void(0)">${n }</a></li>
                </c:if>
                <c:if test="${pageBean.currPage!=n }">
                    <li><a href="${pageContext.request.contextPath }/findAllEmployeeServlet?currPage=${n }&keywords=${keywords}">${n }</a></li>
                </c:if>
            </c:forEach>


            <!-- 判断是否为最后一页 -->
            <c:if test="${pageBean.currPage==pageBean.totalPage }">
                <li class="disabled">
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <li class="disabled"><a href="javascript:void(0)">末页</a></li>
            </c:if>

            <c:if test="${pageBean.currPage!=pageBean.totalPage }">
                <li >
                    <a href="${pageContext.request.contextPath }/findAllEmployeeServlet?currPage=${pageBean.currPage+1 }&keywords=${keywords}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <li><a href="${pageContext.request.contextPath }/findAllEmployeeServlet?currPage=${pageBean.totalPage }&keywords=${keywords}">末页</a></li>
            </c:if>
        </ul>
    </div>
    <!-- 分页结束=======================        -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" style="width:30%;padding:10px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4>添加员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="add_employee_form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">编号:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="number"
                                              required="required"  name="emp_no" onblur="checkNum('number')"></label>
                                <label><span id="1" style="color:red;"></span></label>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="name"
                                              required="required"  name="emp_name" onblur="checkName('name')"></label>
                                <label><span id="2" style="color:red;"></span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话:</label>

                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="tel"
                                              required="required"  name="emp_tel_num" onblur="checkTel('tel')"></label>
                                <label><span id="3" style="color:red;"></span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">住址:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="addr"
                                              required="required"  name="emp_addr" onblur="checkAddr('addr')"></label>
                                <label><span id="4" style="color:red;"></span></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">邮箱:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="emil"
                                              required="required"  name="emp_email" onblur="checkEmil('emil')" ></label>
                                <label><span id="5" style="color:red;"></span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <p id="6" style="color:red;text-align: center;"></p>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="add" class="btn btn-primary" onclick="addEmployee()">添加</button>
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
                    <form class="form-horizontal" role="form" id="edit_employee_form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">id:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_employee_id" name="emp_id"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">编号:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_employee_no" name="emp_no"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_employee_name" name="emp_name"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_employee_tel_num" name="emp_tel_num"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">住址:</label>

                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_employee_addr" name="emp_addr"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">邮箱:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_employee_email" name="email"></label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"
                            onclick="save()">保存
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function editEmployee(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/editEmployeeServlet",
            data:{"id":id},
            success:function(data) {
                $("#edit_employee_id").val(data.emp_id);
                $("#edit_employee_no").val(data.emp_no);
                $("#edit_employee_name").val(data.emp_name);
                $("#edit_employee_tel_num").val(data.emp_tel_num);
                $("#edit_employee_addr").val(data.emp_addr);
                $("#edit_employee_email").val(data.emp_email);
            }
        });
    }

    function save() {
        $.post("${pageContext.request.contextPath }/updateEmployeeServlet",$("#edit_employee_form").serialize(),function(data){
            //alert("客户信息更新成功！");
            window.location.reload();
        });
    }

    function addEmployee() {
        if(checkAll()){
            $.post("${pageContext.request.contextPath }/addEmployeeServlet",$("#add_employee_form").serialize(),function(data){
                //alert("客户信息更新成功！");
                window.location.reload();
            });
        }
        else{
            document.getElementById('6').innerText='请填写必要信息';
        }

    }

    function deleteEmployee(id) {
        if(confirm('确实要删除吗?')) {
            $.post("${pageContext.request.contextPath }/deleteEmployeeServlet",{"id":id},function(data){
                //alert("删除更新成功！");
                window.location.reload();
            });
        }
    }
</script>
</html>
