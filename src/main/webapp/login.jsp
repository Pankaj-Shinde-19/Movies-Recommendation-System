<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <link rel="stylesheet" href="css/login.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <nav class="navbar">
            <ul>
                <a href="index.html"><li>Home</li></a>
                <a href="about.html"><li>About</li></a>
            </ul>
        </nav>

        <%@include file="message.jsp" %>

        <div class="login">
            <h1>Login</h1>
            <form method="post" action="loginServlet.jsp">
                <div class="box">
                    <label>E-mail :</label>
                    <input type="email" placeholder="Email" name="email">
                </div>
                <div class="box">
                    <label>Password :</label>
                    <input type="password" placeholder="Password" name="password">
                </div>
                <input type="submit" value="Login" id="submit">
                <input type="reset" id="reset">
                <a href="register.html"><input type="button"  value="Sign Up!!" id="btn"></a>
            </form>
        </div>


    </body>
</html>