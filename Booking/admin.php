<?php
include "dbbooking.php";

// Handle status update
if (isset($_POST['action']) && isset($_POST['id'])) {
    $id = $_POST['id'];
    $action = $_POST['action'];

    if ($action === 'delete') {
        // Delete booking
        $sql = "DELETE FROM bookings WHERE id = $id";
        $conn->query($sql);
    } else {
        $status = $action === 'approve' ? 'Approved' : 'Rejected';

        // Update booking status
        $sql = "UPDATE bookings SET status = '$status' WHERE id = $id";
        $conn->query($sql);

        // Make time slot available again if rejected
        if ($action === 'reject') {
            $sql = "UPDATE bookings SET status = 'Available' WHERE id = $id";
            $conn->query($sql);
        }
    }
}

// Fetch all bookings
$sql = "SELECT b.id, b.username, s.name AS service, b.date, b.time, b.contact, b.status 
        FROM bookings b 
        JOIN services s ON b.service_type = s.id";
$result = $conn->query($sql);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Bookings</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 15px;
            text-align: left;
        }
        table th {
            background-color: #f8f8f8;
            border-bottom: 2px solid #dee2e6;
        }
        table tr {
            border-bottom: 1px solid #dee2e6;
        }
        table tr:last-child {
            border-bottom: none;
        }
        .status-active {
            color: green;
            font-weight: bold;
        }
        .status-inactive {
            color: red;
            font-weight: bold;
        }
        .contact {
            color: #007bff;
            text-decoration: none;
        }
        .contact:hover {
            text-decoration: underline;
        }
        .action-btns {
            display: flex;
            gap: 10px;
        }
        .action-btns form {
            display: inline-block;
        }
        .btn-approve {
            color: white;
            background-color: green;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .btn-reject {
            color: white;
            background-color: red;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .btn-delete {
            color: white;
            background-color: #555;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h2>All Booked Customers</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Service</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Contact</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>{$row['id']}</td>
                                <td>{$row['username']}</td>
                                <td>{$row['service']}</td>
                                <td>{$row['date']}</td>
                                <td>{$row['time']}</td>
                                <td><a href='tel:{$row['contact']}' class='contact'>{$row['contact']}</a></td>
                                <td class='" . ($row['status'] === 'Booked' ? 'status-active' : 'status-inactive') . "'>{$row['status']}</td>
                                <td class='action-btns'>
                                    <form method='post'>
                                        <input type='hidden' name='id' value='{$row['id']}'>
                                        <input type='hidden' name='action' value='approve'>
                                        <input type='submit' class='btn-approve' value='Approve'>
                                    </form>
                                    <form method='post'>
                                        <input type='hidden' name='id' value='{$row['id']}'>
                                        <input type='hidden' name='action' value='reject'>
                                        <input type='submit' class='btn-reject' value='Reject'>
                                    </form>
                                    <form method='post'>
                                        <input type='hidden' name='id' value='{$row['id']}'>
                                        <input type='hidden' name='action' value='delete'>
                                        <input type='submit' class='btn-delete' value='Delete'>
                                    </form>
                                </td>
                            </tr>";
                    }
                } else {
                    echo "<tr><td colspan='8'>No bookings found</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
<?php
$conn->close();
?>