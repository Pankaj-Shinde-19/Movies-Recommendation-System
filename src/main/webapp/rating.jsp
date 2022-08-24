
<%

    String id = request.getParameter("movieid");
    String name = request.getParameter("moviename");
    String actor = request.getParameter("movieactor");
    String category = request.getParameter("moviecat");
    String year = request.getParameter("movieyear");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/uploadmovie.css">
        <title>Rating Page</title>
    </head>
    <body>
        <nav class="navbar">
            <ul>
                <a href="usermovdetail.jsp"><li id="back"> < Back</li> </a>
            </ul>
        </nav>


        <div class="upload">

            <form method="post" action="ratingServlet.jsp"  >
                <br>
                <div class="frm">
                    <label>Movie Id :</label><br>
                    <input type="text" value=<%= id%> name="movie_id" readonly>
                </div>

                <div class="frm">
                    <label>Movie Name :</label><br>
                    <input type="text" value=<%= name%> name="movie_name" readonly >
                </div>

                <div class="frm">
                    <label>Movie Actor :</label><br>
                    <input type="text" value= <%= actor%> name="actor" readonly>
                </div>

                <div class="frm">
                    <label>Movie Category :</label><br>
                    <input type="text" value=<%= category%> name="category" readonly>
                </div>

                <div class="frm">
                    <label>User Rating:</label><br>
                    <input type="number" placeholder="Enter Rating upto 10" name="rating" >
                </div>

                <input type="submit" value="Upload" id="submit">

            </form>
        </div>

    </body>
</html>
