<%@page import="com.g30.entities.User"%>


<%
 User user = (User) session.getAttribute("current-user");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/feedback.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FeedBack Page</title>
    </head>
    <body>

        <nav class="navbar">
            <ul>
                <a href="index.html">
                    <li>Home</li>
                </a>
                <a href="about.html">
                    <li>About</li>
                </a>
                <a href="logoutServlet.jsp">
                    <li id="logout">Log Out</li>
                </a>
            </ul>
        </nav>
        <div class="parentdiv">
            <div class="fb">
                <form method="post" action="feedbackServlet.jsp">
                    <div class="form">
                        <label>User Name :</label><br>
                        <input type="text" value= <%= user.getUserName() %> name="user_name" readonly>
                    </div>
                    <div class="form">
                        <label>Email :</label><br>
                        <input type="text" value= <%= user.getUserEmail()%> name="email" readonly>
                    </div><br>
                    <label class="form">Feedback :</label><br>
                    <textarea name="feedback" id="textarea" cols="30" rows="10"></textarea><br>
                    <input type="submit" id="submit" value="Submit">
                    <input type="reset" id="reset" value="Reset">
                </form>
            </div>
            <div class="options">
                <a href="mov"><button>Movies</button></a><br><br>
                <button>Recommendation</button><br><br>
                <button style="background-color: aliceblue; color: black;">Feedback</button><br><br>
            </div>
        </div>

    </body>
</html>
