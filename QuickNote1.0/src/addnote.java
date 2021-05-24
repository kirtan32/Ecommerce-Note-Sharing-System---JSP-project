

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
	
@MultipartConfig(maxFileSize=16177215)
@WebServlet("/add")
public class addnote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//String username=request.getParameter("username");
		//String password=request.getParameter("password");
	//	String name;
		HttpSession hs=request.getSession();
		String email=(String)hs.getAttribute("username");
		
		String noteslocation="/home/kirtan/eclipse-workspace/QuickNote1.0/WebContent/Files/notes/";
		String imageslocation="/home/kirtan/eclipse-workspace/QuickNote1.0/WebContent/Files/images/";
		
		System.out.println("email: "+email);
		  String info[]=new String[9];
			
		try
		{
		ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
		
		List<FileItem> item=sf.parseRequest(request);
		
		System.out.println("size: "+item.size());
		  int i=0;
		  int j=0;
			 
		for(FileItem it:item)
		{
		   if(it.isFormField())
		   {
	           String name=it.getFieldName();
	           String val=it.getString();
	           
	           info[i]=val;
	           
		   }
		   else
		   {
			   if(j==3)
			   {
				   File f=new File(noteslocation + it.getName());
				   if(f.exists())
				   {
					   
					   
				   }
				   else
				   {
				   it.write(new File(noteslocation + it.getName()));
				   }
				   info[i]=it.getName();
					
					 
			   }
			   else
			   {
				   File f=new File(noteslocation + it.getName());
				   if(f.exists())
				   {
				   }
				   else
				   {
				   
			     
			   it.write(new File(imageslocation + it.getName()));
			     }
				   info[i]=it.getName();
					
			   }
			   j++;
		   }
			   
		   i++;
		   }
		
		System.out.println("Files added successfully");
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
		  ResultSet rs1=s2.executeQuery("select *from users where username='"+email+"'");
		  rs1.next();
		  int id=rs1.getInt("userid");
		  System.out.println(id);
		   Statement s1=con1.createStatement();
		   
		   for(int i=0;i<9;i++)
		   {
			   System.out.println("----->  "+info[i]);
		   }
		   s1.executeUpdate("insert into notes(userid,notename,noteprice,author,discription,category,img1,img2,img3,pdf) values("+id+",'"+info[0]+"',"+Integer.parseInt(info[1])+",'"+info[2]+"','"+info[4]+"','"+info[3]+"','"+info[5]+"','"+info[6]+"','"+info[7]+"','"+info[8]+"')");
		   
		   con1.close();
		   System.out.println("success");
		   
		 
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Notes Added Error : "+e.getMessage());
		}  
		
		response.sendRedirect("Homepage.jsp");	
	}

}