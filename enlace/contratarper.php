<?php
  session_start();
  require_once('conexion.inc');
  $idtrabajador=$_SESSION['idtb'];

  $area=$_POST['area'];
  $cargo=$_POST['cargo'];
  $modalidad=$_POST['modalidad'];
  $resp=$_POST['rbtres'];
  $fecha=$_POST['txtfecha'];
  $resing=$_POST['txtresing'];

  $update1="update trabajador set idarea='$area', idcargo='$cargo', modalidad='$modalidad', resingreso='$resing',
  fechingreso='$fecha', responsable='$resp', estado='1' where idtrabajador='$idtrabajador';";
  $refresh=mysqli_query(conectar(),$update1);

  $query=mysqli_query(conectar(),"select tb.idpersona from trabajador tb where tb.idtrabajador='$idtrabajador';");
  $consulta=mysqli_fetch_assoc($query);
  $idpersona=$consulta['idpersona'];

  $update2="update persona set intext='1' where idpersona='$idpersona';";
  $refresh2=mysqli_query(conectar(),$update2);

  $delete="delete from usuario where idtrabajador='$idtrabajador';";
  $elimina=mysqli_query(conectar(),$delete);

 if($elimina){
  echo "<script language='JavaScript' type='text/javascript'>
  window.location='../admin/editempleado.php';
   </script>";
    }else{
      echo "<script language='JavaScript' type='text/javascript'>
      alert('ERROR !!!');
      </script>";
    }
 ?>
