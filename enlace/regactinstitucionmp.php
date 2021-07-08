<?php
  session_start();
  require_once('conexion.inc');
  $idinstitucion=$_SESSION['idinstitucion'];
  $razonsocial= strtoupper($_POST['txtrazonsocial']);
  $ruc= $_POST['txtruc'];
  $correo= strtoupper($_POST['txtcorreo']);
  $direccion= strtoupper($_POST['txtdireccion']);
  $telefono= $_POST['txttelefono'];
  $iddistrito= $_POST['distritos'];
  $tipinst= $_POST['tipoinstitucion'];
  $dni=$_POST['txttramite'];

  $query="SELECT idpersona FROM persona WHERE dni='$dni'";
  $resultado=mysqli_query(conectar(),$query);
  $fila=mysqli_fetch_assoc($resultado);

  $idpersona=$fila['idpersona'];

  $query1="UPDATE institucion set ruc='$ruc',razonsocial='$razonsocial',correo='$correo',direccion='$direccion',telefono='$telefono',
  idpersona='$idpersona',idtipoinstitucion='$tipinst',idlocal=$iddistrito where idinstitucion='$idinstitucion';";
  $resultado1=mysqli_query(conectar(),$query1);

  if($resultado1){
    header("Location: ../mp/institucion.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, institucion no registrado');
      </script>";
    }

 ?>
