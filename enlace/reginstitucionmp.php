<?php
  require_once('conexion.inc');

  $razonsocial= strtoupper($_POST['txtrazonsocial']);
  $ruc= $_POST['txtruc'];
  $correo= strtoupper($_POST['txtcorreo']);
  $direccion= strtoupper($_POST['txtdireccion']);
  $telefono= $_POST['txttelefono'];
  #$iddistrito= $_POST['distritos'];
  $tipinst= $_POST['tipoinstitucion'];
  $dni=$_POST['txttramite'];

  if ($correo=='') {    $correo=='';  }
  if ($telefono=='') {    $telefono=='';  }
  if ($direccion=='') {    $direccion=='';  }

  if (trim(strlen($ruc))==11) {
    if (isset($_POST['distritos'])) {
      if ($tipinst==0) {
        echo "<script language='JavaScript' type='text/javascript'>
        alert('Seleccione el tipo de institucion');
        window.location='../mp/institucion.php';
        </script>";
      }else {
        if (trim(strlen($dni))==8) {

          $resultado=mysqli_query(conectar(),"SELECT idpersona FROM persona WHERE dni='$dni' and intext='0';");
          $fila=mysqli_fetch_assoc($resultado);
          $idpersona=$fila['idpersona'];

          if ($idpersona=='') {
            echo "<script language='JavaScript' type='text/javascript'>
            alert('El DNI del tramitante aun no ha sido registrado');
            window.location='../mp/persona.php';
            </script>";
          }else {
            $insert=mysqli_query(conectar(),"INSERT INTO institucion(ruc,razonsocial,correo,direccion,telefono,idpersona,idtipoinstitucion,idlocal)
            VALUES('$ruc','$razonsocial','$correo','$direccion','$telefono','$idpersona','$tipinst','$iddistrito')");

            if($insert){
              header("Location: ../mp/institucion.php");
              }else{
                echo "<script language='JavaScript' type='text/javascript'>
                alert('Faltan datos, usuario no registrado');
                window.location='../mp/institucion.php';
                </script>";
              }
          }
        }else {
          echo "<script language='JavaScript' type='text/javascript'>
          alert('El DNI necesita tener 8 digitos');
          window.location='../mp/institucion.php';
          </script>";
        }
      }
    }else {
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Seleccione un distrito de procedencia para la institucion');
      window.location='../mp/institucion.php';
      </script>";
    }
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('El ruc necesita tener 11 digitos');
    window.location='../mp/institucion.php';
    </script>";
  }



 ?>
