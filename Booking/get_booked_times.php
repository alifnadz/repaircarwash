<?php
if (isset($_GET['date'])) {
    include "dbbooking.php";
    $date = $_GET['date'];
    $sql = "SELECT time FROM bookings WHERE date = '$date'";
    $result = $conn->query($sql);

    $bookedTimes = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $bookedTimes[] = $row['time'];
        }
    }
    echo json_encode($bookedTimes);
    $conn->close();
}
?>
