# UbuntuDesktop
Create web desktop - UI like Ubuntu 18.04.

A webpage is created, which looks like the desktop view of ubuntu 18.04. It also supports the certain UI features and operations like 
  -Create a new folder
  -Create a new file
  -Delete a file and put it into trash
  -All the above features accessable through mouse event.
  
  The `index.jsp` file provides the graphical user interface (GUI), which looks like desktop view of ubuntu 18.04. 
  The `custom.css` file provides the the css for `index.jsp` page.
  The `custom.js` file provides two context menu, one is used for creating folder and file, another is used for deleteing the folder/file. One digital clock is also implemented through the javascript, the corresponding code is also incorporated.
  The functional operations are executed by the `ceate.jsp` file.
  
  #Installation and running process
   -- Install Tomcat7 or upper version
   -- Copy the UbuntuDesktop package in the webapps folder (`Tomcat x.y\webapps\UbuntuDesktop`).
   -- Run Tomcat server
   -- Open http://localhost:8080/UbuntuDesktop
