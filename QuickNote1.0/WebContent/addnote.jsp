<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

      <title>Add Note</title>
    
    <script>
    
    fun1 = function(event) {
    	var input1 = document.getElementsByClassName('file1');
    	console.log("1");
    	var output1 = document.getElementById('f1');
        output1.innerHTML = input1[0].files[0].name;
        var c=document.getElementById("f1").innerHTML;
        var d='images/'+c;
        document.getElementById('img1').src=URL.createObjectURL(event.target.files[0]);	
        document.getElementById('img1').style.visibility='visible';
   }
    
    fun2 = function() {
    	var input1 = document.getElementsByClassName('file2');
    	console.log("1");
    	var output1 = document.getElementById('f2');
        output1.innerHTML = input1[0].files[0].name;
        document.getElementById('img2').src=URL.createObjectURL(event.target.files[0]);	
        document.getElementById('img2').style.visibility='visible';
  
   }
    
    fun3 = function() {
    	var input1 = document.getElementsByClassName('file3');
    	console.log("1");
    	var output1 = document.getElementById('f3');
        output1.innerHTML = input1[0].files[0].name;
        document.getElementById('img3').src=URL.createObjectURL(event.target.files[0]);	
        document.getElementById('img3').style.visibility='visible';
  
   }
    
    fun4 = function() {
    	var input1 = document.getElementsByClassName('file4');
    	console.log("1");
    	var output1 = document.getElementById('f4');
        output1.innerHTML = input1[0].files[0].name;
   }
 
    </script>
     <link rel="icon" href="images/mark3.png" type="image/png">
     
     <link rel="stylesheet" href="CSS/add_note_style.css">
    
    <!-- Quick CSS -->
    <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">
    
     </head>


<body>

	 
  <div class="container" >
    <div class="card" style="width:100%;padding: 50px;">
        <div class="title">Registration</div>
        <div class="content">
          <form action="add" method="post" enctype="multipart/form-data" >
            <div class="user-details">
              <div class="input-box">
                <span class="details">Notebook Name</span>
                <input type="text" placeholder="Notebook Name" name="name" required>
              </div>
              <div class="input-box">
                <span class="details">Price</span>
                <input type="text" placeholder="Price" name="price" required>
              </div>
              <div class="input-box">
                <span class="details">Author</span>
                <input type="text" placeholder="Author" name="author" required>
              </div>
              <div class="input-box">
                <span class="details">Category</span>
                <input type="text" placeholder="Category" name="cat" required>
              </div>
          
              <div class="input-box">
                <span class="details">Description</span>
                <textarea rows="4" cols="40" placeholder="Description..." style="border-radius:10px;width: 100%;" name="desc" >  </textarea>
              </div>
          <div class="input-box"></div>
              <div class="input-box">
                <input type="file" id="real-file"  name="file1"  class="file1" style="visibility: hidden" onchange="javascript:fun1(event)" />
             <label for="real-file" style=" background-color:lightblue; width:200px; text-align:center; border-radius:5px; ">Select file 1</label>
            <p id="f1"> No Image is chosen ,yet</p>
           </div>
           
           <img src=""  id="img1" style=" visibility:hidden;  position:relative; top:50px; left:-560px; width:100px; height:100px;">
         
              <div class="input-box"></div>
              <div class="input-box">
               <input type="file" id="real-file1"  name="file2" class="file2" style="visibility: hidden"  onchange="javascript:fun2()" />
           <label for="real-file1" style=" background-color:lightblue; width:200px; position:relative; left:-520px; text-align:center; border-radius:5px; ">Select file 2</label>
           <p id="f2" style="position:relative; left:-520px;"> No Image is chosen ,yet</p>
          
           </div>
         <img src=""  id="img2" style=" visibility:hidden;  position:absolute; top:640px; left:400px; width:100px; height:100px;">
           
      
              <div class="input-box"></div>
              <div class="input-box">
            <input type="file" id="real-file2" name="file3" class="file3" style="visibility: hidden" onchange="javascript:fun3()" />
           <label for="real-file2" style=" background-color:lightblue; position:relative; left:-520px; width:200px; text-align:center; border-radius:5px; ">Select file 3</label>
           <p id="f3" style="position:relative; left:-520px;"> No Image is chosen ,yet</p>
          
            </div>
             <img src=""  id="img3" style=" visibility:hidden;  position:absolute; top:780px; left:400px; width:100px; height:100px;">
        
          <div class="input-box"></div>
              <div class="input-box">
               <input type="file" class="file4" name="file4"  id="real-file3" style="visibility: hidden" onchange="javascript:fun4()"  />
           <label for="real-file3" style=" position:relative; left:-520px; background-color:lightblue; width:200px; text-align:center; border-radius:5px; ">Select PDF</label>
           <p id="f4" style="position:relative; left:-520px;"> No File is chosen ,yet</p>
          
             </div>
            </div>
            
            <div class="button">
              <input type="submit" value="Register">
            </div>
          </form>
        </div>

    </div>
  </div>
  
	
 
</body>
    
</html>
