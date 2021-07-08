<?php
  session_start();
  require_once('conexion.inc');
  $idinstitucion=$_REQUEST['id'];

    $query="DELETE institucion from institucion where idinstitucion='$idinstitucion';";
    $resultado=mysqli_query(conectar(),$query);

   if($resultado){
     header("Location: ../mp/institucion.php");
     echo "listo";
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos, usuario no registrado');
       </script>";
     }
 ?>
