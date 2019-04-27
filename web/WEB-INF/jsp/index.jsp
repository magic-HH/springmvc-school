<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hh.model.foodSimple" %>
<%@ page import="com.hh.util.countShopingCar" %><%--
  User: HH
  Date: 2019/4/26
  Time: 20:38
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<foodSimple> newfoods= (ArrayList<foodSimple>)request.getAttribute("newfoods");
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
    <title>主页</title>
    <meta name="详情port" content="width=device-width, initial-scale=1.0">
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

    <link rel="stylesheet" href="../css/index1.css">
    <link rel="stylesheet" href="../css/common.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
    <script src="../js/index1.js"></script>
    <script src="../js/common.js"></script>
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
<div id="carouselBlk">
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner bannerWrap1">
            <div class="item active">
                <div class="container">
                    <a href="product?findtext=凉面"><img style="width:100%" src="../themes/images/carousel/1.jpg"
                                                      alt="special offers" /></a>
                </div>
            </div>
            <div class="item">
                <div class="container">
                    <a href="product?findtext=面包"><img style="width:100%" src="../themes/images/carousel/2.jpg" alt="" /></a>
                </div>
            </div>
            <div class="item">
                <div class="container">
                    <a href="product?findtext=烤全羊"><img src="../themes/images/carousel/3.jpg" alt="" /></a>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
</div>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!-- Sidebar ================================================== -->
            <div id="sidebar" class="span3">
                <div class="well well-small"><a id="myCart" href="product_summary"><img src="../themes/images/ico-cart.png"
                                                                                             alt="cart"><%if(username.equals("")){out.print("0");}
                else {
                    out.print(countShopingCar.countnum(userid));
                }%> food in your cart <span class="badge badge-warning pull-right">￥</span></a></div>
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
                <br />



            </div>
            <!-- Sidebar end=============================================== -->
            <div class="span9">
                <div class="well well-small">
                    <h4>推荐产品 <small class="pull-right">推荐产品</small></h4>
                    <div class="row-fluid">
                        <div id="featured" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <ul class="thumbnails">
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <i class="tag"></i>
                                                <a href="product_details?id=b11"><img src="../themes/images/products/b1.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details?id=b11">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <i class="tag"></i>
                                                <a href="product_details"><img src="../themes/images/products/b2.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>盐煎肉</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <i class="tag"></i>
                                                <a href="product_details"><img src="../themes/images/products/b3.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>红烧肉</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <i class="tag"></i>
                                                <a href="product_details"><img src="../themes/images/products/b4.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>生菜</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="item">
                                    <ul class="thumbnails">
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <i class="tag"></i>
                                                <a href="product_details"><img src="../themes/images/products/b5.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>糖醋排骨</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <i class="tag"></i>
                                                <a href="product_details"><img src="../themes/images/products/b1.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>番茄炒蛋</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b2.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b3.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="item">
                                    <ul class="thumbnails">
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b2.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b5.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b1.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b3.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="item">
                                    <ul class="thumbnails">
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b2.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b3.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b4.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="product_details"><img src="../themes/images/products/b5.jpg" alt=""></a>
                                                <div class="caption">
                                                    <h5>鱼香茄子</h5>
                                                    <h4><a class="btn" href="product_details">详情</a> <span
                                                            class="pull-right">￥222.00</span></h4>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                            <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                        </div>
                    </div>
                </div>

                <h4>最新菜品 </h4>
                <ul class="thumbnails">
                    <%for(foodSimple i: newfoods){%>
                    <li class="span3">
                        <div class="thumbnail">
                            <a href="product_details?foodid=<%=i.getFoodid()%>"><img src="<%=i.getImg()%>" alt="" /></a>
                            <div class="caption">
                                <h5><%=i.getName()%></h5>
                                <p>
                                    还解释神马，赶紧下单
                                </p>

                                <h4 style="text-align:center"><a class="btn" href="product_details?foodid=<%=i.getFoodid()%>"> <i
                                        class="icon-zoom-in"></i></a>
                                    <a class="btn" href="add_shoping?foodid=<%=i.getFoodid()%>" >添加 <i
                                        class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">￥<%=i.getPrice()%></a></h4>
                            </div>
                        </div>
                    </li>
                    <%}%>

                </ul>

            </div>
        </div>
    </div>
