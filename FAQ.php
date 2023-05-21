<?php
include('includes/header.php'); 

// Check if the user is logged in
if (!isset($_SESSION['role'])) {
  // Redirect to the login page or display an error message
  header("Location: login.php");
  exit();
}

// Connect to the database
$servername = 'localhost:3306';
$username = 'root';
$password = '';
$dbname = 'onlinestore';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Check the user's role
$role = $_SESSION['role'];

if ($role === "customer") {
  // Display the question form for customers
  echo "<div class='container'>";
  echo "<h1 class='text-center'>FAQ Page - Customer</h1>";
  echo "<div class='row justify-content-center'>";
  echo "<div class='col-md-6'>";
  echo "<form action='process_question.php' method='POST'>";
  echo "<div class='form-group'>";
  echo "<label for='question'>Ask a Question:</label>";
  echo "<textarea class='form-control' id='question' name='question' rows='4' cols='50'></textarea>";
  echo "</div>";
  echo "<div class='text-center'>";
  echo "<button type='submit' class='btn btn-primary'>Submit Question</button>";
  echo "</div>";
  echo "</form>";
  echo "</div>";
  echo "</div>";
  echo "</div>";
} elseif ($role === "1") {
  // Check if an answer has been submitted
  if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['answer'])) {
    // Get the submitted answer and question ID
    $answer = $_POST['answer'];
    $questionId = $_POST['question_id'];

    // Update the corresponding question with the answer in the database
    $sql = "UPDATE questions SET answered = 1, answer = '$answer' WHERE id = $questionId";
    if ($conn->query($sql) === TRUE) {
      echo "<div class='container'>";
      echo "<p class='text-center text-success'>Answer submitted successfully!</p>";
      echo "</div>";
    } else {
      echo "<div class='container'>";
      echo "<p class='text-center text-danger'>Error updating answer: " . $conn->error . "</p>";
      echo "</div>";
    }
  }

  // Retrieve questions and answers from the database
  $sql = "SELECT * FROM questions";
  $result = $conn->query($sql);

  // Display the questions and answers in a table
  echo "<div class='container'>";
  echo "<h1 class='text-center'>FAQ Page - Admin</h1>";
  echo "<div class='row justify-content-center'>";
  echo "<div class='col-md-8'>";
  echo "<form action='faq.php' method='POST'>";
  echo "<div class='form-group'>";
  echo "<label for='question_id'>Question ID:</label>";
  echo "<input type='number' class='form-control' name='question_id'>";
  echo "</div>";
  echo "<div class='form-group'>";
  echo "<label for='answer'>Answer:</label>";
  echo "<textarea class='form-control' id='answer' name='answer' rows='4' cols='50'></textarea>";
  echo "</div>";
  echo "<div class='text-center'>";
  echo "<button type='submit' class='btn btn-primary'>Submit Answer</button>";
  echo "</div>";
  echo "</form>";
  echo "<br>";
  // Display the questions and answers in a table
  if ($result->num_rows > 0) {
  echo "<table class='table'>";
  echo "<thead><tr><th>Question ID</th><th>Question</th><th>Answer</th></tr></thead>";
  echo "<tbody>";
  while ($row = $result->fetch_assoc()) {
  echo "<tr>";
  echo "<td>" . $row['id'] . "</td>";
  echo "<td>" . $row['question'] . "</td>";
  echo "<td>" . $row['answer'] . "</td>";
  echo "</tr>";
  }
  echo "</tbody>";
  echo "</table>";
  } else {
  echo "<p class='text-center'>No questions and answers to display.</p>";
  }
  echo "</div>";
  echo "</div>";
  echo "</div>";
  }
  
  // Close the database connection
  $conn->close();
  ?>
  
<?php include('includes/footer.php'); ?>
