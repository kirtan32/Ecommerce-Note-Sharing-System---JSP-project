<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	
	
    <!-- Quick CSS -->
    <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">
    
    
</head>
<body>
	
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container">
            <!-- Brand -->
            <a class="navbar-brand" href="index.html">
                <img alt="Image placeholder" src="images/mark2.png" id="navbar-logo">
            </a>
            <!-- Toggler -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mt-4 mt-lg-0 ml-auto">
                
                	<li class="nav-item ">
                    <a class="nav-link" href="Homepage.jsp">Home</a>
                	</li>
                	
                    <% 
                    
                    
                    	
                    if(session.getAttribute("username")==null)
                    {
                   
                    %>
                       <li class="nav-item ">
                        <a class="nav-link" href="search.jsp">Search</a>
                    </li>
                 
                    <li class="nav-item ">
                    	<!-- <a class="navbar-btn btn btn-sm btn-primary d-none d-lg-inline-block ml-3" href="Login.jsp">
                    Login / SignUp
                		</a>  -->
                         <a class="nav-link" href="Login.jsp">Login/Signup</a>   
                    </li>
                    
                    <%
                    
                    }
                    
                    else
                    {
                    	HttpSession hs=request.getSession();
                    	String name=(String)hs.getAttribute("name");
                    
                    %>
             
                       <li class="nav-item ">
                        <a class="nav-link" href="search.jsp">Search</a>
                  	   </li>
                 
                   
                    <li class="nav-item ">
                        <a class="nav-link" href="addnote.jsp">Add Note</a>
                    </li>
                    
                    <li class="nav-item ">
                        <a class="nav-link" href="Profile.jsp">Profile</a>
                    </li>
                    
                    <li class="nav-item ">
                    	<!-- <a class="navbar-btn btn btn-sm btn-primary d-none d-lg-inline-block ml-3" href="logout">
                    		Logout
                		</a>  -->
                         <a class="nav-link" href="logout">Sign Out</a> 
                    </li>
                    
                    <%
                    
                    }
                    
                    %>
                    
                </ul>
            </div>
        </div>
    </nav>

</body>
</html>