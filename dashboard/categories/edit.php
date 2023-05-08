<?php 
    include('../includes/header.php'); 
    include('../../classes/CRUD.php');
    
    $crud = new CRUD;
    $category = $crud->read('categories', ['column' => 'id', 'value' => $_GET['id']] ,1);

    $errors = [];

    if(isset($_POST['update_category_btn'])) {
        $id = $_POST['id'];
        $name = $_POST['name'];

        if(empty($name)) {
            $errors[] = 'Name is empty!';
        }

        if(empty($id)) {
            header('Location: index.php');
        }

        if($crud->update('categories', ['name' => $name], ['column' => 'id', 'value' => $id]) === true) {
            header('Location: index.php?action=update&status=success');
        } else {
            $errors = 'Something want wrong!';
        }
    }
?>
