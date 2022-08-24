<%@page import="com.g30.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.g30.dao.UserDao"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="css/userdetail.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <nav class="navbar">
        <ul>
            <a href="admin.jsp">
                <li id="back">
                    < Back</li>
            </a>
            <a href="logoutServlet.jsp">
                <li id="logout">Log Out</li>
            </a>
        </ul>
    </nav>
    <div class="table"><br>
        <h1>User's Details</h1><br><br>
        <table style="width:94%;">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th style="width:25%;">Email</th>
                <th style="width:25%;">Address</th>
                <th>Mobile No</th>
            </tr>
            <%
            try{
                
           
            UserDao ud = new UserDao(FactoryProvider.getFactory());
            List<User> list = ud.getAllUser();
            for(User user:list)
            {
         %> 
            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getUserName() %></td>
                <td><%= user.getUserEmail() %></td>
                <td><%= user.getUserAddress() %></td>
                <td><%= user.getUserPhone() %></td>
            </tr>

            <%
        }
      }
      catch(Exception e){
               e.printStackTrace();
               out.println(e.getMessage());
       }
       
    %>
        </table>
    </div>
</body>

</html>