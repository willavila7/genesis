<?php
include '../enlace/conexion.inc';

$tipoingreso = $_POST['tipoingreso'];
$dniruc = $_POST['txtdniruc'];

$query="SELECT funusutra('$tipoingreso','$dniruc') AS funusutra";
$consulta=mysqli_query(conectar(),$query);
$fila = mysqli_fetch_assoc($consulta);
$dato=$fila["funusutra"];

if($tipoingreso==0){
  echo "<script language='JavaScript' type='text/javascript'>
  alert('Seleccione Tipo de tramitante');
  </script>";
}
else {
  if($dato==1){
    $tipo='Trabajador';
    echo "<script language='JavaScript' type='text/javascript'>
    var dni='$dniruc';
    var tip='$tipo';
    alert('El DNI: '+dni+' del '+tip+' existe');
    </script>";
  }
  if($dato==2){
    $tipo='Trabajador';
    echo "<script language='JavaScript' type='text/javascript'>
    var dni='$dniruc';
    var tip='$tipo';
    alert('El DNI: '+dni+' del '+tip+' no existe');
    window.location.href = 'empleado.php';
    </script>";
  }
  if($dato==3){
    $tipo='Institucion';
    echo "<script language='JavaScript' type='text/javascript'>
    var dni='$dniruc';
    var tip='$tipo';
    alert('El RUC: '+dni+' de la '+tip+' existe');
    </script>";
  }
  if($dato==4){
    $tipo='Institucion';
    echo "<script language='JavaScript' type='text/javascript'>
    var dni='$dniruc';
    var tip='$tipo';
    alert('El RUC: '+dni+' de la '+tip+' no existe');
    window.location.href = 'institucion.php';
    </script>";
  }
  if($dato==5){
    $tipo='Persona';
    echo "<script language='JavaScript' type='text/javascript'>
    var dni='$dniruc';
    var tip='$tipo';
    alert('El DNI: '+dni+' del '+tip+' existe');
    </script>";
  }
  if($dato==6){
    $tipo='Persona';
    echo "<script language='JavaScript' type='text/javascript'>
    var dni='$dniruc';
    var tip='$tipo';
    alert('El DNI: '+dni+' del '+tip+' no existe');
    window.location.href = 'persona.php';
    </script>";
  }

}

?>
