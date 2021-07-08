<?php
  session_start();
  require_once('conexion.inc');
  $idpersona=$_SESSION['idpersona'];
  $dni= $_POST['txtdni'];
  $ruc= $_POST['txtruc'];
  $apellidos= strtoupper($_POST['txtapellidos']);
  $nombres= strtoupper($_POST['txtnombres']);
  $genero= $_POST['rbtgenero'];
  $fechnac= $_POST['txtfechnac'];
  $direccion= strtoupper($_POST['txtdireccion']);
  $celular= $_POST['txtcelular'];
  $telefono= $_POST['txttelefono'];
  $correo1= strtoupper($_POST['txtcorreo1']);
  $correo2= strtoupper($_POST['txtcorreo2']);
  $iddistrito= $_POST['distritos'];

  if($ruc==""){$ruc="";}
  if($fechnac==""){$fechnac="";}
  if($direccion==""){$direccion="";}
  if($telefono==""){$telefono="";}
  if($correo1==""){$correo1="";}
  if($correo2==""){$correo2="";}

  if (is_null($iddistrito)) {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Aun no se ha seleccionado la procedencia');
    </script>";
  }
  else {
    if (is_null($genero)) {
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Seleccione el genero del tramitante');
      </script>";
    }else {
      $query="UPDATE persona set dni='$dni',ruc='$ruc',apellidos='$apellidos',nombres='$nombres',fechnac='$fechnac',genero='$genero',direccion='$direccion',
      telefono1='$celular',telefono2='$telefono',correo1='$correo1',correo2='$correo2',idlocal=$iddistrito where idpersona='$idpersona'";
      $resultado=mysqli_query(conectar(),$query);

     if($resultado){
       header("Location: ../mp/persona.php");
       echo "Persona registrada";
      }else{
         echo "<script language='JavaScript' type='text/javascript'>
         alert('Faltan datos, usuario no registrado');
         </script>";
        }
    }
}
 ?>
