<%@page contentType="text/html; charset=Big5" %>
<%@page pageEncoding="Big5" %>
<%@page import="java.sql.*" %>
<html>
    <head>
        <title>分機號碼結果</title>
    </head>
    <body>
        <h1>分機號碼查詢結果</h1>
        <%
            // 從表單取得輸入的員工姓名
            String employeeName = request.getParameter("name");

            // 確保輸入的名稱不為空
            if (employeeName == null || employeeName.trim().isEmpty()) {
                out.println("<p>未輸入員工姓名，請返回查詢頁面重試。</p>");
            } else {
                try {
                    // 載入 JDBC 驅動程式
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                    // 連線資料庫
                    String url = "jdbc:sqlserver://localhost:1433;databaseName=Northwind;user=sa;password=1234;encrypt=false;";
                    Connection conn = DriverManager.getConnection(url);

                    // 執行 SQL 查詢
                    // 使用 CONCAT 將 LastName 和 FirstName 拼接
                    String sql = "SELECT Extension FROM Employees WHERE CONCAT(LastName, ' ', FirstName) LIKE ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, "%" + employeeName + "%");
                    ResultSet rs = pstmt.executeQuery();

                    // 顯示查詢結果
                    if (rs.next()) {
                        out.println("<p>分機號碼：" + rs.getString("Extension") + "</p>");
                    } else {
                        out.println("<p>找不到對應的分機號碼</p>");
                    }

                    // 關閉連線
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (SQLException e) {
                    out.println("<p>資料庫錯誤：" + e.getMessage() + "</p>");
                } catch (ClassNotFoundException e) {
                    out.println("<p>無法載入 JDBC 驅動程式：" + e.getMessage() + "</p>");
                }
            }
        %>
        <!-- 返回用戶查詢頁按鈕 -->
        <form action="ExtensionSearch.jsp" method="get">
            <button type="submit">返回查詢頁面</button>
        </form>
        <!-- 返回用戶功能頁按鈕 -->
        <form action="../login/accesspage.jsp" method="get">
            <button type="submit">返回用戶功能頁</button>
        </form>
    </body>
</html>
