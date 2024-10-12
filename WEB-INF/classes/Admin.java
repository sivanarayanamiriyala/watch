import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/Admin")
public class Admin extends HttpServlet{
 public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/watch","root","siva1234");
	HttpSession session=request.getSession();
	String name=request.getParameter("name");
	String year=request.getParameter("year");
	String Directedby=request.getParameter("Directedby");
	String cast=request.getParameter("cast");
	String genre=request.getParameter("genre");
	String photoname=request.getParameter("photoname");
	String filename=request.getParameter("filename");
	String language=request.getParameter("language");
	String about=request.getParameter("about");	
	PrintWriter out=response.getWriter();
	PreparedStatement ps=con.prepareStatement("insert into movies(name,year,Directedby,cast,genres,photoname,filename,language,About) values(?,?,?,?,?,?,?,?,?);");
	ps.setString(1,name);
	ps.setString(2,year);
	ps.setString(3,Directedby);
	ps.setString(4,cast);
	ps.setString(5,genre);
	ps.setString(6,photoname);
	ps.setString(7,filename);
	ps.setString(8,language);
	ps.setString(9,about);
	int rs=ps.executeUpdate();
	if(rs!=0){
		session.setAttribute("insertedsuccessfully",true);
		response.sendRedirect("admin.jsp");
	}	


	}
	catch(Exception e){
		System.out.println(e);
	}	

}


}