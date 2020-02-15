<%@ page import="java.util.*,java.io.*" %>
<!DOCTYPE html>
<%
File dataDir = new File(request.getRealPath("/data/"));
File trashDir = new File(request.getRealPath("/trash/"));
if(!dataDir.exists())
	dataDir.mkdirs();
if(!trashDir.exists())
	trashDir.mkdirs();

%>
<!--
Author: Surajit Kundu
Email: surajit.113125@gmail.com
Contact: +91-9933028279
-->
<html lang="en">
<head>
	<title>Ubuntu Desktop</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/dist/jquery.contextMenu.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<link rel="stylesheet" href="custom.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.6.4/jquery.contextMenu.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="custom.js"></script>
</head>
<body>
<div class="header">
<nav class="navbar navbar-expand-sm">
  <ul class="navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link"><span id="clock"></span></a>
    </li> 	
  </ul>
  <ul class="navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link"><span class="fa fa-network-wired fa-custom"></span></a>
    </li>  
    <li class="nav-item">
      <a class="nav-link"><span class="fa fa-volume-up fa-custom"></span></a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle shutdown" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="javascript:window.location.reload();" id="restart"><span class="fa fa-undo"></a>
        <a class="dropdown-item" href="javascript:document.body.remove();" id="shutdown"><span class="fa fa-power-off"></span></a>
      </div>
    </li>
  </ul>
</nav>
</div> 
 
<div class="desktop">
	<div class="icons">
		<div class="icons-list">
			<span class="fa fa-trash-alt fa-icons" id="trash" data-toggle="modal" data-target="#trash-body"><label>Trash</label></span>
		</div>
		<div class ="icons-list-group">
		<%
			File folder = new File(request.getRealPath("/data/"));
			File[] listOfFiles = folder.listFiles();
			for (int i = 0; i < listOfFiles.length; i++) {
			  if (listOfFiles[i].isFile()) {
				out.println("<div class='icons-list' elem-name='"+listOfFiles[i].getName()+"'><span class='fa fa-file fa-icons'><label id='newfile'>"+listOfFiles[i].getName()+"</label></span></div>");
			  } else if (listOfFiles[i].isDirectory()) {
				out.println("<div class='icons-list' elem-name='"+listOfFiles[i].getName()+"'><span class='fa fa-folder fa-icons'><label id='newfolder'>"+listOfFiles[i].getName()+"</label></span></div>");	  
			  }
			}
		%>
		</div>		
	</div>
</div>


<!-- The Modal -->
<div class="modal" id="trash-body">
  <div class="modal-dialog trash-modal">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
		
      </div>


    </div>
  </div>
</div>

</body>
</html>
