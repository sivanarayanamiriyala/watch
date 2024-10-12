<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<style>
body{
background-image:url('images/k.png');
}
.div{
width:400px;
display:block;
height:400px;
background-color:white;
position:absolute;
top:23%;
right:10%;
border-radius:15px;
font-size:15px;
}
.h1{
font-size:40px;
color:darkgreen;
text-align:center;
border-bottom:1px solid #adadad;
padding:10px;
}
.div2 input{
border:none;
outline:none;
background:none;
position:absolute;
right:12%;
top:33%;
width:300px;
height:30px; 
border-bottom:2px solid #adadad;
}
.div2 label{
position:absolute;
left:13%;
font-size:15px;
top:31%;
color:green;
pointer-events:none;
transtiton:10s;
}
.div2 input:focus~label{
position absolute;
transform:translateY(-100%);
font-size:20px;
color:limegreen;
}
.div3 input{
border:none;
outline:none;
background:none;
position:absolute;
right:12%;
top:61%;
width:300px;
height:30px; 
border-bottom:2px solid #adadad;
}
.div3 label{
position:absolute;
left:13%;
font-size:15px;
top:58%;
color:green;
pointer-events:none;
transtiton:10s;
}
.div3 input:focus~label,
.div3 input:active~label{
position absolute;
transform:translateY(-100%);
font-size:20px;
color:limegreen;
}
.div4{
position:absolute;
top:70%;
left:10%;

}
.input1{
position:absolute;
top:82%;
left:12%;
width:310px;
height:35px;
font-size:17px ; 
background-color:lightgreen;
border-radius:10px;
border:none;
color:white;
font-weight:bold;
}
.input1:hover{
background-color:limegreen;
}

*{
padding:0;
margin:0;
}
nav{
margin-bottom:50px;
}
nav div
{
display:flex;
justify-content:space-between;
align-items:center;
padding:5px;

}
nav div li{
list-style-type:none;
display:inline-block;
padding:10px;
font-size:16px;
margin-top:-10px;
}
nav div h1{
margin-top:25px;
font-size:50px;
margin-left:65px;
color:white;
cursor:pointer;
}
nav div h2{
margin-left:-95px;
margin-top:25px;
}

nav div .input .button{
border:none;
font-weight:bolder;
background-color:#17B169;
padding-left:5px;
margin-top:25px;
color:white;
border-radius:5px;
width:100px;
height:50px;
border:1px solid #252525;
}
nav div .input .button:hover{
background-color:lightgreen;
cursor:pointer;
}


nav div li button{
	border:2px solid black;
 padding: 16px;
   color: white;
background-color:#17B169;
 font-size: 18px;
border-radius:5px;

  border: 1px solid #252525;
  font-weight:bold;
margin-top:25px;

}
nav div li button:hover{
background-color: #3e8e41;
}

.image{
background-color: #e5e5f7;
background: repeating-linear-gradient( -45deg, #14c544, #14c544 5px, #e5e5f7 5px, #e5e5f7 25px );
width:50px;
heigth:80px;
margin-top:25px;
margin-left:40px;
padding:15px;
border-radius:5px;
}
.image img{
width:100%;
border-radius:5px;
}

</style>
<head>
	<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>LOGIN</title>
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
<li><button >Contact</button></li>
<li><button>About</button></li>
</ul>
<div class="input">
<input type="button" class="button" value="Login">
<input class="button" type="button" value="Signup">
</div>
</div>
</nav>
<img  style="width:400px;top:30%;left:12%;position:absolute;opacity:90%;border-radius:20px;border:5px solid white;" src="images\sn.jpg">
<form method="post" action="Login">
<div class="div">
<h1 class="h1">LOG IN</h1>
<div class="div2">
	<input type="text" name="username"></input>
	<label>User Name</label>
</div>
<div class="div3">
	<input type="password" name="password"></input>
	<label>PassWord<label>	
</div>
<c:if test = "${ loginsuccessful == false}">
         <p style="color:red;position:relative; margin-top:220px;margin-left:40px;">Invalid Details!!! Try Again<p>
	
<%
session.removeAttribute("loginsuccessful");
session.invalidate();%>
</c:if>

<input class="input1" type="submit" value="Login"> </input>
</div>
</form>
</body>
</html>