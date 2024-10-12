import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet{
 public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/watch","root","siva1234");
	HttpSession session=request.getSession();
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	PrintWriter out=response.getWriter();
	PreparedStatement ps=con.prepareStatement("select name from admins where username=? and password=?");
	ps.setString(1,username);
	ps.setString(2,password);
	ResultSet rs=ps.executeQuery();	
	if(!rs.next()){	
	
		session.setAttribute("loginsuccessful",false);
		response.sendRedirect("login.jsp");
	
	}
	else{
		session.setAttribute("name",rs.getString(1));
		response.sendRedirect("admin.jsp");		
	}	
	}
	catch(Exception e){
		System.out.println(e);
	}	

}


}