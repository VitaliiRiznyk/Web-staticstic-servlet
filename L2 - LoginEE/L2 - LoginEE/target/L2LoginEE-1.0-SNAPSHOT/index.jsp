<%@ page import="java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Local Program</title>
  </head>
  <body>
    <% String userName = (String)session.getAttribute("user_name");%>
    <% Map<String, Integer> answear = (Map<String, Integer>) session.getAttribute("answear");%>

    <% if (userName == null || "".equals(userName)) { %>
        <form action="/info" method="POST">
            Name: <input type="text" name="name"><br>
            Surname: <input type="text" name="surname"><br>
            <p>What was year of  the Apollo 11 mission?</p>
            <input type ="radio" name="answear1" id="param1" value="1969">
            <label for = "param1">1969</label>
            <input type ="radio" name="answear1" id="param2" value="1968">
            <label for = "param2">1968</label><br>
            <p>When World War 2 started?</p>
            <input type ="radio" name="answear2" id ="param3" value="1941">
            <label for = "param3">1941</label>
            <input type ="radio" name="answear2" id ="param4" value="1939">
            <label for = "param4">1939</label><br>
            <input type="submit"/>
        </form>
    <% } else { %>
        <h1>Answer 1 (1969) was: <%= answear.get("1969") %> times<br>
            Answer 1 (1968) was: <%= answear.get("1968") %> times <br>
            Answer 2 (1941) was: <%= answear.get("1941") %> times<br>
            Answer 2 (1939) was: <%= answear.get("1939") %> times <br>
        </h1>
        <br>Click this link to <a href="/info?b=exit">go back</a>
    <% } %>
  </body>
</html>
