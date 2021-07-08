<?php
include '../enlace/conexion.inc';

$dni = $_POST['txtdni'];

$query="SELECT tb.idtrabajador,pr.dni from trabajador tb, persona pr where tb.idpersona=pr.idpersona and pr.dni='$dni' limit 1;";
$consulta=mysqli_query(conectar(),$query);
$fila = mysqli_fetch_assoc($consulta);
$dato=$fila["dni"];
$idtrabajador=$fila["idtrabajador"];

if($dato != ""){
  $query1="SELECT count(*) as cantidad from usuario us, trabajador tb where us.idtrabajador=tb.idtrabajador and tb.idtrabajador='$idtrabajador';";
  $consulta1=mysqli_query(conectar(),$query1);
  $fila1 = mysqli_fetch_assoc($consulta1);
  $cantidad = $fila1['cantidad'];

  if($cantidad>0){
    echo "<script language='JavaScript' type='text/javascript'>
    var cant='$cantidad';
    alert('el trabajador ya tiene '+cant+' usuario(s) asignado(s)');
    </script>";
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('El trabajador aun no tiene un usuario asignado');
    </script>";
  }
}
else {
  echo "<script language='JavaScript' type='text/javascript'>
  alert('El trabajador aun no se encuentra en el sistema');
  </script>";
}
?>
