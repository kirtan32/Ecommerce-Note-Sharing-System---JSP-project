

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public login() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String name;
		
		HttpSession session = request.getSession();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("\n Driver Connected");
			
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
			System.out.println("\n Database Connected");
			
			Statement s1=con1.createStatement();
			ResultSet rs=s1.executeQuery("select *from users where username='"+username+"' and password='"+password+"'");
			  if(rs.next())
			  {
				if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
				{
					name=rs.getString("name");
					int rupee = rs.getInt("rs");
					int uid = rs.getInt("userid");
					session.setAttribute("userid", ""+uid);
					session.setAttribute("name", ""+name);
					session.setAttribute("username", ""+username);
					session.setAttribute("password", ""+password);
					session.setAttribute("rs", ""+rupee);
					response.sendRedirect("Homepage.jsp");
				}
			  }
			  else
			  {
				  System.out.println("Login Error");
				  response.sendRedirect("Login_error.html");
			  }
		}
		catch(Exception e)
		{
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
