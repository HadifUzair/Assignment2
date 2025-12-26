<%-- 
    Document   : profile
    Created on : 24-Dec-2025, 12:44:38
    Author     : Asus
--%>

<%-- profile.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Saved</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Profile Saved Successfully!</h1>
        
        <% 
            ProfileBean p = (ProfileBean) request.getAttribute("profile");
            if (p != null) { 
        %>
        
        <div class="profile-card">
            <p><strong>Name:</strong> <%= p.getName() %></p>
            <p><strong>ID:</strong> <%= p.getStudentId() %></p>
            <p><strong>Program:</strong> <%= p.getProgram() %></p>
            <p><strong>Email:</strong> <%= p.getEmail() %></p>
            <p><strong>Hobbies:</strong> <%= p.getHobbies() %></p>
            <p><strong>Intro:</strong> <%= p.getIntroduction() %></p>
        </div>

        <% } else { %>
            <p>No profile data found.</p>
        <% } %>

        <div style="margin-top: 20px;">
            <a href="index.html" class="button">Add New Profile</a>
            <a href="viewprofile.jsp" class="button" style="background-color: #28a745;">View All Profiles</a>
        </div>
    </div>
</body>
</html>