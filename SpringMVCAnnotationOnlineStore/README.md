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

5. Setup SQL Server and Docker
  - Download and install Docker via https://store.docker.com/editions/community/docker-ce-desktop-mac (for mac only)
  - Open Terminal and execute:
```
sudo docker pull microsoft/mssql-server-linux:2017-latest
```
  - Launch Docker
  - When it has finished launching (it usually takes a moment) select the new whale icon at the top of your screen
  - Click "Preferences > Advanced"
  - Allocate at least 3.25 MB (Note that this is for SQL Server, Docker by default has 2 MB allocated to it already)
  - Select "Apply and Restart"
  - From the terminal execute:
```
sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=YourStrong!Passw0rd' -p 1401:1433 --name sqlserver1 -d microsoft/mssql-server-linux:2017-latest
```
  **Leave YourStrong!Passw0rd as it is to avoid extra source-control issues going forward**
  - Run:
```
docker ps -a
```
  - Ensure your SQL Server image has a status of "Up _ seconds" and not "Exited"

6. Install SQL Operations Studio (aka Azure Data Studio)
  - Install from https://github.com/Microsoft/sqlopsstudio
  - Unpack and install
  - Open the app
  - You will be presented with a Connection screen
  - Use "localhost" for the server, "sa" for the User name, "YourStrong!Passw0rd" for the password
  - Click Advanced
    - Scroll to the "General" section
    - Type "1401" for the port
  - Click Apply > Connect

  ![SQL Operations Studio Connection Screen]
  https://static1.squarespace.com/static/58c821ad197aeab4514c904f/t/5ab98a6e8a922d0efd9b05c9/1522109050997/03ops_studio_connect.png?format=2500w

  - Upload data (Optional?)
    - I believe this is optional prior to running the program, but if it's not then I'll include test scripts in the repo

7. Import Maven project
    - From Eclipse's Workbench, select "File > Import"
    - Select "Existing Maven Projects"
    - Select "browse.."
    - Choose "CIS556_Project" in the current workspace > Select Open
    - Ensure Project is selected and then press "Finish"
    - Now right click the project in the workspace
    - Select "Maven > Update Project...""

    ![Eclipse Workbench > Maven > Update Project]
    https://i.stack.imgur.com/9RLv5.png

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
