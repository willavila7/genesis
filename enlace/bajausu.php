<?php
  session_start();
  require_once('conexion.inc');
  $idtrabajador=$_REQUEST['id'];

  $query="select estado from trabajador where idtrabajador='$idtrabajador';";
  $consulta=mysqli_query(conectar(),$query);
  $resultado=mysqli_fetch_assoc($consulta);
  $estado=$resultado['estado'];
  if ($estado=='1') {
    $query1="update trabajador set estado='0' where idtrabajador='$idtrabajador';";
    $resultado1=mysqli_query(conectar(),$query1);
  }
  if ($estado=='0') {
    $query1="update trabajador set estado='1' where idtrabajador='$idtrabajador';";
    $resultado1=mysqli_query(conectar(),$query1);
  }

 if($resultado1){
     header("Location: ../admin/buscarusuario.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('ERROR !!!');
       </script>";
     }
 ?>
