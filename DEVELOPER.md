# Developer
This README includes details on the technology stack and instructions for getting started. There are three main folders in this repository:

1. [SpringMVCAnnotationOnlineStore](SpringMVCAnnotationOnlineStore): The web application
1. [database](database): database initial state specification
1. [pythonFunctions](pythonFunctions): SMPT email functionality

## Architecture Overview
1. [Java controllers](SpringMVCAnnotationOnlineStore/src/main/java/org/o7planning/springmvconlinestore/controller/)
1. [Java DAO](SpringMVCAnnotationOnlineStore/src/main/java/org/o7planning/springmvconlinestore/dao/)
1. [Java Entities](SpringMVCAnnotationOnlineStore/src/main/java/org/o7planning/springmvconlinestore/entity/)
1. [Java Model](SpringMVCAnnotationOnlineStore/src/main/java/org/o7planning/springmvconlinestore/model/)

### Overview Diagram
![Architecture](Architecture.png)

## Dependencies
This project has a number of software dependencies. The major technologies are covered below, with links to further resources.

1. [Java 1.8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html): Core application language
1. [Python 3.6](https://www.python.org/downloads/release/python-360/): Email receipt functionality
1. [Eclipse](https://www.eclipse.org): Deployment IDE
1. [Tomcat7](https://tomcat.apache.org): Java Servlet / JSP Deployment
1. [MySQL (8) Community Server](https://dev.mysql.com/downloads/mysql/): database server
1. [MySQL Workbench](https://dev.mysql.com/downloads/workbench/): database management system (GUI)
1. [Maven](https://maven.apache.org/): Dependency Management
1. [git](https://git-scm.com/) and [GitHub](https://github.com/)

## Getting Started
The following instructions will allow you to run the application locally on `localhost:8080`. The default MySQL configuration points to `localhost:3306`. The MySQL configuration is specified in [ds-hibernate-cfg.properties](SpringMVCAnnotationOnlineStore/src/main/resources/ds-hibernate-cfg.properties).


1. Check dependencies. This is especially important for developers with multiple Java/Python environments. Suggested: `java -version; python -V`.
1. Install [Eclipse](https://www.eclipse.org). This is the deployment manager and the development tool.
1. [Configure Git in eclipse](https://github.com/collab-uniba/socialcde4eclipse/wiki/How-to-import-a-GitHub-project-into-Eclipse). This enables faster integration with updates to the source code.
1. [Install Tomcat](https://tomcat.apache.org/download-70.cgi): This is an open-source Java Server Container for development.
1. [Configure Eclipse and Tomcat](https://crunchify.com/step-by-step-guide-to-setup-and-install-apache-tomcat-server-in-eclipse-development-environment-ide/).
1. Start a new Tomcat 7 server:
    1. From Eclipse, navigate to server view
    1. Select New -> Server
    1. Navigate to Apache and select Tomcat v7.0 Server, click next
    1. In the Tomcat installation directory section browse to Tomcat installation location.
1. Setup MYSQL. This is the database build.
    1. Download and install [MySQL](https://dev.mysql.com/downloads/mysql/)
    1. Suggested: install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
    1. Align your installation of MySQL with the web application: [ds-hibernate-cfg.properties](SpringMVCAnnotationOnlineStore/src/main/resources/ds-hibernate-cfg.properties)
    1. In a new query window you can build the database and initialize test data by running the query: [all_in_one_create_jewlz.sql](database/all_in_one_create_jewlz.sql)
    1. Further details can be found in the [database](database) directory.

## Running the Application
Below are the steps required to run the application on `http://localhost:8080/SpringMVCAnnotationOnlineStore` from Eclipse.

1. Right click project in Eclipse's Package Explorer (Workbench view)
1. Select "Run As > Run Configurations..."
1. Right Click on Maven Build (m2)
1. Select New
1. On new screen:
    1. Name: Run Spring MVC Online Store
    1. Base Directory: ${workspace_loc:/SpringMVCAnnotationOnlineStore}
    1. Goals: tomcat7:run
1. Click "Apply"
1. Select "Run"
1. Navigate to `http://localhost:8080/SpringMVCAnnotationOnlineStore` in your browser.

## Troubleshooting
If you receive a stack trace with a `500 error` - do not fret! Just contact Kendra Bach instead.
Or feel free to research the error you're getting. If it's a `404`, refer back to you "Console" on Eclipse and see what error you are receiving there. More than likely, it's an easy config fix, or terminal command.

For `500 error` along with output in Eclipse Console that states something like:
```
SEVERE: Failed to initialize end point associated with ProtocolHandler ["http-bio-8080"]
java.net.BindException: Address already in use (Bind failed) <null>:8080
```
**Fix:**
1. Press the red button on Eclipse's Console window
1. Open a new terminal window
1. Run: `lsof -i :8080 | grep LISTEN`
1. You will likely see something like:
```
java      5748 UserName  127u  IPv6 0x607148bec30d6e71      0t0  TCP *:http-alt (LISTEN)
```
1. Run: `kill -15 5748`. **Note-** The number (`5748`) may be different. Copy and paste the number you see from the output in your command.
1. Run the first command again to ensure the process was properly terminated
1. If you receive an empty response (i.e. no processes show) then you're in the clear to back-step to Step 8 and run the process again
1. If you still see the same process lingering, run: `kill -9 5748`

### Notes
Every time the [pom.xml](SpringMVCAnnotationOnlineStore/pom.xml) is reconfigured a Maven build is necessary.
1. Right click on the project in Eclipse.
1. Navigate down to where you see "Maven" (6th item from the bottom of the menu)
1. Select it and choose "Update Project..."

## Acknowledgments
* Java Spring Setup Reference - https://o7planning.org
* Font Style - https://pixelify.net/downloads/coldiac/