</div>
<!-- Footer ================================================================== -->
<div id="footerSection"><a href="">8组 制作</a></div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
<script src="../themes/js/jquery.js" type="text/javascript"></script>
<script src="../themes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../themes/js/google-code-prettify/prettify.js"></script>

<script src="../themes/js/bootshop.js"></script>
<script src="../themes/js/jquery.lightbox-0.5.js"></script>

<!-- Themes switcher section ============================================================================================= -->
<div id="secectionBox">
    <link rel="stylesheet" href="../themes/switch/themeswitch.css" type="text/css" media="screen" />
    <script src="../themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
    <div id="themeContainer">
        <div id="hideme" class="themeTitle">Style Selector</div>
        <div class="themeName">Oregional Skin</div>
        <div class="images style">
            <a href="../themes/css/#" name="bootshop"><img src="../themes/switch/images/clr/bootshop.png"
                                                        alt="bootstrap business templates" class="active"></a>
            <a href="../themes/css/#" name="businessltd"><img src="../themes/switch/images/clr/businessltd.png"
                                                           alt="bootstrap business templates" class="active"></a>
        </div>
        <div class="themeName">Bootswatch Skins (11)</div>
        <div class="images style">
            <a href="../themes/css/#" name="amelia" title="Amelia"><img src="../themes/switch/images/clr/amelia.png"
                                                                     alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="spruce" title="Spruce"><img src="../themes/switch/images/clr/spruce.png"
                                                                     alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="superhero" title="Superhero"><img src="../themes/switch/images/clr/superhero.png"
                                                                           alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="cyborg"><img src="../themes/switch/images/clr/cyborg.png"
                                                      alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="cerulean"><img src="../themes/switch/images/clr/cerulean.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="journal"><img src="../themes/switch/images/clr/journal.png"
                                                       alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="readable"><img src="../themes/switch/images/clr/readable.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="simplex"><img src="../themes/switch/images/clr/simplex.png"
                                                       alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="slate"><img src="../themes/switch/images/clr/slate.png"
                                                     alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="spacelab"><img src="../themes/switch/images/clr/spacelab.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="united"><img src="../themes/switch/images/clr/united.png"
                                                      alt="bootstrap business templates"></a>
            <p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>These are just examples and you
                can build your own color scheme in the backend.</small></p>
        </div>
        <div class="themeName">Background Patterns </div>
        <div class="images patterns">
            <a href="../themes/css/#" name="pattern1"><img src="../themes/switch/images/pattern/pattern1.png"
                                                        alt="bootstrap business templates" class="active"></a>
            <a href="../themes/css/#" name="pattern2"><img src="../themes/switch/images/pattern/pattern2.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern3"><img src="../themes/switch/images/pattern/pattern3.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern4"><img src="../themes/switch/images/pattern/pattern4.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern5"><img src="../themes/switch/images/pattern/pattern5.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern6"><img src="../themes/switch/images/pattern/pattern6.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern7"><img src="../themes/switch/images/pattern/pattern7.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern8"><img src="../themes/switch/images/pattern/pattern8.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern9"><img src="../themes/switch/images/pattern/pattern9.png"
                                                        alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern10"><img src="../themes/switch/images/pattern/pattern10.png"
                                                         alt="bootstrap business templates"></a>

            <a href="../themes/css/#" name="pattern11"><img src="../themes/switch/images/pattern/pattern11.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern12"><img src="../themes/switch/images/pattern/pattern12.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern13"><img src="../themes/switch/images/pattern/pattern13.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern14"><img src="../themes/switch/images/pattern/pattern14.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern15"><img src="../themes/switch/images/pattern/pattern15.png"
                                                         alt="bootstrap business templates"></a>

            <a href="../themes/css/#" name="pattern16"><img src="../themes/switch/images/pattern/pattern16.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern17"><img src="../themes/switch/images/pattern/pattern17.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern18"><img src="../themes/switch/images/pattern/pattern18.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern19"><img src="../themes/switch/images/pattern/pattern19.png"
                                                         alt="bootstrap business templates"></a>
            <a href="../themes/css/#" name="pattern20"><img src="../themes/switch/images/pattern/pattern20.png"
                                                         alt="bootstrap business templates"></a>

        </div>
    </div>
</div>
<span id="themesBtn"></span>
</body>

</html>