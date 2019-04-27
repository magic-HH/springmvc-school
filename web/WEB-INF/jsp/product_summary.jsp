<%@ page import="com.hh.util.countShopingCar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hh.model.shop" %><%--
  User: HH
  Date: 2019/4/26
  Time: 21:28
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    float countAllprice = 0;
    ArrayList<shop> shoplist = (ArrayList<shop>)request.getAttribute("dataset");
    String username = "";
    String userid = "";
    try{
        username = session.getAttribute("name").toString();
        userid = session.getAttribute("id").toString();
    }catch (NullPointerException e){
        username = "";
        userid = "";
    }

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>用户付款</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap style -->
    <link id="callCss" rel="stylesheet" href="../themes/bootshop/bootstrap.min.css" media="screen" />
    <link href="../themes/css/base.css" rel="stylesheet" media="screen" />
    <!-- Bootstrap style responsive -->
    <link href="../themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="../themes/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Google-code-prettify -->
    <link href="../themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
    <!-- fav and touch icons -->
    <link rel="shortcut icon" href="../themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="../themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="../themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png">
    <style type="text/css" id="enject"></style>

    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
    <link rel="stylesheet" href="../css/product_summary.css">
    <script src="../js/product_summary.js"></script>

</head>

<body>
<div id="header">
    <div class="container">
        <div id="welcomeLine" class="row">
            <%if(username.equals("")){
                out.print("<div class=\"span6\">Welcome!<strong> 用户</strong></div>");
            }
            else {
                out.print("<div class=\"span6\">Welcome!<strong> "+username+"</strong></div>");
            }%>
            <div class="span6">
                <div class="pull-right">
                    <a href="product_summary"><span class="">结账</span></a>
                    <span class="btn btn-mini">￥</span>
                    <a href="product_summary"><span class="btn btn-mini btn-primary"><i
                            class="icon-shopping-cart icon-white"></i> <span class="num"><%if(username.equals("")){out.print("0");}
                    else {
                        out.print(countShopingCar.countnum(userid));
                    }%></span> </span> </a>
                </div>
            </div>
        </div>
        <!-- Navbar ================================================== -->
        <div id="logoArea" class="navbar">
            <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-inner">
                <a class="brand" href="index"><img src="../themes/images/logo.png" alt="Bootsshop" /></a>
                <form class="form-inline navbar-search" method="get" action="product">
                    <input  type="text" name="findtext" value="">

                    <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                </form>
                <ul id="topMenu" class="nav pull-right">
                    <li class="">
                        <% if(username.equals("")){
                            out.print("<a href=\"../backstage/login\" role=\"button\" data-toggle=\"modal\" style=\"padding-right:0\"><span\n" +
                                    "                                class=\"btn btn-large btn-success\">登录</span></a>");
                        }else{
                            out.print("<a href=\"../backstage/msgShow\" role=\"button\" data-toggle=\"modal\" style=\"padding-right:0\"><span\n" +
                                    "                                class=\"btn btn-large btn-success\">"+username+"</span></a>");
                        }
                        %>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Header End====================================================================== -->
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!-- Sidebar ================================================== -->
            <div id="sidebar" class="span3">
                <div class="well well-small"><a id="myCart" href="product_summary"><img src="../themes/images/ico-cart.png"
                                                                                             alt="cart"><%if(username.equals("")){out.print("0");}
                else {
                    out.print(countShopingCar.countnum(userid));
                }%>Items in your cart <span class="badge badge-warning pull-right">￥</span></a></div>
                <ul id="sideManu" class="nav nav-tabs nav-stacked">
                    <li class="subMenu open"><a> 主食</a>
                        <ul>
                            <li><a class="active" href="product?findtext=烤鱼"><i class="icon-chevron-right"></i>烤鱼</a></li>
                            <li><a href="product?findtext=麻辣烫"><i class="icon-chevron-right"></i>麻辣烫</a></li>
                            <li><a href="product?findtext=火锅"><i class="icon-chevron-right"></i>火锅</a></li>
                            <li><a href="product?findtext=串串"><i class="icon-chevron-right"></i>串串</a></li>
                        </ul>
                    </li>
                    <li class="subMenu"><a> 炒菜</a>
                        <ul style="display:none">
                            <li><a href="products"><i class="icon-chevron-right"></i>盐煎肉</a></li>
                        </ul>
                    </li>
                    <li class="subMenu"><a>汤菜</a>
                        <ul style="display:none">
                            <li><a href="products"><i class="icon-chevron-right"></i>水煮鱼</a></li>
                        </ul>
                    </li>
                    <li><a href="products">小吃</a></li>
                </ul>

            </div>
            <!-- Sidebar end=============================================== -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="index">Home</a> <span class="divider">/</span></li>
                    <li class="active"> SHOPPING CART</li>
                </ul>


                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>菜品</th>
                        <th>描述</th>
                        <th>数量/更新</th>
                        <th>单价</th>
                        <th>总价</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%for(shop i:shoplist){%>
                    <tr>
                        <td> <img width="60" src="<%=i.getImg()%>" alt="" /></td>
                        <td><%=i.getName()%><br />一种好吃到爆炸的</td>
                        <td>
                            <div class="input-append"><input type="number" class="span1" style="max-width:34px;" value="<%int snum = Integer.parseInt(i.getNum());out.print(snum);%>"
                                                             id="appendedInputButtons" size="16" type="text">
                                <a href="food-cc?num=<%if(snum-1==0){out.print(-5);}else{out.print(snum-1);}%>&foodsid=<%=i.getFoodsid()%>"><button class="btn " type="button"><i class="icon-minus"></i></button></a>
                                <a href="food-cc?num=<%out.print(snum+1);%>&foodsid=<%=i.getFoodsid()%>" ><button class="btn " type="button"><i class="icon-plus"></i></button></a>
                                <a href="food-cc?num=<%out.print(-5);%>&foodsid=<%=i.getFoodsid()%>" ><button class="btn btn-danger " type="button"><i class="icon-remove icon-white"></i></button></a> </div>
                        </td>
                        <td class="unitPrice">￥<%float sprice = Float.parseFloat(i.getPrice());out.print(sprice); %></td>
                        <td class="foodPrice">￥<% out.print(sprice*snum);countAllprice+= sprice*snum;%></td>
                    </tr>
                    <%}%>

                    <tr>
                        <td colspan="4" style="text-align:right"><strong>总价 </strong></td>
                        <td class="label label-important" style="display:block"> <strong class="foodAllPrice"> ￥<%=countAllprice%> </strong></td>
                    </tr>
                    </tbody>
                </table>
                <a href="index" class="btn btn-large btn-info"><i class="icon-arrow-left"></i> 继续点餐 </a>
                <a href="pay" class="btn btn-large btn-primary pull-right">付款 <i class="icon-arrow-right"></i></a>

            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
<div id="footerSection">
    <a href="" style="text-align: center">8组 制作</a>
</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
<script src="../themes/js/jquery.js" type="text/javascript"></script>
<script src="../themes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../themes/js/google-code-prettify/prettify.js"></script>

<script src="../themes/js/bootshop.js"></script>
<script src="../themes/js/jquery.lightbox-0.5.js"></script>


</body>

</html>