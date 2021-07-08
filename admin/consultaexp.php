<?php
include '../enlace/conexion.inc';

$expediente = $_POST['txtexpediente'];
$usuario = $_SESSION['usuario'];

$query1="SELECT ar.idarea from area ar,trabajador tb,usuario us where us.idtrabajador=tb.idtrabajador and tb.idarea=ar.idarea and  us.idusuario='$usuario';";
$consulta1=mysqli_query(conectar(),$query1);
$resultado1=mysqli_fetch_assoc($consulta1);
$idarea=$resultado1['idarea'];

$query="SELECT idexpediente FROM expediente WHERE expediente='$expediente' and idarea='$idarea'";
$consulta=mysqli_query(conectar(),$query);
$fila = mysqli_fetch_assoc($consulta);
$dato=$fila["idexpediente"];

if ($dato) {
  echo "<script language='JavaScript' type='text/javascript'>
  var exp='$dato';
  alert('El expediente Nro: '+exp+' ya fue asignado');
  </script>";
} else {
  echo "<script language='JavaScript' type='text/javascript'>
  var exp='$expediente';
  alert('El expediente Nro: '+exp+' aun no ha sido asignado');
  </script>";
}


 ?>
