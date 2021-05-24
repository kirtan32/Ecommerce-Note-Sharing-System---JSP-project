

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/change")
public class profile_change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=request.getSession();
		String email=(String)hs.getAttribute("username");
		
		System.out.println("email: "+email);
		  String info="";
		  
		String imageslocation="/home/kirtan/eclipse-workspace/QuickNote1.0/WebContent/Files/profile/";
			
		try
		{
		ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
		
		List<FileItem> item=sf.parseRequest(request);
		
		System.out.println("size: "+item.size());
			 
		for(FileItem it:item)
		{
	     	   File f=new File(imageslocation + it.getName());
			   if(f.exists())
			   {	   }
			   else
			   {
				   it.write(new File(imageslocation + it.getName()));
			   }
			   
			   info=it.getName();
				 
		}
			   
		
		System.out.println("Profile image set successfully...");
		}
	
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	
	
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
      		
      		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
      		
		  Statement s2=con1.createStatement();
		  s2.executeUpdate("update users set img='"+info+"' where username='"+email+"'");
		  
		   con1.close();
		   System.out.println("success");
		   
		 
		}
		catch(Exception e)
		{
			
		}  
		
		response.sendRedirect("Profile.jsp");	
	}


}
