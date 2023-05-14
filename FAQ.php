<?php 
    include('includes/header.php');
?>
<?php
    // Connect to database
    $conn = new mysqli('localhost:3307', 'root', '', 'estore');

    // Check if insert form is submitted
    if (isset($_POST["submit"]))
    {
        // Create table if not already created
        $sql = "CREATE TABLE IF NOT EXISTS faqs (
            id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
            question TEXT NULL,
            answer TEXT NULL,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        )";
        $statement = $conn->prepare($sql);
        $statement->execute();

        // Insert in faqs table
        $sql = "INSERT INTO faqs (question, answer) VALUES (?, ?)";
        $statement = $conn->prepare($sql);
        $statement->bind_param("ss", $_POST["question"], $_POST["answer"]);
        $statement->execute();
    }
    
    // Query to get all FAQs
    $sql = "SELECT * FROM faqs ORDER BY id DESC";
    $statement = $conn->prepare($sql);
    $statement->execute();
$result = $statement->get_result();
$faqs = $result->fetch_all(MYSQLI_ASSOC);

?>


<!-- include bootstrap, font awesome and rich text library CSS -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="richtext/richtext.min.css" />
 
<!-- include jQuery, bootstrap and rich text JS -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="richtext/jquery.richtext.js"></script>


<!-- Layout for form to add FAQ -->
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
    <div class="row">
        <div class="offset-md-3 col-md-6">
            <h1 class="text-center">Add FAQ</h1>

            <!-- Form to add FAQ -->
            <form method="POST" action="FAQ.php">

                <!-- Question -->
                <div class="form-group">
                    <label>Enter Question</label>
                    <input type="text" name="question" class="form-control" required />
                </div>

                <!-- Answer -->
                <div class="form-group">
                    <label>Enter Answer</label>
                    <textarea name="answer" id="answer" class="form-control" required></textarea>
                </div>

                <!-- Submit button -->
                <input type="submit" name="submit" class="btn btn-info" value="Add FAQ" />
            </form>
        </div>
    </div>

    <!-- Show all FAQs added -->
    <div class="row">
        <div class="offset-md-2 col-md-8">
            <table class="table table-bordered">
                <!-- Table heading -->
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Question</th>
                        <th>Answer</th>
                </tr>
            </thead>
 
  <!-- table body -->
<tbody>
    <?php if (!empty($faqs)): ?>
        <?php foreach ($faqs as $faq): ?>
            <tr>
                <td><?php echo !empty($faq["id"]) ? $faq["id"] : ""; ?></td>
                <td><?php echo !empty($faq["question"]) ? $faq["question"] : ""; ?></td>
                <td><?php echo !empty($faq["answer"]) ? $faq["answer"] : ""; ?></td>
            </tr>
        <?php endforeach; ?>
    <?php else: ?>
        <tr>
            <td colspan="3">No FAQs found.</td>
        </tr>
    <?php endif; ?>
</tbody>


        </table>
    </div>
</div>
 
</div>
