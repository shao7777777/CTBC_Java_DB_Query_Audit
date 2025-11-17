<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>

<%
    // 確認是否已登入
    String access = (String) session.getAttribute("access");
    String accessid = (String) session.getAttribute("accessid");

    if (!"y".equals(access)) {
        // 未登入，返回主頁並顯示提示
        response.sendRedirect("main.jsp?logout=true");
        return;
    }
%>
<html>
    <head>
        <title><%= accessid %>您好</title>
    </head>
        <h1><%= accessid %>您好，歡迎使用下方功能</h1>
        <p>請選擇下方功能：</p>
        <nav>
            <ul>
                <li><a href="../ExtensionSetting/ExtensionSearch.jsp">分機查詢</a></li>
                <li><a href="../ProductSearch/selectForm.jsp">產品查詢</a></li>
            </ul>
        </nav>
        <a href="../main.jsp">返回主頁</a>
        <br></br>
        <form action="../login/logout.jsp" method="post">
            <button type="submit">登出</button>
        </form>
    </body>
</html>
