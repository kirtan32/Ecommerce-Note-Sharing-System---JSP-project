import java.io.IOException;
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


@WebServlet("/proceedit")
public class proceedit extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    
	public proceedit() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session = request.getSession();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("\n Driver Connected");
			
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
			System.out.println("\n Database Connected");
			
			int nid=Integer.parseInt((String)session.getAttribute("noteid"));
			
			System.out.println("NoteID : "+nid);
			
			String username=(String)session.getAttribute("username");
			String password=(String)session.getAttribute("password");
			
			System.out.println("--> user "+username);
			System.out.println("--> pass "+password);
			
			
			Statement s1=con1.createStatement();
		    Statement s2=con1.createStatement();
		    Statement s3=con1.createStatement();
		    Statement s4=con1.createStatement();
		    
		    int uid = Integer.parseInt((String)session.getAttribute("userid"));
		    
		    ResultSet rs2=s2.executeQuery("select *from notes where noteid="+nid);
			rs2.next();
			
			int noters = rs2.getInt("noteprice");
			int noteseller = rs2.getInt("userid");
			String filename = rs2.getString("pdf");
			
			ResultSet rs1=s1.executeQuery("select * from users where userid="+noteseller+"");
		    rs1.next();
		    
		    int rupee = rs1.getInt("rs");
		    
		     
			// update users profile rs.
			rupee+=noters;
			s3.executeUpdate("update users set rs="+rupee+" where userid="+noteseller+"");
			   
			// insert into buyers table
			s4.executeUpdate("insert into buyers values("+uid+","+noteseller+","+nid+")");
		     
			
			rs2.close();
			rs1.close();
			s4.close();
			s3.close();
			s2.close();
			s1.close();
			con1.close();
			
			response.sendRedirect("Download.jsp?filename="+filename+"&noteid="+nid);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("--->  "+e.getMessage());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
