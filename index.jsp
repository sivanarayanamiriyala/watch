<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/watch","root","siva1234");
PreparedStatement ps=con.prepareStatement("select photoname,filename,number from movies order by viewcount desc limit 5");
ResultSet rs=ps.executeQuery();

%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<link rel="stylesheet" href="style.css"></link>
<title>Home Page | Watch Latest Movies</title>
</head>
<style>
.carousel-cell { 
  width: 30%;
  height: 180px;
  margin-right: 10px;
  background:no-repeat;  
  border-radius: 10px;
  counter-increment: gallery-cell;
  background-size:cover;
}
#main{
display:flex;
flex-direction:row;
padding-left:10px;
}
.sub{
width:20%;
height:25vh;
border-radius:10px;
background:no-repeat;  
background-size:100% 100%;
justify-content:space-between;
margin-right:7px;
box-shadow:1px 1px 1px 1px;
}
.p{
float:right;
margin-top:20px;
}
h4{
padding-left:5px;
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
<h2 style="margin-left:20px;">Mostly Watched</h2>
</br>
<div class="carousel" data-flickity='{ "autoPlay": 2600 }'>
<%
while(rs.next()){%>
  <div class="carousel-cell" style="background-size:100% 100%;background-image:url('images/<%=rs.getString(1)%>') " onclick="sn(<%=rs.getInt(3)%>)"></div>
<%}%> 
</div>
</br>
<h2 style="margin-left:20px;">New Releases</h2>
</br>
<div class="carousel" data-flickity='{ "autoPlay": true }'>
<%
PreparedStatement ps1=con.prepareStatement("select photoname,filename,number from movies order by year desc limit 5");
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){
%>
  <div class="carousel-cell" style="background-size:100% 100%;background-image:url('images/<%=rs1.getString(1)%>') " onclick="sn(<%=rs1.getInt(3)%>)"></div>
<%}%> 
</div>

<br/>
<a href="movies-list.jsp?language=Telugu" style="float:right;margin:40px 10px 25px 30px;text-decoration:none;"><p>Show More</p></a>
<h2 style="margin:30px 10px 15px 30px;">TollyWood Movies</h2>
<div id="main">
<%
PreparedStatement ps2=con.prepareStatement("select photoname,filename,number from movies where language=? limit 5");
ps2.setString(1,"telugu");
ResultSet rs2=ps2.executeQuery();
while(rs2.next()){

%>
<div class="sub" style="background-image:url('images/<%=rs2.getString(1)%>');cursor:pointer; " onclick="sn(<%=rs2.getInt(3)%>)"></div>
<%}%>
</div>
</br>
<a href="movies-list.jsp?language=Hindi" style="float:right;margin:40px 10px 15px 30px;text-decoration:none;"><p>Show More</p></a>
<h2 style="margin:30px 10px 15px 30px;">BollyWood Movies</h2>
<div id="main">
<%
PreparedStatement ps3=con.prepareStatement("select photoname,filename,number from movies where language=? limit 5");
ps3.setString(1,"hindi");
ResultSet rs3=ps3.executeQuery();
while(rs3.next()){
%>
<div class="sub" style="background-image:url('images/<%=rs3.getString(1)%>');cursor:pointer; " onclick="sn(<%=rs3.getInt(3)%>)"></div>
<%}%>
</div>
</br>

<a href="movies-list.jsp?language=English" style="float:right;margin:40px 10px 25px 30px; text-decoration:none;"><p>Show More</p></a>
<h2 style="margin:30px 10px 15px 30px;">HollyWood Movies</h2>
<div id="main">
<%
PreparedStatement ps4=con.prepareStatement("select photoname,filename,number from movies where language=? limit 5");
ps4.setString(1,"english");
ResultSet rs4=ps4.executeQuery();
while(rs4.next()){

%>
<div class="sub" style="background-image:url('images/<%=rs4.getString(1)%>');cursor:pointer; " onclick="sn(<%=rs4.getInt(3)%>)"></div>
<%}%>
</div>
</br>
</br>
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