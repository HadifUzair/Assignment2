<%-- 
    Document   : viewprofile
    Created on : 24-Dec-2025, 12:47:32
    Author     : Asus
--%>

<%-- viewirofile.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %> <!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Student Profiles</h1>
        
        <div class="search-box">
            <form action="viewprofile.jsp" method="GET">
                <input type="text" name="search" placeholder="Search by Name or ID...">
                <button type="submit">Search</button>
                <a href="viewprofile.jsp">Reset</a>
            </form>
        </div>

        <table>
            <tr>
                <th>Name</th>
                <th>Student ID</th>
                <th>Program</th>
                <th>Email</th>
            </tr>
            
            <%
                String search = request.getParameter("search");
                
                // DATABASE CONNECTION VARIABLES
                String dbURL = "jdbc:derby://localhost:1527/student_profiles";
                String dbUser = "app";
                String dbPass = "app";
                
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // 1. Load Driver
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    
                    // 2. Connect
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    
                    String sql = "SELECT * FROM profile";
                    
                    if (search != null && !search.trim().isEmpty()) {
                        sql += " WHERE name LIKE ? OR studentId LIKE ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, "%" + search + "%");
                        stmt.setString(2, "%" + search + "%");
                    } else {
                        stmt = conn.prepareStatement(sql);
                    }

                    rs = stmt.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("studentId") %></td>
                <td><%= rs.getString("program") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if(rs != null) rs.close();
                    if(stmt != null) stmt.close();
                    if(conn != null) conn.close();
                }
            %>
        </table>
        
        <br>
        <a href="index.html">Back to Home</a>
    </div>
</body>
</html>