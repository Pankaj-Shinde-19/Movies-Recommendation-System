
<%@page import="com.g30.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   User user = (User) session.getAttribute("current-user");
   if(user==null)
   {
       session.setAttribute("message", "You are NOT logged in !! Login First");
       response.sendRedirect("login.jsp");
       return;
   }
   else{
       
       if(user.getUserType().equalsIgnoreCase("admin"))
       {
       session.setAttribute("message", "You are NOT user !! Register First");
       response.sendRedirect("login.jsp");
       return;
       }
   }
%>

<link rel="stylesheet" href="css/normal.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal-User Page</title>
    </head>
   
   <body>
    <nav class="navbar">
        <ul>
          <%
                if(user !=null)
                {
             %>       
                    
              <a href="index.html"><li>Home</li></a>
            <a href="about.html"><li>About</li></a>
            <a href="logoutServlet.jsp"><li id="logout">Log Out</li></a>
            <li style="float: right; margin-right: 80px; font-size: 20px; background-color: white; color:black;"><%=user.getUserName() %></li>

             <%
                    
                }
            %>
             
        </ul>
    </nav>
         
        
    <div class="options">
        <a href="usermovdetail.jsp"><button>Movies</button></a><br><br>
        <button>Recommendation</button><br><br>
        <a href="feedback.jsp"><button>Feedback</button></a><br><br>
    </div>
             
    
</body>

    </html>
