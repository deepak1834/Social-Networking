<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>


  <link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>

    <link rel="stylesheet" href="css/style.css">
</head>
<body background="img/bg3.jpg">
	
		<div class="login-card" style="margin-top:100px;">

    <h1 style="margin-top:20px"><b>Upload Files</b></h1><br>
		<form method="post" action="uploadServlet" enctype="multipart/form-data">
			<input type="file" name="photo"><br><br>
			<input type="submit" class="login login-submit" value="save">
		
		</form>
	<div class="login-help">
    <p>Upload a file or document in rar or zip format</p>
  </div>
</body>
</html>