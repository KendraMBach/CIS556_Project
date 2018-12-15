# Core Java Application
This directory contains the source for all core operations and entity representations. The purpose of this README is to provide a high-level overview of the contents and the general organization of this directory, but will not provide full specifications. If you have questions, we urge you to reach out to the repository maintainers.

## Overview
The sub-directories control all logic from hibernate calls to front-end rendering of JSP. A very basic overview can be seen in the [DEVELOPER READEME](../DEVELOPER.md). Below are a few notes regarding important sections of the code:

### Important Contents
1. [Java controllers](src/main/java/org/o7planning/springmvconlinestore/controller/): drive the main logic of the program and manage external technology.
1. [Java DAO](src/main/java/org/o7planning/springmvconlinestore/dao/): Manage calls to the MySQL server.
1. [Java Entities](src/main/java/org/o7planning/springmvconlinestore/entity/): Are functional representations of the entities including datatype and attribute specifications.
1. [Java Model](src/main/java/org/o7planning/springmvconlinestore/model/): Manage front end representations.
1. [Maven Build Spec](pom.xml): Maven build details
