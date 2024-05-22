<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Book Information</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #222;
            color: #fff;
            line-height: 1.6;
        }

        #container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #333;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
            color: #f0ad4e;
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #555;
            box-sizing: border-box;
            margin-bottom: 20px;
            background-color: #444;
            color: #fff;
        }

        input[type="submit"] {
            width: calc(100% - 22px);
            padding: 12px 0;
            font-size: 16px;
            border-radius: 6px;
            background-color: #f0ad4e;
            color: #222;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #eea236;
        }

        input[type="submit"]:focus {
            outline: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f0ad4e;
            color: #222;
            text-transform: uppercase;
            font-weight: bold;
        }

        td {
            background-color: #444;
            color: #fff;
        }

        tr:hover {
            background-color: #555;
        }

        .awards-heading {
            text-align: center;
            text-transform: capitalize;
            color: #f0ad4e;
            margin-top: 30px;
        }

        .purchase-link {
            text-align: center;
        }

        .purchase-link a {
            color: #f0ad4e;
            text-decoration: none;
        }

        .purchase-link a:hover {
            color: #ffeb3b;
        }

        a.back-link {
            color: #f0ad4e;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }

        a.back-link:hover {
            color: #ffeb3b;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>Enter Your Email Address</h2>
        <form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
            Email: <input type="email" name="email" required>
            <input type="submit" name="submit" value="Submit">
        </form>
        <?php
        // Database connection details
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

        // Check if the form is submitted
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $email = $_POST["email"];

            // Query for the first table
            $sql1 = "SELECT c.user_name, b.title, b.pub_date, s.series_name, g.genre_name 
                     FROM customerInfo c, books b, series s, genre g
                     WHERE c.favourite_series_ID=s.series_ID 
                     AND c.favourite_book_ID=b.book_ID
                     AND b.genre_ID=g.genre_ID
                     AND c.user_email='$email'";
            $result1 = $conn->query($sql1);

            // Query for the awards table
            $sql2 = "SELECT b.title, a.achievement_name, a.year, a.description
                     FROM books b, achievements a, customerInfo c
                     WHERE c.favourite_book_ID=b.book_ID 
                     AND b.book_ID=a.book_id
                     AND c.user_email='$email'";
            $result2 = $conn->query($sql2);

            // Query for the purchase link
            $sql3 = "SELECT p.Purchase_Link
                     FROM purchase p, customerInfo c, books b
                     WHERE c.favourite_book_ID=b.book_ID
                     AND b.Purchase_ID=p.Purchase_ID
                     AND c.user_email='$email'";
            $result3 = $conn->query($sql3);

            if ($result1->num_rows > 0) {
                echo "<table>";
                while ($row = $result1->fetch_assoc()) {
                    echo "<tr><td>Username</td><td>" . ucfirst($row["user_name"]) . "</td></tr>";
                    echo "<tr><td>Favourite Book</td><td>" . ucwords($row["title"]) . "</td></tr>";
                    echo "<tr><td>Publication Date</td><td>" . $row["pub_date"] . "</td></tr>";
                    echo "<tr><td>Series</td><td>" . ucwords($row["series_name"]) . "</td></tr>";
                    echo "<tr><td>Genre</td><td>" . ucwords($row["genre_name"]) . "</td></tr>";
                }
                echo "</table>";
            } else {
                echo "No results found.";
            }

            // Display the awards table
            echo "<h3 class='awards-heading'>This book has won the following awards</h3>";
            echo "<table>";
            echo "<tr><th>Award</th><th>Year</th><th>Description</th></tr>";
            if ($result2->num_rows > 0) {
                while($row = $result2->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . ucfirst($row["achievement_name"]) . "</td>";
                    echo "<td>" . $row["year"] . "</td>";
                    echo "<td>" . $row["description"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='3'>No awards found.</td></tr>";
            }
            echo "</table>";

            // Display the purchase link
            if ($result3->num_rows > 0) {
                $row = $result3->fetch_assoc();
                echo "<p class='purchase-link'>You can purchase this book at: <a href='" . $row["Purchase_Link"] . "' target='_blank'>purchase link</a></p>";
            } else {
                echo "No purchase link found.";
            }
        }

        $conn->close();
        ?>
    </div>
<a href="index.html" class="back-link">Back</a>
</body>
</html>
