# CIS556_Project
# Online Jewelry Store

A Java Spring MVC eCommerce website for customers to view Jewelry inventory and place orders.
Dependencies include Java 1.8, Maven, Spring, Hibernate, Tomcat 7, Eclipse IDE (ie Photon), SQL Server, Docker and Azure Data Studio.  

## Getting Started

The following instructions will allow you to run the application locally on localhost:8080

### Prerequisites

1. Java 1.8
    - Open a (Unix) terminal
    - Execute the following:
```
java -version
```
    - Ensure it reads (or something similar):
```    
java version "1.8.0_181"
Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)
```
    - If not, download it here:
     https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

2. Eclipse IDE
    - Download from https://www.eclipse.org
    - Choose a version (I use Photon: https://www.eclipse.org/photon/)
    - Install

3. Configure Git in eclipse
    - This is optional, but pretty useful
    - If you want to go this route, follow the instructions outlined here: https://github.com/collab-uniba/socialcde4eclipse/wiki/How-to-import-a-GitHub-project-into-Eclipse

4. Tomcat 7
    - Downloading Tomcat
      - Navigate to https://tomcat.apache.org/download-70.cgi
      - Find zip distribution and download it.
    - Installing Tomcat
      - Unzip downloaded file and place the Tomcat 7 directory named apache-tomcat-7.x.yy somewhere on your drive (location isn't significant as long as you know where it's at)
    - Configuring Eclipse and Tomcat
      - In Eclipse navigate to a Server view,
      - Right click and select New -> Server,
      - Navigate to Apache and select Tomcat v7.0 Server,
      - Click Next,
      - In the Tomcat installation directory section click Browse... and pick up the directory where you installed Tomcat,
    - Click Finish.

5. Setup MySQL and setup MySQL Workbench with test script
  - Download and install MySQL: https://dev.mysql.com/downloads/mysql/
    - When prompted for a password, use: YourStrong!Passw0rd
      - This will eliminate version control issues
    - Ensure the box asking to start MySQL now (or something to that effect) is checked

**The following block is strictly for those who have chosen to save their project in the eclipse-workspace folder**    
  - Open and instance of Finder (Mac Only)
    - Select Finder > Preferences > Sidebar > Ensure "macowner" next to the small house icon is checked
    - Exit Preferences
      - This will all make sense later
**End**

  - Now download and install MySQL Workbench: https://dev.mysql.com/downloads/workbench/
  - Once installed, run the application
    - Double click on your local instance 3306 on initial screen
      - From the MySQLWorkbench toolbar select: File > Run SQL script...
**If your project exists inside eclipse-workspace**
        - Navigate to "macowner" from the sidebar
          - Choose: eclipse-workspace > CIS556_Project > SpringMVCAnnotationOnlineStore > TestScript.sql
          - Select "Open"
          - Select "Run"
**Otherwise...**
        - Navigate to your project folder
          - Choose: CIS556_Project > SpringMVCAnnotationOnlineStore > TestScript.sql
          - Select "Open"
          - Select "Run"

### Run

8. Run the Project
  - Right click project in Eclipse's Package Explorer (Workbench view)
  - Select "Run As > Run Configurations..."
  - Right Click on Maven Build (m2)
  - Select New
  - On new screen:
    - Name: Run Spring MVC Online Store
    - Base Directory: ${workspace_loc:/SpringMVCAnnotationOnlineStore}
    - Goals: tomcat7:run
  - Click "Apply"
  - Select "Run"

Navigate to http://localhost:8080/SpringMVCAnnotationOnlineStore in your browser.
If you receive a stack trace with a 500 error - do not fret! Just contact Kendra Bach instead.
Or feel free to research the error you're getting. If it's a 404, refer back to you "Console" on Eclipse and see what error you are receiving there. More than likely, it's an easy config fix.

## Built With

* [Paper Kit 2](https://demos.creative-tim.com/paper-kit-2/index.html) - UI Kit Used
* [Maven](https://maven.apache.org/) - Dependency Management
* [Eclipse](https://www.eclipse.org) - Deployment IDE
* [Tomcat7](https://tomcat.apache.org) - Java Servlet / JSP Deployment
* [Docker](https://store.docker.com) - Database (SQL Server) Consolidation and Connectivity
* [SQL Operations Studio](https://github.com/Microsoft/sqlopsstudio) - Mac DB Interface


## Contributing

Contact Cooper Stansbury for collaboration requests.

## License

After project deadline (12/18/2018) this project will be licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* Java Spring Setup Reference - https://o7planning.org
* Font Style - https://pixelify.net/downloads/coldiac/
