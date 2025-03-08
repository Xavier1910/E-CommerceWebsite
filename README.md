# LuxeLane E-Commerce Website

## Project Overview
LuxeLane is a full-stack e-commerce web application built using **HTML, CSS, JavaScript, Spring Boot, and MySQL**. It provides a seamless shopping experience, including product management, user authentication, order processing, and cart functionalities.

## Technologies Used
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Spring Boot (Java)
- **Database:** MySQL
- **Build Tool:** Maven

## Project Structure

```
LuxeLane/
│
├── Frontend/
│   ├── .vscode/
│   ├── assets/
│   ├── css/
│   ├── img/
│   ├── js/
│   ├── AddProduct.html
│   ├── Address.html
│   ├── AdminLogin.html
│   ├── cart.html
│   ├── content.html
│   ├── contentDetails.html
│   ├── footer.html
│   ├── header.html
│   ├── index.html
│   ├── orderPlaced.html
│   ├── OrderProduct.html
│   ├── ProductList.html
│   ├── slider.html
│   ├── subHeader.html
│   ├── UserOrders.html
│   ├── userReg.html
│
├── Backend/
│   ├── .mvn/
│   ├── .settings/
│   ├── src/
│   ├── target/
│   ├── uploads/
│   ├── .classpath
│   ├── .gitattributes
│   ├── .gitignore
│   ├── .project
│   ├── HELP.md
│   ├── mvnw
│   ├── mvnw.cmd
│   ├── pom.xml
│
├── Database/
│   ├── shoplane_address.sql
│   ├── shoplane_order_details.sql
│   ├── shoplane_order_products.sql
│   ├── shoplane_product.sql
│   ├── shoplane_users.sql
```

## Features
- **User Authentication:** Registration and login system
- **Product Management:** Admins can add, update, and delete products
- **Shopping Cart:** Users can add and remove products
- **Order Processing:** Users can place orders, and order details are stored in the database
- **Responsive UI:** Optimized for various screen sizes

## Setup Instructions
### Prerequisites
- Java 17+
- Spring Boot
- MySQL Database
- Node.js (optional for frontend enhancements)
- Maven

### Steps to Run
#### Backend
1. Navigate to the backend folder:
   ```sh
   cd backend/LuxeLane
   ```
2. Build and run the Spring Boot application:
   ```sh
   mvn spring-boot:run
   ```
3. The API will be available at `http://localhost:8080`

#### Database Setup
1. Create a MySQL database named `shoplane`.
2. Import the SQL scripts from the `Database` folder.
3. Update `application.properties` in the backend to match your database credentials.

#### Frontend
1. Open the `Frontend` folder in a browser or run a local server.
2. Modify the JavaScript API URLs to match the backend URL.

## Contribution
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch`
3. Commit your changes: `git commit -m 'Add new feature'`
4. Push to the branch: `git push origin feature-branch`
5. Submit a pull request.

## License
This project is open-source and available under the [MIT License](LICENSE).

