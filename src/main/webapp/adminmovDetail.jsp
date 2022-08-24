
<%@page import="com.g30.entities.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.g30.helper.FactoryProvider"%>
<%@page import="com.g30.dao.MovieDao"%>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/movdetail.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Detail Page</title>
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
        <h1>Movies</h1><br><br>
        <table style="width:94%;">
            <tr>
                <th>Poster</th>
                <th>Movie name</th>
                <th style="width:25%;">Actor</th>
                <th style="width:25%;">Language</th>
                <th>Category</th>
                <th>Release Year</th>
            </tr>
            <%
            try{
                
           
           MovieDao md = new MovieDao(FactoryProvider.getFactory());
            List<Movie> list = md.getAllMovie();
            for(Movie movie:list)
            {
                
         %> 
            <tr>
            <td><img src="files\<%= movie.getMoviePic() %>" style="height: 100px ; width: 110px" alt="image" ></td>
            <td><%= movie.getMovieName() %></td>
            <td><%= movie.getActor() %></td>
            <td><%= movie.getMovieLang() %></td>
            <td><%= movie.getCategory() %></td>
            <td><%= movie.getYear() %></td>
            
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