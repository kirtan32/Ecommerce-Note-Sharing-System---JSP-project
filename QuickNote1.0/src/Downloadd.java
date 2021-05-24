

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Downloadit")
public class Downloadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String FILE_LOCATION = "/home/kirtan/eclipse-workspace/QuickNote1.0/WebContent/Files/notes";
    final String[][] contentTypes = {{"xml", "text/xml"},{"pdf", "application/pdf"}};   
    int userid;
    int noteid;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
	  		 System.out.println("In Downloadd servlet");
	  		 HttpSession session = request.getSession();
			 userid=Integer.parseInt((String)session.getAttribute("userid"));
			 // parameters fatching
			 noteid=Integer.parseInt(request.getParameter("noteid"));
			 String pdfname = request.getParameter("filename");
			 //
			 
			 // database connection
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
				
			 Statement s1=con1.createStatement();
			 Statement s2 = con1.createStatement();
			 
			 ResultSet rs1=s1.executeQuery("select * from buyers where noteid="+noteid+" and buyerid="+userid+"");
			 
			 ResultSet rs2=s2.executeQuery("select * from notes where noteid="+noteid+" and userid="+userid+"");
			 
			 if(rs1.next() || rs2.next())
			 {
				Object f = request.getParameter("filename");
				if(f != null) {
					String fn = (String) f;
					String contentType = "application/pdf";
					File file = new File(FILE_LOCATION + "/" + fn);
					response.setContentType(contentType);
					response.addHeader("Content-Disposition", "attachment; filename=" + fn);
					response.setContentLengthLong((int)file.length());
					ServletOutputStream  sos = response.getOutputStream();
					BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
					int byteRead = bis.read();
					while (byteRead != -1) {
						sos.write(byteRead);
						byteRead = bis.read();
					}
					if(sos != null) sos.close();
					if(bis != null) bis.close();
					
				}
			 }
			 else
			 {
				 response.sendRedirect("Download.jsp?filename="+pdfname+"&noteid="+noteid);
			 }
		}
		catch(Exception e)
		{
			response.sendRedirect("Homepage.jsp");
		}
		
		
	}

}
