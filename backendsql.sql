-- Create a new database
CREATE DATABASE device_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Switch to it
USE device_management;

CREATE USER 'device_admin'@'localhost' IDENTIFIED BY 'StrongPassword123';
GRANT ALL PRIVILEGES ON device_management.* TO 'device_admin'@'localhost';
FLUSH PRIVILEGES;

