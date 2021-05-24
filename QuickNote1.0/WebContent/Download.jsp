<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Favicon -->
    <link rel="icon" href="images/mark3.png" type="image/png"><!-- Font Awesome -->
   
    <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">  
    
		
	<title>File Download</title>
</head>

<body>

	<!-- Nav bar -->
	<jsp:include page="Header.jsp" />  
	
	<div class="container" style="padding-top: 50px;">
	
		<div class="card" style="border-width: 2px;border-radius: 10px;width:1100px;">
			
	        <div class="card-body pb-1" style="margin-left: 2%;">
	              
    <%!
    int userid;
    int noteid;
    
    %>  
               
	<%
	
	  	try
		{
	  		System.out.println("In Download.jsp");
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
				 
				%>
				<h4>Download Your File</h4>
				<br>
				<div class="text-center text-md-left mt-5" style="padding-bottom: 10px;padding-top: 20px;">
					<a href="Downloadit?filename=<%=pdfname%>&noteid=<%=noteid%>" class="btn btn-primary btn-icon" style="width: 150px;">
						<span class="btn-inner--text">Download</span>
						<span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
					</a>                        
				</div>
				<a href="Homepage.jsp" style="padding-bottom: 20px;">Home</a>
				<%
				
			 }
			 else
			 {
				 String entry="Unauthorized Entry";
				 %>
				<h4><%=entry%></h4>
				<br>
				<div class="text-center text-md-left mt-5" style="padding-bottom: 20px;padding-top: 20px;">
					<a href="Homepage.jsp" class="btn btn-primary btn-icon" style="width: 150px;">
						<span class="btn-inner--text">Home</span>
						<span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
					</a>                        
				</div>
				<%
			 }
			 
			 rs2.close();
			 rs1.close();
			 s2.close();
			 s1.close();
			 con1.close();
	   
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Error in Download : "+e.getMessage());
			%>
			<h4><%=e.getMessage()%></h4>
			<br>
			<div class="text-center text-md-left mt-5" style="padding-bottom: 20px;padding-top: 20px;">
				<a href="Homepage.jsp" class="btn btn-primary btn-icon" style="width: 150px;">
					<span class="btn-inner--text">Home</span>
					<span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
				</a>                        
			</div>
			<%
			
		}
	
    %>
    
    			</div>
           </div>
      </div>
           
	
	<!-- Footer  -->
    <jsp:include page="Footer.jsp" />  
	

</body>
</html>