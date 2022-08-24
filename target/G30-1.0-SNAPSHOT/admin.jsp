
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
       
       if(user.getUserType().equalsIgnoreCase("normal"))
       {
       session.setAttribute("message", "You are NOT admin");
       response.sendRedirect("login.jsp");
       return;
       }
   }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
        <title>Admin Page</title>
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
            <a href="adminmovDetail.jsp"> <li>Movies</li></a>
            <a href="logoutServlet.jsp"><li id="logout">Log Out</li></a>
            <li style="float: right; margin-right: 80px; font-size: 20px; background-color: white; color:black;"><%=user.getUserName() %></li>

             <%
                    
                }
            %>
                   </ul>
    </nav>
           
    <div class="options">
        
      
        <a href="uploadmovie.html"><button>Upload Movies</button></a>
        <button>Upload Dataset </button>
        <a href="userdetail.jsp"> <button>User Detail</button></a>
        <a href="userfeed.jsp"> <button>User's Feedback</button></a>
    </div>
</body>

</html>
