<?php
session_start();
require_once('../enlace/conexion.inc');
if (isset($_REQUEST['idar'])) {
  $idarea=$_REQUEST['idar'];
  $query="DELETE area from area where idarea='$idarea';";
  $consulta=mysqli_query(conectar(),$query);

  if($consulta){
    header("Location: ../admin/areacargo.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Fatal error');
      </script>";
    }
}
if (isset($_REQUEST['idcr'])) {
  $idcargo=$_REQUEST['idcr'];
  $query="DELETE cargo from cargo where idcargo='$idcargo';";
  $consulta=mysqli_query(conectar(),$query);
  if($consulta){
    header("Location: ../admin/areacargo.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Fatal error');
      </script>";
    }
}
if (isset($_REQUEST['idan'])) {
  $idanio=$_REQUEST['idan'];
  $query="DELETE anio from anio where idanio='$idanio';";
  $resultado=mysqli_query(conectar(),$query);
   if($resultado){
     header("Location: ../admin/tabla.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos, usuario no registrado');
       </script>";
     }
}
if (isset($_REQUEST['idpd'])) {
  $idprioridad=$_REQUEST['idpd'];
  $query="DELETE prioridad from prioridad where idprioridad='$idprioridad';";
  $resultado=mysqli_query(conectar(),$query);
  if($resultado){
     header("Location: ../admin/tabla.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos, usuario no registrado');
       </script>";
     }
}
if (isset($_REQUEST['idpv'])) {
  $idproveido=$_REQUEST['idpv'];
  $query="DELETE proveido from proveido where idproveido='$idproveido';";
  $resultado=mysqli_query(conectar(),$query);
  if($resultado){
     header("Location: ../admin/tabla.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos, usuario no registrado');
       </script>";
    }
}
if (isset($_REQUEST['idpr'])) {
  $idpersona=$_REQUEST['idpr'];
  $query="DELETE persona from persona where idpersona='$idpersona';";
  $resultado=mysqli_query(conectar(),$query);
  if($resultado){
    header("Location: ../admin/persona.php");
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Faltan datos, usuario no registrado');
      </script>";
    }
}
if (isset($_REQUEST['idit'])) {
  $idinstitucion=$_REQUEST['idit'];
  $query="DELETE institucion from institucion where idinstitucion='$idinstitucion';";
  $resultado=mysqli_query(conectar(),$query);
  if($resultado){
  header("Location: ../admin/institucion.php");
  echo "listo";
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Faltan datos, usuario no registrado');
    </script>";
  }
}
if (isset($_REQUEST['idtb'])) {
$idtrabajador=$_REQUEST['idtb'];
$query="update trabajador set estado='0' where idtrabajador='$idtrabajador';";
$consulta=mysqli_query(conectar(),$query);
if($consulta){
  header("Location: ../admin/empleado.php");
  }else{
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Fatal error');
    </script>";
  }
}
?>
