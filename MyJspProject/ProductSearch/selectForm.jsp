<%@page contentType="text/html;charset=Big5" %>
    <%@page import="java.sql.*" %>
        <html>

        <head>
            <title>產品查詢主畫面</title>
        </head>

        <body>
            <h1>查詢產品</h1>
            <form action="resultForm.jsp" method="post">
                <label for="name">請選擇產品：</label>
                <select name="name" id="name">
                    <% Connection con=null; PreparedStatement pstmt=null; ResultSet rs=null; try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); String
                        connectionUrl="jdbc:sqlserver://localhost:1433;databaseName=NorthWind;user=sa;password=1234;encrypt=false;integratedSecurity=false;"
                        ; con=DriverManager.getConnection(connectionUrl); String
                        sql="SELECT [ProductName] FROM [NorthWind].[dbo].[Products]" ; pstmt=con.prepareStatement(sql);
                        rs=pstmt.executeQuery(); while (rs.next()) { String productName=rs.getString("ProductName");
                        out.println("<option value='" + productName + "'>" + productName + "</option>");
                        }
                        } catch (Exception e) {
                        e.printStackTrace();
                        } finally {
                        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
                        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                        try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
                        }
                        %>
                </select>
                <br><br>
                <input type="submit" value="查詢產品">
            </form>
            <form action="../login/accesspage.jsp" method="get">
                <button type="submit">返回用戶功能頁</button>
            </form>
        </body>

        </html>