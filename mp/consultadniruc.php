<?php
session_start();
include '../enlace/conexion.inc';

$tipoingreso = $_POST['tipoingreso'];
$dniruc = $_POST['txtdniruc'];
$_SESSION['dniruc']=$dniruc;
if($tipoingreso==0){
  echo "<script language='JavaScript' type='text/javascript'>
  alert('Seleccione el Tipo de tramitante');
  </script>";
}
else {
  if (trim(strlen($dniruc))==11 || trim(strlen($dniruc))==8) {
    if ($tipoingreso==1) {
      if (trim(strlen($dniruc))==8) {
        $consulta=mysqli_query(conectar(),"SELECT dni, concat(apellidos,nombres) as nombres from persona where dni='$dniruc' and intext='0' limit 1;");
        $fila = mysqli_fetch_assoc($consulta);
        $dato=$fila["dni"];
        $nombres=$fila['nombres'];

        if (isset($dato)) {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dniruc';
          var nmb='$nombres';
          alert('El DNI '+dni+' pertenece a '+nmb);
          </script>";
        }else {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dniruc';
          alert('No hay registro alguno del tramitante con este DNI '+dni+' pase a registrarlo');
          window.location.href = 'persona.php';
          </script>";
        }
      }
      if (trim(strlen($dniruc))==11) {
        $consulta=mysqli_query(conectar(),"SELECT ruc,razonsocial from institucion where ruc='$dniruc' limit 1;");
        $fila = mysqli_fetch_assoc($consulta);
        $dato=$fila["ruc"];
        $nombres=$fila["razonsocial"];

        if (isset($dato)) {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dato';
          var nmb='$nombres';
          alert('El RUC '+dni+' pertenece a '+nmb);
          </script>";
        }else {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dniruc';
          alert('No hay registro alguno de la institucion con este RUC '+dni+' pase a registrarlo');
          window.location.href = 'institucion.php';
          </script>";
        }
      }
    }
    if ($tipoingreso==2) {
      if (trim(strlen($dniruc))==8) {
        $consulta=mysqli_query(conectar(),"SELECT dni, concat(apellidos,nombres) as nombres from persona where dni='$dniruc' and intext='1' limit 1;");
        $fila = mysqli_fetch_assoc($consulta);
        $dato=$fila["dni"];
        $nombres=$fila["nombres"];

        if (isset($dato)) {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dato';
          var nmb='$nombres';
          alert('El DNI '+dni+' pertenece a '+nmb);
          </script>";
        }else {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dniruc';
          alert('No hay registro alguno del empleado con este DNI '+dni+', comuniquese con el area encargada de su registro');
          </script>";
        }
      }if (trim(strlen($dniruc))==11) {
        $consulta=mysqli_query(conectar(),"SELECT ruc, concat(apellidos,nombres) as nombres from persona where ruc='$dniruc' and intext='1';");
        $fila = mysqli_fetch_assoc($consulta);
        $dato=$fila["ruc"];
        $nombres=$fila["nombres"];

        if (isset($dato)) {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dato';
          var nmb='$nombres';
          alert('El RUC '+dni+' pertenece a '+nmb);
          </script>";
        }else {
          echo "<script language='JavaScript' type='text/javascript'>
          var dni='$dniruc';
          alert('No hay registro alguno del empleado con este RUC '+dni+', comuniquese con el area encargada de su registro');
          </script>";
        }
      }
    }

  }else {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('El DNI / Ruc no contiene la cantidad de digitos necesarios');
    </script>";
  }

}

?>
