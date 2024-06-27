<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "loginsystem";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        if ($username == "admin") {
            header("Location: admin.php");
        } else {
            header("Location: home.html");
        }
    } else {
        echo "Invalid username or password. <a href='index.html'>Try again</a>";
    }

    $conn->close();
}
?>
