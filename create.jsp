<%@ page import="java.util.*,java.io.*,java.nio.file.*" %>
<%!
public String getList(String path){
	String list="";
	File folder = new File(path);
	File[] listOfFiles = folder.listFiles();

	for (int i = 0; i < listOfFiles.length; i++) {
	  if (listOfFiles[i].isFile()) {
		list+="<div class='icons-list' elem-name='"+listOfFiles[i].getName()+"'><span class='fa fa-file fa-icons'><label id='newfile'>"+listOfFiles[i].getName()+"</label></span></div>";
	  } else if (listOfFiles[i].isDirectory()) {
		list+="<div class='icons-list' elem-name='"+listOfFiles[i].getName()+"'><span class='fa fa-folder fa-icons'><label id='newfolder'>"+listOfFiles[i].getName()+"</label></span></div>";	  
	  }
	}
	return list;
}
public String trashList(String path){
	String list = "";
	File folder = new File(path);
	File[] listOfFiles = folder.listFiles();
	for (int i = 0; i < listOfFiles.length; i++) {
	  if (listOfFiles[i].isFile()) {
		list += "<div class='icons-list' elem-name='"+listOfFiles[i].getName().split("_")[1]+"'><span class='fa fa-file fa-icons'><label id='newfile'>"+listOfFiles[i].getName().split("_")[1]+"</label></span></div>";
	  } else if (listOfFiles[i].isDirectory()) {
		list += "<div class='icons-list' elem-name='"+listOfFiles[i].getName().split("_")[1]+"'><span class='fa fa-folder fa-icons'><label id='newfolder'>"+listOfFiles[i].getName().split("_")[1]+"</label></span></div>";	  
	  }
	}
	return list;
}

public String createFile(String path){
	final String fileName = "Newfile";
	String createdFile = "";
	File newFile = new File(path+"/"+fileName);
	try{
		int count = 0;
		createdFile = fileName;
		while(!newFile.createNewFile()){
			count++;
			String temp_fileName = fileName+" ("+count+")";
			newFile = new File(path+"/"+temp_fileName);
			if(newFile.createNewFile()){
				createdFile = temp_fileName;
				break;
			}
		}
	}catch(Exception ex){System.out.println("Err035: "+ex.toString());}
	return createdFile;
}
public String createFolder(String path){
	final String folderName = "New folder";
	String createdFolder = "";
	File newDir = new File(path+"/"+folderName);
	try{
		int count = 0;
		createdFolder = folderName;
		if(newDir.exists()){
			while(newDir.exists()){
				count++;
				String temp_folderName = folderName+" ("+count+")";
				newDir = new File(path+"/"+temp_folderName); 
				if(!newDir.exists()){
					createdFolder = temp_folderName;
					newDir.mkdir();
					break;
				}
			}
		}
		else
			newDir.mkdir();		
	}catch(Exception ex){}
	return createdFolder;
}
public boolean deleteFile(String path, String fileName){
	try{		
		String fullPath = path+"/"+fileName;
		File file =new File(fullPath);
		System.out.println(path+"/" + file.getName());
		if(file.renameTo(new File(path+"/" + file.getName()))){
			return true;
		}else{
			return false;
		}  
	}catch(Exception e){
		System.out.println("Err45 : "+e.toString());
	}
	return false;	
}
public boolean movetoTrash(String src, String dest){
	Path s = null;
	try{
		s = Files.move(Paths.get(src), Paths.get(dest));
	}catch(Exception ex){	
	}
	return (s==null)?false:true;
}	
%>
<%
if(request.getParameter("event").equals("createFile"))
	out.println(createFile(request.getRealPath("/data/")));
if(request.getParameter("event").equals("createFolder"))
	out.println(createFolder(request.getRealPath("/data/")));	
if(request.getParameter("event").equals("delete")){
	String timestamp = String.valueOf(System.currentTimeMillis());
	//out.println(deleteFile(request.getRealPath("/data/")+"/"+request.getParameter("filename"),request.getRealPath("/trash/")+"/"+timestamp+"_"+request.getParameter("filename")));	
	boolean b = movetoTrash(request.getRealPath("/data/")+"/"+request.getParameter("filename"),request.getRealPath("/trash/")+"/"+timestamp+"_"+request.getParameter("filename"));
	if(b==false)
		out.println("<script>alert('Can not delete');</script>");
	out.println(getList(request.getRealPath("/data/")));	
}	
if(request.getParameter("event").equals("trash")){
	out.println(trashList(request.getRealPath("/trash/")));
}
%>
