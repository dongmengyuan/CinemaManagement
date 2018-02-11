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
            <th style='text-align: center;width:10%;'>id</th>
            <th style='text-align: center;width:15%;'>名称</th>
            <th style='text-align: center;width:10%;'>行</th>
            <th style='text-align: center;width:10%;'>列</th>
            <th style="text-align: center;width:20%;">描述</th>
            <th style="text-align: center;width:10%;">状态</th>
            <th style="text-align: center;width:25%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${studioList }" var="studio" >
            <tr>
                <td>${studio.studio_id}</td>
                <td>${studio.studio_name}</td>
                <td>${studio.studio_row_count}</td>
                <td>${studio.studio_col_count}</td>
                <td>${studio.studio_introduction}</td>
                <td>
                    <c:if test="${studio.studio_flag==1 }">可用</c:if>
                    <c:if test="${studio.studio_flag!=1 }">不可用</c:if>
                </td>

                <td>
                    <button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="editStudio(${studio.studio_id})"
                            style="float: right;margin: 5px;">编辑
                    </button>

                    <button class="btn btn-danger" onclick="deleteStudio(${studio.studio_id})" style="float: right;margin: 5px;">删除</button>

                    <button class="btn btn-danger" onclick="ToSeat(${studio.studio_id},${studio.studio_row_count},${studio.studio_col_count})" style="float: right;margin: 5px;">生成座位</button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
   <%-- <button class="btn btn-danger" onclick="del(this)" style="float: right;margin: 5px;">删除</button>--%>

 <%--   <button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="model(this)"
            style="float: right;margin: 5px;">编辑
    </button>--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" style="width:30%;padding:10px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4>添加演出厅</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="add_studio_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名称:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="name"
                                              name="studio_name"  required="required" onblur="checkName()"></label>
                                <span id="1" style="color:red;"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">行:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="row"
                                              name="studio_row_count" required="required" onblur="checkRow()"></label>
                                <label><span id="2" style="color:red;"></span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">列:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="col"
                                              name="studio_col_count" required="required" onblur="checkCol()"></label>
                                <label><span id="3" style="color:red;"></span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">描述:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="introduction" name="studio_introduction" required="required" onblur="checkIntroduction()">
                                </label>
                                <label><span id="4" style="color:red;"></span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">演出厅状态</label>
                            <div class="col-sm-9">
                                <select name="studio_flag" >
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <p id="5" style="color:red;text-align: center;"></p>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="add"
                            onclick="addStudio()">添加
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
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">id:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_studio_id" name="studio_id"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名称:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_studio_name" name="studio_name"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">行:</label>
                            <div class="col-sm-8">
                                <label><input disabled="disabled" type="text" class="form-control" id="edit_studio_row" name="studio_row_count"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">列:</label>
                            <div class="col-sm-8">
                                <label><input disabled="disabled" type="text" class="form-control" id="edit_studio_col" name="studio_col_count"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">描述:</label>
                            <div class="col-sm-8">
                                <label><input type="text" class="form-control" id="edit_studio_intr" name="studio_introduction"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">演出厅状态</label>
                            <div class="col-sm-9">
                                <select name="studio_flag" id="edit_studio_flag">
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"
                            onclick="updateStudio()">保存
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function editStudio(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/editStudioServlet",
            data:{"id":id},
            success:function(data) {
                $("#edit_studio_id").val(data.studio_id);
                $("#edit_studio_name").val(data.studio_name);
                $("#edit_studio_row").val(data.studio_row_count);
                $("#edit_studio_col").val(data.studio_col_count);
                $("#edit_studio_intr").val(data.studio_introduction);
                $("#edit_studio_flag").val(data.studio_flag);
            }
        });
    }

    function updateStudio() {

            $.post("${pageContext.request.contextPath }/updateStudioServlet",$("#edit_studio_form").serialize(),function(data){
                //alert("客户信息更新成功！");
                window.location.reload();
            });


    }

    function deleteStudio(id) {
        if(confirm('确实要删除吗?')) {
            $.post("${pageContext.request.contextPath }/deleteStudioServlet",{"id":id},function(data){
                //alert("删除更新成功！");
                window.location.reload();
            });
        }
    }
    function ToSeat(id,row,col) {
        $.post("${pageContext.request.contextPath }/addSeatServlet",{"id":id,"row":row,"col":col},function(data){
            alert(data);
            //window.location.reload();
            //window.location.href="${pageContext.request.contextPath }/seat.jsp";
        });
    }
    function addStudio() {
        if(checkAll()){
        $.post("${pageContext.request.contextPath }/addStudioServlet",$("#add_studio_form").serialize(),function(data){
            //alert("客户信息更新成功！");
            window.location.reload();
        });
        }
        else{
            document.getElementById('5').innerText='请填写必要字段';
        }
    }

</script>
</html>
