﻿# mini-project
# devanandd7-Room_Management_System_aip

# Room Management System (RMS)

## Acknowledgment
I would like to express my sincere gratitude to Assistant Professor Rohini Ma’am at Chandigarh University for her invaluable guidance, encouragement, and unwavering support throughout the course of this project. Her insightful feedback and expertise were instrumental in helping me successfully complete the "Student Management System" project.

I also extend heartfelt thanks to the Department of MCA, UIC, for providing the necessary resources and a conducive environment for this project. A special mention goes to those who generously contributed their time and knowledge, offering invaluable assistance during the project.

---

## Abstract
The Room Management System (RMS) is a web-based application developed using **Java**, **Hibernate**, **JPA**, **JSP**, and **MySQL**. This system allows users to book, manage, and view room availability. Admins have the ability to manage room details, view bookings, and handle user requests. The system is designed with **MVC architecture**, ensuring modularity, scalability, and efficient performance.

---

## Table of Contents
1. Introduction  
2. Objective  
3. Technologies Used  
4. Features and Functionalities  
5. System Architecture  
6. Database Design  
7. Advantages  
8. Conclusion  
9. References  

---

## Project Synopsis
### 1. Introduction
The Room Management System (RMS) is a web-based application designed to efficiently manage room bookings and administrative tasks. The system allows agents to register, log in, and access room details, availability, booking history, and customer information. Additionally, an admin module enables administrators to oversee room listings and manage agent bookings.

This system enhances user experience by providing an intuitive and responsive interface using JSP and Bootstrap, while Java technologies (Hibernate, JPA, Servlets) power the backend.

---

### 2. Objectives
- Provide a secure and user-friendly platform for agents to manage room bookings and availability.  
- Allow agents to view and update their profile information and room details.  
- Enable agents to access booking history and customer information.  
- Implement an admin module for managing room listings and overseeing agent activities.  
- Facilitate seamless authentication, updates, and logout functionalities.  

---

### 3. Technologies Used
- Backend: Java, Hibernate, JPA, Servlets.  
- Frontend: JSP, HTML, CSS, Bootstrap.  
- Database: MySQL.  
- Server: Apache Tomcat.  

---

### 4. Features and Functionalities

#### Agent Module:
- **Agent Registration & Login:** Secure registration and login functionality for agents.  
- **Agent Dashboard:** Personal details, room availability, booking history, and customer information are displayed.  
- **Profile Management:** Students can update or delete profiles with changes saved in the database.  
- **Room Bookings & Events Page:** View bookings, customer details, and upcoming events.

#### Admin Module:
- **Admin Dashboard:** Admins can oversee courses and monitor student enrollments.  

---

### 5. System Architecture
The system follows the MVC (Model-View-Controller) architecture:  
- **Model:** Managed using Hibernate and JPA for database operations.  
- **View:** JSP pages styled with Bootstrap for a responsive UI.  
- **Controller:** Servlets handle business logic and user interactions.  

---

### 6. Database Design
#### Table Schema:
- `agents (id, name, email, password)`  
- `admins (id, name, email, password)`  
- `Admin (id, agent_id, name, email)`  
- `events (id, name, date, description)`  
- `Agent (id, room_owner_name, mobile_no, months)`

---

### 7. Advantages
- Enhances data security and access control for agents and admins.  
- Simplifies room booking and management tasks.  
- Provides an intuitive user interface with a responsive design.  
- Ensures efficient data retrieval and management using Hibernate and JPA.  

---

### 8. Conclusion
The Room Management System effectively manages room bookings, agent details, and administrative tasks. By using Java-based technologies, the system offers a scalable and secure platform that streamlines operations, providing a seamless experience for agents and administrators while ensuring efficient room management.

---

### 9. References
1. [Hibernate Documentation](https://hibernate.org/documentation/)  
2. [Java Persistence API (JPA)](https://docs.oracle.com/javaee/7/tutorial/persistenceintro.htm)  
3. [MySQL Reference Manual](https://dev.mysql.com/doc/)  
