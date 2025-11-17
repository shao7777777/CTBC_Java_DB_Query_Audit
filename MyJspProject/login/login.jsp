<%@page contentType="text/html" %>
<%@page pageEncoding="Big5" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%
    // 初始化會話屬性
    session.setAttribute("access", "n" );

    // 檢查是否已提交帳號與密碼
    if(request.getParameter("memberid") !=null && request.getParameter("memberpwd")!=null) {
        Statement stmt=null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); String
        connectionUrl="jdbc:sqlserver://localhost:1433;databaseName=NorthWind;user=sa;password=1234;encrypt=false;integratedSecurity=false;";
        Connection con=DriverManager.getConnection(connectionUrl);
        stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String SQL="SELECT * FROM[NorthWind].[dbo].[member] WHERE memberid='" + request.getParameter("memberid") + "' AND memberpwd='" + request.getParameter("memberpwd") + "'" ;
        ResultSet rs=stmt.executeQuery(SQL);

        // 檢查資料庫中是否有符合的帳號和密碼
        if (rs.next()){
            // 登入成功，設定會話屬性
            session.setAttribute("access", "y" );
            session.setAttribute("accessid", request.getParameter("memberid"));
            session.setMaxInactiveInterval(5 * 60); // 設定會話過期時間為 5 分鐘
            response.sendRedirect("accesspage.jsp"); // 重定向到成功頁面
        } else {
            //登入失敗，顯示錯誤信息
            out.println("密碼帳號不符 !!"); }
        }
%>

<html>
    <head>
        <title>登入網頁</title>
    </head>

    <body>
        <form method="post">
            <table border="0" width="500px">
                <tr>
                <td width="890" align="left" colspan="2">
                    <b>
                    <font size="5">系統登入</font>
                    </b>
                    <hr />
                </td>
                </tr>
                <tr>
                <td width="60" align="center">
                    <p align="right">帳號：</p>
                </td>
                <td width="800" align="left">
                    <input type="text" name="memberid"
                    <% if(request.getParameter("memberid") !=null) { %>
                        value='<%= request.getParameter("memberid") %>'
                    <% } %>
                    size="20">
                </td>
                </tr>
                <tr>
                <td width="60" align="center">
                    <p align="right">密碼：</p>
                </td>
                <td width="800" align="left">
                    <input type="password" name="memberpwd"
                        <%
                        if(request.getParameter("memberpwd") !=null) { %>
                            value='<%= request.getParameter("memberpwd") %>'
                        <% } %>
                        size="20">

                </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="登入" name="loginButton" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
