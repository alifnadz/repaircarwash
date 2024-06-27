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
    $name = $_POST['name'];
    $username = $_POST['username'];
    $user_phoneNO = $_POST['user_phoneNO'];
    $email = $_POST['email'];
    $password = $_POST['password']; // Storing the password as plain text (not recommended for production)

    $sql = "INSERT INTO users (name, username, user_phoneNO, email, password) VALUES ('$name', '$username', '$user_phoneNO', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        $message = "Registration successful. <a href='index.html'>Login here</a>";
        header("Location: register.html?message=" . urlencode($message));
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
