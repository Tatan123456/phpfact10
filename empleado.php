<?php

include_once './bd.php';

header('Access-Control-Allow-Origin: *');

if($_SERVER['REQUEST_METHOD'] == 'GET'){
    if(isset($_GET['ID_Empleado'])){
        $query="select * from empleado where ID_Empleado=".$_GET['ID_Empleado'];
        $result=metodoGet($query);
        echo json_encode($result->fetch(PDO::FETCH_ASSOC));
    }else{
        $query="select * from empleado";
        $result=metodoGet($query);
        echo json_encode($result->fetchAll());
    }
    header("HTTP/1.1 200 OK");
    exit();

}

if($_POST['METHOD']=='POST'){
    unset($_POST['METHOD']);

    $ID_Empleado = $_POST['ID_Empleado'];
    $N_Documento_Empleado = $_POST['N_Documento_Empleado'];
    $ID_Tipo_Documento = $_POST['ID_Tipo_Documento'];
    $Nom_Empleado = $_POST['Nom_Empleado'];
    $Telefono_Empleado = $_POST['Telefono_Empleado'];
    $Email_Empleado = $_POST['Email_Empleado'];
    $Direccion_Empleado = $_POST['Direccion_Empleado'];
    $Nom_Usuario = $_POST['Nom_Usuario'];
    $Password = $_POST['Password'];
   

    $query = "insert into empleado (ID_Empleado, N_Documento_Empleado, ID_Tipo_Documento, Nom_Empleado, 
    Telefono_Empleado, Email_Empleado, Direccion_Empleado, Nom_Usuario, Password) values 
    ('$ID_Empleado', '$N_Documento_Empleado', '$ID_Tipo_Documento', '$Nom_Empleado', '$Telefono_Empleado', 
    '$Email_Empleado', '$Direccion_Empleado', '$Nom_Usuario', '$Password')";

     
    $queryAutoIncrement = "select MAX(ID_Empleado) as ID_Empleado from empleado";
    $result = metodoPost($query, $queryAutoIncrement);
    echo json_encode($result);
    header('HTTP/1.1 200 0K');
    exit();
}

if($_POST['METHOD']=='PUT'){
    unset($_POST['METHOD']);

    $N_Documento_Empleado = $_POST['N_Documento_Empleado'];
    $ID_Tipo_Documento = $_POST['ID_Tipo_Documento'];
    $Nom_Empleado = $_POST['Nom_Empleado'];
    $Telefono_Empleado = $_POST['Telefono_Empleado'];
    $Email_Empleado = $_POST['Email_Empleado'];
    $Direccion_Empleado = $_POST['Direccion_Empleado'];
    $Nom_Usuario = $_POST['Nom_Usuario'];
    $Password = $_POST['Password'];
    $ID_Empleado = $_POST['ID_Empleado'];

    $query="update empleado set N_Documento_Empleado='$N_Documento_Empleado', ID_Tipo_Documento='$ID_Tipo_Documento', Nom_Empleado='$Nom_Empleado', Telefono_Empleado='$Telefono_Empleado', Email_Empleado='$Email_Empleado', Direccion_Empleado='$Direccion_Empleado', Nom_Usuario='$Nom_Usuario', Password='$Password'  where ID_Empleado='$ID_Empleado'";
   
    $result = metodoPut($query);
    echo json_encode($result);
    header('HTTP/1.1 200 0K');
    exit();
}

if ($_POST['METHOD'] =='DELETE') {
    unset($_POST['METHOD']);
    $ID_Empleado = $_GET['ID_Empleado'];
    $query="delete from empleado where ID_Empleado='$ID_Empleado'";
    $result=metodoDelete($query);
    echo json_encode($result);
    header('HTTP/1.1 200 0K');
    exit();
}

?>