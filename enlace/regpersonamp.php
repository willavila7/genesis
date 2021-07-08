<?php
  session_start();
  require_once('conexion.inc');

  $dni= $_POST['txtdni'];
  $apellidos= $_POST['txtapellidos'];
  $nombres= $_POST['txtnombres'];
  $genero= $_POST['rbtgenero'];
  $null="null";

  $query="insert into persona(dni,apellidos,nombres,genero,intext,idlocal) 
  values('$dni','$apellidos','$nombres','$genero',0,85);";
  $resultado=mysqli_query(conectar(),$query);

  if($resultado){
    header("Location: ../mp/ingresodoc.php");
    $_SESSION['ddrr']=$dni;
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('ERROR DE REGISTRO');
    window.location='../mp/persona.php';
    </script>";
  }

 ?>
