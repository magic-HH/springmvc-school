<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.hh.model.orders" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hh.model.foods" %><%--
  User: HH
  Date: 2019/4/24
  Time: 19:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Statement stmt =  Sql_tool.getCon().createStatement();
//ResultSet data_1 =  stmt.executeQuery("select * from u_f");
//ResultSet data_1 = (ResultSet)request.getAttribute("data_1");
    ArrayList<orders> ordersAll =  (ArrayList<orders>)request.getAttribute("data");
    String level = session.getAttribute("level").toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户管理</title>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../vendor/chart.js/Chart.min.js"></script>
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="../js/sb-admin.min.js"></script>
    <script src="../js/sb-admin-datatables.min.js"></script>
    <script src="../js/sb-admin-charts.min.js"></script>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/order.css">
    <script src="../js/order.js"></script>
    <link rel="stylesheet" href="../css/index.css">
    <script src="../js/index.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="change_msg">用户管理</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="修改用户信息">
                <a class="nav-link" href="change_msg">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">修改信息</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="查看订单">
                <a class="nav-link" href="vieworder">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">查看订单</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="评价">
                <a class="nav-link" href="msgShow">
                    <i class="fa fa-commenting-o" aria-hidden="true"></i>
                    <span class="nav-link-text">消息显示</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="评价">
                <a class="nav-link" href="comment">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">评价</span>
                </a>
            </li>
            <%if(!level.equals("0")){
                out.print("  <li class=\"nav-item\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"评价\">\n" +
                        "                <a class=\"nav-link\" href=\"viewProduct\">\n" +
                        "                    <i class=\"fa fa-fw fa-table\"></i>\n" +
                        "                    <span class=\"nav-link-text\">查看商品</span>\n" +
                        "                </a>\n" +
                        "            </li>");
            }%>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-fw fa-bell"></i>
                    <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">News !</span>
            </span>
                    <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
                </a>
                <div class="dropdown-menu" aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">新消息:</h6>
                    <div class="msg"></div>
                    <script type="text/html" id="newMsg">
                        {{each data val key}}
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i></strong>
              </span>
                            <span class="small float-right text-muted">{{ val.time }}</span>
                            <div class="dropdown-message small">{{ val.text }}</div>
                        </a>
                        {{/each}}
                    </script>

                    <a class="dropdown-item small" href="msgShow">显示全部消息</a>
                </div>
            </li>
            <li style="color: #fff;line-height: 45px;margin-right: 10px">
                ${name}
            </li>
            <li class="nam-item">
                <div class="head-portrait">
                    <%--                    <img src="<%=maps.get("img")%>">--%>
                    <img src="http://school-course-h.oss-cn-hangzhou.aliyuncs.com/img/head.jpg">
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>注销</a>
            </li>
        </ul>
    </div>
