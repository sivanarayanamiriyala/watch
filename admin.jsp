<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
<title>Admin Page</title>
</head>
<style>
*{
margin:0px;
padding:0px;
}
body{
background-image:url('images/bg.jpg');
color:white;
font-family:Verdana ;
font-weight:bold;
}
input{
margin:20px;
border-radius:5px;
font-size:15px;
}
option{
font-size:15px;
}
.submit:hover{
background-color:#50B450;
}

.submit{
width:200px;
height:45px;
background-color:#0A6E0A;
color:white;
font-size:20px;
font-weight:bolder;
cursor:pointer;
}
</style>
<body>
<h1 align="center" style="font-size:50px;margin-top:40px;">Welcome <%= session.getAttribute("name")%></h1>
<form method="post" action="Admin"align="center" style="margin-top:40px;">
Enter the Movie Name:
<input type="text" name="name" required style="width:200px;height:25px;"/>
<br/>
Enter the Release Date:
<input style="width:200px;height:25px;" type="date" name="year"  required/>
<br/>
Enter the Director Name:
<input style="width:200px;height:25px;" type="text" name="Directedby"  required/>
<br/>
Enter the cast Details:
<input  style="width:200px;height:25px;" type="text" name="cast"  required/>
<br/>
Enter the Movie Genre:
<select style="width:200px;border-radius:5px; margin:20px;height:25px;"  name="genre">
<option>select the genre</option>
<option value="romantic">Romantic</option>
<option value="action">Action</option>
<option value="drama">Drama</option>
<option value="horror">Horror</option>
<option value="thriller">Thriller</option>
<option value="comedy">Comedy</option>
</select>
<br/>
Enter the Movies Photo Name(with extension):
<input  style="width:200px;height:25px;" type="text" name="photoname"/>
<br/>
Enter the Movie File Name(with extension):
<input style="width:200px;height:25px;"  type="text" name="filename"/>
<br/>
Enter the Movie's Language:
<select  style="width:200px;margin:20px;height:25px;border-radius:5px;" name="language">
<option>select the language</option>
<option value="telugu">Telugu</option>
<option value="hindi">Hindi</option>
<option value="english">English</option>
</select>
<br/>
Enter the Description About Movie:
<textarea  style="font-size:20px;margin:20px;border-radius:5px;" name="about" rows="10" cols="40"></textarea>
<br/>
<input class="submit"  type="submit" value="Submit"/>
</form>
<c:if test = "${insertedsuccessfully == true }">
         <p style="color:red;">Data Inserted Successfully <p>
		<%session.removeAttribute("insertedsuccessfully");%>
</c:if>
</body>
</html>