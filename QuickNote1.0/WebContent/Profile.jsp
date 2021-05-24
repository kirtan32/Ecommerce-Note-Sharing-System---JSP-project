<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>QuickNote</title>
    <!-- Preloader -->
    
    <!-- Favicon -->
    <link rel="icon" href="images/mark3.png" type="image/png">
    <!-- Quick CSS -->
    <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">
    
    <script>
    
    fun1 = function(event) {
    	  document.getElementById('f1').src=URL.createObjectURL(event.target.files[0]);	
          document.getElementById('myform').submit();
    }
    
    </script>
</head>

<body>

	<!-- Nav bar -->
	<jsp:include page="Header.jsp" />  

    <div class="container" style="padding: 30px;">
        
        <div class="card-box text-center">
        
        <%
        
        int uid=0;
        String username;
        String name;
        int rupee=0;
        String img;
        
        
        try
        {
			Class.forName("com.mysql.jdbc.Driver");
      		
      		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
      		
      		Statement st = con1.createStatement();
      		
			ResultSet rs=st.executeQuery("select * from users where username='"+session.getAttribute("username")+"' and password='"+session.getAttribute("password")+"'");
			
			rs.next();
			
			uid = rs.getInt("userid");
			username = rs.getString("username");
			name = rs.getString("name");
			rupee = rs.getInt("rs");
			img = rs.getString("img");
			
			System.out.println("--> uid : "+rs.getInt(1));
			System.out.println("--> username : "+rs.getString(2));
			System.out.println("--> password : "+rs.getString(3));
			System.out.println("--> name : "+rs.getString(4));
			System.out.println("--> rs : "+rs.getInt(5));
			System.out.println("--> image : "+rs.getString(6));
			
			if(img==null)
			{
				
				%>
				<img src="images/man.jpg" id="f1" class="rounded-circle avatar-xl img-thumbnail" style="width: 150px;height: 150px;" alt="profile-image">
				<% 
			
			}
			else
			{
				
				%>
				<img src="Files/profile/<%=img%>" id="f1" class="rounded-circle avatar-xl img-thumbnail" style="width: 150px;height: 150px;" alt="profile-image">
			
				<% 
			}
		
			%>
		  <form action="change"  id="myform" method="post" enctype="multipart/form-data" >
		      <input type="file" id="profile"  name="file1"  class="file1" style="visibility: hidden" onchange="javascript:fun1(event)" />
		   	<label for="profile">  	
		   		<img src="images/cam.png" style="position:absolute; left:910px;height:25px; width:25px; top:230px;">
			</label>
				
    		</form>	
			<h4 class="mb-1"><%=name %></h4>
            <p class="text-muted"><%=username %></p>

            <h5 class="mb-1">Earned: Rs.<%=rupee%>/-</h5>
			
			<%
      		
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	System.out.println("Error Profile : "+e.getMessage());
        }
        
        %>
            
			<!-- Sell Books -->
            <div class="card" style="margin-top: 10px;"> 

            </div>

			
			
		<%
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
      		
      		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
      		 		
      		System.out.println("\n Database Connected");
      		
      		Statement st1 = con1.createStatement();
      		System.out.println("user id:-> "+uid);
			ResultSet rs=st1.executeQuery("select * from notes where userid="+uid+"");
		//	rs.last();
			//int rows = rs.getRow();
			//System.out.println("rows: "+rows);
			//System.out.println(rs.next());
			
			if(rs.next())
			{
				%>
				
				<p> Books Shared</p>

				<div class="row mt-5">
				
				<%
				do
				{
					 System.out.println("hello");
					int noteid = rs.getInt("noteid");
					String notename = rs.getString("notename");
					String price = rs.getString("noteprice");
					String author = rs.getString("author");
					String discription = rs.getString("discription");
					String category = rs.getString("category");
					String img1 = rs.getString("img1");
					
					%>
					
					<div class="col-md-4" onclick="location.href='notedesc.jsp?nid=<%=noteid%>';" style="cursor: pointer;">
		                <div class="card">
		                    <div class="card-body pb-5">
		                        <div class="pt-4 pb-5">
		                            <img src="Files/images/<%=img1 %>" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
		                        </div>
		                        <h5 class="h4 lh-130 mb-3"><%=notename %></h5>
		                        <p class="text-muted mb-0"><%=category %><br>Price : <%=price %>/-<br>Author : <%=author %></p>
		                    
		                	</div>
		            	</div>
		        	</div>
					
					<%
				}while(rs.next());
			}
			else
			{
				%>
				
				<p> No Books Shared Yet!</p>
				
				<%
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Error selling notes fetching : "+e.getMessage());
		}
		
		%>
			
			
			</div>
			
			<!-- Buy Books -->
            <div class="card" style="margin-top: 10px;"> 

            </div>


		<%
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
      		
      		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/quicknote","root","");
      						
      		System.out.println("\n Database Connected");
      	
      		Statement st = con1.createStatement();
      		Statement st1 = con1.createStatement();
      		
			ResultSet rs=st.executeQuery("select * from buyers where buyerid="+uid+"");
			//rs.last();
		//	int rows = rs.getRow();
			if(rs.next())
			{
				%>
				
				<p class="text-center"> Books Buyed</p>

				<div class="row mt-5">
			
				<%
				do
				{
					int noteid = rs.getInt("noteid");
					ResultSet rs1=st1.executeQuery("select * from notes where noteid="+noteid+"");
					
					while(rs1.next())
					{
						String notename = rs1.getString("notename");
						String price = rs1.getString("noteprice");
						String author = rs1.getString("author");
						String discription = rs1.getString("discription");
						String category = rs1.getString("category");
						String img1 = rs1.getString("img1");
						
						%>
						
						<div class="col-md-4" onclick="location.href='notedesc.jsp?nid=<%=noteid%>';" style="cursor: pointer;">
			                <div class="card">
			                    <div class="card-body pb-5">
			                        <div class="pt-4 pb-5">
			                            <img src="Files/images/<%=img1 %>" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
			                        </div>
			                        <h5 class="h4 lh-130 mb-3"><%=notename %></h5>
			                        <p class="text-muted mb-0"><%=category %><br>Price : <%=price %>/-<br>Author : <%=author %></p>
			                    
			                	</div>
			            	</div>
			        	</div>
						
						<%
					}
					
					
				}while(rs.next());
			}
			else
			{
				%>
				
				<p class="text-center"> No Books Buyed Yet!</p>
				
				<%
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Error buying notes fetching : "+e.getMessage());
		}
		
		%>
			
			</div>
			
            
    	</div>
    
    </div>
    
    <!-- Footer  -->
    <jsp:include page="Footer.jsp" />  
	
    
</body>

</html>
    