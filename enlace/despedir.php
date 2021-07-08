<?php
session_start();
require_once('conexion.inc');

$idtrabajador=$_REQUEST['id'];

$select="select tb.idpersona from trabajador tb where tb.idtrabajador='$idtrabajador';";
$consulta=mysqli_query(conectar(),$select);
$resultado=mysqli_fetch_assoc($consulta);
$idper=$resultado['idpersona'];

$select1="update persona set intext='0' where idpersona='$idper';";
$consulta1=mysqli_query(conectar(),$select1);

$delete1="update trabajador set estado='0' where idtrabajador='$idtrabajador';";
$drop1=mysqli_query(conectar(),$delete1);

if($delete1){
  header("Location: ../admin/editempleado.php");
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('ERROR AL DESPEDIR !!!');
    </script>";
  }
?>
