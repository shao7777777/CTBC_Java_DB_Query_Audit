<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>

<html>
    <head><title>登出</title></head>
    <body>
    <%
        // 確認用戶是否已登入
        if ("y".equals(session.getAttribute("access"))) {
            session.invalidate();  // 使會話無效，登出
            out.println("您已成功登出 !! <br>");
            out.println("<a href='../login/login.jsp'> 重新登入 </a>");  // 提供登入頁面鏈接
            out.println("<a href='../main.jsp'> 返回主頁 </a>");  // 提供主頁鏈接
        } else {
            // 若未登入，重定向回登入頁面
            response.sendRedirect("login.jsp");
        }
    %>
    </body>
</html>