<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Carts"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>

<%@page import="java.util.List" %>
<%@page import="model.Product" %>
<%@page import="model.Products" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Model List</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>

    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            String code = "";
            if (request.getParameter("category") != null) {
                code = request.getParameter("category");
            }
        %>
        <center>
            <p>
                <font size="3" face="Verdana, Arial, Helvetica, sans-serif">
                    <strong>Model List</strong>
                </font>
            </p>
            <a href="${pageContext.request.contextPath }/cart.jsp" mce_href="${pageContext.request.contextPath }/cart.jsp">View Cart</a>
            <br/><br/>
            <table width="75%" border="1">
                <tr>
                    <%
                        for (Product p : productDAO.getListProductByCategoryi(code)) {
                    %>
                    <td>
                        <form name="modelDetail1" method="POST" action="servlet/CartController">
                            <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                <strong>Model:</strong>
                                <%=p.getName()%>
                            </font>
                            <input type="hidden" name="modelNo" value="<%=p.getName()%>">
                            
                            <p>
                                <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                    <strong>Description:</strong>
                                    <%=p.getDetail()%>
                                </font>
                                <input type="hidden" name="description" value="<%=p.getDetail()%>">
                            </p>
                            <p>
                                <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                    <strong>Quantity:<input type="text" size="2" value="1" name="quantity"></strong>
                                </font>
                            </p>
                            <p>
                                <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                    <strong>Price:</strong>
                                    <%=p.getPrice()%>
                                </font>
                                <input type="hidden" name="price" value="<%=p.getPrice()%>">
                            </p>
                            <input type="hidden" name="action" value="add">
                            <input type="submit" name="addToCart" value="Add To Cart">
                        </form>
                    </td>
                    <%
                        }
                    %>

                    <%
                        for (Product p : productDAO.getListProductByCategoryi(code)) {
                    %>
                    <td>
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
                    </td>
                    <%
                        }
                    %>
                </tr>
            </table>
        </center>
    </body>
</html>