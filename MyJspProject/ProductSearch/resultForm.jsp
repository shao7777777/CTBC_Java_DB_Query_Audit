<%@page contentType="text/html;charset=Big5" %>
    <%@page import="java.sql.*" %>
        <html>

        <head>
            <title>產品查詢結果</title>
        </head>

        <body>
            <h1>產品查詢結果</h1>
            <% Connection con=null; PreparedStatement pstmt=null; ResultSet rs=null; try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); String
                connectionUrl="jdbc:sqlserver://localhost:1433;databaseName=NorthWind;user=sa;password=1234;encrypt=false;integratedSecurity=false;"
                ; con=DriverManager.getConnection(connectionUrl); String name=request.getParameter("name"); String
                sql="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued] FROM [NorthWind].[dbo].[Products] WHERE [ProductName] = ?"
                ; pstmt=con.prepareStatement(sql); pstmt.setString(1, name); rs=pstmt.executeQuery(); if (rs.next()) {
                %>
                <p><strong>產品名稱：</strong>
                    <%= rs.getString("ProductName") %>
                </p>
                <ul>
                    <li><strong>產品 ID：</strong>
                        <%= rs.getInt("ProductID") %>
                    </li>
                    <li><strong>供應商 ID：</strong>
                        <%= rs.getInt("SupplierID") %>
                    </li>
                    <li><strong>類別 ID：</strong>
                        <%= rs.getInt("CategoryID") %>
                    </li>
                    <li><strong>包裝方式：</strong>
                        <%= rs.getString("QuantityPerUnit") %>
                    </li>
                    <li><strong>單價：</strong>
                        <%= rs.getDouble("UnitPrice") %>
                    </li>
                    <li><strong>庫存單位：</strong>
                        <%= rs.getInt("UnitsInStock") %>
                    </li>
                    <li><strong>訂購數量：</strong>
                        <%= rs.getInt("UnitsOnOrder") %>
                    </li>
                    <li><strong>補貨水平：</strong>
                        <%= rs.getInt("ReorderLevel") %>
                    </li>
                    <li><strong>是否停產：</strong>
                        <%= rs.getBoolean("Discontinued") ? "是" : "否" %>
                    </li>
                </ul>
                <% } else { %>
                    <p style="color: red;">找不到該產品，請重新查詢。</p>
                    <% } } catch (Exception e) { e.printStackTrace(); out.println("<p style='color: red;'>查詢時發生錯誤，請稍後再試。</p>");
                        } finally {
                        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
                        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                        try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
                        }
                        %>
                        <form action="selectForm.jsp" method="get">
                            <button type="submit">返回查詢頁面</button>
                        </form>
                        <form action="../login/accesspage.jsp" method="get">
                            <button type="submit">返回用戶功能頁</button>
                        </form>
        </body>

        </html>