</nav>
<div class="content-wrapper">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="change_msg">用户管理</a>
            </li>
            <li class="breadcrumb-item active">查看订单</li>
        </ol>
        <div class="container-fluid">
            <div class="row ">
                <% for(orders o:ordersAll){%>
                <div class="card col-12 userOrder">
                    <div class="card-header"><%=o.getTime()%></div>
                    <%for(foods i:o.getFoodData()){%>
                    <div class="card-body">
                        <div class="wrap">
                            <form action="changeOrderState">
                                <input type="hidden" name="orderid" value="<%=i.getOrderid()%>">
                                <input type="hidden" name="level" value="<%=level%>">
                            <div class="food">
                                <div class="foodImg"><img src="<%=i.getImg()%>" alt=""></div>
                                <div class="foodWrap">
                                    <div class="foodName"><a href=""><%=i.getName()%></a></div>
                                    <div class="foodIntroduce">&nbsp;好评率100%</div>
                                    <%if(level.equals("0")){
                                        switch (i.getState()){
                                            case "1":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：商家确认中..</div>");
                                                break;
                                            case "2":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：商品被商家拒绝</div>");
                                                break;
                                            case "3":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：商家接受订单</div>");
                                                break;
                                            case "4":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：商家发货</div>");
                                                break;
                                            case "5":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已经收货</div>");
                                                break;
                                            case "6":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已经收货/评论</div>");
                                                break;
                                                default:
                                                    break;
                                        }}else{
                                        switch (i.getState()){
                                            case "1":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：等待确认..</div>");
                                                break;
                                            case "2":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已拒绝</div>");
                                                break;
                                            case "3":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已接受</div>");
                                                break;
                                            case "4":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已发货</div>");
                                                break;
                                            case "5":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已经收货</div>");
                                                break;
                                            case "6":
                                                out.print("<div class=\"foodIntroduce\">&nbsp;当前状态：已经收货/评论</div>");
                                                break;
                                            default:
                                                break;
                                        }
                                    }
                                    %>
                                    <div class="foodDtail">
                                        <div class="foodPrice float-left">￥<%=Float.parseFloat(i.getPrice())*Integer.parseInt(i.getAmount())%></div>
                                        <div class="foodSize float-right"><%=i.getAmount()%>份</div>
                                    </div>
                                </div>
                            </div>

                            </div>

                    </div>
                    <div class="card-footer">
                        <button style="width: 120px" class="state  btn btn-primary"  >修改状态</button>
                        </form>
                        <button class="evaluate  btn btn-success" onclick="junpcomment(<%=i.getOrderid()%>)">评价</button>
                    </div>
                    <%}%>
                </div>

                <%}%>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    function junpcomment(oredrid) {
        location.href="comment?oredrid="+oredrid;

    }
    var isShow = true;
    var clickTime = 1;

    function changeState() {
        var v = document.getElementById("passwordShow");
        if (isShow) {
            if (clickTime == 1) {
                v.value = "输入新密码";
            }
            v.type = "text";
            isShow = false;
            clickTime += 1;
        } else {
            v.type = "password";
            isShow = true;
            clickTime += 1;
        }
    }

    function edit() {
        $('#myModal').modal('show');
    }

    function confirms() {
        alert("ti shi");
    }

    // $('#btn-sm11').on('click', function(e){
    //     console.log("bhhh");
    // })

</script>
<style>
    form {
        position: relative;
    }

    .fa-spinner {
        display: none;
        position: absolute;
        right: 155px;
        bottom: 45px;
    }
</style>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">确认修改？</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>验证码</label>
                    <input id="putcaptcha" type="text" name="code" class="form-control">
                    <div style="text-align: right;margin-top: 10px ">
                        <button id="getcaptcha" class="btn btn-success getcaptcha" href="javascript:">获取验证码</button>
                        <i class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="$('#myModal').modal('hide');">取消</button>
                <button type="button" class="btn btn-primary" onclick="save()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    function save() {
        $('#myModal').modal('hide');
        $.ajax({
            dataType: "json",
            url: "change_msg_do",
            data: {
                'id': $("#idShow").val(),
                'name': $("#nameShow").val(),
                'password': $("#passwordShow").val(),
                'local': $("#addressShow").val(),
                'email': $("#emailShow").val(),
                'code': $("#putcaptcha").val()
            },
            success: function (data) {
                if (data == 1) {
                    alert("保存成功!");
                    location.reload();
                } else if (data == '0') {
                    alert("失败!");
                } else if (data == '2') {
                    var getcaptcha = document.getElementById("getcaptcha");
                    getcaptcha.innerText = "验证码错误";
                }
            }
        });

    }

    $(function () {
        $('.getcaptcha').on('click', function () {
            $('.fa-spinner').css('display', 'inline-block');
            $.ajax({
                dataType: "json",
                url: "getCaptcha",
                data: {
                    'email': $("#emailShow").val()
                },
                success: function (data) {
                    $('.fa-spinner').css('display', 'none');
                    if (data == '0') {
                        var getcaptcha = document.getElementById("getcaptcha");
                        getcaptcha.innerText = "获取失败";
                    } else {
                        var getcaptcha = document.getElementById("getcaptcha");
                        getcaptcha.innerText = "获取成功";
                    }
                }
            });
        })
    })

</script>
</body>

</html>
