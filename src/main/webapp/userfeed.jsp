
<%@page import="com.g30.entities.FeedBack"%>
<%@page import="java.util.List"%>
<%@page import="com.g30.dao.FeedBackDao"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="stylesheet" href="css/userfeed.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User-FeedBack</title>
    </head>

    <body>
        <nav class="navbar">
            <ul>
                <a href="admin.jsp">
                    <li id="back">< Back</li>
                </a>
                <a href="logoutServlet.jsp">
                    <li id="logout">Log Out</li>
                </a>
            </ul>
        </nav>
        <div class="table"><br>
            <h1>Feedback's From User</h1><br><br>
            <table style="width:95%;">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th style="width:25%;">Email</th>
                    <th style="width:55%;">Feedback</th>
                </tr>
                <%
                    try {

                        FeedBackDao fd = new FeedBackDao(FactoryProvider.getFactory());
                        List<FeedBack> list = fd.getAllFeedback();
                        for (FeedBack feed : list) {
                %> 
                <tr>
                    <td><%= feed.getId()%></td> 
                    <td><%= feed.getUserName()%></td>
                    <td><%= feed.getEmail()%></td>
                    <td><%= feed.getFeedback()%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println(e.getMessage());
                    }

                %>
            </table>
        </div>
    </body>

</html>