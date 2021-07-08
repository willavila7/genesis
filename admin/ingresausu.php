<?php
session_destroy();
session_start();
require_once ('../enlace/conexion.inc');

if(isset($_REQUEST['id'])){

$idtb=$_REQUEST['id'];

$consulta=mysqli_query(conectar(),"select us.idusuario from trabajador tb, usuario us 
  where us.idtrabajador=tb.idtrabajador and tb.idtrabajador=$idtb;");
$resultado=mysqli_fetch_assoc($consulta);
$usuario=$resultado['idusuario'];

$query = "SELECT us.idusuario,us.clave,us.idtipousuario,tb.estado from usuario us, trabajador tb
where us.idtrabajador=tb.idtrabajador and us.idusuario='$usuario'";
$resultado = mysqli_query(conectar(), $query);
$filan = mysqli_num_rows($resultado);

if($filan>0){
  $filac = $resultado=mysqli_fetch_assoc($resultado);
  $_SESSION['usuario']=$filac["idusuario"];
  $_SESSION['tipousuario']=$filac["idtipousuario"];
  if (isset($_SESSION['usuario'])){
    switch ($_SESSION['tipousuario']){
      case '1' : header("Location: ../admin/index.php");
                 break;
      case '2' : header("Location: ../mp/index.php");
                 break;
      case '3' : header("Location: ../mp/index.php");
                 break;
      case '4' : header("Location: ../mp/index.php");
                 break;
      }
    }
  }
  else {
    echo "<script>alert('no hay acceso')</script>";
  }
}

?>
