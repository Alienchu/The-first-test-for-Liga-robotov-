<?php
$comment = $_POST['comment'];
$name = $_POST['name'];
$address = $_POST['address'];
$email = $_POST['email'];
$phone = $_POST['phone'];

// Validate required fields
if (empty($name) || empty($phone)) {
    die('Full Name and Mobile Phone are required fields.');
}

// Validate email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die('Invalid email address.');
}

// Validate phone number
if (!preg_match("/^\d{3}-\d{3}-\d{4}$/", $phone)) {
    die('Invalid phone number. Please use format: 123-456-7890');
}

// Check if email domain is @gmail.com
if (strpos($email, '@gmail.com') !== false) {
    die('Registration with Gmail address is not allowed.');
}

// Save data to SQLite database
try {
    $db = new SQLite3('contacts.db');
    $stmt = $db->prepare('INSERT INTO contacts (comment, name, address, email, phone) VALUES (:comment, :name, :address, :email, :phone)');
    $stmt->bindValue(':comment', $comment);
    $stmt->bindValue(':name', $name);
    $stmt->bindValue(':address', $address);
    $stmt->bindValue(':email', $email);
    $stmt->bindValue(':phone', $phone);
    $stmt->execute();
    $db->close();
    echo 'Form submitted successfully!';
} catch (Exception $e) {
    die('Error: ' . $e->getMessage());
}
?>
