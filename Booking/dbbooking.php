<?php
// Enter your host name, database username, password, and database name.
$host = "localhost";
$user = "root";
$password = "";
$db = "booking";

// Create connection
$conn = new mysqli($host, $user, $password, $db);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}