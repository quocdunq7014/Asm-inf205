<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Carts"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>

<%@page import="java.util.List" %>
<%@page import="model.Product" %>
<%@page import="model.Products" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="a.png"/>
        <script src="js/hien.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
            html, body {
                height: 100%;
                width: 100%;
                padding: 0;
                margin: 0;
            }
            tr:hover {
                background-color: #006666;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: center;
                margin: 0 auto;
            }
            th {
                color: black;
                height: 40px;
                border-bottom: 1px solid #ddd;
                font-size: 20px;
            }
            td {
                height: 30px;
                vertical-align: bottom;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                color: white;
            }
            h1{
                margin-left: 610px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Floral HTML CSS Template</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="templatemo_style.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="css/orman.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

        <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/ddsmoothmenu.js">

            /***********************************************
             * Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
             ***********************************************/

        </script>

        <script type="text/javascript">

            ddsmoothmenu.init({
                mainmenuid: "templatemo_menu", //menu DIV id
                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })

            function clearText(field)
            {
                if (field.defaultValue == field.value)
                    field.value = '';
                else if (field.value == '')
                    field.value = field.defaultValue;
            }

        </script>

        <link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" /> 
        <script type="text/JavaScript" src="js/slimbox2.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <script src="js/jquery-3.2.1.js" ></script>
        <!-- JS tạo nút bấm di chuyển trang start -->
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
        <!-- JS tạo nút bấm di chuyển trang end -->
        <script type="text/javascript">
            $(function () {
                var pageSize = 10; // Hiển thị 6 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = 90; // Tổng số sản phẩm hiển thị
                var btnPage = 4; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize);

                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        /* console.info(page); */
                        showPage(page);
                    }
                });
                /*console.info(obj.data());*/
            });
        </script>
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
        %>
        <%
            ProductDAO productDAO = new ProductDAO();
            String code = "";
            if (request.getParameter("category") != null) {
                code = request.getParameter("category");
            }
        %>
        <div id="templatemo_wrapper_h">
            <div id="templatemo_header_wh">
                <div id="templatemo_header" class="header_home">
                    <div id="site_title"><a href="index.jsp">Floral Shop</a></div>
                    <div id="templatemo_menu" class="ddsmoothmenu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/index.jsp" class="selected">Home</a></li>
                            <li><a href="about.jsp">About</a></li>
                            <li><a href="${pageContext.request.contextPath}/products.jsp">Products</a>
                                <ul>
                                    <%
                                        for (Category c : categoryDAO.getListCategory()) {
                                    %>    
                                    <li><a href="product.jsp?category=<%=c.getCategoryID()%>"><%= c.getCategoryName()%></a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li>
                            <li><a href="cart.jsp">Cart</a></li>
                            <li><a href="${pageContext.request.contextPath}/customer.jsp">Customer</a></li>
                            <li><a href="${pageContext.request.contextPath}/ControllerCustomers?action=Logout">
                                    <%
                                        if (session.getAttribute("USER") != null) {
                                            out.print("Logout");
                                        } else {
                                            out.print("Login");
                                        }
                                    %>
                                </a></li>

                            <li><a href="signup.jsp">Sign Up</a></li>
                            <li><a>Hello: <span>${USER}</span></a></li>
                        </ul>
                        <div id="templatemo_search">
                            <form action="ControllerProducts" method="get">
                                <input type="text" value="" name="txtTenSP" id="keyword" title="keyword" 
                                       onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" placeholder="Search name" />
                                <input type="submit" name="action" value="Search" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
                            </form>
                        </div>
                        <br style="clear: left" />
                    </div> <!-- end of templatemo_menu -->

                    <div class="slider-wrapper theme-orman">
                        <div class="ribbon"></div>
                        <div id="slider" class="nivoSlider">
                            <img src="images/portfolio/01.jpg" alt="slider image 1" />
                            <a href="#">
                                <img src="images/portfolio/02.jpg" alt="slider image 2"/>
                            </a>
                            <img src="images/portfolio/03.jpg" alt="slider image 3" />
                            <img src="images/portfolio/04.jpg" alt="slider image 4"/>
                            <img src="images/portfolio/05.jpg" alt="slider image 5"/>
                        </div>
                        <div id="htmlcaption" class="nivo-html-caption">
                            <strong>Example</strong> caption with <a href="http://dev7studios.com" rel="nofollow">a credit link</a> for <em>this slider</em>.
                        </div>
                    </div> 
                    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
                    <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
                    <script type="text/javascript">
                                           $(window).load(function () {
                                               $('#slider').nivoSlider({
                                                   controlNav: false
                                               });
                                           });
                    </script>
                </div> <!-- END of header -->
            </div> <!-- END of header wrapper -->
            <div id="templatemo_main_wrapper">
                <div id="templatemo_main">
                    <div id="sidebar" class="left">
                        <div class="sidebar_box"><span class="bottom"></span>
                            <h3>Categories</h3>   
                            <div class="content"> 
                                <ul class="sidebar_list">

                                    <%
                                        for (Category c : categoryDAO.getListCategory()) {
                                    %>    
                                    <li><a href="product.jsp?category=<%=c.getCategoryID()%>"><%= c.getCategoryName()%></a></li>
                                        <%
                                            }
                                        %>

                                </ul>
                            </div>
                        </div>
                        <div class="sidebar_box"><span class="bottom"></span>
                            <h3>Weekly Special</h3>   
                            <div class="content special"> 
                                <img src="images/templatemo_image_01.jpg" alt="Flowers" />
                                <a href="#">OPPO F1S</a>
                                <p>
                                    Price:
                                    <span class="price normal_price">$160</span>&nbsp;&nbsp;
                                    <span class="price special_price">$100</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div id="content" class="right">
                        <h2>Products</h2>
                        <ul id="pagination"></ul>
                        <%
                            for (Product p : productDAO.getListProductByCategoryi(code)) {
                        %>
                        <div class="contentPage">
                            <form name="modelDetail1" method="POST" action="servlet/CartController">
                                <div class="product_box">
                                    <img src="<%=p.getImage()%>" alt="<%=p.getName()%>" width="165" height="165" />
                                    <h3><%=p.getName()%><input type="hidden" name="modelNo" value="<%=p.getName()%>"></h3>
                                    <p class="product_price">$<%=p.getPrice()%></p>
                                    <input type="hidden" name="price" value="<%=p.getPrice()%>">
                                    <input type="hidden" name="description" value="<%=p.getDetail()%>">
                                    <input type="text" size="2" value="1" name="quantity">
                                    <p class="add_to_cart">
                                        <a href="detail.jsp?code=<%=p.getCode()%>">Detail</a>
    <!--                                    <a href="CartServlet?command=plus&code=<%=p.getCode()%>">Add to Cart</a>-->
                                        <input type="hidden" name="action" value="add">
                                        <input type="submit" name="addToCart" value="Add To Cart">                                
                                    </p>
                                </div>
                            </form>
                        </div>
                        <%
                            }
                        %>

                        <br/>
                        <form action="ControllerCartBean">
                            <input type="submit" name="action" value="View Cart"/>
                        </form>
                        <br/><br/> 
                        <div class="blank_box">
                            <a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
                        </div>    
                    </div>
                    <div class="cleaner"></div>
                </div> <!-- END of main -->
            </div> <!-- END of main wrapper -->

            <div id="templatemo_footer_wrapper">
                <div id="templatemo_footer">
                    <div class="footer_left">
                        <a href="#"><img src="images/1311260370_paypal-straight.png" alt="Paypal" /></a>
                        <a href="#"><img src="images/1311260374_mastercard-straight.png" alt="Master" /></a>
                        <a href="#"><img src="images/1311260374_visa-straight.png" alt="Visa" /></a>
                    </div>
                    <div class="footer_right">
                        <p><a href="index.jsp">Home</a> | <a href="products.jsp">Products</a> | <a href="about.jsp">About</a> | <a href="customer.jsp">Customer</a> | <a href="login.jsp">Login</a> | <a href="signup.jsp">Register</a></p>
                        <p>Copyright © 2084 <a href="#">PS04600</a></p>
                    </div>
                    <div class="cleaner"></div>
                </div> <!-- END of footer -->
            </div> <!-- END of footer wrapper -->
        </div>
    </body>
</html>
