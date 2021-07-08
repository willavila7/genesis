<?php
  session_start();
  require_once('conexion.inc');

  $usuario=$_SESSION['usuario'];
  $antigua= sha1(md5($_POST['txtantigua']));
  $nueva= sha1(md5($_POST['txtnueva']));
  $repita= sha1(md5($_POST['txtrepita']));

  $query="select clave from usuario where clave='$antigua' and idusuario='$usuario';";
  $resultado=mysqli_query(conectar(),$query);
  $fila=mysqli_fetch_assoc($resultado);
  $clave=$fila['clave'];

  if($antigua==$clave){
    if ($nueva==$repita) {
      $query1="UPDATE usuario set clave='$repita' where idusuario='$usuario';";
      $resultado1=mysqli_query(conectar(),$query1);
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Contraseña actualizada');
      window.location='../mp/cambio.php';
      </script>";
    } else {
      echo "<script language='JavaScript' type='text/javascript'>
      alert('Las nuevas contraseñas no coincide, verifique sus datos');
      window.location='../mp/cambio.php';
      </script>";
    }

  }else {
    echo "<script language='JavaScript' type='text/javascript'>
    alert('Su contraseña antigua es incorrecta');
    window.location='../mp/cambio.php';
    </script>";
  }

 ?>
