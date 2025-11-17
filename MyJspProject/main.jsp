<%@page contentType="text/html;charset=Big5"%>
<%@page pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<html>
    <head>
        <title>主頁</title>
    </head>
    <body>
        <h1>歡迎使用本系統</h1>

        <% if ("true".equals(request.getParameter("logout"))) { %>
            <p>您已成功登出！</p>
        <% } %>

        <nav>
            <ul>
                <%-- 確認是否已登入 --%>
                <%
                    String access = (String) session.getAttribute("access");
                    if ("y".equals(access)) {
                %>
                    <li><a href="./login/accesspage.jsp">進入功能頁</a></li>
                    <li><a href="./login/logout.jsp">登出</a></li>
                <% } else { %>
                    <li><a href="./login/login.jsp">登入</a></li>
                <% } %>
            </ul>
        </nav>
        <style>
            ul {
                padding-left: 0;
            }

            li {
                list-style: none;
            }
        </style>


        <!-- 訪問計數器 -->
        <%
            ServletContext context = getServletContext();
            Integer counter = (Integer) context.getAttribute("counter");
            if (counter == null) {
                counter = 0;
            }
            counter++;
            context.setAttribute("counter", counter);
        %>
        <p>本頁面已被訪問次數：<%= counter %></p>

    </body>
</html>
