<?php
  session_start();
  require_once('conexion.inc');
  if(empty($_FILES['archivo']['name'])) {
   echo "<script language='JavaScript' type='text/javascript'>
   alert('Cargue antes su foto');
   window.location='../mp/subirfoto.php';
   </script>";
 }else {
   $nombre = $_FILES['archivo']['name'];
   $vacio="user.jpg";
   $usu=$_SESSION['usuario'];
   $null="null";
       if ($nombre == "") {
         $ruta=$vacio;
       }else {
         $nombretmp = $_FILES['archivo']['tmp_name'];
         $destino = "../mp/image/" . $nombre;
         if (copy($nombretmp, $destino)){
             $ruta=$nombre;
             $query="UPDATE usuario set ruta='$ruta' where idusuario='$usu'";
             $consulta=mysqli_query(conectar(),$query);
             header("Location: ../mp/subirfoto.php");
         } else{
             $ruta=$vacio;
           }
       }
 }

 ?>
