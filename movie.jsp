<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/watch","root","siva1234");
PreparedStatement ps=con.prepareStatement("select CONCAT(UCASE(MID(name,1,1)),MID(name,2)),CONCAT(UCASE(MID(directedby,1,1)),MID(directedby,2)),cast,genres,photoname,filename,CONCAT(UCASE(MID(language,1,1)),MID(language,2)),About,year(year) from movies where number=?");
ps.setString(1,request.getParameter("number"));
ResultSet rs=ps.executeQuery();

%>
<%
PreparedStatement ps1=con.prepareStatement("update movies set viewcount=viewcount+1 where number=?");
ps1.setString(1,request.getParameter("number"));
ps1.executeUpdate();

%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<link rel="stylesheet" href="style.css"></link>
<%
PreparedStatement p=con.prepareStatement("select CONCAT(UCASE(MID(name,1,1)),MID(name,2)),CONCAT(UCASE(MID(directedby,1,1)),MID(directedby,2)),cast,genres,photoname,filename,CONCAT(UCASE(MID(language,1,1)),MID(language,2)),About,year(year) from movies where number=?");
p.setString(1,request.getParameter("number"));
ResultSet r=p.executeQuery();
while(r.next()){%>
<title><%= r.getString(1)%> Movie</title>
<%}%>
</head>
<style>
#button{
position:relative;
left:45%;
color:white;
margin-bottom:30px;
font-size:20px;
font-weight:bolder;
background-color:#65a765;
border-radius:10px;
border:none;
width:150px;
height:40px;
transition:1s;
cursor:pointer;
}
#button:hover{
background-color:lightgreen;

}

</style>
<body>
<nav>
<div>
<div class="image">
<img src="images/sn.jpg"></div>
<h1>Watch</h1>
<h2><sub>.com</sub></h2>
<ul>
<li><button onclick="location.href='index.jsp'">Home</button></li>
<li>
<div class="dropdown">
<button class="dropbtn">Movies</button>
  <div class="dropdown-content">
    <a href="movies-list.jsp?language=Telugu">Telugu</a>
    <a href="movies-list.jsp?language=Hindi">Hindi</a>
    <a href="movies-list.jsp?language=English">English</a>
  </div>
</div>
</li>
<li><button>Contact</button></li>
<li><button>About</button></li>
</ul>
<div class="input">
<input type="text" class="text" id="search" placeholder="Search Movies">
<input class="button" onclick="search()" type="button" value="search ">
</div>
</div>
</nav>


<section>

<%
        while (rs.next()) {
  %>
<h1 style="white-space: nowrap;text-overflow: ellipsis;text-transform:capitalize;margin-left:20px;"> <%= rs.getString(1)%> (<%=rs.getString(9)%>) <%=rs.getString(7)%> Full Movie</h1>
<video style="margin:30px 0px 30px 60px;"width="1150" height="500" controls autoplay>
  <source src="movies/<%=rs.getString(6)%>" type="video/mp4">
</video>
<h3 style="margin-left:80px;"> <%= rs.getString(1)%>(<%=rs.getString(9)%>) Movie <%=rs.getString(7)%> Movie Watch Online Download for FREE!!!</h3>
<p style="margin-left:80px;margin-bottom:30px;padding:10px;">About:<br>
<b>Movie name:</b> <%=rs.getString(1)%><br>
<b>Directed by:</b><%=rs.getString(2)%><br>
<b>Cast:</b><%=rs.getString(3)%><br>
<b>genres:</b><%=rs.getString(4)%><br>
<b>language:</b><%=rs.getString(7)%><br>
<b>About:</b> <%=rs.getString(8)%><br>

</p>
<button id="button" ><a style="text-decoration:none;color:white;"href="movies/<%=rs.getString(6)%>" download="<%=rs.getString(6)%>">DOWNLOAD</a></button>



<%
        }%>


</section>
<br/>

<footer>
<div>
<div class="footer">
<h3 style="margin-top:30px;">Watch.com</h3>
<h4 style="margin:10px;">Watch all new telugu,hindi,english movies for free.Download free movies.</h4>
<p>Contact US<p>
</div>
<marquee><i><b><p>watch@gmail.com</p></b></i></marquee>
</div>
</footer>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.js"></script>
<script>
function search(){
const search=document.getElementById("search").value;
window.location.href="search movies.jsp?name="+search;
}
</script>
</body>
</html>