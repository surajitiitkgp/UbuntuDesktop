# UbuntuDesktop
Create a web desktop -GUI like Ubuntu 18.04.

#### A webpage is created, which looks like the desktop view of ubuntu 18.04. It also supports certain UI features and operations like 
  ##### -Create a new folder.
  ##### -Create a new file.
  ##### -Delete a file and put it into the trash.
  ##### -All the above features accessible through mouse events.
  
  The `index.jsp` file provides the graphical user interface (GUI), which looks like the desktop view of ubuntu 18.04. 
  The `custom.css` file contains the CSS for `index.jsp` page.
  The `custom.js` file provides two context menu; one is used for creating folder and file, and another is used for deleting the folder/file. One digital clock is also implemented through the javascript; The corresponding code is also incorporated.
  The functional operations are implemented in the `ceate.jsp` file.
  
  ### Installation and running process:
   #### -- Install Tomcat7 or upper version.
   #### -- Copy the UbuntuDesktop package in the webapps folder (`Tomcat x.y\webapps\UbuntuDesktop`).
   #### -- Run Tomcat server.
   #### -- Open http://localhost:8080/UbuntuDesktop/ in browser.
