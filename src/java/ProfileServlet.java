/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*; 
import model.ProfileBean;

/**
 * 
 * @author Asus 
 */

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    // Database Credentials for NetBeans/Derby
    private static final String DB_URL = "jdbc:derby://localhost:1527/student_profiles";
    private static final String DB_USER = "app"; // Default NetBeans username
    private static final String DB_PASS = "app"; // Default NetBeans password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            // 1. Retrieve form data
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            String program = request.getParameter("program");
            String email = request.getParameter("email");
            String hobbies = request.getParameter("hobbies");
            String introduction = request.getParameter("introduction");

            // 2. Create Bean
            ProfileBean profile = new ProfileBean();
            profile.setName(name);
            profile.setStudentId(studentId);
            profile.setProgram(program);
            profile.setEmail(email);
            profile.setHobbies(hobbies);
            profile.setIntroduction(introduction);

            // 3. DATABASE CONNECTION (Embedded directly here)
            // Load Derby Driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            // Open Connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                
                String sql = "INSERT INTO profile (name, studentId, program, email, hobbies, introduction) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, profile.getName());
                stmt.setString(2, profile.getStudentId());
                stmt.setString(3, profile.getProgram());
                stmt.setString(4, profile.getEmail());
                stmt.setString(5, profile.getHobbies());
                stmt.setString(6, profile.getIntroduction());
                
                stmt.executeUpdate();
            }

            // 4. Forward to JSP
            request.setAttribute("profile", profile);
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("Error: " + e.getMessage());
        }
    }
}