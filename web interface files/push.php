<?php
$push_message="";
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Database connection parameters
    $servername = "localhost"; // Assuming MySQL server is hosted on the same machine
    $username = "root";
    $password = ""; // Assuming the password is empty
    $dbname = "suzannecollins";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Set parameters and execute
    $user_name = $_POST['user_name'];
    $user_email = $_POST['user_email'];
    $user_password = $_POST['user_password']; // Added password field
    $favourite_series_ID = isset($_POST['favourite_series_ID']) ? $_POST['favourite_series_ID'] : null; 
    $favourite_book_ID = isset($_POST['favourite_book_ID']) ? $_POST['favourite_book_ID'] : null; 

    // Prepare and bind the SQL statement
    $stmt = $conn->prepare("INSERT INTO customerInfo (user_name, user_email, user_password, favourite_series_ID, favourite_book_ID) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssi", $user_name, $user_email, $user_password, $favourite_series_ID, $favourite_book_ID); // Updated bind_param

    // Execute the statement and check for errors
    if ($stmt->execute()) {
        $push_message = "New records inserted successfully!";
    } else {
        $push_message = "Error inserting data: " . $stmt->error;
    }

    // Close statement
    $stmt->close();

    // Close database connection
    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Favorites</title>
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
        echo "<div class='success-message'>$push_message</div><br>"; // Added <br> tag for line break
        echo "<a  class='back' href='index.html'>Go back to the main page</a>";
        ?>
    </div>
</body>
</html>
