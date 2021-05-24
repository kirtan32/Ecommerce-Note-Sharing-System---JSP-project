
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public signup() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String username=request.getParameter("email");
		String password=request.getParameter("pass");
		
		
		 try
		 {
			 
		  
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("\n Driver Connected");
				
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
			System.out.println("\n Database Connected");
				
			Statement s1=con1.createStatement();
		     Statement s2=con1.createStatement();
		     ResultSet rs=s2.executeQuery("select * from users where username='"+username+"'");
		     if(rs.next())
		     {
		    	 response.sendRedirect("signup_error.html");
		     }
		     else
		     {
		    	HttpSession session = request.getSession();
		 		session.setAttribute("name", ""+name);
		 		session.setAttribute("username", ""+username);
		 		session.setAttribute("password", ""+password);
		 	    
			     s1.executeUpdate("insert into users(username,password,name,rs) values('"+username+"','"+password+"','"+name+"',0)");
			     
				 System.out.println("added successfully");
				 response.sendRedirect("Homepage.jsp");
				
		     }
		 }
		 catch(Exception e)
		 {
			   System.out.print(e.getMessage());
		 }
		 
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
