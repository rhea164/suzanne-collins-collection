<?php
$update_message = "";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection parameters
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "suzannecollins";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get user's email from the form
    $user_email = $_POST['user_email'];
    $favourite_series_ID = $_POST['favourite_series_ID'];
    $favourite_book_ID = $_POST['favourite_book_ID'];

    // Prepare and bind the SQL statement
    $stmt = $conn->prepare("UPDATE customerinfo SET favourite_series_ID = ?, favourite_book_ID = ? WHERE user_email = ?");
    $stmt->bind_param("sss", $favourite_series_ID, $favourite_book_ID, $user_email);

    // Execute the statement and check for errors
    if ($stmt->execute()) {
        $update_message = "Update successful!";
    } else {
        $update_message = "Error updating data: " . $stmt->error;
    }

    // Close statement and database connection
    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Favorites</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #222;
            color: #fff;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .message {
            max-width: 400px;
            margin: 20px;
            padding: 20px;
            background-color: #444;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .success-message {
            background-color: #eea236;
            color: black;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .back{
            color: #eea236;
        }
    </style>
</head>
<body>
    <div class="message">
        <?php 
        echo "<div class='success-message'>$update_message</div><br>"; // Added <br> tag for line break
        echo "<a  class='back' href='index.html'>Go back to the main page</a>";
        ?>
    </div>
</body>
</html>
