<%@page contentType="text/html" %>
<%@page pageEncoding="Big5" %>
    <%@page import="java.sql.*" %>
        <html>

        <head>
            <title>分機號碼查詢</title>
        </head>

        <body>
            <h1>分機號碼查詢</h1>
            <form action="ExtensionResult.jsp" method="post">
                <label for="name">輸入員工姓名：</label>
                <input type="text" name="name" required>
                <button type="submit">查詢</button>
            </form>
            <br>
            <!-- 返回用戶功能頁按鈕 -->
            <form action="../login/accesspage.jsp" method="get">
                <button type="submit">返回功能頁</button>
            </form>
        </body>

        </html>