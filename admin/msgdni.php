<?php
include '../enlace/conexion.inc';

$dni = $_POST['valor'];
$consulta="SELECT idpersona FROM persona WHERE dni='$dni';";
$resultado=mysqli_query(conectar(),$consulta);
$fila=mysqli_fetch_row($resultado);

if ($fila>0) {

  echo "<script language='JavaScript' type='text/javascript'>
  var dni='$dni'
  alert('El DNI Nro '+$dni+' Existe');
  </script>";

} else {

  echo "<script language='JavaScript' type='text/javascript'>
  var dni='$dni'
  alert('El DNI Nro. '+dni+' no existe registre al usuario');
  window.location.href = 'persona.php';
  </script>";

}

 ?>
