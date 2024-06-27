<?php
session_start();

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["status" => "error", "message" => "User not logged in."]);
    exit();
}

include "dbbooking.php";

// Fetch user details from the session or database
$user_id = $_SESSION['user_id'];
$user_query = "SELECT username, contact FROM users WHERE id = '$user_id'";
$user_result = $conn->query($user_query);

if ($user_result->num_rows == 0) {
    echo json_encode(["status" => "error", "message" => "User details not found."]);
    exit();
}

$user = $user_result->fetch_assoc();
$username = $user['username'];
$contact = $user['contact'];

// Sanitize input data
$type = $conn->real_escape_string($_POST['type']);
$date = $conn->real_escape_string($_POST['date']);
$time = $conn->real_escape_string($_POST['time']);

// Check availability before inserting
$check_sql = "SELECT * FROM bookings WHERE date = '$date' AND time = '$time'";
$result = $conn->query($check_sql);

if ($result->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "This time slot is already booked. Please choose another time."]);
    exit();
}

// Insert booking into the database
$sql = "INSERT INTO bookings (username, service_type, date, time, contact, status)
        VALUES ('$username', '$type', '$date', '$time', '$contact', 'Booked')";

if ($conn->query($sql) === TRUE) {
    // Fetch the last inserted ID for invoice generation
    $last_id = $conn->insert_id;

    // Fetch service name
    $service_sql = "SELECT name FROM services WHERE id = '$type'";
    $service_result = $conn->query($service_sql);
    $service_name = $service_result->fetch_assoc()['name'];

    // Prepare invoice data
    $invoice = [
        "username" => $username,
        "service" => $service_name,
        "date" => $date,
        "time" => $time,
        "contact" => $contact
    ];

    echo json_encode(["status" => "success", "message" => "Your booking has been submitted successfully!", "invoice" => $invoice]);
} else {
    echo json_encode(["status" => "error", "message" => "Error: " . $sql . "<br>" . $conn->error]);
}

// Close connection
$conn->close();
?>
