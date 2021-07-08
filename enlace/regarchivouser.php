<?php
  require_once('conexion.inc');

  $asunto= strtoupper($_POST['txtarchivar']);
  $expediente= $_POST['expediente'];

    for ($i=0;$i<count($expediente);$i++){

      $query="INSERT INTO archivo(estadoexp,idexpediente)  VALUES('$asunto',$expediente[$i]);";
      $resultado=mysqli_query(conectar(),$query);

      $query1="UPDATE expediente set idestadoexp='3' where idexpediente='$expediente[$i]';";
      $resultado1=mysqli_query(conectar(),$query1);
    }

   if($resultado1){
     header("Location: ../user/archivardoc.php");
    }else{
       echo "<script language='JavaScript' type='text/javascript'>
       alert('No se archivo');
       </script>";
     }

 ?>
