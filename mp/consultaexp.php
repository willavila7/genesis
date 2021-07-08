<?php
session_start();
require_once('../enlace/conexion.inc');

$expediente = $_POST['txtexpediente'];
$usuario=$_SESSION['usuario'];

$consulta=mysqli_query(conectar(),"select ar.idarea from area ar, trabajador tb,usuario us
where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and us.idusuario='$usuario';");
$fila=mysqli_fetch_assoc($consulta);
$idarea=$fila['idarea'];

$select=mysqli_query(conectar(),"select expediente from expediente where idarea='$idarea' and expediente='$expediente';");
$fila1=mysqli_fetch_row($select);

if ($fila1>0) {
  echo "<script language='JavaScript' type='text/javascript'>
  var exp='$expediente';
  alert('El expediente Nro: '+exp+' ya fue asignado');
  </script>";
} else {
  echo "<script language='JavaScript' type='text/javascript'>
  var exp='$expediente';
  alert('El expediente Nro: '+exp+' aun no ha sido asignado');
  </script>";
}
 ?>
