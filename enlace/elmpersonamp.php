<?php
  session_start();
  require_once('conexion.inc');
  $idpersona=$_REQUEST['id'];

    $query="DELETE persona from persona where idpersona='$idpersona';";
    $resultado=mysqli_query(conectar(),$query);

   if($resultado){
     header("Location: ../mp/persona.php");
     echo "Usuario Eliminado";
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos, usuario no registrado');
       </script>";
     }
 ?>
