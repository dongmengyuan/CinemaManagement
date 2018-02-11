<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="./view/system_manager/jquery/jq.js"></script>
    <script src="./view/system_manager/jquery/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./view/system_manager/Bootstrap/bs.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/system_manager/css/jquery.seat-charts.css">
    <link rel="stylesheet" href="./view/system_manager/css/style.css">
    <link rel="stylesheet" href="./view/system_manager/css/manage.css">
    <link rel="stylesheet" href="./view/system_manager/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="display.css">
    <script src="${pageContext.request.contextPath}/view/system_manager/javascript/seat.js"></script>
    <title>seat</title>
</head></head>
<body onload="findAllStudio()">
<jsp:include page="head.jsp"></jsp:include>
<div id="tab" style="margin: 5px;">
    <ul id="myTab" class="nav nav-tabs">
    </ul>
    <div id="seat">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="seat1" style="margin-left: 50px">
                <div class="wrapper">
                    <div class="container">
                        <div id="seat-map">
                            <div class="front-indicator">Front</div>
                        </div>
                        <div class="booking-details">

                            <div id="legend"></div>
                            <button class="btn btn-primary" onclick='submit()'>保存</button>
                        </div>
                    </div>
                </div>
            </div>
            <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
            <script src="./view/system_manager/javascript/jquery.seat-charts.js"></script>
            <script>
                var rowAndcol = 0;
                var rowAndcol1 = 0;
                var firstSeatLabel = 1;
                var seat = ${seat};
                var count = 0;
                var url="";
                var destory = [];
                map = [];
                for(var i=0;i<${studio.studio_row_count};i++){
                    map[i]="";
                    for(var j=0;j<${studio.studio_col_count};j++){
                        //map[i]+="e";
                        if(seat[rowAndcol++].seat_status==1)
                            map[i]+="e";
                        else{
                            map[i]+="f";
                            var s = rowAndcol-1;
                            destory[count++]=seat[s].seat_id+"";
                            count++;
                        }

                    }
                }
                $(document).ready(function () {
                    var $cart = $('#selected-seats'),
                        sc = $('#seat-map').seatCharts({
                            map: map,
                            seats: {
                                f: {
                                    classes: 'first-class',
                                    category: 'First Class'
                                },
                                e: {
                                    classes: 'economy-class',
                                    category: 'Economy Class'
                                }
                            },
                            naming: {
                                top: false,
                                getLabel: function (character, row, column) {
                                       return firstSeatLabel++;
                                   },
                                getId  : function(character, row, column) {
                                    //alert(character);

                                    return getSeatId(row,column);
                                },
                            },
                            legend: {
                                node: $('#legend'),
                                items: [
                                    ['e', 'available', '正常'],
                                    ['f', 'unavailable', '损坏'],
                                    ['g', 'selected','选中座位']
                                ]
                            },
                            click: function () {
                                if (this.status() == 'available') {
                                    url+=this.settings.id+"-";
                                    console.log(url);
                                    return 'selected';
                                }
                                else if (this.status() == 'selected') {
                                    var i = url.indexOf(this.settings.id);
                                    var order = url.substring(i,url.indexOf("-",i)+1);
                                    console.log(order)
                                    var len = order.length;
                                    var pre = url.substring(0,i);
                                    console.log(pre);
                                    var post = url.substring(i+len,url.length);
                                    console.log(post);
                                    url = pre+post;
                                    console.log(url);
                                    return 'available';
                                }
                                else if (this.status() == 'clear') {
                                    return 'available'
                                }
                                else {
                                    return this.style();
                                }
                            }
                        });
                    sc.get(destory).status('unavailable');
                });
                function submit() {
                    $.post("${pageContext.request.contextPath }/updateSeatServlet",{"ids":url},function(data){
                       alert(data);
                        window.location.reload();
                    });
                }
                function getSeatId(row,col) {
                    for(var i=0;i<${studio.studio_row_count};i++){
                        for(var j=0;j<${studio.studio_col_count};j++){
                            if(seat[rowAndcol1].seat_row==row&&seat[rowAndcol1].seat_column==col){
                                return seat[rowAndcol1].seat_id;
                            }
                            rowAndcol1++;
                        }
                    }
                }
            </script>
        </div>
    </div>

</div>

</body>
<script type="text/javascript">
    function findAllStudio() {
        $.post("${pageContext.request.contextPath }/findStudioServlet",function(data){
            for(i=0;i<data.length;i++){
                $("#myTab").append("<li class=\"active\"> <a href=\"${pageContext.request.contextPath}/seatServlet?id="+data[i].studio_id+"\" >"+data[i].studio_name+"  </a> </li>")
            }
        });
    }
</script>
</html>
