<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/watch","root","siva1234");
PreparedStatement ps=con.prepareStatement("select CONCAT(UCASE(MID(name,1,1)),MID(name,2)),year(year),photoname,number,CONCAT(UCASE(MID(language,1,1)),MID(language,2)) from movies where language=?");
ps.setString(1,request.getParameter("language"));
ResultSet rs=ps.executeQuery();
%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<link rel="stylesheet" href="style.css"></link>
<link rel="stylesheet" href="style1.css"></link>
<title><%=request.getParameter("language")%> Movies  </title>
</head>
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
<input class="button" onclick="search()" type="submit" value="search ">
</div>
</div>
</nav>
<h1 style="margin-left:20px;"><%= request.getParameter("language")%> Movies</h1>
<section>
<%
        while (rs.next()) {
  %>
<div id="main"  onclick="sn(<%=rs.getInt(4)%>)" name="<%=rs.getString(4)%>">
<div class="sub" style="background-image:url('images/<%=rs.getString(3)%>');"></div>
<div class="moviename" style="text-align:center;overflow:hidden;"><%=rs.getString(1)%>(<%=rs.getString(2)%>) <%=rs.getString(5)%> full movie
watch online 
</div>
</div>
  <%
        }%>

</section>

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

function sn(num){
window.location.href="movie.jsp?number="+num;
}


</script>
</body>
</html>