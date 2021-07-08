<?php
  session_start();
  require_once('conexion.inc');

  $usuario=$_SESSION['usuario'];
  
  $expediente=$_POST['txtexpediente'];
  $idexpediente=$_SESSION['idex'];
  $vnt=$_SESSION['emitir'];
  $documento= $_POST['txtdocumento'];
  $asunto= $_POST['txtasunto'];
  $folios= $_POST['txtfolios'];
  $observacion= $_POST['txtobservacion'];

  $query="UPDATE expediente set expediente='$expediente' where idexpediente='$idexpediente';";
  $resultado=mysqli_query(conectar(),$query);

  $query1="UPDATE documento set documento='$documento', asunto='$asunto', folios='$folios', observacion='$observacion'
  where idexpediente='$idexpediente';";
  $resultado1=mysqli_query(conectar(),$query1);

  if($resultado){
    if ($vnt==2) { header("Location: ../mp/ingresodoc.php"); }
    if ($vnt==3) { header("Location: ../mp/emitirdoc.php"); }
    if ($vnt==4) { header("Location: ../mp/ingresodesc.php"); }

    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('Faltan datos');
         window.location='../mp/actingresodoc.php';
       </script>";
     }

 ?>
