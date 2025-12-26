<%--  
    Document   : display
    Created on : 17-Nov-2025, 11:50:48
    Author     : Asus
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // since i don't want jsp to be empty, might as well add the only java coed here
    String name = (String) request.getAttribute("name");
    String studentId = (String) request.getAttribute("studentId");
    String program = (String) request.getAttribute("program");
    String email = (String) request.getAttribute("email");
    String hobbies = (String) request.getAttribute("hobbies");
    String introduction = (String) request.getAttribute("introduction");

    // this btw is the only JSP processing other than EL 
    // a lot of EL since i dont want to migrate all servlet code here
    boolean longIntro = introduction != null && introduction.length() > 50;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Display - CSC584</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="profile-wrapper">
            <div class="profile-header">
                <h1>Personal Profile</h1>
                <p class="subtitle">Student Information Display</p>
            </div>
            
            <div class="profile-card">
                <div class="profile-section">
                    <h2>Basic Information</h2>
                    <div class="info-grid">
                        <div class="info-item">
                            <strong>Full Name:</strong>
                            <span><%= name %></span>
                        </div>
                        <div class="info-item">
                            <strong>Student ID:</strong>
                            <span><%= studentId %></span>
                        </div>
                        <div class="info-item">
                            <strong>Program:</strong>
                            <span><%= program %></span>
                        </div>
                        <div class="info-item">
                            <strong>Email:</strong>
                            <span><%= email %></span>
                        </div>
                    </div>
                </div>
                
                <div class="profile-section">
                    <h2>Hobbies & Interests</h2>
                    <div class="hobbies-box">
                        <%= hobbies %>
                    </div>
                </div>
                
                <div class="profile-section">
                    <h2>Self Introduction</h2>
                    <div class="intro-box">
                        <%= introduction %>
                    </div>

                    <% if (longIntro) { %>
                        <p style="color: green; margin-top: 10px;">
                            (Wow! You wrote a detailed introduction.)
                        </p>
                    <% } %>
                </div>
                
                <div class="action-buttons">
                    <a href="index.html" class="back-btn">Create New Profile</a>
                </div>
            </div>
            
            <div class="footer">
                <p>CSC584 Individual Assignment - Personal Profile Web Application</p>
            </div>
        </div>
    </div>
</body>
</html>
